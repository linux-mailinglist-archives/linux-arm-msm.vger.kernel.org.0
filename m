Return-Path: <linux-arm-msm+bounces-79092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF69C12EC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 06:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AADE6351A7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 05:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE571FA859;
	Tue, 28 Oct 2025 05:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHBDugC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D077F23EABE
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 05:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761628608; cv=none; b=E1lLNJCq9+X1mnDm+o29LGQkjkdXz/0SugbjN4lenNRGCO9nPP98CQitrRinmGABMEZ+EpilYWObGd+ANH1GZHw/34K6NpBvb/zGYd3JwWu9YCHqx3MQQq+L2Ek8/FG+QU1VRRpGmCkqbdDieYiZi/8IbNnqNrmRFzuGmnQ4oFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761628608; c=relaxed/simple;
	bh=jNGXRyeMTH3uROj4bKwqvmjkEoQJLAOhWk9meGeHXBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IiV5WwBn9HmQYk+bbCDKvQfnPnHCy8S09VJ9HpJD5cfG9/R8o/9HSWdH6I/NqvkREb7xbuAdXb/oyjaZ/CeYSe0UkqNMc5ARPXrajWGwastmjJLBFwQW23F8JRiamLhPcIaCsDMfooNH8rq0pGdGMOLjKZV6lHs4cJqfPFkukis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHBDugC6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S1UwSD2961980
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 05:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XUAeRsK1Hv6t+HbR9mvGhvvq8azAUXrlOwY/BXZoNu4=; b=bHBDugC6Rva9VlmR
	xzli3lJpPCJSQDGTeqKtQnGhT5tEvR/cj0JfRqkyYNHIBM00oAQSCb6FuoKwdcgs
	wXU9kkoTrMVLFPWqOTpRpX7N+Brl5gMlC2zX4POaZblmKN1Dc2bhJvg+eIu2wF80
	G9XAquv8hUo7Dzlkn0aVJgYQ9/sGpscQqhn62U2WqLsd05Kjne7YUqSmBv1Mow09
	M3cCkCncwHViHqSs6aBhlxu+XbXUHCDPqAhoykIAE8LJPx5pa0akk/szC/uIk8XD
	7uNzHc73AY0Ks6kYSb8jo66++na15q5E9JUPBjUgkqRRgoGdkrv3nq8eoL8vAipy
	rTLm9A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a29v9tg34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 05:16:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290cda2bebcso17788545ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 22:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761628604; x=1762233404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XUAeRsK1Hv6t+HbR9mvGhvvq8azAUXrlOwY/BXZoNu4=;
        b=cd0WDcLIh7bFZHbYuSJH3mXZtvzhAO4OChpynqdA0U27dKrlhzszYjfEZ/p8YLFRwY
         yg9k6Emkym08RCbaJ5ZrNWhWJ8SmYBX1u1x9m8y69kfC2vRq3L5YoyYt91y4KG27Y1bd
         ZARj+FR5RpjqqsdrOuP6bSGJEiRHa6uFSGFVvKvBwzm6M9T9ZpCQoS7ptiLynQi51E0c
         8qxNsgMm05necy8nhubEO4X7wjkO7K7tbmLPjOkpLbL7FR3I94pa0Xj3FNw6PvCx95yN
         g93xc2yx5wxM5EOH0nuwLPTYTbDR9Wn326oycGfWsnJ0O8RJ+4taZn5YKWozraykuGS0
         jC/g==
X-Forwarded-Encrypted: i=1; AJvYcCXDkSJ5dEINK5neOvScmbHWcQ+YYuYRbcFwf0s5yZyQhDVjRXI7HhEzWMzYD6b76F+R5wWaCA04+nSYVH8I@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9V2O1sQcTs6OgMYWrJcmbcIGID3MgkoFlsNHmQptYKAIdiWj8
	Y9AQk427B0CQfy/OrBVL8YsQQuo2IAHV2H6euO2EnpodtSbwjhXDEq5RCspsnAdLGEQF1VaYzOu
	w8iSsqrzgHm1lZokXTT9t7dHRmArwMgAoBHwZW65yinGv7F5JvJHpYdlJ5GW0s/DU8H3H
X-Gm-Gg: ASbGncurs4tSAfzJ0aXpMrRU2zRovoVGrhFtDv1G3EZdCz4wYuXKyRzqKasXhIxYM8t
	6nNKDNxLLcL1r3C/YmLA32ZFEvXSkVrBMkXNNN3OBTZ+xl7czGAj1X4dfaMT+qXJEjlqzYfMzAL
	6cLG1EyUeDOhM1999AA9NBPOZ0WBUzQioyzZRw6cSmQpn56Qo4ZsF/zYdplY1sKMnO+fjuDXtYv
	qy7VpLD394G/c1DwRaeDIBrUb4VVZc2mxyU1jsyczaCanwoJufEPxq7qAUraPCo3eimEyWOIT/r
	jo7Y4Pt2c9eQtAtymel2svQ0pvXG1Q1Tk3yy2vrLEhmqlYALIW7+gY8Md66ZInfHgHIvvWe7KnS
	8L3c2Z9MIJfsLGGUV3/iiIVJyW6ULeoWzsQaW5l29u0/0q9q/boI1bhIN3A==
X-Received: by 2002:a17:903:15c7:b0:272:2bf1:6a1f with SMTP id d9443c01a7336-294cb38dad8mr15162215ad.4.1761628604360;
        Mon, 27 Oct 2025 22:16:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGCtI/e0xCUDzsunj5pLCq95XvGzaYTPPAgqnYqvKPP49ZjdTjLzgLXq4j89VNN8OjcYuAPA==
X-Received: by 2002:a17:903:15c7:b0:272:2bf1:6a1f with SMTP id d9443c01a7336-294cb38dad8mr15161945ad.4.1761628603887;
        Mon, 27 Oct 2025 22:16:43 -0700 (PDT)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e429d9sm100614015ad.100.2025.10.27.22.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 22:16:43 -0700 (PDT)
Message-ID: <f34c6aaa-f3c6-4171-89e4-9f44da9a6a94@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 13:16:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: display: msm: Add SM6150 DisplayPort
 controller
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-1-c4316975dd0e@oss.qualcomm.com>
 <m6j3sdc4jb2jonzbpez7g3xb6cfputdz34wtydfrx736nqvrv6@o5ntg7csl7dr>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <m6j3sdc4jb2jonzbpez7g3xb6cfputdz34wtydfrx736nqvrv6@o5ntg7csl7dr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JRxHcwLMKEYKMAagsVe7CBfwhsBWrBcT
X-Authority-Analysis: v=2.4 cv=D/VK6/Rj c=1 sm=1 tr=0 ts=690051bd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qjA4-Y8jdfHfWDHiyvAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: JRxHcwLMKEYKMAagsVe7CBfwhsBWrBcT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA0NCBTYWx0ZWRfX5OeGNPo2O/Hg
 8gwR18H9LANgtyqyaRXmmuDOM32T73b33izwbYbDHXmDqrGuO6mt48WgVDxVJ5cBYKTgQa7/ODN
 QK0Nr09awEchieu6KPaZ8YWREYCnUxLitTRqM5Gkhiug1ZFdULySZLrdI1rt72DvQL4x7tts2zw
 BLQkXbDSoXtUFuEnfWM1xTx9NabYNnFQ7677/JRolZ04wy7K/s9QXYVS2r5E0K6LP3pU83T7wj4
 yGeIC8Rswnzq/QS6KRdxTk9wfwY/Tx2SZOf1h4wDoWJiHC/76pieJ85cxEm4okImW9VBmMyqpWU
 wAenslM9W90iIcL1FF6UjAg7KRxGzNdbtjQmGbFC6ne2tuUepUUF/z1hXx/zHmPZDR/DeKWBRg4
 8uiHvhvlX0+p4rIaSAWjf/uZswrtZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280044


On 10/28/2025 2:54 AM, Bjorn Andersson wrote:
> On Fri, Oct 24, 2025 at 01:21:01PM +0800, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> SM6150 uses the same DisplayPort controller as SM8150, which is already
>> compatible with SM8350. Add the SM6150-specific compatible string and
>> update the binding example accordingly.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml      | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..ba0dea2edea98cee0826cf38b3f33361666e004a 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> @@ -51,6 +51,16 @@ patternProperties:
>>        compatible:
>>          const: qcom,sm6150-dpu
>>  
>> +  "^displayport-controller@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - const: qcom,sm6150-dp
>> +          - const: qcom,sm8150-dp
> Perhaps I'm missing something, but if sm6150-dp is the same controller
> as sm8150-dp, which is the same controller as sm8350-dp...doesn't that
> imply that sm6150-dp is the same as sm8350-dp and we could not mention
> the sm8150-dp here?
>
> Regards,
> Bjorn


I have discussed this with Dmitry in message-id 
<20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
SM6150 uses the same controller IP as SM8150 and should fall back to sm8350 for
consistency.

And when running CHECK_DTBS, I encountered DTS compatible warnings, which is
why all three compatibles are listed.


>> +          - const: qcom,sm8350-dp
>> +
>>    "^dsi@[0-9a-f]+$":
>>      type: object
>>      additionalProperties: true
>>
>> -- 
>> 2.34.1
>>
>>

