Return-Path: <linux-arm-msm+bounces-28491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D6E951A1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 13:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 051792845F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 11:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BDB1B1513;
	Wed, 14 Aug 2024 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fAlj16hB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6AA1B1418
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 11:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635575; cv=none; b=KMkx2LLzPy3BF5XiRsAWzyNlGEw6p4yD7BCPUrY0A6ydbOk3Hp/ZLjovOlwkBP00gvtZyrABWEuN0dwwMcWyIjXI22fa7At/29kNGXlW/Y8Vbsk5lyQnfe/AVZKAiGsdLXlIlEsnNte+gmRUx6JI6wRe+feR0CvSCAB/g15Zo/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635575; c=relaxed/simple;
	bh=vxzbkABevUmcO8zo0C7ffTq3vZBZQCpob+pP/oWgid4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XX2r1VSHVX5lHpkkpjJb23p9fHh8GQgfKOjxMtd15+Co0TTAzdYx3S3emF9fweOpZVR2xh6m8CZ/1BKuZg0ldLRSFEAwHIf+/p/X+qACZaqO9L2nRGuGxvVXpUc7lj2H6pBspvd7Q2ckDcmo/i1EhyxnBhLngwCC2ESj8oGmaSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fAlj16hB; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6bb84ac8facso31611966d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 04:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723635572; x=1724240372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MENOIHt7duNVXQ/OhDJTUUPml/BdyniF1Xogw88blA=;
        b=fAlj16hBsT0Zg4mNV7uEnToGIC2FYF0XBYbGOjc25B9h+iJLFIHPmM9Wcb0PLZP65M
         DR3EkwSs55xyKdDzLB6ytSsdNhJEFSh+qnIMLnITU9iBJbEUL6I9+EG5aE7xwxtS2tDT
         vnMX2ZX6/CrNN4FktPtSEU5GGiNbwsIBEc/50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635572; x=1724240372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1MENOIHt7duNVXQ/OhDJTUUPml/BdyniF1Xogw88blA=;
        b=rUHCmY1UZAgEcKudTo6TujmTzqTEoz7+Xk67Hw0vdS3+5xfbMPJUyTSUEq3fx+opg3
         XLpRRGdavTkpW5OM5xpbCeS9e/q4gYykWWVNovVO2PwBD5rGWrmQsDl8GrYLdjtq3kAB
         9wN7bh08FyHe86KY3Dq8dEq9wPyk6SlAy/WmNiSakM2if/uVyye/XiXklZiPndl6Jl0S
         nFGyphh1ZhW5KtFNbODxDcpkfbZDifmjzW3TLIiV3p+WHEVjF0RbFeGaDCxDZLtJeA5K
         c4UUhlNvHmi4jhI69dN2F6Z1CH6vKHJsf34+LiCzAyirRGA4rVTCu1tD1vSaS68rF9Xk
         FQ/A==
X-Forwarded-Encrypted: i=1; AJvYcCVFvgCq23uob5m2zh/hGwxnFUuRXcieJp5TPEZHouUyQAwX1CVjN+aYWpM0nzQHm412b7ROHNgqrNMABNhWM75ZuVv+UgFPPV4S6w9ZMQ==
X-Gm-Message-State: AOJu0YyDSerzUbwKaLcEyJsmPVvRYgySRpwN5Z5l/I0rPMvd2beSnR12
	qtTPTmu0OIXpnvxvO+pmqRZMfliGnsoxAq89i+naqbcyDxXKi0CMXidLO1pQhw==
X-Google-Smtp-Source: AGHT+IEOOVmvcPoN/8++vzKRrLZToSjJo3+FaNbM1KRubLyRDXu+jabIS95Y0MPfG5GFa5XUFcn82Q==
X-Received: by 2002:a05:6214:3b82:b0:6bd:7373:8c8c with SMTP id 6a1803df08f44-6bf5d1c492bmr28595046d6.11.1723635571850;
        Wed, 14 Aug 2024 04:39:31 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82ca0daasm42167916d6.68.2024.08.14.04.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 04:39:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Aug 2024 11:39:25 +0000
Subject: [PATCH v7 05/10] media: venus: Refactor
 hfi_session_empty_buffer_uncompressed_plane0_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-cocci-flexarray-v7-5-8a1cc09ae6c4@chromium.org>
References: <20240814-cocci-flexarray-v7-0-8a1cc09ae6c4@chromium.org>
In-Reply-To: <20240814-cocci-flexarray-v7-0-8a1cc09ae6c4@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The single element array data[1] is never used. Replace it with a
padding field of the same size.

This fixes the following cocci error:
drivers/media/platform/qcom/venus/hfi_cmds.h:163:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index b158fcd00dd6..01f5463e0fa2 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -168,7 +168,7 @@ struct hfi_session_empty_buffer_uncompressed_plane0_pkt {
 	u32 input_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_empty_buffer_uncompressed_plane1_pkt {

-- 
2.46.0.76.ge559c4bf1a-goog


