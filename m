Return-Path: <linux-arm-msm+bounces-114487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WSPIMwb2PGoqvAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:33:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A656C442E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:33:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=NT+TZcSn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114487-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114487-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64CE030062DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C909F37269F;
	Thu, 25 Jun 2026 09:33:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB1D2C1595
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:33:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380034; cv=none; b=bkKEnEGTvg1oL5UKcqdy36BGEw1pdq8DMg2kZATxceMYfFzrN7urXEt1/eIdHpuDOUUXpsYcxVjUu3VZf+9GROUA7fpvF10fyOvLBvfOlwNKp02em+/Pk7txvH8G0L4dqeiaG7wYPyOYanfhrUwsSSOnbT8TpyBIJmQuD0rMtt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380034; c=relaxed/simple;
	bh=nDIvo4GKRxlC/yboZ3VPIj7FCh1BNCNokdcUSVuLaNE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N76KV3bbrXfTpbS/h2FOFt7fpb+iXXcOv0q+C8LWHpd1sTZ+SSthSUdrlE1+eyDKY0IHHsW8PFVK7BCIwCxmxMKtOPQsCUV7tCnLLuXk/6opwxrg7fbV8XYiUxT8N3Z2MVH/BMUSsEf9V54BTydcu/zacDLaVVNX2NU/3kz8gO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NT+TZcSn; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso21838225e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782380032; x=1782984832; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ge/rwCOewCCLtHUHCkPUnCRHv0yvV8W887eaylgnW0I=;
        b=NT+TZcSn68774r7LzEbmFXRL0i74fm0YH+mttuw52ulBNvFjqoPB6r2b9/SLensFt4
         M9p7AnjYAl0HPAR8WEZ2t0fr9YrH4Vw5BmJXsxbL0vaCZ/30Rf4cZtSpJU1JwKDUkodY
         sVDOjxTRZA9CvC3H+1btgH/Os3gLQ8hw3w/RIACvfojO+6Vw5BnlGg6Xors++oCtMQpc
         NVddrBqonsQfa4y+K7S3EAlLotfGIAn8uDrN37qB0hsrGQo3WiFh8XxGfvTMu3cgpuVQ
         KjH0r5AsIlKVhlK2eMwCjPMOqpplxlfaeqdbCP5nic6UKb9XG+S9miW6EyTPE37Ff0Z/
         2UKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380032; x=1782984832;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ge/rwCOewCCLtHUHCkPUnCRHv0yvV8W887eaylgnW0I=;
        b=adCDtUHWQezJDHxDs/5RjWJMbAGx/3FnqgJA+ekVwocsSya7O9/nZmN1hE2SvB23Dd
         mFlyCqUWV25HLLAUBuIzbXExl0/aRWuhvj1V7tdPC1JAOXgGONdNpzy8u04TEhkeY4o6
         AwEA1ulJfwX31o3qHFlYCq/CQhHJNbvwECpp2DjwGEiLqfbXjobfs7WpqI2fFia4BRoy
         KE194LOwKxgdmjbvxDvuXvbi0mU27HytaQlVpeirU2vqrVjfzkDl7ejBZ/kc/cMOlDzq
         GMUsqDYSCKVfLhLZ6FdIQ0rRfWSYpgY/Elf1BRc/KkPNjsYLbAS8VqdJhKz+5CyWA1rU
         Scow==
X-Gm-Message-State: AOJu0YxuBBpruZ/YOtaxbJO2ygsugiYa2z/IP0L+xLLzrZgdoP01f638
	/Qx2pLstWhbyZ/V0SsMxkHfQBAniB1QqwpCr/i/zHSM1bjzfRJz8ewMjo4jtIgls13QtTf3FyvL
	jF4BQ
X-Gm-Gg: AfdE7cknHJfYmwpnoikDqGFbxq/aT+vYP/Jj7WW5kYUTT875Difb7l773p3eD3WaiBu
	PtF9aLUJvxxUxEgd9e29zvW+E3zMDsxaNUzowbtqodzwOut6TBsHZDe3xJvhdaMCE2yIiwq7dfl
	psFNRXdeAjOzsamvLDRZ4g7o/gukI7O4VKPzr0eR/OkhNjzdL/Iv6vwwq9RD+lYxsrbbS6GMyNl
	jkE1L6wiOiAiW80/Beyxyte7aFMzRRYYMk7V5XY69VGvGOauYIZ9X0yJ0igEvkogxnsa9QPlYEy
	o1TKkD6VeCPQ1Yf2uy5OFgvjhmBVkC4iZZfvOELdYAY2QtzDXXxnRbnc7dA8UF+U5e/U0CaDuna
	Pzrp91etTLxWZM9Qem5n4AusQaOswLdGcvCsGsDIKKnbU0nEYXfwHqi0VmZd175OHaz0DJRroLF
	jFqsuFJFqDDskN2rp0P09kY84nKKtDLljqMAeuL+KVONE4
X-Received: by 2002:a05:600c:3e07:b0:492:46c2:f5b4 with SMTP id 5b1f17b1804b1-4926688bbb5mr21692755e9.32.1782380031689;
        Thu, 25 Jun 2026 02:33:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492660a32ddsm40154745e9.1.2026.06.25.02.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:33:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] drm/panel: couple of visionox vtdr6140 driver
 enhancements
Date: Thu, 25 Jun 2026 11:33:47 +0200
Message-Id: <20260625-topic-sm8x50-vtdr6130-dsc-v2-0-cd375ef0e0ce@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPv1PGoC/42NQQ6CMBBFr0K6dkyLUsSV9zAsyrSFMdqStjYYw
 t0FvIDLl7z//syiCWQiuxYzCyZTJO9WKA8Fw0G53gDplVnJS8klP0PyIyHE12WqOOSkgxQnDjo
 iCIm1bGolK4Vs3Y/BWJr29r39cXx3D4NpC27GQDH58NnPs9i8f36yAA686VALba2w3e1JTgV/9
 KFn7bIsX8tATQnVAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=834;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=nDIvo4GKRxlC/yboZ3VPIj7FCh1BNCNokdcUSVuLaNE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqPPX9viQvvDuetrzBOwx3mcb1pazHDDHULGzInWxD
 3S2zubiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajz1/QAKCRB33NvayMhJ0YOeD/
 9qGnoLevc9oQuvgYPOgovP9rjAhvRz0YifhJFaM2mLWeGH6ECdDfXEgKwegfkhcNWLyTwpHVMfmNoi
 e5yaIC/tiGIdDt018gGiOcUzWIzEPA4cwWsu8exqzpidIVvlYCASCYzfb8vkmpCNQBqilotWzumKxF
 GuRmyPZdYc0M48s+UMiQe1RVA/521x/6LEfWzUK9DL9w0IYflXzsQOoHLeXmFkR8KM7Z4ZdlnVQg9X
 w2Q4lKZi8oKWFYkq6Hf8mu8W9pmrYun0yYfkZPc/eBlUpP410jZxcf6QJJgcoIksz1v7ro+vtmfCg0
 5NWejo5/THL/50JCF9csvk02ixfJtf+2dobWmQJjkhjs7n+yplPHwcZ27t3YRAqTj5DcGLFqaW9mcY
 ga/UveHVRbp2ZnNO44FdbCQMXUDz0ZHuhxwbySRawPMc5sLxGNUZANDWH385bm9+m+Zc7SsAE3ldlE
 UMY7y+l7RnYT72WYbfBsWXo4pdrcEVAolGe9uez97tsyE20sgFy9vAtGDYoSavlphvQYtEqWHgn+mK
 HVxwjzV1w1m1Lr8Jx+7m5GzxVDkRM9u49LrAZUuInT5PdpH5uMbyyWiq8Y/7VRuB/gC4IoUk7SKp4F
 ghuNQXISN7b/U9giUog0spk9vPIIgf62VDGfdGsxYVEv3zyzu7r72r5hA3iA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114487-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:jun.nie@linaro.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,msgid.link:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58A656C442E

Enable DSC and switch to devm_calls in probe.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- select CONFIG_DRM_DISPLAY_DSC_HELPER
- Link to v1: https://patch.msgid.link/20260604-topic-sm8x50-vtdr6130-dsc-v1-0-09bcd1dff1fb@linaro.org

---
Jun Nie (1):
      drm/panel: Enable DSC for Visionox VTDR6130 panel

Neil Armstrong (1):
      drm/panel: visionox-vtdr6130: switch to devm panel calls and drop remove

 drivers/gpu/drm/panel/Kconfig                   |  1 +
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 42 ++++++++++++-------------
 2 files changed, 22 insertions(+), 21 deletions(-)
---
base-commit: cdeb2ccd993ed8647adbbda2c3b103aa717fd6f7
change-id: 20260604-topic-sm8x50-vtdr6130-dsc-16c7697a65ac

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


