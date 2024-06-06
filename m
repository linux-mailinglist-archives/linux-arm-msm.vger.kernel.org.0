Return-Path: <linux-arm-msm+bounces-21936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 830F48FE781
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 15:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E84941F21836
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 13:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2AE19755B;
	Thu,  6 Jun 2024 13:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ntd/dDPP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE1F197539
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679861; cv=none; b=QbI5tRXN4I1mragSFc//4cLFWIGlRlIkrreROODHDpK7fv3MsIkQkYUD8OqJ9Z8Mvi3g3Rkn+C7FitrTbGxfkOB7aLcopZ2VlitD+XWwD1SjwdWcouboo1sMip5nnsIUPCwpSxqqZoalGKEMfTFrzXZk3TcD0rWer4ApleCBkg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679861; c=relaxed/simple;
	bh=rr+ZAD9eEY9wxQwSyBHAujNTY1n691T+07WEbe4AI+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UdnE40hMRf+igAzT7W81Y+i9BEYmYdGj+nGe2R6+yCDxvbw8ZC/Ko5n6iwjxbPAQzA6T7c0hWgHSIOOneYp5dqUDOhwyNZ63YlZ1s//5Gq1l1WdzUZ1kJHUuYtL3aBuckwKdLcPwvY5JDQ7pO3njmJZzRXcJWCjTFvxDGacMQUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ntd/dDPP; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6ae1b32752fso5008596d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 06:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717679858; x=1718284658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rV++zhXkLm63xkLNQev5FMXGRPhSAuf2+6p1s7sOLOM=;
        b=ntd/dDPPjOuAXrysYvbBo83QdWpNwlilfdrgAUQYRbdE0RAfoenU+qfyECYt2/kU5r
         4TStcYC0Gs8kNraSTw6Fie4A8jMmytxs6UO4DHIJDDCdQgKIsqfClLQkP6jtmko+q/OV
         A73vOxGemKnuZQYGGsJ8PrIZ3h6uygmC/JDOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679858; x=1718284658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rV++zhXkLm63xkLNQev5FMXGRPhSAuf2+6p1s7sOLOM=;
        b=penetugDUdaGn214haf95Y7FiUX7rl5hTJ+J9aLp5RMh0HWasW/VsJcmmF6zBE0+a9
         Ohf2wf0D6jfJ/Fq3czPScr9r5wKqo1l3uqotF7aRyBIhxJIEhJ2lm1R0ZTmx98wD4t2p
         YttRvQgngDqR6ooe1jEUjxg/6i5ZJH6HnjXbdBlA/Kf2sTv+rXjXwfEScJpP2PDrurly
         ++nGU+f+SzY/tULJ19ggEwMmY5NZk8yVuhgVEg5NMdJvNu84xHz+Ga2aXX6Iam7FHZi+
         SfVBMozpXL7MzKrcYuAME2GI4jWD+83ro+8/kMSkAhWZ6tEyaDhl3WMZuMPhoRSZPgJM
         YOhw==
X-Forwarded-Encrypted: i=1; AJvYcCXrAuhGPyq+/xQsGTQVMq7usW7Qyo6+2+RuWFMzacYNFViCtEHIgcK44HkxJCJIQVwqhEcls3P6Z11RR77g/PpKOLNmfPpS98y2sKkRSQ==
X-Gm-Message-State: AOJu0YxBnVeiqRIsM2/JXXqYnmYQ4qn6lxpNKO/kYg3BfHkgEa4wD7EK
	X1BjUDhfpIh87GiIXHgv/G+Fb/zKUHJGCT4aVM21wvlPm2JKB8QOVs5M2FpzUA==
X-Google-Smtp-Source: AGHT+IFEbhMVQzLzMehFBZ5O1a5UQYgBDvAL87jiyZxeXK49H/vAmDrzba4DetgTJ+cq2bB+dcgNzQ==
X-Received: by 2002:a05:6214:3c8e:b0:6af:b8b3:338e with SMTP id 6a1803df08f44-6b04aeb2647mr34544096d6.53.1717679857474;
        Thu, 06 Jun 2024 06:17:37 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f6607f5sm6118036d6.31.2024.06.06.06.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:17:37 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Jun 2024 13:16:41 +0000
Subject: [PATCH v4 07/11] media: venus: Refactor
 hfi_session_empty_buffer_uncompressed_plane0_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-cocci-flexarray-v4-7-3379ee5eed28@chromium.org>
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

The single element array data[1] is never used. Replace it whit a
padding field of the same size.

This fixes the following cocci error:
drivers/media/platform/qcom/venus/hfi_cmds.h:163:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index f5708fdfb197..8768ee052adc 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -160,7 +160,7 @@ struct hfi_session_empty_buffer_uncompressed_plane0_pkt {
 	u32 input_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_fill_buffer_pkt {

-- 
2.45.2.505.gda0bf45e8d-goog


