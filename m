Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9EA277F949
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Aug 2023 16:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352006AbjHQOiq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Aug 2023 10:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352039AbjHQOi2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Aug 2023 10:38:28 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF1CB2D73
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 07:38:25 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31768ce2e81so6855027f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 07:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692283104; x=1692887904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0Y9xd+Pad6+mtTQhoMXOE7QF4dtRzmv/Ky6w4Tfu3A=;
        b=wQKCHH6TcxUywK3COwOCBs8jAfRIwibpQvQ+OpFGsBhXvkkSpLemEQeURKg/1HYXmh
         x/Q4hyJSl+cxZTz4OgMmyNnP3rX/N8rqwfq8AXVakMt32Igim9oBJ5cWE/5RQXH6gsoe
         CKCKrvuXvGwXnGqRiFcEQ+pGSAxkZ1xbnGlt0tJH3uf1Mm7rzIXSDiXUD6jB/vvpQS8o
         Z0v5+AwuYQv1JOEzAR6gtOsOqI0XdaqtKnEPpEFKCfVttkl0eIZLreJgXyWmmhnBeLw4
         BOQxj1HzZ9pL+j8yO7X4rgX9p7UDoiPFmZmnMsiucP4Iy3mMVQzPlD5dblznzITcYACD
         hF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692283104; x=1692887904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0Y9xd+Pad6+mtTQhoMXOE7QF4dtRzmv/Ky6w4Tfu3A=;
        b=bEXi89M+tMwyR6yZ7mwDX1TvYIcXs/L3eBPjdyP+SLNyVd7ElG+1rEAUV8Wnr+CVzh
         dJCKCu8UpGo2j1mnXHBAVcKve99QiJDohJm+sqlUYqX0PYOQwx9H6tYjs48OoKR8hk3p
         H+fQ7dgpL3htW3yRuBSuOI06pPk2V1h3MKD4HvphBDLbFs24m092bg/eU8O1wnhMchHO
         hIdRoe/53aUDdkAvrWb/Fi6BYiKdoAqWqxHJwTOb/dB5aG1kMGgdD/+ppjHOyKVNvMgf
         mavMTUGeGHjl1KVC/9lh1Dto4cz4ZgBdkIAE07v7eFVImES29YxEhGPUjeCvIzqxJP56
         AlDA==
X-Gm-Message-State: AOJu0YyqLiOzRizyL4OTyW6CSmhRcDhUGKJr/fsJ+y+occcvwVIz6AIR
        W2NxFPWmV5EycrqpNZhnst8xpQ==
X-Google-Smtp-Source: AGHT+IEq4/W43gau+StdJCzkcA/Y/rJQMWKin+55+Qo60Xh1qP6chCciA/Wfc8w4Lqoe3kBwB4yNPg==
X-Received: by 2002:a5d:4566:0:b0:317:58a8:baa with SMTP id a6-20020a5d4566000000b0031758a80baamr4331939wrc.28.1692283104543;
        Thu, 17 Aug 2023 07:38:24 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id i8-20020a5d4388000000b0030647449730sm25218232wrq.74.2023.08.17.07.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:38:23 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/13] media: qcom: camss: Use >= CAMSS_SDM845 for vfe_get/vfe_put
Date:   Thu, 17 Aug 2023 15:38:06 +0100
Message-ID: <20230817143812.677554-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817143812.677554-1-bryan.odonoghue@linaro.org>
References: <20230817143812.677554-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From sdm845 onwards we need to ensure the VFE is powered on prior to
switching on the CSID.

Alternatively we could model up the GDSCs and clocks the CSID needs
without the VFE but, there's a real question of the legitimacy of such a
use-case.

For now drawing a line at sdm845 and switching on the associated VFEs is
a perfectly valid thing to do.

Rather than continually extend out this clause for at least two new SoCs
with this same model - making the vfe_get/vfe_put path start to look
like spaghetti we can simply test for >= sdm845 here.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 08991b070bd61..7ff450039ec3f 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -163,7 +163,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	int ret = 0;
 
 	if (on) {
-		if (version == CAMSS_8250 || version == CAMSS_845) {
+		if (version >= CAMSS_845) {
 			ret = vfe_get(vfe);
 			if (ret < 0)
 				return ret;
@@ -217,7 +217,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		regulator_bulk_disable(csid->num_supplies,
 				       csid->supplies);
 		pm_runtime_put_sync(dev);
-		if (version == CAMSS_8250 || version == CAMSS_845)
+		if (version >= CAMSS_845)
 			vfe_put(vfe);
 	}
 
-- 
2.41.0

