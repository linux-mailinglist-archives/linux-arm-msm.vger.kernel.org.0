Return-Path: <linux-arm-msm+bounces-112823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CPwJEvI8K2qf4wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 00:55:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F7A675B9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 00:55:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="H/cBAyFw";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W2Ypkzaf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112823-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112823-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E10C3010383
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E9B2248B3;
	Thu, 11 Jun 2026 22:51:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1558431326A
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 22:51:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781218294; cv=none; b=oECjI2qITF6rb/yja/9FWMQ/B+mMij6Ai4WUZDt98SbyZR7EQvnaNaD3jACforjsSJBcQmi4riOjCykuDP6I9JTJXaUZrODL1SsSO8jtAyf47XOvaawcxOiLCbySwHhqmudjfjC2Van1qHC1xqUkPjd7mpONq7/srV1uMWAHtn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781218294; c=relaxed/simple;
	bh=xZU51xsrFDyuXrpPkImrsAeUz73lRWpl+dUEsSpz3gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxLnoN1MfgbvTXEOY5MIncNj0/k2U+7KFiNxxurlK2qyLKKhd65imNNleYBzhkoB53TFvsGL9EMJZi2SuLdmtv8jCMYUfBp9hSdZgSbl+3ptHEVwOcPswyXAOUnsqWGinDApcTA0qrU4GzPH99WpuCWuoYTg9dzQ+b56B6aFxyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/cBAyFw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2Ypkzaf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMVKX41965227
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 22:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yfHbR9rqFfQKGmo8JSks8LxH
	zsRizL4Zr30pbCe6ab0=; b=H/cBAyFwe6gIBT5/TY6hD2y3IB02QS+IYkeZ/KL8
	VIBGMOcRoU4MDBHtzgk5IUAPdRSW9M9BWupt1IzGswuFSByO+w2q+gi4Qka5B8XB
	SxvyxM0fMXU0axPzXYASDaUMvyDIfXar26vx4PmlDlNCtr3mMH3MDFqUWf6GxD5r
	1CBUD32WUWxE8EKZiMPNol9sQ4GCmac0PnbV0NWD5Ax/VEsAcmR4TTMKL1votwFW
	xYL3ECX1RhPvpemunnv60uDk47hpW+R4++T+saBffc91ONNRyTpOMl8l2YjG43k+
	fwbW/T23caP4Ve+m3Z58xaePwPdsMrehbTRNKiwkLTRbqQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29urxjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 22:51:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5177bddf6e0so8399751cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 15:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781218291; x=1781823091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yfHbR9rqFfQKGmo8JSks8LxHzsRizL4Zr30pbCe6ab0=;
        b=W2YpkzafLsI0eSvLk9PQyz53+aKxbVvOhTZ6b4ZIaM8uH44BJHQPmhm+7fIHUFNnMW
         XF7/Y8NZilZndcV+dh68CpUBej8u9QaWZnbrKGdZGoEjBbWNpnwjI9aQiy5WOZt8kepq
         sQg9MeSwkM3aX6kaxBRflTbvqOxypw57Qt2Plx8I/DnrHlZbKb9WfKtwIG4lomBhuC2u
         xynhPlVHGJuZBQyNyvQw5qjUSJ7SP9/eEiZngQb1uabjci8liKDZzxN4ezWPjYlk+q4j
         n16nbK8vP5xJ/ZNEccp1GjLZpDVgw8TB87GssJOlTd0pYvFe5gzU5/9u5m5rctoWJO9o
         a1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781218291; x=1781823091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfHbR9rqFfQKGmo8JSks8LxHzsRizL4Zr30pbCe6ab0=;
        b=KREDG1IT7CqIzhlCo5UXvLBMjNi6sx1o/QxmSrZpDIS9dkkbHpDzVnud/51ek01dpS
         qbMFGtFNLxPTYdMBQPU8UNigM1bQvE6uVksMxvrBs1mMQqlyf3ybCopQd7P0il0p6IcU
         +eNSVqUrIOIDjcE2qz9WQh6ZG7wd1MN5CH9fY8qGGorOjhdhHzWz/n2GJH2F4AUp8imI
         PRs4LP6bJlyYa7DMKzdzDip03eaQdQdFN+MHyY+5+4JkMlptDuYNu67AyQ3bb28bke7q
         cCPeuotNQ8C/GexIc4hz6fhshQNF4JoNqLEpBr6t1T6QlT9ND8zHJMuJe7oZ/sgoPFcq
         YEoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8fFP5rfkeQE0r5gjI81p23OkGIjMMhf9nhaz8G9nG4vnlRTNCFS9xBIG2gQbv05GO9TbEq2fjy7bWOHxN8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ZpzvwVhdOI6AgmAFlV+3zJHZ3OjW7V1nbsQnno175JR1Ye3O
	9XiVNCpSKG35oipguGTCoyPUDGMh6LmPhkqOwxk4T/2rEzWwcf6HQYbAFf4Lt26RM5J9P5wN9yh
	liQ6HC9gbwRuZ1cBXFDZv2xL2FEzHBHE6T0MJMxuYks3iU9nQeq0HhEaSFCfAcbsBAKks
X-Gm-Gg: Acq92OEbZkorRgkfJOsJMCcKVVxaT9QVOpUxIpeJ+H5N/FipY059TaEamVFpeakk+yO
	EzS2yye5VXp/9XPbLrLnwc27TXnhqp+qcJdnt0g+6MPBFKhxyc0eI+aADrtimeVH3WxoVl/BLT2
	oJLh8GXkkuJWdyM9gM9YHhHvgV3EQlZj5aK64l9Q23ubK6ity3+NLjO9xy6Lz5HNUw4xf259sro
	xmGIOc4Hg04oVtWSqrB0Y0OoYFdj9MdF9u0/7mO/GZyOrrJITrbmHUR8v8JzsWj39x2PA8P6SOd
	5lNHpOZilwJ7nog8EfC9YwX4jmZlGMOEFrt/Lf3zDbIA/SIOgQ4Qpgdj31tEnEdpAipB6hxgmMl
	iGaFc7jgHt7ZBmOPQa38Aiouv6ItFj+o4qNURYnHmUki8Rx21eKNQYU4ZsHA+h2P18Kkx7Qo8aK
	lnjFmLVqJUEkJUXZb71mWARDniPmaaKR70zog=
X-Received: by 2002:a05:622a:1654:b0:50e:474a:47e1 with SMTP id d75a77b69052e-517fbcad6e5mr11463251cf.10.1781218291473;
        Thu, 11 Jun 2026 15:51:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1654:b0:50e:474a:47e1 with SMTP id d75a77b69052e-517fbcad6e5mr11463061cf.10.1781218291069;
        Thu, 11 Jun 2026 15:51:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e162059sm65e87.1.2026.06.11.15.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 15:51:28 -0700 (PDT)
Date: Fri, 12 Jun 2026 01:51:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: unregister debugfs entries on teardown
Message-ID: <e4f6k5qtgzod33o6534jnz4wqgnvxq5yjkeygzqnzertrygcym@cosbugve2oh7>
References: <20260611-usci-unregister-debugfs-v1-1-f4a518a94f27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-usci-unregister-debugfs-v1-1-f4a518a94f27@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIyOSBTYWx0ZWRfXxPvN2wviY5Vs
 APASFs//smqDAy9BQqy3/SZkF/vAlWuPHvvZSUBAF8gNjhvSx0dh/oHCiRz7nLvVnkCP0SBaIxu
 Z5ycsMTOcP4MrxfjR+QGOvyi4BaWzeE=
X-Proofpoint-GUID: XFGAuGVdNQmgMQQ3mK_OvKHmSa9DHIKZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIyOSBTYWx0ZWRfX9wl01DA2qVTM
 xUAbgFyKlKc0dTqrvg4u2Z/UC/EGj53RcXQil9iYNZ4QX6lDTTuY5T1rR+Xiepx9dDo0yVt0Gbg
 E9lnFvt6YC2yxVR429JcLv9RFNDeAfHqa6P8lx3gXrZwMTm2EQvg4BXWN/kLfE4WgXvnLwWJITy
 OQ5v5/UWJI0VezcXEOHj91PkMoZe9FaetoTXjXtUiLziwU7D06IwbQrbPc6FdgFDe3x5IuRYBDP
 GuO0CVrVzgmc7AYZWdNrvtT8GEy1WBiPg3tm0x9nZ2dVAkXtyPtmeUI5OsxMQEYjxRbHTcQ/+O4
 q9Pi/FadoGataAK6MTZNDytmzX0Zn4Z5B/oCYUTziF3qh5oU4B6fIl94fTNYBeLMWV/k/ks9wNF
 ZDvzo4h+FFDJd+Fy4AeDe8i9vbngxJWrMNqd6H1AJAdLteqOhpwtZqJpvhtIUufkiOCx4zkkseW
 6xKm6qvx8lgfF+Y94uA==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2b3bf4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mG9sLCa_7-4xFCwKNhwA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: XFGAuGVdNQmgMQQ3mK_OvKHmSa9DHIKZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110229
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112823-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,cosbugve2oh7:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bjorn.andersson@oss.qualcomm.com,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0F7A675B9C

On Thu, Jun 11, 2026 at 10:22:02PM +0000, Bjorn Andersson wrote:
> ucsi_register() creates per-instance debugfs entries, but
> ucsi_unregister() keeps them around until ucsi_destroy().
> 
> Drivers like ucsi_glink that unregister/register the same UCSI
> instance across remoteproc restart then try to create an already
> existing debugfs directory and log:
> 
>   debugfs: 'pmic_glink.ucsi.0' already exists in 'ucsi'
> 
> Unregister debugfs entries as part of ucsi_unregister(), and
> clear ucsi->debugfs after freeing it so repeated unregister
> paths remain safe.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Missing Fixes tag.

> ---
>  drivers/usb/typec/ucsi/debugfs.c | 1 +
>  drivers/usb/typec/ucsi/ucsi.c    | 2 ++
>  2 files changed, 3 insertions(+)
> 
-- 
With best wishes
Dmitry

