Return-Path: <linux-arm-msm+bounces-19372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9878BE8FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 18:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 750BBB257DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 16:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C09F16EC19;
	Tue,  7 May 2024 16:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S8ipRpGA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C10D16D4F6
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099240; cv=none; b=D4abrk7urUtjTE+rH7dsQ7Qhpgwpeyg4NgR1BSgyoZ60D8f+YSmdRNApv2u4mJ09uiUqMPmYkJkuYMcVMgI4ahNxJDtlGAJowDHH5DQ/g+ckYid5UQJIQoEelxUla6Z9gLrhDVkvtZoAbYqrxpbYPqFmMXiUokQa8byvkaQP9Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099240; c=relaxed/simple;
	bh=wXllf/Q1F0asZS1sTnO9eU/dGVrc8mBHMAVhM0rUTv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=etXEUZCTXSua0vAjyodLckXx0e++Reapqjp9Ofxx059JJG+t+aCNNd8E7w+ZCw6rW8VbzMu0dartxBdnQ1BPs6SUNdN8fGi2OhZeFBIOODvA7xYQFOigaes8VApQCSxN9x5vV711b6m5m595Czp9FaB1QjKDxwVx299ED9fPtVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S8ipRpGA; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-43ab76cac73so31118711cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 09:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099237; x=1715704037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaj6FcAMdKWO/HBrdvIpPTLyis7BoUMkhPcms6B+rAo=;
        b=S8ipRpGAFek1bIdCBm1Llol4r13d0Dl5r/F3x3OZRbzjhIIWT9Ez+irW1ivrFNR4B8
         UquMySi/MlZOqdozUp8Y9G4pitEpb2fVGgaLfinoJo4Drn9iWJA39vA7Rx0cQyVj4ykO
         1+8UJuWiMEtEzjlvp3xsQ3rALLUsUPQqDzk00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099237; x=1715704037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kaj6FcAMdKWO/HBrdvIpPTLyis7BoUMkhPcms6B+rAo=;
        b=HBtCEJh8dDuhVcvzIrmpfRC5+tcOWZos8QB5NjVzjd4RqkF/uW/Yo0pyV/xiN5sG/S
         LLOi0P6bS8ExHADIf0KCIm641pwzrCMnfdmEFMWsRk4S1Wa/IYuf37Tqf38VZkndgdCF
         2P0AbriV4/riLxgyxgz9xBQX1q28xUuaRgxGRAF52/xn7gKGy9hYHVxMkE0jJdBXA8Ze
         AsadnUvc+0EB/lyMGb1uVsh9RoSAwMK+gphXn/+NodXY37kuUV6c9VLNdqBHTIdGU5J6
         aU0HFadC1oiB6sRURa40cNmPAd50PqsqSTdIOUMeGonUZlXJ7+3lufEHDZ7CyyfUF2EB
         qxkA==
X-Forwarded-Encrypted: i=1; AJvYcCU28TuisxXSwfX6k9rkDlWzCBHM59oXS9uvlacJcgXtu/124vl0Oj04oKx9GBoZqzG5vR6/73Wu+pv2jEL1hlibxxtefSYc7gEdhp3fFw==
X-Gm-Message-State: AOJu0YwaQBUjXmGY77gmu6zJVYi1ADmgL4hTl4Nqv5XXsXyx/PKIkxGM
	Z3rlhnyM65zS/7Jzs2YKJHlFvkXKsaknmhy/Si7jMfLKULGk5Xe18mipCL43bA==
X-Google-Smtp-Source: AGHT+IHj6qoRnVnypcfsl4SMsq6a3QXSfSAsL/0HydIZfs+TT2QxcbwCNWNtumzYnUMZlJ9mwCoojA==
X-Received: by 2002:a05:622a:2d5:b0:43a:b29d:36ae with SMTP id d75a77b69052e-43dbe00e35amr4071821cf.9.1715099237518;
        Tue, 07 May 2024 09:27:17 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 16:27:14 +0000
Subject: [PATCH v2 09/18] media: venus: Remove unused structs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v2-9-7aea262cf065@chromium.org>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
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

This structures are not used, and have a single element array at the end
of them. Remove them.

This fix the following cocci warnings:
drivers/media/platform/qcom/venus/hfi_helper.h:764:5-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1041:5-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1088:39-51: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1093:5-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1144:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1239:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1272:4-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:85:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:180:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:189:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h   | 26 -----------------
 drivers/media/platform/qcom/venus/hfi_helper.h | 39 --------------------------
 2 files changed, 65 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 20acd412ee7b..41f765eac4d9 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -77,14 +77,6 @@ struct hfi_sys_get_property_pkt {
 	u32 data[1];
 };
 
-struct hfi_sys_set_buffers_pkt {
-	struct hfi_pkt_hdr hdr;
-	u32 buffer_type;
-	u32 buffer_size;
-	u32 num_buffers;
-	u32 buffer_addr[1];
-};
-
 struct hfi_sys_ping_pkt {
 	struct hfi_pkt_hdr hdr;
 	u32 client_data;
@@ -171,24 +163,6 @@ struct hfi_session_empty_buffer_uncompressed_plane0_pkt {
 	u32 data[1];
 };
 
-struct hfi_session_empty_buffer_uncompressed_plane1_pkt {
-	u32 flags;
-	u32 alloc_len;
-	u32 filled_len;
-	u32 offset;
-	u32 packet_buffer2;
-	u32 data[1];
-};
-
-struct hfi_session_empty_buffer_uncompressed_plane2_pkt {
-	u32 flags;
-	u32 alloc_len;
-	u32 filled_len;
-	u32 offset;
-	u32 packet_buffer3;
-	u32 data[1];
-};
-
 struct hfi_session_fill_buffer_pkt {
 	struct hfi_session_hdr_pkt shdr;
 	u32 stream_id;
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index e4c05d62cfc7..7c0edef263ae 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -759,11 +759,6 @@ struct hfi_multi_stream_3x {
 	u32 enable;
 };
 
-struct hfi_multi_view_format {
-	u32 views;
-	u32 view_order[1];
-};
-
 #define HFI_MULTI_SLICE_OFF			0x1
 #define HFI_MULTI_SLICE_BY_MB_COUNT		0x2
 #define HFI_MULTI_SLICE_BY_BYTE_COUNT		0x3
@@ -1036,11 +1031,6 @@ struct hfi_codec_supported {
 	u32 enc_codecs;
 };
 
-struct hfi_properties_supported {
-	u32 num_properties;
-	u32 properties[1];
-};
-
 struct hfi_max_sessions_supported {
 	u32 max_sessions;
 };
@@ -1083,16 +1073,6 @@ struct hfi_resource_ocmem_requirement {
 	u32 size;
 };
 
-struct hfi_resource_ocmem_requirement_info {
-	u32 num_entries;
-	struct hfi_resource_ocmem_requirement requirements[1];
-};
-
-struct hfi_property_sys_image_version_info_type {
-	u32 string_size;
-	u8  str_image_version[1];
-};
-
 struct hfi_codec_mask_supported {
 	u32 codecs;
 	u32 video_domains;
@@ -1135,15 +1115,6 @@ struct hfi_index_extradata_config {
 	u32 index_extra_data_id;
 };
 
-struct hfi_extradata_header {
-	u32 size;
-	u32 version;
-	u32 port_index;
-	u32 type;
-	u32 data_size;
-	u8 data[1];
-};
-
 struct hfi_batch_info {
 	u32 input_batch_count;
 	u32 output_batch_count;
@@ -1234,11 +1205,6 @@ static inline void hfi_bufreq_set_count_min_host(struct hfi_buffer_requirements
 		req->count_min = val;
 };
 
-struct hfi_data_payload {
-	u32 size;
-	u8 data[1];
-};
-
 struct hfi_enable_picture {
 	u32 picture_type;
 };
@@ -1267,11 +1233,6 @@ struct hfi_buffer_alloc_mode_supported {
 	u32 data[1];
 };
 
-struct hfi_mb_error_map {
-	u32 error_map_size;
-	u8 error_map[1];
-};
-
 struct hfi_metadata_pass_through {
 	int enable;
 	u32 size;

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


