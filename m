Return-Path: <linux-arm-msm+bounces-61484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0433ADB678
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 18:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AFAE189033A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 16:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967CD286437;
	Mon, 16 Jun 2025 16:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YQiRguyq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046CC286404
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 16:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750090707; cv=none; b=au9JQmJJp4kmqRlVr3sjXrJPKyaBeRVjrk9pvJDPdKaCOtDkGjqVSKV4u/UklZy9hUDEbm1TBKN15eE4TyVemERakZKszajES0P79UULhgUk9YcgQ6sHRjsGfo8YJs9rPW84YsGbyI/qkz7AFqQK5uh0ijUCTDPPMUHDMBytoBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750090707; c=relaxed/simple;
	bh=5dxQ60As8s/8rmI2TuFgJPch2gZ+j1BB1ZNS7po3vgM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Djl1jCCEF10S9cq9AkhExMRmtPd1XF5u6C+0mKXzYJqP+kjFyOhyDfLsiKNu1KgQVG7ksJBs+4r2hucwlXkMBnQNYF9E0HXYHwbAyK6Az1fvfh4zgzlJVmxSFRI8giQ4wyO7WfBg6HKC66gtVBQ6zRjRLT3rfijs0zBaqrnjpAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YQiRguyq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GG6tfH014411
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 16:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lenjTOuIiqQxj1snFC9JaLJ/
	OZ0qD8QNh76r2FAzoEI=; b=YQiRguyq5DL80RlloScVAfpw9lTcjLnppkegCMZa
	XA3bRC9ogFQHNt0RhUOL4ceODzfvxjFD+qsYDyDR9S+0aXDgcR0xXljWFrqGLb4C
	XXJrG/LV3wDn2zt6EEFhv0eJrpT1T9+/S7oeaJ6BIMPsmW1YfIDF8FAyjXz8mtu/
	cOQeBKOuYMJXOYM0Z9wCaK40w2Ueu2rS4YwrMBEFstW0GQSFzU9SjqfXigg1iUK3
	QTZw4yT9ff3MdaU7YNg5I8GUPNgCKRHtCKHOMvzkgMUpEJqt6JLRvMg27m4uOycB
	NBZBWDuqz48C74/lMeLP2BSmHTR4cAYc+R4Jt8KR7dzDpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crn4n8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 16:18:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c53e316734so883412285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 09:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090704; x=1750695504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lenjTOuIiqQxj1snFC9JaLJ/OZ0qD8QNh76r2FAzoEI=;
        b=clmqbSk2Rwq/Zkj7MkpA1k8ix+VV6yrtQgIluMrmd7zATcBNiN9vjL6yBiJpQ3/Ybj
         dqNPVw0MFUKGz7b+HKt149ililJl57OdWkGcPuYnLgc2f4+MnmZApPkPDDcrNEEqSmpb
         YqilNoiRP3XOfPD8CF+mp7Jg+3/+dapH8z2fx8YY8ZGi4P/Dw2M5dnhBiCa+9yE8AvU5
         a1hs5WnltTSHi3iPEEZ8HjFAYMslu+JXTSrgiDdi2z8pZaucdYBR5sOxkUQtapvE7OJV
         YNzY6jOFMfkCPk43tM6PZYQz1XqpKSz+TzaFtJ3TLgQwimwgKDm2yN+61pCJbMx6ypPz
         /Hig==
X-Forwarded-Encrypted: i=1; AJvYcCWaVKneeDIzMXuCSIDWH7lFXX9FftcedlnNTJP2txAlUSme0Sj0D6t39+VOKMWmd7cq5UEOmBV1JPdPdI93@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq1nua5MAP0zDUYwapKVNfaDXmiDPxP8TNUAd+scp0QLIziX83
	+jz+99I/q6x8Psr2BXZL1YzrkaXqCVlsdqledt4pQZPy/XgKIhu6YJ16c3LuEVxrcuTBRqIMgj4
	duTaT/JicjK2WCEpybSgAaZP6vnd7VnvVEZOq8keWJX0a77UPJQYCq0JhX2426NOqVrMP
X-Gm-Gg: ASbGncsoxlW2Rw+sxqh1UruyXx5PGrwJde8Na7x0tHGZWyAr988JzcD4AOorpwPN+IY
	vd1A2JPnEuJAsM8m2TbTIqvEk1ES5ZiElwSjSdNC0hr8TkqHXoTg01tnt3hfGeshqwMrAhHkqFI
	oHbUIcyB3skBUehJIoDlSk8ssV7jaFt5CiIK1vS8eQ1wsAlPGx6EdbVacQKHdxj2YCd8vd/tbc6
	2X8To/z2Axei5/gAwCVUZhyEe/X0pg73ZjPikyEyUJk+r0RnB0eIXcdCfmQ+igGXlGYtM5uB+rs
	/a00VcOqRs5M6EkfRyPBXLCeaQ3oPTc7Zjd3lEraL9nbMvBvhNa0UOssMg==
X-Received: by 2002:a05:620a:450b:b0:7d3:b9b6:f1b9 with SMTP id af79cd13be357-7d3c6cd6c86mr1518730385a.26.1750090703922;
        Mon, 16 Jun 2025 09:18:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYH0Bi1Qj/amsWCd72LYxFHGoIlfM8IzTVbUpM+all+BJ6C4oqXrBLJLX310yA58Ug9cHwug==
X-Received: by 2002:a05:620a:450b:b0:7d3:b9b6:f1b9 with SMTP id af79cd13be357-7d3c6cd6c86mr1518724785a.26.1750090703338;
        Mon, 16 Jun 2025 09:18:23 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13d014sm149938815e9.24.2025.06.16.09.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:18:22 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 16 Jun 2025 18:18:21 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
Message-ID: <aFBDzWLkKC9MWGoC@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
 <6f4e715f-1c73-450e-b7eb-92781b7fa050@kernel.org>
 <aFATp3zoSgkrj3YX@trex>
 <a76789cf-afe1-4d91-afdf-65c3af5ad11f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a76789cf-afe1-4d91-afdf-65c3af5ad11f@kernel.org>
X-Proofpoint-ORIG-GUID: HunAIVKWtMe8kHcMUO_JZMz7TRpDMOJm
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=685043d0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=4oi7HMmTljfVUEt6n0wA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: HunAIVKWtMe8kHcMUO_JZMz7TRpDMOJm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwNiBTYWx0ZWRfX2hJ5vq4h2Uen
 /bnkgnLGOoHuZZByC9Aic4+/Rr6nYAqjSnqmZiYxFm9RwRpjxzditKzUjRBuHebK1T89q/EKkjI
 M236Vq6ZC0pBaJyipd6wTGBBJ5+bjsD5rFCSUA/96zMCQNE1OF12zPsF+LfKzr7Ywq064uN0oUj
 /1kjPSDP/I3l3vZYM0gJB95PJqT7GyfaHzl9dblc7ukIdr4sPjvUP5Rft4Rr3VI53Uc51kdUBx+
 wvAcndVsowmJ+3eL45dK6VG4nDaO4mb8b/0kKHFwQRRJyMENDzzHsOrXSsRQoH97LKgXMHbhrzE
 ZvDH+Kvm54PNm+fWykTHfC5fnKi8J5j/vr1fse1gFz0mAdf2BKCCdIkOH4yl+ElR0ASoqg0T3z+
 aUSyuA2745VAzPyIZ+j4CG7Qs+/5G1D4aCskmcgGP8R8n6xr6QXiOlt772qyRRF74P0Uy9OJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160106

On 16/06/25 16:41:44, Krzysztof Kozlowski wrote:
> On 16/06/2025 14:52, Jorge Ramirez wrote:
> >>
> >>> +  The Venus AR50_LITE IP is a video encode and decode accelerator present
> >>> +  on Qualcomm platforms
> >>> +
> >>> +allOf:
> >>> +  - $ref: qcom,venus-common.yaml#
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: qcom,qcm2290-venus
> >>> +
> >>> +  power-domains:
> >>> +    minItems: 2
> >>> +    maxItems: 3
> >>> +
> >>> +  power-domain-names:
> >>> +    minItems: 2
> >>
> >> Why is this flexible? Either you have two or three. Not mixed.
> > 
> > please check 5b380f242f360256c96e96adabeb7ce9ec784306
> 
> This does not explain why this is optional HERE. You cannot use for a
> new platform an argument that some existing platform was changed in
> ABI-preserving way.

thanks for quick the follow up.

but bear with me please because I dont follow - why can the same logic
be used - it being applicable - and therefore result in a definition
similar to those other platforms?

how would I capture such a requirement if not as done in this patch?

> 
> BTW, also subject prefixes needs fixing. For DTS: it is never "arch".

right, that is for patch 2 but ok, will fix there.

> For this patch: wrong order (see DT submitting patches).

yep, that is addressed in the next series

TIA!

> 
> Best regards,
> Krzysztof

