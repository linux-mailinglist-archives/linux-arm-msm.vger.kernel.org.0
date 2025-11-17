Return-Path: <linux-arm-msm+bounces-82060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7519AC62D4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 09:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3D5BD4E43C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 08:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045B930DEAE;
	Mon, 17 Nov 2025 08:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kjilAvEL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZO3USTim"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C0723F429
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 08:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763366497; cv=none; b=gTSvXMPmBW5x0jQ1QK4Foz5HYPjAkTE/x6ArIprhmw7vwWoKxoApMw4mQIA9TmZGfCcC40WnahSAnE737qsVMKRNVGu0oMKl/X2JqJzmLiTzQdLS8CQQiuG8KgTfTtCAZW8JWA3al5bhiRMiGN0ybTbbdGRDRQGywD6hHnZJJA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763366497; c=relaxed/simple;
	bh=m8TyZMzMFKsLEA+eFRfomBl6F+Zx5UFP11C+DoDotbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hP+v2QUsBpfgvQTrMaWF30Hl1YBF1gKGOLBYCoadjCN+Lvhly4tCDaFai9eL9Oc+/EPzFEhIC3BsioB7ik6AjM/6so2GOOmnCMmygtuBOWwsdVs+rP6eLMzTj2yXvJmudXHJqAw6A/5KCm/EcxYOHydkqiw1f9YdFVAquvYpKeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjilAvEL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZO3USTim; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4nt9p3318407
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 08:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kilptx1QH/kWpSVpOyWmVmBzj38jY8riz5Mji4LvU3s=; b=kjilAvEL24eCv6/W
	zKKECHMEspml5qhrrViGx4Cs/6t+hoIbSOpGcf3WLUFNSEefeq/gLXQjhCiZiytp
	8UKqyP7V7TvkT+NlDkGrcCvhcaUeJ5nfzfmLpoVAjnZdDijfdYcTlDn4fQcWqmMl
	lNXmRdLO7Jl2HXta4AjBC0eJR50o0ddgILdllvvIox8KBvRi6f16xny+n2/kSLQs
	tYhUTrofl+F4zMAK5aHJJvEB0Pecg+zLLuGqsBBAYQN8P+9il7JwS3KAy/bMe9Wo
	9VWN68pV/NYY/8r9ywxC9Lnokn7bf0gtDuP4DdzRpAqeuSjKmZBZ0Vul5826yPWb
	FzKLxw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejm5buf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 08:01:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b9ef46df43so3770189b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 00:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763366494; x=1763971294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kilptx1QH/kWpSVpOyWmVmBzj38jY8riz5Mji4LvU3s=;
        b=ZO3USTimQFCyH5Gq+z15eq3ate9FnUaSVDFGOCeEgVK5PwVLVH+jwS16MGQaYBHpX1
         P8j1Q/env5o3TN9lUxEZunCDHrkGjSMbDV57mnL7CImaS5fLTXYJCq6T+hxPqQfCiPCN
         qVBTEGOUA/d2XXE427tgzRNs5YsnYqZGhCW8khB2QO+1Zi9iGdMDdWPccr+spCVsyrHp
         P+/z9OUePegRNwVsVr1/Ugvl7/vyZ9Rh48c8S7mKRvzREnOAbS0mk2bKdgBBVhvsOdUe
         awa+/+TqThlKW8KSHHdyHHaodhuyMHIZX6lSljlMtmOCkHrLGm78j7wQCMMbxD502rou
         tVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763366494; x=1763971294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kilptx1QH/kWpSVpOyWmVmBzj38jY8riz5Mji4LvU3s=;
        b=unw8Qtl8en3AZrIwN3kFmu2eboGyQ2K00vk35K8d0hUv3/P9y0sSCcrDm5mitkFtWE
         Txlaa/pAsHUfoF2CpnL3i1ICmDKSpJCQVc8qOMvzyNH0fHRxREFH+rdRy3rW+yrtqavo
         m9OsEKY9f6X1pVilS9pzQ9drpvNxRIxx7MsqKMNYiUongI6u+Nc6clOEOSd6lmh8MEWE
         ytSwu+SVsstF/tfhEAHHy4q8HXl2hDR0F6X46EF/C21Sv+8jytImbBbDvkdlztOufNEC
         sAPBh3VR+q4ZtPzUfeTcQTGJMNxBSn433ynp/neUWO37WjAd/qxOcyjJTSUFfWKZSpbo
         eIEA==
X-Gm-Message-State: AOJu0YyygvmoZFtMZ/pZ4J4QoBBiYTHUD0ES4raMuoeLWsOFa4lmepMr
	UKD8CWJ053S8UJi/dd7bOPUDUSAVHvaI2nVjEtieT76FP95Wc9iCGKHW7BMgdA6gc3TsCY+5q7Q
	lTV4u9RrsyQyxyU7uJxPBhZNdagLM4clcdVU/2r3xK44Epgwh64YizGSZYqZxQmiW56HE
X-Gm-Gg: ASbGncvM2+lEH5dFIhDnEsogkvOT6ustewAp7wz9e6MAdl7JZ3SoQZC6i+29llqDxUz
	URFbct81Uz4EvjwQU2FErDKJsnxIJIUHoSufalJ74laylbrXbYrzZGF+gVWoiOCIisg6D8fgaLl
	8nF19jlCZNZnbTNnViiITbmBSBUmUkyD58T5h6rOys6pi3WqQIfhT/uR8ysxTUNlwadEVoTEWEN
	ZUwrbp9WIfdl9Rwalmll1BxoIKwzXSze8ku1CKqb0VpX9mRYRvY1mx7RCaK+/6AmN4E/n2HkwGn
	Mp7d4C8q0d/Mbo9JmDKgV6hgHzuFyqIz1DOunPh80Q+vubzdhpB/H6xgwoi2gaVpIT4InkkuQSi
	Kht2qaflzi13H5jKNx/EeWOk0RUk=
X-Received: by 2002:a05:6a00:94fc:b0:7b9:ef46:ec61 with SMTP id d2e1a72fcca58-7ba3c17daa3mr13854365b3a.26.1763366494202;
        Mon, 17 Nov 2025 00:01:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBdLbpnzKDV9hIMEpdaxA39q23sH+vsg+cb1I8VQ+nGm4zb3iUFdG2Egpb4alDgbDppA9i0g==
X-Received: by 2002:a05:6a00:94fc:b0:7b9:ef46:ec61 with SMTP id d2e1a72fcca58-7ba3c17daa3mr13854321b3a.26.1763366493701;
        Mon, 17 Nov 2025 00:01:33 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7bedbb2a1d2sm3412353b3a.41.2025.11.17.00.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 00:01:33 -0800 (PST)
Message-ID: <a407c485-3651-45c0-bfa5-164bfdf8d55b@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:31:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: gcc-msm8917: Add missing MDSS reset
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
References: <20251116-mdss-resets-msm8917-msm8937-v1-0-08051386779b@mainlining.org>
 <20251116-mdss-resets-msm8917-msm8937-v1-2-08051386779b@mainlining.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251116-mdss-resets-msm8917-msm8937-v1-2-08051386779b@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA2NyBTYWx0ZWRfX4iADxhOjfC5a
 R7zLbs4IhbRkEtRZ3091KDtox2UjzjlA2qFWaH9cpZmDc5QRo3h0DZIBLpyL3oqXoPiJIRWl9HD
 SkFjQVTiV7sNaPUfpGGLjZdK4+F5xGgvNry0MGbf1REWiE1Et+ueYHSicbjHfh0DQ0JtdFa5Cyq
 25d9aDkzoTxM939hwu0Zk3FaHJw+c48T6Ei6OmK8DjYan3hlB5M8aKz36AkqIiKVC3Ui8+oof9W
 V9G2pdfY/z5CEvsPdErdUwusG8/2c0kEkoXmWMtURaX+PMIaGp6uCAoOCcgwP7wtiBrhhEHhD0H
 ZcqjPngWGa+/k/FLOEPd9AK3zEnEJ+XCX/I8U41A8RLxAfWAhZFTkGTdcuDJtZ+YeDu3u9hYR5z
 /2w+s4gyApOpuOPTU/TuKFUQl5shpQ==
X-Proofpoint-GUID: hcpzuDCnROOjAWFA1Az2ngtANT4SdvFm
X-Proofpoint-ORIG-GUID: hcpzuDCnROOjAWFA1Az2ngtANT4SdvFm
X-Authority-Analysis: v=2.4 cv=Pb7yRyhd c=1 sm=1 tr=0 ts=691ad65f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=E0pASI8uq2uS-7dJItoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170067



On 11/17/2025 3:40 AM, Barnabás Czémán wrote:
> From: Barnabás Czémán <trabarni@gmail.com>
> 
> Add missing MDSS reset can be found on MSM8917 and MSM8937.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/clk/qcom/gcc-msm8917.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8917.c b/drivers/clk/qcom/gcc-msm8917.c
> index 0a1aa623cd49..248fa0fd86f5 100644
> --- a/drivers/clk/qcom/gcc-msm8917.c
> +++ b/drivers/clk/qcom/gcc-msm8917.c
> @@ -3770,6 +3770,7 @@ static const struct qcom_reset_map gcc_msm8917_resets[] = {
>  	[GCC_QUSB2_PHY_BCR]		= { 0x4103c },
>  	[GCC_USB_HS_BCR]		= { 0x41000 },
>  	[GCC_USB2_HS_PHY_ONLY_BCR]	= { 0x41034 },
> +	[GCC_MDSS_BCR]			= { 0x4d074 },

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

>  };
>  
>  static const struct regmap_config gcc_msm8917_regmap_config = {
> 

-- 
Thanks,
Taniya Das


