Return-Path: <linux-arm-msm+bounces-82355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EE809C6A3D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 16:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9544B4F5B4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0785A328619;
	Tue, 18 Nov 2025 15:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvYxmp4d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gc9uC5zD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B945354AF2
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763478181; cv=none; b=AnggG3lOgQ0cWi/UB1kyW6LWZ+KigMPO4xYRAiDG65Ced8uK9O+HbseegDK7ZhvJUGrUJCUSH4vpJMBlcz8AzRVQ7e2Rcy4BZSn7y1rNIvO2HqQf/x43lpDaWLB+f6zu0cgLtfC2oV80o3x20deZzj+0TEij5ItPTo04iXw+jqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763478181; c=relaxed/simple;
	bh=v5nImH+xK+9SL4E4MH8KbpIvlaO5c50Qq/PRIW/0KbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOGaIA19F4bgFxOasxnm7BqfvPmMLrUt5ig9Av6Mq3L7M+X679uthTvQvHjWpM/SE+1mYpuFBAo4nLHtL6QLGsiQdmLsTXDutDocPZTxhO0nVr/bvAWXKteXI8jKyzxHttpryB0fmF21YkBrLmimq9rXQFzlDjyf4L/azAbkK0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvYxmp4d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gc9uC5zD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIDvSbA384611
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jkUfsqF7fHbwcY/CG3Vr07bqMbj6EV4hLs+8T8s4P6Q=; b=SvYxmp4dxkjF1Eq/
	M3+NBGJmb5ZH+L6kYsnni7vTyXPFJHokizXleotd1nNPyGfVoW/MAviP2fcsE1Sg
	IWfcBn3wVV7NOcbr0POp5fp9PF2wm5ygjgdK9CzhfRqc5pUSSpDZG6Sj5FEW9dYO
	/rrG7hDfCo9v37LXBkUmJjf51fhtXIztw9KR/AhG3IRpakBERVCbwN5OttmX+VlS
	ER69w6+0bgtmCrP8sqnCKoZb0WQwpLHLj+p7k1y1dzbACIQeVecRNN8gi/snm08M
	5RrGq7NFBxXZi1SiWvC2xjK5q7FZTdmeC8OUZmkA/8pqjKgFN6Rm3/F1uhUHXO4n
	s2vdtQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8jufm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:02:59 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7c6d60fa3d6so1509821a34.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763478179; x=1764082979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jkUfsqF7fHbwcY/CG3Vr07bqMbj6EV4hLs+8T8s4P6Q=;
        b=gc9uC5zDkpQiAqmw1G9NOCyVNbUN/APM5THkn6L8kcgN2ZYXQf113gXGwcxS/R8a2J
         S+eKTmy+w+LbRXBaBdsb3u519tfO5qxUkhleSaU14+h3LdIrY6zKHwluAIXIaHgmAi2G
         hHMTsMWbitbGKeOXWAplIYhT2Ae8WGK9ZV96kTrwd9KMG/BzBPtFPH+8CuS5L803Ad7T
         fPSbNR0KC5pv5nj305KRc8WcrFSEpA8pIbyQdC5WWmfviIBaJjOXi49Kovln8AhcZiDi
         96jwz49x7PKPAD89079eVrZ1l1kqiS+i+QloCjK9PPwU0gi7F3DCMeQXHAy7uTM2WJmE
         0NUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478179; x=1764082979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkUfsqF7fHbwcY/CG3Vr07bqMbj6EV4hLs+8T8s4P6Q=;
        b=ZOTAwpxQKrq1Z3WmAAfDLPCOtfA0nNnqgzFBC732XkBx0AQFY+51D6DEzVQ1fUSWxr
         Ypq86OVnC1DbLtGJllPjPO/tnwQBPWGIvDrVMjtEqHsd9oR/2fjyYUMr0EhWWZGXw5K3
         +VdB2O5qeyDdRps+NHVQa7L5cvVDxnirYGb1UKhQtNTi4WeI2G92459FDVSDJrhNgdzf
         r7Uzctj4LI7YBDa1APARlpDxbCaKLK947jl2riFPCTKb29zG45hSJPBJ3O6hiYJi1jvI
         TaPR7bVaW6i4+O3y9vjaq8XfTF8dcFN7JnpurwmpjrBOn5nYEf8ul9ecO3MoUk2SQtFd
         vIuQ==
X-Gm-Message-State: AOJu0YyawzOXnplhJfKOfqVTRh0tRwE37iMYoBB3Ae5BzJK/E7AmC5CK
	tSDVPnqqNOC/YbWZYn4cAHv9CjzIcxibpk/87+Yg8smRFXx5J0EG0Z8tyVKEx+Ew8hUfKcyR353
	XBXIaZfOEN4jTOAjtLJNBDHOcDEpZbyXegiC0ow0BYXJ0pniLkvfi5klN0w/sCRzGQAuB
X-Gm-Gg: ASbGnctzPd0g+WYKxLEyVE2kuLHUws/Ghm4Vh4cYRQqFcSSLwV2w82xuOP9UK9+8EWE
	lTR/uEAaShNhPn5DKN/5mBWQuM7/w10OCn7GLI56899Qd0wn1B5o+dNOS4eBXFRlO1RBLQp4ti6
	K1t0GOQLaPLLUG4S1VuXLsxHYkCyf0Q8ZhCAuh4gKIAgck82JnZs7u0A9WEmt2AY3Y28l8naiRD
	bHLpNv3Y6BqJ5+L0b81joSQWgy9q1ONZwMTfipLA5tGuPJVKI94qBqszJ01HEHBc8vVjZTDJ61H
	bCpJVcFkriAqpQ6C9CLpDK/VgauDJ3nJbA2fJq9YQOl9nA3iFrN9ExBKxNpi6mG1+Hec5+Pi2CY
	2MG53Bl8hKvcNG0ACr4qEgyUeFtx3uLtPwjLaf+D/8UOMVvKWl84jWovRDhQ4qZXrwpo=
X-Received: by 2002:a05:6808:2006:b0:450:456c:ecac with SMTP id 5614622812f47-45097569238mr4604867b6e.6.1763478178697;
        Tue, 18 Nov 2025 07:02:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTkmjEbG1bOBUmUhskRwPcIJ2t3hyrWgqr88XZ97OQx2rGABdJ9AERVUyZlfj43/laMV+EZw==
X-Received: by 2002:a05:6808:2006:b0:450:456c:ecac with SMTP id 5614622812f47-45097569238mr4604843b6e.6.1763478178062;
        Tue, 18 Nov 2025 07:02:58 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3f961bsm13032422a12.14.2025.11.18.07.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 07:02:56 -0800 (PST)
Message-ID: <c3f9d05a-1811-43cd-ba55-3a1766808185@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:02:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm845-oneplus: Mark l14a
 regulator as boot-on
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251118-dts-oneplus-regulators-v2-0-3e67cea1e4e7@ixit.cz>
 <20251118-dts-oneplus-regulators-v2-3-3e67cea1e4e7@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-dts-oneplus-regulators-v2-3-3e67cea1e4e7@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CJgJ2Xhhy9Ot3f0wKw9f3NhRKN71ebgW
X-Proofpoint-ORIG-GUID: CJgJ2Xhhy9Ot3f0wKw9f3NhRKN71ebgW
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691c8aa3 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=BiXyI_okxTJ3JasmUDMA:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEyMSBTYWx0ZWRfXx0YjKwuy3wDN
 L3mPPYchpR540g9QRjuseniWWwXcvnHvone1lSuSbFkQDbvhU6MM6h1hnOXAjIHK1VVsJ7Eh0SO
 sXbGzPN4xNPMrnrXD2BFqar5MHMrWrjsqIZh8D0oZrQgaW8pnFX7EuZKbU57JOIQWeHGfmG5tgt
 gUqscrKjJDFS37QF9sTyYTEMZj9OWWsfqa3H5pjbnSnDTwjpeBoKH7e3nAXT2qS9f9OhpnPUXSr
 NGFZLKGZioZYv7fALmfPglvrxUVMa7VyEskBg04q+OLI095KlysaMZmNHybOXj8f6IuhO+T98th
 HNR0ANT8nf72e9dL8fcuy9+ffBssNrch6y4UM68w8fTArAsHl1PzPILJQ2lKbr7IfNQ6IK8lNeT
 CC6qm5bIbizd04KdWwMdesSDwUenyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180121

On 11/18/25 3:52 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> This regulator is used only for the display, which is enabled by the
> bootloader and left on for continuous splash. Mark it as such.
> 
> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

