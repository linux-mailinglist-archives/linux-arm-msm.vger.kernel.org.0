Return-Path: <linux-arm-msm+bounces-82254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 181F2C68DA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 884954EF529
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0025034A3A2;
	Tue, 18 Nov 2025 10:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NyTfH/mX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XmMbQ+Tk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650602F2610
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763461921; cv=none; b=hPrvg9OgGBrsCfKEKYsX65j9BBLo1K6yWiBUfwswEzpdx6fYtM1tXaN7EpG8DHVN5/zTK7hT7vkdDOsuC9tPwy/nspKehiA+fMyNeL7zpD4CKLilRFUSSji99SudDbHSrEaZ3z3S/FgXlVtYr8KxFAAPrutgojqwHBRYqiHNmHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763461921; c=relaxed/simple;
	bh=RfZm9aKl1NjMxKyOCQg+4SEjvwVpRMYv2mrcH4ZNFDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8j2cBQBO9WpaPY/+Vo4003OlZsOQvUPkFCTExSRpxhMBGha/MZXanvyVkIcXBsAiWkT4KHVcmAD+k2gGdxbGDSA7r9ty+SZSN6+dJuWQq/ZaJBe5w4a923FFQcJ97nI6Fp1BdXjusWHxUkQphryRIuFEUS5FmLebqGKeRPCmSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NyTfH/mX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XmMbQ+Tk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6fORT2272034
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fR7x0kFz0S+JBP4vbyeBal4hny3WSPiyeEcYELp4NhM=; b=NyTfH/mXnnzRlUpW
	/8EaVfq2RmAGxcf9s0qkoKmjM6ILtC60bPNjradasrc4K2wfRHi5qi2GKC8FUUv7
	nxpXN8WyX2NY0u8SVyIGebNFg2QFtEFdpdittsjjDl0KH85hn76n49TRtHCeThis
	ZO6a56ekneI+J28CyLnqX80coK98h4s2I+gNuDOlquGI5W5QtCJOqr4/ri/5w1ng
	YHmBobxjgx0FtJDPz4tp8TYHbf1uJq009wk32chcO89l4OYzgY7awOunVORoYh5H
	h8sClrJCNqb758q3VmtDc+HNw0ZuhQjp+L0feY83ualA16aDYZQkIaog8DqoMV8k
	LxnTcQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrmgpef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:31:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b62da7602a0so3904286a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 02:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763461918; x=1764066718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fR7x0kFz0S+JBP4vbyeBal4hny3WSPiyeEcYELp4NhM=;
        b=XmMbQ+TkdjSg7ftZ3xxejMO+y46e4/wLokz2PQnRONy+DJeMP3RpTgYj2fNanZNK3u
         T7UJeRZaQD6C9WLwiRSyTQZNEsfMpFZ7f7O05TUnDqB4r8aD9I4kf79I6flLk6HKi6Sm
         lfVjXqTWVtkrMDrWCv78FSOHW/7OGGQAKE1xfmX3Mbo2iEPuYCpbTibiSGI2QVRfGt7s
         zm0HWbiyJI5zsZOANtb0MEWMmxLMOpQYxF5i2+xDpH2nWsxY3qpR+q134PF5SpGCRhdv
         Apcv44flWniIYsv56okaM6PYuxyPuWVpGsq/mP9dpT00YrzrX2Gt/0LsBUYBxMFSQbtI
         Wm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763461918; x=1764066718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fR7x0kFz0S+JBP4vbyeBal4hny3WSPiyeEcYELp4NhM=;
        b=gQEi2zfrtFRMF3lnb0QR+W8db++KPE6I6+FtF+aI7tPpEWhTQAdxbYCO3VFtFNNWnF
         fg2/U3GW/VImrt+Q69S35B3/zpYIdkFOAU8N3qxmKnW61KvmxLWLrlwBlcPhE/s9ZBf2
         2vLKHw9seyVEAy910C0D3qxUDF7q2IhQounMpu0QImcexH4t5x1av/QZNg1rJY3xExfe
         sQQiewaNv/TW32rbYLdxUXNoJ/QU1PxGPOF+axUxF/3KwdSygHwdg/lHj+eCNC1S9yUt
         zU9pRvtz2soumHWf/UPCr9Y9ll7f9rpOD0bvJtb0fOVgG7iZRdz8q3425hsKa+DXLfCC
         kt0w==
X-Gm-Message-State: AOJu0Ywem7lRNYNtZj/UT/+lsIriOFptkgomAMbs7jTOOVhoWUrNKtKz
	TPB34wFQwFJw3MnI1aFpCdtBVtXbKJE9t7r2Ps4bAFvQ+Kfmn/jHQNssNbqPyRJ/7V3bZUnh6yM
	BJyFOqirofcXMaA6NDg6BKWLQfmqJHyKbLIpSLDZ+Styt7NfxJx5DIDUeh+ZNfxGU9EYR
X-Gm-Gg: ASbGncthWHKUIyvbpPEm7OYQI+5+UgRol7H0qbmDWo0ZE7YlrJCdo0+Ew8r3qJcCmnP
	WAYBnzpgJ9kQewPg3IhViIUE1SaGe1DfFfFIZ6ZTkuu2JRC/yqSNdwRfmCKRyd4au85EkqcjV6u
	BoT6Xwk+0znrb8G7j3ZgRXyFS/SqOMp0SNKYFf2Ut5Nu7WShbLBKT5o/2PX0tAeKuLQbT36JpMe
	ixh9/R86TsVtD9I36zu4NgR1rgp3gdtmSwRlCuwTPSDkIoXuZK0WTrUhHkL8orcupCDwsYRuMzw
	Trv647U8xU5R1RNexBlLav+5r382pPQGH/pEHv7Q+9+kPjIEOOd6PS0RBvGPCI7xYQBz0u2tX6Q
	XE34KGPIT1+MUMxissXrClVxGKQ==
X-Received: by 2002:a17:902:d4cd:b0:299:dd98:fac2 with SMTP id d9443c01a7336-299dd98fe08mr99139275ad.54.1763461918314;
        Tue, 18 Nov 2025 02:31:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzq8B2MXbl1pPxPLemh3fklf2/A5DSGVm1kKDAvo8dNVVqRFeNS/BF0AI+yuhX93bBja4Saw==
X-Received: by 2002:a17:902:d4cd:b0:299:dd98:fac2 with SMTP id d9443c01a7336-299dd98fe08mr99138905ad.54.1763461917819;
        Tue, 18 Nov 2025 02:31:57 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d91sm170294015ad.63.2025.11.18.02.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 02:31:57 -0800 (PST)
Message-ID: <6fe09872-368a-4bab-96c3-c34492255599@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:01:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] clk: qcom: branch: Extend invert logic for branch2
 mem clocks
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
 <20251118-sm8750-videocc-v2-v4-3-049882a70c9f@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-3-049882a70c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4MyBTYWx0ZWRfX3pEsvKZLe4DY
 RfoWckvBObRZVzKq/snoJHwNZzjNa7mbug0pkAueDs2NcbMenlX9/8fVqvS2/qwbmK6p1OkzTsC
 QHFWPIj3K0AY+iLYZ4yFwqJUctQdZv51oiX8qgrKUgXPV/7PH6j0nrvemxBi69ZTFjdhCW3DiyO
 Ttf4evKpLDaap5zXJ7WnfYr890Fnfr74DQB8kjA40bC466Ei2aQh1mMhkYdwCYjGbkJid8Tpm9U
 M0MEBcRG5QFuviUt5WGvCQbW4EO7kVgqVjwkBErlX4XVDG7XIP45rp8YmdxnxpU5msauOern4M/
 jSK+5tvhLgMbxY+VU8tb0NshN0Xh4VqfNI2tYiwGdTX6A1v6pInArbtcjB7elPJid34LKc8P69o
 BhU6fFpChoEPgSo9SWa/KZJu9dF7ow==
X-Proofpoint-ORIG-GUID: _ZZUkLQyEf4Cp-ZkCUso1Z06xCFw8ODm
X-Proofpoint-GUID: _ZZUkLQyEf4Cp-ZkCUso1Z06xCFw8ODm
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=691c4b1f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8EbF_sMYILjvT3iq7EYA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180083



On 11/18/2025 12:47 PM, Taniya Das wrote:
> Some clock branches require inverted logic for memory gating, where
> disabling the memory involves setting a bit and enabling it involves
> clearing the same bit. This behavior differs from the standard approach
> memory branch clocks ops where enabling typically sets the bit.
> 
> The mem_enable_invert to allow conditional handling of these sequences
> of the inverted control logic for memory operations required on those
> memory clock branches.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-branch.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

