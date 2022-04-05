Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A54594F4C0A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 03:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1575556AbiDEXIO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 19:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443772AbiDEPkR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 11:40:17 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6623D6D95F
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 06:59:27 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id k14so11133600pga.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 06:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E+SQkI8tVlI4jEqDsrvXcRJCPOkCJbjsifs7DqmFPQU=;
        b=F1th3g0JNq7sNSNfOm0ALiRYeuYZM2iXOmWzzZJL+8GNoC4jx3HDXMgv+cj5iYZlMo
         H/7Vti5RLX2H/SZEO1xcjNqYUiBJ4ZFzAXNDX5+cmapCQVVJZ/tw9dqf99Tvm2dfkPFI
         oI5Y3NhvX3hHF11OtPMa1zhFIV2vwQLsnPhzC7Bsh2R+59S66USau1r0ipKudYrCS1dI
         sWdqXhKfJvoGlmPFFKM3+dejVKIqmKp8DrIiH1DEggkRELlYVL2U9jqmH1+J29rHGoOk
         lGvveewF/wHrHHvPGp3j+caIeriGg3q7SWo8YFiNz2/KR+rh27E9hDMVRv1Mp1j/v3l5
         E3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E+SQkI8tVlI4jEqDsrvXcRJCPOkCJbjsifs7DqmFPQU=;
        b=yKeP12LVwO5U2Hh0wjIPsxYiZ0tWqi8vlbqXKZq7F+3eFLOi5axnKVMUF4xKx63GSq
         wCfsjEgZ7S4Sgbs2XyWf8YhbVcTQMfMAdOmy3TZ9YL4YXbTd+5wo91GcGZdxhCV+T4oH
         dZPKcatIEJibJFg2My/33wbfl88k75ibb0QST30a0Dn8CVqDQRQ3KCeKYY8VyQv9ySTE
         gm8gx5TrLXCJJV7ILDyxayd+JGHVWAXa1MuwLKF51URoU8+k/iYJ7s8dKWFYBM92HCC8
         ciVvYMyqoD63PMk2vaCC5WEolmJNTfh9MdKfpm3lJ39FIk0Y99JWK7DmmTF6lOt2khZl
         FfCw==
X-Gm-Message-State: AOAM532zWJlvA3/T1Ln7VJfrg2q6sb03M49gC1zJSMJVhhgCxB+z3+xL
        VHnApNzhQ8Bjh0uS0b3el8Hn
X-Google-Smtp-Source: ABdhPJyDpYxf/V8Kk/gaKC49XkK63Vb4EcJoGHtj0kKmpW/eoGeklX0IKjacsqaCE818+pL8lMiBMw==
X-Received: by 2002:a63:ea51:0:b0:380:7c35:188e with SMTP id l17-20020a63ea51000000b003807c35188emr2990713pgk.607.1649167166725;
        Tue, 05 Apr 2022 06:59:26 -0700 (PDT)
Received: from localhost.localdomain ([59.92.98.98])
        by smtp.gmail.com with ESMTPSA id u14-20020a056a00124e00b004fab8f3245fsm16785402pfi.149.2022.04.05.06.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 06:59:26 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        elder@linaro.org, mhi@lists.linux.dev, quic_hemantk@quicinc.com,
        quic_bbhatt@quicinc.com, quic_jhugo@quicinc.com,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 16/18] bus: mhi: ep: Add support for queueing SKBs to the host
Date:   Tue,  5 Apr 2022 19:27:52 +0530
Message-Id: <20220405135754.6622-17-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405135754.6622-1-manivannan.sadhasivam@linaro.org>
References: <20220405135754.6622-1-manivannan.sadhasivam@linaro.org>
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

Add support for queueing SKBs to the host over the transfer ring of the
relevant channel. The mhi_ep_queue_skb() API will be used by the client
networking drivers to queue the SKBs to the host over MHI bus.

The host will add ring elements to the transfer ring periodically for
the device and the device will write SKBs to the ring elements. If a
single SKB doesn't fit in a ring element (TRE), it will be placed in
multiple ring elements and the overflow event will be sent for all ring
elements except the last one. For the last ring element, the EOT event
will be sent indicating the packet boundary.

Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 82 +++++++++++++++++++++++++++++++++++++++
 include/linux/mhi_ep.h    |  9 +++++
 2 files changed, 91 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index e2ed10b4a9d2..660d1e9791d3 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -434,6 +434,88 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring, struct mhi_ring_elem
 	return 0;
 }
 
+/* TODO: Handle partially formed TDs */
+int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
+{
+	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_ep_chan *mhi_chan = mhi_dev->dl_chan;
+	struct device *dev = &mhi_chan->mhi_dev->dev;
+	struct mhi_ring_element *el;
+	u32 buf_left, read_offset;
+	struct mhi_ep_ring *ring;
+	enum mhi_ev_ccs code;
+	void *read_addr;
+	u64 write_addr;
+	size_t tr_len;
+	u32 tre_len;
+	int ret;
+
+	buf_left = skb->len;
+	ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
+
+	mutex_lock(&mhi_chan->lock);
+
+	do {
+		/* Don't process the transfer ring if the channel is not in RUNNING state */
+		if (mhi_chan->state != MHI_CH_STATE_RUNNING) {
+			dev_err(dev, "Channel not available\n");
+			ret = -ENODEV;
+			goto err_exit;
+		}
+
+		if (mhi_ep_queue_is_empty(mhi_dev, DMA_FROM_DEVICE)) {
+			dev_err(dev, "TRE not available!\n");
+			ret = -ENOSPC;
+			goto err_exit;
+		}
+
+		el = &ring->ring_cache[ring->rd_offset];
+		tre_len = MHI_TRE_DATA_GET_LEN(el);
+
+		tr_len = min(buf_left, tre_len);
+		read_offset = skb->len - buf_left;
+		read_addr = skb->data + read_offset;
+		write_addr = MHI_TRE_DATA_GET_PTR(el);
+
+		dev_dbg(dev, "Writing %zd bytes to channel (%u)\n", tr_len, ring->ch_id);
+		ret = mhi_cntrl->write_to_host(mhi_cntrl, read_addr, write_addr, tr_len);
+		if (ret < 0) {
+			dev_err(dev, "Error writing to the channel\n");
+			goto err_exit;
+		}
+
+		buf_left -= tr_len;
+		/*
+		 * For all TREs queued by the host for DL channel, only the EOT flag will be set.
+		 * If the packet doesn't fit into a single TRE, send the OVERFLOW event to
+		 * the host so that the host can adjust the packet boundary to next TREs. Else send
+		 * the EOT event to the host indicating the packet boundary.
+		 */
+		if (buf_left)
+			code = MHI_EV_CC_OVERFLOW;
+		else
+			code = MHI_EV_CC_EOT;
+
+		ret = mhi_ep_send_completion_event(mhi_cntrl, ring, el, tr_len, code);
+		if (ret) {
+			dev_err(dev, "Error sending transfer completion event\n");
+			goto err_exit;
+		}
+
+		mhi_ep_ring_inc_index(ring);
+	} while (buf_left);
+
+	mutex_unlock(&mhi_chan->lock);
+
+	return 0;
+
+err_exit:
+	mutex_unlock(&mhi_chan->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mhi_ep_queue_skb);
+
 static int mhi_ep_cache_host_cfg(struct mhi_ep_cntrl *mhi_cntrl)
 {
 	size_t cmd_ctx_host_size, ch_ctx_host_size, ev_ctx_host_size;
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index eecc8f35d630..478aece17046 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -265,4 +265,13 @@ void mhi_ep_power_down(struct mhi_ep_cntrl *mhi_cntrl);
  */
 bool mhi_ep_queue_is_empty(struct mhi_ep_device *mhi_dev, enum dma_data_direction dir);
 
+/**
+ * mhi_ep_queue_skb - Send SKBs to host over MHI Endpoint
+ * @mhi_dev: Device associated with the DL channel
+ * @skb: SKBs to be queued
+ *
+ * Return: 0 if the SKBs has been sent successfully, a negative error code otherwise.
+ */
+int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb);
+
 #endif
-- 
2.25.1

