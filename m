Return-Path: <linux-arm-msm+bounces-23053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A9690D354
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 16:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3139B2E41C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 14:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F44716DC2B;
	Tue, 18 Jun 2024 13:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tnq1i92+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5999B16CD0C
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 13:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717880; cv=none; b=qFTw7ddZJDdkn/vedpx/2bovBR6K2IXIhv7VIgL47O7Yc8wQk5X22O25M1DWU+loIHXvuxvi/d30WbB6f47e2h0S6r1nzngw5uvw53cKXL/FdwZ4GmHAVyoD1or6EuHArDNUxzcVzVV38kUwnkCFOQxMhGeb5y2Nvq0Sqpn1eto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717880; c=relaxed/simple;
	bh=REbIhZEglYBHgb7HJlMZ2r2p8w/k8dfgexAVenpfyQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nxvMqCsBMR4NB9WwWSu43WNw7VpxRqijlSMwq2ZVnMgbUAH8d2UuMiSJQg90aHbrVZNspCy3JS11AV6UlgbWhLJK2tBa1X9W5i6Pu9nKPcVG6Li/D3RVIs/0GQ8w3A6ZBQvg9/oBqrCscBrxvWVNf47D7SBkTmYIq1fXy+fuxOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tnq1i92+; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7955dfce860so337923785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 06:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718717877; x=1719322677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1nLEejg3OHGtJ31ylvTDCmBSO7HiCAKQK04IWdzamU=;
        b=Tnq1i92+KnHk0CCFsddSU200F1hHQ2BkaVO8D3dkBksKv1jDl1umQ9/o51sHqlNlAm
         ku5vPJ0suCEALBDIm4LeWga/3CwmpJA83pcvarAPbFNLLdWukIfp//wLl0ZXrxwZkNZ5
         hCDs0jCUnbrMlO/vQW3PsZeoa4qBB2wXQwP60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717877; x=1719322677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1nLEejg3OHGtJ31ylvTDCmBSO7HiCAKQK04IWdzamU=;
        b=FHsr5OUchxPms/r2gPYhJY/REDQ3fFNa3u9S+5ZQiMEJWyhDzx0pY64GdjH1Ga6w8g
         MavypWhrV4Wkrk3fvcVsxeLEKW9hJXJP6Ax21v/3b61hdMNcCpeWzr0RP+BaMa2U6l2o
         U1cRdW2rZKdLOqnt75e7bGJjB9NQg9nedDpzrHk4P32PC4KGowgN1sD27r3fO9ANznK/
         RZ7UhWVGqkUC7JBi9tdIC5VNo4EVlzNnB9ZUbL1R4OhcwLo2DOsQ0YdPcYll5O9FO/EM
         z4WIjREEcIN9ct+Inay8YfFx2ro+xfmuRE26SM7g3WloHwya+Dff3MrmQXfeI16iXDop
         LiTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLtGi2Dc0mIDnfrVSJNcO+3ldF5ZXks71CV9DGu4vW8cMeyylGtVgI//ZkIPAZq1uO4646J13Ep3j9OeAakUDhSLR00Hic7TDd1W/mkQ==
X-Gm-Message-State: AOJu0Ywlc3YjHVmu5Hx/gzwdqR7Cc7mK9UvW8+yEun7RSro1+coouqvJ
	lPf8+xJUZTvtvuA9n+w7CRyD13Iq9rP+Yead3U6hXauuHXYsUhzYVxEI/ib0eQ==
X-Google-Smtp-Source: AGHT+IGjdUxmekTm73uUT+ZjPzTRtV+1glujlLe9BtgDyl3oT+EM2OHrXsRD2H0jaRmgr/dPXg3V0g==
X-Received: by 2002:a05:620a:298c:b0:795:575c:5bb7 with SMTP id af79cd13be357-798d26ae16cmr1247186685a.74.1718717877269;
        Tue, 18 Jun 2024 06:37:57 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abc06e93sm521666385a.82.2024.06.18.06.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:37:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Jun 2024 13:37:50 +0000
Subject: [PATCH v5 07/10] media: venus: Refactor
 hfi_session_empty_buffer_compressed_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-cocci-flexarray-v5-7-6a8294942f48@chromium.org>
References: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org>
In-Reply-To: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The single element array data[1] is never used. Replace it with a
padding field of the same size.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:146:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
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
2.45.2.627.g7a2c4fd464-goog


