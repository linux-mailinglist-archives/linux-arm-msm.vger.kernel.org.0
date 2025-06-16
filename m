Return-Path: <linux-arm-msm+bounces-61438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A126ADB0A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 14:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CDDC3A41DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 12:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F63292B2D;
	Mon, 16 Jun 2025 12:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dLAFIxgM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59877285CAC
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 12:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078381; cv=none; b=NzcKS+GX77qL7NTYeFEXyhzYGz8wAKSdozY6iyhIrcNyeVmEp9AVOZlDjeeFIOTB47386w36K8fGbIeifHL9l/L2FA5522W0fQX6Y1xKvHsKSIDCiCyc7x2Ydq7wwWnq19wHfTzwaSfSGLaosZhk4137lFlAKXt99dLwH4bmxRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078381; c=relaxed/simple;
	bh=xDo/CFd9O80cjbXr3irb8h8miFyh3mpLQ44oVF5ZXVw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFu0Zf0ffHf1TeXq7TNqJsPyScYjsJvrS5fvMs8raPCdVsfbKQIJhzd95CxfGpU0u/X6g9vfIDKcUO2a3pPVexJ5qcSzupyRlpqwYHLBnrk8WB56HyVy51UNuoEzYSI2Iqe/Re9g62G3Af4ne98JL0Ywrq/Ryed0/8c1dpPCf5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dLAFIxgM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8RBig011469
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 12:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3KaQaSQSjoPXPxix0wFVI/K7
	2pUStJJyIYhcrvQzs8U=; b=dLAFIxgMECezCzCS9OY0D5uNzeiMkztyFQR/SAeb
	7IPY6AJG5N7oUpmMDS9TmSnnUIYXDUxBE2/hpkoHDMlSHyDoOHErAcJFOSUXi417
	JZ2eLoo+eYyI7i9ffDBB9Y17arBk3aQVT0WkHZ5BQFiD+UU0TLmILfErROT5dabJ
	rbFudxOTUNy2IgNFcHDAcLCS95YtImAjwRiQrvdCUbU820lULhOpWRSePM43FBnZ
	8+g/JlGxu6zEPd9Vpf/yxjlqLxd/7hNzDDUWALnegko5g5Q21dWZKsbKg4bF2mzn
	zSYmQgm8xx7iz4FH3xkqgggTNQiJnbD0Vd/ge7dcO8njvw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5k44h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 12:52:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb3bb94b5cso57056766d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 05:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078378; x=1750683178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KaQaSQSjoPXPxix0wFVI/K72pUStJJyIYhcrvQzs8U=;
        b=BvcgpDOLG+cRkyZ459cEQ7W2FRw0E7d/QFpEElorz7JgswQC2FlWP0YnCLqfeFRw3P
         XEwE0XkZkyaUmD3BD5LavTdZNwuq6HPHE4invYk8vTUtzGGW1X+nNL4pSOP69sy1vHsz
         O1PH0loFI00SmJP27RWFjMRCCK2EuiNMRek0S0h508bJ5BZ7x9NZLlLKwNVVBsfmBXQ4
         +Djh2U/ZcmaTJJsipZ1rIQfJ9F4waRLww0ofHYNKEDsV4lYD0e4bonLOpz3Hl7hqOtmT
         VSBOPLyu1Uo5PRvR5cR0YQGqISvCeXMlMUVzyNW4cife29y2a3eedZ4LX7JYkf29WDvL
         rSyg==
X-Forwarded-Encrypted: i=1; AJvYcCU7p5GHHoNHZno/ZzVaz8+MrsyW1H29VKmTXMk8eCbjGJGpkhkkABsMG7RcFpTD5c8/OTClHwtp7sK0y0YH@vger.kernel.org
X-Gm-Message-State: AOJu0YweRN3n20m+nlTaupJ9obo9H8ZdqxPdPYvlMm9Q/HH19pYGnZAi
	UFtdNcMntzOSw5XycBDV5gDIftcDbklTHTvmhY8JRHaKAjNfSpcvaG9fj19TOenemTJcKJwWptI
	AH+d6eLBNN9xaPvGYSLNK+NCdK6It9WbwlkQnqbG+T09F8YYlg64FvlenB4I3cTNgdp75
X-Gm-Gg: ASbGncvZGh95A7AQP3qDgq5KwuoyyTArtFqVoE/2j7wg43s8s2+mEjOiwQ8ffmg86Oj
	hYA+sA/KQ3Ks9Mz3LDQzjGUnZFCX8ZSQte7mQ9fOR1rjMZ0ylVv2cxO1xNL5sqJlB6cFnIJpU7C
	01z5IKaQXqyMNt4ZaDcxw2CmeaRANEi9EREecdvn6VgcIFRwFKj2s23KPWRIPnS2ylsVZL5nojd
	ncnL+lgeA7i12/rXarwufMmQCpSP2/LBjtLltkZ9YTUGdZB+pUlECupTyrkuZKiRw/ja39S5d7j
	Y2RHY9/hP7MMFF2tNLMeryOD+upLVM8wfNw38WCnwC+KlWTUuvVg6QfI3g==
X-Received: by 2002:ad4:5e87:0:b0:6e8:97f6:3229 with SMTP id 6a1803df08f44-6fb4772a019mr128592166d6.16.1750078377858;
        Mon, 16 Jun 2025 05:52:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+OFLF4t7/ZWk0HbQ5uqeqFokxTATjRvaApyd+ckaiuS8GwJZ2WNkfZTT+6OXd0WtcCQEi5w==
X-Received: by 2002:ad4:5e87:0:b0:6e8:97f6:3229 with SMTP id 6a1803df08f44-6fb4772a019mr128591716d6.16.1750078377401;
        Mon, 16 Jun 2025 05:52:57 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532f2ca228sm145532895e9.13.2025.06.16.05.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 05:52:56 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 16 Jun 2025 14:52:55 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
Message-ID: <aFATp3zoSgkrj3YX@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
 <6f4e715f-1c73-450e-b7eb-92781b7fa050@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f4e715f-1c73-450e-b7eb-92781b7fa050@kernel.org>
X-Proofpoint-GUID: qXUuJiAppPCra6n70rsemjSxkwB8dL0j
X-Proofpoint-ORIG-GUID: qXUuJiAppPCra6n70rsemjSxkwB8dL0j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA4MCBTYWx0ZWRfXy5E5RQCG5B1f
 jUb1CxLuP3KqWUAMBCA3fy1K1OPgMQW1UXnmjAEjYcJmOEAeX0GFj1T7SkMCvZMrXrMigsyrfva
 KZxKqpTUuc7uU8DndRmLVdFjCsXA4UsaZxp/4R0UsKZ4HZvkfp6MqORGxX9AH7sdMsFcJUlsJyC
 0OqbVAojA+wpudc9zxPJgDgGHDI2a7DEDcQjsAqjvInXkvxYSDDFJ2Gh7a892DD1QWDieLijZc7
 O9OurxIpUBWdz/GdmqpNPM9YJ0dy2Hwv9BTI4LC5qiJVSGlydPsAZd+ZnGB8Ma+1L3BbXhw4rSz
 UeOeeRA6EgGnIpwc+t8Lo5eM17Oxw0eHZ2GA47xcxRTrcqTaqzfhDHLrJEB0j6K3cRmompkzwoc
 Ep5ltDZihenregxOGPpI8VooMWVwqkIU2AqyLRa8n5jgVc1ReOvY3TCA8JUsejnN72RnD2Zm
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=685013ab cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=DAQgPmeqjGmo1aN9fEMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160080

On 16/06/25 10:20:57, Krzysztof Kozlowski wrote:
> On 13/06/2025 16:03, Jorge Ramirez-Ortiz wrote:
> > Add a schema for the venus video encoder/decoder on the qcm2290.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  .../bindings/media/qcom,qcm2290-venus.yaml    | 153 ++++++++++++++++++
> >  1 file changed, 153 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > new file mode 100644
> > index 000000000000..ffa72f1e27f3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > @@ -0,0 +1,153 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm QCM2290 Venus video encode and decode accelerators
> > +
> > +maintainers:
> > +  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
> > +
> > +description: |
> 
> Do not need '|' unless you need to preserve formatting.

ack

> 
> > +  The Venus AR50_LITE IP is a video encode and decode accelerator present
> > +  on Qualcomm platforms
> > +
> > +allOf:
> > +  - $ref: qcom,venus-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,qcm2290-venus
> > +
> > +  power-domains:
> > +    minItems: 2
> > +    maxItems: 3
> > +
> > +  power-domain-names:
> > +    minItems: 2
> 
> Why is this flexible? Either you have two or three. Not mixed.

please check 5b380f242f360256c96e96adabeb7ce9ec784306

