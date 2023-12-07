Return-Path: <linux-arm-msm+bounces-3639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 983A3808434
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 10:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC0B428426C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 09:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F9634186;
	Thu,  7 Dec 2023 09:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Wc6CEcmU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6703010C3;
	Thu,  7 Dec 2023 01:19:10 -0800 (PST)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4621966073A3;
	Thu,  7 Dec 2023 09:19:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701940749;
	bh=jsXvyaxLK1RLJ0w3to/+TD1bfT9/09QovVkjG8ry5mQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wc6CEcmUdfsE+2O+VjiYKiRkj6IaKLsk1IKefHHhHMgg3T0ctwHbOmceNjNQ0hTRF
	 RxmlPJS6I3eIbk5I5lSMBr9+5X7+coCRSs5SGtZhA/sjrNu02oZMgFVx5Szi+iMVgW
	 JJAW1EiFdHkpkgg2jgTUZtN+SifVl0B/mE8OvgFYeV0PRDuxf3IHSHnbzZjQWbiPL0
	 Xu6J5WlP0OyqJTr+lvq6r/U+saYAt8eYE7SzKZ9FKufgabdgItKpksSPs4Nv/UL1ec
	 K9OgM2RYDgSFPhJNoIj+NDVzuaxdq36+0XYveQEmWR7r5nUx52sguKJHVabtZA4y7G
	 fSPGo6aAi/4xw==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: david.heidelberg@collabora.com,
	sergi.blanch.torne@collabora.com,
	guilherme.gallo@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	emma@anholt.net,
	robdclark@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v7 07/10] drm: ci: virtio: Make artifacts available
Date: Thu,  7 Dec 2023 14:48:28 +0530
Message-Id: <20231207091831.660054-8-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231207091831.660054-1-vignesh.raman@collabora.com>
References: <20231207091831.660054-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There were no artifacts available for virtio job.
So make the artifacts available in the pipeline job.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v5:
  - Added a new patch in the series to make artifacts available for virtio jobs

v6:
  - No changes

v7:
  - No changes

---
 drivers/gpu/drm/ci/test.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index e0fdc55c9b69..2c9a1838e728 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -329,6 +329,8 @@ virtio_gpu:none:
   script:
     - ln -sf $CI_PROJECT_DIR/install /install
     - mv install/bzImage /lava-files/bzImage
+    - mkdir -p $CI_PROJECT_DIR/results
+    - ln -sf $CI_PROJECT_DIR/results /results
     - install/crosvm-runner.sh install/igt_runner.sh
   needs:
     - debian/x86_64_test-gl
-- 
2.40.1


