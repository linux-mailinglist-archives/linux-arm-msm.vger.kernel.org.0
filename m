Return-Path: <linux-arm-msm+bounces-109014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLu/DJvbDmrmCgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:16:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0025A31BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 23A7A30EC371
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0AC13803EB;
	Thu, 21 May 2026 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F1w37Lm8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gTjdReDw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6669837F8A6
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357590; cv=none; b=nzwGVlGdSJvUFS5om+DJr/7uNRelAr3wyTVV4WuQCp/0Rx1PZ/mcZ29O14crpwXu+O6WNSjEUbxZfkvXWWUD+Iu1PA5+4rnhjDlJ3NEGwIe5953wsC7qiFrgX7hD6GqpYDz2qg9gKA7hE+CSs67+qmBeRchOuh/iGS7QcBLEYqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357590; c=relaxed/simple;
	bh=LkSopfWII/lcGmM2n4IOlRw1uksN3kZC4Q8rc5fxC/Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f4Jl0MUR4VSPyJ8gLom7xmrEfw2Y5q6/QGhgxBSVCO8xBUEcmts7IaZ5cxrBvnlCS0FbopsMDDT3DXa5YAumIgC6Ypj83SJ/NhSkMNXCkc6rpivJ8KukBtTDVKspe8GtCburHP3ljKvis5DwMbsnv6Jmo/3hCvmksOI/pELmGIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F1w37Lm8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gTjdReDw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779357585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0nHbVXywPYI+m+RM8iHAt2Jum4qcWT4EHlZtaJMwkXs=;
	b=F1w37Lm8o+IREg/in8sb7cU+DPvZa1LfCummFw1SR9Q+z1u00PZu4JBDpzb9D1sl+3TtxE
	+q4/w6J12NvAj3hRMGxnjYkBO3fb2Zu2g1h6bE2ggrP8HsZn3LxRPYdjQcS07Fu5iwDIjM
	Cj0+jzbTIfSc0zs/4rxeBvv11KM8WYo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-CB3_6s63P9GGdxhAN788nw-1; Thu, 21 May 2026 05:59:44 -0400
X-MC-Unique: CB3_6s63P9GGdxhAN788nw-1
X-Mimecast-MFC-AGG-ID: CB3_6s63P9GGdxhAN788nw_1779357583
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-45e80183514so3845625f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779357583; x=1779962383; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0nHbVXywPYI+m+RM8iHAt2Jum4qcWT4EHlZtaJMwkXs=;
        b=gTjdReDwFKA4HsVqXRe2AAl8kmGnQ4McauCljVKF8+A9W9WSsHbdSiS6fwUUdQjOyJ
         UTztfFwdyYziphv/6s2oX3vf8c9EoDJMTbu4O4uQuhNm9QhTmqx8JJs2+tuzsH4jOSCq
         SgNHIgNi/HeqHqBwYYFim/HyKs+xVQyjD4vSAoia9HssOkmUR9TKbR7yuxpfEj6BpG66
         xIFf/mcoAt7gxMD03KdOe0YFpRURl9aW6FXk1JyTP0J9xrds1bAH58VM56yUxAxs+GYa
         LflYsxem9gyvhGETtxhKrWm+I2XOlMC3+j6V9VuwRyKJ5WGxYwerJVcgcvdR0FaTghQ0
         Pbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357583; x=1779962383;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0nHbVXywPYI+m+RM8iHAt2Jum4qcWT4EHlZtaJMwkXs=;
        b=AaxlPcxDp7+fG/zLJ3OrgCzvzEUpl5YvwbkLyAOB7L4eiWiwWLY/5UpdOLaMEnH2RQ
         0+LQQ7J38C4nJmt7c8H5wyFcJn00cYH0hB/Y3hXgSiq9tRgXrIgvz3YK5+aMVBxCP/Ab
         of6GpGYbNcnkSCOZRxmV3qLnYeAGzUhTN6LXJI7XdpmoCkR9S7RhlC06842vFhkGj4wZ
         KJA0Xpy/fqNLxeiwplnx4HB68LyjDvzKIUuJCah5nlKiWXbxjpRIQtPonTNr25cU+Ii5
         8ecOshNuT7Pg+Who9mavFz1xNdxtOxXSZXM5v+o8eY0UGTMRRw+AbHBvmwJbP7xdQg0D
         Nr0g==
X-Forwarded-Encrypted: i=1; AFNElJ+VtaZKyfoZX9suyaR1YMMlohJNRvNPCObD0JQyKovHl246VMLQEPDIuRoXm1TXrtlF6yGT+/x53NOO70Ce@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu5lSPfHMIXX2jLuz4OLwpzbyUJ806q4qXC7VJc8/Fkx5wv60W
	jpNtQcHjwYq50wzmjs7ydRjW4GKGOS5F92wFmW4jc6JrUekqH5WDEQB33wZLv1wYkCUzFvu6SyF
	AoxPaS4G58BinmxLVfZZoc9jHP2prZ9iIeG0wg3qy8Eh/KJfv+JLd57exRYTyy4lbly4=
X-Gm-Gg: Acq92OF+s0irBI5yHxTvt+FQ5JD1BeBL5xr2A/8/1fap+kJLVKd/i5MsbU/SvOIE4zX
	9Vxl2MZSiNhevwRWh/DZcgZEB1B2WIi2nWdE2tDTKnGyOwntt0JUVcJjZAh1Y7AHj/E4OeydqHS
	zWe+Lw/U3zTtcyaZzBfS0PgMf63mnMFK1ZPm3kp8Lsej9k2ss7EaqM4TT1MM+XiADmI9++d3Ag3
	yqEzzg9CP89Z2CaW+A4scMKMsPYnpx1X25w8OxHRiJQtGGu9LXDhmJ3Rvrm9pNfdUZJ56Ir26ps
	WjFF2+nNK9DE3cQuz3teFEbOdocndBKLws1dLYlmYjjsudWg8cVANQV0+9YTm2E82TnIVGcN0IS
	oMbmrC8lFlD0AW48muZZcDxYC+AlTMBD3ZrECBlnATktrS9ZroTDgURp6pJxFhI04a4gtWizflh
	7cR3WY
X-Received: by 2002:a5d:588a:0:b0:43d:68ad:3b7f with SMTP id ffacd0b85a97d-45ea3ae68b3mr3967853f8f.21.1779357582720;
        Thu, 21 May 2026 02:59:42 -0700 (PDT)
X-Received: by 2002:a5d:588a:0:b0:43d:68ad:3b7f with SMTP id ffacd0b85a97d-45ea3ae68b3mr3967757f8f.21.1779357582159;
        Thu, 21 May 2026 02:59:42 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7d9e2bsm1634922f8f.10.2026.05.21.02.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:59:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Alain Volmat
 <alain.volmat@foss.st.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Andy
 Yan <andy.yan@rock-chips.com>, Brian Masney <bmasney@redhat.com>, Chen-Yu
 Tsai <wens@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, Cristian
 Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Stone
 <daniels@collabora.com>, David Airlie <airlied@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jani Nikula
 <jani.nikula@intel.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maxime Ripard <mripard@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Raphael Gallais-Pou
 <rgallaispou@gmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>, Robert
 Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>, Sean Paul
 <sean@poorly.run>, Shengjiu Wang <shengjiu.wang@nxp.com>, Simona Vetter
 <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 0/8] hdmi: Add common TMDS character rate constants
In-Reply-To: <20260520144424.1633354-1-javierm@redhat.com>
References: <20260520144424.1633354-1-javierm@redhat.com>
Date: Thu, 21 May 2026 11:59:40 +0200
Message-ID: <87o6i913sj.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,foss.st.com,intel.com,rock-chips.com,redhat.com,kernel.org,hotmail.com,collabora.com,gmail.com,oss.qualcomm.com,sntech.de,kwiboo.se,ideasonboard.com,nxp.com,bootlin.com,linux.intel.com,somainline.org,linaro.org,sholland.org,poorly.run,ffwll.ch,suse.de,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-109014-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ocarina.mail-host-address-is-not-set:mid]
X-Rspamd-Queue-Id: 3A0025A31BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Javier Martinez Canillas <javierm@redhat.com> writes:

> Several DRM drivers define their own local macros or use magic numbers for
> the standard HDMI TMDS character rate limits. Maxime Ripard suggested that
> instead these common rate constants could be included to a shared header.
>
> This series introduces these constants to the <linux/hdmi.h> header and
> replaces the local defined constants or magic numbers in drivers.
>
> I split the changes as one patch per driver, so that these can be reviewed
> individually and merged at their own pace.
>
> This is a version 2 that addresses issues pointed out by Maxime Ripard and
> Dmitry Baryshkov.
>
> Changes in v2:
> - Change naming convention to HDMI_$SPEC_TMDS_CHAR_RATE_MAX_HZ (Maxime).
> - Define the constants in <linux/hdmi.h> (Dmitry).
>
> Javier Martinez Canillas (8):
>   video/hdmi: Add common TMDS character rate constants
>   drm/bridge: dw-hdmi: Use the common TMDS char rate constant
>   drm/bridge: dw-hdmi-qp: Use the common TMDS char rate constant
>   drm/bridge: inno-hdmi: Use the common TMDS char rate constant
>   drm/sti: hdmi: Use the common TMDS char rate constants
>   drm/sun4i: hdmi: Use the common TMDS char rate constant
>   drm/msm/hdmi: Use the common TMDS char rate constants in 8996 PHY
>   drm/msm/hdmi: Use the common TMDS char rate constants in 8998 PHY
>

Pushed to drm-misc (drm-misc-next). Thanks everyone for the feedback and review!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


