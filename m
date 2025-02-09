Return-Path: <linux-arm-msm+bounces-47332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9888EA2E0F0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 22:43:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80E993A5037
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 21:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64E022F39D;
	Sun,  9 Feb 2025 21:43:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BFC1E283C
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 21:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739137385; cv=none; b=HxBVpSC2b5/4WRQpP2+RE5Sz8a8udfP5NS0WC4HO0B6neJmtl/5iN+ypnlxf+H/z9MonT0HRyXOc2JBAyp9ywLgkCBVN6+KFr6LMyZOroKd8J/AwMEwAcYtPfuVhu2PG8lOcWaFLN3SUk5xqu5bUBebMJ8i9sIEsYGvM8PU4anU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739137385; c=relaxed/simple;
	bh=7iQeAa2scXE3ZIzMVva1f79wDDea0/qP7onDXsbm9Ps=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GHKJHlHgTGN/HNixLWUxkfLQifvFZc8h8knvOo0Pommh5L03JqaVfttjt93SLk2G87hcfl7boH2xfWrr8DL9J5hXKNP0XxPFYv9xz30MvmSUzys4ictnNT88vZChpEwWCyowGF5HhKIO8yg/tHVgtppiIEmUuMW3yQoJEsCM7Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id D953F20189;
	Sun,  9 Feb 2025 22:42:58 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 0/3] drm/msm: Initial fixes for DUALPIPE (+DSC) topology
Date: Sun, 09 Feb 2025 22:42:51 +0100
Message-Id: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFshqWcC/42Py26DMBBFfwV53als4wegqup/VFkYPCQjYUxtQ
 I2i/Hsdom666m7ujHTO3BvLmAgz66obS7hTpjiXIF8qNlzcfEYgXzKTXCquhAGfAoQcgGZayU3
 gNzcttCD4PMBI35ihHrkVuud1PypWQEvC41A4n6eSL5TXmK6HcxeP7S/e/ge/C+BgG4c1YutMa
 z9yDI7miWZ8jenMTvenNOHXVgqtTzMLmLM7CnXVWxFqLqQEv2wghIA1LnGK5yvsEgRorrHVrVF
 ubP/g3x+VepcRhhgCrV2FXjde8BqNd0I7peQ4NlYb27SNNY0famdMGctj9x+nBKsXcQEAAA==
X-Change-ID: 20240416-drm-msm-initial-dualpipe-dsc-fixes-3f0715b03bf4
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2983;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=7iQeAa2scXE3ZIzMVva1f79wDDea0/qP7onDXsbm9Ps=;
 b=owEBbQKS/ZANAwAIAfFi0jHH5IZ2AcsmYgBnqSFdxu2CR2ze+AQ7M195h1/C/TpArGiTkE2pB
 woHN0p+LPaJAjMEAAEIAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCZ6khXQAKCRDxYtIxx+SG
 djrjEACKVj6FsoZsvRDiP8kpL5aey9nLdXbume5bJujSMGoMrm5WLXIa0+cm62lhoK5dWgIFNFM
 wrlNlO/AgnUBeEJmJdhOvrusqHqtXrWLKZ/lZczSg8fi/adZtZ4io7xNOMGxU0SPYtvvE3MsKvu
 DLBDgDOIx7ZQkpodHayG9hc2xD/4kV6IjL4edgAX/0EDRIqUXAn3e4jSzLHLYM5Q2RaIMr27Bxl
 T7kjs6ydiE0W0wUslcH6rcRPtRpb8hvQ0XZY6DG7/Z5xYpcIjjWBLg26v5LHP0QJHkj/oFqp4jD
 /VcEFkfDR/VRaW6WLDqBCEIEs3pUFMRZr7cqcDcsTxPA/y+MoKw5vdAf2Nj+74xZIXCX5Z06Ho+
 +HS49UV4RMBsZmDVJlhy5QTxXx0oZV9WFHjRpCqsyAr4esYXoDs20I2Bcgd7fwYa4Ym3IRWuxZt
 u3d/r/46qnMRnV8gGu3jv2lMBPoanK60MlXBoMdiGJjhkFpQkvxQ7AYuaGHOUviGW5MNmIG5SpO
 yQcXBsn7YgCPIoAAza7T0xyrGCW18YzqKt9xnDQI7VeKyCePRakAnTLfzQBkOHuao4G1Y7XzeCF
 Hxnx8rjk9+4mP2VF9qRF1+kMKQDk1JoZ0FJKM8+7yRr1d3bgRBIiKeBQtRdnZ6u6mpUGYXkN3QO
 dCE8rGMo3tNbV7A==
X-Developer-Key: i=marijn.suijten@somainline.org; a=openpgp;
 fpr=4E8B01B9A5BEA56B5FD66716F162D231C7E48676

This series covers a step-up towards supporting the DUALPIPE DSC
topology, also known as 2:2:2 topology (on active-CTL hardware).  It
involves 2 layer mixers, 2 DSC compression encoders, and 2 interfaces
(on DSI, this is called bonded-DSI) where bandwidth constraints (e.g. 4k
panels at 120Hz) require two interfaces to transmit pixel data.

Enabling this topology will be hard(er) than downstream as hacking a
layout type in DTS won't be describing the hardware, but "dynamically"
determining it at runtime may pose some of a challenge that is left to a
future series.  Such changes will also involve the 1:1:1 topology needed
for constrained hardware like the Fairphone 5 on SC7280 with access to
only one DSC encoder and thus ruled out of the current 2:2:1 topology.

Likewise, the patches and discussions around improving active-CTL
configuration to support bonded interfaces (that share a single CTL
block) are still in full swing and hence elided from this series, apart
from one patch to fix the ACTIVE_DSC register coding to support updates,
so that it is not forgotten about.

This issue and successful resolution of all the problems is discussed
and demonstrated in https://gitlab.freedesktop.org/drm/msm/-/issues/41.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
Changes in v2:
- Dropped patches that were applied;
- dsi_mgr_setup_components() now sets both the usecase and phy_mode
  prior to calling msm_dsi_host_register(), and for non-bonded too;
- Added patch to remove a forced num_intf = 1 when DSC is enabled;
- Reworked hdisplay/2 "fix" when calculating "DSC timing" to instead use
  dsc->slice_count, allowing us to remove msm_dsc_get_slices_per_intf()
  entirely;
- Link to v1: https://lore.kernel.org/r/20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org

Depends on:
- https://lore.kernel.org/linux-arm-msm/20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org/
  (only to prevent conflicts with the patch that removes a hardcoded
   num_intf = 1;).

---
Marijn Suijten (3):
      drm/msm/dsi: Use existing per-interface slice count in DSC timing
      drm/msm/dsi: Set PHY usescase (and mode) before registering DSI host
      drm/msm/dpu: Remove arbitrary limit of 1 interface in DSC topology

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  7 ++++---
 drivers/gpu/drm/msm/dsi/dsi_host.c          |  8 ++++----
 drivers/gpu/drm/msm/dsi/dsi_manager.c       | 30 ++++++++++++++++++-----------
 drivers/gpu/drm/msm/msm_dsc_helper.h        | 11 -----------
 4 files changed, 27 insertions(+), 29 deletions(-)
---
base-commit: ed58d103e6da15a442ff87567898768dc3a66987
change-id: 20240416-drm-msm-initial-dualpipe-dsc-fixes-3f0715b03bf4
prerequisite-message-id: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
prerequisite-patch-id: 9ed44ae089b173f452a6603e6739b0b3bf2d9274

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>


