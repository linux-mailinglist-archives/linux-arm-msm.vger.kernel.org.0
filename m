Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23BDF77BE03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 18:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231951AbjHNQ3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 12:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232343AbjHNQ30 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 12:29:26 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C33810F7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 09:29:21 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fe8a1591c8so30376085e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 09:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692030560; x=1692635360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0Y9xd+Pad6+mtTQhoMXOE7QF4dtRzmv/Ky6w4Tfu3A=;
        b=jcHeJqpTHaa6sOPZN0B/bgiU1pVAhgIS0sWLkx/+WW3fpOFpX6/b8kAA+1DMWi7cHc
         6W6iUuYogF3DzpmoFFEhFIVXjfRapiwMwCurdYBI0Q1wnur0cPaS57BQwjb/KTqidFWr
         xw/nQtTx9P6bQ/+RUgWTcwXF492ggV7slX7Tkp95p6/avkdAtH/oi9xnp91vwnhvIchX
         mEhcgaJRvydBGCmZL7J1hWG/kQ1uU7o4lc3eH+GpxW/2LXKHZa0zs+fB26YfH0jlJPtq
         VuwJw+Gs9XuhNSMBwGav61dIaOc9V/SjgZgl8472prOX1K+S6/6bRAgJo4FX4lBqopt0
         l27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692030560; x=1692635360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0Y9xd+Pad6+mtTQhoMXOE7QF4dtRzmv/Ky6w4Tfu3A=;
        b=Ad1Dvm5CGqkMjvJU0a96L+eTH07eGeZpbgCotmXjZwdTPbU3IR5n+orJeHVlhqMRPY
         QYX1/RNHiBC4FtgLyNNZH9ma5/0YJvYywBkfro+0M7MFtfUofGXLOyDBabfDn8VzQ+2e
         sT8zA4SerqaKG43vVFTLs12N5VK4L/ZbkziVYHlHMneSMHsAfUiqpxVrn0Xp3VfvPVSM
         TbkOVK3+M0C5LSOMu9+SQmIJIh73JGkLPAyZFQCz+F6yIPwl+CMNJ2g+RQbaI8it+J+H
         GPFWiHIR8UAS9ol5A4SGJ5a31FFmgyMQ5N7y7vA/IOsYtmrMzkChnZ5hyYEhuxw+gc0G
         iNNA==
X-Gm-Message-State: AOJu0YwTUNe9605DxHP31OrknOelW4H44T/JuO6MhFThFmTX5SD0GiDO
        N9NE83cxAcwhoyrWYEmug3gXiw==
X-Google-Smtp-Source: AGHT+IFmNxP4PMd54ORLEGjLC5rzB0JQHD2qfdWJS7CAKjyQ8vJ2xt4U08lqG9KdrB4cWk/w13gA3A==
X-Received: by 2002:a05:600c:155:b0:3fc:25:ced6 with SMTP id w21-20020a05600c015500b003fc0025ced6mr9364507wmm.13.1692030559963;
        Mon, 14 Aug 2023 09:29:19 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l14-20020a1c790e000000b003fc16ee2864sm14743475wme.48.2023.08.14.09.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 09:29:19 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 08/14] media: qcom: camss: Use >= CAMSS_SDM845 for vfe_get/vfe_put
Date:   Mon, 14 Aug 2023 17:29:01 +0100
Message-ID: <20230814162907.3878421-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814162907.3878421-1-bryan.odonoghue@linaro.org>
References: <20230814162907.3878421-1-bryan.odonoghue@linaro.org>
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

