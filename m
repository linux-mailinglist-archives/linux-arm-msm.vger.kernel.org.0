Return-Path: <linux-arm-msm+bounces-20661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E728D0F2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 23:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F30C628358D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 21:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4C416D304;
	Mon, 27 May 2024 21:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Et8YXUpY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E7F16C844
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 21:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716844153; cv=none; b=Wys5yVrTQKZm700mjKV3VLIVKVCbHKivkeXBLp8WGSlvNEosfUElLHJOgPVgOxpwn3eHB8wLhq8xzD9rmtGnrdwOLzGjkZQE3GiHAv94OySmiEc2KYRo+J/AiRC5TmO2qwvT17ZbQMo7JQDbLeUQwlQTyRhX3VKStaOLUaPKl3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716844153; c=relaxed/simple;
	bh=hodq+gCLyqsJ1R1uHGMq0ldSTiTA2zY9HKvfL0U27m4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ksjs080eRWNLOvn42dwKymj62oVVYHj8DxhfyZqhDXOm63o8wUWqiE0/1WcoKQQovnGawc+/1C2hxM2rPOdJT0dtUWuapRRzSSqsXR5y7JPLb62wMObXkvneB8pcXcjCLD0q4+nj1ETUwwS19tOUDQZg4EMwGOnKAtaAmDt3ZNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Et8YXUpY; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6f12ed79fdfso124452a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 14:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716844150; x=1717448950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BUOU53Y/Qs7SwrH1hNBNdnMNU1q19wfN3LEF6XYAR0=;
        b=Et8YXUpYRkC+fJnYcrzpCWm5+JBCN4thulctQtyzT1jOAQiiJdcYjjUVXeZ2pk/CUP
         5q8n04dbSTCtnp+9S8w7qq6SRUGak6xRJoX1DnhyQoPs0CNnC4qI7d0g0rJchXGditpE
         KztVGhqBvXNPOteEN3fYneOR7FrH4O5WcdVas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716844150; x=1717448950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BUOU53Y/Qs7SwrH1hNBNdnMNU1q19wfN3LEF6XYAR0=;
        b=GCuSB8OyIreuw/Thc8QHTfTcBuK/HAmZ6idn7LK6hctphLLRfg9jEhwMnockwXlAg/
         ENya2FYLU6yeVjIXbVP7EPTvXMsI3UaFUxmo08fu6L1I1FjsOWYfIohKhithetogrjxV
         EoZMEu6LPFxzxjltoQ9p9w3d3TZNsVllWJq1rymtXpVNemjXrDzngOClBzPfYdn+y+cN
         k3TNOYIV+x34abi0tr9fasEX7Sx4Kqg0c12V/9v/uDzY7MzEJddlIm99liX3oKRWIOjc
         67xIgH6UiS8wGdKSSLg+TOzF0UAVmNFUhLTtwIHkF36O4amm/LQnlImsJICy6HV5A55/
         jTxA==
X-Forwarded-Encrypted: i=1; AJvYcCVeMac+Achj+dGYKETGqgaNWj9mxbx5SdPfkr4lQ7tv/5rZNi7aSBYKtLD5ER4B/vNAyjdKyEFkLjuWGiiWTO3qHtl844Zl2FBiIqyeCg==
X-Gm-Message-State: AOJu0YzxKjs14m84N5An1C1Ibzd56mjVkD/md7PYVW4qBgR2zESDfje7
	BOzew6gJ22scwbA17wFtnuXrkzDArF1aNk7hu/Qgd5IOkajIFWivSswQSHS2OQ==
X-Google-Smtp-Source: AGHT+IGpU7e2bDXtLKHzBuQGg8VU63q3btltKxhtl1G2R0LWEM8uDkQDnfIvjE/wdw2CIfox8IrWQw==
X-Received: by 2002:a05:6808:3d0:b0:3c9:639b:f821 with SMTP id 5614622812f47-3d1a7b30743mr10023918b6e.49.1716844150503;
        Mon, 27 May 2024 14:09:10 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad850a6dc7sm9511866d6.93.2024.05.27.14.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 14:09:09 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 May 2024 21:09:05 +0000
Subject: [PATCH v3 15/18] media: venus: Refactor
 hfi_session_empty_buffer_compressed_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-cocci-flexarray-v3-15-cda09c535816@chromium.org>
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
In-Reply-To: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
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

The single element array data[1] is never used. Replace it with a
padding field of the same size.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:146:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 8768ee052adc..2c56ae303989 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -143,7 +143,7 @@ struct hfi_session_empty_buffer_compressed_pkt {
 	u32 input_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_empty_buffer_uncompressed_plane0_pkt {

-- 
2.45.1.288.g0e0cd299f1-goog


