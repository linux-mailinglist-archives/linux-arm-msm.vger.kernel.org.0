Return-Path: <linux-arm-msm+bounces-115884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0d0ENVQ0Rmr7LgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:50:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F67D6F582E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:50:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=KbZMITsu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115884-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115884-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AFF2321F88C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC4947B434;
	Thu,  2 Jul 2026 09:36:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6C247CC74
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:36:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984974; cv=none; b=QxQF4htmW2PKwpybdOr6Z5xSVkT7r1nhB1eBcfcuLWcgUGyBdv64lq3Ryc/2ywy0mEC2erDYf78a/gek0vGkaBINqMbEt3NvCmAJ5sn6PS8qDdPzL7k8hde+KIXMcftw+flPCSlo1TycLaVte3+nFBV+k0FqkUwUpxgZYp9Pwgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984974; c=relaxed/simple;
	bh=+BGqyMkhsvPCIxm+Pd1uTzBv97PM0s5l73BkbYxqyu8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KVWds60oqZd2EgoLe1Y6DbquJWs951FrqTQe+Qvg5eFV5oSn66/UTAR05WFcrXis6HQPNNxZzIB22m8KS7d7uIcnwiruA9LIKqtBWMKq4c/EPSFAOXUAzz4dWorUGs5cDYTDFOGtW5HDTs+fSG3mCCaavMGVhFlVQeCibkJ6u5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KbZMITsu; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c54e205aso4103055e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782984972; x=1783589772; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9HUfqngMBQW9dvZQFJVLsp9jSRJVUMPZ8Pdu5MoNLpU=;
        b=KbZMITsuVucFna92geODH76yrbQBgZuBsVToywIC0Jj+jwcG7nMm1rmCiy8wnHgpe9
         66tj8H0YWD3vxafcKdz5VX2tVb3m37pMREqpsLLLWenVSL8JF4W2BpCUZBUkO7QBOlw8
         BKwElbOxSiifd5JLxGFjlzq1drCg8D8m9iIMrdRuCt3cEkQsmS53gj7s7M0ousCMd1Ow
         DWY35DLBfvw//MrrPVx65bE+EPv5o4m55LWb2/QQGNOCi6kNlL2FmWWZY8NO8FIg/J2s
         J3Ak1tvrPneF4N6H18NZ/iEQx/RGtbHBiS0T3D63XDvdEeZ42YswalKadg/8EoJGaCYN
         cItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984972; x=1783589772;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HUfqngMBQW9dvZQFJVLsp9jSRJVUMPZ8Pdu5MoNLpU=;
        b=mystaykcmjvIMiGeyr37NRkj8GGAyZjBhtOliXGq9gurvUw3SMwhPookcqoRw94mTA
         XHUaN+7NxC22KdA+AEYMtYfQgcuT/mqQqrl0kS0WoYNgvuOX/dw1Wd9EcgrR62Fa9Uq7
         iYjcaK3XvxaQ59DE04N6UKqPAqovv6wp2n6c44l8iKh0AZaEDotF9L0PIKffc5Jjc+r0
         6/2p2NySNxKXzG/jowlU59P4qxpghoY8K1Xhj9bZTAf87+stC4AUhmLKSJo+3t1uW5DH
         RJp3O6czaCUOVbX3EDJTnRqd9X7vOjdkK8xcM79mPw198tZZOQVaUUpmKejpSWcQawqg
         XEXQ==
X-Gm-Message-State: AOJu0YxSyWhcLOvegtB2VInZWLQlnYP3Wp+w51eIXzPPskqWlGdgb4zU
	daIlJxq/P2lBcz10zjFwxDwJwc46A0ziJ2Dysgpddt9+eBFKRS0LtK6G1XIc2AaxIxw=
X-Gm-Gg: AfdE7cl9gp7TtsQDU6pV9toNAT29Kbu6MIOhvU8geGtUmt2W3v9xZLDAG3TTAaU8Znl
	XiB06ekOA+vTneXXiUNEhzj0ELcsTQX6prJJttN0e7enjGT3K/9kQzRYXalbSHxl7FAsAgNhC+f
	tycixNzMmGaAw4y5Z4qV1WBqaomGp22obfdp67H4akvEbJY6zRS+ZtM19boUZq1h7m/1FnKicgo
	BRHijCJkHnv4h4T5JAIf6Fs1qkLmqG1UJVQrlAThs8h/GQJ7gIEelA30V1qLjembqdlFPy0waaO
	NakD7pvmJeE6LIrzm0z4YqhzdYFJOEQXga+3qvhKMFCC6i8FOJynZqdH6SLjUiwnTMgUNQdp2Er
	qeU3oOS7L2/YLxO19KZZet6FzwWCfkr9wWNSfYF22fKqVcna6Q7noNod4sl4UpK2o4xcjXuTo8j
	Flxvbb7rTZ3IIiVBes+PWkeuV0u6XqVdQnCg==
X-Received: by 2002:a05:600c:a4b:b0:493:bef8:ba8 with SMTP id 5b1f17b1804b1-493c3dfc635mr57777245e9.39.1782984971906;
        Thu, 02 Jul 2026 02:36:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bf11eba5sm80524765e9.0.2026.07.02.02.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:36:11 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/2] drm/panel: couple of visionox vtdr6140 driver
 enhancements
Date: Thu, 02 Jul 2026 11:36:08 +0200
Message-Id: <20260702-topic-sm8x50-vtdr6130-dsc-v3-0-db881a3fc026@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAgxRmoC/42NwQ6CMBAFf8X0bM22SBFP/ofxANst1CglLTYYw
 r9b8KIX43GS92YmFshbCuy4mZinaIN1XYJsu2HYVl1D3OrETIJUoGDPB9db5OF+GHPgcdBeiQy
 4DsiFwkKVRaXyCln6956MHVf3+fLm8KivhMMiXBatDYPzzzUexbL7pxMFBw5ljVpoY4SpTzfbV
 d7tnG/YEoryQyXzXyqZVKizIicDBEhfqnmeX0D9COEgAQAA
X-Change-ID: 20260604-topic-sm8x50-vtdr6130-dsc-16c7697a65ac
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=998;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+BGqyMkhsvPCIxm+Pd1uTzBv97PM0s5l73BkbYxqyu8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjEJvIrmMcTuljS878F6U5MiTQpKjAYNGGGfYC9k
 xogetNOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYxCQAKCRB33NvayMhJ0dX8EA
 C6gIlKaKpO+SPkbFfMhEc/efvcW975yOq5yJc6HdPYBpOoMgzru92OiBwnyC7rCrNDSCQ8d68hiI4E
 CrwrE79855PhP7MBzXU0JjrefO2pNcBEnS9Q3JOjGbmfopuZsPif9Z28Vbh4NWn6K8k0ARmx+9DGzg
 zfhdLHYfNbanZ7b/xZ6Fg+nHAm8mrxfpuLiGRyBSRKerbxgjqmFXYVPIj1+hfKxnlrj9ZwAGMXnmiC
 BUA5QF2U2rD4/cClb/JuGd15vVoXNvsa65zaWTgmXfJ832Ie2u3nsv2FgToECh5Hc4MEwuYATs9fum
 +mc74Vd//xWYx50ogX/oIPyPjHtSMFB3+ONADM0KEo+53j9/XyeSv35oDrpUydsBPOQvaGEpCUAtUR
 AOT1bo1xbsGuV3k7/MpI1kf8BMLsKo7/iLCGglh+XWDoNkAC0wONVCanCh7thGKZoE85QvdQM/u6SR
 uNjJxiQlSo8UZ+ip6mY4UOhvAjo4jusWDnoRO++SDsP8fuWQotAwpqtoDO9PRuJXIVSeC7PCd0juMP
 uIX+1zA9ChHGf+jEQ7PRB6UzXOo7obzNpAAbuFJriAEfkx/505merMpW+MePRZ+UGKif409OmJWfm1
 NAXquH/lHvhXfUANkple3Ffbde5KFtGdttuM4g6WhaOVQ6JHKtq6d6aDs1bw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115884-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:jun.nie@linaro.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,msgid.link:url,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F67D6F582E

Enable DSC and switch to devm_calls in probe.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- add missing CONFIG_DRM_DISPLAY_HELPER
- Link to v2: https://patch.msgid.link/20260625-topic-sm8x50-vtdr6130-dsc-v2-0-cd375ef0e0ce@linaro.org

Changes in v2:
- select CONFIG_DRM_DISPLAY_DSC_HELPER
- Link to v1: https://patch.msgid.link/20260604-topic-sm8x50-vtdr6130-dsc-v1-0-09bcd1dff1fb@linaro.org

---
Jun Nie (1):
      drm/panel: Enable DSC for Visionox VTDR6130 panel

Neil Armstrong (1):
      drm/panel: visionox-vtdr6130: switch to devm panel calls and drop remove

 drivers/gpu/drm/panel/Kconfig                   |  2 ++
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 42 ++++++++++++-------------
 2 files changed, 23 insertions(+), 21 deletions(-)
---
base-commit: cdeb2ccd993ed8647adbbda2c3b103aa717fd6f7
change-id: 20260604-topic-sm8x50-vtdr6130-dsc-16c7697a65ac

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


