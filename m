Return-Path: <linux-arm-msm+bounces-75257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2323ABA2B29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 09:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0838384676
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 07:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48D72868AC;
	Fri, 26 Sep 2025 07:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzaNUATV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0055E284B37
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758871481; cv=none; b=UGI6RGLG9uWymJ9hCDHbFudpcXNEQQZLzr9itsiEOeC3yfQmlAudljkpoPsc+QFMVquLyXIkG0irT/06aNxWNJD8PhY4R3/NMPgmc6BtlAcpEID3kSJKVOHvJ/2mk4/Y7KdzmY1toCH/GCTM1YytrdPPeVLrvERSyolEEkBDkf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758871481; c=relaxed/simple;
	bh=c2eu+UL9TCmEp29DV0rCPhXtO/xi9h8QVygQHibyZVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H8uAUP6DQkP80jHoKJgGZ6U4WptdTu6WDHJjo3UVuAq9EAIdSIpvAgpjQZu2YB6/lpmdafr93iDNRb8Xemi1L6VOMveWJRD1zbBCgPonLqIW2TvT8h5WnFNM++OIuaMhFU3Hc7EM+du3COhH1Uzn8WfzcmG0G7Qn4a81vGX+Hc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DzaNUATV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6raaq025544
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xahJWVIETX5BgulbVmZ+wNN4Sel4PSrkSaX8qRSlVNo=; b=DzaNUATVlO1Gg7R7
	FrvPqSJJIGWbwHp+bb3iIjTSqI28zM5DONHQJWFuNRPeWeAGKgq+Ejof3czeF3Wz
	AShaUdVw4iggr2N7363Ps1yU11M1y+B2UuEkC3YEYn+4xJwkEM6CsIXIjinRGCNC
	qRnkb5zKtMegdDELXBEasVDZWRw5rK0X0SEAsSy9cwejgdkOEota6ULJ80NbK60d
	5oL40vw6MakX0YR5+FBGormVagK3lCUZWGsx6RmgbWuqFgOKfw1gWnlkHeOuZ4ZW
	+GMoUjkkTWaWmIU6OurCgXr8hZ8Js4MzlUP635Ef959hpNHahQTdRYizbwMt+TQf
	oS1KMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u1vby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:24:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458345f5dso28268305ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 00:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758871477; x=1759476277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xahJWVIETX5BgulbVmZ+wNN4Sel4PSrkSaX8qRSlVNo=;
        b=qD3go0r0FtWUznN5Qfs5ekdwistEdaDy4/HeQCWiNUlsQ0/KXq5/pN8IeTT8fNQPs4
         UmDiezLLpedLIGQXRfKJhpEssprwZs7OfN0ro9bV4FQVxeYshkO/Kp0GsPZC4912I1bW
         kPOC2At5e7ZUs+TXy6oB8TfN4QOgpW6oBZ1a0CKTzq+5FeG+4tIyvEzxgi0ofKyecI5s
         7ieIADFMS+4W04WF/WLIc4XAxTbXO3X2zCaDgsOMklxq8uGCwPYVctNjwyQwnIVyrGHo
         TggzxSVATGgC217GePUbAX/4Ea2f6KsXxRWaqtXJ7aqUjuOhrvqra9+khH1h1VKOa2JH
         qTbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPywZMlLDBtbK2Sq9Yt7nJO/hubAZa1kPngjZEbKVRGvZPCJ6f/w75FPZodd6jfK0wMPAuSpZcSq+EzlMG@vger.kernel.org
X-Gm-Message-State: AOJu0Yybu2Jhi1mTaRMVIvy4yCpHnEUug6X5M43UOyUMs4vpBgGQJ5G4
	V5vj6fiHhbXuJe6ifNqXWpiehHKT0p/eMc7+4kQgb7h4Pyi7FRSxkSVT8jgMjG+zmFZGjJkZtHP
	sgONaq7v3TMU9ijcI5LERQNE8lvv10dv2/SoYasGYf7TNz5p7ScoxXHxYJIhXMyVoOWE4
X-Gm-Gg: ASbGncttpB/F1BLS68gEEOw739avTebW/VUVZfWE8Iv9UWnUnxCdc9XR6zot1a5UAI4
	qlYtKDUoEbx5lIRlf9iEWd8cpSCQvRMf7nzW0b337P9RkrGa0CkzZT9/2IHsx3RpVUM9+EzQmQo
	4X6+t9tFZOqeTpAQe5B4+YXsx9CNpeVN6vxYqtj7fHjanoJHad72odpPlefGNh8f8JqqTBSzbrU
	qoSBqQ1rTQSX/mBa/bnySR+6M62fro/3xf67YL+RmLVTvO5tvW5cXEdXHVeXkrzlmYd3sOfqGPn
	n7ZIsUA0BJQK6HI2zpdXsEHwV8Ct/J3SPPYjjQsnpztZR/W7BWNhNXSeozZQ/j1OL2Xp
X-Received: by 2002:a17:903:2445:b0:27e:ef09:4ab6 with SMTP id d9443c01a7336-27eef094bc5mr16653725ad.0.1758871477446;
        Fri, 26 Sep 2025 00:24:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9mU7hMFwtT2lvjIBnrzMBSX54y4ICW695ZcgZtsa6DZblU9rRmj4e5eTtaAR5LsZo4bmixg==
X-Received: by 2002:a17:903:2445:b0:27e:ef09:4ab6 with SMTP id d9443c01a7336-27eef094bc5mr16653455ad.0.1758871476971;
        Fri, 26 Sep 2025 00:24:36 -0700 (PDT)
Received: from [10.217.216.188] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d43b8sm45147795ad.9.2025.09.26.00.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 00:24:36 -0700 (PDT)
Message-ID: <b01e5413-c8d2-4e4d-af9f-106bdbab6e07@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 12:54:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] drivers: clk: qcom: Add support for GPUCC and GFXCLK
 for Kaanapali
To: Bjorn Andersson <andersson@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-9-d7ea96b4784a@oss.qualcomm.com>
 <ba4vkdcbudvyoj3i7eufd27luhmn6ai4mgkefza6sfbjzfwgp7@rvnpins2bruh>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <ba4vkdcbudvyoj3i7eufd27luhmn6ai4mgkefza6sfbjzfwgp7@rvnpins2bruh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 74CDXbyPUvTvPA9P8h6juQLp8t09Hajj
X-Proofpoint-GUID: 74CDXbyPUvTvPA9P8h6juQLp8t09Hajj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX826UsvhQJAW/
 wAOvBQSdn2uA5Y91Dek4xAJt8KU8cT6LYOGxki5YWH/eLL4gg522FowAvYH/FGRvLCksM5A7Cm1
 WbYSmL8Gm1DO3u5JsJy5IejJRFkYQQWListqaVJbnxLFHKLZ4sjt9NR8XR1FWRm8Jk56thwkAb+
 KTF+N2kctY6y0++BWHj16CVLXU34tR4FqYzWhk3DNEn/X4Sn6BmklxYf9cVQgNRd8Agnpk+4WGq
 RWijK/V/mskLnVnkiUfcqSLOGgppG9qreCnTRIVEhyy8ZCvYs3feA6sNvOvGM4aiEjq1u4TFH3D
 yNVP+OckruSvc1/6ZPSW3ot+ani35FGWKGNsRRIrOZalA/y7xzCYocxwr00APj9gAhd/0Ms0uQA
 d6DO+hb+MolMGUUiqCVVBrN0s3OdKg==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d63fb6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=U7xz_n88CXcP0GAGSGYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171



On 9/25/2025 6:47 PM, Bjorn Andersson wrote:
> On Wed, Sep 24, 2025 at 04:56:50PM -0700, Jingyi Wang wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> Support the graphics clock controller for Kaanapali for Graphics SW
>> driver to use the clocks.
> 
> GFXCLKCTL is a new thing, please describe what it is.
> 

Sure Bjorn, will update more details of the GFXCLKCTL.

>>
> [..]
>> diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
> [..]
>> +static struct platform_driver gx_clkctl_kaanapali_driver = {
>> +	.probe = gx_clkctl_kaanapali_probe,
>> +	.driver = {
>> +		.name = "gxclkctl-kaanapali",
>> +		.of_match_table = gx_clkctl_kaanapali_match_table,
>> +	},
>> +};
>> +
>> +static int __init gx_clkctl_kaanapali_init(void)
>> +{
>> +	return platform_driver_register(&gx_clkctl_kaanapali_driver);
>> +}
>> +subsys_initcall(gx_clkctl_kaanapali_init);
> 
> We're not starting up the GPU at subsys initlevel. Can't this just be
> module_platform_driver()? If not please document why.
> 

You are right, we could move it to module_platform_driver().

> Regards,
> Bjorn
> 
>> +
>> +static void __exit gx_clkctl_kaanapali_exit(void)
>> +{
>> +	platform_driver_unregister(&gx_clkctl_kaanapali_driver);
>> +}
>> +module_exit(gx_clkctl_kaanapali_exit);
>> +
>> +MODULE_DESCRIPTION("QTI GFXCLKCTL KAANAPALI Driver");
>> +MODULE_LICENSE("GPL");
>>
>> -- 
>> 2.25.1
>>

-- 
Thanks,
Taniya Das


