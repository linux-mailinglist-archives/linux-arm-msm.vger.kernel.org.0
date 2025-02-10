Return-Path: <linux-arm-msm+bounces-47497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0B4A2FE4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 00:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18B9E3A1EA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 23:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F7B261374;
	Mon, 10 Feb 2025 23:19:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB1F25EFBE
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 23:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739229583; cv=none; b=OYNE+asnhWMagCiK3iATErIaDJWClcz2amlP5rCUfxaMb88Y0P7UQYWban3jxkcIBx7ONyJeJZb0vMJeTS8PoY/EQGIjt3YFtVLolljJ7LZbmYvb0ZMR5hsMp3AgERBf0wh5+WANR7hodS4hZ8rx1vqlPoEa2xVLfkA+IhDRC0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739229583; c=relaxed/simple;
	bh=2Vff43PmakmA60WnMtnTOd4EPxaSc0FyYuoDAegnans=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oX4LVERhskLiVWmoIAzsCeq24ND9IoDfzexNr7lXvxc7JHQ7LpQ4FsDm1ADdPO6tavwAbzSlx3YEcYIXs52Opl2NyJeoDqOzKufXTum9g2GQ5G+FYH6K3zkayQGoF39cTMwuzrD60aCR/ac2kxPZjlRWd8Q+sNvDDlu8y5zhkyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id DBBC43EC07;
	Tue, 11 Feb 2025 00:19:35 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue, 11 Feb 2025 00:19:32 +0100
Subject: [PATCH] drm/msm/dpu: Don't leak bits_per_component into random
 DSC_ENC fields
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-dsc-10-bit-v1-1-1c85a9430d9a@somainline.org>
X-B4-Tracking: v=1; b=H4sIAIOJqmcC/x3MMQqAMAxA0auUzAbaiCheRRxsGzVLlUZEkN7d4
 viG/19QzsIKo3kh8y0qR6pwjYGwL2ljlFgNZKmz5BxGDegsermQiAYfqfXR9lCDM/Mqzz+b5lI
 +Ueq1NVwAAAA=
X-Change-ID: 20250211-dsc-10-bit-2228bd23bd07
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2510;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=2Vff43PmakmA60WnMtnTOd4EPxaSc0FyYuoDAegnans=;
 b=owEBbQKS/ZANAwAIAfFi0jHH5IZ2AcsmYgBnqomHEJ0yt3FN3odGPxSVaDdqU42RwEjzbllvz
 0WBNVm5D/2JAjMEAAEIAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCZ6qJhwAKCRDxYtIxx+SG
 diopD/oD5I500NzBmoLFFSxEF01WQYRQ8Gq7XDaigBvQKt6+I0eotsCcpCtYb/GSgHbdDGWTmLH
 HN3fF/eqbRgi4ixWdzArCRsrXtpE6GU3+2+EUYLOQYedsplWtb6WrrA0ahCcDc7NNc9SpFYNJKw
 JHzrzqbpVOtystGN/WQLADgMPZW/7U4fqyowy7gxtRkF8CcNByjifSXuKz5tJ2sUX/ch3DkCcij
 YwkowENun/OHZeWA6ptQ6A2H9bJWsiJBH3K1VB9czdkdBIp73HhJ3FMz7IFGrX/Be83zi9V1ui1
 Lr5NdwVTfLv4xtEsJorIVgw49K/L5UTs64QNFFaneu6S7UiL7oUxjbHTXbCXeuEUZeQxc0y67Y4
 T46Pjn+csennhTIb6YxNwOKDpEWeqcMnNMvjS97jaWARoJ9Em2xdoveL7/bsmwYrwaha/7/yMxZ
 QeqAGcUZ+juN8HZZOf02IZDReIUGRK8TLNyTNxxj4ci5QlwNa0BAWBP3sCafpYAvDrFLKKaNd2Q
 7j+i5HSeOvr+vsDDzi2+Gi/Ajpk6ObbeJcSOZ94ArY/eaG7+olkhSXtrZ7ecG6Kl5Xe36nZgXo6
 oKM5C7gZ6zKYDE7w6ZKF+EPeLHlzJJej0zlF1sQ1ROLKVS53+wqIVV1K9CmuU4C1SKpU/07sf8n
 bp6fjw/RTSfN7Gw==
X-Developer-Key: i=marijn.suijten@somainline.org; a=openpgp;
 fpr=4E8B01B9A5BEA56B5FD66716F162D231C7E48676

What used to be the input_10_bits boolean - feeding into the lowest
bit of DSC_ENC - on MSM downstream turned into an accidental OR with
the full bits_per_component number when it was ported to the upstream
kernel.

On typical bpc=8 setups we don't notice this because line_buf_depth is
always an odd value (it contains bpc+1) and will also set the 4th bit
after left-shifting by 3 (hence this |= bits_per_component is a no-op).

Now that guards are being removed to allow more bits_per_component
values besides 8 (possible since commit 49fd30a7153b ("drm/msm/dsi: use
DRM DSC helpers for DSC setup")), a bpc of 10 will instead clash with
the 5th bit which is convert_rgb.  This is "fortunately" also always set
to true by MSM's dsi_populate_dsc_params() already, but once a bpc of 12
starts being used it'll write into simple_422 which is normally false.

To solve all these overlaps, simply replicate downstream code and only
set this lowest bit if bits_per_component is equal to 10.  It is unclear
why DSC requires this only for bpc=10 but not bpc=12, and also notice
that this lowest bit wasn't set previously despite having a panel and
patch on the list using it without any mentioned issues.

Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 657200401f57635481a22f018ff00076dfd2ba34..cec6d4e8baec4d00282465cfd2885d365f835976 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -52,6 +52,7 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
 	u32 slice_last_group_size;
 	u32 det_thresh_flatness;
 	bool is_cmd_mode = !(mode & DSC_MODE_VIDEO);
+	bool input_10_bits = dsc->bits_per_component == 10;
 
 	DPU_REG_WRITE(c, DSC_COMMON_MODE, mode);
 
@@ -68,7 +69,7 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
 	data |= (dsc->line_buf_depth << 3);
 	data |= (dsc->simple_422 << 2);
 	data |= (dsc->convert_rgb << 1);
-	data |= dsc->bits_per_component;
+	data |= input_10_bits;
 
 	DPU_REG_WRITE(c, DSC_ENC, data);
 

---
base-commit: 77969bdf11bca51038df66410338d088b327fc49
change-id: 20250211-dsc-10-bit-2228bd23bd07

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>


