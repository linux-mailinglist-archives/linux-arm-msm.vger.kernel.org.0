Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE893B6BAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 02:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbhF2A0P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Jun 2021 20:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232100AbhF2A0P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Jun 2021 20:26:15 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB33C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 17:23:48 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id o6so9577237oic.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 17:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R/6nR4UW4kPU6Pum9dl3DddSZeMlmk/JUVE50CblSMc=;
        b=Kc0cb9xCHAM3DWJg6MEv4rNVluBteWNjCoQa9PoewQdlXNPMLB9SrAGQUOO10D1Z+7
         sbEaU5+tom7zfGhk7ipRliodb5MrU4q2YfzFxmgCyuMBzYinUrFkregE00INk666MLzI
         pikrsnv3cF3DVNSJg+z2bCbGTSYNNO1NNdEeWSozcGiYzKLoAjEZeZFOfFkjgpIXzRQv
         N+6vCHCgoHrssbxnHQECzu1VdE0a8o9npTDbpbZDPOXJSZXjpw5e9SKBH2x6MKChK1dc
         DnO/IA54Js7KGGgPgZqKhxNLtdyHbBgR+s9kKuQoNIXCKwi1sB6M2kLU1YhytUvyaZR/
         fr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R/6nR4UW4kPU6Pum9dl3DddSZeMlmk/JUVE50CblSMc=;
        b=hD5EH1A35cOzdNWnIRqyKMsafXa86Mm5l81oxYjQW/dolMFgajVbul7kktWfzjbVcd
         ZkWoELw4cIJgWXyrU4J3wgoUEQdLsCzk9OQ43ilZx+fL7bjbxzPrC6uPFSWOODDMxMQM
         Agrh2k0Ja51KPTl7ojV4iK3h6dodk1NEyBnkccox1pZIPdLqYtEFl7HhEKOxPGUglNeA
         hvkVYISTjIFcx6tCKkly2rs4OTJFdtE1mh7UyRviBIaoj7DmUQOv01D0Le9PGay9WzCO
         DNn1HwWhRXIho5uKy/zI6ZsO2ypGhSq3gVVIsPVpt0hyKgBAVzrElV+WaZRqOC1fyZdB
         iagQ==
X-Gm-Message-State: AOAM530d8B92PZqIICuVjUHJscHNpLtDJ58gsh3+SQr3LN8Zn5/FFddZ
        aXnrTz7yEJ6VY5ai4znny+OlYg==
X-Google-Smtp-Source: ABdhPJwR+e2m+qyRi/h5qg5s6o66E6B7NlowbEmn0tGDJxb9ItlFX5cK0ayhCbUJj9qo2FX0VTw4vg==
X-Received: by 2002:aca:1910:: with SMTP id l16mr7959451oii.12.1624926227351;
        Mon, 28 Jun 2021 17:23:47 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k14sm1980801oon.5.2021.06.28.17.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 17:23:47 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: Make it possible to enable the test pattern
Date:   Mon, 28 Jun 2021 17:22:34 -0700
Message-Id: <20210629002234.1787149-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The debugfs interface contains the knobs to make the DisplayPort
controller output a test pattern, unfortunately there's nothing
currently that actually enables the defined test pattern.

Fixes: de3ee25473ba ("drm/msm/dp: add debugfs nodes for video pattern tests")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 2f6247e80e9d..82911af44905 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -305,6 +305,8 @@ static ssize_t dp_test_active_write(struct file *file,
 				debug->panel->video_test = true;
 			else
 				debug->panel->video_test = false;
+
+			dp_panel_tpg_config(debug->panel, debug->panel->video_test);
 		}
 	}
 	drm_connector_list_iter_end(&conn_iter);
-- 
2.29.2

