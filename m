Return-Path: <linux-arm-msm+bounces-51713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACEFA673A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32FAA19A3C56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 12:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862F41EDA1D;
	Tue, 18 Mar 2025 12:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gKwHangu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2731DA3D
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742300214; cv=none; b=BXh3m0r/zJKFMeR/nkkiVRyE1r6JcjjlDblvrKVakyfFmIfAqVNI1PSMZGZNgu8im76igic2hs6//dPJFEVoxpRzsFbMYxqyoD8GFDl/O9tHtXd9nhBEEfwCbB3N7/0GoeklyjHTCwmksuikQyBsvLRCT9MmTTy3dtWkBnE5cCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742300214; c=relaxed/simple;
	bh=AyGRSbdtU1mZ463IEOjc+zuU8x71gpI+WzuNMC6Tun4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YI2+Esn4A+V4HLfwvmSGagglwG6bqZjULTK3Z8nkogCt/8FxHJknFs1HPom2XcyynNDnVH09+uyGfpfG/JvbnQteUHsNZywoJxtATJHggCf6pnyDTrcNLQJDKbL9ogmOLWk0nF7QQKpSHO3tWpejCuyA8fkEdHp9J6C9mEEK/UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gKwHangu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAGuBj028624
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dgvU8svwebeSekgWfG8Ih62E
	R31eTU16D7J6+KvsOhU=; b=gKwHanguLb3HGoK43kNjG4r5T7qWdF1y0X2DCVhs
	rZn0l/6NI4NnwmCaPtQ2gchz/47PiAJ58GHQtgiKKI9JPEFOuw6Gc9BSpXVkvySU
	RJQO0XhMmzVs98l1MDe5j+yT2r6tnrHRAwAZcFzIrtbIe3UGTkhV1l9DL32CcukW
	swG0WUvF5QJZLHG+uN+WNyo+QTGxc0m141HOOZaQIO3MPE7LOzVHatCZ/Dhm+Uti
	OTW7TiPYbHtWn91dHFgnXEQs69tCCB+rw3jmwKQu0NUH/U+/3tGLFDPb0v7ET2BA
	rQZSZNk7qEn0NllFMaznEc3K5mNI01XY/7o+pRFkBozSfw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sy03qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:16:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0a3568f4eso551998885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 05:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742300211; x=1742905011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgvU8svwebeSekgWfG8Ih62ER31eTU16D7J6+KvsOhU=;
        b=w6lVQKowXHNfILRf2JvE5yEPxV1vmDkMV3MVtxlfgmL8TNgTcu9Gxvl3ERdkEL6QAf
         036goTHbW6oddpaNi8YpFPF8VIRdWnk91eU/c8DmJZQpykbAEIhi6bPKkSVYpzihy1wo
         JoC2gYaAiGINtnLkg4t2ftGossgH8BLd/8HcG2SfH6wLG7tinLtzNMxUWUcZdi9i9TcA
         K6graRqGcm2LbD4reMgSu3K2MTyH00VH5gPPmaryXh7rlGzAS+qANWpMJncSxQUUUQAI
         vD0TDaPDibY5WIcX9cT30Bl61Awhp8Q2GH2TrHS9ZqvKep8gmaQzMXYAthjH23/Q/3h6
         P5SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFrM/H3FKvGGyPB+KNn7RfyhuJjh2K0awh5groemuoL+VmCGngNQh0sVNOzlQBWZ37hnMVJlWqJQhyK56F@vger.kernel.org
X-Gm-Message-State: AOJu0YwyhDbmGP185pbrit6eMyha2mNdUX98rQjW6qEzg1ogLgDu10/y
	cGeaBtnp+FO6ioQtJmFtvyxWFqHBQd5AQGpQPCo8Vya4A0o/2pxkO4oquknFX6ohyq5D5a6b6Cd
	LabWZsg4wiQJcn0XVnoiBr2Fjcb9uaNLWolECXn+KqwsA3aEn/CyQEzXbVHEYZ8eg
X-Gm-Gg: ASbGncsMA+/x+ie/ppun+9EtaKiQgT+rb+4H1XGy1WArQjHzxbHCzrjZCA2KrlvtUb4
	IRgaGgE3D4pK8uS3XaaxVIiJr3So3qESV11F2CeX8SELhYi29mQZZ7QBrmgzR4YkGCbDWF/eV6X
	BqpNG0DyhRvFmMC36DPEIuX60Nc47nJzxsOjm85ab7LHflhP6X8cPnIAsp7izSa9HkFGIjysS3q
	s8oN3sBFaKT9FK7kqFDPoO3hq43DzIUdjz/HTZOaMFPTTms++mNuQGw0LsYf4qePGqgChYgXCbk
	jv3p0lYquIxHoWkYiibOvO6YEtL9/dwui3mBwh8t1WwvbRDECrh43xplfO5kKUBOBToXGuL2dvU
	Riyk=
X-Received: by 2002:a05:6214:ca3:b0:6ea:d604:9e49 with SMTP id 6a1803df08f44-6eaeaaaa3d0mr230068456d6.34.1742300210849;
        Tue, 18 Mar 2025 05:16:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/QbW51i2QEA7DNMKYUIPNpOuBwru1TWa+7+ZdqHkmL4IbrVh78rOti4S492Vx7r0OVx87UQ==
X-Received: by 2002:a05:6214:ca3:b0:6ea:d604:9e49 with SMTP id 6a1803df08f44-6eaeaaaa3d0mr230067926d6.34.1742300210482;
        Tue, 18 Mar 2025 05:16:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f117b8fsm19530991fa.63.2025.03.18.05.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 05:16:48 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:16:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
        Suzuki K Poulose <suzuki.poulose@arm.com>,
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
Subject: Re: [PATCH 2/9] dt-bindings: display/msm: describe SFPB device
Message-ID: <t37wdbwkbuyb5xn2lsdynp7on2oujvojmjkba24t4lqxuu64vl@htfidrpftxx7>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-2-655c52e2ad97@oss.qualcomm.com>
 <20250318-adventurous-cherubic-coua-eecbbc@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-adventurous-cherubic-coua-eecbbc@krzk-bin>
X-Proofpoint-GUID: JJtQj5HK5rwg0yBUhGXNZAzlapktui8v
X-Proofpoint-ORIG-GUID: JJtQj5HK5rwg0yBUhGXNZAzlapktui8v
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67d96433 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=JDiau87qNJ9ckCeAMI0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180090

On Tue, Mar 18, 2025 at 08:55:59AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Mar 17, 2025 at 07:44:37PM +0200, Dmitry Baryshkov wrote:
> > Add DT schema for the MultiMedia SubSystem System FPB device, which
> > provides several registers to control interface between multimedia
> > devices (primarily display) and system busses.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/display/msm/qcom,sfpb.yaml | 39 ++++++++++++++++++++++
> 
> Filename: qcom,apq8064-mmss-sfpb.yaml
> 
> >  1 file changed, 39 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..7ca105c97edd2f305527c58ae89b9b0cf22d3c8c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml
> > @@ -0,0 +1,39 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/msm/qcom,sfpb.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm MultiMedia SubSystem System FPB
> > +
> > +maintainers:
> > +  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > +  - Rob Clark <robdclark@gmail.com>
> > +
> > +description:
> > +  The SFPB provides several registers controlling the multimedia attachment to
> > +  the system busses.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: qcom,apq8064-mmss-sfpb
> > +      - const: syscon
> 
> Why this cannot be part of standard syscon bindings file? Looks simple
> enough.

Ack

-- 
With best wishes
Dmitry

