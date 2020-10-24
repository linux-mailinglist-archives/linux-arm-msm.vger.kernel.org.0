Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A208C297D81
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Oct 2020 18:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1762395AbgJXQf0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Oct 2020 12:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761918AbgJXQfY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Oct 2020 12:35:24 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73FECC0613D2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2020 09:35:22 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t9so6377760wrq.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2020 09:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ER8iR0n3TP0B50wH2AMHoifIBM+NeyH/1BCBaFlBLbo=;
        b=WnKcgYaDxVABnebEyKyc17XeuY1aZnNqlqYonooOM8bR5CB1mAAI79mFikVohrBiPP
         88324mr04/G5u4VQ9pAknsne5ET+JdvCCMJnV3WPitcZTLPd87Wjkz8IBmSNsp3/KKPM
         Z8UO8uj7iBqCZniPfk/rb1DkG37OpqZf4LD1PN9CvPHY8iEsWinPQX07Ejh4B7nyzJ4X
         AYbgA50xcZMZHTPJHcjcI44wH9vtGdPVIe4qn25yOV8IE+tHqehTs4n7/S03RkExwPRp
         2VzvRxCyudMqRwND+fh5c25rRqrc0LRLmhcBqKTp74LTd4aVk1gUMmi0Iu2GQ/X36p/8
         /E4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ER8iR0n3TP0B50wH2AMHoifIBM+NeyH/1BCBaFlBLbo=;
        b=bBo8VnmxyTCFuHL3eHG9PnijjDH9XcdgVkNl5fQunuhu4yNFj0/LUb1I9mYFXlJeDR
         PULRr6N1iTGOJ9XKdUQAYeTD+JoCElgleQnjNyndGA0yDjSrJDP0aCZ7yvv0EXQ79zvZ
         Y1/hA4hUT/Wg/jdyovQRwwDqfRS/7o8jn5BLq01hMIZJFhppWQtiyps2FRYC8qGVf94e
         l00X8z/e//N/hwplJzleaicNBVw2TEpzRLosZSNc1zhyAkVKhYQCqGwfpA9s8Fe+Kmo8
         kCBK9mb2t4QxxCTgTl40HGy08jTT/39yt3kviFOLelgE7FF9aXc0iaBdrtB9GsDhPBLv
         7Mng==
X-Gm-Message-State: AOAM531Mo3faTCFUH97xPg3jjQAt1tY7IzxaI3hppgKfTw+iaIP8wyrb
        nYvRUfBXZZzbqbtmHj6CGsBylGrHSTMrVA==
X-Google-Smtp-Source: ABdhPJx2DfS9bYx7Fu/fpbSrjDBlTDv4IxMusvktM3Bls0i/NIYx9AUAK4UQ1fmnDrQv9Jnvj3pIsw==
X-Received: by 2002:adf:9d81:: with SMTP id p1mr8165021wre.13.1603557321197;
        Sat, 24 Oct 2020 09:35:21 -0700 (PDT)
Received: from localhost.localdomain ([84.238.208.204])
        by smtp.gmail.com with ESMTPSA id z6sm13126202wrm.33.2020.10.24.09.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 09:35:20 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: venc: Fix default capture format
Date:   Sat, 24 Oct 2020 19:35:09 +0300
Message-Id: <20201024163509.22246-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The default codec after driver open is set to be H264 but the
instance format for capture is wrongly set to H263. Correct this
to H264.

For regular applications this is not a big issue because they set
the format through S_FMT but for example v4l2-complience does not.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/venc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 178e034769e8..4aedde172c83 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1029,7 +1029,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 
 static void venc_inst_init(struct venus_inst *inst)
 {
-	inst->fmt_cap = &venc_formats[2];
+	inst->fmt_cap = &venc_formats[3];
 	inst->fmt_out = &venc_formats[0];
 	inst->width = 1280;
 	inst->height = ALIGN(720, 32);
-- 
2.17.1

