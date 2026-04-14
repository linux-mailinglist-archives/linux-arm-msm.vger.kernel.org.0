Return-Path: <linux-arm-msm+bounces-103207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DT/OCE6D3mmdFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:11:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F343FD80E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4621F3009B31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A120307AE3;
	Tue, 14 Apr 2026 18:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcQ8DkL5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MfOI2fAp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8162D877D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776190283; cv=none; b=dI47GVIQsci64lpgkUXkOEmM6eNZuoUbhqglf3w0XUEKKIkpbu1Xrwz9Z6PMTTFMTnWwmAoGf8G4XZm4rCtTOyQCOt3SELJnONkKjoHOp0+V3M19TSpUG5J4oywXyChGBTccS7WNWPeDFWyCQpe4UhMQcKd+ZFuDLkjS/cSJAXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776190283; c=relaxed/simple;
	bh=eDZVTgs3e9GVD0EzjLTed1OxmEaesZR+1C5508tI5Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ob6SnxrpqncUqCiv2gUqRTLE2EWLPEuElz4FnrVAsG37bkJNBuq70ka1ZjbyJDghtxtStT9mnh/bugZHEdzFa8+1btheaDaSO27IIceburNRKrfxP+zENlFrB78B3sPh7ywsC7SJFaUZxYj6u788IEt/u/knUVzkToX7VM2fujM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HcQ8DkL5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MfOI2fAp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHvqCB3059047
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J3D1WvWzIUqXKZeMB5J0CZaS
	azdSgxka7Wv0a/uVx78=; b=HcQ8DkL5wR+z0LAnelrcY9G7YQ7HrPBbUP4vQzXf
	oDTa04nhEXZuPH8Rh8F0MojcGa6ncsuXiYwir0McDuz7oIY2Tx6BaxLiyUwHmSAa
	DMT37De5jqu8PcE3kKMZsGEyrt5dOzirj/GU2z6gD3QVRCvRv1kFgiSMf2VPoggs
	sYJXG7KwaJwb56/WuUcf9at2g4Eb1LyVgpTBynSCzmA7FGmpxJ/u5+xw9cZGNSc+
	L7QotibucPaXSOA1ZiX8+SQWZX08RmLf4Lh+WSsh798Bahy9Qt9ZGSfrqf5YaWyr
	e0QwG4M8JPaIWADRbQmbTRSC++rCkHlqmfXt7FbnmCcmVA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtepr1kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:11:20 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-953f6e0f1e0so8299537241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776190280; x=1776795080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J3D1WvWzIUqXKZeMB5J0CZaSazdSgxka7Wv0a/uVx78=;
        b=MfOI2fApt6k1JeMA8pBCyzKx5x7jQvqCSv4Ay9FtWdcrtn5tXyx9OUd7ZHvG1FKQMh
         dQWf6Svr6/uPjNIH2d2f/5taXn+Y3DNfzFwBEIJG3MUs0UiO1zY0M5xuT2baqM5sQTZB
         Z/5ArlNHSiz1OFjwM1PslSnNShjJ5XALC54Y8WXds4gmY9iyrPTvOG01lv83WkXRUtSu
         KrxNaBUhefZudgvtusEKzQGKu+PO9//74KE8z9rrWYVa8rTXq1dpn9pXAlRm+2W9CdS/
         wyM5Om6jGQHXuS+afBFLaue2CfKqr6idRjv2lX4ohaj5kXNVVRB/kqeirYW4639RVopY
         gqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776190280; x=1776795080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3D1WvWzIUqXKZeMB5J0CZaSazdSgxka7Wv0a/uVx78=;
        b=RwWlh8NuXFNU1AowjHK49C5wvtP3LYuwrUz99kpJekZrLeHBfrliEA1LhQuj+vr2fs
         F3drVknFtC/n/SRSmsEllTijhkoFyjzrnaZ0kfyoADyJQJL+9lVHrSZyN/azX7EO4kqM
         p/9XP2X8fDr/tU4/z+gBonzq7R8535SgfwFCdth/miTefmgEMeMMmPRZ0Hlnt9FKUagU
         QoqGU2ybWjhe6omusumg1h+coSH71OrBcwtoOdpBYBTOkjGNkKy+vRIJndqlo61rF74V
         Wwt3BwXkDy7p8egFCEDYDRJkQ+DfMlnveCa2AZU1P/nPcblASQ+Wb50Oyc5E9FGOrIlK
         7S0g==
X-Forwarded-Encrypted: i=1; AFNElJ+DMfI+i/XN78uvmQ6D+y3TQ/cRLeFdT6GJbFa+ghR8QX/TTz7awz/USA6TZI4qgbsLpamVkP7/AM8w5LNz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+eGUy65EISdMPK+Xxl+aWvWHJ4OcVqBDs6dl/tvqKfPP5Xqt4
	3T/Ogyan0YpQ6vNi5asEZ0wPOsQ8X4jvlfc7vBIqkpxMGjhrhbweioq0FSqY3JE/X8lefv9mWwA
	p2XmoLKE4gRk42qvxHOOzLTYxDn+dtaOAL3BGwqpEwpDDgCgUJUYOts+F+tiOKcyJd6ZL
X-Gm-Gg: AeBDiesxlrdkxKvIjmTv84eM1v2MDFwsMDN7k70u9eZrRb3JrEL+SEshn37HcooS6Fj
	U1LQwFaWU0RYZV618nMsT+2ALdDF3YZEc43QknI9G7W7++iIRVhd23wah8jcOfeONQoBbK+NqjA
	hAtvGcQTyGGK/5FsOYCTueBgrM2hhCKf/2FU4hqU3BRibfCUA9kmbe7Jgt42LmyabyJ1oR2j2c/
	YHR1PcdSQR1dYejKoQlIO43+hTfQHURQvNhAqodDDPVxJEQEIddSlkArrZSGLnXUOYm6ODhWh+j
	2tapMqESk0hPc5oziFPCkZ63N3JIG1FvChAGTZbJq6MnzmSaH+5iT2DbSR8a47oUGx1BwjZ3O/T
	30hLln1yelB5V8LyzTnv66DC7MlhuXdUCth9s13FuoaktmnHEJ8TFax8PvH5sGEyCcqmjmmxfMZ
	4reviZU+GeXP3DS9B9NEMIaSbqjePth7XQrI01KKpJy4aBGA==
X-Received: by 2002:a05:6102:3ec4:b0:608:7b2e:4160 with SMTP id ada2fe7eead31-609fe7a6d0cmr8943960137.5.1776190280344;
        Tue, 14 Apr 2026 11:11:20 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec4:b0:608:7b2e:4160 with SMTP id ada2fe7eead31-609fe7a6d0cmr8943935137.5.1776190279941;
        Tue, 14 Apr 2026 11:11:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495455acsm30849991fa.23.2026.04.14.11.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:11:18 -0700 (PDT)
Date: Tue, 14 Apr 2026 21:11:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Pengyu Luo <mitltlatltl@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/dsi: fix bits_per_pclk
Message-ID: <7rzdzfon3mytcwsagddr5c57aypkr5rxco3ubtwe3osc7zkonz@sfskmvme4m5x>
References: <20260307111250.105772-1-mitltlatltl@gmail.com>
 <177463970785.3488980.6066718261448635938.b4-ty@b4>
 <DHSSQYIFSY92.1J57RLTLCH8B@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHSSQYIFSY92.1J57RLTLCH8B@fairphone.com>
X-Proofpoint-GUID: pnSJTpnVXpbfimr4gMuznGQKoCRFZq1A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE3MCBTYWx0ZWRfX6xR3nsAT7CP3
 WCgUNSZzSTFvz4FH0HsjPrs0qVxsjLTIfU4JNg33LOsBa9saCALh4Z8gZFm24AquX0srdDYlNCb
 LG4+xfhX9Gd+i20SQOKUis4ZM0L0ClALDhutieWUzZVr22lYDzGJeQmX6p+cSS8js6p09OHJih1
 36lnwSWzaUo+RP4z0+0w+hvTiw6UQ29qk27ERWOFVYYlQ0obKLF1+kA9epXqSf3vuEXxqJo1Lo2
 uhVx/4uv89WLqw81mP56tMPnDcsfmY5dRtg98Tka1coFMYGc0cNMvdpZ7WMmXgt7PHpM/vzKoSx
 B5hKyN048eBxGOvcZeEPBB/Z7Da76bpCBo9vrfvyDLzBNSXGcUzdBXRexSxBZWzkNEPlxei4FrO
 qkR9kcxJDp/uGKMLOFFk/5MKhGtN4UneuyxWMqxVjQP6Me3fmIe2SIwpk0/aLnanKzjxurgyinr
 hBN2lJ27pVMjSwqU5Xg==
X-Authority-Analysis: v=2.4 cv=CoGPtH4D c=1 sm=1 tr=0 ts=69de8349 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8
 a=587haw6TKzS2yHxLNCAA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: pnSJTpnVXpbfimr4gMuznGQKoCRFZq1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140170
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103207-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.freedesktop.org:url,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 71F343FD80E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 12:13:45PM +0200, Luca Weiss wrote:
> Hi all,
> 
> On Fri Mar 27, 2026 at 8:47 PM CET, Dmitry Baryshkov wrote:
> > On Sat, 07 Mar 2026 19:12:48 +0800, Pengyu Luo wrote:
> >> mipi_dsi_pixel_format_to_bpp return dst bpp not src bpp, dst bpp may
> >> not be the uncompressed data size. use src bpc * 3 to get src bpp,
> >> this aligns with pclk rate calculation.
> >
> > Applied to msm-next, thanks!
> >
> > [1/2] drm/msm/dsi: fix bits_per_pclk
> >       https://gitlab.freedesktop.org/lumag/msm/-/commit/2d51cfb77daa
> > [2/2] drm/msm/dsi: fix hdisplay calculation for CMD mode panel
> >       https://gitlab.freedesktop.org/lumag/msm/-/commit/82159db4371f
> 
> Just wanna document this somewhere, 7.0 is quite broken on QCM6490
> Fairphone 5 (8-bit cmd mode panel).
> 
> Picking these two patches plus "drm/msm/dpu: don't try using 2 LMs if
> only one DSC is available" on top of 7.0 makes display work again.

Yep. It was a bit too late for 7.0, so the plan (and hope) is for them
to be picked up into 7.0-stable.

-- 
With best wishes
Dmitry

