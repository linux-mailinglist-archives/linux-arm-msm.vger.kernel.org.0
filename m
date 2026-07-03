Return-Path: <linux-arm-msm+bounces-116240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R68PKgp2R2pkYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:42:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C5D70035E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:42:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=dzZz2YBX;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116240-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116240-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C0D73015C02
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E501379EC1;
	Fri,  3 Jul 2026 08:42:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0C83793B4
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:42:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068149; cv=none; b=kxZQOhEjuRymQ/jUhiRRMcFG/6I8A61C5o2YMVi/x3Vv3l9r1qfP+tNilZe/4cTqggFq1PR3sQvaetI41iSw3BHcftzNAKBvz5zFQ95X+q5xcTuh5rrTT+l8kyDnKt7+Z69kZqDVsE+oN9jGuzYh0p2zw+VciT5MSaMZeVbtLrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068149; c=relaxed/simple;
	bh=x+hF6cksfI3/bvnsU93PkG7h4HttSPYkRpLHTklFAIM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MxmKNnqePNlzEA3sOgFTjiHkiXn9tyVhiRhnc1RdaWHkJ185YIfI4A4kIjpC89y0oZnRxFaJQcwKIPlasUSdKrUGrexX/9kmhA70QBfLDVtYevkzXn+ndlFGshmqaLPnlOdPR7g4suWabI9vOFNduqWsOuXaqGej1a1Jb01KewY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dzZz2YBX; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c733f15aso2819515e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783068143; x=1783672943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMSN/w8D8c3Ml2NelVlRwSQRShVwiaFWi/GCztB5J24=;
        b=dzZz2YBXlc8gg0yRe3EtMSku6hPMdwgYSbiQpZz9WxI7C7WfAC3jdbzcgrO5bmtDnE
         5SN9GDsoC7vWfrU6lfV5F0r0NlSGUMOWunKaaYJ3j8boyvwQ9cFzzQoKzly1w9fH0/tK
         2TrW9e1nSmY4RIKc6Z7wBNkukelyycNZeZMAzDOI3EuAUElGGrZVRPwXNKdJ76IEQI2F
         Um8UYuG7SOk12idi4QvdzOx+GhsCmli2NDVwvC1taU8oA8I+oYncL0VkXedtRUwGAf3P
         lPbWdq3d9Y0giq5lucWXxhU87qfwTn3PKSrXX9zgZ1TftmS7q/+hBFAJ37YTK96aGvBU
         ZcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068143; x=1783672943;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rMSN/w8D8c3Ml2NelVlRwSQRShVwiaFWi/GCztB5J24=;
        b=hstr9om52Ex5QhdfZp5p3LZ7UcNb5iKiA01LsshLo6Gh32s+60hvaT7skaWQK6q6s7
         TguwCFpenIv6eN+sxovtoR1sMFeCFL9tgQqDCFebd+hScRObPIB7PQssjih+BFHvq9Wb
         gS7U82Gbk7LJKu6I65Ez7Tin1CFuX9xLfeR6z9hcdb9k2r0E8LuEPGf7vAut+w8wIwfe
         DovIngFhk9cicCIxgnzK6RCzqmMjkpk4qsj8rXpBy79kcUwRt+hmHkNdSJg3dipb1OnJ
         rKVGvjfC5W/A6erGZrE0EOtAHx9ruh/8ssf4AA9MvYWhaGwbIZxHsadZOhWUPv9xFAS1
         DOCg==
X-Gm-Message-State: AOJu0Yw9fjs4ZRSN3v/OZp1R8RxblgsM/ZylxDReN3RS60CQlkr6g943
	xLFBnOC9S5ncL0myERGN5aoQ0Hef6i4UXlZxzolQqJe/T9okzHZsAxIfPOxWmctzomY=
X-Gm-Gg: AfdE7cmktUE3IxaVo4XzVKkQy80JZ1GLDsfO5mB1QSpjCx4yZdNb8JUykXCDssBqre6
	sVkCRMu+UKMQV1YAKF4yBgoltOYWvJc7NtjvPIhKBvTRWO5k5sHU9J7plmGIb/LKP+ogJzscc44
	fteHTFpqqdNWSsVnGWQ/+wNfjOvWZU6eqd4rilXYyMWLYnGZ7sQ1N6MONlnTj6ykPr3EMEC8FP8
	/eZwOB337Ypn6qZs/5+xf2UaN0rZ9NiSLmM1A1ZL0J8TeYYUYtA034n/DwwqknicS22GAIphQQR
	rOCBtx9H1037XP4KSAcGf+uY4BJYwP3SVkSXna+GbBhyQj+zMZaaFID16quTYAoi0AF/xr53FGp
	NEYbGfnObI8g90Xf95qLZMtOScim2hqkGegwb3j92hKCw3FsZL9T7GgDOFT4VB2j5t6rZVQxxJk
	jMCU5WX4e41y+RELjQNfkbEaQdRMppgxgPtw==
X-Received: by 2002:a05:600d:8649:10b0:492:6eff:7d02 with SMTP id 5b1f17b1804b1-493c2b974bamr115602665e9.30.1783068143284;
        Fri, 03 Jul 2026 01:42:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm30001575e9.4.2026.07.03.01.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:42:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ayushi.makhija@oss.qualcomm.com, rajeevny@qti.qualcomm.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260701-ili7807s-v4-0-c7d76d4780a5@oss.qualcomm.com>
References: <20260701-ili7807s-v4-0-c7d76d4780a5@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] drm/panel: add support for Ilitek ILI7807S DSI
 panels
Message-Id: <178306814218.3165305.10784888600083150493.b4-ty@b4>
Date: Fri, 03 Jul 2026 10:42:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116240-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,oss.qualcomm.com];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:arpit.saini@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ayushi.makhija@oss.qualcomm.com,m:rajeevny@qti.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gitlab.freedesktop.org:url,linaro.org:from_mime,linaro.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59C5D70035E

Hi,

On Wed, 01 Jul 2026 16:42:48 +0530, Arpit Saini wrote:
> Add DT bindings and a DRM panel driver for panels based on the Ilitek
> ILI7807S display controller. The first supported panel is the DLC
> DLC0697 1080x1920@60Hz MIPI DSI panel.
> 
> Changes in v4:
> - Use active-low reset GPIO semantics: define reset-gpios as active-low
>   in DT and use hold=1/drop=0 in the driver (Dmitry Baryshkov)
> - Replace raw DCS writes with proper helpers: mipi_dsi_dcs_set_tear_on_multi(),
>   MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, MIPI_DCS_WRITE_CONTROL_DISPLAY,
>   MIPI_DCS_WRITE_POWER_SAVE (Dmitry Baryshkov)
> - Use mipi_dsi_dcs_set_display_brightness_multi() with 0x1fff initial
>   brightness (Dmitry Baryshkov)
> - Move MIPI_DSI_MODE_LPM to probe(), drop toggling in on()/off()
>   (Dmitry Baryshkov)
> - Express .clock as arithmetic expression for clarity (Dmitry Baryshkov)
> - Update panel physical dimensions width_mm/height_mm (Dmitry Baryshkov)
> - Link to v3: https://lore.kernel.org/r/20260624-ili7807s-v3-0-ddf37052a289@oss.qualcomm.com
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: add Ilitek ILI7807S panel controller
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/447a76a99e242fd04eaea33ecd9a6d73992e49a0
[2/2] drm/panel: add Ilitek ILI7807S panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/dd7ec83f456734de8efc115eac671e5add82777a

-- 
Neil


