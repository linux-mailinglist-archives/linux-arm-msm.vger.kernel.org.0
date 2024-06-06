Return-Path: <linux-arm-msm+bounces-21930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 228008FE76E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 15:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6393A2856C9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 13:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D83195FF2;
	Thu,  6 Jun 2024 13:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oFdujwms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22565195B19
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679853; cv=none; b=dDMgb03Y0ufnOjErht9F6GJh00LrS8Zip6frtQNeGtxsbkz0lzVBahZNVNQkA+a07wQ8VtEcTfrNAguvmTeUwmtBy24TYxpd6rydtzPEGHLuBwbMgEqev/B0haPvQwagYnDLXR1u2WX95kVo1k7L0yIX2tV9UAFRLhw37tnANvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679853; c=relaxed/simple;
	bh=q4cFhQIrNm36IK0wKmtb142H9pZ1e7X8A6hufGU+NQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SlynygJ/yBf8nXMel9WZjWswdi6GBbHhZmh4qk8h0YE+mCF1ZUueK3TEcMTLxn41eaD7J4SIau92F8uBd5uvr25oAp9LsDEOCtJXz8m/mob3JGrZCcTHnFoHLGeVTvJI8j3XCn2w4Fy+FWgiL6ATQnOFnvPIaKF/hmfEqQ2s3gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oFdujwms; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6ae0c4d23ddso5023966d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 06:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717679851; x=1718284651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDRaTdfmVls7s4JXTIr052tZZ8CsVVd2h9OYORJYJok=;
        b=oFdujwmsXFGwYvB6T4Jq5RqxKjkJKijWGA/SBGvV/aBtUgMjL0nFyrsDVUvmyX3IDJ
         E15h4gACU12nGT8LrNRtbFcixUz8AsJKPX7VMmD+0aOQj23tm0qDp1g7gxSF68/98tBa
         5WF9srZy4jkdKcapEU99i9BcRL8mNGtZsvrAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679851; x=1718284651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDRaTdfmVls7s4JXTIr052tZZ8CsVVd2h9OYORJYJok=;
        b=hEHl9xmH+Mtdr2PWL7ifYsJkc0SuO6KIwxeWH8Rpv57fRGNOVo5SgBtogpuE0QfQIT
         Lnpjg/261dO10C7FmOkAbcwqwrfl1rH5nDUNxHaJz3hPnxMFkHHqXUkeJFqiMKiU+vrZ
         VoBdo5zFQeWDZDgRjQTo8CVpewBYUH+2chBBRA47hL22iqRtiQhphK3hMvzLhyYSfOw1
         h4tLWcK6I0//HiFggZpVGh2yKcJaHbUyoJL6BxguZGj6hA2TSy/P8jrZyDsWs675b1Ng
         5J43E1fSMX0i6Cm0dEcDf4mx3c8qBOzpLJbvWwo5llrg4mxSqyUFxleIDYDIonWewbqV
         MP4w==
X-Forwarded-Encrypted: i=1; AJvYcCVD9aKoNc7Y5Wvji34YyQCh6ZP6ksbgbgAq6GQVlRxwb0r9bFP/cd2nt0F9YUHZVtMH8fmRgSIXeiJH8e9W2VvAIhk+Cgzefbr6b/UnXw==
X-Gm-Message-State: AOJu0Yxvyb+4Vet2/wE9EkTGNVOmeeMTyKC9xDNPJLT0bS2Q2MdvVgGF
	u2wMp5SaSDul7O8NPBWj0Kojzlvloo3MfKZiYvPRudphqeL0Q8/9c5RMPYfBXfmhDn3lErVbvU4
	q+c6V
X-Google-Smtp-Source: AGHT+IElHMEsqGGHpqcblsnwqqLDX7sT+d+kcozCrmBwpsokQJqPWqYJMIGR5jCeUabczgf3kJPYpw==
X-Received: by 2002:a05:6214:5505:b0:6b0:3b5:17c9 with SMTP id 6a1803df08f44-6b030a3da36mr80057696d6.39.1717679850970;
        Thu, 06 Jun 2024 06:17:30 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f6607f5sm6118036d6.31.2024.06.06.06.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:17:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Jun 2024 13:16:36 +0000
Subject: [PATCH v4 02/11] media: venus: Remove unused structs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-cocci-flexarray-v4-2-3379ee5eed28@chromium.org>
References: <20240606-cocci-flexarray-v4-0-3379ee5eed28@chromium.org>
In-Reply-To: <20240606-cocci-flexarray-v4-0-3379ee5eed28@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
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
2.45.2.505.gda0bf45e8d-goog


