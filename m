Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0B034C6D0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 13:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236849AbiB1MrS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 07:47:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236796AbiB1MrA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 07:47:00 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ECA84BFE1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:46:01 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id t5so1992770pfg.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cdY8ebW46Eg2Uu7gUrvw5885hZGTnaEinwVDglEao2Y=;
        b=P1/zByji5YWV1+kZsgzHTWj0JBDLVEhw5bt0I/jL3oKqpa96BEBq87nvqFL5k8C2QT
         YJWDCazQoWowB7mqAjrqGCRUEQT0uC+Y+UCxMSHM/rLbt9obCt0ZLijBANbRVuGLWFYy
         ZQCHjTlnuvdNsM4qjDES3YNR9pIAOGQU1wy7bsNLFp9PtqQuKN4CokQil86vNqJQ/SPw
         yIjPtYHf4kfDlIJBXTHDpamnVG2QFjbIVYHKwq3gIiC+NUY35W2JQnUvjU3260aP5Gnl
         5x66QCsbQg1XD4xnqN5F0zvhSP2oL4Kpx4OwO7rSeab8hMugc6Irv5p9t0VZ+UDF6n+o
         hlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cdY8ebW46Eg2Uu7gUrvw5885hZGTnaEinwVDglEao2Y=;
        b=DErQyBxy4xO0/Z7KxdME/3FXah+1BZU5oPnIpTuVYwH52GcGBLyU6Ove9zWQr+6w3R
         IIrNGnCnJ1jqvkszfkDe5jm4v3yOSyNzYyp0tTQ1W7PIYLBrBAueOjr6uHBOl8vEJLDh
         6L4y9JR5O09gMmainjGHoiXNP99vzFlr0d8M0seZ6oXD8ZzKITqwrPpcCUx9y2FhXyl3
         0StX8gdQ0stQwefkN8lrtH0uKldZpVGGPEpy5FRw00ADLrltOtiOMOkddz1parb2nOgZ
         KQ05WGFDZElatpTKiPjQxo8pTIO8Ww/QTWzRZaj89Zhs4jRLC/KSxfv7tBQkKAL0jcmu
         O3rw==
X-Gm-Message-State: AOAM530QjcYW0sGvig/e6GyjmZdSbgdOMkar79UN/AysdWmtCkav9DDo
        JC2bpEucmL64RRk6dqajOBSK
X-Google-Smtp-Source: ABdhPJwOw5sGNZgPsQfg6sD6KkzfLrZcGQr0LHx5hJMN5GXvEO4W0oGHIXy1zc70ey4PsiIF+Jo/Fw==
X-Received: by 2002:a63:d23:0:b0:364:f37b:947d with SMTP id c35-20020a630d23000000b00364f37b947dmr17131138pgl.263.1646052361244;
        Mon, 28 Feb 2022 04:46:01 -0800 (PST)
Received: from localhost.localdomain ([117.207.25.37])
        by smtp.gmail.com with ESMTPSA id y12-20020a056a00190c00b004f39e28fb87sm14256737pfi.98.2022.02.28.04.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:46:00 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        quic_jhugo@quicinc.com, vinod.koul@linaro.org,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        quic_vbadigan@quicinc.com, quic_cang@quicinc.com,
        quic_skananth@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, elder@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 23/27] bus: mhi: ep: Add support for reading from the host
Date:   Mon, 28 Feb 2022 18:13:40 +0530
Message-Id: <20220228124344.77359-24-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
References: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Data transfer between host and the ep device happens over the transfer
ring associated with each bi-directional channel pair. Host defines the
transfer ring by allocating memory for it. The read and write pointer
addresses of the transfer ring are stored in the channel context.

Once host places the elements in the transfer ring, it increments the
write pointer and rings the channel doorbell. Device will receive the
doorbell interrupt and will process the transfer ring elements.

This commit adds support for reading the transfer ring elements from
the transfer ring till write pointer, incrementing the read pointer and
finally sending the completion event to the host through corresponding
event ring.

Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 121 ++++++++++++++++++++++++++++++++++++++
 include/linux/mhi_ep.h    |   9 +++
 2 files changed, 130 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 1d4a9f6db8a3..e7c0ef9f281b 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -299,6 +299,127 @@ int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_element *e
 	return ret;
 }
 
+bool mhi_ep_queue_is_empty(struct mhi_ep_device *mhi_dev, enum dma_data_direction dir)
+{
+	struct mhi_ep_chan *mhi_chan = (dir == DMA_FROM_DEVICE) ? mhi_dev->dl_chan :
+								mhi_dev->ul_chan;
+	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_ep_ring *ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
+
+	return !!(ring->rd_offset == ring->wr_offset);
+}
+EXPORT_SYMBOL_GPL(mhi_ep_queue_is_empty);
+
+static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
+				struct mhi_ep_ring *ring,
+				struct mhi_result *result,
+				u32 len)
+{
+	struct mhi_ep_chan *mhi_chan = &mhi_cntrl->mhi_chan[ring->ch_id];
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	size_t tr_len, read_offset, write_offset;
+	struct mhi_ring_element *el;
+	bool tr_done = false;
+	void *write_addr;
+	u64 read_addr;
+	u32 buf_left;
+	int ret;
+
+	buf_left = len;
+
+	do {
+		/* Don't process the transfer ring if the channel is not in RUNNING state */
+		if (mhi_chan->state != MHI_CH_STATE_RUNNING) {
+			dev_err(dev, "Channel not available\n");
+			return -ENODEV;
+		}
+
+		el = &ring->ring_cache[ring->rd_offset];
+
+		/* Check if there is data pending to be read from previous read operation */
+		if (mhi_chan->tre_bytes_left) {
+			dev_dbg(dev, "TRE bytes remaining: %u\n", mhi_chan->tre_bytes_left);
+			tr_len = min(buf_left, mhi_chan->tre_bytes_left);
+		} else {
+			mhi_chan->tre_loc = MHI_TRE_DATA_GET_PTR(el);
+			mhi_chan->tre_size = MHI_TRE_DATA_GET_LEN(el);
+			mhi_chan->tre_bytes_left = mhi_chan->tre_size;
+
+			tr_len = min(buf_left, mhi_chan->tre_size);
+		}
+
+		read_offset = mhi_chan->tre_size - mhi_chan->tre_bytes_left;
+		write_offset = len - buf_left;
+		read_addr = mhi_chan->tre_loc + read_offset;
+		write_addr = result->buf_addr + write_offset;
+
+		dev_dbg(dev, "Reading %zd bytes from channel (%u)\n", tr_len, ring->ch_id);
+		ret = mhi_cntrl->read_from_host(mhi_cntrl, read_addr, write_addr, tr_len);
+		if (ret < 0) {
+			dev_err(&mhi_chan->mhi_dev->dev, "Error reading from channel\n");
+			return ret;
+		}
+
+		buf_left -= tr_len;
+		mhi_chan->tre_bytes_left -= tr_len;
+
+		/*
+		 * Once the TRE (Transfer Ring Element) of a TD (Transfer Descriptor) has been
+		 * read completely:
+		 *
+		 * 1. Send completion event to the host based on the flags set in TRE.
+		 * 2. Increment the local read offset of the transfer ring.
+		 */
+		if (!mhi_chan->tre_bytes_left) {
+			/*
+			 * The host will split the data packet into multiple TREs if it can't fit
+			 * the packet in a single TRE. In that case, CHAIN flag will be set by the
+			 * host for all TREs except the last one.
+			 */
+			if (MHI_TRE_DATA_GET_CHAIN(el)) {
+				/*
+				 * IEOB (Interrupt on End of Block) flag will be set by the host if
+				 * it expects the completion event for all TREs of a TD.
+				 */
+				if (MHI_TRE_DATA_GET_IEOB(el)) {
+					ret = mhi_ep_send_completion_event(mhi_cntrl, ring, el,
+								     MHI_TRE_DATA_GET_LEN(el),
+								     MHI_EV_CC_EOB);
+					if (ret < 0) {
+						dev_err(&mhi_chan->mhi_dev->dev,
+							"Error sending transfer compl. event\n");
+						return ret;
+					}
+				}
+			} else {
+				/*
+				 * IEOT (Interrupt on End of Transfer) flag will be set by the host
+				 * for the last TRE of the TD and expects the completion event for
+				 * the same.
+				 */
+				if (MHI_TRE_DATA_GET_IEOT(el)) {
+					ret = mhi_ep_send_completion_event(mhi_cntrl, ring, el,
+								     MHI_TRE_DATA_GET_LEN(el),
+								     MHI_EV_CC_EOT);
+					if (ret < 0) {
+						dev_err(&mhi_chan->mhi_dev->dev,
+							"Error sending transfer compl. event\n");
+						return ret;
+					}
+				}
+
+				tr_done = true;
+			}
+
+			mhi_ep_ring_inc_index(ring);
+		}
+
+		result->bytes_xferd += tr_len;
+	} while (buf_left && !tr_done);
+
+	return 0;
+}
+
 static int mhi_ep_cache_host_cfg(struct mhi_ep_cntrl *mhi_cntrl)
 {
 	size_t cmd_ctx_host_size, ch_ctx_host_size, ev_ctx_host_size;
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index 681c638833ff..45d12a55b435 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -261,4 +261,13 @@ int mhi_ep_power_up(struct mhi_ep_cntrl *mhi_cntrl);
  */
 void mhi_ep_power_down(struct mhi_ep_cntrl *mhi_cntrl);
 
+/**
+ * mhi_ep_queue_is_empty - Determine whether the transfer queue is empty
+ * @mhi_dev: Device associated with the channels
+ * @dir: DMA direction for the channel
+ *
+ * Return: true if the queue is empty, false otherwise.
+ */
+bool mhi_ep_queue_is_empty(struct mhi_ep_device *mhi_dev, enum dma_data_direction dir);
+
 #endif
-- 
2.25.1

