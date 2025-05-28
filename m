Return-Path: <linux-arm-msm+bounces-59687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A6BAC6854
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 13:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 674E61BC66BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 11:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3FA27A906;
	Wed, 28 May 2025 11:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XeUJiqd6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F58E280A5C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 11:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748431540; cv=none; b=KN8FwAyzJcbOcfIGt5F9OwXQqm0RglBQyeQN0wTQQKbOdB0zMDB4M7jcDwb/kbO3GdthxLtIKncnWT4DZE5aqVtwi1msU/P1or3H61M5x9xazrEU0yHqCfi3rrA8z8S9ZF5leLS7WVmsY5aZ6eJG8LC74qEnpJtLGIWSxhSrLQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748431540; c=relaxed/simple;
	bh=/z69r5j7eQD59Eylp2whO4+L8hzBImzoOCTlDSvHwik=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EynQ1OZrPXJdZrvpNoeoLoDVh808xwoHrDnRVB6FNVCeHzE9yXVWvyrAO+pveTR3Q8jO2CM3YZYZO3zf3ZRY2R7I75ZG2n6+gkcvdJc8BWHShxnHkygFCkdCLze8LGDQmNj0cToP4/utoFoSri//pIuaDACjgq15XhLAIVhAiZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--korneld.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XeUJiqd6; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--korneld.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-44b1f5b91c1so34739325e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 04:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748431537; x=1749036337; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YV0IEEKwbw3gLZ0Ixzqhl3dZxV1QXGgxm0gXEvnJJgU=;
        b=XeUJiqd6AaUQswLaDuaTzBLX1ScErQm5fxkl9v814Q6Rt1KgNo5dSNsiV7eotcXraI
         OzRciy7HfeZbRj0ice2p6T7Mz674XYQ7zisdBl0A5xdXFVrZ3o8MblpYCteddaOEWQl3
         4J9Figedbd9VoBQRda1YWf5dA15AE+PNbtcIlAyDv+531YQyrl5WMY7BNcaf1wABxnST
         xda0oiAZFTmHchFEMkQa718Qy1MYg4DwE+o8uT2gzDJeKOLrQGRHyNl106m5ei62pkKy
         +RC6FJMrOFAGMzlKkMCpLtV8ARx9iD2Q4vb2b0P/m8lGX9Hs3zr6RuVPQx8ZCiZrELRF
         u+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748431537; x=1749036337;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YV0IEEKwbw3gLZ0Ixzqhl3dZxV1QXGgxm0gXEvnJJgU=;
        b=p+Sxn20N8ApOyaHQi9+FBvMsqvW+ZVgKtyE4JR4sj8crJeyI/X+Fe2Fg7eB/fZG51G
         SQAc6ogqP3EUnSnYycaGcb9IKIAPxHvDUDPEAWdgxuZQID9YVCrhoXN39cHwKECKqu24
         HFbMxdK5c61TS6Xe7TzhSVwdXt7lqWgYsx5fPYAuuu3Rbq7lI+2qIueG805c9+Vu6Emu
         Xm9RrCEDyK/qP1xM3x+7eG2Y+PCixjKmV5tr+2cmuQTF+8ZmCsW+itNz75+bnWvp+Kot
         pLbC52lahb7G3zMSOZI8FVQq/9WpeaZIoigFnNjkTYKO//zAfAjMiEW0IC+Ya5QfpEIu
         hmsQ==
X-Gm-Message-State: AOJu0Yy129mqnO6kFOkVo5kxhilDqv+f/Qtx6auobjoRjU6VujtzHBP6
	xWZlDguOVQDu/xVa1eTSAgT1tZY74y3o94Sr/KBnrBjo35IT4Uez7/zyrcEli8aAJzP2My/0sAz
	5TGHfsPACDQ==
X-Google-Smtp-Source: AGHT+IG4ATd7FNzOa91yWDGLE/itRXBU5va1Cfi+ZMQfIZSL8JNeoZrTn2+Fex9+uqQ8V3EuaMcIKbB8u4Zs
X-Received: from wmbbi9.prod.google.com ([2002:a05:600c:3d89:b0:43d:9035:df36])
 (user=korneld job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:34d3:b0:441:b19c:96fe
 with SMTP id 5b1f17b1804b1-44c91ad6cc6mr192754875e9.10.1748431537029; Wed, 28
 May 2025 04:25:37 -0700 (PDT)
Date: Wed, 28 May 2025 11:23:29 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <20250528112328.1640743-2-korneld@google.com>
Subject: [PATCH v2] power: supply: qcom_battmgr: Report battery capacity
From: "=?UTF-8?q?Kornel=20Dul=C4=99ba?=" <korneld@google.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Sebastian Reichel <sre@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Kornel=20Dul=C4=99ba?=" <korneld@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Battery charge can be reported in several different ways. One of them is
is charge percentage referred to as POWER_SUPPLY_PROP_CAPACITY in the
power supply API. Currently the driver reports the capacity in this way
on SM8350, but not on the newer variants referred to as SC8280XP in the
driver. Although this is not a bug in itself, not reporting the
percentage can confuse some userspace consumers.
Mimic what is done in the ACPI driver (drivers/acpi/battery.c) and
calculate the percentage capacity by dividing the current charge value
by the full charge.

Signed-off-by: Kornel Dul=C4=99ba <korneld@google.com>
---
v2: Change the logic to avoid u64 division, which is problematic on
    32bit platforms.

 drivers/power/supply/qcom_battmgr.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qco=
m_battmgr.c
index fe27676fbc7c..33a70f3d72bc 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -577,6 +577,8 @@ static int qcom_battmgr_bat_get_property(struct power_s=
upply *psy,
 		val->intval =3D battmgr->status.capacity;
 		break;
 	case POWER_SUPPLY_PROP_CAPACITY:
+		if (battmgr->status.percent =3D=3D (unsigned int)-1)
+			return -ENODATA;
 		val->intval =3D battmgr->status.percent;
 		break;
 	case POWER_SUPPLY_PROP_TEMP:
@@ -617,6 +619,7 @@ static const enum power_supply_property sc8280xp_bat_pr=
ops[] =3D {
 	POWER_SUPPLY_PROP_STATUS,
 	POWER_SUPPLY_PROP_PRESENT,
 	POWER_SUPPLY_PROP_TECHNOLOGY,
+	POWER_SUPPLY_PROP_CAPACITY,
 	POWER_SUPPLY_PROP_CYCLE_COUNT,
 	POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN,
 	POWER_SUPPLY_PROP_VOLTAGE_NOW,
@@ -1063,6 +1066,26 @@ static void qcom_battmgr_sc8280xp_callback(struct qc=
om_battmgr *battmgr,
 		battmgr->ac.online =3D source =3D=3D BATTMGR_CHARGING_SOURCE_AC;
 		battmgr->usb.online =3D source =3D=3D BATTMGR_CHARGING_SOURCE_USB;
 		battmgr->wireless.online =3D source =3D=3D BATTMGR_CHARGING_SOURCE_WIREL=
ESS;
+		if (battmgr->info.last_full_capacity !=3D 0) {
+			/*
+			 * 100 * battmgr->status.capacity can overflow a 32bit
+			 * unsigned integer. FW readings are in m{W/A}h, which
+			 * are multiplied by 1000 converting them to u{W/A}h,
+			 * the format the power_supply API expects.
+			 * To avoid overflow use the original value for dividend
+			 * and convert the divider back to m{W/A}h, which can be
+			 * done without any loss of precision.
+			 */
+			battmgr->status.percent =3D
+				(100 * le32_to_cpu(resp->status.capacity)) /
+				(battmgr->info.last_full_capacity / 1000);
+		} else {
+			/*
+			 * Let the sysfs handler know no data is available at
+			 * this time.
+			 */
+			battmgr->status.percent =3D (unsigned int)-1;
+		}
 		break;
 	case BATTMGR_BAT_DISCHARGE_TIME:
 		battmgr->status.discharge_time =3D le32_to_cpu(resp->time);
--=20
2.49.0.1164.gab81da1b16-goog


