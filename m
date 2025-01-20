Return-Path: <linux-arm-msm+bounces-45624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 971A1A16F9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 16:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D7FA1884D3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 15:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D7C1EE029;
	Mon, 20 Jan 2025 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sThvMp9F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCC71EBA18
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737388032; cv=none; b=S4mnx4YmLZtkqM/x8KSMKGU8UsTBOB1GPkxrjxNqrrLldUMN4ZdQ64//PPk+KBd64tdVq2te2uGY3Z2eaEwtlS/nAy2oJRMmPFglgHA+Z6Pa9WfQGZucnf7cxZT2zN/hcu7SAmsIiU4ZGIKLU6OiOx+ifmgrTw/lN7FxNvHm+jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737388032; c=relaxed/simple;
	bh=Tig4b8DwHn6GPDd8+yeRD5jWv09mdXQjJnOdhHhToro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FY5lYQXAqndDgHzUnrpR7WH00btgA+4OBOIRkVE0gWrlNW2mJaiHK3bEfBJKAIp7+ZRe/UmXBFjUnLGGh+QBxqvQPsv4Wmo7bcHb4vAw7nAA6SXAYgQgosTN9u11w7+sW31G4zvsp3ZjeWWhO4u9Evqv+4fgcGcUSrzqGS6Jqpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sThvMp9F; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso35161715e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 07:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737388028; x=1737992828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfwTMT+W2gawbofsJjieWy7Ovl5Yn41GdLM1z438F58=;
        b=sThvMp9F+AsADYw5hk4Iah5HKjXyjF8cp1Ht584oGI2SG6qdCX7Mcu7cEWYMjymc++
         hOD2A2bsp51r5g47u7cVb0iOiWNSy1m/7a3B0LQeGieI4vGWLIwp2ZrCIXdmGoQQhWiz
         X8TBRmPExk+qDzFqRInA4TTOgJfKMdW0CYaiujDFJ+1w5P2r7eZb9vSkzPIzDm5EYeNJ
         KxgLGK4dobBRc0JLl+BbrpmpZllf6ozA50dY+bUaOQTjPKhh3AQ+EZzKe7pPpJ9y5wjJ
         BvQaYE19KOZ0D61Jauq5ofEiutZOuI3gVXEErC7RoX6kgDf6jVs/JAYGX0n+K0rZQ3v8
         tEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737388028; x=1737992828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfwTMT+W2gawbofsJjieWy7Ovl5Yn41GdLM1z438F58=;
        b=rcejpV8YNyotE/eXYDDtt5JuAubeUefRGGQ132vTh3QEb5P9GSe/K2MWnYjDuEMHW6
         3YYyzRo2i3sVTmkBgK7DaLGRu0rO20VhfELJaCRmrydn5UBqJ7bbb8p/Age8N7aTs8rz
         +fF1nBuH4WGDyVbXu+9icPEYw8Ap6Qx83RqjMj+sJDUUe+8Mcipdrmm1k6qvo/6zcwKz
         fshcTXVa2KPLnnyh3eeUT1u1+g3enuPKsnZuW+R2hTvxJYcT4snfoiiUOj8K6zpFv6Se
         xuNlYEvBpux2QbDk3+76LdsHRddSDH60kfYnyGqxnnFrrrk/poKoQGo7PcrVlrUDwuHa
         msaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa3FmluMQ8Stm1V+WsawQxhfgKGhIFT6kQQDagAjl0Ye2cLME1fQ0pdL0OXiwssXEUKv2e3sT8yM2scTP7@vger.kernel.org
X-Gm-Message-State: AOJu0YwX3W4k/EXYxQ0qHkZdyIj3NwUEenSvHT5lIsi+HSlVfGEtiNrT
	Lxl7FarJRxfu7LwVqEWicyl0BtW5HPuXoDg57N2Qk6stTpRzk/WvEdSKRvVZjQI=
X-Gm-Gg: ASbGncuOXnTZLzedtc9w8pvcvIsW/xYJdZHXQCHekvzAZ+Q9vAdz21iwRl2j4ajivwG
	457Uw6aFx6vl+dt6zq92+Q4hZjfD9dVvkmHh1Nkqts5tCuxqnGUdnoahHaHT00Y7ZZQajUnrocg
	FjcniTEBUFkSsh6aCmQRWgJNfMMHV+lxRCRalfpGA7OMW6GimPREn5aSqdk1G7vHuAt7uJwZUnT
	H3aIlTPZx2bQcWlP+gpx7hAW1GH7GrlclLyVn/yGToAMxOJpKG17xMExBri0SbldF7IuJsq84sc
	PSc=
X-Google-Smtp-Source: AGHT+IHDyBPHjisNwezpUfedhSgePvQdtTP6r1TY19GmwNRwlHH0ZhDlrdbKnpZ73HvGRsSpgZdtrQ==
X-Received: by 2002:a05:600c:4f53:b0:434:fa73:a906 with SMTP id 5b1f17b1804b1-438918c5d0fmr112856545e9.4.1737388028274;
        Mon, 20 Jan 2025 07:47:08 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b70sm10645766f8f.26.2025.01.20.07.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:47:07 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 20 Jan 2025 15:47:02 +0000
Subject: [PATCH 5/7] media: qcom: camss: Add support for 3ph CSIPHY write
 settle delay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-5-44c62a0edcd2@linaro.org>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
In-Reply-To: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Depeng Shao <quic_depengs@quicinc.com>, 
 Vikram Sharma <quic_vikramsa@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-33ea6

Currently we have an s32 value called delay which has been inherited from
the CamX code for PHY init. This unused value relates to a post-write delay
latching time.

In the silicon test-bench which provides the basis for the CamX code the
write settle times are specified in nanoseconds.

In the upstream kernel we currently take no notice of the delay value and
use all zero in any case.

Nanosecond granularity timing from the perspective of the kernel is total
overkill, however for some PHY init sequences introduction of a settle
delay has a use.

Add support to the 3ph init sequence for microsecond level delay. A
readback of written data would probably accomplish the same thing but,
since the PHY init sequences in the wild provide a delay value - we can
just add support here for that delay and consume the values given.

Generally these delays are probably not necessary but, they do speak to a
theoretical delay that silicon test-benches utilise and therefore are
worthwhile to replicate if the given PHY init sequence has the data.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index a6cc957b986e1..b44939686e4bb 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -59,7 +59,7 @@
 struct csiphy_lane_regs {
 	s32 reg_addr;
 	s32 reg_data;
-	s32 delay;
+	u32 delay_us;
 	u32 csiphy_param_type;
 };
 
@@ -600,6 +600,8 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 			break;
 		}
 		writel_relaxed(val, csiphy->base + r->reg_addr);
+		if (r->delay_us)
+			udelay(r->delay_us);
 	}
 }
 

-- 
2.47.1


