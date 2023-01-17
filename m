Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE4266E088
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 15:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232528AbjAQO0V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 09:26:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231856AbjAQOZk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 09:25:40 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5226D3F2B9
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 06:24:17 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso4674012wms.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 06:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gmE2Ehr/ETvFjtSmedtCa2EspI42jlN+3OaC9EIlxrI=;
        b=m/2mZeDoUQa9RxRhTraFbL4K7uYMEmGKa6ch2sh/AE5087OOya8q2I98bbpmQetL0Z
         b6+AQCcUXN4arOZcK8w1e2Dpg/4lxRorP/I2putXq3ijsbCwik1R4PNilZ0DzLM1hpDN
         UbwNYeqOQsm5k0YE32yLMLejbd3FI9Oqz8tYcSoE9Oh36B7C+T5/vRiSBwodmk/EHr7u
         QEOW6vW14AFlsRpMWHTfJHBgFwxnUfX1uXjoF/G/YVtEMRIM16X4toNItz81kqWGSMx0
         4D2eP9buBPvtE/2aiaVS3RmUoo2C2NpPUs1cWHAKP73zpOYC08u4iG3UqcdZ/GXqCmpW
         8gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmE2Ehr/ETvFjtSmedtCa2EspI42jlN+3OaC9EIlxrI=;
        b=mmuNPg4KRNfJHbLRHdGF5k84Enn2TT4FZ4EaPv2v3EUkp++jM+fj6ZRpC7USJ3ahj9
         6tJMEwYR0l2qY/HCGyIrxjPBtOFMS67U1PZgg19IPROeiCXfZErLUoe7LjGv0khZLg7P
         0QvuZyMl7bhix5pFuvOwgjVubdlyb2pVjDJafAdgZ2ZZKHuXxElgqTZftAUBsOUNrLJ9
         DoUT4v+C6maIiV3IagwuNdqsCn5873APOBaZVIT6urvdHFT9fanh31XsfpppLb3oDNlR
         7sryfct+7tBhFRUSpqvF3PTExkZN6HBvZzyB+7RZ+jYO+3qfMjhL/qDV5e+ZcgEpSWqT
         Z1cg==
X-Gm-Message-State: AFqh2kolJ7d1xJj2ozFLidFkpfbcRu2OS3daEBPMZ3SDWV99pf8Xp1Fn
        plgMMh02c2vZSLi5eoivzH0NTg==
X-Google-Smtp-Source: AMrXdXvI6hcnugSXWgquVNhW7ZLFd7ovzW1ow0cFKelpOd1a5syfY/eyznHgFpd00wQX9qIrLlI1cQ==
X-Received: by 2002:a05:600c:3582:b0:3d9:ed39:8999 with SMTP id p2-20020a05600c358200b003d9ed398999mr3394963wmq.35.1673965455902;
        Tue, 17 Jan 2023 06:24:15 -0800 (PST)
Received: from lion.. (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c511300b003d9862ec435sm28103726wms.20.2023.01.17.06.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 06:24:15 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH] rpmsg: qcom: glink: support waking up on channel rx
Date:   Tue, 17 Jan 2023 14:24:13 +0000
Message-Id: <20230117142414.983946-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Configure all channels as wakeup capable and report a wakeup event
when data is received.

This allows userspace to "subscribe" to a particular channel where
it is useful to wake up to process new data. The expected usecase
is to allow for handling incoming SMS or phone calls where the only
notification mechanism is via QRTR on the IPCRTR glink channel.

As this behaviour is likely undesirable for most users, this patch
doesn't enable a wakeup_source for any channels by default.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/rpmsg/qcom_glink_native.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 115c0a1eddb1..1a96a7ae23bb 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -914,6 +914,9 @@ static int qcom_glink_rx_data(struct qcom_glink *glink, size_t avail)
 		channel->buf = NULL;
 
 		qcom_glink_rx_done(glink, channel, intent);
+
+		pm_wakeup_ws_event(channel->ept.rpdev->dev.power.wakeup, 0,
+				   true);
 	}
 
 advance_rx:
@@ -1510,6 +1513,17 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
 		if (ret)
 			goto rcid_remove;
 
+		/*
+		 * Declare all channels as wakeup capable, but don't enable
+		 * waking up by default.
+		 *
+		 * Userspace may wish to be woken up for incoming messages on a
+		 * specific channel, for example to handle incoming calls or SMS
+		 * messages on the IPCRTR channel. This can be done be enabling
+		 * the wakeup source via sysfs.
+		 */
+		device_set_wakeup_capable(&rpdev->dev, true);
+
 		channel->rpdev = rpdev;
 	}
 
-- 
2.39.0

