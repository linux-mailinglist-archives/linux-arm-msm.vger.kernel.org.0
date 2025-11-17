Return-Path: <linux-arm-msm+bounces-82061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF10C62D75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 09:04:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3F0FD354B19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 08:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE79130DEAE;
	Mon, 17 Nov 2025 08:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQKAAHSR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cX5xPCPt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADE824DCE2
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 08:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763366642; cv=none; b=jtE5K8LwzHc403izIQKsrtjFaGpZnfgsEPTpF/+kFvp/t8rNQTJHqUkMzEIFtR+oIDdDskbt44xuYYzHPKEdpp7ozwqbP5aalmuc9Eb22t/5Ka11f+z18MOaVHD+B7OTi9Pst1paNfT9YmF26CHzVqBgSDK00wwyqEGCD+X8XMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763366642; c=relaxed/simple;
	bh=NiQ6dPXUR3qBUFxjUddLD3A/Av0l/KfYX7OGQVhntio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hK79RxPp5D1GsYtP7/htoSNFjDJCxk0gzRyRpF/ng7l6YovYsaw/FhekBdaZMYYFZdZ4+HThgmoAWbJ1Ch48TS+LUJDGGEyigGBP5d9e68m2eloyFu42I1Q9g4pkWZnwYUBC6OO3hOQRmXa6/AeSc/Ke7uPMOLLYfQi7AjZR3ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQKAAHSR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cX5xPCPt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4nxcA3106774
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 08:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R4Xx1nzkjZROYXLFjuIT5emSJnRfpay3eo4Xkn+Cu2g=; b=GQKAAHSRbq0vJdJw
	JDrmGZ472bqGv44U321hpBqE/Rmh0Zb9kjAZbuaaTbWQ8E59GhUwfDQmvAbNSIp/
	SDiUcS/gwXU5T1aDlEfZlz3h+uLlUbBt/NnVxbaBNR3kEX/7W4CSkqmP2JlLfu7v
	9BNJFQVkg+7IVmVzoHshmQ7Sr6nFSEl7BW+90GkJ3tq3TcE4PJ5yh2k0cT7DmlqF
	KjJI8bTPd+v4dn4Yk5M3O4QY+tsq5bF8zG8T66y+Q5h2AHStEtuICFTD7SqSnEBu
	c0sGGmJjHGDlcgjeDyQm4cDs6INavfgtEsAYd/jYdDskBtvKzOEfKOyw8xrBMXKs
	xcRjPQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejk1kuab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 08:04:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b89ee2c1a4so5425220b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 00:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763366639; x=1763971439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4Xx1nzkjZROYXLFjuIT5emSJnRfpay3eo4Xkn+Cu2g=;
        b=cX5xPCPtlxKYKWYFkO8/kvw1fNafvkZSQEv6w/6NinBLvM6XLUya8jSX2CpBM/6te/
         KhM59JSP5Fwqu1DwufxvfztrxxHxztac7H1RrqpfQXihGrm6rOE+RIzJjwtqrCFyznDX
         oNkPgZ/rsQ3QQ8QKD+1NlgiZPldiQzsUeg8hc4c/t93rUAYp2PhjNXB8/cb3HL5EZ+r5
         wk7UQncL/k9/B0ItvQAesBKB8pM2+4nmPZVPp4aXJ4bwi6yH8GbF4GE2SD+ZIxng1Msh
         9swdg7sHiOQT61toppnppGC4aVRDRddFjUeBguAQm4ap9SnYrzU3zseT7YxAUuoaW/c8
         ncdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763366639; x=1763971439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4Xx1nzkjZROYXLFjuIT5emSJnRfpay3eo4Xkn+Cu2g=;
        b=XagmyZbWwdCK4dJ9JgSCF29PHe3t4DJBOXxaq28RyUWmdD3hirpoa32BIlYHqoib2J
         9UcThuIbFr1oBMYZTbZXYOFDKHZeR1ZENNHgnUdQRsZeUymNpL39OtakmUtSFzsUheAy
         7jhiEFsaUj302jWP2/Vo1y9Mk8d68PEOWmA+FcKiEbC72g5xjj+kAxaog4yWRhtJHT6D
         EUp/qfeY3bGeC04LQWmFHDavPRjZoDwzRLpOHZ8IHXWyDULYHZOkpsc2dEnrEDIsY2Pe
         vlcVfqPFPPTknwTOhr2V2Rkf55sQuYb0PS87u4fF+7HRtUwA0NirS/gj1AkRgBk1wjTW
         k+0A==
X-Gm-Message-State: AOJu0YwCrcB19Jx7/vSlrAVQm8xFtZ+d1FeAFxNXUbMMwTC5FsVcjI1U
	QNLDHRwTRe4qflWuVHDBd8349qieE4LUVSomgqQwKxcUnfDedmqU6U/hfmQiG0ZSwVbpUrHgbap
	etwsZH2+FJBgie1hUUCGpB8JZINcB0nJgHmtgtiO8/dtB3ruitNQf1brb3AuP3A/SSE2O
X-Gm-Gg: ASbGnctN/W47E3S9R5QYvtheh/k2FlymiKxF9MRFzqkG8X3cijx/3+4cCKuEptSdbkx
	SYAs/H5K0RmMcqvpQQ5i3ek+7GN88MUElybun2nPhD9RO5ZGrKqvyoXO+nQQupv2EfIcmhhvvTa
	DcOYtIAcGO+DURTpVqDI2UR6oEBfvLYhZ2/7eGRgKxI/W4TfWxyiKcp2F+Q1fxOm8bF3hHQnKaJ
	TVFaOuMOEf4JW2Y9PyE1oP2UD08M0rMgGR13+HBlBPUN9mcZzEThApJeTOvH4Qj+97A0DU4N2zX
	P7KWQ5p5HtID24btY0ThATZxwSjUiH7cdA/ZtcQjUkjuGdMy6CO8NNSPXbftTWRPWamcSFA/1+Q
	JzAHLZ7gIvlE8bnfcqgSuL3KZEyQ=
X-Received: by 2002:a05:6a00:240b:b0:7aa:2cc6:8c38 with SMTP id d2e1a72fcca58-7ba39bb9fa9mr12484329b3a.2.1763366639387;
        Mon, 17 Nov 2025 00:03:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHfEYVM6V2fJECHHCpONILizZ2XAv+5Uz3vTC8/xLSB/OAdtttpHrKxTvm7nwtJjUXecWrJA==
X-Received: by 2002:a05:6a00:240b:b0:7aa:2cc6:8c38 with SMTP id d2e1a72fcca58-7ba39bb9fa9mr12484298b3a.2.1763366638940;
        Mon, 17 Nov 2025 00:03:58 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d332asm12374136b3a.25.2025.11.17.00.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 00:03:58 -0800 (PST)
Message-ID: <793d5039-0506-4104-b4ce-64bfa3cc00eb@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:33:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: gcc: Add support for Global Clock
 controller found on MSM8940
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lanik <daniilt971@gmail.com>
References: <20251116-gcc-msm8940-sdm439-v1-0-7c0dc89c922c@mainlining.org>
 <20251116-gcc-msm8940-sdm439-v1-2-7c0dc89c922c@mainlining.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251116-gcc-msm8940-sdm439-v1-2-7c0dc89c922c@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ShXR17fmYzkc63vLxL9hbt8CgYvScLSP
X-Authority-Analysis: v=2.4 cv=OpZCCi/t c=1 sm=1 tr=0 ts=691ad6f0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=djyRjNaPrsuUQGfLFkwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA2NyBTYWx0ZWRfX43zL6XRkSrPk
 o95TlYr1sq3L0vdCDDt36+Mw/CStM4Fc0KhXUzgbqcOYcKGeL9xQk/F6jQZXEwlkWK56Ei9im3w
 g+NGMBAgEK0rWT1m4qKWdA36nil5yM1vZlh7nh1AMJBlj2uiB3dQCnKqahmoNfC+ByKTcaUKAMN
 BQa1LT+1GosDaSLk7gE4agqTtnGk8lsNmxIYoTAM+ZvLETAqVgQ+XbvqN3ViK9vFTEWIiydYcjj
 zwNvDC14ERHxQweKpw+p/9UynJBsS8fpolpHhZsVfkvw6KnrWIjl+rFoghh1bt8CmHbDvf/4RiA
 Ijb8JTLrF+lG6r9pY3/agsrq0s/MhW2g3t81Duzb0hacVuvFl3lofiIuAOpizPC2I9XEn67kyA3
 Tuv7j2NLprRW5oYV2NPYmtDdRprmWg==
X-Proofpoint-ORIG-GUID: ShXR17fmYzkc63vLxL9hbt8CgYvScLSP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170067



On 11/17/2025 3:05 AM, Barnabás Czémán wrote:
>  
> +static struct clk_branch gcc_ipa_tbu_clk = {
> +	.halt_reg = 0x120a0,
> +	.halt_check = BRANCH_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x4500c,
> +		.enable_mask = BIT(16),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_ipa_tbu_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +

Is the TBU clock used on 8940 by a SMMU driver?

>  static struct gdsc venus_gdsc = {
>  	.gdscr = 0x4c018,
>  	.cxcs = (unsigned int []){ 0x4c024, 0x4c01c },
> @@ -3764,6 +3798,189 @@ static struct clk_regmap *gcc_msm8937_clocks[] = {
>  	[GCC_VFE_TBU_CLK] = &gcc_vfe_tbu_clk.clkr,
>  };

-- 
Thanks,
Taniya Das


