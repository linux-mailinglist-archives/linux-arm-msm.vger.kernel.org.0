Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93AE24AA072
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 20:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234888AbiBDTvB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 14:51:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234871AbiBDTu6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 14:50:58 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81DAEC06174A
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 11:50:52 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id w5so5771902ilo.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 11:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2OpxrECw+JfiUzuzU5c0ZHXTX3WGTRoSTdmnh1YRIC8=;
        b=HppWBMMgS9Yme1jfcB/7ZwVahRJawVt1l8kj+tAf6MHiFKWQLzPebfNIpBW1eLCh/I
         shmD14+oZJYKJDKicVkCJCOW+R6SF0xPMVjTOIBt50C80pG4Y8Lqfc3duSKDBGuM5SWq
         JuC0MchZwF+7UpnJ+NYgptOXolGO8zQHw1Y+g+q0VSQUVB8jCPbolUMs1CnlfH+fBhXx
         Gzel8bnxvP2WEpKa43bgrha85b7g6Y6wTgkSZawdudjgESRArf6wTLQSls/mxe/gx879
         ggL4AEF0TkMBWgYlIA4x8YdSFP8bQMnC9jq8u3bK8h8BC+FEqMka9cPIN60o1pQp7fqL
         Z+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2OpxrECw+JfiUzuzU5c0ZHXTX3WGTRoSTdmnh1YRIC8=;
        b=Nx6m2FBQUfGMohLlAbi53nJU+bF/8FikSnrK0w+iJXK5lBWr077ObPzWxt4REZxqas
         PCqotmcSSP3fVHal76b8BQSyQW7OqNVA8CeBSu75sq2+yiMswI3MTJsjcVdLCgfPf4+c
         M8k2UPvgS4ifr21ro/M1dEGa0ONV9OHqfZi2ezb4hoX1oRyPmVZ8jrwXzb+jysqGV1ij
         IhrjFIkqPaDnsyt0qsFpdsx1nbVDAsDg+SuUw9fxv0JlVi6pdXpO0IL7//DUQUeX2QF3
         bE62eG8arEAB7B8PbQzcKOefCEAqm3UcgeFQmczCnP2IIkcuHcjON1jOVom5HCHNHlGV
         ziog==
X-Gm-Message-State: AOAM531wXUk8ReIwmGp/NEcYc8m5uf7a1t8gKEWGr1p2KpLvdeAhaYGW
        DKyKqx2tXm3+V1ATw4L4xmpI8g==
X-Google-Smtp-Source: ABdhPJy0fJauEzAvOAJjzaHIbr3Jkbg0HH/4xt5CZ+WZplszz/0rFrRA056xs6blwDbe9VWyIQ/uHw==
X-Received: by 2002:a05:6e02:b41:: with SMTP id f1mr376396ilu.193.1644004251799;
        Fri, 04 Feb 2022 11:50:51 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id k13sm1417564ili.22.2022.02.04.11.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 11:50:51 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     djakov@kernel.org, bjorn.andersson@linaro.org, mka@chromium.org,
        evgreen@chromium.org, cpratapa@codeaurora.org,
        avuyyuru@codeaurora.org, jponduru@codeaurora.org,
        subashab@codeaurora.org, elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/7] net: ipa: use icc_enable() and icc_disable()
Date:   Fri,  4 Feb 2022 13:50:39 -0600
Message-Id: <20220204195044.1082026-3-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220204195044.1082026-1-elder@linaro.org>
References: <20220204195044.1082026-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The interconnect framework now provides the ability to enable and
disable interconnects without having to change their recorded
"enabled" bandwidth value.  Use this mechanism, rather than setting
the bandwidth values to zero and non-zero respectively to disable
and enable the IPA interconnects.

Disable each interconnect before setting its "enabled" average and
peak bandwidth values.  Thereafter, enable and disable interconnects
when required rather than setting their bandwidths.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_power.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ipa/ipa_power.c b/drivers/net/ipa/ipa_power.c
index 28be0e45cccfd..ec2ebc74edb8b 100644
--- a/drivers/net/ipa/ipa_power.c
+++ b/drivers/net/ipa/ipa_power.c
@@ -75,17 +75,29 @@ static int ipa_interconnect_init_one(struct device *dev,
 				     const struct ipa_interconnect_data *data)
 {
 	struct icc_path *path;
+	int ret;
 
 	path = of_icc_get(dev, data->name);
 	if (IS_ERR(path)) {
-		int ret = PTR_ERR(path);
-
+		ret = PTR_ERR(path);
 		dev_err_probe(dev, ret, "error getting %s interconnect\n",
 			      data->name);
 
 		return ret;
 	}
 
+	/* All interconnects are initially disabled */
+	(void)icc_disable(path);
+
+	/* Set the bandwidth values to be used when enabled */
+	ret = icc_set_bw(path, data->average_bandwidth, data->peak_bandwidth);
+	if (ret) {
+		dev_err(dev, "error %d setting %s interconnect bandwidths\n",
+			ret, data->name);
+
+		return ret;
+	}
+
 	interconnect->path = path;
 	interconnect->name = data->name;
 	interconnect->avg_bw = data->average_bandwidth;
@@ -154,9 +166,7 @@ static int ipa_interconnect_enable(struct ipa *ipa)
 
 	interconnect = power->interconnect;
 	for (i = 0; i < power->interconnect_count; i++) {
-		ret = icc_set_bw(interconnect->path,
-				 interconnect->avg_bw,
-				 interconnect->peak_bw);
+		ret = icc_enable(interconnect->path);
 		if (ret) {
 			dev_err(&ipa->pdev->dev,
 				"error %d enabling %s interconnect\n",
@@ -170,7 +180,7 @@ static int ipa_interconnect_enable(struct ipa *ipa)
 
 out_unwind:
 	while (interconnect-- > power->interconnect)
-		(void)icc_set_bw(interconnect->path, 0, 0);
+		(void)icc_disable(interconnect->path);
 
 	return ret;
 }
@@ -189,7 +199,7 @@ static int ipa_interconnect_disable(struct ipa *ipa)
 	interconnect = power->interconnect + count;
 	while (count--) {
 		interconnect--;
-		ret = icc_set_bw(interconnect->path, 0, 0);
+		ret = icc_disable(interconnect->path);
 		if (ret) {
 			dev_err(dev, "error %d disabling %s interconnect\n",
 				ret, interconnect->name);
-- 
2.32.0

