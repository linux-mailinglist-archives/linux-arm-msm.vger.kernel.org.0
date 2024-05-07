Return-Path: <linux-arm-msm+bounces-19318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D36448BE3B3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 15:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 609391F26D35
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 13:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9606316C436;
	Tue,  7 May 2024 13:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W/ysPZ06"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF919168B19
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 13:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087913; cv=none; b=Ha+V5hDYUzvEPsTl+GZu+6b5wUKt9DEKjpTti6AZ5WkgNUpYC/s3AGZTRIG2tgfnpaOIZEmXbtD/J5LupZLKPZvBOVKBElp2rlnstCYbW+hHOhs3efH45FijlPXLDsfK8H6XmAVvd6b0Nbep5+WgcoAgvzrmmIgKvVL4zxSPZ+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087913; c=relaxed/simple;
	bh=znTu4kcBZIJ40DAZAzE4ZarYw+mhmMYgFA8GYOICILk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CsyZDN9BpuJnxaDWuj49Gn4G4oCPG24eyxHz5P3XhxfyDHw2ABVWpDsYMMapSdYj6CLEcnHB4QxChQ84B6TI83HDdnq9pWuJruL6XzgMTOd4H8lM/aENveCoky6MBsMrIbEKsOluAuwh+F6LD23Q1Z3I+LbWloCiKiZI1o+lof4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W/ysPZ06; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-434c3d21450so11154851cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 06:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087911; x=1715692711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XvJOy5lJ/u6e9yHF9m7H/WFxuEXKyxfgmG432+rwWPs=;
        b=W/ysPZ06IYFhtX/6M3QRbwwJGPzhk/CIsHei/AljHXL4JN8aGL6yhVBUYEbi36qpad
         IA0pgS3Ljw0RtcNaz4Hi1KvWOyOSn4YmxL1sh7QEVCl4lj+o8exRPeBIC6MNNs5LrQWV
         q4a8DJGW98T/nOESWGyHZFg1FXPO39PWk2Sj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087911; x=1715692711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvJOy5lJ/u6e9yHF9m7H/WFxuEXKyxfgmG432+rwWPs=;
        b=Nh21mBE9D4BNv3is81STKac9dKSl92/hzMbrFkA1+m86i3PKNKsZvhmLTxwN03mkzF
         1WAUhJNU43F8E8AFshD9AWNju07IOgyDZLRunJfgDhS8Mp8mSWyiwetXarF3U3bpXcDQ
         sxIHlxdKBQ5ToYPZ2sZBNGg4j+oixIYzDAP7xrkrMgL9nePANyopXa3gLrqH74Xa0ddX
         +Gd5A3u8WBGJPL78zAtH7/kzWK217fJdrb5+w9jhXaarHjrNO2atgDn3ygFRfzSUyC/a
         ROMYWFGmHJe00BmhN3m9IHInwf5JyMZLHbJjiscFLKiXnruY2TCUtGAzkVGT3tolPkvy
         T0KA==
X-Forwarded-Encrypted: i=1; AJvYcCU2pjE6RWG9fBziJQgbiFqLslK3vT5IszjM1sAiFj+/1KcOK9aw9CPADAF+QvyrCBWoRPF+6sgajBmY+J2nlmGtvYDvrjUWPYtIIsvlwg==
X-Gm-Message-State: AOJu0Yyx16JuwHXOXmm2OkWk47lxUvi+J3vMX2FD9MdKt4jjJx8D62yG
	SA7xyfEPCDKHQSqR+RlMI/l3fDyRGuCaNTtxObZBKNUQivumErfV2axD139ZlQ==
X-Google-Smtp-Source: AGHT+IGm6pXwHMdL9pFaV0FwWg8eqwPdftA0BUaILiny2B4bPC36O7QRhpTkxvdwYUJMzUmDBO5Kmg==
X-Received: by 2002:a05:6214:1253:b0:6a0:b3ec:902f with SMTP id r19-20020a056214125300b006a0b3ec902fmr19399470qvv.15.1715087910820;
        Tue, 07 May 2024 06:18:30 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 13:18:27 +0000
Subject: [PATCH 01/18] media: allegro: nal-hevc: Refactor
 nal_hevc_sub_layer_hrd_parameters
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v1-1-4a421c21fd06@chromium.org>
References: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
To: Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Replace all the single elements arrays with the element itself.

Pahole shows the same padding and alignment for x86 and arm in both
situations.

This fixes this cocci warning:
drivers/media/platform/allegro-dvt/nal-hevc.h:102:14-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/allegro-dvt/allegro-core.c |  6 +++---
 drivers/media/platform/allegro-dvt/nal-hevc.c     | 11 +++--------
 drivers/media/platform/allegro-dvt/nal-hevc.h     |  6 +++---
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index da61f9beb6b4..369bd88cc0ae 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -1852,14 +1852,14 @@ static ssize_t allegro_hevc_write_sps(struct allegro_channel *channel,
 	hrd->dpb_output_delay_length_minus1 = 30;
 
 	hrd->bit_rate_scale = ffs(channel->bitrate_peak) - 6;
-	hrd->vcl_hrd[0].bit_rate_value_minus1[0] =
+	hrd->vcl_hrd[0].bit_rate_value_minus1 =
 		(channel->bitrate_peak >> (6 + hrd->bit_rate_scale)) - 1;
 
 	cpb_size = v4l2_ctrl_g_ctrl(channel->mpeg_video_cpb_size) * 1000;
 	hrd->cpb_size_scale = ffs(cpb_size) - 4;
-	hrd->vcl_hrd[0].cpb_size_value_minus1[0] = (cpb_size >> (4 + hrd->cpb_size_scale)) - 1;
+	hrd->vcl_hrd[0].cpb_size_value_minus1 = (cpb_size >> (4 + hrd->cpb_size_scale)) - 1;
 
-	hrd->vcl_hrd[0].cbr_flag[0] = !v4l2_ctrl_g_ctrl(channel->mpeg_video_frame_rc_enable);
+	hrd->vcl_hrd[0].cbr_flag = !v4l2_ctrl_g_ctrl(channel->mpeg_video_frame_rc_enable);
 
 	size = nal_hevc_write_sps(&dev->plat_dev->dev, dest, n, sps);
 
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/media/platform/allegro-dvt/nal-hevc.c
index 9cdf2756e0a3..575089522df5 100644
--- a/drivers/media/platform/allegro-dvt/nal-hevc.c
+++ b/drivers/media/platform/allegro-dvt/nal-hevc.c
@@ -210,14 +210,9 @@ static void nal_hevc_rbsp_vps(struct rbsp *rbsp, struct nal_hevc_vps *vps)
 static void nal_hevc_rbsp_sub_layer_hrd_parameters(struct rbsp *rbsp,
 						   struct nal_hevc_sub_layer_hrd_parameters *hrd)
 {
-	unsigned int i;
-	unsigned int cpb_cnt = 1;
-
-	for (i = 0; i < cpb_cnt; i++) {
-		rbsp_uev(rbsp, &hrd->bit_rate_value_minus1[i]);
-		rbsp_uev(rbsp, &hrd->cpb_size_value_minus1[i]);
-		rbsp_bit(rbsp, &hrd->cbr_flag[i]);
-	}
+	rbsp_uev(rbsp, &hrd->bit_rate_value_minus1);
+	rbsp_uev(rbsp, &hrd->cpb_size_value_minus1);
+	rbsp_bit(rbsp, &hrd->cbr_flag);
 }
 
 static void nal_hevc_rbsp_hrd_parameters(struct rbsp *rbsp,
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/nal-hevc.h
index eb46f12aae80..afa7a9d7d654 100644
--- a/drivers/media/platform/allegro-dvt/nal-hevc.h
+++ b/drivers/media/platform/allegro-dvt/nal-hevc.h
@@ -97,9 +97,9 @@ struct nal_hevc_vps {
 };
 
 struct nal_hevc_sub_layer_hrd_parameters {
-	unsigned int bit_rate_value_minus1[1];
-	unsigned int cpb_size_value_minus1[1];
-	unsigned int cbr_flag[1];
+	unsigned int bit_rate_value_minus1;
+	unsigned int cpb_size_value_minus1;
+	unsigned int cbr_flag;
 };
 
 struct nal_hevc_hrd_parameters {

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


