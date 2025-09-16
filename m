Return-Path: <linux-arm-msm+bounces-73703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12482B59562
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 13:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEFC23ADA7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 11:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13516305E1E;
	Tue, 16 Sep 2025 11:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+aYzdaW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F752F7ADA
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758022646; cv=none; b=WzNe85sVsb/203j2Llo4FkR+DppNEWDPIjJQaUFS5QAkhcCnKqv0NyhNDeK9hQM2MmT0Pgo7MuHwyGWraGOhJGFcO1hxoXQxQS2dfrkTEDxdT7E7OdPBXSmegA9mj+y+fO0SB5Z3/zCnR8M4MJdUtgwMmWW9ONGHsr/Cajpy1do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758022646; c=relaxed/simple;
	bh=Vwduwzie+cauuYdZK4G05pulUPijtIl6z5CkSlMro1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzzQBeFcLNpcez6HhYMlDdqCCKsUNZxhAy7GSSW7B62jRASCzwm1ewnBoCv8arXNauO9AH1NLJP815aWPNG16abcaX1/AbPzJOtjCCktFcPXtd1V2T88CvsenDg7ec9C4iwv70ZJjgibqxTyM1xH/MjY29O6kZSl8mwnlbt4IpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+aYzdaW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G9vduB010593
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dxuG3uBlvh++1t244lhPvOvJ9hQr+cTrRHwr2AleVfc=; b=R+aYzdaWE7qzBzkZ
	3r8dVPKPTpL4moVEc6HwWBv+qSrCNTLvNl35lEKrn4LUghk4F4fzy1PjdnTK8bda
	JeUCewIXSOp536KIXjizho3QyHA+2pkQLBkXUfiFK/kc2u4hwGfgj+sHV5crylVN
	yMpub9dvQ7B8Ag4DRg7j7LwqiYcD+gf8d42lYs1WKnSdRWaAAay0wq9Jh9tD2GLz
	IRBxuf3ptYHZc+ZjtYO51t5H3L6e5WTqYPg6SNhN39/Ht4sNWMzc8COFC3tjZh3L
	ASai/UdeM6K+dhaBPWT16P5Z7ip1DXt1ZbWyOTb7ze3moEwyMtpaIg16pc+8Su3M
	iH7R0w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951snrgct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:37:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7721c5d874bso57686956d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 04:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758022642; x=1758627442;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dxuG3uBlvh++1t244lhPvOvJ9hQr+cTrRHwr2AleVfc=;
        b=vhYK3CtVMK/O4GZjla/cJWFggL9iXncw9mpuqPzz5+fklLKdNWRHfgrXK0eF3h/RGI
         NDDZgQK1tup/dY/dtULD0jeWwcbjXDDbmFHBkca3NWBJYxyr24lzqwbh63BvWEbqoZml
         DuMC/paDrB5rWIaBm1e8cOPLXBATaxuvJvr/ea5NYD8gZSCrK6Ie0IKIDJcBrR8R8GNx
         DyeOfTKbhD1V6eTIYKcemSBLDHfjoy+KGvcY1ZzPft35X98kRmluysjezMq3mZ+TPu6W
         rhrQx+mNhHKEI9QUhhlGUXHD9KwM6O3PXJmjqjTjCUKhr2nlti1Zi6bQQrf/7udqAa2R
         x85w==
X-Forwarded-Encrypted: i=1; AJvYcCWr5A7hMtzzUiySaFUjDQe5KZHLZ6MsG+aNkK6sT0etmFtGIHI0vL0vm9ihZ3KDYGRP4gNuq51NEUkJZS18@vger.kernel.org
X-Gm-Message-State: AOJu0YzEWxZAMByxX3J8sooA6MUTxa8Y+nlFA9oYe+IUJFo+hExfSjZ3
	VNzPq3eCymdJNWzhMpIy6izVBrNbzoHsiMuLYpdfTLwVrxNswTNSS8oWhzAnPLjzBDDWF52zII+
	7Ln1LlkKUGaiU0LZ8zmS/XUxE71UWTuOJQ+r+ZxgEXJXD+BctonJO7u9fRcWxZ51PuhmI
X-Gm-Gg: ASbGncs8yf6Bly5zA3DZkM7o3ScFnsXAJRkBnOif5DndQz8f4IFp4aOt9/Zj+u+pM4A
	6jgD/W30mCEuvcsMn5XyvspTgBw8rFtH/kBcoGSOEesRMic5wOJVRoEN843uWisIVPb2g+bnzp4
	IXp44wANFUM9JsGOrxat1zlRr7IsgKfJUwgC3R1HRK4ydRGMVRBgUkpkHXM9KcgKoAshSx+7++w
	mhyGuW5d7atjX7m5jaWoBMnlApY7ajZjJwNbLfh6mfzYodVUfCTPgahCY1m9BWND8pH5ewcDP/n
	8M0UjZO19bL3K9iY9O48PTC4yF/+tmKuq6P4BZJcdAtW6I2TsCLmb2EKVNmPzOQjwiIpKKFPO0A
	sEvesTiVdh87XXpqAjf+kBoVPJxDea5+U3CoAnNcVfGUXpxV36R7u
X-Received: by 2002:ad4:5ded:0:b0:72b:5e4d:d41e with SMTP id 6a1803df08f44-767c69580d5mr201008036d6.60.1758022642176;
        Tue, 16 Sep 2025 04:37:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxRVjbeGA3MMhK0y7Gk1lUdDnWFrfIP3SLf3A/hUrKPUgKEZcoUaquPXGhgx/yv9i67CvOTA==
X-Received: by 2002:ad4:5ded:0:b0:72b:5e4d:d41e with SMTP id 6a1803df08f44-767c69580d5mr201007116d6.60.1758022640778;
        Tue, 16 Sep 2025 04:37:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5cf300b7sm4379319e87.45.2025.09.16.04.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 04:37:19 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:37:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
Subject: Re: [PATCH v2] dt-bindings: display/msm: dp-controller: Add SM6150
Message-ID: <qnsxykukg3kigfiihdrrjkp6sbm4qte6lsga3as7eg3xaodtlt@skg5tcp4htii>
References: <20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com>
 <5sg43rsun33i6bm3vz7io7yx2p4m7bmk5bnrnjg6u3zrulyofs@gyxtnfs4gvhz>
 <d302e71f-19bb-426f-a7df-c0d7854e97af@oss.qualcomm.com>
 <67a06487-001a-4af7-83cd-e9d05d848479@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67a06487-001a-4af7-83cd-e9d05d848479@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JO87s9Kb c=1 sm=1 tr=0 ts=68c94bf3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Cl27WJnY82uGaOAjgZAA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: KnRRTm_ITwxu1zWPAISDLpNFwKqBWG-c
X-Proofpoint-GUID: KnRRTm_ITwxu1zWPAISDLpNFwKqBWG-c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MCBTYWx0ZWRfX6tjEn5Ww2cFa
 iPtQmZtTdU+Qsfq6x9pyyM3CuwUZwka1G+Lad9lfFpbE/pLIhE+vnhSa9Mljv9RoXe8tXGJqOdI
 uUAecPAgGIjPBqqIpJ1oZYxA6zXsZsCvaW1w9c3y4GKOkHNdgEcG5P17US4LvE9ERqgRJk4bM2t
 ivfTt5x30UOfEKa1EzDWif1S6reCMJi71VUZyYP/vyFzMNLdx5Mv6jpdpglCzJlOo1nnpicPxXq
 iLGKQDqbse+4UxQF2Ss/gItFzg/djVKNPQVFNTgBwg8ej84HV9KrDqpjp+JCf6mzUMF54v8gRYA
 FLeQB+S6ud2Njt/eBdOXu+FRB/y7gwzH81x1ENKhvflMGY5bYOCs5KliGfdmHk3aVgNujcS03IF
 QIV5bmKD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130040

On Tue, Sep 16, 2025 at 07:34:52PM +0800, Xiangxu Yin wrote:
> 
> On 9/16/2025 7:25 PM, Xiangxu Yin wrote:
> > On 9/16/2025 6:22 PM, Dmitry Baryshkov wrote:
> >> On Tue, Sep 16, 2025 at 03:31:35PM +0800, Xiangxu Yin wrote:
> >>> Add DisplayPort controller binding for Qualcomm SM6150 SoC.
> >>> 'qcom,sm6150-dp' uses the same controller IP as 'qcom,sm8150-dp'.
> >>> Declare 'qcom,sm6150-dp' as a fallback compatible to 'qcom-sm8350-dp'
> >>> for consistency with existing bindings and to ensure correct matching and
> >>> future clarity.
> >>>
> >>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >>> ---
> >>> This series splits the SM6150 dp-controller definition from the
> >>> '[v3] Add DisplayPort support for QCS615 platform' series and rebases
> >>> 'dt-bindings: msm/dp: Add support for 4 pixel streams'.
> >>>
> >>> The devicetree modification for DisplayPort on SM6150 will be provided
> >>> in a future patch.
> >>> ---
> >>> Changes in v2:
> >>> - Update commit message and binding with fallback configuration. [Dmitry]
> >>> - Drop driver patch since SM6150 is declared as a fallback to 'qcom-sm8350-dp'.
> >>> - Link to v1: https://lore.kernel.org/r/20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com
> >>> ---
> >>>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..82481519005a1b038a351aa358b9266239d0e8a9 100644
> >>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>> @@ -46,6 +46,7 @@ properties:
> >>>        - items:
> >>>            - enum:
> >>>                - qcom,sar2130p-dp
> >>> +              - qcom,sm6150-dp
> >> In the review to the previos iteration I think I was a bit explicit:
> >> "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom-sm8350-dp". You seemed to
> >> agree to it. Now you didn't implemet that. Why?
> >
> > Sorry, I misunderstood your previous comment.
> > I thought the recommendation was only about the commit message, not the
> > binding structure.
> >
> > Does the current implementation mean that qcom,sm6150-dp and qcom,sm8150-dp
> > fallback to "qcom,sm8350-dp"?
> >     - items:
> >         - enum:
> >             - qcom,sar2130p-dp
> >             - qcom,sm6150-dp
> >             - qcom,sm7150-dp
> >             - qcom,sm8150-dp
> >             - qcom,sm8250-dp
> >             - qcom,sm8450-dp
> >             - qcom,sm8550-dp
> >         - const: qcom,sm8350-dp
> >
> > Do you mean modifying it as below?
> >     - items:
> >         - enum:
> >             - qcom,sar2130p-dp
> >             - qcom,sm6150-dp
> >             - qcom,sm7150-dp
> >             - qcom,sm8250-dp
> >             - qcom,sm8450-dp
> >             - qcom,sm8550-dp
> >         - const: qcom,sm8150-dp
> >         - const: qcom,sm8350-dp
> >
> 
> Or this?
> 
>     - items:
>         - enum:
>             - qcom,sm6150-dp
>         - const: qcom,sm8150-dp
>         - const: qcom,sm8350-dp


Yes

> 
> 
> >>>                - qcom,sm7150-dp
> >>>                - qcom,sm8150-dp
> >>>                - qcom,sm8250-dp
> >>>
> >>> ---
> >>> base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
> >>> change-id: 20250916-add-dp-controller-support-for-sm6150-525ac2ed8c86
> >>>
> >>> Best regards,
> >>> -- 
> >>> Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >>>

-- 
With best wishes
Dmitry

