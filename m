Return-Path: <linux-arm-msm+bounces-116216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R878IVxyR2prYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:27:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E66307000A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:27:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=PNSNw3a+;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116216-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116216-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 170FE3049163
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA939360EF4;
	Fri,  3 Jul 2026 08:10:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A6030C146
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:10:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066225; cv=none; b=S5DJ5NI/CFvgWxuo57knQaSio0OJMRvxGZZtsUSgfbgGVWeKr4Ci6n0q/1iNuSdmsUQd35Ooq7ZFeAvQ550nX2enTmUy2zLhwtnHJZh6j9JasliYLalLAdHmwV3Smrr1xkT7KqzRQ/rXn+fpP3vQ57t0ytmjbwt0oU11gdgg398=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066225; c=relaxed/simple;
	bh=N33u7urcNff4XSanf+t1gY0lClgiA4xBRu96eeO026w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MD3QK+cqUWGJG9FHEmeNmZIzdaDcOignhVjz5Xcd5eXthi9ftbM3MOWlXVMHht5NeiDziOPqJN+7HvLiEkV7sTEnoveXNw3vCUYXzeocpcBipDlJ2KUpnfQZ+tuDjTRHYreKKmruEBZwhQU2k35wX+3NBjw2F+uQ8evZsyP54Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PNSNw3a+; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b691cb44so1763405e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783066223; x=1783671023; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cwYdbfI8WEQMnRvQOATdDHCYGWSWpstPY10+DzjdmWk=;
        b=PNSNw3a+zHLn95BpqvmjFmQLL045MdDfSBCWatpO+KTlBAmWgWwdA5LSS2MtpPtfbc
         EffE+QNVK5XLA/Jsjg3uTIaz987VoqXwYFkmDBm0Kaf99P/sY8A7579DBLTYA+m8q2D2
         fG0WyZ9Q221dxJDm2N/r01FwEyCbjtOqF6+ZvWnkuQJ5wV94G+pbQZJpN5HBoaO5R3o5
         MHDkhdbOlpJ0Xhbcls5a3nNNDD9Y/2YLM4hzxlwMWUdL//bAy4lvROxPEE4DmY+YRyjq
         MUt0nOroizKiND3gXiZSqItIdj1MyyBtzCHDEOATQz7MUK7Obdkz3f1X2hyrBFV1Qvgm
         SrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783066223; x=1783671023;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cwYdbfI8WEQMnRvQOATdDHCYGWSWpstPY10+DzjdmWk=;
        b=iyT8M0Jz3BzL7+Nev3RFRm6R+0oqDIoa7v1261x46n6Y5nc0S7dNqw5pH6aXWMZ2Ee
         qDaryYtiJuj/AhPQenS41s9n6vtJwFw3J8rx1ACZtxAq31V4IUBMI3O6r3v0PLeIvK/2
         0V4DyL+VPbTQNtSfk0j9Co8gQQ+RxcTRMvTz0D4F3YewrInOt/pJ/tr1zCLKqcY9PRy4
         QaNQqdGaTIO+SblP82fmJulSoiO0Y50jVZaS8lUJz3ScdO+U3mmFGdagNkMEBABhE/A7
         zcbiwavZZXE1ShWm6hm7q0TeZKV1rcib4XmbLputkVkLAEGSCU7MkdRbVADgYbGeHVWh
         qQNA==
X-Gm-Message-State: AOJu0Yx0gBwZ1cDzWMNTpwSrEjZii2EvUkonBZYNB8YuLAz/YiEVV1HU
	eX/8RvTU3uHlXkUIDK0hyhmsho//XzZol27SaDyS+edJmAUcIQYbN5oKD+GoBOlVAhI=
X-Gm-Gg: AfdE7cnkFw3x3mkgZ7OeU9yeIRnFMgkAs7/1wk51dVwVdEQy8ZINtmXbfj0DEIdtBKc
	5CHNWdosZ+jUGT7AeJB+Oe7nZTd/Vo70c5v3GBJQt5QVHwM8Slffm9Da/KdMW2Tuf4nGLVfzYMM
	dOSmwt3t0M+IO78LZfsAEoreI/Xpw1WIiP41c68tqon3R9MFxishXVIHKOZ5GmjsG3sUagRxOn+
	qDLEQuSr05MNGVswk+nBFspRUPkk7ow42opILdCEnPy5Ex6mrSoPlzfUcoVe1h3ssHcgb5BChf2
	4TOmIJFQTfYtRHGFgYtV7ueRggtYDLgP7GlTtBnTGlFEZCvvUYCtnssAkJFYAQuUIbxLx+hCXko
	vk0OZckawCmKoNSfeZaUb2Wrif4g5X8TfQBAsqegEE2HhV01dyc2+3OyuO4K00RDoOUvprFjvW1
	oEF9QsSGfFz1qOoOewXKNTG/rDAz7eiqT0NL+iwg==
X-Received: by 2002:a05:600c:1553:b0:493:c310:4106 with SMTP id 5b1f17b1804b1-493c31041f0mr114749635e9.35.1783066222523;
        Fri, 03 Jul 2026 01:10:22 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm14920012f8f.9.2026.07.03.01.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:10:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/2] drm/panel: couple of visionox vtdr6140 driver
 enhancements
Date: Fri, 03 Jul 2026 10:10:18 +0200
Message-Id: <20260703-topic-sm8x50-vtdr6130-dsc-v4-0-9eff51ec717a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGpuR2oC/43NQQ7CIBQE0KsY1mI+YGl15T2MC/r5KEaLgUo0p
 neX6kKNiXE5ycybG0sUPSW2nNxYpOyTD10J8+mE4c50W+LelswkSA0a5rwPJ488HZtLBTz3Nmq
 hgNuEXGis9aI2ujLIyv4UyfnLw15vnjmd2z1hP4JjY+dTH+L1cZ7F2PvnJwsOHBYtWmGdE65dH
 XxnYpiFuGXjUZZvlKx+UbJQaFVdkQMCpC9Kvaga5C9KFcq2TSOMclj6H9QwDHfV5f3IawEAAA=
 =
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=N33u7urcNff4XSanf+t1gY0lClgiA4xBRu96eeO026w=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqR25s5qoN/KYr6yBDhlcee2Oj8EdJ0uFV/A9xPcCC
 VcUsH+6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakdubAAKCRB33NvayMhJ0bMWEA
 CGl/VOp0g6cPZFAKe3LIKUqYfvYspi5/6Er4zX//4wk+BRMJMZcUrvgbtYhrnToq/J96wGBlu+TShT
 PIWDUvVXDwGcATZ11aJ4y2e0/zPDaOHci9G3bIdwDkLeRyoaNd8JFegnBg4zbHsWyr4YheLr0EA8qy
 BYQ7w7tDKQBO2Kdhq+LOytttg6Claf9BVXo+YxTjdo/bMuYalMZlMXeCv0NtDvnWrrvSm2yywEx906
 X8OwOqHrluBniCR9a4BgWN3A0cnZ3qF09DzUkq2XKeP2F2N9oIpOSEqgUDq8ZQJtsIZm5+FqLKmUs0
 8GT3tu1EzUwzatHzlx1VR+EwllOlojxH8wKx1ZqYIbksO5HYDLhRejpMXFrk5HkYNhz0up3aZ5NP5k
 yCSjHCN2afuoISfTN+ei4IQBDFkmBNWS2q9MIJoQUsPDRBIV50AEnBTGd4g5LgxSGi8pbQzRAwxclU
 FOF9zcoS3m9fA/BXdjppTWCV6Qeicc0TL9OddJkzYZ6i0UZCrShMusZdjEyN+EnLJoyAmKb8eytCxo
 d16kMHAvbvrMiLIl8+j56vAkp0DyTxcQNJa/h5CVCsBAxOvxVqBkNvrx+sCbOS4V90sfGQfBas0xu0
 W0sCXd5lQjeSN36pZIgkZKpJ6++kO6WdybXvBnocZq31PktI0tVfKlBOHgsA==
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
	TAGGED_FROM(0.00)[bounces-116216-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E66307000A5

Enable DSC and switch to devm_calls in probe.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- fix typo in Kconfig
- Add review tags from Dmitry
- Link to v3: https://patch.msgid.link/20260702-topic-sm8x50-vtdr6130-dsc-v3-0-db881a3fc026@linaro.org

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
base-commit: 44d19b8a7548aa25cbc6ebd5f27e958f7142c36b
change-id: 20260604-topic-sm8x50-vtdr6130-dsc-16c7697a65ac

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


