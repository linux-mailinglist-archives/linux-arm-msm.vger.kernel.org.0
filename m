Return-Path: <linux-arm-msm+bounces-78206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD0EBF827C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 20:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CEB8422819
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 18:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54D234C14B;
	Tue, 21 Oct 2025 18:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idRfU8Xx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E7134D904;
	Tue, 21 Oct 2025 18:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761072807; cv=none; b=J1iCAMl9xuaRXbJL1NkcpjvLhXBrkhi01FhlibqOXrRLKt+m/M9iIeUhrCYfRZCk0W9V6M+zrgiqj+kBWlMTYXy1JraJUG1nRmqTqdqvuAU4NZ6Q5UHSrjak83CvzJ6EjARWk0vtgx+VRT5UV9F9iv+jvbCnqUGWLBvZ8tSfGIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761072807; c=relaxed/simple;
	bh=C5ASNnmCmjSAcDOoSgjvozIBRKcQ5VpYkxdjPo6f1JU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JYmOa6ItmtiuuyOGIlJE6Eij9ioi0ZNNI1hlaYFmstmKf5x9Jb5Z6WrC7E6u0FHdR7tfhVytQOFRi4ppw+EVWnQsH8wqzUOc/9NiHAxwzUDV/PAxkIoqiiZS5JweupEg7tk1uWj/bSwrvYnsThZVjR+wf7NcsznTwrJQ2bdYoB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idRfU8Xx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 283D3C4CEF1;
	Tue, 21 Oct 2025 18:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761072807;
	bh=C5ASNnmCmjSAcDOoSgjvozIBRKcQ5VpYkxdjPo6f1JU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=idRfU8XxWpxeoW4rjtH1zLNwMc22v6LSmnzNUYMKa/iUzOtgB0UEZVuyrUGhbbhFV
	 B6I1v2+7JyR3exb9j4/kQj46qI699414511FEyWHOVYOpQtISRI2mAfKtZKJkAY9LZ
	 PS5765rdL7aeqyg0XqjuAWAOgJxihO0jrYwD+3bGitUdJvMbiGquGyyJXKKRktDTvD
	 zrqFnUdD4cFd+xZ1ZkRxQxcf0AXKwCAU67BvzhIpJ1ybbsFQb7HXz7rWFawv4vqLV/
	 exxfXFPIUEJT6Sdt+TszONOYdZDBUDNE/NgtPPmQ6OPFmqFC3QxqnCO9zlGYuodKhO
	 53WO5CEt9SnGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17186CCD1B9;
	Tue, 21 Oct 2025 18:53:27 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Date: Tue, 21 Oct 2025 13:53:06 -0500
Subject: [PATCH v2] backlight: qcom-wled: fix unbalanced ovp irq enable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-qcom-wled-fix-unbalanced-ovp-irq-enable-v2-1-7ff115b4ffe7@joelselvaraj.com>
X-B4-Tracking: v=1; b=H4sIAJHW92gC/5WNQQ7CIBBFr9KwdgxgIdGV9zBdDGW0NAgtKGqa3
 l3sDVy+n/z3FpYpOcrs1CwsUXHZxVBB7hrWDxhuBM5WZpJLJbgUMPfxDi9PFq7uDc9g0GPoK8Y
 ygUszUEDjCVTbaiO4RnvUrNqmRPWwlS5d5cHlR0yfLVzEb/2/UQQIIGsPvLVCK1TnMZLP5AsmH
 PfVwrp1Xb+2OdUg5QAAAA==
X-Change-ID: 20251021-qcom-wled-fix-unbalanced-ovp-irq-enable-5446b106ad96
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joel Selvaraj <foss@joelselvaraj.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761072806; l=4368;
 i=foss@joelselvaraj.com; s=20250919; h=from:subject:message-id;
 bh=+zxsXoGdLJQYgRVd89LWEBBj6NGtlp3Yp8wwgEWlx8w=;
 b=5LCIDELJydjgakfLZUSdmtVysbCZBFc51OM6rE+/GwWadfxB/8xX6wtr4L6MMAreYmFRTKba8
 p0+GvI2mgiIBg6NHMuFOHjhwfHWdPlAXUjEJPXkualGFTiWWFQXE7gA
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=BBMos4ph15apUFh2AkG9rLZIrBWl5LD4egPOhEv63X0=
X-Endpoint-Received: by B4 Relay for foss@joelselvaraj.com/20250919 with
 auth_id=529
X-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Reply-To: foss@joelselvaraj.com

From: Joel Selvaraj <foss@joelselvaraj.com>

In Xiaomi Poco F1 and at least few other devices, the qcom wled driver
triggers unbalanced ovp irq enable warning like the following during
boot up.

[    1.151677] ------------[ cut here ]------------
[    1.151680] Unbalanced enable for IRQ 176
[    1.151693] WARNING: CPU: 0 PID: 160 at kernel/irq/manage.c:774 __enable_irq+0x50/0x80
[    1.151710] Modules linked in:
[    1.151717] CPU: 0 PID: 160 Comm: kworker/0:11 Not tainted 5.17.0-sdm845 #4
[    1.151724] Hardware name: Xiaomi Pocophone F1 (DT)
[    1.151728] Workqueue: events wled_ovp_work
...<snip>...
[    1.151833] Call trace:
[    1.151836]  __enable_irq+0x50/0x80
[    1.151841]  enable_irq+0x48/0xa0
[    1.151846]  wled_ovp_work+0x18/0x24
[    1.151850]  process_one_work+0x1d0/0x350
[    1.151858]  worker_thread+0x13c/0x460
[    1.151862]  kthread+0x110/0x114
[    1.151868]  ret_from_fork+0x10/0x20
[    1.151876] ---[ end trace 0000000000000000 ]---

Fix it by storing and checking the state of ovp irq before enabling and
disabling it.

Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
I was able to debug the issue a little further. This happens mainly because
devm_request_threaded_irq already enables the ovp irq during probe. Then ovp
work gets scheduled when update_status happens and in turn enables the irq again.
Tracking the status makes it easy to avoid the double irq enable. But I am
open to try a different approach if there is any suggestion.
---
Changes in v2:
- Track ovp irq status using ovp_irq_enabled flag instead of ovp_irq_disabled. (Konrad Dybcio)
- Use short wrapper functions for ovp irq enable and disable. (Konrad Dybcio)
- Link to v1: https://lore.kernel.org/r/20251021-qcom-wled-fix-unbalanced-ovp-irq-enable-v1-1-edd304d165a5@joelselvaraj.com
---
 drivers/video/backlight/qcom-wled.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index a63bb42c8f8b0333cd6d0ddc5bda93916da3fef3..3f49e4b3cdeb12541c057e56bac871a8ff680283 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -197,6 +197,7 @@ struct wled {
 	bool disabled_by_short;
 	bool has_short_detect;
 	bool cabc_disabled;
+	bool ovp_irq_enabled;
 	int short_irq;
 	int ovp_irq;
 
@@ -290,11 +291,27 @@ static int wled5_set_brightness(struct wled *wled, u16 brightness)
 	return rc;
 }
 
+static void wled_enable_ovp_irq(struct wled *wled)
+{
+	if (!wled->ovp_irq_enabled) {
+		enable_irq(wled->ovp_irq);
+		wled->ovp_irq_enabled = true;
+	}
+}
+
+static void wled_disable_ovp_irq(struct wled *wled)
+{
+	if (wled->ovp_irq_enabled) {
+		disable_irq(wled->ovp_irq);
+		wled->ovp_irq_enabled = false;
+	}
+}
+
 static void wled_ovp_work(struct work_struct *work)
 {
 	struct wled *wled = container_of(work,
 					 struct wled, ovp_work.work);
-	enable_irq(wled->ovp_irq);
+	wled_enable_ovp_irq(wled);
 }
 
 static int wled_module_enable(struct wled *wled, int val)
@@ -322,7 +339,7 @@ static int wled_module_enable(struct wled *wled, int val)
 			schedule_delayed_work(&wled->ovp_work, HZ / 100);
 		} else {
 			if (!cancel_delayed_work_sync(&wled->ovp_work))
-				disable_irq(wled->ovp_irq);
+				wled_disable_ovp_irq(wled);
 		}
 	}
 
@@ -1607,6 +1624,8 @@ static int wled_configure_ovp_irq(struct wled *wled,
 		return 0;
 	}
 
+	wled->ovp_irq_enabled = true;
+
 	rc = regmap_read(wled->regmap, wled->ctrl_addr +
 			 WLED3_CTRL_REG_MOD_EN, &val);
 	if (rc < 0)
@@ -1614,7 +1633,7 @@ static int wled_configure_ovp_irq(struct wled *wled,
 
 	/* Keep OVP irq disabled until module is enabled */
 	if (!(val & WLED3_CTRL_REG_MOD_EN_MASK))
-		disable_irq(wled->ovp_irq);
+		wled_disable_ovp_irq(wled);
 
 	return 0;
 }
@@ -1726,7 +1745,7 @@ static void wled_remove(struct platform_device *pdev)
 	mutex_destroy(&wled->lock);
 	cancel_delayed_work_sync(&wled->ovp_work);
 	disable_irq(wled->short_irq);
-	disable_irq(wled->ovp_irq);
+	wled_disable_ovp_irq(wled);
 }
 
 static const struct of_device_id wled_match_table[] = {

---
base-commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
change-id: 20251021-qcom-wled-fix-unbalanced-ovp-irq-enable-5446b106ad96

Best regards,
-- 
Joel Selvaraj <foss@joelselvaraj.com>



