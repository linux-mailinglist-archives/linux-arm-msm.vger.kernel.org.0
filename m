Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2654B30D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 23:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiBKWkQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 17:40:16 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346949AbiBKWkN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 17:40:13 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B49D63
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 14:40:11 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bu29so13990372lfb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 14:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A8ctvX5zLKvSPusbxBXHP85Dtil9Pv7DuZ+PpnlfzHc=;
        b=QObfsafJ4EWjse6VV3bqb1uHiZBP6amKZbxvvjbIOlPJ/J+NAmh2xeY7cjkwbN4HmV
         kx5r+NO8p9TPow6xwADjImn0CnGaDXEqQYEaCI0lhrOEvsub7dTkUgy4KFfhUJymo7RH
         o2nl/LNJqSEcwIYoom14Srv5mHwd8OIgarz3lN0RGoUFWG876V7YTv9rJFsnNpuYMt/4
         o7DpaoSbzbrRiUFK60QECAKO2wja0Eq24yYVB25HKIRykLkjQeznFgOJNk0lW0joMfeG
         1oWCBu+o2KYPe+oIPmtduDKh9AoHKWhDXqgjQgsHv/ePg2JmaJOQIFbpXLwOETiEoAEV
         VLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A8ctvX5zLKvSPusbxBXHP85Dtil9Pv7DuZ+PpnlfzHc=;
        b=bvbywvS49XDaNEQdy81CZiliG3LqATtHcetPDWya6sCfftmpgPoMXzwwzUveLckAK5
         a7LFnnWBFd1NUmAlCWzvGVoHBSBYJ1RjcEtVyETHUdMX2lfoUeV7J//V1uXymqwHIfUx
         yOZvu8tYEWb4LgvdiJKMC71u3n6SGyVMMzcHd7syxQWv4pXEGaMWeuNBaVpkSmOwHR3b
         1F9cORgkBwBeOcKDEglq+B0d9H8qB5ejVMVvjBlVshQ5M22qxllAoKtfG7AYRocajMRk
         QeGqkuVNhgb7pjjnZlq4zZSzw62OpIcww117c0PfsthKOV6csiCp1YEBBQ9P/nCTNyh4
         yDuQ==
X-Gm-Message-State: AOAM5318CdsoovgaRQUfNoGnrKCJ/CHO7T6UhHutvCu7+06T7XrotAX7
        SwT39BFz2p16xAtE7hYJUphW1g==
X-Google-Smtp-Source: ABdhPJxvqS6RjfOowra5TYzzwwv/HVceArtYgxJUEYM2mDzk1UDJMrVcSrQWKi6bjb0IzwRNNx0KJQ==
X-Received: by 2002:a05:6512:398d:: with SMTP id j13mr2623942lfu.251.1644619209897;
        Fri, 11 Feb 2022 14:40:09 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a6sm3319983ljb.93.2022.02.11.14.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 14:40:09 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC PATCH v2 3/5] drm/msm/dp: support finding next bridge even for DP interfaces
Date:   Sat, 12 Feb 2022 01:40:04 +0300
Message-Id: <20220211224006.1797846-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It is possible to supply display-connector (bridge) to the DP interface,
add support for parsing it too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_parser.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 901d7967370f..1056b8d5755b 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -301,17 +301,22 @@ static int dp_parser_parse(struct dp_parser *parser, int connector_type)
 		return rc;
 
 	/*
-	 * Currently we support external bridges only for eDP connectors.
+	 * External bridges are mandatory for eDP interfaces: one has to
+	 * provide at least an eDP panel (which gets wrapped into panel-bridge).
 	 *
-	 * No external bridges are expected for the DisplayPort connector,
-	 * it is physically present in a form of a DP or USB-C connector.
+	 * For DisplayPort interfaces external bridges are optional, so
+	 * silently ignore an error if one is not present (-ENODEV).
 	 */
-	if (connector_type == DRM_MODE_CONNECTOR_eDP) {
-		rc = dp_parser_find_next_bridge(parser);
-		if (rc) {
-			DRM_ERROR("DP: failed to find next bridge\n");
+	rc = dp_parser_find_next_bridge(parser);
+	if (rc == -ENODEV) {
+		if (connector_type == DRM_MODE_CONNECTOR_eDP) {
+			DRM_ERROR("eDP: next bridge is not present\n");
 			return rc;
 		}
+	} else if (rc) {
+		if (rc != -EPROBE_DEFER)
+			DRM_ERROR("DP: error parsing next bridge: %d\n", rc);
+		return rc;
 	}
 
 	/* Map the corresponding regulator information according to
-- 
2.34.1

