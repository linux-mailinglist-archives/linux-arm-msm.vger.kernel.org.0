Return-Path: <linux-arm-msm+bounces-32556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C399871AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 12:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63F2C1F218D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 10:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8101AE842;
	Thu, 26 Sep 2024 10:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbONMyJ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3F01AD9EB;
	Thu, 26 Sep 2024 10:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727347128; cv=none; b=Pana9wFTSM4XkZDhl05Dbc0+0tTlxl4Np/HOwvS75qxzZ62y0nCTKXdUBI0miN6dWvVRn5+mRQ85VVwQQRK6ba05/qz3dhSXTneWohDmwofmSMX9uUsx4LU8b/S6G6YVG2NUeTzaoozo0v9ZDIa1+vEJ05t9ttNtRyuLNPmww4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727347128; c=relaxed/simple;
	bh=cU9P4qzHC4jP9o3v4wIQ+UaeV1Ek/oCy3Sa5T8uuL30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eq0srcx2aGMVNCMjGtSAJEh+vAZHYCGhLheehKSPEQ6EuRh+2X50wTe4OHZJWgU/6zauBMBvwJvaZ+cBfIpk8NNYSdIIoTQNd6v007W6G4l44eLDWxR4YVfoqLysZqJuOGo3VxdJPipKRtIFSbyrUt+WSe6gjb9V8xwcKFc2TJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbONMyJ6; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f75e5f3debso7382201fa.1;
        Thu, 26 Sep 2024 03:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727347125; x=1727951925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXV7innKMzJjCsw3L4AU06wd569JCGXLkPWGw2m6iWE=;
        b=QbONMyJ64Jtxa3m9EIoZ8BD9npxi3nZPTf0cZc66vZdGd/JPkj9Jaf+rL3rX5katn3
         sqmGDL+6L46iG9YIMeCo3nnXs2JdEcOFdixhB4ax3RqIaRA5l0GRW22w11gV1ibyet39
         ZcMF5MFZdEHRUObgmzjXdEteD/HIhN6Y2rOapLW5CSt8+3H2SI6w+JjCliTUJIv4/L3W
         b9XS3E/lxlJ42qhJl7bDfR5J+5npqvS6KdX1/rH4nmverWYDIydOSOUkcqCuZ1xoE6dy
         A3C2Fo0UVQtDJ5zfaTQHE6sdI6XWwQrO7l3xmqYc42UlijFGMzDHNWNcp2spcCgRj+/a
         UjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727347125; x=1727951925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXV7innKMzJjCsw3L4AU06wd569JCGXLkPWGw2m6iWE=;
        b=FNpJi+TfxyuZV7ZS+W/Uvbk6hKVSJLKDY+sdKR0dIIXl5DyOm1pgRVPOasKW/kA9W4
         kICttpEN/8GC4+9l5kyYT9OH9196KRvKQ+RTnN4fXfOQWDGPNTDjJHWo4v63FhE54vyW
         zFGGkCpkPkthfEBfk5cIL2ovUKMGOzBkN9fuzkJk7eDJIukqX7BN4bSf++oYL10TupqY
         1OVlAhpPHs3swhaAGNk+VM1+eiIawI6WhKht1akMJ9A86DUq2MLHgp0MlliyBLq4NX05
         TrxSqBMDD48sVgNvJoqboD4uj140uvACnAS5r3Kjyrpb6/GfMVLlPVI9i29ZW2B0l+Rt
         yHaA==
X-Forwarded-Encrypted: i=1; AJvYcCUciQD4uVNxQPVV55X9rVuXcEXPmsWJHMcZRCr1IoivLSrY8q5U/OVcmtmb4P88CVJDd6vMWOmPb8s=@vger.kernel.org, AJvYcCXkfze3EiT8Z3AHSqnLGJJOURPxrV6NXMzJRJWWik6QuOqzLZoj9MhLKTX8hhAgozphXfjJljJxAGr2fK/b@vger.kernel.org
X-Gm-Message-State: AOJu0YwsYfV0iCHN+sQujxQtpyn6jad86gxvvQdaWggJD4hESVHvrJme
	eVAcV8eAvan+Wzl9SpUPLXD3GE3r8JlWGiCM1yUuJ7rqexrxiMdp
X-Google-Smtp-Source: AGHT+IHqq7HAndaVicSzhcbSS2gvRRgmsZL6X7XvOrIM5G5fxL5+ql5X55gxtU8HHpG0Y7PjceBIbQ==
X-Received: by 2002:a05:651c:1991:b0:2f7:56c2:7288 with SMTP id 38308e7fff4ca-2f913f5201amr40260371fa.7.1727347125023;
        Thu, 26 Sep 2024 03:38:45 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by. [93.84.1.20])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-2f8d289ee94sm7863791fa.120.2024.09.26.03.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 03:38:43 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 26 Sep 2024 13:38:15 +0300
Subject: [PATCH v5 1/2] clk: qcom: clk-rcg2: document calc_rate function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240617-starqltechn_integration_upstream-v5-1-761795ea5084@gmail.com>
References: <20240617-starqltechn_integration_upstream-v5-0-761795ea5084@gmail.com>
In-Reply-To: <20240617-starqltechn_integration_upstream-v5-0-761795ea5084@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727347119; l=1073;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=cU9P4qzHC4jP9o3v4wIQ+UaeV1Ek/oCy3Sa5T8uuL30=;
 b=IpSVYdD5v7r9p90hDpaR1esxTaVJtF9OXMXeHPo4ernHjBlk4MaA4Yp8cImzPm1m09oyXSoZO
 aZ6WU+7huv7CjoPdev2qssvBc70hw632P5/wzyY8xCt7rYsFGZCydSq
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Update calc_rate docs to reflect, that pre_div
is not pure divisor, but a register value, and requires conversion.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 drivers/clk/qcom/clk-rcg2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index bf26c5448f00..0fc23a87b432 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -153,7 +153,14 @@ static int clk_rcg2_set_parent(struct clk_hw *hw, u8 index)
  *
  *          parent_rate     m
  *   rate = ----------- x  ---
- *            hid_div       n
+ *            pre_div       n
+ *
+ * @param rate - Parent rate.
+ * @param m - Multiplier.
+ * @param n - Divisor.
+ * @param mode - Use zero to ignore m/n calculation.
+ * @param hid_div - Pre divisor register value. Pre divisor value
+ *                  relates to hid_div as pre_div = (hid_div + 1) / 2
  */
 static unsigned long
 calc_rate(unsigned long rate, u32 m, u32 n, u32 mode, u32 hid_div)

-- 
2.39.2


