Return-Path: <linux-arm-msm+bounces-105001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AXSOOAi98Gl0YAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:58:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE6C486696
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B10F30E581F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60B3427A19;
	Tue, 28 Apr 2026 13:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kqwGU2S5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ACF43D51D
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382308; cv=pass; b=JHpJhzU5+isGrbS6GSquaCb7Lhsnn72IwI9eHDIlaGglJzzmY8+LhnXTniH0AxXHdarxkyr7k6yc1LKqOya2KvhmKXd42k7fQbf3+DLFDd3emLH7KhfttOfgl3REjNH6ZcVDuzYapxnJO7MuMNcpcvMCuxLhXGZuhSbBL2+kvUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382308; c=relaxed/simple;
	bh=oY34/TGmcHqSedZQkdyW4vzzXK/3kVdQ0yyVc1RIk7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H3Ei5ZksmVoCxBS1csXokm4xHd/BO8rOV09dqx2kUpMYGUfu5y9CwZZGBvB7XSM8VHvqyJ89dzW68Qxn86KYiKIaxqlkPwKv6pJ/4dVsu6ZfYUWTkDplc8oGOCT8LHd6/AEUYVKU4QAP5L+3pT2m80C7nNBJ1R97iN+dFL5jd1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kqwGU2S5; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b299b3c739so52929555ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 06:18:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777382307; cv=none;
        d=google.com; s=arc-20240605;
        b=RpkWkfMWComrJCe1NOhwZ68L394rnpiMQH8xQMQBhkqzqMAIeoJd5wxghx7Ab2hKAH
         MkBX4VIWS/w7w5ajAuYstrto0BcTxqBNijBN+13cUmHrjM803eX9uhjJ9/p+s4mkAH/v
         N0O6kNHNu+ZI1eULGdYbR6KFsZhBYf4jHPoGTD0MDCTcHdgxOb0xRgRU3PV75KvPY9ZE
         DXyowt40sd9GIYkPBGFzBcLQjLT6S84WM0gPJjV4RYDCFp/PtorG+xFH8eCBPQcUYvaN
         0xQp5aKxthVnhZfZTRL0PctwZxgg/aamO9ZXS7E13W+qBSO9JbngeYellOG+aa0IvTAe
         9x2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0JylD0eUAei9HWh+O1vGMAbkkUnXs7zMRuNaLki22TM=;
        fh=mIt+ZoJWfEVO6mgM2WS27VUnnt6G32YgVXBjWP9736g=;
        b=T/kF4oguS9luizFT1GGHGlkUMYmfS6JUOxH0bC4R5rie1I3YbhtZQ+k6mXpFjvEYWq
         qBsWitxhmoup8pjciiwnv2i5mB/0AUVKS+j7BXCfv0XQpnpVqTVImocyc4EMyopudHK+
         fA5de8uQsX/tDI0Q1HrN3Xa9psxTzjS8o/rWjRNuAschL3NRNIfqTLGffWll01mzUETL
         4yz1/cUzFmAQDCTo5HeRkzOVsaRJD7Tzm92kfpKzld3622TYiKWh/rKNEvewaZZXcv6E
         JdVypeuuxdxAlMUhTDshLFRq1bP3D4dQqnrcB1lqUf3xF/W16sDGH6j8yTPc2uKUUs9x
         n9DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777382307; x=1777987107; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0JylD0eUAei9HWh+O1vGMAbkkUnXs7zMRuNaLki22TM=;
        b=kqwGU2S5/j8QPBKM25FfpovvSxr06n+1+dSQpRtkU1O8qGChqEI4E/7ACreI6lZaCq
         0ScyANixeon8Ba6wX6dIcsSxR7X4Z1kpeDdwPv0PhPtyAfJmTcjPCbkuZIDY4lhg3YqO
         X8kVCoEAx/2AZxiguB+r54Z1UK0qGHnRKRo24tWtz2NmwzTPxw6dWe+Q7NQ2q4rm6ded
         GkYMDY/WaRZhLGavRCJ4EbPELSMR0bFY+Lr6raEnYjdIS2+kx3vKni1HNUb8pIfqcsPM
         9XRxc3JeuL+GHLFicLaK+wyP3A8eeyS+EJst8JJgSKqkrAAOCg65KDARamUfeDJqYTrE
         4Nhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382307; x=1777987107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JylD0eUAei9HWh+O1vGMAbkkUnXs7zMRuNaLki22TM=;
        b=IMMJpUPIFJarDEIie6dD1IPrFYcboCx8SMUo4EkadtUfzGe8VUheTT3jIqJKnwkGcs
         qGf9VvrMc9jf2zCgL2Cxc8XLh28Ta9ZFyEKdh62AOYWJxsDytRMQM0S6GM/rkMVCRtlo
         kIssH0lkxoGOz7ilYrjLy/+ftoUxbDjFp61ORLhOVfAHG0VkkvCdNB8bJCivn/dvtIax
         3lMN28mhJeg+G4wa+z4314YoNdYmz5A4dEkBsA7r9Rs6oiXlwrXbn2BEoceVmsL1LjED
         EdhogneuAxPN5/4CEw5WI5WYEAi3PNGaKRtGEIXdK89dGJMbsPkj+Uf09o7fNuvO3OIo
         RqVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8XeRsNu6Pzcy1HH9lwcEQQOoKiJPrGMZnocEAEcCFgCa4siT3USINteysqfnlzaoso2LLeSrU5kjk1cRAW@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ4p1rmQykThEIY4s02j/iph+giThqp6YdocHYoqJcvOgHP6Wn
	8fi+LWROcw9ni8jM3GtGSrZOKFHSReDvPvPhf01V0cxI5rJFhLGzbMimC3GpULDk8HJP7U9FNnY
	B8MZpR03CBkggsixwuCmyYju7QTjSq44=
X-Gm-Gg: AeBDies3N4sV0iBFAyF533OVtSPB3djPmHBJDxQ8bg8M4xJSVG9jlDG6RykGJ43nfL9
	NS+ciQGae5LD/9s2C1JZPGy9q0IuFVevZ2ihYL3d2zsqkLTyhup9wvvpvWSpQiaEPj0TnI3NfDc
	SjLfPXGRAGyeUV4oIjWF0AeI3Qxq93S3csfNLHjUr1M8pG7w5QiQx2Ka94oK9ZjUMo3DMrj9+g8
	XyctnDFfvDNa6vOY/1ciwhMCom8KKfKJ3S+jlefibUUpuXhVhC26y9pMquX2T7AkmU7IxZ7Q370
	hbCrnL/9g5zz2cJmYRxvDIr+JQZzxb7OWJbu6eF5YjdAkUNkkwihewxwOuNOBQ==
X-Received: by 2002:a17:903:2c8:b0:2b4:5b82:a8e3 with SMTP id
 d9443c01a7336-2b97c460ff4mr29301325ad.24.1777382306648; Tue, 28 Apr 2026
 06:18:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-7-4300744a1c47@bootlin.com>
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-7-4300744a1c47@bootlin.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Tue, 28 Apr 2026 22:18:14 +0900
X-Gm-Features: AVHnY4KhpSU0AnRDYEBltd_yLgO1x75YnlNnv3pVSwzFIbBw0RqhN0C4ay4P_HY
Message-ID: <CAKbEznt-PUvg48tegibw+0xYCCvK+1jwESnuHx9+MG0p3MD5gA@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] drm/bridge: lt9611: switch to of_drm_get_bridge_by_endpoint()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 6AE6C486696
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105001-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,hisilicon.com,linaro.org,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gye976@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]

>
> @@ -1058,7 +1057,11 @@ static int lt9611_parse_dt(struct device *dev,
>
>         lt9611->ac_mode = of_property_read_bool(dev->of_node, "lt,ac-mode");
>
> -       return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &lt9611->next_bridge);
> +       lt9611->bridge.next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 2, -1);
> +       if (IS_ERR(lt9611->bridge.next_bridge))
> +               return PTR_ERR(lt9611->bridge.next_bridge);
> +
> +       return 0;
>  }

Hello Luca,
Could you take a look at this alternative?
------
struct drm_bridge *next_bridge =
    of_drm_get_bridge_by_endpoint(dev->of_node, 2, -1);

if (IS_ERR(next_bridge))
    return PTR_ERR(next_bridge);

lt9611->bridge.next_bridge = next_bridge;
return 0;
------

 I think it reads a bit cleaner and avoids holding the ERR_PTR in the struct.

-- 
Thanks,
Gyeyoung

