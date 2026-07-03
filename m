Return-Path: <linux-arm-msm+bounces-116241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vELjNLR3R2rJYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:49:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FF8700450
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:49:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="qRf5/wgq";
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116241-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116241-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F69C30495A0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F5537883D;
	Fri,  3 Jul 2026 08:42:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79140379C32
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:42:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068153; cv=none; b=Vsv36UpfYnkWLCJ2uku45AAQAjQv8vfE/8ANEOxDWs5CSikS3LQekTJG1HqtNrKZWZOYXbOf7ZRNwVluIYq//ZmgJy2GOy1x3VBG6fpFY+Jc5+JzEXGSQ9FrS90dvERkSNj/arMtMZTWHlV7Af1/5uecV3KkxqLXBSMgDRoQcUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068153; c=relaxed/simple;
	bh=u7E2ll0rqpwTJ5OnQMFnwrP/hZovhuR24ZlD56vRbfQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K3NEW9+pV28esoGDlTkdr+bO2ADrL0PMKQlcxiQ47ZPF/OVstmcdqpalzeUiJA5f9RqPa58ZAdtUiIIOs1jtwSlcbvDFGxRTgnwTUuDv0GkI0jzL3vVVIVMqJVFfeUvPM7r3m2/mCXKtm016CkwwYt6HyBUmC6IJlV4wRjfE7oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qRf5/wgq; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493b1710405so1613105e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783068146; x=1783672946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DffKEV6vQ8mAoyXkZSJ6mKbXeNlTvFhkZAKtA4bEZ4s=;
        b=qRf5/wgqRsfuVXths+9bJSyYpeghMxMzpJl8Ebfu0CyGmXqAcJ3+2LUK6ifY2dQ4EC
         S/7jvJxE6TTIciW+M81lNWnkxLIErMoz5ZFKiWfUF/ep+6et9kVAwK703FatXybtfkgd
         ZVhomyWrVJnP04ktlEt6vutJvZ90POMJR7XF4oh/65QlIIG2pXtYO27wKm2E9AhHDAzX
         rJpdBQu94+RAnOpYz4ErN374C59t06AwegDmoTX6bv/LEa1MLoprErcQlsuCgCQdBjbB
         GlvUaAOXI8keTS26wKJpbabRXUbM0EjJRaCMV8rM/0icjTi5QdGKwIlODsT4b2G76c+j
         sk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068146; x=1783672946;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DffKEV6vQ8mAoyXkZSJ6mKbXeNlTvFhkZAKtA4bEZ4s=;
        b=Mf/ecSLkBdeseetERskP/aIj++bz+JzaRAsmeBgcR6dO6mcpUqwIsOH9TBWLZvADfL
         NPTyu6dKxzRSdznPnskxIJdewPxM2AYOlYixUV1COR0CpW+8MF5ElSfBZY1MDvCuG19+
         t0kzJ0PbNSpZw3JftxPAmbGmBknOpYf2RfIoninnCfE8YJZB/FAXpuZ7GF1OcckEuZVR
         eD/zq0o2GqDI/fKjR9Z8aoEpvXkaxSQ0c1RuQgY38FN9B5tarB2xuAqgzIGxe+11z5zz
         yF8ZBZ06xgsRkiRdlFuCylfjX+C+P0+1F4UHRveU/goC+KHFg+GPPg+1rJyvT6227Xvv
         pRGw==
X-Gm-Message-State: AOJu0Yyk8/kW7Sf/vb7VzMImk6FBnt8S9xKw2RSm8A+NpxR6IT+gfqS+
	Uf2/+OM/o4FCYqUjoF2bo4hvEUohZqAJlLfzY0xRZ8cUuwqSnjC3extF80fpBY3wZXM=
X-Gm-Gg: AfdE7ckzpE3q7LICY0JWBVk9AWtiZeTNZUSRiAnbc1lWgjPsBk7Fph1Uo8BzZYnYNj1
	QmIAxddi64okzlE9QUla0tLI7+Tfvxl7a2FMx3KupvaGxdpy1bezUi5HsSGD2Oc1fJ0g7piDPP/
	NANSF6y2QgAbejWPyt1GgtSQHeXvUiU+piXJqdwoPmrI3V6PPpFuQ+bZLLaRWrB5jGGt670FLNH
	GyIf4kjAHqvjwJfoqZ7BEjp8tSStev14R5qiViOsuJXSPBw3JCOkSSz3+J+y0hFNZtzQ7yKX8Ve
	RrGY5oGpUCQOY/nW295RSi0tLbpjlNOcb5XiGTjdxCQmJbC9neM2+7Xkt4JTtlMjeeBUsWAfTp6
	C0wbUsZvGRk+MdMSuN1I5rWmFL/wyw7R/x2M6WEzHURJoQYphF/+1pJDRbrFgWKJZZs8vJz6NKZ
	/avjHnq+r2uVHpDQiYDpIU6LfBwKS0fLD0BA==
X-Received: by 2002:a05:600c:3b05:b0:493:bd67:316 with SMTP id 5b1f17b1804b1-493c2b584bfmr118405935e9.16.1783068145730;
        Fri, 03 Jul 2026 01:42:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm30001575e9.4.2026.07.03.01.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:42:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Jun Nie <jun.nie@linaro.org>
In-Reply-To: <20260703-topic-sm8x50-vtdr6130-dsc-v4-0-9eff51ec717a@linaro.org>
References: <20260703-topic-sm8x50-vtdr6130-dsc-v4-0-9eff51ec717a@linaro.org>
Subject: Re: [PATCH v4 0/2] drm/panel: couple of visionox vtdr6140 driver
 enhancements
Message-Id: <178306814480.3165305.11420224362782009879.b4-ty@b4>
Date: Fri, 03 Jul 2026 10:42:24 +0200
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
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org];
	FORGED_RECIPIENTS(0.00)[m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jun.nie@linaro.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-116241-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,gitlab.freedesktop.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48FF8700450

Hi,

On Fri, 03 Jul 2026 10:10:18 +0200, Neil Armstrong wrote:
> Enable DSC and switch to devm_calls in probe.

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] drm/panel: Enable DSC for Visionox VTDR6130 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/dd336686fa2c3cbe1b017fb1c653cc5fec79215a
[2/2] drm/panel: visionox-vtdr6130: switch to devm panel calls and drop remove
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/903f8773ee96c5dc5fb9aec65227f39fd3e7a1dc

-- 
Neil


