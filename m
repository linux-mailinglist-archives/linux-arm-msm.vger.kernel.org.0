Return-Path: <linux-arm-msm+bounces-84996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 790ACCB50DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 09:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7912A301AF6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 08:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A21824169D;
	Thu, 11 Dec 2025 08:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IqDSR81+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCs1eLXx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDE52D5C68
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440477; cv=none; b=PE5p9Vyot8q+hS0SK/GNMUFrobDpg6mrRnnIP2naAAGo/C5Y5WWZ0slvfOGcxRowdjtOwbhb4z6etcdgMc8o8UaD0mh6T3LEWRiRGhzYacsDtLuziIHvlpp1kHHbISu09MyIgD0O734ZO7AHFFhzUdQanFDu9bjsnXAkNY6uV0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440477; c=relaxed/simple;
	bh=h+feqIXr5w5z860++1hMrUgyYUx9wCCEo3qtKiYD8Jg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q3VjNHAD6s06uOA9xvlQLC0f47qMy730x0kcfncyUiK+jCW3GAKEIG71gyl3AKODvHWCGoVVbrFPUzWdtdtJ8Le5P58eJXeRmmjkS1m4z9ZUDrNKMWRT+UYpScQby+Ov1rSOVCR/weTYEXuTI9u5AqJ0DCarYl+BGvMZ+EoLH+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IqDSR81+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCs1eLXx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALPHe64126669
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iuCH3Zp//u7Umu61QPG7yZPcMDUz7hNKqC4HK41aEsM=; b=IqDSR81+XbdFUurU
	gfDJ6NIsQXoBYZtWYuJbWRM9zAzZpyOZLTPrr18RF+FK6eo7FO37oWei97j/4yyx
	GfuDbLPpb89XIGBOCyFLn+z/5v8xlLBLabzTxY51XuJHEJe8Q1jGurxrFPJ2TRVY
	xD1QkpGbdugn6yL7MPJFnqIL+isxei0TwN29Kku1JViDjvQ2S8lrlyozPW2/d5C/
	CZycMo5vxX5mahlwGs51pYAFlqQ8uNHAxL7sdQmTvG6/78RQKBIDg1zh+nKfc+kK
	VW3sCSm+s1kRYJ8suKVe+nkrIXSJrLTLsnT8nk1UH6W/uEpWEVKUwmcjvZrfzMG8
	RG1lvw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhparbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:07:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7ba9c366057so2108662b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 00:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765440473; x=1766045273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuCH3Zp//u7Umu61QPG7yZPcMDUz7hNKqC4HK41aEsM=;
        b=UCs1eLXxY78KSGPLAndGWvrKQ/Ltc96Vf5bYJtYLcwQ7CQJTQTFq9yBGSosZYPbvfm
         awq0WvbEH+2hVVQfq965T1u0acfGZf0XPRVsjuLhYTHBSo0BUYeveg5YW9GhfZPVnX2B
         +m2Oks2bYCESNCdrwovk7prcoeK9gReOw3zc28VdvHxxvno8XJb0VE3c4yYczmdSV5+b
         JRxJm/nToo8cIZZjZsZVj8Uk6+isFCGMzDJF8Lt7iJAoQDKebFJACkLTTyBsp8jX4hgT
         Zm4jG3TMdjs1uIisnNf192Na1ZfS4NElr+NXOcp6u+0aNk3xyhnlHMXnSzsStZfOugrU
         1bKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440473; x=1766045273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iuCH3Zp//u7Umu61QPG7yZPcMDUz7hNKqC4HK41aEsM=;
        b=IQcD6l2C1bMj5VQfKA6mhr9L4jLY2jAuz+mcSffU+DN+RAD+ANgmS89kkhRT3Fgw/a
         BPBcotmlVY4KetkflBvK4BP7nRUnL1tJX4C3ByzcBXu3klo69rfHVmJzQ4uL5ah6seld
         LWF9GC3Pk80TNAUK6/JefnwhTBWWU/J7p+ARYzWo5Vjcujg5n5zWwURgab6c4chK6AmR
         X6lWjY5ggBZgseQwVmeB05JCiNZvp0iiciIjUVsRJn5jhv/XaRSAAqNq1inQeU0RtK7L
         WkzPeOJMMn4wq1xoifC8I23dWcjgzmFH4vt+HT+GEvtZwaPsTecbZqCbq4YBgbmy6X/Q
         dNsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkY0gS62nhcyjR2KppEePaobZ3qmsh72boNvtF/P1UkjwgD99+IM36HkooZKJjp5NfbbSotxQSoauGGuWQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0XAoo+XYiEA1uY/4D5pgqfshPG61QJh+HqPT4Oc8ftreiRXD/
	G+vkUfEKq5NCLTxNb0aE2KhUwhmoyepnntZvQFvpR0+5kvXP9sPbuVICbsO9GBWrgsRSMY7Jwvg
	DEbi/1fUnMp60vbJQ0zcQ26uBO5Qp5VJAS+ohk7c2ICXYeBl8Y9igbu8yGqkFrm5Hc1h+
X-Gm-Gg: AY/fxX4y1FrtvMe9EEGdBb9R8ebwrnIEvbTbAC/HLhd1r+DTAp0JcxCg5dxguZu1pYh
	b4zAzCA+7ASE0Oa4Q3dZRKusDzyLtESrVmSw57oDYCayBM7Jb03N0+Dr+GgepNswlwPiOgHiHep
	1I26J6JErUMpHJbsdfTRU5kYa10pp0FsTCxJj1w5hiGVo9w14+nwKSAj7/XWstM9gLItosLWijf
	fRkJ30desdRHnYAS6LVN7LxhVtKdTs1dA2cvV0o2LOqKUvTIYFQCW2EPtRCbc0/fTJdPy+5XhUE
	8Iwj13UFXQRi+3Hm5Twyk2s68BmzOgpjSRdplkcglmtqaKkN5JvOSOII8eGRDUXhj6easbBtovn
	5res8hLLegrGzBTCh1QT3o13aPWBwR+zxdw==
X-Received: by 2002:a05:6a00:92a2:b0:7e8:450c:618c with SMTP id d2e1a72fcca58-7f22e48b131mr4568396b3a.35.1765440472956;
        Thu, 11 Dec 2025 00:07:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwWwa9QMypmPHHM8GKyLYNFPbyXuckTYzwgrCa53kkP6frpMmL8uZs7IFXCrkn4UI36FTc4A==
X-Received: by 2002:a05:6a00:92a2:b0:7e8:450c:618c with SMTP id d2e1a72fcca58-7f22e48b131mr4568366b3a.35.1765440472494;
        Thu, 11 Dec 2025 00:07:52 -0800 (PST)
Received: from [10.213.102.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm1706651b3a.3.2025.12.11.00.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:07:52 -0800 (PST)
From: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 13:37:35 +0530
Subject: [PATCH 03/11] bus: mhi: host: Add support for queuing multiple DMA
 buffers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-siva_mhi_dp2-v1-3-d2895c4ec73a@oss.qualcomm.com>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
In-Reply-To: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Upal Kumar Saha <upal.saha@oss.qualcomm.com>,
        Himanshu Shukla <quic_himashuk@quicinc.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfX4rdo335Iyq82
 XN2tTIJfAk8tYYb3fDLA8noxXzUrJPiK694zInnsc+g/3WtSDFnh+rZ898crsyY+cPOrfenO7oc
 ae38HHEsiIShQshchyn0FG/QRRV83/JDUHvQWbGtWWe7THe2y6BOGDu/LJO0fKSFe5n+Org+Td/
 4WC7bJUAOCexgL7Vo/N6XUilQhETeHROsnBnEhhTGhHPjibRpywTOZ1ZxoQUAu35KTkzB9Jlt8c
 heEOWW4o+FgW5hf2IhmVOqVhPDJy08rPgtfUOl1oM2Hd22glmsWWTPbCCPj2eHYOBp+0K9WKcFS
 MZw1XgPdJoqY3pz8Rjtb5p3A6+Ocvp9OhQ46F71bXWoeFipLLmj2XjppS4f5nxUf3n/jtZ6yrMD
 YwdQ/YdLcveZOKTBB/HFybWAAkuBdA==
X-Proofpoint-ORIG-GUID: mwNDhtzdG7Er02g8te1Sh7CBqhBHdmUF
X-Proofpoint-GUID: mwNDhtzdG7Er02g8te1Sh7CBqhBHdmUF
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=693a7bda cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QMY_sxhyyrCYvVqsgUQA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110059

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Optimize MHI clients by allowing them to queue multiple DMA buffers for a
given transfer without ringing the channel doorbell for every queue. This
avoids unnecessary link access. Introduce the exported API mhi_queue_n_dma
to pass an array of MHI buffers and MHI flags.

Currently, the BEI flag is set for all TREs based on the interrupt
moderation timer value. MHI clients are not allowed to block event
interrupts at runtime. If interrupt moderation is disabled for an event
ring, the client is allowed to poll on events posted on the event ring by
blocking the MSI. If interrupt moderation is enabled, the BEI flag passed
in the queue API is overridden to maintain the current implementation tied
to the interrupt moderation timer value.

For scatter-gather transfers, MHI clients should set the MHI_SG transfer
flag. This flag allows skipping the issuance of transfer callbacks per TRE
and only issuing a single callback when the last TRE is processed.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
---
 drivers/bus/mhi/host/internal.h |   8 ++
 drivers/bus/mhi/host/main.c     | 203 +++++++++++++++++++++++++++++++++++-----
 include/linux/mhi.h             |  26 +++++
 3 files changed, 213 insertions(+), 24 deletions(-)

diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 7937bb1f742c..97bf6a70b9fa 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -236,6 +236,7 @@ struct mhi_buf_info {
 	enum dma_data_direction dir;
 	bool used; /* Indicates whether the buffer is used or not */
 	bool pre_mapped; /* Already pre-mapped by client */
+	bool sg_enabled; /* perform sg and return single completion call back */
 };
 
 struct mhi_event {
@@ -414,6 +415,13 @@ irqreturn_t mhi_intvec_handler(int irq_number, void *dev);
 
 int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 		struct mhi_buf_info *info, enum mhi_flags flags);
+int mhi_gen_n_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
+		  struct mhi_buf *bufs, enum mhi_flags flags[],
+		  unsigned int num);
+int __mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
+		  struct mhi_buf_info *info, enum mhi_flags flags,
+		  struct mhi_ring *buf_ring,  struct mhi_ring *tre_ring);
+
 int mhi_map_single_no_bb(struct mhi_controller *mhi_cntrl,
 			 struct mhi_buf_info *buf_info);
 int mhi_map_single_use_bb(struct mhi_controller *mhi_cntrl,
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 861551274319..7beb848ca5c1 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -605,7 +605,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 		struct mhi_ring_element *local_rp, *ev_tre;
 		void *dev_rp, *next_rp;
 		struct mhi_buf_info *buf_info;
-		u16 xfer_len;
+		u16 xfer_len, total_tre_len = 0;
+		bool send_cb = false;
 
 		if (!is_valid_ring_ptr(tre_ring, ptr)) {
 			dev_err(&mhi_cntrl->mhi_dev->dev,
@@ -635,10 +636,14 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 		while (local_rp != dev_rp) {
 			buf_info = buf_ring->rp;
 			/* If it's the last TRE, get length from the event */
-			if (local_rp == ev_tre)
+			if (local_rp == ev_tre) {
 				xfer_len = MHI_TRE_GET_EV_LEN(event);
-			else
+				send_cb = true;
+			} else {
 				xfer_len = buf_info->len;
+			}
+
+			total_tre_len += xfer_len;
 
 			/* Unmap if it's not pre-mapped by client */
 			if (likely(!buf_info->pre_mapped))
@@ -655,13 +660,28 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 
 			read_unlock_bh(&mhi_chan->lock);
 
+
 			/* notify client */
-			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
+			if (buf_info->sg_enabled) {
+				if (send_cb) {
+					result.bytes_xferd = total_tre_len;
+					mhi_chan->xfer_cb(mhi_chan->mhi_dev,
+							  &result);
+				}
+			} else {
+				mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
+			}
 
 			if (mhi_chan->dir == DMA_TO_DEVICE) {
 				atomic_dec(&mhi_cntrl->pending_pkts);
-				/* Release the reference got from mhi_queue() */
-				mhi_cntrl->runtime_put(mhi_cntrl);
+				/*
+				 * In case of scatter gather send_cb is set to true only
+				 * for the last TRE, runtime_put should be called for
+				 * last TRE instead of every buffer i.e, when send_cb
+				 * is true else runtime_put count will not be balanced
+				 */
+				if (!buf_info->sg_enabled || send_cb)
+					mhi_cntrl->runtime_put(mhi_cntrl);
 			}
 
 			/*
@@ -1192,25 +1212,14 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 }
 EXPORT_SYMBOL_GPL(mhi_queue_skb);
 
-int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
-			struct mhi_buf_info *info, enum mhi_flags flags)
+int __mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
+		  struct mhi_buf_info *info, enum mhi_flags flags,
+		  struct mhi_ring *buf_ring,  struct mhi_ring *tre_ring)
 {
-	struct mhi_ring *buf_ring, *tre_ring;
 	struct mhi_ring_element *mhi_tre;
 	struct mhi_buf_info *buf_info;
 	int eot, eob, chain, bei;
-	int ret = 0;
-
-	/* Protect accesses for reading and incrementing WP */
-	write_lock_bh(&mhi_chan->lock);
-
-	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
-		ret = -ENODEV;
-		goto out;
-	}
-
-	buf_ring = &mhi_chan->buf_ring;
-	tre_ring = &mhi_chan->tre_ring;
+	int ret;
 
 	buf_info = buf_ring->wp;
 	WARN_ON(buf_info->used);
@@ -1227,24 +1236,55 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 	if (!info->pre_mapped) {
 		ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
 		if (ret)
-			goto out;
+			return ret;
 	}
 
+	trace_mhi_gen_tre(mhi_cntrl, mhi_chan, mhi_tre);
+
 	eob = !!(flags & MHI_EOB);
 	eot = !!(flags & MHI_EOT);
 	chain = !!(flags & MHI_CHAIN);
-	bei = !!(mhi_chan->intmod);
+
+	buf_info->sg_enabled = !!(flags & MHI_SG);
+
+	/* honor bei flag if interrupt moderation is disabled */
+	bei = !!(mhi_chan->intmod ?
+				mhi_chan->intmod : flags & MHI_BEI);
 
 	mhi_tre = tre_ring->wp;
 	mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);
 	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(info->len);
 	mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(bei, eot, eob, chain);
 
-	trace_mhi_gen_tre(mhi_cntrl, mhi_chan, mhi_tre);
+	if (mhi_chan->dir == DMA_TO_DEVICE)
+		atomic_inc(&mhi_cntrl->pending_pkts);
+
 	/* increment WP */
 	mhi_add_ring_element(mhi_cntrl, tre_ring);
 	mhi_add_ring_element(mhi_cntrl, buf_ring);
 
+	return 0;
+}
+
+int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
+			struct mhi_buf_info *info, enum mhi_flags flags)
+{
+	struct mhi_ring *buf_ring, *tre_ring;
+	int ret = 0;
+
+	/* Protect accesses for reading and incrementing WP */
+	write_lock_bh(&mhi_chan->lock);
+
+	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	buf_ring = &mhi_chan->buf_ring;
+	tre_ring = &mhi_chan->tre_ring;
+
+	ret = __mhi_gen_tre(mhi_cntrl, mhi_chan, info, flags, buf_ring, tre_ring);
+
 out:
 	write_unlock_bh(&mhi_chan->lock);
 
@@ -1264,6 +1304,121 @@ int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 }
 EXPORT_SYMBOL_GPL(mhi_queue_buf);
 
+int mhi_gen_n_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
+		  struct mhi_buf *bufs, enum mhi_flags flags[],
+		  unsigned int num)
+{
+	struct mhi_ring *buf_ring, *tre_ring;
+	void *cur_buf_ring_wp, *cur_tre_ring_wp;
+	int i = 0, j, ret;
+	struct mhi_buf_info buf_info = {0};
+	struct mhi_buf_info *info;
+
+	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	buf_ring = &mhi_chan->buf_ring;
+	tre_ring = &mhi_chan->tre_ring;
+
+	cur_buf_ring_wp = buf_ring->wp;
+	cur_tre_ring_wp = tre_ring->wp;
+
+	while (num-- > 0) {
+		buf_info.wp = tre_ring->wp;
+		buf_info.p_addr = bufs[i].dma_addr;
+		buf_info.cb_buf = bufs[i].buf;
+		buf_info.len = bufs[i].len;
+		buf_info.pre_mapped = bufs[i].streaming_dma;
+
+		ret = __mhi_gen_tre(mhi_cntrl, mhi_chan, &buf_info, flags[i], buf_ring, tre_ring);
+		if (ret)
+			goto error;
+
+		i++;
+
+		/**
+		 * When multiple packets are queued in single queue_n_dma call
+		 * runtime_get should be called for each packet to balance
+		 * runtime_put and runtime_get count,
+		 * because once we get MSI's from the device,
+		 * we call runtime_put for each packet in parse_xfer_event
+		 */
+		if (!buf_info.sg_enabled)
+			mhi_cntrl->runtime_get(mhi_cntrl);
+	}
+
+	/**
+	 * If it is a scatter gather transfer, runtime_get
+	 * should be called only once as we call runtime_put
+	 * only for last TRE in the parse_xfer_event
+	 */
+	if (buf_info.wp && buf_info.sg_enabled)
+		mhi_cntrl->runtime_get(mhi_cntrl);
+
+	return 0;
+error:
+	buf_ring->wp = cur_buf_ring_wp;
+	tre_ring->wp = cur_buf_ring_wp;
+
+	for (j = i - 1; j >= 0; j--) {
+		atomic_dec(&mhi_cntrl->pending_pkts);
+		info = cur_buf_ring_wp;
+		if (!bufs[i].dma_addr)
+			mhi_cntrl->unmap_single(mhi_cntrl, info);
+
+		cur_buf_ring_wp += buf_ring->el_size;
+		if (cur_buf_ring_wp >= buf_ring->base + buf_ring->len)
+			cur_buf_ring_wp = buf_ring->base;
+	}
+
+out:
+	return ret;
+
+}
+
+int mhi_queue_n_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
+		    struct mhi_buf *bufs, enum mhi_flags mflags[],
+		    unsigned int num)
+{
+	unsigned long flags;
+	int ret;
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
+							     mhi_dev->dl_chan;
+
+	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)))
+		return -EIO;
+
+	write_lock_irqsave(&mhi_chan->lock, flags);
+
+	if (get_nr_avail_ring_elements(mhi_cntrl, &mhi_chan->tre_ring) < num) {
+		ret = -EAGAIN;
+		goto error;
+	}
+
+	ret = mhi_gen_n_tre(mhi_dev->mhi_cntrl, mhi_chan, bufs, mflags,
+			    num);
+	if (ret)
+		goto error;
+
+	/* Assert dev_wake (to exit/prevent M1/M2)*/
+	mhi_cntrl->wake_toggle(mhi_cntrl);
+
+	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
+		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
+
+	if (dir == DMA_FROM_DEVICE)
+		mhi_cntrl->runtime_put(mhi_cntrl);
+
+error:
+	write_unlock_irqrestore(&mhi_chan->lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mhi_queue_n_dma);
+
 bool mhi_queue_is_full(struct mhi_device *mhi_dev, enum dma_data_direction dir)
 {
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index dd372b0123a6..360770ddef70 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -52,11 +52,15 @@ enum mhi_callback {
  * @MHI_EOB: End of buffer for bulk transfer
  * @MHI_EOT: End of transfer
  * @MHI_CHAIN: Linked transfer
+ * @MHI_BEI: Block event interrupt
+ * @MHI_SG: scatter-gather enabled, single xfer call back to client
  */
 enum mhi_flags {
 	MHI_EOB = BIT(0),
 	MHI_EOT = BIT(1),
 	MHI_CHAIN = BIT(2),
+	MHI_BEI = BIT(3),
+	MHI_SG = BIT(4),
 };
 
 /**
@@ -497,6 +501,7 @@ struct mhi_result {
  *        ECA - Event context array data
  *        CCA - Channel context array data
  * @dma_addr: IOMMU address of the buffer
+ * @streaming_dma: Set this flag by client for pre allocated streaming dma address
  * @len: # of bytes
  */
 struct mhi_buf {
@@ -504,6 +509,7 @@ struct mhi_buf {
 	const char *name;
 	dma_addr_t dma_addr;
 	size_t len;
+	bool streaming_dma;
 };
 
 /**
@@ -770,6 +776,13 @@ int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev);
  */
 void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
 
+/**
+ * mhi_poll - Poll for any available data in DL direction
+ * @mhi_dev: Device associated with the channels
+ * @budget: # of events to process
+ */
+int mhi_poll(struct mhi_device *mhi_dev, u32 budget);
+
 /**
  * mhi_queue_buf - Send or receive raw buffers from client device over MHI
  *                 channel
@@ -782,6 +795,19 @@ void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
 int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 		  void *buf, size_t len, enum mhi_flags mflags);
 
+/**
+ * mhi_queue_n_dma - Send or receive n DMA mapped buffers from client device
+ *                 over MHI channel
+ * @mhi_dev: Device associated with the channels
+ * @dir: DMA direction for the channel
+ * @mhi_buf[]: Array of mhi_buf for holding the DMA mapped data and len
+ * @mflags[]: Array of MHI transfer flags used for the transfer
+ * @num: Number of transfers
+ */
+int mhi_queue_n_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
+		  struct mhi_buf *bufs, enum mhi_flags mflags[],
+		  unsigned int num);
+
 /**
  * mhi_queue_skb - Send or receive SKBs from client device over MHI channel
  * @mhi_dev: Device associated with the channels

-- 
2.34.1


