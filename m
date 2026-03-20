Return-Path: <linux-arm-msm+bounces-98889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0C+SLNX4vGlW5AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 08:35:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F35362D6AC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 08:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6427E305B099
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 07:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055D1344D99;
	Fri, 20 Mar 2026 07:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlThu4uE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2k+Fb46"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0EE2E6CB3
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773992077; cv=none; b=stbbY+Inzr37rZAfSVc6xSBDY8+reEeZPN42jmqtn1Xr2v8XVqfmCLs0//hz+kyZrO+Sk/8HNtrweaCvCOMkzInrl3O9d5BP0W20vD13pvmxem97cgd3/wrUzZz1LDcmYCcX7eEswmDGO2bLv+rsVR79bioXcSPbw60IxEs2tTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773992077; c=relaxed/simple;
	bh=EKy68RudI+g+WxO0SrBDRh6lyNJYgLw2jEHA+RBFWvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEIM4ra6E4zCe01wDUlCONWO7SN/ndpkmQ5wYZ7Qpr/uoFvZELgrREJejowLyxuRo6t6SN1uvMgXorZ/ImtDCewVTeHs+AyguXpOL6h1u8iulFP3HIGiBREW6NAT1Yd4jultBzuwr/nGwDRr6pGG5AqylkTLLOJ/Fjbcev7+slI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlThu4uE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2k+Fb46; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2XlVL2253864
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RzyaHrUF+2Rq5v8u7FcJPE2L
	k/P9aTcofVlQu5cNlhs=; b=jlThu4uEcqgP5hdHP6mNYcCVLySotGEvZxIybp+b
	zbvjrdht09MMe78Kz8NLlEtUUsiIqfzHWHvDmre6k7Xy3O7kcoG9TgPYQr5dsisp
	dsqHMiyPREuQpt1NZZl+FnC/mhv1zz0HnU2UJJOxkheQvGJxcL20AFPwzFItAaIg
	vsLbFDCUMoxjllvl7F5mcwfmAWFd2IiIZMzPctNm1gbEyIV0PC9NdHv7g2w2gXN1
	WAPTFkYDy5UnyIve/p7v+dBAVrtdtApY5SPZSxSxWWDT9JyNzBI/ssISLyIYcmcW
	+ETKTeGxFcYSso2O5YUB2sNfZd86Ybb8G3ylLtAwn1DBbg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0mcmaace-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:34:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5092efe29dcso80192681cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 00:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773992075; x=1774596875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RzyaHrUF+2Rq5v8u7FcJPE2Lk/P9aTcofVlQu5cNlhs=;
        b=W2k+Fb46FVWCK2zlJuIieO0EDb0boYFHW4mRYPEy7x+uRPhRLYpJQBakXxQxe2RPQR
         picI9srLBYK9x2JCBUTdOzWBuEL/CdtIfEMrsBWKMcuOoNFh481dtFPego76Javj+k0Y
         hHimQnEhKwwppOZ7YgGtdtwwNDCsC10Yyuk84ctTVIaPc24wNbespDN2gJ08ApL8jHfz
         fBudSRwbu/cN5Hz4efb47A1sJQCN1f57O51/QDK0qIeqB9T63O7xKMamLdKFyA4VxYnP
         3XebLXGfqwMC2tirRKcai/MOQrgHkTgmQ6Jq6fBPNO78/v1K5yXsjK0lG85d7sOSrJLz
         tcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773992075; x=1774596875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzyaHrUF+2Rq5v8u7FcJPE2Lk/P9aTcofVlQu5cNlhs=;
        b=M/RtcpM/H75UkAGee/qqypzdbz3vpoHr7DfAZZlAGCI6nlohCSaXvCwJQ6fX0pFmjw
         Fr0AplV4BW1kttks3N0We9p15U4hs4+fQCWphbP08ztq0eEwNyKGGirl+dRHvjOFbgcT
         EEhmKiRAI6dVjkHW/wfQRpUGUT0pGcRfDxMCrjSJkVX8aG/MfmLlXhG5xObBM/3e4WF6
         fl8I2QG2oRCXTr4VPRZlOVlKR609zAUJzufvpPC5PeOtozhuy17sTye5SDzugdx2VtRC
         FTaEOkpc2tvXI7g5GvF8ZFJ3yGBsUYAAXekU55UjrSZG0MTChabE2Y5UJjAqHVbGpI0d
         QzLg==
X-Forwarded-Encrypted: i=1; AJvYcCUqMmhNzQaDs62VyB8hhonWBZRWHAXp75jOZUYklSkANfpHqJdgHfaE8bVTCbLNjX7Yo4odWtmDlfHw/pr7@vger.kernel.org
X-Gm-Message-State: AOJu0YwDWK7tZBl7+7LI0YIhD4uW9lZoG0amWqc37uASDSsYIS8ih5jT
	iBbcQ29rS7AZhOsZ0CF3wPcbTcFv8Fm+HVZkEADa5Db5t7I5FY3zeglopMcuoteqE7RXZePAddp
	rYmXjPdcQuUODwi/g2G7KQE/WJr1DcFUQLxBvU4tfRATnf53la2ZX9Vbf9Hkc+sLpoQyC
X-Gm-Gg: ATEYQzzQmpDDcs75YqcKlfk29nd21jlXaNjB2eACvm6uZ7Q8wEiApSqTk8f+ZMgRa10
	IF/odIj0mXslDBj9hxVY+iK1xlvBIikDjBO8TDUF03WGbOkwC3mANGfBa8hUmcRnIIHDflrmotf
	15v+dz1RW2zcIxvWROQub/XiEIHDtdbGkDku9y0lnZOEJUrR8DkAgjV3rBeIxJP9nO0OsHPWAZJ
	hOnZXs2CeU/deWux2oQgFE8RvfsR2Ta0dOWSOQMbUoJUkzhXzKlAzctk2qQGsyDs+K182sNzGVh
	eID2Q/R/JD9o8uJqUmP356j2t8ImFBI+aw+7f374vwjiL7kEB7qkKCr8RV0v+kwHuTNPNDzdcjH
	6Ph7oTNx/Tdx30HYW82MGEyn3pXDSiwUT1TJG14RMaqBDYNREWSs07R9cbFUNNgml3fyUqwkggb
	8UnnTkm74WBzt6rtnCMzCjAOWZ1m3+5WnlMlI=
X-Received: by 2002:a05:622a:5145:b0:50b:2763:2bc7 with SMTP id d75a77b69052e-50b37437f1amr27547571cf.31.1773992074458;
        Fri, 20 Mar 2026 00:34:34 -0700 (PDT)
X-Received: by 2002:a05:622a:5145:b0:50b:2763:2bc7 with SMTP id d75a77b69052e-50b37437f1amr27547391cf.31.1773992073962;
        Fri, 20 Mar 2026 00:34:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207500sm374535e87.41.2026.03.20.00.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:34:32 -0700 (PDT)
Date: Fri, 20 Mar 2026 09:34:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jonathan Marek <jonathan@marek.ca>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width
 calculation
Message-ID: <afgu3v6tc6ehgbdv5elptvw4etrxnmwymjempfp3ncgap7xvpz@hllpalflucjv>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
 <20260319-dsi-rgb101010-support-v3-4-85b99df2d090@pm.me>
 <1360a31d-669e-48df-a1be-f0af4a253cd7@linaro.org>
 <3gLK4s97giqqXagfHKhfiIHbfbl2snwfOj9dcTNGPUYi10w9-1EdATqzz1LPCVTpz4bLFYOm8u_Fl8PfC7t5yabows4UCzRKVwjraEWW6hc=@pm.me>
 <3f8763af-aad2-4d92-90c8-cfd290212503@linaro.org>
 <7fb9dd9d-13f9-7bba-93d1-08f42dd6ee38@marek.ca>
 <oihbfczsj5cg7qfjjt6jvyodjnjbezyrv6f32vmg444g5bx6ow@r54epj7ilsyt>
 <da050aad-381d-ffb7-ec7d-8ed8a80d790a@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da050aad-381d-ffb7-ec7d-8ed8a80d790a@marek.ca>
X-Proofpoint-GUID: psNngIWsR8E0ONZBBx5h1b8hqbHzu7RG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA1NSBTYWx0ZWRfX6IWr+2Cuuos7
 WW/cDN15LMFr+Am5QH2vqgJbg1txSq996rO8Syt5AVU1IKcbfy3vMiaIQ0StPF405sTzC1FfAYH
 jSXX8IjtKMZVf1TdYzje0pTZvQgxaN5esE7i9c9mReZ7Ly+fnaol7JXQQKZtfHt/JZVzSuXn8zc
 UWfvGoJoHNgppi2q6cMNajHBbvAMuepiSN+qyy9XsA6h5VNGrB147jgcm2UqfmffArK13j/haVW
 9WhCcOV8agx/xkHIlmL+0XXHvIyyzQXp7moFTPWydup97MYMtBk0l8r+7UgRuZ4o4u84DKHtt6y
 Z0I2/44CvZe8eAJ7PYcu0pm4cuAo0RTVPgwft/rZJTWruBLGBXviBgYcz5j5aEsQs0G8EP7vpf/
 xFYrEjRpbDqsVT3t526ljS9s+XEZ4w1U33joR9hCgBN+ppimc7TWKK7e5xPNlM1Pxe4eepxygVs
 pyrQe1p1lwhqZFs2pWA==
X-Authority-Analysis: v=2.4 cv=BdLVE7t2 c=1 sm=1 tr=0 ts=69bcf88b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=qC_FGOx9AAAA:8
 a=bfie0XZXij7nCIgiEDAA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: psNngIWsR8E0ONZBBx5h1b8hqbHzu7RG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200055
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98889-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,pm.me,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,codelinaro.org:url,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.933];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F35362D6AC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 12:25:00AM -0400, Jonathan Marek wrote:
> On 3/19/26 9:45 PM, Dmitry Baryshkov wrote:
> > On Thu, Mar 19, 2026 at 01:23:03PM -0400, Jonathan Marek wrote:
> ...
> > > 
> > > That's not how it works. INTF (which feeds DSI) is after DSC compression.
> > > 
> > > INTF timings are always in RGB888 (24-bit) units. Ignoring widebus details,
> > > the INTF timing should match what is programmed on the DSI side (hdisplay,
> > > which is calculated as bytes per line / 3).
> > > 
> > > (fwiw, the current "timing->width = ..." calculation here blames to me, but
> > > what I wrote originally was just "timing->width = timing->width / 3" with a
> > > comment about being incomplete.)
> > > 
> > Okay. After reading the docs (sorry, it took a while).
> > 
> > - When widebus is not enabled, the transfer is always 24 bit of
> >    compressed data. Thus if it is not in play, pclk and timing->width
> >    should be scaled by source_pixel_depth / compression_ratio / 24. In
> >    case of the code it is 'drm_dsc_get_bpp_int(dsc) / 24'.
> > 
> >    For RGB101010 / 8bpp DSC this should result in the PCLK being lowered
> >    by the factor of 3 (= 24 / (30 / 3.75))
> > 
> > - When widebus is in play (MDSS 6.x+, DSI 2.4+), the transfer takes
> >    more than 24 bits. In this case the PCLK and timing->width should be
> >    scaled exactly by the DSC compression ratio, which is
> >    'drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component).
> > 
> > So, this piece of code needs to be adjusted to check for the widebus
> > being enabled or not.
> > 
> 
> The widebus adjustment on the MDP/INTF side is already in
> dpu_hw_intf_setup_timing_engine: the "data width" is divided by 2 for 48-bit
> widebus instead of 24-bit. there shouldn't be any other adjustment
> (downstream doesn't have any other adjustment).
> 
> a relevant downstream comment: "In DATABUS-WIDEN mode, MDP always sends out
> 48-bit compressed data per pclk and on average, DSI consumes an amount of
> compressed data equivalent to the uncompressed pixel depth per pclk."
> 
> Based on that comment, this patch is correct, and the
> ''drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component)' adjustment only
> applies to DSI. (note: newer downstream looks like it would divide by 3.75
> here, which doesn't make sense. older downstream would divide by 3 here. I
> guess downstream is broken now and video mode + 10-bit dsc doesn't get
> tested?)
> 

For the reference, the commit in question is [1].

> on DSI side, "uncompressed pixel depth" shouldn't matter either: DSI only
> sees the compressed data. But based on that comment, when widebus is
> enabled, by setting DSI_VID_CFG0_DST_FORMAT(?) to 30bpp, then the DSI pclk
> is in 30-bit units instead of 24-bits. And with this series DSI side ends up
> with the right result if 30bpp format and widebus is enabled.

Nevertheless, this matches the docs that I'm looking at.

[1] https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/commit/7b4616f157e67e593fae13684237f96da351e877

-- 
With best wishes
Dmitry

