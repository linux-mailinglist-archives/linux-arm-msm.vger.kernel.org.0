Return-Path: <linux-arm-msm+bounces-51716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BD8A673B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AA733B6335
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 12:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D552B20A5D1;
	Tue, 18 Mar 2025 12:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OmFSr/yi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628F820AF7D
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742300350; cv=none; b=rIOOPTaviDTCtuUScd3KAWivUVdhRc+nd/vYl9Lx2fGvMqkHsyX8cipwX2xgzut5miviMmhNHTfnSxqeRvPEbbNQvgv5K/rYBKxkVDHzkUlwDbpRSa6eSyMKH6+qa1hZYdYI63I0U0lH+K02zmDqMiUHdf10Ud6RPQMGFfH0ZdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742300350; c=relaxed/simple;
	bh=jMGxlGOnVCgIGPCX5WEfP8ImSD+e2Ry0iWEeWu1bmvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fofcx9Pi3W87RkiUwnp9R0SU66NYWEH8ZvXZZo89/UwOO2Vw5ywGOEL/maeg8GulzW8jJYFaHouReWGmQ1/FyOvjz5wKY5RZlbkUJK3ZQsf4eltI6hnKdDDM6gz0LL9/EBtn2SugK9twoB2wxl0398c6pi6yEu81LzYU0qyCLE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OmFSr/yi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAaWh3028624
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hILqfklUi9PlGDk5cSktWHoM
	g/OfnafokmfjRW4bYAE=; b=OmFSr/yiZh9e8LVMgaM1dN/BUH35vbio+fXb6R+W
	d91HTV21fp44jHQ2j/zv0s5JZ7i5Y7rApUEXJFwwy5ez8nHhv01tMXVV9X7/VXq6
	4jpTQjaCgszRbXTaBgFcrJGpP2CS2ToxrZJsyLxaygvuCaYlfsYBwD29BW39h3TG
	7We9Xekrmq0UONcUsFd6IJg2X2083C8kYFelNlucCjI9zl0pcr4HwN/uj5SBCX2K
	t6zmhwdXCjQ53SRAOWJ8JlNV1Yg2zVYhgCxgXRDAIH9V59TpWdI6kvUkYX2cHh7L
	6Msuh+7r+5UTonzy+UjbV3v6oivKh6ATkdj+loO6zSczvA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwthrjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:19:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54e8ad9b3so1168638185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 05:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742300347; x=1742905147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hILqfklUi9PlGDk5cSktWHoMg/OfnafokmfjRW4bYAE=;
        b=pjkYIEwNtMU/ZX1Yl8ZMxxDbGhxF4/kodjolYVpLDYPHokbmOyCz/7/RXOBWWTQ8zU
         iE/CvAa5v4TWCKELTNdBXA6lTV3pnof4ovl7HZILP+WlU9JZSRZqfeaIEsBClH4wVV/a
         VnxIRpsxLNaMIApkx5AXVcfm6bQy9JVlARCI9WNfHusNY+HvVPy9TEA8zovPra1zdfYn
         gRSpQJMUKyLL9lzG7fHW9TXMRxqPYOc0+b3nlrih1YCmAFiAzLHAb/43h1v3lLJ6drmD
         BiX30Fheknclu+T0ZD0hkh50ZvivUI1W+rMDxOV2RBsdgGH5+24VkICD3/YDgK4hGq8s
         XOOA==
X-Forwarded-Encrypted: i=1; AJvYcCUcMGjzXFfPLfHB8sffsJZ1wd0PaHz83/1OQnW8ftGvkFhmK/dVyi0pXDvpBejpC/30nR0ZW7TGhBqO36l9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/BDxVn5zWJ2XqAPhnf2dwPmiXjwIjne6bDRHRpAb4k9rRfRdZ
	sO+kU/faqSQZ5Fad7TBiRLOZ3BuDjOm1zksQT5yCD4FE+UIZILJifgElW5meLkDsHuYKx2UEEcO
	VuVZrQ2mAndpszfjW0CtzaMB5zY/dSyzA5NnsnpQAmtZdrxrpH9JgQNWaO8JKLUP4
X-Gm-Gg: ASbGnctkCEY0YXHKcBZR8YAraKwsusBug383L7nusrCZOBccidCXYCtQVsVHP0dDHur
	Tmi3O3yELpsjjGxs6iO7979/Qct4VR6f0OVzXRlr7SrQuOjqavPFVN7qqDkyfsHM/jKpk631MVI
	ouWLMRCIQy6Ka1v86LZKHkBin5WlB7i5BLde8pTSuwOw9yK/JWdP7ZEiqLg1PAy0R+KID6ywnTg
	+s+S0IlxdsAbsdRWb9M/IF7nhwDLzKhuC57sVeo5e91QiNyqeJjyRXFpMnfMmpNbj+1bvecG9Iv
	J7emtBx4Y1zy37mTKM31Xd9spg8EgaRcfwizCqJYsqy0lm0fvCXrm9CbZpFjLxGTKkyxTutUBGV
	JSqM=
X-Received: by 2002:a05:620a:288e:b0:7b6:cb3c:cb81 with SMTP id af79cd13be357-7c59b8a96cfmr452955985a.18.1742300347296;
        Tue, 18 Mar 2025 05:19:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJww/OeoqM71hDROPaSNOo2HPiouKcRNCZZrYVpQSl8tKKuN/JdG5hgHf15pqrGPXeGO/1Vw==
X-Received: by 2002:a05:620a:288e:b0:7b6:cb3c:cb81 with SMTP id af79cd13be357-7c59b8a96cfmr452952285a.18.1742300346954;
        Tue, 18 Mar 2025 05:19:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0d2601sm20203871fa.2.2025.03.18.05.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 05:19:06 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:19:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/9] dt-bindings: arm: qcom,coresight-static-replicator:
 add optional clocks
Message-ID: <klcggfxrhjqty4rktx24xmnosqnwzsbyfzgv5ea6okqbffyswn@5yei6276hlla>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
 <7b0af57c-a38c-4c30-9bb7-efe511d6bd1d@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b0af57c-a38c-4c30-9bb7-efe511d6bd1d@arm.com>
X-Proofpoint-GUID: JeKve316RRpc0iWYBM0k-aCv4d_EXmf0
X-Proofpoint-ORIG-GUID: JeKve316RRpc0iWYBM0k-aCv4d_EXmf0
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67d964bc cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=thsJD53E2aUhtArdJCMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180091

On Tue, Mar 18, 2025 at 10:38:17AM +0000, Suzuki K Poulose wrote:
> On 17/03/2025 17:44, Dmitry Baryshkov wrote:
> 
> nit: Subject:
> 
> s/qcom,coresight-static-replicator/arm,coresight-static-replicator
> 
> > As most other CoreSight devices the replicator can use either of the
> > optional clocks (or both). Document those optional clocks in the schema.
> > 
> > Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   .../bindings/arm/arm,coresight-static-replicator.yaml          | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..56e64067ed3d63c5e293a0840858f13428bacb45 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > @@ -30,6 +30,16 @@ properties:
> >     power-domains:
> >       maxItems: 1
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> 
> For the static replicator, you don't have an APB clock, as they can't be
> programmed. It may have an ATB clock. So minItems 0, maxItems: 1

It can, see qcom-apq8064.dtsi

Also minItems:0 doesn't make sense to me. I'd rather keep this as an
optional property rather than requiring an empty set.

> 
> Suzuki
> 
> 
> 
> > +  clock-names:
> > +    minItems: 1
> > +    enum:
> > +      - apb_pclk
> > +      - atclk
> > +
> >     in-ports:
> >       $ref: /schemas/graph.yaml#/properties/ports
> >       additionalProperties: false
> > 
> 

-- 
With best wishes
Dmitry

