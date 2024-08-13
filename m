Return-Path: <linux-arm-msm+bounces-28385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 168D395050D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 14:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C66F4286397
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 12:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A9D19DF49;
	Tue, 13 Aug 2024 12:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q8wI0bX5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6C019D88A
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 12:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723552297; cv=none; b=X80lvFNKBl14gjCZX9sX76VtMblv3nMyzQG8A/UIecNZf6ug7PNgKz1vnCYVYeViZhfrlsqbntokQjlzYDQJYhA5RKTBF8Th4cyq7dssxYI3YGfpuVP9Sq/DEM6s1IPc/BFSjtWh6sJzBQ/ERFN19K8j9EDgD99CwdTgrjRwXJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723552297; c=relaxed/simple;
	bh=KWjKLHgDnVqj5qogv7pkiKcxHSFjMmLdRbW4n/wiXWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NcOGFBGjsEIZivILAFVPs3UWSi1rsPHa2y5cpmOCG42iXOYgqCPN1jey3mvgYzWJ95ggtB7gIHdnUqHvVW/Q6qF3qod0DyWx9EFBSJWp61T6/rcO5hUKNs4zvQ6m5AVTOZQQ+sg58etkpqss3tMg1VK/0HkUS38h8pE/LCgDIMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q8wI0bX5; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a1df0a9281so342916585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 05:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723552295; x=1724157095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCqo6e1jk+3zjFaKrik7m1Dhac+Vev7BPrVsdbvmhKg=;
        b=Q8wI0bX5l+W0rWrd3rq70xPMWjCBOlA/3lk2hyDcEa4JLF1d2BO2DO6qegmbdPH2Tt
         AedDy5JAdRU8RaQLOJq6bRTGqXzgnWO+Q39w7w1pBxsABfyHU+yozJ5MEmOFxnHBrsVe
         kgvH4jhSB+PrF0Ujvj7AfmhAX2QFK3bHkcXPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723552295; x=1724157095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCqo6e1jk+3zjFaKrik7m1Dhac+Vev7BPrVsdbvmhKg=;
        b=th5fBgG1kNmEv6TjcS1I1xuvUCwZFmIN3xjntCcy6Ut1irA0vSl0R9//Usu6Zvcb9e
         ePE/+dWwNbBD079Lh3iUJnqkd3u3mWsGpFPl6dVRY4ipxJOG90yL+Kqh3roRw0koxKbK
         /ivUPB+u9QvriAqfndDmkDawXuMVwHP/ZRUdvROpB4qL0dOIWsiMVVxeXt8xCw9ZWutw
         iueWXoymoMVPgo50FhPQSr/v5vK2SZHfNq4LisStI3r6wsyY+kyD0+B61d9GIQl+KDQZ
         o6M9fS9R6oFcJWkR+N708W50lz55ugxZkEGKrSZwFN4XaCJMWV6pg3QfCXchaGIEs6z+
         BxgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgeWJ7cwo454bnuZxrChhaWQDWTdxLxsopH+sH9kSud/MqhC2kZETScxMA6kj1FuWi3OrUCr/8Y6Jx8+0nRbto/Eh8HO5y2JfE5U+d2g==
X-Gm-Message-State: AOJu0YxnoUd9LSEIymgqq6tAe2X1Zgxz4LjEp8KkL92gWMDUA99yA1Sm
	rnRKqVtKcw+mFC9DzH7akKVxSdIz6k+SFYBPoFCq2lE4bktmoWR4rvJqV61rnw==
X-Google-Smtp-Source: AGHT+IFSZcI2vQpbzSHhDMPF2LKB1Vu/we5Q43H8Pa5hdUliwBEvSfJGRA02XPjhL1KbnCoICuSCOA==
X-Received: by 2002:a05:620a:2943:b0:79f:18e5:f730 with SMTP id af79cd13be357-7a4e152c430mr331382385a.28.1723552294730;
        Tue, 13 Aug 2024 05:31:34 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d66093sm337126685a.12.2024.08.13.05.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:31:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:31:28 +0000
Subject: [PATCH v6 08/10] media: venus: Refactor
 hfi_session_fill_buffer_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-cocci-flexarray-v6-8-de903fd8d988@chromium.org>
References: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
In-Reply-To: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The single data array data[1] is only used to save the extradata_size.
Replace it with a single element field.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:175:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c | 2 +-
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 0a4de8ca1df5..3ae063094e3e 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -331,7 +331,7 @@ int pkt_session_ftb(struct hfi_session_fill_buffer_pkt *pkt, void *cookie,
 	pkt->alloc_len = out_frame->alloc_len;
 	pkt->filled_len = out_frame->filled_len;
 	pkt->offset = out_frame->offset;
-	pkt->data[0] = out_frame->extradata_size;
+	pkt->data = out_frame->extradata_size;
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 615ac8d156a5..63b93a34f609 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -198,7 +198,7 @@ struct hfi_session_fill_buffer_pkt {
 	u32 output_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_flush_pkt {

-- 
2.46.0.76.ge559c4bf1a-goog


