Return-Path: <linux-arm-msm+bounces-38207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A7C9D0E61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 11:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63169B292B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 10:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C911991B8;
	Mon, 18 Nov 2024 10:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nfkx0C8P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F744192D80;
	Mon, 18 Nov 2024 10:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731924931; cv=none; b=XZcftuWK9/hQiF6usFQp3uId4ZOt0syTVAB/wFzZs6a7tcPbJzUvpgfhBaHbA/5N9wEVC+2iH6CbWB0G4k10whgGelMKkin3r6LrOTIEZNiDBeuh9R11nIS1+6qD9miHFtogO80A6IbYjMEaief0NkX//pstPrp/1vceib8C1QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731924931; c=relaxed/simple;
	bh=8W/QDRI/pFgdFr7Ezxc1BasTCKDzA984KK3I+7s0VLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TQwa4CW+2fufX1+W0K3aVDcAyQCWKbSGe37+7SQYYysqfmW/djpb7jXBSRl2mt+GbLdNe6UzcQ/Ni5GuwkD+vi+fQnXlN5JNvGU8F+KGQ3hijbo7jypR3mN6YOTfFsV5MrwJ7UxODY5ZmsZ1bUSYKrRZPrVWeSI85bbkw55B6Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nfkx0C8P; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ff5d2b8f0eso27676551fa.3;
        Mon, 18 Nov 2024 02:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731924928; x=1732529728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PdlYOoP7yqq2P4oaMQxpOvCFQMzIToOeYQLgC0CJZyo=;
        b=Nfkx0C8PMMk6DQb3LB3+FsOP5/zhsC1G9zgaNfVVjH7gmeAHzVIiILikMOkfcYLxZE
         TdUdAxb30mptMjSzVBLjaIei6xtZm9ruViH6PPmGv3x7pzEx/CIemKztVGY9e54AJKze
         aa0OOEkTBRPXRQ3JmTt4qfz8BCabqb1QbuSgV9tIztLXv2eXBXnAE05d1lNlLou9Vynj
         JHCPwUGh4vlQSa9bRRLSdZfGBhg8EQRqtcWyOkWiOopgs2KKEa0P9blN6ER23ot6S85o
         AV4SJFZcNvV/EMoeKNCJyD3FPE87m1LGsCab9mRhNASfoFWS/0t/6Y+KRY0ZU9jUIeRj
         zWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731924928; x=1732529728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PdlYOoP7yqq2P4oaMQxpOvCFQMzIToOeYQLgC0CJZyo=;
        b=tcU8IqVQP1nS42sQ9lIWA1EX9Vg/tbqJ1G2cqftJrFMP/WJsgYN9eZ7j2jeQf29rGm
         qVZY+o8atSe0jnkok+p7FOtQkwKpUU1lRaH8NfZ+sZ/hnNChu59IOJ4Xy3JJ8FIQ9iIz
         D5oOH7awjDwYANgvcgzBSczymCM+3rnMVcyogqvH3XipdYjcqs7V2l1filKYuIxVFX2e
         aBoLowPNNdlJT2rvSOpnctk7JUgY0Q3Q/GTivGUJZ7DXQHS9YiARqwPEbnKK1226k8qG
         VRYPxpu7E5muaPjjVYRH5KSUa3CWcpThZ8OW8GhLhXTNSdQnMo3Xhh9myS0shLfKTnOu
         vxTw==
X-Forwarded-Encrypted: i=1; AJvYcCU30kblcg+euf6ZqrnQSOTXBZ8EWxPuJAC2wTpZxB211o3V7pSn7dAnUaS3oChyjIiIU8dZ9YIzMsM=@vger.kernel.org, AJvYcCVnDcwidPceP+PaMmFY43ta5QECZ63yg9yj9jasf4olSLEs7mIOIELvWQU+stQ2xWrJ3SdtmzbRDzKEcmAJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1ecQPyxlEXCAAtAEmxjxPCVhI5ishqbQzcrBuo6hPOpXd/Y2Y
	0qVUIW5zJ2sqPognfCHVQa2zlqN3W+gtJ59qWpcCvgc+8bdxd8XyhyN9bg==
X-Google-Smtp-Source: AGHT+IF31X86GVWP+Clt2uCv6bUhbp4Lagp9DjirvqbA6fXG6JOvtrk3QWp+rMYv84y5zoZ2AgFXZw==
X-Received: by 2002:a2e:8a8e:0:b0:2ff:76ad:f8c3 with SMTP id 38308e7fff4ca-2ff76adfa05mr8586671fa.1.1731924927706;
        Mon, 18 Nov 2024 02:15:27 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cf79bb329bsm4574455a12.38.2024.11.18.02.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 02:15:27 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 18 Nov 2024 13:15:19 +0300
Subject: [PATCH RESEND v8 1/3] clk: qcom: clk-rcg2: document calc_rate
 function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-starqltechn_integration_upstream-v8-1-ac8e36a3aa65@gmail.com>
References: <20241118-starqltechn_integration_upstream-v8-0-ac8e36a3aa65@gmail.com>
In-Reply-To: <20241118-starqltechn_integration_upstream-v8-0-ac8e36a3aa65@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731924925; l=1308;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=8W/QDRI/pFgdFr7Ezxc1BasTCKDzA984KK3I+7s0VLA=;
 b=xpje1GiGSoSVFqVAKU3AA0cySWoAqL0mlGxd7c7RO4nWm30k+YexCeyNsXyf2iRcRxsnDDrWn
 xaN7fmxW1qYDcYOvjccFKwOChtVaNrZ0ZnmP0bcJoSTHgp1eUqrUF3R
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Update calc_rate docs to reflect, that pre_div
is not pure divisor, but a register value, and requires conversion.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v8:
- format kernel-doc
- test with scripts/kernel-doc
---
 drivers/clk/qcom/clk-rcg2.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index bf26c5448f00..b403e4d6dcdd 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -148,12 +148,21 @@ static int clk_rcg2_set_parent(struct clk_hw *hw, u8 index)
 	return update_config(rcg);
 }
 
-/*
- * Calculate m/n:d rate
+/**
+ * calc_rate() - Calculate rate based on m/n:d values
+ *
+ * @rate: Parent rate.
+ * @m: Multiplier.
+ * @n: Divisor.
+ * @mode: Use zero to ignore m/n calculation.
+ * @hid_div: Pre divisor register value. Pre divisor value
+ *                  relates to hid_div as pre_div = (hid_div + 1) / 2.
+ *
+ * Return calculated rate according to formula:
  *
  *          parent_rate     m
  *   rate = ----------- x  ---
- *            hid_div       n
+ *            pre_div       n
  */
 static unsigned long
 calc_rate(unsigned long rate, u32 m, u32 n, u32 mode, u32 hid_div)

-- 
2.39.2


