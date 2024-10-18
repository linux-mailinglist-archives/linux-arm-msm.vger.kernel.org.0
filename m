Return-Path: <linux-arm-msm+bounces-35033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABC59A4776
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 21:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B19AF284070
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 19:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04CC9204942;
	Fri, 18 Oct 2024 19:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enAOv2qV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9BF1885AA
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 19:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729281499; cv=none; b=KYoDER6PM3/cffskJH1mO0MhUMKl75KbEd1Wx38xTtNJCXPBTfxG+RRRnp+yO+zbIsWvfXcC7DgpwB/oNrdkNg5biY3sgPQyKi5YWlgNVonJ40QxMaZaFiCh4z65O1emCiVQYEgzQG409ugM31ov8pF4DnR3rPPUcGSEBvFICC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729281499; c=relaxed/simple;
	bh=82sYqD5s+7hIOtXqNsdn8pKxRLGsL54DcQPgvuBtjes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ak+WMXnGONIougsUI4rd+7sRNtBGX3wBYOTZwNMncTkosqTBio3GZUv8qUGh0F0o1rUdtUWpzjDNNWSiGwuJ340HAMGVLPK7kUqFS2l8I4qtpcOSTrNpQ+H5IkNd8GxgP4DR8YokDtTy+KHuJkkSTNW42D4WuxUul9y5xH2Lpik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enAOv2qV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I9DVvd006552
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 19:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	17H7VN6qnXXJuVQsrDHyc4u5oFUS85hKz7JjpkIBFxQ=; b=enAOv2qVfFOqAZs3
	Hj+1SryuUMNEsrrYPma/Spi/PsFdLg8uYOHRd6yChn54ILaDQqs+HFjI6EhTbsz7
	7+r0PltmJrDPcGOyFJBcgGskMgL+6+CTVaqXL/oBpef2q2j9wYu97kfT73e1ZxDH
	SJk5XgYniFg2etwoCgSzXCgSp8pBKTnbx5jUn2XIIg2Lmq8Bg/mn+0OMS+PZ0YlK
	/bBUhtmRqoUaE1rf5Ya0K+zX4PQwvTleklv15D1w9L/h7Gbask/yZaFEkyiOwpAL
	GxbRjkecEZgX25ErYPk0uy8KlYj3b0e6LCqevfs5wCQhwb/RkUl+0wJRkDxKUHz/
	olydew==
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b8rr3k2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 19:58:17 +0000 (GMT)
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-83ac065de2fso9731739f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 12:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729281496; x=1729886296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=17H7VN6qnXXJuVQsrDHyc4u5oFUS85hKz7JjpkIBFxQ=;
        b=X/uaQcGSPXC06diZLR2i1jRfGoN3MKrSkXxYyvcydmtAFdnirDpPGp57BPLb216UWV
         w9EBnCJhrIorfYveiHEc/8UPisQL7wkUkUmXkqxvP9dJKFVHIFm1Q80Z1U8yw9YwasRz
         kuYYVn583gfm4+sUzMWXvvu298gqjmHDe9lACS7+kLpdzEHKGp967DdK1x/B8pSMrVYR
         mI8CysMGDKh0uv0WQ3PN0uPkLPZ+lKQAKqAQqfZl2NeMF/SSJJrP/Hv8/Nz0H4bUJHtM
         bl3iGuL3lDIcSRviT7ud1hdkPGX6Rvht0j0JIYxSahMGSVifhUABapHAASXexvw81tZz
         Jk0w==
X-Forwarded-Encrypted: i=1; AJvYcCXFq0PEC41Zmir+pWbftiiQnk0vqz5uOZfghEcQ5yfjgGi0bot6aduwZyqK4nl1ETEr9EROq0hUUVmmT5DA@vger.kernel.org
X-Gm-Message-State: AOJu0YzaYiDTmAY9D0UV+pS8s9miNIuVEOVzmIecgGIAl7Cl9JHVIm+H
	IrYaQKYcQx1x1e/BnEDyNBKw5YBFI+nWEeLHu7sVXtJia7V/6AJ6HO6FGvfWarulaq+Ds4A95w+
	bkn13tPcJtH4gQnLtBWJWFkOAHHInhHmCiGa2flUF/m0edtjLBjSOcfyC+aJ6koB2
X-Received: by 2002:a05:6e02:1705:b0:39a:f126:9d86 with SMTP id e9e14a558f8ab-3a3f3fc94b4mr7183815ab.0.1729281496153;
        Fri, 18 Oct 2024 12:58:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqsPyEr/Lwj74Qskarn7NoA+u+1X8YWX9tKtJRLbScUlYeXVIFDyeC9CKm8mQ47T95ZjMwYg==
X-Received: by 2002:a05:6e02:1705:b0:39a:f126:9d86 with SMTP id e9e14a558f8ab-3a3f3fc94b4mr7183625ab.0.1729281495736;
        Fri, 18 Oct 2024 12:58:15 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68ad506asm131676266b.57.2024.10.18.12.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 12:58:14 -0700 (PDT)
Message-ID: <940da07b-1286-4b88-8384-16ca2f996d90@oss.qualcomm.com>
Date: Fri, 18 Oct 2024 21:58:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/22] wifi: ath12k: add ath12k_hw_regs for IPQ5332
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        P Praneesh <quic_ppranees@quicinc.com>,
        Balamurugan S <quic_bselvara@quicinc.com>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-6-quic_rajkbhag@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241015182637.955753-6-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KHIyKgs_O1wSOfzfkxJKKqeXLJ_FSxRH
X-Proofpoint-ORIG-GUID: KHIyKgs_O1wSOfzfkxJKKqeXLJ_FSxRH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180127

On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>
> 
> Add register addresses (ath12k_hw_regs) for new ath12k AHB based
> WiFi device IPQ5332.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Co-developed-by: Balamurugan S <quic_bselvara@quicinc.com>
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---

[...]

> +	/* CE base address */
> +	.hal_umac_ce0_src_reg_base = 0x00740000,
> +	.hal_umac_ce0_dest_reg_base = 0x00741000,
> +	.hal_umac_ce1_src_reg_base = 0x00742000,
> +	.hal_umac_ce1_dest_reg_base = 0x00743000,
> +};
> +
>  static const struct ath12k_hw_regs wcn7850_regs = {
>  	/* SW2TCL(x) R0 ring configuration address */
>  	.hal_tcl1_ring_id = 0x00000908,
> @@ -1126,7 +1210,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
>  		.internal_sleep_clock = false,
>  
>  		.hw_ops = &qcn9274_ops,
> -		.regs = NULL,
> +		.regs = &ipq5332_regs,

This makes me believe the patches should be reordered (or perhaps
this should be squashed with "add ath12k_hw_params for IPQ5332"?)

Konrad

