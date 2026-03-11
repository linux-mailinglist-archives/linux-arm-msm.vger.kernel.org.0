Return-Path: <linux-arm-msm+bounces-97084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GZeK9zusWnbHAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 23:38:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2174E26AF19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 23:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0CEC304CCD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 22:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C5E394478;
	Wed, 11 Mar 2026 22:38:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423352E62C6;
	Wed, 11 Mar 2026 22:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773268696; cv=none; b=f2f/mbQDZYfikdj7UHCQPlCV6BlJ3ewIRWmR5ed5BppNUrY3fZQI5OzAgvAN1GKYCSK6q/LLCM0EUTIkfOqb/ttCDkDULXug6kv3N1W30SM41s3zPo7qYNwfPasQT7PiJyF/+GxGoYcfUK3Ku/RS2jgeIIyKcIW9CmZStXR/B0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773268696; c=relaxed/simple;
	bh=aiCEMnxE1KwtxH/kdWOTMVqhx90a6pgfZa3LOt2qNaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pl/8OyGF82kWIOd1kj/Iz7Iy1acqTjM61cMHsByeiRlSz24MjHFp+4r8oiQx/eUPSvkicN3w7IUTl3neKQbQafxplCnhgZ9mUbUsYGbJBBVqCPp1BJpfipQ/rOdWoBDBn3SeauyR985YPmzE1sWx7z8//Hv/irrI13up/QZ2oUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0886720A45;
	Wed, 11 Mar 2026 23:31:10 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Wed, 11 Mar 2026 23:31:09 +0100
Subject: [PATCH] drm/msm/dsi: Restore widebus calculation for CMDMode
 panels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dsi-dsc-regresses-again-v1-1-6a422141eeea@somainline.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MsQrDMAwFf8VojsB2Qwr5ldLBsV8cLW6QoASC/
 72mww033N1kUIHR6m5SfMXk04aEyVE+UqtgKcMp+rj4RwhcTAaZFVVhBuNUkzSeN8Rn2fPsfaB
 Rn4pdrv/59e79B22Ty/dpAAAA
X-Change-ID: 20260311-dsi-dsc-regresses-again-4be27dfc4001
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Pengyu Luo <mitltlatltl@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2854;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=aiCEMnxE1KwtxH/kdWOTMVqhx90a6pgfZa3LOt2qNaQ=;
 b=owEBbQKS/ZANAwAKAfFi0jHH5IZ2AcsmYgBpse0u5Aw5JzOB2jWSvCSMl/ueEEhQI63jKpP6d
 LcmQYEP3hGJAjMEAAEKAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCabHtLgAKCRDxYtIxx+SG
 dsosD/9RTuj7J7OIUc6ihAJTTnTw6CiwB9MHH9xY6ZkjAUONWueeZpOyBYLCG8thynoHj9ThMCS
 j/Eph0IHsQmu4Rb2r1vx/kx0mu76szPmCft/c2bkklHgtisNbIh0Tdm5odRg4wvzlEegft2a/W/
 sejIQ5w3SN0DMywr8G1Aveg4fammvnK7fVcH6rzduE5W04pE0ppTc6vbXhOLWpNSJ5h40kV9OQM
 ss8bTYFg4J9gXDu7c599QG/TJvIfZcoLVJOkycv2llTNEmoWhOLowhNv8sI6Pmgxv70+jDUnJV2
 z17T4ouF3kW4M742XnzY+w091KIvqhz4oqVOun7XOngawiXSisQfdOFd+ja7EIJDOlQnHBDu1pg
 cZSi6Vx1JIpicmLf0mq4MY/V2n2/0xdXpGEo1pODigdkuPv/wgC+0KVcqfGC3lTKGLnhypU2DWj
 FDJafVCawnWODMPi98o8c503QLpGWkzhHBojo3LisxZqs/sWk1c4Jgvz7yW2Tc1NFqNM6wBFUfJ
 v5nl69mvWn4/N5mUVu2W2scsfzujNZpF3YjNd+dLE/Ox4P9azDQYOy9ZbBM+vhe4PM4LVLn63wo
 /QCPluY9OlJtbyIancNfS9gZsrRAAkbXLNENSty4wdf2SbxQuUJTO9lKJUQMrSUkBxA9H55wJzh
 Iowrmw1QdhnJHhA==
X-Developer-Key: i=marijn.suijten@somainline.org; a=openpgp;
 fpr=4E8B01B9A5BEA56B5FD66716F162D231C7E48676
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[somainline.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97084-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.947];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marijn.suijten@somainline.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,somainline.org:email,somainline.org:mid]
X-Rspamd-Queue-Id: 2174E26AF19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when
programming dsi registers") makes a false and ungrounded statement that
"Since CMD mode does not use this, we can remove !(msm_host->mode_flags
& MIPI_DSI_MODE_VIDEO) safely." which isn't the case at all.
dsi_timing_setup() affects both command mode and video mode panels, and
by no longer having any path that sets bits_per_pclk = 48 (contrary to
the updated code-comment) all DSI DSC panels on SM8350 and above (i.e.
with widebus support) regress thanks to this patch.

The entire reason that video mode was originally omitted from this code
path is because it was never tested before; any change that enables
widebus for video mode panels should not regress the command mode path.

Thus add back the path allows 6 bytes or 48 bits to be sent per pclk
on command mode DSI panels with widebus, restoring the panel on devices
like the Sony Xperia 1 III and upwards.

Fixes: ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when programming dsi registers")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
In addition I can't say I understand the original commit message
at all; it mentions a BPC=10 mode however the highest format that
mipi_dsi_pixel_format_to_bpp supports is RGB888 thus it won't
ever return anything above 24, which is the original amount the
non-command-mode path defaulted to (regardless of widebus)...  Was that
patch doing anything for video mode at all?

It feels like the conditional introduced here is only making things more
confusing, but I don't have enough input to confirm what the video-mode
path should be doing in widebus mode (multiply BPC by the number of
components and by 2 in case of widebus?).
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e8e83ee61eb0..168e37e38fc7 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1029,10 +1029,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		 * unused anyway.
 		 */
 		h_total -= hdisplay;
-		if (wide_bus_enabled)
-			bits_per_pclk = mipi_dsi_pixel_format_to_bpp(msm_host->format);
-		else
+		if (wide_bus_enabled) {
+			if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
+				bits_per_pclk = mipi_dsi_pixel_format_to_bpp(msm_host->format);
+			else
+				bits_per_pclk = 48;
+		} else {
 			bits_per_pclk = 24;
+		}
 
 		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc) * 8, bits_per_pclk);
 

---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260311-dsi-dsc-regresses-again-4be27dfc4001

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>


