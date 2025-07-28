Return-Path: <linux-arm-msm+bounces-66817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B4FB13632
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 10:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A21C18997AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 08:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1C422D9E9;
	Mon, 28 Jul 2025 08:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZqJ3vKw/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DB8224AF0
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 08:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753690798; cv=none; b=MWDpxdGR4Mro1n7AOXAptyw9g3sZv0/q96xqOguQEfPUhJHuOwp3sv8SpTDFqJoXPc4emSrLvKUfmcHqqoeEJ/6/qWigFcW3Z0KZXx46oqeaI9LS+oPCr3DKM5lgioE4+8TOTvwnSjkAVBCht9wK/287/vax2l9hngHD+TjVgMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753690798; c=relaxed/simple;
	bh=k8n0r804RPCue8KVUZzax0URN/CldCx1tfSkQPdnc8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jrUy3wyPkNT8FyfN7rhVOic8rMxfoNeUgSQgv7cSZjxx/cKs65bvhD1ButN8vbyKB3fBQvK3ub6galG9g6hdeam5GJCOKoAjI2fwklRFXu82zEazplzZLKRuqq1HsGbMRQsG6NnO3Wxr+OiSDPPTQA0kPvSkn5fO5/cb04UW0SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZqJ3vKw/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4rVl4019675
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 08:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c3/V22c4H9/4N87ToxYjpj2YTnx67TDaYm5Xeu+qWco=; b=ZqJ3vKw/3GvY4XkR
	u3CP1JJjp9JwcIxipYoHGHzZEbT+MvMBKeBaTicf7yJuUihKYUhTyE2SeRM0bA4i
	hht87B7LURdJ1xM0YJ+76Xn1V7YNMBA8ZTDupifYtDmK4sTM6vw+pZAVjHfwLRuJ
	sJQzQXG79WLFWma44upEaDxFSrKYEIhduEUkGSbeAftU1HlXVq+Bk30iF+YV7wQx
	XmN3ssE54IOxsp45/O1nmgVeLCoXXVMuF/t0lkWiDan60me4LLzjz7+wVxGsRyPU
	2ycHzt++gelNTdIQUJe3wRptMKuSZ0kwRV2IBn38EQg3yrmTG3+uR3+++n3PAVZG
	K/RKfg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qkquc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 08:19:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2403e631f8bso1000945ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 01:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753690794; x=1754295594;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c3/V22c4H9/4N87ToxYjpj2YTnx67TDaYm5Xeu+qWco=;
        b=w6AKLYAV3Wa/R+f38oAVHEcSnyTROzSvNL8i2Cc5eUNVhp8HBvM3hC/jvRONq5jiYH
         ejT/++MUvAjh5muc+aeepwrJUbCvPCG6zuvlg2E51UBW1mNU/nPv2Sm3rjRd5UnzJ77I
         BsulDFWy4Aie2jvsMFMSRdzzqlPSyGEnpJDts9mvOGtmTuf1XrU1lcN1w8RuGPdPRRiX
         J7BJXI1wU5QTz4/f+7upHc9Fi7mh9Ru6Jd7YTYhK1Kk4ngqJjotoK1N2cx6cU0JbUqXX
         Tz78SKqixabI3p7DJgG5T77oHf36Z6QFrAg2K8bCvVa7s7n6WFQ2d6nS8EZKaE8LLT4y
         yz6g==
X-Gm-Message-State: AOJu0YzkerMRZMnzDV4vmw7VQ72syxct2P6UOjZDAwdBL/86WRIJDKFV
	UZm6+DH7K1WhQ++4wO2sPDrQobSTtPG6w6UvHZYUyjgBQ4/9U+v4O9Ci0GT2oqIgCqfHSLO6a4H
	7BFoNECgpN+/ikLqbXw0rmLGvqEia1ztEUGqBoFi+xScVsf+MscIiN7XfYSGX6vuaA4HX
X-Gm-Gg: ASbGncs/lqAnnazUQNtOkQDEAdirYpbgSlgbJltpsKYdQTxJvELPn/B2tR7ISdZhKma
	3sMbpqmdH7rLb8dIPPo0JUYazfoiE0SRqK14vRgrKAN3/i1OLoSYaU+2gVwsRK+fKi4r+IQTYN+
	SV7fFafcMKK5t2l9qeiidQca8PEuDEk/1KrmAKjeIK9Q4e6BuwQVbwDVrO0UUGr2+Z2n2p2Ifl9
	8v+h1esHb1A2oDlBTP/qU19sIc1TR0DgG2ybNvT4bgeeHnOIMLJwF44v+raTxrsEyoBcBc0yjOl
	J5nBSZ7X5orBZrSES6OHjuANJkFzafLbseP0Lr6C8ZXXAEpxaQSDPPzRmMxfh6tApQjFoKr9jg4
	jNqfdMxcSAsSidChOiRLy1CM=
X-Received: by 2002:a17:902:ea0d:b0:240:11be:4dbe with SMTP id d9443c01a7336-24011be58b5mr24214925ad.8.1753690794494;
        Mon, 28 Jul 2025 01:19:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBHlvf/+jz4Co0OGrxgZgJllWx8x018fZVsC0zcR7Ey8G6AtlwbI1UqIOOzans4FRj4G1N0A==
X-Received: by 2002:a17:902:ea0d:b0:240:11be:4dbe with SMTP id d9443c01a7336-24011be58b5mr24214525ad.8.1753690793917;
        Mon, 28 Jul 2025 01:19:53 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23ffdd687aesm28379815ad.67.2025.07.28.01.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 01:19:53 -0700 (PDT)
Message-ID: <c3f191f1-1b83-4284-b164-64c5b3e3fd43@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 16:19:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] drm/msm/dp: Add DisplayPort support for QCS615
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
        quic_yongmou@quicinc.com
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
 <20250722-add-displayport-support-for-qcs615-platform-v2-12-42b4037171f8@oss.qualcomm.com>
 <bca68e7a-cb36-4903-bde9-15cb1945c71e@kernel.org>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <bca68e7a-cb36-4903-bde9-15cb1945c71e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA2MCBTYWx0ZWRfX9lBJs86oP7o0
 f81J81eyPwdGpXCduibu+6fdvOHt6Ny5NhsEwrQ5aFmx7LV/8yT1qwFYwSY+RwKacscBMVPzfV2
 nXTOTPaPzHa2N+cTCMH1Xm/5nGqWi0Sny459nANZeNdqXjmzQFW5iuIjGUCdX3nBJANC7/XrcAj
 2qE70xJSs5Bg+7EAob6Vaht0Tkk9O1UdW/01wwTR3gFwFjqZlpXrbO8vsunYjczwqpLMX8Y1CuI
 iIHc/oEPxIFtXY1z2DYHpu/XUiH27oP6J1IwWRWTdrOyEbabR2YBx/lG5B5Pt0cFc8mCoi8zKFI
 iAJAM5AeKGDZmHLldPVSIJXi7tOLKQt5sU69UDg2gwZiK0x4Y86c7MNiVZrJpcl60OgfqWu2CIb
 L0asMK/L+8Su9K2GP796frlQ8/dKIH/YaBOvrIlumbx9/ZMXQHDqKmJ2sItddaiL65RP3tuk
X-Proofpoint-ORIG-GUID: B1jFQL_ZAtqLvcmVllhW0jLE9xmMcBkI
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=688732ab cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=E4FQgNMW2-BcOtG67-8A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: B1jFQL_ZAtqLvcmVllhW0jLE9xmMcBkI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280060


On 7/22/2025 5:21 PM, Krzysztof Kozlowski wrote:
> On 22/07/2025 09:22, Xiangxu Yin wrote:
>> The Qualcomm QCS615 platform comes with a DisplayPort controller use the
>> same base offset as sc7180. add support for this in DP driver.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index d87d47cc7ec3eb757ac192c411000bc50b824c59..ddb22b50490035779904d4cab20e2fee7e0f9657 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -196,6 +196,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
>>  	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
>>  	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
>>  	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
>> +	{ .compatible = "qcom,sm6150-dp", .data = &msm_dp_desc_sc7180 },
>
> So devices are compatible? Why are you adding this entry instead of
> expressing compatibility?
SM6150 uses the same DP driver configuration as SC7180 via msm_dp_desc_sc7180, but its hardware lacks features like HBR3.
Implicitly relying on msm_dp_desc_sc7180 may cause compatibility issues for SM6150 if the msm_dp_desc is extended in the future.
This is consistent with how other SoCs like SM8350 are handled.
> Best regards,
> Krzysztof

