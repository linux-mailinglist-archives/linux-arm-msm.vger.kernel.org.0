Return-Path: <linux-arm-msm+bounces-51835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AB8A67EBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 22:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 153343B23B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 21:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FC01F9F7C;
	Tue, 18 Mar 2025 21:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtaGPfEg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795BE17A311
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742333580; cv=none; b=SL1pKt+I3XO6BVORzAdDtCujo9pxIAHCwITjNvsEC7zhjFL5B7n2zASytzpmGrwLbXD633UvFPKwF/S4SmT1Hi/fW+ESuTzbGQvkL8kXSV9ij9SIy6QajObqCxk6bkImaPKqg4PxrYpFdcqeF59xyYAMhApnbNXFfDF3DIUPPnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742333580; c=relaxed/simple;
	bh=2BUZe4B/ElR/wC9+24hQAHoUB3oeoZhKkoDplUsbO8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZX2yXAtMVSt9NJ2tBCB4PGt1GezRP3QQsKDxT5oYI0qS1MYMG9WzDxfUnZRoaJF+gdD6cY7fucjtOAEr/79xDKW30qheqbYrBaEtItps5oiutcmi6MfDEj3+UwoZkvmn1+7uAcDhw4vLy7hYRTIfWIfl9JOjlslVpvVZhn2AGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtaGPfEg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IJCjfU000505
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NwMN89YxaLKyCKOYp8/emJaN
	ov+ScqMrpVh61CIHIsc=; b=TtaGPfEgwfFb5Qb2aHdwxxm8+l3WHBOYxIaDJHZ2
	YLSqai35F1H7C4paGqSk23ERnfP4CujUj+Z2nytGIiQ5htKNoeMRBlZaZeEoI7x5
	s7FGSrQH0DI0+8HPAatulSSQGBYMQMdjB7C+hdJKSPrXRpM3iQ2jMPOGS3sGyeJd
	2bHaD4WQU5uinN0bsK6eglIh6Rj29bzHUFF9RSEj/Ep2v3usfH5Iw03ZxWX69knn
	gFe9KLK3J88Qi/qJgW3VrMB6cUK4CG4lMbYjeRWjJmBiL0UGkceavDJ/R7/TUNZA
	iO9AjDMa9a3jL9Vb9GEJAIrFZEyN0h8aaYNEdhmTIQIgZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sy1kgk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:32:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c59ac9781fso17340585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 14:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742333576; x=1742938376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwMN89YxaLKyCKOYp8/emJaNov+ScqMrpVh61CIHIsc=;
        b=fjkIaU4bT//6EWsQWkGd1HNAfmkkcqPkliBdUXU47hwLsSvLFaebBog7OBV0F1GKrZ
         4ulxKT5svEtyY1D7orJAd2sb1SzumxqgFak9AqgY6lZpV+q19q/q7XDUMfX8iZXKO+PN
         z8O7ex4H+YBuWXHlgRQ0TdogjsCvKOztSACNgZDu0nMiNzvGPSMKnRhgIqQylttgXp80
         REj6jG5+FU1HP4rEo53238Eda0p4wUmHY4XzRgzIZRrYvJa+TVhAPDsYSd1mmX43aBSQ
         bw0Nrj/YI8vyIKROPY7bXn/wMaLLZo0/zYdDj7qMzSfdCpm6aXiacS6ekWPxlmqRed2R
         08Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVN8ncs57atwlXBL6ncphT5lP9M20LcdhYFc0CD8DMdCuadUY9w3XnFUiWrKq7qSI4CkttR5+egZ5hFd6WL@vger.kernel.org
X-Gm-Message-State: AOJu0YzKmvlcLYk2xhxfUPPrsNZHq1XtPdfxClF4yuI3Qyoz9Xd/vO8n
	Iat1/rmfsgEEzc3yfcbEmmD0bzfbId+vCDRNe+mYPH80/diPc84vncsod/JABAapLtpIzrYGyAy
	PlUpl7jDu1+fqSI+OV8AGl8uWi9Il+pzVL2dLwFZvuB09tMIEsg6Bxag9lR7baKes
X-Gm-Gg: ASbGncuOVdqm10n754Kc9IpPbuVDVjhgIYDsRXlZmQfV+E+PZhj05zcv+Vr5PfVGZdX
	B0vv1NyuwoDeBH6ZdhMDFk7fJeWJ1vvu8xFqpULGxzyseJApVhVTiG0s8Xx2Vp1thT7R6YuJGkd
	SQ0Aaun6LX4CbJeuHQsH7dsa/qQ6Q4nxuWTsg77BNDAgbFQ6XSZXkwYREpSHSegcuiECsCToJOE
	iUGLteiIZlh9NJaY0n8YvpbHKUBgZ9+B3iyA8oQg4+Nao4Zd6i5D5b7aEEjznABdfJ5UzcXL9tJ
	+KXYvg8t5f/V0uD45J0IvK1IDJVnlMjywir2r61GN5wjtd4bcjssRTa18xhDPpSqsjGy/t+CTHQ
	bzKI=
X-Received: by 2002:a05:620a:f0f:b0:7c5:3b8d:9f2f with SMTP id af79cd13be357-7c59b731738mr798312085a.17.1742333576421;
        Tue, 18 Mar 2025 14:32:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFq5F/JLPAaQXrDSOw1XgilhJCzh+nKCxh1TSKH8fBgE4Opu3wA/GQDPb5L32TGJRmeu7EEA==
X-Received: by 2002:a05:620a:f0f:b0:7c5:3b8d:9f2f with SMTP id af79cd13be357-7c59b731738mr798307885a.17.1742333576089;
        Tue, 18 Mar 2025 14:32:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a8c68sm1774546e87.248.2025.03.18.14.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 14:32:53 -0700 (PDT)
Date: Tue, 18 Mar 2025 23:32:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnaud Vrac <avrac@freebox.fr>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 5/8] arm64: dts: qcom: qcs615: Remove disallowed property
 from AOSS_QMP node
Message-ID: <uftjklj7xsgruwyodttj6oo63cswa7xmojr7chiylz5siwfhfc@yb6rflzsxtfm>
References: <20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com>
 <20250318-topic-more_dt_bindings_fixes-v1-5-cb36882ea9cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-topic-more_dt_bindings_fixes-v1-5-cb36882ea9cc@oss.qualcomm.com>
X-Proofpoint-GUID: exSf2EZ8_Hk98xo4FLS-zrYOsJgsXg2l
X-Proofpoint-ORIG-GUID: exSf2EZ8_Hk98xo4FLS-zrYOsJgsXg2l
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67d9e689 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=MuFgdvjdNmmiJytiEo4A:9 a=CjuIK1q_8ugA:10 a=PkAOt9_mmfBkvtOLxIEI:22
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=640 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180156

On Tue, Mar 18, 2025 at 07:35:18PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> AOSS_QMP is not allowed to be a power domain provider, remove the
> associated -cells property.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

