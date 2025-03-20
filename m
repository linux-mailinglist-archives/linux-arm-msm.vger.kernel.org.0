Return-Path: <linux-arm-msm+bounces-52088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BDEA6A66C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 13:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0297F7AF57B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 12:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93DE18E2A;
	Thu, 20 Mar 2025 12:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HiOL4XFV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF222139E
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 12:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742474840; cv=none; b=QpbQhuVZCg5NcZXjNefNDdQBQgKKfzX0h6Vjg8j5GNNYKmDiB/QhwLAfgkqA2B4QZC3Uhea7n04zunB6I2CzocTF+qlCPnQKy3gyFevfyVFHs58GpE2UI0NmKcUhMiLgCRW1wZjglGTUONFL8+AQvJciv4tgJT8mauKtJLb/kJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742474840; c=relaxed/simple;
	bh=Kv6DgyEwXT4LlaYHVxd/YFFj4oxV7X45VzT1+nxkLTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WdiOCn8ZYcSMyCq9GHOlty2tC4XzzXWNEWLvVrNSMN1YjthnxNMr1Jle0E3m+p5sJbDAAiAB0mEAS12dCmYT3JZamRh/moEHKBbyc7iCw/IDbQrzDE8wSpKPpLWCNuPvGZM3ZZZmRGeWR49NSo5pFhWOoILUMt3BBLaaSJXrYT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HiOL4XFV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43690d4605dso4735865e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 05:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742474835; x=1743079635; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BdG/4GC9LsJW2kwZwtzr2yUeLZyKqxiHIgM4hbUYaLU=;
        b=HiOL4XFVJj6eSxPIhWv3ATksITq9NgPHTpmWRYV6jB30zazRNXKJtVzBZZbtiAcE+d
         d4IM/XKiqsaBI9BYkSbofN9G2FZ0v2PBqLPEpGD7HNF62CSxeaILkXht3xXYQx84Zm/p
         PT9uvAvmXKptNjknsU8d/7LEX4LWojaxtNJkDnj6QslO4WDbgtLsZREpaAPo+fsmUE1J
         Ja/g2Aq4FgneQMNTKjw7mD6ZVi3lfJfPxW/p8FRU4pq/00TQaaMz6kKnNnQbXprhNAW0
         yuKAbtcxyes9a3q4hBEm+V0dlIskoD9nLPcF2b70Z2dVSq9GKKtqXEj7cvnTTdppl4Em
         B9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742474835; x=1743079635;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdG/4GC9LsJW2kwZwtzr2yUeLZyKqxiHIgM4hbUYaLU=;
        b=kol6+QbrULq7/hk0bRlAhx64zOxYwZ5k2dLQ0VTOsHJT9a+qmoBTANBKr3HuqQc0tN
         wVyVyHV8oV0ysOJD0miJCttzsCYmzJ7ywnthBtJwgMjtP7rzWUCqXIpa9/RJiIWS+mvf
         icZxgHkEcsXd3uUTVC1wh7igbeGk/0ElQhEU8TCUkWqtnqsy3YOrzP7/Nuq5dpAOor9v
         VwGAsZgjfifPI4CZgJe4kTW3LDamAdvrhEDdTH/REKd6anqMmbXJXdRG6Tl4V+kaLtyX
         dkyXhVurMRiAZtHOLPNJp+RyDDVwpHHDfoKQ4ywOXhfBMFp3Sj4GmqwFjBclUZaexraM
         Y7TA==
X-Forwarded-Encrypted: i=1; AJvYcCWmAgv8dkyb2D8IDgAgWOtH8EPGY97EBpXiK4LaUFZsG4e6k/5hWCp1VXwQ7q/uI7rKr0aRXZQU2e+mErQ6@vger.kernel.org
X-Gm-Message-State: AOJu0YzFzTh7IN0cJle0v1W8/+PVt/nA7F/cjS0yQ2Am3jXrUHDE7pbg
	U/AK8OdpndfTufz6o28hWLkhJBqtcaEr52OPpBj98JrBd3zX3/aNKVsILnpS9Z8=
X-Gm-Gg: ASbGncsrneHYl+v6p+4+qcUHyXZj7YfbhGV4I3/NXjW87IVxXN/2fe/Vmxb/rWRrncE
	cYK4/Ess/Lb/XIvl+VKUkQDUQJpWLy46SWak3Ug/NT7bRVGtMm8j7+fqkhR7j5NnmmdEc20ne12
	MOIFPPgSLg92pYkDrySm4T/nDDV0VDo9GtJGnn/u0IFB6K+7Q/Tbejn5zmslGDWAQ8WbghxK3K+
	q8zBT7qP/ieS1JWZwtfO/rzDsAYomb6V5abE9Eeubp66JO2LRUPTpOQIJz+lbPsKNza1zisQ+gv
	OqBW0jQj3DKyZ1QKwytTT9BWYqutyadc//JZc02bZWBjb8RAZKF6v857
X-Google-Smtp-Source: AGHT+IHax25gLGxpdHS3niMwhikkYrx+VMfus6GYJ2qGjlQ79/dfHY3I2/Q3s00DhfenLy4B+ToVjw==
X-Received: by 2002:a05:600c:3c87:b0:43c:efed:732c with SMTP id 5b1f17b1804b1-43d43869a27mr42567655e9.28.1742474834948;
        Thu, 20 Mar 2025 05:47:14 -0700 (PDT)
Received: from localhost ([2a00:23c8:b70a:ae01:9cf7:b69:fc50:980f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d3ae04a94sm38388815e9.0.2025.03.20.05.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 05:47:14 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 20 Mar 2025 12:47:09 +0000
Subject: [PATCH] drm/panel-edp: Add panel used by T14s Gen6 Snapdragon
 (OLED)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-wip-obbardc-qcom-t14s-oled-panel-v1-1-05bc4bdcd82a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEwO3GcC/x3NQQqDMBBA0avIrB2YpLYFr1JcJJmxHdAkTUori
 Hc3dPk2/+9QpahUGLsdiny1aooNpu8gvFx8Cio3gyV7pYsl/GnG5L0rHPAd0oofM1RMizBmF2V
 Bfx9mYWv4RgQtk4vMuv0Xj+k4Tlq6s9VyAAAA
X-Change-ID: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2279;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=Kv6DgyEwXT4LlaYHVxd/YFFj4oxV7X45VzT1+nxkLTA=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn3A5OmilO6wVWLD2IchkPEH32d9GORju2oow2K
 GHkUWav6caJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ9wOTgAKCRBjTcTwaHBG
 +KzXD/wKeZCjsO/kY3JRX16qfzcTBitBbnvq2L1FdNOkEtd6psctULBRORgPXNuitGOyIpek+aS
 PApwfKhgyDAztvUmYZ4Ns04HXwsqzIG+4Yw0q1/JH/lTILreZN0GJwxpTtpy/QQLdL9+d/iQzjB
 vM825x8v/gkOcmSTsJp/2qeYc1IFSpFwdiqM0Rmr50m1ZjLfYgxCx6X2jd7uhOwRN5mEK8FfiTE
 pZrx3Gs3hYd3S+uUyQ6U3kOBUDjIGF+DcALlWWZNhvtthl4zO7xmfIHdVu/k3vKGfO4pq5vWVmm
 EpsdZ83oJdQv04z01/r6bzczYpB9qcVX6mBR9n78StzLa1EhQjyq/Wic78SiYLuftGweT9P9Njd
 Q6kNOpT+BYDG6uR9ZjIQDPR9uUPW8XzDqRSwShy9rMD1JVrKSXAK/2bc3ha8qDInThOYcdxOFY/
 Lq/puf9W0tq7oxA2vrZkkcepFxymvACTM8nbhk7RuX2b3NDNzUF/f8zySvXkp+yW4XhbHBxGGxi
 q7fNS+twmdUMNFnN2K8qFhc1ERo/V2PPCtPuehwwOwjF6kRzRubLFseC6JOBbX5f/putOKW0+MH
 PCs8mHg9JGbiTlLKBRV9x6qcOMs2VzN/pDbAKSbZZXZ59BZPilgIIAP2rh8sV8tX17BU57hCTE4
 PrExDZ9VjoVaLRA==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

The Lenovo Thinkpad T14s Gen6 Snapdragon OLED model has a Samsung
panel. The kernel currently prints a warning due to not having the
correct timings.

This panel appears to work with the default conservative timings,
so add the OLED panel to the list of supported panels with default
timings.

The raw EDID is:

00 ff ff ff ff ff ff 00 4c 83 9f 41 00 00 00 00
00 21 01 04 b5 1e 13 78 02 0c f1 ae 52 3c b9 23
0c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 ca fe 40 64 b0 08 18 70 20 08
88 00 2e bd 10 00 00 1b ca fe 40 64 b0 08 38 77
08 20 88 00 2e bd 10 00 00 1b 00 00 00 fe 00 53
44 43 20 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 41 54 4e 41 34 30 59 4b 32 30 2d 30 20 01 cf
02 03 0f 00 e3 05 80 00 e6 06 05 01 74 60 07 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b7

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 52028c8f8988d4b771bd2604256aea4cde4f4020..56eb57c8023fbbb5ba39f5fdbfa8e577400f751a 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2008,6 +2008,8 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, "Unknown"),
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x0778, &delay_200_500_e200_d200, "134WT1"),
 
+	EDP_PANEL_ENTRY('S', 'D', 'C', 0x419f, &delay_200_500_e200, "ATNA40YK20-0"),
+
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),

---
base-commit: 707bd8cceaac1af31d3eeeee166687bdde580fd3
change-id: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>


