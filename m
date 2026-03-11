Return-Path: <linux-arm-msm+bounces-96821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLBXJl7XsGnLngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:45:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BF625B1BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06321308530D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86894283CAF;
	Wed, 11 Mar 2026 02:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNXtLmXO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KwO6Jzml"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC97286891
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773197091; cv=none; b=pskhlo8VdpFr/EExXu7MlxWPZNIfVdzp1vjVHZA0cLTSqYJqEfNm6maUgm6Zzfva/L603hZkce9ACQFfdQZ6hoAuYahN4uy110Pan1WOF/8aSos5P+1P1Qxc7uc24SkF2vjIYXEN2GuQ0oZdoS3Kodr5L3Bb2EMDabI8cb/V43M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773197091; c=relaxed/simple;
	bh=IyFdGNrEHsEtSN5xhy3JLnQTdu4jt2O/EenilNxolyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T45ngpr2eX4EdA9vL4Eq5Lt5tiM8RmyjZKfB1vjGRAN9VArdJlQ8t6KqaHjqtc2C/ZJ+g1kQp7QQPB2JTNpzwtqubzqJhTz73HsUz//KcaESKte1Z0KbYrL+G06Uk3ekzYTXFbozyxqlxMRdML0A5PY+6wejuzgHnrWDbDdoLe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNXtLmXO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KwO6Jzml; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B2d39A2179432
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ADqChi2oJyRKZgXlf3Py5M8f
	j2PGbv7l1hkC32g0A1g=; b=RNXtLmXOEB8BxlRiXGdGNpYLSZ6VPI61ZEH9yvlj
	vJEdATI1Jr7pDca6Y0L9mhz463vjRavP3ay76iCgVfhGbcxXqo4KWE2Lrw97Rhf7
	OcXGzhp/ZCR6TUX35MxodjYo4+cnRxDBTiGDHcQMNtBXV48tsKrT7Vp6kO0DtqlE
	yS9lN4boNu6OjtlqqIr8nbbzxOfTifwEVI6OSFaAR/aW6qkZxoM0cM1FuYdRvml8
	kPOBT+/F8vurgjLfhuP0y9ejQEjwLF/yMEqif77Xu+LPXrr8yQNTcrKejbK6cZCT
	8QNsonfxZRAzEzU7/DjOx86BISObsrIDbYZkPKpEEc/X7w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqvssjkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:44:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50911c94db1so150573421cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 19:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773197088; x=1773801888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ADqChi2oJyRKZgXlf3Py5M8fj2PGbv7l1hkC32g0A1g=;
        b=KwO6JzmldeXay6mGxqHIhbMhd50dBU3aSjvNTdxOAQkF6zj1L5nbgHFWFzRlWcMGdU
         Ji+HkuS4KxjbQJMkpNAj7g+YI1X3nX7qrqj7Y9F/zR9GWot5538ygwFew3GLspDQaS5G
         eZfYxTKaCco7lcF3znbApGINoSgFtmvhMKji66eoHD7JV/llsAhntu0B78+Azhe15dfb
         lF8utLQH1TzZocLa1RWA2vt6TlOyX9a6FZOT6urMg8OInYBds8ARNnQemetJgbDAuWG3
         pfHSJ70Aw9O53SFzYvwX2osYdzi6jOyeVkD4pttC/lsGV4CI0uflp3upyKggfcbOuIeM
         mTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773197088; x=1773801888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADqChi2oJyRKZgXlf3Py5M8fj2PGbv7l1hkC32g0A1g=;
        b=uxjiRh3xrWJC9k4jicFirmKjyW0404z5Xzbytxv5pHQ/0pRTqCq7ytYz3Gl0t+F1t7
         VW7+xbmOWku4lg1iETf8+aGXrmBgRJg8h6tJVnOZaJVSF4QDecSCmBvI7voo96gyQp3P
         NJ3ou68VaT4qfZqWfldM8pBaObP07Yt5B8AlvbJ0nBrH05edMR9UKn41xJXEru1PJUTc
         dbVRCwGhfXqYqbczGHeUIXMud33yqM3I5Se4u+d6fhCHokxE8I641Nl+EvNfU78zAPUK
         JZDGCmkjOPlVBIaqqreIiawjJlqTglx5E+LFgswAynwIfUBuBmvgUIYTNWtBcBqgf7do
         vIqg==
X-Forwarded-Encrypted: i=1; AJvYcCUTQsFFvGre9h27nsihgizrGbL1Jhg2kShVH68xSGHysjzvD1wCuPK0jX4KC6P7U5PWtgzZj12jMikUeva4@vger.kernel.org
X-Gm-Message-State: AOJu0YwJrqrgCz+UFgERNzJPTE/WP7O5lQVQQ+AOUNhzJWm3sNwCqeMf
	E5Fn5ysK3aJLgRpFyoXdvcys7bUfR8ZlOutuzcTp6+msdLq0xZrwT+PZTwxzRqlixyCPRunu5k0
	YdGeXJggjraEXNm9Sk26mpwlX5+jPP1prI4CGYrOB5ef4zoOsRqmqRu98pT8GKWr9dwqF
X-Gm-Gg: ATEYQzzWc+STPPzflhnUzEBmIJ3b0R/pnQwEY7rgWnYsHGUFT2p8iO0EosgcDaMxf1E
	UbpQtrAbzcwNtW0GZZh9L/VrRfqXQGaC8rBh/rKhE5+7FR7I8A4kdotfH4UUfx5c0bA5D63bNrn
	cl5nRuxWObcOAQ0rWrPULGivr/vCUoObXAmDM99czBcCkcNf+orkeFioAEzMF60E3G3fEFmMu3b
	ylqpS64PXOZkIHkDbuquqGCiwhW/0WKDbA8QAE7DylrlFf7HKtREOq72Jy8AICuLUT3bEf7pZC0
	7wBXFLcZem0WuEoCg7ZezS71MCU8obM4wcl3FkQhJ7wAIs+N7GnSsvib6IW7QJpwWxNuQemy1pw
	Ci1bhgH/0N/NEon2sUYNoj+Ugwwo3cTHl/l2p9ekJN1WzzTMjEL1Lqr6M0Sow3IhkcH7ruMJqck
	bQnUopoROijuooYHfl/WP66dzoC9jsaEomFMw=
X-Received: by 2002:a05:622a:1998:b0:509:2655:a95e with SMTP id d75a77b69052e-5093a18e46fmr11560271cf.62.1773197088577;
        Tue, 10 Mar 2026 19:44:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1998:b0:509:2655:a95e with SMTP id d75a77b69052e-5093a18e46fmr11560051cf.62.1773197088126;
        Tue, 10 Mar 2026 19:44:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e2ecsm157630e87.25.2026.03.10.19.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:44:47 -0700 (PDT)
Date: Wed, 11 Mar 2026 04:44:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/24] drm/msm/mdss: correct UBWC programming sequences
Message-ID: <xhv7wkdo5nnn4ruso2ycpgetboeqmdgu3tsnkpyu27jsgwkljc@o6kyko32rnhs>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
 <20260306-ubwc-rework-v1-1-9cfdff12f2bb@oss.qualcomm.com>
 <df807d03-8bcc-4456-9b71-c0ea7928370e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df807d03-8bcc-4456-9b71-c0ea7928370e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyMiBTYWx0ZWRfX9fnQWWuhdgdF
 21zy5xnXv4rDGX9yTNOT5jf8Hve1hiHoFIQ5hs17Xx8ZUGr3Y0tuUcPSgeqAPTbTbyvS99Gi40I
 YkFbYFPAK2nJffD2oibSE2e/rtrSl1fX0NdcCMdulfy7QJAA1pgqf8MBMTUPx9cn13MAmUgLX73
 b5gwaMUt4uS8qF2irO+m8A403QRJxBvhyFnkHz5NA9bFhs4z1fquo1Ev8JgRyW7S6Guwt99COPc
 u4OilqUfV+4SPxUjp33EgvOtRI5E8OogYCskwT2m54KBkDAq/KFHvrwzgljRitMYBAQkMN+5Z0+
 4ss9cvsZRz+aeYSKFG94nCL4VxqzYHAdc4dRVODcIK/u+FXqWoUnJyDcbP4GRbSG3hzeF2GobRD
 /FY08HwFAoVLpaXq6janmsAnILkaLOVgHOm048nLawQWGrYharMHCBT8H/2F3MXKlyGZ9HMiyfl
 0dpPMT1CzvZD/8J4GYA==
X-Proofpoint-ORIG-GUID: uyg0ZK3zeODvPpQBcCBwzPNVKvMqSX6B
X-Authority-Analysis: v=2.4 cv=Lo2fC3dc c=1 sm=1 tr=0 ts=69b0d721 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Fctm4YH6ai7tt1dG0xcA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: uyg0ZK3zeODvPpQBcCBwzPNVKvMqSX6B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110022
X-Rspamd-Queue-Id: 19BF625B1BE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96821-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 01:50:12PM +0100, Konrad Dybcio wrote:
> On 3/6/26 5:47 PM, Dmitry Baryshkov wrote:
> > The UBWC registers in the MDSS region are not dependent on the UBWC
> > version (it is an invalid assumption we inherited from the vendor SDE
> > driver). Instead they are dependent only on the MDSS core revision.
> > 
> > Rework UBWC programming to follow MDSS revision and to use required (aka
> > encoder) UBWC version instead of the ubwc_dec_version.
> > 
> > Fixes: d68db6069a8e ("drm/msm/mdss: convert UBWC setup to use match data")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	if (data->ubwc_enc_version >= UBWC_6_0)
> > +		ver = 5;
> > +	else if (data->ubwc_enc_version >= UBWC_5_0)
> > +		ver = 4;
> > +	else if (data->ubwc_enc_version >= UBWC_4_3)
> > +		ver = 3;
> > +	else if (data->ubwc_enc_version >= UBWC_4_0)
> > +		ver = 2;
> > +	else if (data->ubwc_enc_version >= UBWC_3_0)
> > +		ver = 1;
> > +	else /* UBWC 1.0 and 2.0 */
> > +		ver = 0;
> 
> You forgot(?) to use qcom_ubwc_version_tag() later

Let me check if the patch got dropped during rebase.

> 
> Konrad

-- 
With best wishes
Dmitry

