Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D2038CF8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 23:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhEUVCj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 17:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbhEUVCi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 17:02:38 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E9EC0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 14:01:15 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id n6-20020a17090ac686b029015d2f7aeea8so7995637pjt.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 14:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aFKQWgvv/ZjeD7qEYhd0tK/1myw1mlPKy3VEp4LyRTQ=;
        b=XkFVDI7cTA/rvl2loxxjVQXOylrtUEj01BxcdLhC+fMn8kQQY2z94kujwhG2jROs+I
         qxStg5pXFxXPB292lbCpdnygE5sOff6igeyUgaFmBfSpHwgYh/vw11Wj0p9KBujwNgnA
         oIDxTtVrQJNN4F3xZ++zih4yqDuvTXxEnT1Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aFKQWgvv/ZjeD7qEYhd0tK/1myw1mlPKy3VEp4LyRTQ=;
        b=mPseIs6dAW5t9Ez5SsUgrDstQFdEamHraiTKzVFLHpnkCWAn/gbVqJXLdyy5YZ1dyv
         C0W45Mq6wSgekCvDeKu1/mEjQGZHMLar+VhPzb9R+STIzEmCrrpoM7ItZZtjyChDMrwQ
         LsV00lmaEKF6KmGMegN33XnQcDvgG49gsFL/0rl6dqj0iHrgKddqszDIsWcp3q0riJ03
         jq3Ku3yNCpcl25tWwYTvDalxaeCsCfjvE0v5B4oVDV/LArkP84Rp54h6DqfG97muT8B6
         Gcq5e4bLDEo8rI21mDXehY/UdCv8/mPEgec+75Om9NrVXbCXg1xbtQ+xYXPpFxmR/Bnx
         NxEQ==
X-Gm-Message-State: AOAM530GKizBlNmHdNOHozM3g2gfVshdU9mdTvUqba5gi0YPmhAhrOzS
        UOgQA9w6ZzPiD2u3RDqmJ0n5hw==
X-Google-Smtp-Source: ABdhPJx7MHEPo/jvOnAkibp5h9E7i2EaxlTt20C2REG1j2QmVWx9wPjsN+qM6uufy6UR2tGIjPPgRw==
X-Received: by 2002:a17:90a:d14f:: with SMTP id t15mr13209534pjw.160.1621630874693;
        Fri, 21 May 2021 14:01:14 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:10e9:a6cd:727f:561e])
        by smtp.gmail.com with ESMTPSA id o6sm5202532pfb.126.2021.05.21.14.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 14:01:14 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Joe Perches <joe@perches.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] nvmem: core: constify nvmem_cell_read_variable_common() return value
Date:   Fri, 21 May 2021 14:00:57 -0700
Message-Id: <20210521140031.1.Ibaca694aedfaff823feefa06b29ae746c641dd1a@changeid>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The caller doesn't modify the memory pointed to by the pointer so it
can be const.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/nvmem/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index f9c9c9859919..4868aa876e1b 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1609,9 +1609,9 @@ int nvmem_cell_read_u64(struct device *dev, const char *cell_id, u64 *val)
 }
 EXPORT_SYMBOL_GPL(nvmem_cell_read_u64);
 
-static void *nvmem_cell_read_variable_common(struct device *dev,
-					     const char *cell_id,
-					     size_t max_len, size_t *len)
+static const void *nvmem_cell_read_variable_common(struct device *dev,
+						   const char *cell_id,
+						   size_t max_len, size_t *len)
 {
 	struct nvmem_cell *cell;
 	int nbits;
@@ -1655,7 +1655,7 @@ int nvmem_cell_read_variable_le_u32(struct device *dev, const char *cell_id,
 				    u32 *val)
 {
 	size_t len;
-	u8 *buf;
+	const u8 *buf;
 	int i;
 
 	buf = nvmem_cell_read_variable_common(dev, cell_id, sizeof(*val), &len);
@@ -1686,7 +1686,7 @@ int nvmem_cell_read_variable_le_u64(struct device *dev, const char *cell_id,
 				    u64 *val)
 {
 	size_t len;
-	u8 *buf;
+	const u8 *buf;
 	int i;
 
 	buf = nvmem_cell_read_variable_common(dev, cell_id, sizeof(*val), &len);
-- 
2.31.1.818.g46aad6cb9e-goog

