Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED16D7CF0BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Oct 2023 09:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235173AbjJSHHz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Oct 2023 03:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232858AbjJSHHr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Oct 2023 03:07:47 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B09D1A8;
        Thu, 19 Oct 2023 00:07:38 -0700 (PDT)
Received: from localhost.localdomain (unknown [103.93.195.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: vignesh)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 79A3E6607322;
        Thu, 19 Oct 2023 08:07:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1697699257;
        bh=lLB3pfyQ1VdvBiw+7IWoLWuuTQXuXDpNyhFCwCmP2us=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lXA8/q1fpGzZIpdBsE7mvhlMnapbiiCEN3jKHSACj6l9NeU1iKu1sJyPBR2C9GwOk
         TEYbvwwjQksoHL5v8nsVwfZ4e7H6mqzMx/JYB6v4CQeHnIDXwupKY/IE3wt+oslZQI
         n/IktgDlfnNueSKOh5CDnQvGZIVnJWxPdi+GBzfGgbwrG0Sw55wQz7t324U0kMtT5v
         5+ZFCDcsh9UdDHH3K+dAONWO5YRQk3a6nshhBm9EF8JFclalelAT2AoUIVqsdeBZyo
         ZqrEaapcfSJWtWyUvAcIFWbiVMqYr9BOrCd89jNcRmxyGQghsCHEo9nW2eL10l7i/R
         EGoEoWiQDxpaw==
From:   Vignesh Raman <vignesh.raman@collabora.com>
To:     helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch
Cc:     david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
        guilherme.gallo@collabora.com, daniels@collabora.com,
        gustavo.padovan@collabora.com, emma@anholt.net,
        robdclark@gmail.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        virtualization@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 6/9] drm: ci: mediatek: Set IGT_FORCE_DRIVER for mt8173
Date:   Thu, 19 Oct 2023 12:36:47 +0530
Message-Id: <20231019070650.61159-7-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019070650.61159-1-vignesh.raman@collabora.com>
References: <20231019070650.61159-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Expected driver for mt8173 is "mediatek" and for mt8183
it is "panfrost". Set IGT_FORCE_DRIVER to 'mediatek' as
the expected driver for mt8173.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v5:
  - Added a new patch in the series to set IGT_FORCE_DRIVER to 'mediatek' for mt8173.

---
 drivers/gpu/drm/ci/igt_runner.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index c6cf963592c5..2b9f710438a2 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -30,6 +30,10 @@ case "$DRIVER_NAME" in
         ;;
 esac
 
+if [ "$CI_JOB_NAME" = "mediatek:mt8173" ]; then
+    export IGT_FORCE_DRIVER=${DRIVER_NAME}
+fi
+
 if [ -e "/install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt" ]; then
     IGT_SKIPS="--skips /install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt"
 fi
-- 
2.40.1

