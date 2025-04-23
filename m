Return-Path: <linux-arm-msm+bounces-55154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CA9A98CDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 16:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5837F3AEB6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 14:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9206827D76A;
	Wed, 23 Apr 2025 14:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kP9i0Uk/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD80327933C
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745418219; cv=none; b=u4DYqogOzQz99xrtf9Y7/8GbFw6IAVTvCzOcp/ZQ41MxuD+OB0lZCA7UiBFrIp+iXTH5VLOKPJdvz0BJMMjfgpeAVqbwPM1iRlQwoPsAvnHM8J5MP6Vjvpe/cOJG8T7Q6DvotfQAf8s/b1GSegWz8/1ys7yBvWuXdqO2UYqkrKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745418219; c=relaxed/simple;
	bh=15yDFj579bgxhoboYMjaC3khwqKrVV8H5UjwCkBWqiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prmND5QHHePn85u+Ovvh0ML9aNjTgZtZPO38rDJpzTG7hus6SNrn72c8eQgbsalBI5jUe2XvL8iux1DqxP9y1UEFcv081L5Olr8ANDOMmk5022+Vriyd/IQqkzqG74F9CL6Vim44XZXHm5Eig9rV6lRZ89mrIAcg9uNKV6wsUzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kP9i0Uk/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAF8Un008503
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HN13lzHJhjhAHQ7DzaU3+eE3
	OP7KRXOmcYjBHTkaM6o=; b=kP9i0Uk/AiiAAopNcloHUilfAZz8tMkN1knh3Y/Q
	fZ5/GBH+8ruzKSyCyB6L5XaIIzCd26zcL/Y43QrzcF5pUaR3wTuCVdwQEC5Vocfk
	BPV5l26tUD7xwuJuu8PeJ2YE2if6mIVUBzBpJw/S1SI7SrBMZPMs/rcv+OoNCWnQ
	KI2u50KE9E2FrjAhEBmQHfRAuq59U5aRTjO5C6IPfGNkNypecf5+SZCVl3zXQWP4
	wGYaMsLyMbhnTcOGnevgryvXO1zgJR47MOBRNZ3HRQBgrNgk3MUQY/GbRvrQBLIF
	c8tkqCHNUBmwJt3RdDTfBElz6VvXNy623auGQgEsX7fv0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5adbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:23:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c9255d5e8cso973906685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 07:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745418215; x=1746023015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HN13lzHJhjhAHQ7DzaU3+eE3OP7KRXOmcYjBHTkaM6o=;
        b=Pls53a0u86S5RnljtqDv1fpR0OXo6OdR7y76z2Z86gZg1OSQy45KKgrpQQ/zcltYKa
         9HcvEg89dp6yON8Ea9D8wusvRpl2M3GGqgh6wAlUQKXds+5g4dfNbHAEz9mMw5RCOGJG
         skQMHYVI90E+MFVvcHtYR34W7VNNC04XojUL7/5A73yooIy2NmADHswJs7oY7s5+m9s+
         a+Jm0ZT+grEVSkwsW3742Yg4vLNZN/B/1p986xAUzUrbIknSVK6ncar9VZrzQp8Kz412
         uLsW6cH2wt9BvuGPHc10sgeDQoGhyKICsdYF/A0auANGQvszF/Qk43IaYdfousM4hdKC
         jDlw==
X-Forwarded-Encrypted: i=1; AJvYcCWmGeCaW1JGnSuYYf1/AweycuS+DxA56z/kEbbF5BYj0b6EuAUF4d7kI3Xj0kf3L7ZvBaxAGB73vUP+133N@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpc61XrzwkFGHtJv4fVuRL3z3gqOEd/m+nSdHmgcHOOtK7oj1o
	phXYEe9JIx6kx+euBAcdaniz8sP7uZVlmYcTrf1Kw415DTw3hNZnYh6As+PE6ipf2OGZ1sZ77b1
	9vfLtP++pp8lCUZrh7QpwogjouJ72Jz2V52a0XxnOfmr7nvJQoGfe17gXp7/7SU1/
X-Gm-Gg: ASbGncsvNr34pcuvJriOJCV6aTXSZGOVpA7MAqykDGFWAlYXXXkPgDqwPziwout3WO0
	qDWPrgtuGZAT620eEhy0JE1JdHas1lS5L0WuJTKp1Yk+QJ73mFX3NFYNwuDeTMw3sHaXzfVbQdD
	IVYHUEFehjtb1L9zIl0O9aa69l8QTmhOkAsRLbekbCRl2cgnbTz3oD7jLuGau0ASRFVUAbErKR9
	Gnca2yu6eV8ZBI5e/9sMtWM2twnX9cpK6Zrlr3sZgKkPcg1yIyEVQ4AqtLbJB3/XwRuHbH/Mg1d
	HS/JM8ArXYV5Yep+RmU0rIRLPrVOOHNGqYrfm6Sn+nYlTerhoLekm4oUeL8PssUhYWk5C/SDxfw
	=
X-Received: by 2002:a05:620a:3184:b0:7c5:65ab:5002 with SMTP id af79cd13be357-7c92805e97bmr3832036785a.49.1745418215629;
        Wed, 23 Apr 2025 07:23:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYCQwVaTtgeAr0Y2QsW4Y61GBBb5WaCrUzzlKbngnnQyJ88rtPHEhSHsXxrd8l2Zzdb7e3JQ==
X-Received: by 2002:a05:620a:3184:b0:7c5:65ab:5002 with SMTP id af79cd13be357-7c92805e97bmr3832028585a.49.1745418214974;
        Wed, 23 Apr 2025 07:23:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310908639b5sm19424941fa.112.2025.04.23.07.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 07:23:34 -0700 (PDT)
Date: Wed, 23 Apr 2025 17:23:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: display/msm: add stream 1 pixel clock
 binding
Message-ID: <2m5fq7whbvaq4sbbxittxhbksw6erfotlwalrfevujq4mrt3kk@ctbgwinz2o72>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-3-9a9a43b0624a@quicinc.com>
 <edlw7grqy74rihy5jw5t2krcyfn24c6b2lfxht4b52wx6fvck6@pqeqrbnwtsf3>
 <0101602d-0434-47ea-8957-471c4ead100d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101602d-0434-47ea-8957-471c4ead100d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEwMSBTYWx0ZWRfX1G9M+Y4rhwiP ufpb3p8kqy3mregATMdtNq0+TlZYO5ptIVcj1TIQQCi+VroNuz0j0lKhR6KCiPamgp1HgvDrX6E JltVltdwbsFM1a7EHzDAqRUIAv40fjdrlamb+KTINcxcrRuJa8kUXnYopxEA5yIqnyNj1zeNF1K
 jTEW2FiKTa3Q/HziU3gd2VSFknCgN5HjEwEyXVAGN89xevddIblsbvxYKN+cP/9eNKgv//DfBvj sgvV73mP1rVrfGi3g+hyhybYwMdUE9WE1qsD6EVD5iAxUXU6hSqK3g+jpSVFM3bx1eV4nJyIxi2 oS+kqlj7N4lcfTPJN3XR09aIQLKg1KEP/09svI6EJzgRxdnDYr9qX32Gz5EXcmfCaNmI/mF812o
 S9/sS3yMnSC5bmOZ8AXDMvzWVcYmyStLHZCLqgAw6TVd2Zx9ye00isk4ki2Pg5FsyXSjuBk6
X-Proofpoint-GUID: qB7F3ssqyxmLmFXShwIjYasOzq2EQb4_
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=6808f7e8 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=yirWvuRTZ6qJcAQw2TYA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qB7F3ssqyxmLmFXShwIjYasOzq2EQb4_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230101

On Tue, Apr 22, 2025 at 07:46:57PM -0700, Abhinav Kumar wrote:
> 
> 
> On 12/3/2024 5:43 AM, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 07:31:41PM -0800, Abhinav Kumar wrote:
> > > On some chipsets the display port controller can support more
> > > than one pixel stream (multi-stream transport). To support MST
> > > on such chipsets, add the binding for stream 1 pixel clock for
> > > display port controller. Since this mode is not supported on all
> > > chipsets, add exception rules and min/max items to clearly mark
> > > which chipsets support only SST mode (single stream) and which ones
> > > support MST.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   .../bindings/display/msm/dp-controller.yaml        | 32 ++++++++++++++++++++++
> > >   .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  9 ++++--
> > >   2 files changed, 38 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > index 9fe2bf0484d8..650d19e58277 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > @@ -50,30 +50,38 @@ properties:
> > >       maxItems: 1
> > >     clocks:
> > > +    minItems: 5
> > >       items:
> > >         - description: AHB clock to enable register access
> > >         - description: Display Port AUX clock
> > >         - description: Display Port Link clock
> > >         - description: Link interface clock between DP and PHY
> > >         - description: Display Port stream 0 Pixel clock
> > > +      - description: Display Port stream 1 Pixel clock
> > >     clock-names:
> > > +    minItems: 5
> > >       items:
> > >         - const: core_iface
> > >         - const: core_aux
> > >         - const: ctrl_link
> > >         - const: ctrl_link_iface
> > >         - const: stream_pixel
> > > +      - const: stream_1_pixel
> > >     assigned-clocks:
> > > +    minItems: 2
> > >       items:
> > >         - description: link clock source
> > >         - description: stream 0 pixel clock source
> > > +      - description: stream 1 pixel clock source
> > >     assigned-clock-parents:
> > > +    minItems: 2
> > >       items:
> > >         - description: Link clock PLL output provided by PHY block
> > >         - description: Stream 0 pixel clock PLL output provided by PHY block
> > > +      - description: Stream 1 pixel clock PLL output provided by PHY block
> > >     phys:
> > >       maxItems: 1
> > > @@ -175,6 +183,30 @@ allOf:
> > >         required:
> > >           - "#sound-dai-cells"
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - qcom,sa8775p-dp
> > 
> > Why do you need an extra platform conditional?
> > 
> 
> I expect this list to grow and also there can be chipsets which support 4
> streams as well, so an extra platform conditional was needed.

Ack

> 
> > > +
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          maxItems: 6
> > > +        clock-names:
> > > +          items:
> > > +            - const: core_iface
> > > +            - const: core_aux
> > > +            - const: ctrl_link
> > > +            - const: ctrl_link_iface
> > > +            - const: stream_pixel
> > > +            - const: stream_1_pixel

You don't need to ducplicate the list. Just specify min/maxItems.

> > > +        assigned-clocks:
> > > +          maxItems: 3
> > > +        assigned-clock-parents:
> > > +          maxItems: 3
> > > +
> > >   additionalProperties: false
> > >   examples:
> > > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > > index 58f8a01f29c7..7f10e6ad8f63 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > > @@ -177,16 +177,19 @@ examples:
> > >                        <&dispcc_dptx0_aux_clk>,
> > >                        <&dispcc_dptx0_link_clk>,
> > >                        <&dispcc_dptx0_link_intf_clk>,
> > > -                     <&dispcc_dptx0_pixel0_clk>;
> > > +                     <&dispcc_dptx0_pixel0_clk>,
> > > +                     <&dispcc_dptx0_pixel1_clk>;
> > >               clock-names = "core_iface",
> > >                             "core_aux",
> > >                             "ctrl_link",
> > >                             "ctrl_link_iface",
> > > -                          "stream_pixel";
> > > +                          "stream_pixel",
> > > +                          "stream_1_pixel";
> > >               assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
> > > +                              <&dispcc_mdss_dptx0_pixel1_clk_src>,
> > >                                 <&dispcc_mdss_dptx0_pixel0_clk_src>;
> > > -            assigned-clock-parents = <&mdss0_edp_phy 0>, <&mdss0_edp_phy 1>;
> > > +            assigned-clock-parents = <&mdss0_edp_phy 0>, <&mdss0_edp_phy 1>, <&mdss0_edp_phy 1>;
> > >               phys = <&mdss0_edp_phy>;
> > >               phy-names = "dp";
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

