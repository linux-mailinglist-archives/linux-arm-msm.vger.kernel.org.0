Return-Path: <linux-arm-msm+bounces-71102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46737B39AC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 13:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDD623B064E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 11:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0880830DEBC;
	Thu, 28 Aug 2025 10:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ap71NfQ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6520130DEA4
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 10:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756378790; cv=none; b=XxJWNBrRc5XB79fxQlyEQIkZD/OrL1SkCaV8I4qYqDlb07w4T2DGytdZ5Mjzzwu6by+jVEpR1R0QOu/tDVJh6y2sMgwpF9KxcAfMHcjPBkE+PV3Z1vugPdhS0/btNwlYcKpQkGeK1yZdGgWSxax+rkTfJqIwYquigMvwUyfU6/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756378790; c=relaxed/simple;
	bh=YFpBQDAPplpbmlEZuRqtJgd9SqJ5vf93R9PVYxaJRmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYeR2dKbV05Qif5itKCs9KzGZtReytIJ99nOZwM8ZO4Bx8tQBlo8/k+Q1m5URSFXNcZuxuSOgjWFr1XzK2dnF8I5XNXRSwf8MNqLbrV3D9NxFRNoUhrcQekf6JTiPnTS4nrozZ5h0TyXWNqYzXtaDf3CtKxpnQNI9mZZlLVV+m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ap71NfQ5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5QoWn016089
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 10:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=09leXTKVtloMTscnxlYkAl4E
	C4Rzi1g0wwL1WchT0Sk=; b=ap71NfQ5K5jUDAfi+bXDcK/qtsgDg/YT/SZQC3gA
	/KmdePO0gMNFf0DYCXDBlZ01Q4r3/BNnxqwvJVYQ+29iMRJxb/z/3gD+tHMF403f
	kUb6+RzXWlObGjItyKH0d5umGHD2g8dTHyWC290dsrpIBCd5JUlXIETQpIgy7ZmO
	1ZRlal1ZwMyQQfvteSoPx0Z3MiU/nNh5MtDR88tZlco9Z+VxSxgAvST3rlUNTDtP
	rqRVR59XSbo78R7HHHiV4FYczqvkJSjT9BD4UFdvuQWkDhHWrAVFNLZcMW/Kp/QP
	8JBjIcKbqL4ylLT+L2qZu8DNsfM+D6eJdurDhpTYcrkyhA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpf28f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 10:59:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70dfbead769so2659696d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 03:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756378787; x=1756983587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09leXTKVtloMTscnxlYkAl4EC4Rzi1g0wwL1WchT0Sk=;
        b=Dcn7JxqRlzpArzqK851mcs1Xo5hKcuHbaUDmcs9hulCuXL03n6peYrhwoXjNbfD5hS
         hyUnfkubK4KKd9fi48Rx/MFFbdXtXWcgUURg9EJ2l6c1LFIdwg8mSz2/QVfxxuxyJAj7
         Uriq7Xs+zbnaQmC6c0bewKMGhrqTYb2wxW4IDcN7n2ISlSfoeOZfqzGL0YELHU5kz83b
         D1QUEqXfCd3zzpqACcy6Pr3xUh4ah/EGd1QnhsJE8m1Cj7dQOAu6CK/ZWDPjVONE44Zy
         4RPEjMVGFP6ubcvZa8MFJ7AuCWZBi65UOFubAbsfGDL4Y+atMuAji+IGd43OhJZEM75J
         12LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXthU8W78racmsPfTRGWt4bUTi8dPNLD6PcyjJwg0hOoQRpAd+iXhVAJEwTnerKObyiTco4PcUM6PgVYWl@vger.kernel.org
X-Gm-Message-State: AOJu0YzimTZxMgAzGSXn7O2dJTtM4OAETeyr2lRHDCBpAhTBCT8hGO7i
	wVJ3FW9vhRAz4xybQATyv4FUwgi20aFhQ82ftU9mgCAyeN/fmKfNh5pCIZ7zE2Z+9metD6cJzum
	/4LiPTtqo1YXwEsfwJY8YaaXr+jhlFg3XkPdg46Chgrt5qd6deB3isLKzd7jUjjoP2oPF
X-Gm-Gg: ASbGncuy3zw3GG8sHvhkNxM9aDR4b4jqxOa/N6ltskVVZQcAoHxhVSLd4l70NAx1Tky
	BS5CmfiBTo3/6KTGch3kztDKV0qiu/fsR1hPkitDT9t7qvaspSXStwVZUpd6WoxMVC2ZzmJvMjI
	kw08bWVHSeMlKiEI4um7tI1vNvFmjKk/M5OOUglJsZmsZ70mIQTnq4YYHSNAhIfb//T517OmT7o
	wfFSKMqE9SsoWkKDiJgDIr+VseR6BdvirgthyCIuoIpP7PucmoEsJHqwGDmzGl+b6yuVIvJLWYM
	YceHVBqnV9gQGOClyymFoYsFv9tF1bCbgOGOZ6JxvNS0HWMnxdB6id3ep7eCUoUuwqPpFey6vp0
	QpWOTd9nXzkEbVkBByuk7nIf1D+uSMb2bWlbKIfVLOprwZLy/eAhi
X-Received: by 2002:a05:6214:765:b0:70d:dd5b:34bc with SMTP id 6a1803df08f44-70ddd5b378bmr79863946d6.37.1756378787458;
        Thu, 28 Aug 2025 03:59:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExFIterP9dImItBjYAqD1Xx4x9yddy09PGUubw4yf9+Su69Wqk2KWb9HrBNMXk2uDDsgEepg==
X-Received: by 2002:a05:6214:765:b0:70d:dd5b:34bc with SMTP id 6a1803df08f44-70ddd5b378bmr79863606d6.37.1756378786978;
        Thu, 28 Aug 2025 03:59:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e5aa917sm30826041fa.41.2025.08.28.03.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 03:59:45 -0700 (PDT)
Date: Thu, 28 Aug 2025 13:59:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Message-ID: <vp4shoc6nok6byyrkq34772ag5axnfcugbr6jbdxglazvneurx@u7j36gjp5vna>
References: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
 <20250825-qcs8300_mdss-v9-2-ebda1de80ca0@oss.qualcomm.com>
 <20250828-kind-crocodile-of-progress-6cbbb0@kuoka>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-kind-crocodile-of-progress-6cbbb0@kuoka>
X-Proofpoint-GUID: zG5csA8ej3GC1WrxLWrpbtzP2hRpBQ5N
X-Proofpoint-ORIG-GUID: zG5csA8ej3GC1WrxLWrpbtzP2hRpBQ5N
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68b036a4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Rb9tGRSG334u1UeLp2EA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX1MrixscDb3Bl
 KQE8hyMfYbatZ1UME2VAwApAg6lCLawX/IynrTMhtIVlIZD6K5HAksjI6INuzOqrFXFdB4nuUt/
 Jk6T34jh3GfP/P7yZRc179vbWpVfv25FjNe562nqRCTpglMPcdlEyPGTEo5sIjN7h+jYacagvW+
 0YcguYSpKNQT0a4tPMpt87nXHXGRGvImHhApo3qHT9lcNCFiKhryuGvBsH4TOHIls4UI6IiFNrF
 QAV3fmmZVaS3XqFv/DhhOdt2XkZACh5m6TGh7k2Op7BjA3rU35mJlhF6+Dee8vZ+2gpToTu55ci
 FOInIbC1lggnhP6iLUhaHwBDoEbiEaHrIfoAfR2wmWSJ0VwFj9DVqXun1Blv4fvIfmO4GppNZC+
 ivbhhkk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142

On Thu, Aug 28, 2025 at 09:36:24AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Aug 25, 2025 at 11:34:21AM +0800, Yongxing Mou wrote:
> > Add compatible string for the DisplayPort controller found on the
> > Qualcomm QCS8300 SoC.
> > 
> > The Qualcomm QCS8300 platform comes with one DisplayPort controller
> > that supports 4 MST streams.
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > ---
> >  .../bindings/display/msm/dp-controller.yaml        | 26 +++++++++++++++++-----
> >  1 file changed, 21 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..4da22a211442b7abe2dc18e769d8fd14d224eb40 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > @@ -18,6 +18,7 @@ properties:
> >    compatible:
> >      oneOf:
> >        - enum:
> > +          - qcom,qcs8300-dp
> >            - qcom,sa8775p-dp
> >            - qcom,sc7180-dp
> >            - qcom,sc7280-dp
> > @@ -179,6 +180,7 @@ allOf:
> >            compatible:
> >              contains:
> >                enum:
> > +                - qcom,qcs8300-dp
> >                  - qcom,sa8775p-dp
> >                  - qcom,x1e80100-dp
> >        then:
> > @@ -241,11 +243,25 @@ allOf:
> >                minItems: 5
> >                maxItems: 6
> >          else:
> > -          # Default to 2 streams MST
> > -          properties:
> > -            clocks:
> > -              minItems: 6
> > -              maxItems: 6
> > +          if:
> 
> Please do not nest if:then:if:then. It gets unreadable very fast.
> 
> I don't even understand why you need this. The code does not exist in
> the next, either. That does not help.

I picked up the MST bindings patchset, so the code should be in linux-next
soon. It already contains nested if-then-else which defines the number
of MST streams available on the platform (R-B'ed by RobH). If you think
that we should remove the nested if's I'd repost the bindings series
first.

-- 
With best wishes
Dmitry

