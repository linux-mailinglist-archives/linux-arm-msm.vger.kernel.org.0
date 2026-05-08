Return-Path: <linux-arm-msm+bounces-106713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLSIAAwv/mmvngAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 20:44:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1C94FABBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 20:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56F023015CB7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 18:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD27B33F38A;
	Fri,  8 May 2026 18:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WR0Iykff";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ac938Y0u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9183DA5B1
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 18:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778265822; cv=none; b=VXYHQ4aV1IfXaiyl1QFdUQ+QOjYZcAidrHLJT+FR3SVXYooEQRpCzTnHNnCp6vHPkGhaNX0LXnYr0VQ3vH/fWfB9X37yf0w3vHQH2Femx6dKUZd77dp/D6RtJlTiTcSvWScwDrShpJePCNNHN7d7ip62U05vPbcsXdrQoFTOPZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778265822; c=relaxed/simple;
	bh=qPub8tKLs1R69fRcf6P8Spqyr2ma76n13zw9peIcGnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fLxZdzXZucDv0BnpbYqQ6kb86LrCJ3adZSIOn/vpfV2aJdcPnWQMX4uWoFelCcpHxTzFuYwHJWHqs3d9if9TZRi4Ba7lcnD+Vbvi0i6dtERvQvj2fhmhll8DeAotMQl+qd6r245AOsuAbXF97b6ci4b4v1AeyIfz7TLAkFK8rIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WR0Iykff; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ac938Y0u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648BgZ8Q1173965
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 18:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y+uqtVLmFUCNQVUxTe/oua21
	5OO0zK52yL+pzUl8BNA=; b=WR0Iykffq66Bzco9V06J0clPwQQqWiJ7T6GBC40i
	aaI/R+4yQqoVgDeivQlPSPR0t/zBQnr3BbV45qER6y7859VN3Cb1AziCTtdQxf5P
	dEnJmYrcEszkSPXwdO8rdIHs1c7Fw8feC1xmDXrvySkitQNV1/zJheDgy8O5/9rF
	vTmmkR/y9j6HgFbUMNCvjS1PxDnUi8mRVrKN/VLZgDhSflypaXKHUiBBZ/aJauc5
	Gp3hloRIbJbT7qsfDWFtfbUNBIGufbuy23H7qece9dWfkWVUDUEWCyLWKsQeeUF0
	rxQZzCywUbp5k6s0JuAK4spTAoNOYnwo34F7HynZGFsW3A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132hcb65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 18:43:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb6d713ddso39448321cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 11:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778265813; x=1778870613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y+uqtVLmFUCNQVUxTe/oua215OO0zK52yL+pzUl8BNA=;
        b=Ac938Y0uZCgPHpOlvwAgiut9DFyiHOu5jo02HYG9CAL5MiMp5cE0zeHPLmPZltETEq
         t0PCHWSNO42gFbMmPfw8ozkp07nefnD/8lUsyOpfxPYtnxbZ/Y+GuWOngIiFhAxbi2mC
         fwc2nyZGv4nGXJDfDI6ZHvZJeY2dI5RC69gR2YMGuY1Ywsz41bM1lZizKQTEkjYU8sfs
         EFJNsHEBGPgu108SH/xUqxXniijsf/uth9s2C9ZS0xZQRfDElK6sonuEdJLdgm2/eFQ2
         tSpoPPdplQwHLpbnAvW1udp4veAPOlE+0MDdo1XcdeXuniRIcNAoYu0XjiIyOHzT46YP
         FTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778265813; x=1778870613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+uqtVLmFUCNQVUxTe/oua215OO0zK52yL+pzUl8BNA=;
        b=Pgl3U0JQeQY17Ta66KFSt9OPfpH5491V8qxRIHG32mxhJR9WnqM11tSabNZr0wbDr3
         GffRgF533lgpxXGN3rICuJ1yRmemxRJMWRL98TMO+Nz8jzvUy3c3KIcrTuOqAvP+05UW
         L2IR9CoSzily8CRlAKOwdpb+GYdpomEyLeyqaABE2mO/1uEtKB31Ick/wbDF403xryWa
         eLor7uhN6f2GxvOWIr/Q/dPbVCF+Z6sEHU9N2bxAhsXYWr+rDsY4GsVqhqlS02ilsOD7
         o2zcFWX4PZm6AbBBajx6ps2kZNXzcMzJHLFdzGWQBd0ImL2sOsggBCEqj+bX1JZshKKP
         6Zlg==
X-Forwarded-Encrypted: i=1; AFNElJ+xG++injIFXP2VUHfubWor3yji5gGsNe89SkVhhRqdHl8ZRpbRSdP/QKgKHIDv3h33hNkp/vQHHFqPFxth@vger.kernel.org
X-Gm-Message-State: AOJu0YwZdoR3hKXnd4662r7CoSDyc3R2a5+3NX9xRRx15v/r6RKder33
	IC/lZFo5m0vewLICXLEC66ZlDZVt+HCaLIafwAN6aGjXcjmcrU6ur++5KWQV35buZoPQyklSpIT
	gFpSwlUOgV8pR6x5elasWiEk5hlNhCGO3gAJfmNAhc0WWrYeFG++kp9rbKZbJJSAVr37K
X-Gm-Gg: AeBDieuUAyh7+th5eCaOOr5/Zk5psX55Ok7kp6tDjCrQM2H+Hqp8AUXyThwKVUMZxFV
	H30sughJUS2ZSqGpNI4M+gZzpHaXuctUdnxTgnK7JpF2S3ofV4gOzfeofPC8ZyVAkYsTl9MuMXG
	MRFamyT13ErkuopEBshLowFswFaGta7ojXYl/I3qPtXr2Z+kkTPMtO+upiw8MHx1+VGyAtTDkZV
	DzH2YLsuudYNRYvIYOAeSnNdtxHom9AnnhIL5/+CccJg/L4dUHg2S2mP3PAM4+j2vsDTCWLywk6
	0N9e3/BbUwpsgH1ZKCCIi0xdFB1mM7b+9R3av15DSVFeidOmU5iFKK5Hibmcn8J/e4Lh7MydmtS
	3gxhgD2c04/2eL4inNEplD8GDi5iK6eHdEIp5PNhbk/U7R145Ven4aRdVISycNvxb5b0oGzv+Nd
	VYZCX93E7Gyi/8xy1HAqbOVGYlvJrw7/aaERA=
X-Received: by 2002:a05:622a:6096:b0:50d:7c44:e144 with SMTP id d75a77b69052e-51461be0b74mr190178881cf.11.1778265813100;
        Fri, 08 May 2026 11:43:33 -0700 (PDT)
X-Received: by 2002:a05:622a:6096:b0:50d:7c44:e144 with SMTP id d75a77b69052e-51461be0b74mr190178231cf.11.1778265812631;
        Fri, 08 May 2026 11:43:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f62693f8sm6884831fa.38.2026.05.08.11.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 11:43:29 -0700 (PDT)
Date: Fri, 8 May 2026 21:43:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <jstultz@google.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 03/11] drm/msm/hdmi: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <qfjsg5r2doqoi5dwwpgccbrasnacwcshtshddwoiwyrndyrwyz@6xfmctnfem47>
References: <20260507-drm-bridge-alloc-getput-panel_or_bridge-v5-0-472b913b5cb7@bootlin.com>
 <20260507-drm-bridge-alloc-getput-panel_or_bridge-v5-3-472b913b5cb7@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-drm-bridge-alloc-getput-panel_or_bridge-v5-3-472b913b5cb7@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE4NyBTYWx0ZWRfX7dvlhhXDd9wp
 8sviZFm7V5IK8KjiUJ7ampxa7vtLKFqdR0rHlFykJbWaWXWHrs5jWgVN3WnuSxuwfMAz8PLPzJv
 oaRXjkljQRR815ajdfHHemLAbCdU8cDFw0Ok6o3pZKq+uCy2oyGuh2zLoF6nZ2yTiuauoTdcAJ6
 QfQ2bFIJWcz3vrMecjSeQxVv+1TkGy65qG6w4jIKR16uJ3HP0xQ3f04qpxqx8vGR6uIZXjG1mCJ
 bvZQBjv0ALKxGtvGoa2Y7y+NCHT84VNnhWNMIJ9bGahOwJwz/TfbGLIV/Yewnw8jgwm8vAbvlSj
 J3FTZobyfz9G0H+rKkb2qaFhQZMTYdF6UsM648PiWbaWH0BzZqdtka7bE/LT0h5AoNCG54jKOXM
 Ai2ysPc+aUL2lLV8lyPC3SETKT+fe84/nP2HUy2qXEMDWplU95OzNaKFaXhchcencqEqLQMePhW
 OKgU8eN2Cbh5X8j0Hzg==
X-Proofpoint-ORIG-GUID: 7NnniEmGDQyqnLO1IpMIkF-y9vZ9Ni1H
X-Proofpoint-GUID: 7NnniEmGDQyqnLO1IpMIkF-y9vZ9Ni1H
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fe2ed5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=P-IC7800AAAA:8
 a=UZaUIiQ-CiS0E6Nlr5MA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080187
X-Rspamd-Queue-Id: 4A1C94FABBD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106713-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 03:45:21PM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v5:
> - simplify error management code flow
> 
> Changes in v4:
> - ensure next_bridge is put on later probe failures
> 
> Changes in v3:
> - fix ERR_PTR deref when -ENODEV is returned
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index d9491aac1a89..3640be8c1bf9 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -285,9 +285,14 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
>  	spin_lock_init(&hdmi->reg_lock);
>  	mutex_init(&hdmi->state_mutex);
>  
> -	ret = drm_of_find_panel_or_bridge(dev_of_node(dev), 1, 0, NULL, &hdmi->next_bridge);
> -	if (ret && ret != -ENODEV)
> -		return ret;
> +	struct drm_bridge *next_bridge __free(drm_bridge_put) =
> +		of_drm_get_bridge_by_endpoint(dev_of_node(dev), 1, 0);
> +	if (IS_ERR(next_bridge)) {
> +		if (PTR_ERR(next_bridge) != -ENODEV)
> +			return PTR_ERR(next_bridge);
> +
> +		next_bridge = NULL;
> +	}
>  
>  	hdmi->mmio = msm_ioremap(pdev, "core_physical");
>  	if (IS_ERR(hdmi->mmio))
> @@ -367,6 +372,8 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_put_phy;
>  
> +	hdmi->next_bridge = no_free_ptr(next_bridge);

Following the question on IRC. Yes, this seems to be too late. So, I'd
suggest keeping the current assignment place (and call drm_bridge_put()
accordingly). I'll rework that to use bridge.next_bridge afterwards.

> +
>  	return 0;
>  
>  err_put_phy:
> @@ -381,6 +388,7 @@ static void msm_hdmi_dev_remove(struct platform_device *pdev)
>  	component_del(&pdev->dev, &msm_hdmi_ops);
>  
>  	msm_hdmi_put_phy(hdmi);
> +	drm_bridge_put(hdmi->next_bridge);
>  }
>  
>  static int msm_hdmi_runtime_suspend(struct device *dev)
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

