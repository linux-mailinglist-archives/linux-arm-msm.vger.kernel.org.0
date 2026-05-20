Return-Path: <linux-arm-msm+bounces-108739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNo4BZ2oDWpr1AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:27:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A666458DA00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BD1D330066BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580113DCDA2;
	Wed, 20 May 2026 12:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEL3c5Pj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tdg5TV4e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC173DCDB7
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280018; cv=none; b=umsKptPRciesMmn/53r9ZB3G/WD/VmU0CsxyfD2oMkiCChxxqDZZCjTIboO7TR3d/JefilmSFjFRD0yeiu21NgBRWrxP4/giS6exAyPux/dmEhfNEhxGi3B9/F9yEOtywGswEl5CPpr5pzgVjV961aogSYSCR7q3lvY0BrT8uy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280018; c=relaxed/simple;
	bh=DwsYZ/L59gK2frARM4OpTutCsqwpRRPxIu26xmMRpGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejBnuNis4WgD/pNDkiKu1CFa4xVs14uLtakZTkHlP5P6E+PABpzuzmW9iwnBAeAPa2d1PPmgcqChPkfRcbwwZnCr+fb6jmk6hBaPtKXAKhC558fkzfkzjvQvOErfAdp/ofytqwE9dbpDqiCFTRb7tDr6H/kolnWv0oIjQruXZuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IEL3c5Pj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tdg5TV4e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K8vCbt4115900
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R2TeQqks38QIoyDMGjnlHZik
	TcCtv1Rua8ztzIrSGMs=; b=IEL3c5PjqWlF+XsnVNBCelp1TMrAsAl6meLx5Fpo
	Qr75sMcTLEqvMdOoHpU+OYtP9rhIOv8nIPX2wfHkYe4nimwsj6eonlhLInzGyoGl
	oVbmLIkw1KIBlyCCv2dRGadc3GEqceUukay8kCYuJCqZoEdQWqv7JKh3rokRh08w
	Uw9B+rDuloBd2LhhoKtrHOmBshYeaAUnYl5ZUQrOOdDMV4niA2Ik+YRqg/JSVkE3
	E569Mg7PhhYWhMWuS8uuPG91zGmYPDzSEjVVfHeVMZ/bqIpFWEmQfMJzWK0Y5oxS
	Hh9rAA455ZRtUUTKQxNd6bvmZcDtMzG4mGTNObVxK1Q1SQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e99w0gs2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:26:54 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95fd0a49df1so7171391241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 05:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779280013; x=1779884813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R2TeQqks38QIoyDMGjnlHZikTcCtv1Rua8ztzIrSGMs=;
        b=Tdg5TV4eAeEyrSF2FR1YNb7YlOtRqI8Ig2L/WkOfKMVdkxrAg9IQGEVCEgM8h/v8AR
         JdH+fkm+wPy/NMKltC6BXgxQG71sqR6TsDls6VW97b+2bvDylWVPZuDso8Q4R05NKDz6
         aEINzkwe7EhcrvCFSWCL036buA+7JXSBpsERJPDaRRqupdLWNiCGqAF+DjStVGMXR9lZ
         +R05f7IjJpWVWsM6hT7tt90IAb+W6tynhrQneZ1sUbcijTyn0fzZHEl99Dgus4CrGZSi
         ihzutamSMxraqucW+BhPsFx3s3L17WeHCn1hgOczzk1lTCSEQi+D4Ylr7qbo2+//eT8x
         S6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280013; x=1779884813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2TeQqks38QIoyDMGjnlHZikTcCtv1Rua8ztzIrSGMs=;
        b=Rb04ifrPRFw9uYjybu+fsskLVFm5LBSh6/3rIavxzCUDm6gnx+H0iwB9EXMv7tVJDF
         go6Nzis8m7yKMQyYnbZ6Np5+T0cLjsMr7h+AogdIq7QAy7aSssu0x6QaIVoWhl379Pmd
         Zdn6a/bJZcCdxao7YVEm88GH4QR8aKgFO7IAgIgRA3myIhwy4yJ5fOlZGDPqkVI/kREK
         KhNr8bn8b5DLZ1rHa2h24fpzqb6rs1N6RhIoUst9DrCdTQ4Pt/v9KWdnScGwoQCTabVH
         RsliCW58vq/oHqS7XDBWhz4oVMo3vWJHcxzRzipsU2+7k4qRSxefi/P70cR1sRHGMPnN
         jUSg==
X-Forwarded-Encrypted: i=1; AFNElJ+zmTBwsnMOgWjluXFwcKr2J0AeC9rwWflJ0Uw2mNWCV4+pTtmLh53wYyFr4gv6eJN952C7F+DA13gH2khV@vger.kernel.org
X-Gm-Message-State: AOJu0YwH5WPxFCPqsinqgPU40bXorJFBld6/+mTqBoGzGFMsZBBlI//g
	ZQqII0ixLYQNBLk++HbqcHdXsOMJz5aD0T3e8P0sE7YG3Dk7DMUY7QWVknL1RF+WxijbzeHOlsz
	VP88rMZ1zr4RE9W6T6QR1h5ZV159SXBdP76OaKEjLn9XNdypnDWgWFgAKPy4kTcqOQ3mL
X-Gm-Gg: Acq92OEBIYudro8MUsFFV2q1ktcPDDtr4L/MSo4+hohpqakkafaBEk4nuL+6gH0e9wP
	d6r5PSRftKx5ESHKPMhBapSJ17dPvqFNe79rw7dpOD8Fv1T4ruzuihD7egs0VXQM2LVR/Hc3BWC
	HS2pQm1ZVJgXfMKiGrTHe4CcjX27yZBq3cqZhBtUvx6HfDSFnw8F13ydr8zJZBdWDXs80YjEJU/
	g/ubTQ+2qZ3hsDSKGsIqNKYrxlmWITq1ywid4k+cYO4aZv5RyxMORb/BwL/s+v9ppd3y1EIUN+n
	ioqSx0OxS1LcnyALaHaCakCR7UaGOod+WP6ogXMOT+sroeb5G5XfVteLfAbTmi99rjeI/vMN5nx
	vfjiDjIHOGr0yZ8D5acsr/aJvy358XU+Hs+OUaUWIN1PxK859HZwh/+5Vm/qhwPN/M1TQfVi5Y5
	gR7TDYRunpUdbYoybxqPwdmk1MSowdgxwdiqI=
X-Received: by 2002:a05:6102:5e86:b0:633:d7ec:153c with SMTP id ada2fe7eead31-63a3c801ffemr13878889137.3.1779280013357;
        Wed, 20 May 2026 05:26:53 -0700 (PDT)
X-Received: by 2002:a05:6102:5e86:b0:633:d7ec:153c with SMTP id ada2fe7eead31-63a3c801ffemr13878848137.3.1779280012801;
        Wed, 20 May 2026 05:26:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a7a0sm4868217e87.24.2026.05.20.05.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:26:51 -0700 (PDT)
Date: Wed, 20 May 2026 15:26:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
Message-ID: <vvlw4f6xo7krq3xoyxuoaa3tecrgduw5qlujp3qf3zzibzjesv@demhqzadavql>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
 <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 72zFCMzaLMag1ptmzI3Z7dISOe4pVPq5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMCBTYWx0ZWRfX9fmsjiwYPCSV
 EmjpmSjEHxEfKRtwobHd4popqZzfV/YwOcLSDPAPAYtRhG//lkJzoAox4dtIDbZEW3UVa56mF8b
 4M8MMzS+x5fr9jxmuKkSdxvaIkXa6NbTov+HBYIDFQnxoO3uP4edOt01uX0XnnmSedR/kf8AtMV
 dJZeCTSj4EvbxfHuC5kDSwq4lSbxUMuAqm3u5NG7gmCZp4RcoUwFlRBi9WA8Z/2YXFoNtpN4WbD
 7LrjBAubREPGVzduau/F8fFfL1Ed7cNz22j+TJ8mb5ijNvJcMPsaYkLJ6xwtXkSdVpmQQ2gsl2l
 deFqDPiFnzz4kGVdjTLIG4lQsvm/f9V5gTrFmqhaKkxat1l3rscM3Sd+9eTSWacpVAIuEVGD9XP
 IcBj1rQGPJZm8jeZ6tQ+DgtJQzVMSEvyPjWXloAXzRR26SvLl7Oz68Z0rQDz3zi5f6gk3iBDRan
 mJh91l1i5hwRAfARbrw==
X-Authority-Analysis: v=2.4 cv=RZigzVtv c=1 sm=1 tr=0 ts=6a0da88e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=6jUhzznPuw0D9V4-6sIA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: 72zFCMzaLMag1ptmzI3Z7dISOe4pVPq5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200120
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108739-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A666458DA00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 13, 2026 at 09:23:21PM +0300, Dmitry Baryshkov wrote:
> The DisplayPort standard defines a special kind of events called IRQ.
> These events are used to notify DP Source about the events on the Sink
> side. It is extremely important for DP MST handling, where the MST
> events are reported through this IRQ.
> 
> In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> events are ported through the bits in the AltMode VDOs.
> 
> Extend the drm_connector_oob_hotplug_event() interface and report IRQ
> events to the DisplayPort Sink drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_connector.c          |  5 ++++-
>  drivers/usb/typec/altmodes/displayport.c | 15 +++++++++++----
>  include/drm/drm_connector.h              | 19 ++++++++++++++++++-
>  3 files changed, 33 insertions(+), 6 deletions(-)

Greg, Heikki, would you please ack merging this through the drm tree?

> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 47dc53c4a738..edee9daccd51 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -3510,6 +3510,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>   * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
>   * @connector_fwnode: fwnode_handle to report the event on
>   * @status: hot plug detect logical state
> + * @extra_status: additional information provided by the sink without changing
> + * the HPD state (or in addition to such a change).
>   *
>   * On some hardware a hotplug event notification may come from outside the display
>   * driver / device. An example of this is some USB Type-C setups where the hardware
> @@ -3520,7 +3522,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>   * a drm_connector reference through calling drm_connector_find_by_fwnode().
>   */
>  void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> -				     enum drm_connector_status status)
> +				     enum drm_connector_status status,
> +				     enum drm_connector_status_extra extra_status)
>  {
>  	struct drm_connector *connector;
>  
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index 35d9c3086990..7182a8e2e710 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -189,7 +189,9 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  	} else {
>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
>  						hpd ? connector_status_connected :
> -						      connector_status_disconnected);
> +						      connector_status_disconnected,
> +						(hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
> +								   DRM_CONNECTOR_NO_EXTRA_STATUS);
>  		dp->hpd = hpd;
>  		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
>  		if (hpd && irq_hpd) {
> @@ -212,7 +214,10 @@ static int dp_altmode_configured(struct dp_altmode *dp)
>  	 */
>  	if (dp->pending_hpd) {
>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> -						connector_status_connected);
> +						connector_status_connected,
> +						dp->pending_irq_hpd ?
> +						DRM_CONNECTOR_DP_IRQ_HPD :
> +						DRM_CONNECTOR_NO_EXTRA_STATUS);
>  		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
>  		dp->pending_hpd = false;
>  		if (dp->pending_irq_hpd) {
> @@ -397,7 +402,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
>  			dp->data.conf = 0;
>  			if (dp->hpd) {
>  				drm_connector_oob_hotplug_event(dp->connector_fwnode,
> -								connector_status_disconnected);
> +								connector_status_disconnected,
> +								DRM_CONNECTOR_NO_EXTRA_STATUS);
>  				dp->hpd = false;
>  				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
>  			}
> @@ -827,7 +833,8 @@ void dp_altmode_remove(struct typec_altmode *alt)
>  
>  	if (dp->connector_fwnode) {
>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> -						connector_status_disconnected);
> +						connector_status_disconnected,
> +						DRM_CONNECTOR_NO_EXTRA_STATUS);
>  
>  		fwnode_handle_put(dp->connector_fwnode);
>  	}
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index f83f28cae207..e05197e970d3 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -91,6 +91,22 @@ enum drm_connector_status {
>  	connector_status_unknown = 3,
>  };
>  
> +/**
> + * enum drm_connector_status_extra - additional events sent by the sink /
> + * display together or in replacement of the HPD status changes.
> + */
> +enum drm_connector_status_extra {
> +	/**
> +	 * @DRM_CONNECTOR_NO_EXTRA_STATUS: No additional status reported.
> +	 */
> +	DRM_CONNECTOR_NO_EXTRA_STATUS,
> +	/**
> +	 * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
> +	 * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
> +	 */
> +	DRM_CONNECTOR_DP_IRQ_HPD,
> +};
> +
>  /**
>   * enum drm_connector_registration_state - userspace registration status for
>   * a &drm_connector
> @@ -2521,7 +2537,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
>  }
>  
>  void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> -				     enum drm_connector_status status);
> +				     enum drm_connector_status status,
> +				     enum drm_connector_status_extra extra_status);
>  const char *drm_get_connector_type_name(unsigned int connector_type);
>  const char *drm_get_connector_status_name(enum drm_connector_status status);
>  const char *drm_get_subpixel_order_name(enum subpixel_order order);
> 
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry

