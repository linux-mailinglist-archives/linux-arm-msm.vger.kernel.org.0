Return-Path: <linux-arm-msm+bounces-72706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3369AB4A5E6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 10:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFFF54E3FF0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 08:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4531D2727EB;
	Tue,  9 Sep 2025 08:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8Sd18PT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858292586E8
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 08:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757407684; cv=none; b=HVz8smEA8lbtzcAdAGFXsuOckfgs3qc5wx8kzMxjZlEuIAjH14u6TMAwZZ5M0/BX0qao63rdbh91DKkgxq2/CeAxZQ+bxe5NalQ7Jo0MhOcNBUaMBVHc9U3swIE0VBiNxqn07nqSKS8wOCynwTv0da+PFFN9VrnEspFzBFUv6M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757407684; c=relaxed/simple;
	bh=UAxLOwoumkc+BYNbc7dD5zqL0NY/zwNwOjcx25wNFMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iytdlCh3/BDTtj+XQpv3vp8PaHVSPJ+Fo9sGuo4zEzw5xO3epHuJqJ+NnFRyGq8NZqPIGxlXPRXlBvvZQrXQ21XaA0Fy1VaMnYhxQgipPy/EVc5xJiOYUz0l4QZpCsMlaKj9o6cCmdbM00aI8028fMa6F3kahJwsBo40ufNjn7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8Sd18PT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896SlNq027777
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 08:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KZymnpnmhs5B0YBDAMI52uZ/Inhmlk88lRXrLORVF+c=; b=L8Sd18PT9GCr920+
	ktTKgAKJQX5h6vBy+sqlOJNBCDze1sMH2MMPgRohQ+PbHRjhYHQiqI6WaKX1OVg5
	ov98vj2OxCFx9qeAMpFZfXr1I/lb3XqswZevZFG5/Oyf2lETMkP4lrisRPrywnz9
	N65bYaQFOkA+c7/KwB6NkHXt9iVDIjGaitmTLQw8qbwT3mfvxTuLQTHsaS3HWgOm
	HXmiSz7ZH2Gxef3Npo13I7+Bsr/FyZSBm89kUM+W6kQ+TCnJCP3yWRE/fHb0GN+B
	XayvryN7ECaB19spRXGKWF4NbYALDOED+W1rC4iFhOtxI58kyOy8bmLyxtNhqU0X
	Y2iP8A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j7nu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 08:48:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24cc57791caso14319305ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 01:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757407680; x=1758012480;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KZymnpnmhs5B0YBDAMI52uZ/Inhmlk88lRXrLORVF+c=;
        b=TjUvTCedKzNUBqFzTN06SbaPA37d0zjfauKAiXt7JW79XafE38lY64tolOXRsgGsLz
         Wbp2SG8cQdPh4ZOps0yWTmOC2xT5ip9v/3NwqeGkuZFo6bKE0m3EENf8XWkNTZ6mlA4g
         jeKz+ybrM89PJVlPmDIaE/+13JDQabUOIgGPnxLO1HZa5s6dNNBR4erAOytNvCAncHmU
         28lERdJRQqmXIQOmg6L8xUY1QDxDLwbB5j+7YKKQy9ZujSw3NXBZsoPhMl4R91BigJ1o
         9n75VejSD4LRYfY0j+LLnnpcA+n7eyBG3+CE3tg0Sq9D1a+U3YxP9OxVo0taNFYrd8qg
         DNlA==
X-Forwarded-Encrypted: i=1; AJvYcCUnrlIMfePs/qWLlz3naeEDhTBXCqSnoaZR07z5WhRyGl2gaoY8E2m4yV4cu+yX6txQ0q4nMIff2W8B8Yva@vger.kernel.org
X-Gm-Message-State: AOJu0YyKOSnnBVFSsvIVVKtMMmX6RODcTnLfGcpm5Wpl67zvMqZvdHMW
	r8KceItiXnkDAcAbx+oSjLFfMx7S2ZTwcLO2LMpYBDROcts/DrJLgaYJVxVsQCcmDW/mYLsOAPw
	X7MJmP4mNUczGwchRHGZp4eYzsb9SkSwFh5H7+8zXDuU1Xa9elx1l1n/KbQ+TWSRrHIA9
X-Gm-Gg: ASbGncv/FRaKuQxgq7IQKMk7Rz6y68J/xtkbV97x0My3KP5d0F3vx+tnBSkcIipUcxv
	ZbBc+9tErGxmeUVzYXuISSrmq/vnXZe4kUKp4x+2r72jM63EMfXUYylNwguQoyG4lkKUITFy6Ew
	i6Ghb59gmKrWe4RVKcO9jmJyg6skSyjl89gHQrnD+agHtT0Wf5MNxl08S0I7STRgvy2bCcO1rKF
	Qtyk+h7jgXnV8+npELiK8xA2w96E4wJ5zKm7Qh8V8wtoAikclcOl4SZAc+j5J/nA6kYiUIncjoQ
	/WkBebpNAkzl/1mdn5DqqOlIYFDeIHq1THCLuo0Z+u984dIYMDX/1poSOTH/8+pd8It9aeVFlzc
	dGr5X2gLr2fWQXJJ1RKuBjkL7RN0Zlw==
X-Received: by 2002:a17:902:db04:b0:24c:b39f:bac2 with SMTP id d9443c01a7336-2516ec71a55mr86020435ad.1.1757407680140;
        Tue, 09 Sep 2025 01:48:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGcPEO4ewq8vPdRBMjUnVoQbZofkFK2H8oWkKbHPow7Vq7zP3XFvEVLEjwbhoyUbsAwksJ8g==
X-Received: by 2002:a17:902:db04:b0:24c:b39f:bac2 with SMTP id d9443c01a7336-2516ec71a55mr86020095ad.1.1757407679630;
        Tue, 09 Sep 2025 01:47:59 -0700 (PDT)
Received: from [10.133.33.137] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24af8ab7e7bsm206214375ad.138.2025.09.09.01.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 01:47:59 -0700 (PDT)
Message-ID: <48a76d34-b748-43e6-8a2c-bebc8095478d@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 16:47:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
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
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
 <xurpc3mk5kksx7lfpsdqgasov5gc4dpsmz6iv2hjhsp5tewbue@dvrupbjzgxle>
 <c4eeb8a8-2819-4ac5-8dc1-cce209d7cbc4@oss.qualcomm.com>
 <3zi57uvggw3zgrj4bfouzjnf56yywjnw46f5ru7krihyrw5bkc@c3xf73ianksa>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <3zi57uvggw3zgrj4bfouzjnf56yywjnw46f5ru7krihyrw5bkc@c3xf73ianksa>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX/DaYGpdGIL4f
 Zr6cCAhLBeuZno7mKzYTo0+YixCH1QmYh6ln2BDqZzPD+F4O9SADJGw5pcxlQFOz/8gvceFAQm2
 5J2hq1PFLU8jpJ6nL1p2Wt1fD/HiRUa6DMKJS8a7ob9JJlCOYbZmtxC1UPuglHta/ZGcrjzLmi5
 nwA8oTSaQxNQcIsj3tMfHNq8tkmXxPK3wur7BDQ4clVeK8CxFgvTcs2wUldl68kBE2JM8VUTtfZ
 jscJfAm917cgV11eLPZF1+aPTaD3Gdo880DdIWMwRMI4pw9N2BRINv/IM2tlgg2KOGyse+D2TED
 Ng0QvKF6Y7DN08eGRG70lyDmQYUfHyo5v098N/3qTdLQGmeK7qLEtqEnnXNAIDsUMbTDQY+VfhF
 4BLM6VEp
X-Proofpoint-ORIG-GUID: DCOPQDZqKqPvI0csUmOivnHmg94hOg4T
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68bfe9c1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0xAmN0HNA53ciqJMUUUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: DCOPQDZqKqPvI0csUmOivnHmg94hOg4T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022


On 9/9/2025 4:45 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 09, 2025 at 04:39:26PM +0800, Xiangxu Yin wrote:
>> On 9/4/2025 8:34 AM, Dmitry Baryshkov wrote:
>>> On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
>>>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>>>> While SM6150 currently shares the same configuration as SC7180,
>>>> its hardware capabilities differ. Explicitly listing it ensures clarity
>>>> and avoids potential issues if SC7180 support evolves in the future.
>>>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> @@ -27,6 +27,7 @@ properties:
>>>>            - qcom,sc8280xp-dp
>>>>            - qcom,sc8280xp-edp
>>>>            - qcom,sdm845-dp
>>>> +          - qcom,sm6150-dp
>>> The DP MST bindings were A-b'ed and R-b'ed by Rob, so I picked them up
>>> into msm-next-lumag. Please rebase your patchset on top of it and
>>> resend. At this point I'm interested in DP bindings and DP driver
>>> patches, the PHY part can come up separately.
>>>
>>> As for the compatibilities, I think DP on SM6150 should be compatible
>>> with either DP on SDM845 or DP on SM8350. Please choose one which suits
>>> better.
>>
>> Sure, I’ll split out the DP binding and controller compatible parts into a 
>> separate patch series.
>>
>> SDM845 seems not support wide_bus, while SM8350 looks closer to SM6150.
>> But I noticed SM8350 is still configured as SC7180 under dp_display in
>> msm-next-lumag’s top, so this change will mainly about the binding, right?
> Yes, it's only about the bindings for now. The driver support for DP MST
> is still WIP.


Ok, understood. 

Will update next patch.


>>
>>>>            - qcom,sm8350-dp
>>>>            - qcom,sm8650-dp
>>>>        - items:
>>>>
>>>> -- 
>>>> 2.34.1
>>>>

