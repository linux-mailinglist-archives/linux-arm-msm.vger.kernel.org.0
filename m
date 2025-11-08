Return-Path: <linux-arm-msm+bounces-80844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD825C43280
	for <lists+linux-arm-msm@lfdr.de>; Sat, 08 Nov 2025 18:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A17424E072C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Nov 2025 17:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B3F2367B5;
	Sat,  8 Nov 2025 17:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ehE8VltP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WXpMLMFt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC1E34D38E
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Nov 2025 17:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762624063; cv=none; b=b1yTrkVYHz5CC+12xhM+RsN+rF3G9xSbCOExy3pMvKkjWIqESgoUtYhhvNNLbu6K+Y6wYU0+nysCmjXaKHhQHaYlTPfeQThROSga1cxsqY9aGU9m983f3XGvpNM1pQxA6jENq1yxzu3fe9OtwdqV3btmssAW+U6PuZ4g9YjsYGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762624063; c=relaxed/simple;
	bh=HvpMmGW03dxYZC0YZr1+D/jVHMgv5z2Ip3dLnOgqI58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLh01afQ+qeBfHbCNixNl8tvYvYOs2cOS4fp4PKpJcyD3tf7wPqozcoaxjnrwQJTCOpIYBmx/1NaUlfQo6R008ZQuWGCUfZs1tiHFxrCTJp11Es/3yl1a5Kdl7XSvHhpCcNEtxo6pif1EzG7w5B468hYbtVc4QO1w41BPp9vU/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ehE8VltP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXpMLMFt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A8FHnPB2086180
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Nov 2025 17:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ap8lj9Sm9uVSu2cLhXJsylRK
	Em7Ck7Un0+RpreSBVWk=; b=ehE8VltPXhudhLonqwFbDy4yuE1PuVRx0IRFivnl
	E5RNygneHI2ThVrziuVdwuP1y6tLymkZfRB67749jZitmFn1Y0VaSYDpkljAiaHs
	Xz/QG8Bl1i7hdhGLJjjd1A15n365VduJmNzIrYa/N8oPGPwiJa8/++2ctl2BCPuZ
	lKUVoc4el2dbrpARRftAyht74KvnHQ1Y/ziXwsIntQTwvINJhU3SyDfblnsx6Jyb
	ZRdHG3E54HyqTXBMBImBEIFo70N6HS0e1teXUmgnGmEdpd4W9hisrDOShIUf5oat
	PT0nG1IJSV05NdWZwj16BM+WIQ3gXUSGry55BpyKyZ6WNw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xw6gxyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 17:47:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-882376d91beso30883296d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 09:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762624061; x=1763228861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ap8lj9Sm9uVSu2cLhXJsylRKEm7Ck7Un0+RpreSBVWk=;
        b=WXpMLMFtgS1bn9grrnmsr4YxEHL7sNGIowbwZe/HlQNzg+H5Wpc8f8dbdar1vme+xS
         pa6tO8wb1josEo/mLVwUZ2YpN6226qDDUooBake3m8F7yvw0rbkLFM2i14SQsZP9BSOZ
         d3bmYRdIStnPf0L4cd5xel3MdomoKLDgWNKiexc/fjlYAFCcp27RDC12bTcKyyWosgDo
         BYkjqmV5AFHWV7JINJ1DSFK7tVDZ830ySraRaEAyOmrvi9OXEqP6HjvEED3WJeGILvA6
         llW+wf00QviwfO6f9KvLMMOoem/D2UlNztf8vz2qEpbxEJHMm1C1aGOWLsV1kgXM0jC/
         U4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762624061; x=1763228861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ap8lj9Sm9uVSu2cLhXJsylRKEm7Ck7Un0+RpreSBVWk=;
        b=KX8zvE4onaHD3bD9j3fxMsZu8ZbCKx4RbZHqlG7eOYLcVpHc4iLdMAfqG95i4RUYnO
         rFm94M79/9FrczuJt5DVXWKfwG+61FKdmCz82AZE9qxqFVXuxiU0RidCQqE13m94QG7V
         Zjo9sPxH5nDSU5ywwmML5xIhDqO41zoOiTNKaz9varkwixwiK1etWCGDGIxVCugwcCGJ
         8tgprRESH2kXZoI6BMJ62yC8CXHjbJ4ak60yzP85TS2Vr4sRmpIR11Ucn+DwA28GfL0d
         NAEtUwAioDhpwfjQk2SzqFozlZ44GAe8pgjzHyLPQfnI9UlKzOLz12oW81uUDjh7Ofuv
         CBSw==
X-Forwarded-Encrypted: i=1; AJvYcCXQJRfOCF9v3pm7uhRTrruEMjWGUzasd084JdSoDCmDTDbD6vFBD88cMA2lAZQ0GtWh+Pr+SHh8qxqAXZ6k@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9DBE/rP8w0+ctnlROnugeMwwwa0bhrpKTQXiP+ufq3Eo5v34R
	aSxVImzAI/IqSoJW/HkT0XWsUacejok6dpXby6tF3sSIkmgcsQ1Ve+69mhExRORtTL7Oup+AKgz
	LMXDIBp5G5thc562wdTR0G22hn2zYk6SF19bCYRR9K2N8RrKJaMyN7wU0NzWdQTUhscJs
X-Gm-Gg: ASbGncswnNpbE5E8eLuJLrZvcfYuMzsqiNj39cskrokI2rFyO3Tmj1azuuAzOk/wN99
	H/MmM3Qa+uTiGdrdiftcCbQMoUwr0q9FjJSxPioB9qZqIb/lBXPsWoEnGfeGFqNtGWM4t+D8puF
	Wgegxh8qa9XLrcRt2N+fSVRyAGJF0mddpl32D1rD4pBAeu86zacYJutUWzJiHaxttHYSKNGbNph
	ENCsVxPi5q1taOWKytJLfVJ/Ru4VVbFKEP7IEsjD21EwRaPN08L29ceWy/ow32Y22OYdEeuL27t
	j9KbxVC0Wxxdy1aaxGetce4xv3F8gY7FaDkdBb3xZEMlnu6n3A9d3dOMd2eWhn20UwieXFI9v4Z
	1SHylq3be3hwdq0+X0uOsTru1lRrVqmwZ3yvYRGbKeB+XccgsJdlVqH8tEd9nnsq5LLjUM4/bkN
	5lppbDk6vbCcOM
X-Received: by 2002:a05:6214:f2a:b0:880:4f97:d17b with SMTP id 6a1803df08f44-882385c4948mr35733446d6.19.1762624060726;
        Sat, 08 Nov 2025 09:47:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9L3CuPYnBcr11YnGCLvWOHvYxkY0YKpO25F22jI6Vbwp5Lf3pvefb6cGn9JxaUMlq18tqcQ==
X-Received: by 2002:a05:6214:f2a:b0:880:4f97:d17b with SMTP id 6a1803df08f44-882385c4948mr35733216d6.19.1762624060312;
        Sat, 08 Nov 2025 09:47:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f0dd168sm19909131fa.33.2025.11.08.09.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 09:47:38 -0800 (PST)
Date: Sat, 8 Nov 2025 19:47:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] interconnect: qcom: sm6350: Remove empty BCM arrays
Message-ID: <h6zyw66l75p5zvaztc3piimbu3iiusvjjxmee3yrlxh5xtievu@lme6idh7ja4q>
References: <20251107-sm6350-icc-qos-v1-0-8275e5fc3f61@fairphone.com>
 <20251107-sm6350-icc-qos-v1-3-8275e5fc3f61@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-sm6350-icc-qos-v1-3-8275e5fc3f61@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDE0NCBTYWx0ZWRfX/beYt16us4+f
 CKky4kcwv15tYnf+zmemEUu58UF2Qq3gsB3OJVuDwXxz8vMEy1gLwBaZBB+9bbdJq5MNhlBNHDf
 yF91Lr576VPDiM0/pOycYOZLkYwHWyuIbOKgcC4svJWncsAkb7sC6ddKbBmQhNgyT9CrMSoGOpz
 ePrU+W1eK/8JX+K+xVUgEuywQOHnOGlFnWanxcPnOjp2KwTfu/NANS0ItpNqFL9rZdPyh2bg3QY
 ciVqq4NnCIFnywhYTCfWNoZxGFKu0FJMApWhYnYYG6wyx/9nnlnssjuDMHlS62zQJANvZJ5dYxL
 FGLG//wcvhhxZPcIYDStM19eDeu/SW66CaRuxoEPgY1wB0hQ1MA7NQhCvB0GMws4WwoO/QNQr78
 wYk1IhvD3g7y56O8RCRAAMS5uDfmzg==
X-Proofpoint-ORIG-GUID: P8grfNst1AA3KVFSsSpn8BiaBC6U34GN
X-Authority-Analysis: v=2.4 cv=cpmWUl4i c=1 sm=1 tr=0 ts=690f823d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=AgmifABs4vawdm9268kA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: P8grfNst1AA3KVFSsSpn8BiaBC6U34GN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080144

On Fri, Nov 07, 2025 at 05:08:49PM +0100, Luca Weiss wrote:
> Clean up the code by removing empty BCM arrays to save some lines.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/interconnect/qcom/sm6350.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

