Return-Path: <linux-arm-msm+bounces-20654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2C48D0F17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 23:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49542B21E4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 21:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979B316A369;
	Mon, 27 May 2024 21:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fBlJkwZh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE31169AC4
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 21:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716844145; cv=none; b=EUYf71z+FKQdTOAITqDg+L1+IPIwUFUjZ+VOThouxE+FOy7xGDBxzceVf2hgfPYyc2EOS5q/j9QlZrZqUzrni/w+yUd2JOeo+aCeRJLTEBYk2liiMXgv9hd/9t8XkRPmJUpReKqX7vvWDSGEDsOSzx7kTl+UWAYlCRMNY2XKpmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716844145; c=relaxed/simple;
	bh=AtfV+7qKa8OYd7+oqo1EiuFIlY8JnCQ5vfZJ2LNqz98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jrwnZNRqtD9HVU2DWClDqckCGRNX4yl92jBGIp1LrGXlvJDOI6vDCcYx5FQhzfD1Nk3aSMPvXyT9ixIpDAkVSgTICczFm1IkhZyRaQEsgIrFMVBHi9bJfYaB/5YaBVv1VHE+3IU3RTwoW0KHwFqRWVVhwhi9Tu95YLdbdGzGbOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fBlJkwZh; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6ab9e0a4135so24780076d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 14:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716844143; x=1717448943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=entYDpzpynGnajXkQLwb6P9rzIVA7SLTRgQ0ZRMWf+M=;
        b=fBlJkwZh03cfC5EuqOptoCFI/qOBKHLf57iMcVRf5YIlgO9EpotNdgRxXXIafpjPT1
         Bz24nCxWikNlyaaih1ioFP4PakP1OSr6kJefHsV40QlrBhtjZAsqr2q1MJ45I2l6KP6t
         6TcwNi5vQdwm2kuOPT3Wkq31WLrahr0DrBVqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716844143; x=1717448943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=entYDpzpynGnajXkQLwb6P9rzIVA7SLTRgQ0ZRMWf+M=;
        b=mfhMORx/MNSuutLjqGX78PxpdqyJbYG3qcy8AbNGkzwkVqM2V/ULBhuiogyZ8xcGMM
         MIxiE/RGQLio2jZuoQUikzsL2beqwGDhnLlOVNnlj18wpKLky53XoJnJ/0oQhfNVySDd
         oUtCZ94Mu/bXq/DeaM5pWkC7xpMPbN1ZA6sCJit5KHcb6OHwRBhp28rfyFjBSgQZ45oy
         I0qEQSGzpuVMoc8VMqqcma3I1Sv/g51nStI/Uw9Gs6OSdKODyC9usGBb2hjY803atOh4
         dBtKc0NV0gP9/VN5FOkEvpd3/u6/kwi3N7Ds0lUTfge+ZE9HRDolBuEdMw4ssqLK9UXw
         aMCw==
X-Forwarded-Encrypted: i=1; AJvYcCWRIx8U9rgPR9dduV1D9hv23OYXVmNCRshDWumdp+U3Zbxnv0sst1JhPOK5DnEpSkY+GyMCOAXG1/xJwcr5MKUZXT3WYS5CU7lXWwpKig==
X-Gm-Message-State: AOJu0YxKzrcmnq5RjU4B013HYJmm3KTqDBTkYnl0UZzQECT+H4tw6mCX
	NBtLYHJFQuqQWbTnayfg/Hd7azYbuFeQ9YV2ASdjGy6NOGgvZ8YSH6HA93Csdg==
X-Google-Smtp-Source: AGHT+IGRTkEFJzLLbC9/MtoTsg0EW+dVQWuLn/GRcDLGaCVnhgLZ5sKm7tGGTDdrZIg9lepBsZ8a+w==
X-Received: by 2002:a05:6214:2b0b:b0:6ad:7070:4e1c with SMTP id 6a1803df08f44-6ad707059e8mr106586636d6.19.1716844142698;
        Mon, 27 May 2024 14:09:02 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad850a6dc7sm9511866d6.93.2024.05.27.14.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 14:09:01 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 May 2024 21:08:58 +0000
Subject: [PATCH v3 08/18] media: siano: Use flex arrays for sms_firmware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-cocci-flexarray-v3-8-cda09c535816@chromium.org>
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

Replace old style single array member, with flex array.

The struct is allocated, but it seems like there was an over allocation
error:

fw_buf = kmalloc(ALIGN(fw->size + sizeof(struct sms_firmware),
		SMS_ALLOC_ALIGNMENT), GFP_KERNEL | coredev->gfp_buf_flags);

This change fixes this cocci warning:
drivers/media/common/siano/smscoreapi.h:669:6-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/siano/smscoreapi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
index bc61bc8b9ea9..82d9f8a64d99 100644
--- a/drivers/media/common/siano/smscoreapi.h
+++ b/drivers/media/common/siano/smscoreapi.h
@@ -666,7 +666,7 @@ struct sms_firmware {
 	u32			check_sum;
 	u32			length;
 	u32			start_address;
-	u8			payload[1];
+	u8			payload[];
 };
 
 /* statistics information returned as response for

-- 
2.45.1.288.g0e0cd299f1-goog


