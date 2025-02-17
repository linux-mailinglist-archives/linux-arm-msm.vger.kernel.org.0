Return-Path: <linux-arm-msm+bounces-48198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF088A3817D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 12:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E80B188A01D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78482185B8;
	Mon, 17 Feb 2025 11:18:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D6C21766E
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 11:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739791085; cv=none; b=Xh6tEZeYqB1i23JllRLZFWri6d6B4czyjeJcmMWiSAbDGNWM5wd1LL96uzQJ9P7ltjSUQQ8yiIfiWX7AvUvWGowVH25ftJeIcMnbf2fGi1Pv41nYC/+Bnl9irusLQvoomTgPxNcSjrOXVXihJDwpmVgmRnuD7ounqyRieKx68Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739791085; c=relaxed/simple;
	bh=MgMGnmZBZiiXwg/TOFHX7DTi1si89IdnuyFW3h892yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bzr+ocmMy68N+XxkkmbnNI4XEDGRNmJidz7M78Fe97bxcCE57DF1/cBqHp99mjbi+/FtDm7BaWLFPDfu4R8K15EjstqyLo1ALst5Vn2FpCBQ7XZIbJngojaO4ygdJ10TezRxyhk3kRFRlTuuk8E3NOD8bAsR7ulk5E7s6YdL7qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7C5931F8F2;
	Mon, 17 Feb 2025 12:17:55 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 17 Feb 2025 12:17:43 +0100
Subject: [PATCH v3 3/3] drm/msm/dpu: Remove arbitrary limit of 1 interface
 in DSC topology
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-drm-msm-initial-dualpipe-dsc-fixes-v3-3-913100d6103f@somainline.org>
References: <20250217-drm-msm-initial-dualpipe-dsc-fixes-v3-0-913100d6103f@somainline.org>
In-Reply-To: <20250217-drm-msm-initial-dualpipe-dsc-fixes-v3-0-913100d6103f@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Archit Taneja <architt@codeaurora.org>, 
 Hai Li <hali@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=MgMGnmZBZiiXwg/TOFHX7DTi1si89IdnuyFW3h892yg=;
 b=owEBbQKS/ZANAwAIAfFi0jHH5IZ2AcsmYgBnsxrgGM6TmLIP+Y8pCQpDj7IdZUB4VzZ8riqFj
 a30QyrxqXOJAjMEAAEIAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCZ7Ma4AAKCRDxYtIxx+SG
 dtN8EACFtQBw8cwzIfeyB/OhAWSC/pSEkfkYf0pCMHdtroktRTzvlw52AvGnd0yLBCTEBdnCPDt
 Et09anMQ9iA/Qi0jsDMDNnhXvANL6WuG8DDXlDzX6QyVWSKJWIFR3Kh8xBeLs8IQpZMAMjFVwzz
 10nFpVjFuedGsh8hVVD7Qg6DPqtbzagtRcg1AIJqwuynUJawrA9yrlW9GzdtYV4p5dZYdTiBHS5
 4eCHQn5l6q4XA+1WmfJVR+z5+4IA0fZB+IUmbocm1R9no8/X5l11eey6SDDNn+wW4ov5D0SLR3A
 9IQdf6Ma2bG8RgmJLwFYPOGHsk9zmR6BPzUO6VX1gQ/O9cxillPLO8/Uw6UVplCdFTiO1WcoJ84
 sllqEh1oNh9aerRb8iLUhPnr3bYl2XYmb2eHECTQLTBTuRol1126PIkFLUbSUXh48wzuSlXaz0S
 7r/JP5zWgHYPf+yY+Y8CNCf0+b8CXwpb6cEg+XCkHD9XnWycsbaLqFvbTsltis8FzAoPvEFe+9m
 FRmydy7vYSeR9DqBhmvpMKjMidKc2ZiMfI/UWKzuO/EBAt97vOJVt/ypptZjfsfd5gLbWXMvz4g
 17+cFQW/oYBfFth0DJMdJUTUb+oC/aKAK4rWqpTHASATUakVY8s4DlsZ26PxNqkQxjmdDG6pbDP
 MZoMDLeTEgEPqEg==
X-Developer-Key: i=marijn.suijten@somainline.org; a=openpgp;
 fpr=4E8B01B9A5BEA56B5FD66716F162D231C7E48676

When DSC is enabled the number of interfaces is forced to be 1, and
documented that it is a "power-optimal" layout to use two DSC encoders
together with two Layer Mixers.  However, the same layout (two DSC
hard-slice encoders with two LMs) is also used when the display is
fed with data over two instead of one interface (common on 4k@120Hz
smartphone panels with Dual-DSI).  Solve this by simply removing the
num_intf = 1 assignment as the count is already calculated by computing
the number of physical encoders within the virtual encoder.

Fixes: 7e9cc175b159 ("drm/msm/disp/dpu1: Add support for DSC in topology")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d67127f67a4492f30329ee15267369ca7540288a..1b092fa45b1dadbeb06b5c086c7638556bd313dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -686,20 +686,21 @@ static struct msm_display_topology dpu_encoder_get_topology(
 
 	if (dsc) {
 		/*
-		 * Use 2 DSC encoders and 2 layer mixers per single interface
+		 * Use 2 DSC encoders, 2 layer mixers and 1 or 2 interfaces
 		 * when Display Stream Compression (DSC) is enabled,
 		 * and when enough DSC blocks are available.
 		 * This is power-optimal and can drive up to (including) 4k
 		 * screens.
 		 */
-		if (dpu_kms->catalog->dsc_count >= 2) {
+		WARN(topology.num_intf > 2,
+		     "DSC topology cannot support more than 2 interfaces\n");
+		if (intf_count >= 2 || dpu_kms->catalog->dsc_count >= 2) {
 			topology.num_dsc = 2;
 			topology.num_lm = 2;
 		} else {
 			topology.num_dsc = 1;
 			topology.num_lm = 1;
 		}
-		topology.num_intf = 1;
 	}
 
 	return topology;

-- 
2.48.1


