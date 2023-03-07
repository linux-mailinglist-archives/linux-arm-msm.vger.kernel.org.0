Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38C2C6AD863
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 08:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbjCGHnB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 02:43:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjCGHnA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 02:43:00 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C03C646
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 23:42:59 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id cp12so7469382pfb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 23:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678174978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NCVxab7eeIvoCYFhseZDKzvVXTy0q475R4rKd4ZTd+o=;
        b=xN+dBpAHLyfdr+jLD2boIzn+4DBUS/ZfK7oEQdn63WdI7ELYxRNzjdz9/yadb61cyk
         w/PIWOcAqfyWRRAvN1rYSy+QHMB1fNYXYG+QwXz1Lt+rEtPSI8GPyFrNR382kWjqjlyu
         x0Gs7kS2R/fuHD1j7Np1krpQHMfE+Obz24bha/X6TGlSPLwPtq7hp2pacR8VdRvciuK9
         auJfWnqtJfrgwlkBGo6BOtA4xUfBRPErvQViuxYtUwvqMIFmjyZDcWBAQxt1QXDeHi0F
         mCZtBTDv7dhEzSBVn6/fZAIVc4Cve3Q0p322uUNuQuHlqqVXNuoOtoSTh/UiNL5pL/tL
         aXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678174978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCVxab7eeIvoCYFhseZDKzvVXTy0q475R4rKd4ZTd+o=;
        b=FJiI6mXidf1Icczgi6A+H9oJyOQfEaVjRsc+nVmbiEWSdYir1HI06m9YoyAiKTDKk+
         TkBnsOFPOU56MsSYpfZY1qwnXLrLMVH1GajsJ4coN0WRgOLeAb52QHLMKv4+5XujEYVX
         enqpzmbY0/eKuOVVhRgiESWwabLUbgXx9y7hJtofwBrmpoKrHHqfxQiWTGe0scZCq062
         Syt2JGrvR+iJ0SuEXRze0xdld/LG3bL8YwDDvRnNZQSA4hvJdHQ+fYIo/JPj2s6jCdnp
         D9WnP1h4UbSbDQE9GfysdWYJ5IsjlLtcYSG9QsEHu82cNTRnSvdgNUeuqk9GxMvtU3eB
         zWkg==
X-Gm-Message-State: AO0yUKXxZlwqN/aXOZPaObZ6AXm9/5C7D0aPjG5heQ2321lq1oaEc9gK
        jWRoLBCqkr6X3oY5QKK1kv3tbOakQO0w1K1g2Q==
X-Google-Smtp-Source: AK7set9AQJg3JWQ2XDlVhjMlGGNAUyGIS+uIongGWw84/OEZkeE2PhD9LarXt5uNqvHDVeNfePLBKg==
X-Received: by 2002:aa7:9497:0:b0:593:c9b6:dc5d with SMTP id z23-20020aa79497000000b00593c9b6dc5dmr10445797pfk.0.1678174978413;
        Mon, 06 Mar 2023 23:42:58 -0800 (PST)
Received: from localhost.localdomain ([59.97.52.140])
        by smtp.gmail.com with ESMTPSA id d23-20020aa78697000000b005afda149679sm7535567pfo.179.2023.03.06.23.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 23:42:58 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] bus: mhi: ep: Demote unsupported channel error log to debug
Date:   Tue,  7 Mar 2023 13:12:48 +0530
Message-Id: <20230307074248.86731-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Not all MHI endpoints will support all available channels. Most of them
support only a selected number of channels based on the implementations.
In those cases, it is not needed to print error messages in the endpoint.
So let's demote the error log to debug.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 48bc6abb7b37..ba062df4fe25 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -126,7 +126,7 @@ static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_ele
 
 	/* Check if the channel is supported by the controller */
 	if ((ch_id >= mhi_cntrl->max_chan) || !mhi_cntrl->mhi_chan[ch_id].name) {
-		dev_err(dev, "Channel (%u) not supported!\n", ch_id);
+		dev_dbg(dev, "Channel (%u) not supported!\n", ch_id);
 		return -ENODEV;
 	}
 
@@ -702,7 +702,7 @@ static void mhi_ep_cmd_ring_worker(struct work_struct *work)
 		el = &ring->ring_cache[ring->rd_offset];
 
 		ret = mhi_ep_process_cmd_ring(ring, el);
-		if (ret)
+		if (ret && ret != -ENODEV)
 			dev_err(dev, "Error processing cmd ring element: %zu\n", ring->rd_offset);
 
 		mhi_ep_ring_inc_index(ring);
-- 
2.25.1

