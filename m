Return-Path: <linux-arm-msm+bounces-35671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A56579AE234
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 12:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29E8EB22E46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 10:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCD21C32EC;
	Thu, 24 Oct 2024 10:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRE6J7gX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B43E1BFE0D;
	Thu, 24 Oct 2024 10:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729764808; cv=none; b=SANbMOekZxElUXcJAC6RM0Txv0DV+hVRpfJkYYvO61dAVcumluJr/Wy1TO5QHoaSkxHg+uNh/kZBKUPl2qF9iJCospKN6+L01F/MnXoC4lK5cqMl6nQpFzSImvjxjdoXuaBi3PEwCHPZGk/t9APi1rZX2Ym9tV6sJ0DiX2VR8wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729764808; c=relaxed/simple;
	bh=cU9P4qzHC4jP9o3v4wIQ+UaeV1Ek/oCy3Sa5T8uuL30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jt3naCljX6cGGU7OO1lLddoXBDRA/Q4z+sdenDEKNR4mJyZU2ZWPhGkYiIpKTnnMMB/nqZ+wAGkjQz0BccUMqhYRdOmJvLXCaZtDrQbhjsnVEfFOQ1598g0/tRRojnhb72RseI1gIkDwuCC3gjr02C56OE945r66ztBz+MfXLc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRE6J7gX; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c948c41edeso830743a12.1;
        Thu, 24 Oct 2024 03:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729764804; x=1730369604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXV7innKMzJjCsw3L4AU06wd569JCGXLkPWGw2m6iWE=;
        b=IRE6J7gXANlp9Uo6xDvSU0NvNPr2oh2Oq9XSdNLgvZTKLHzPWYnmTLhwiahCi0iP2S
         YB15CkKKx0r/ZVyilVbMzpX7VZe31+/WF+zTXooigHo6APEcusgx2suub7Yv2NzUixdV
         tW8Cly4Em+7owDWSGwQG6No5sQJShQcCgqUKZPLsubzNM+UmeyhvEY1An6AbERWf/QCe
         g0BHpZyWl0S0R9tgSZH0fYW9zjXSDXFQEWSeWHXBfN5Vhmuh7bG85Opfwu5mEv0I+A6E
         RT5Nk191WaX+yfIt65u9FIgqyiqR5f7swfuQjnyt+Y+Rwyix1G/0pcdR5z7iw1FP42/w
         cAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729764804; x=1730369604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXV7innKMzJjCsw3L4AU06wd569JCGXLkPWGw2m6iWE=;
        b=ljzxv9Q9SJq/hEjk2UW6nzeSTJFk1vcjVf8OTsK9TE7lQ+ktiILJ6DGg7ELtLQz6ZW
         r3Gg+bdzw4J7M5jsZE8cnFl3mpLmTHO99euEnO3LgXHUaRXbzzrH2jCBL7BO4Mfo642c
         y3W4+U6L09TVRq6JSw/sfKlmzDL4A0LEIBJhDxsSZc1gYaFDCnljxnH3vCjDUiGELzsy
         o5v8aw62nGZiZyIe20Jn5cJsIMlcR+6qtoJMOT29HAvXmDqQxA0FcYxpsuPv0xM7CGM7
         zkHJ5iCqNvkAze1m4zTEpVa0rmDqrK2DE3uHiTQBmgD0M+sQIoD5RXwC2uwKZc7yYE30
         AiKA==
X-Forwarded-Encrypted: i=1; AJvYcCWqsI7CwTNtpJCq7llnlUHnUy8PhDTIqdW6+/c/BkLPdVq5S7M9pqU4Em5EudxW9wnlz1O5YB7j1C0=@vger.kernel.org, AJvYcCXuaka/TILI6TxM+HXwaZ6dnbcnP8WQcUaa/XFcyANjga04JefZq289gd+tEVOJfeCCNCjnQAHjdxQIFf6s@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ZoNofa0vpFZZeKEHUK+R1V2Bn8/slWVsEXH3EV2g+KIF3Ves
	rhd2SF7Hf5yquAJXAsSNEeyXcZ+XNMnJGsMTE+BqbWlSceUL453iiA3LeA==
X-Google-Smtp-Source: AGHT+IFqsC3dLoNMueW7i9qlCy0xjygH1i/UFI/+Ze1kd34wi6cbWzoWfLN5YqXqsexRUao3mCT2xA==
X-Received: by 2002:a05:6402:380a:b0:5cb:6706:ccd with SMTP id 4fb4d7f45d1cf-5cb8af6c613mr4402461a12.25.1729764803796;
        Thu, 24 Oct 2024 03:13:23 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.244.166])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a6a6efsm5519757a12.53.2024.10.24.03.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 03:13:22 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 24 Oct 2024 13:13:09 +0300
Subject: [PATCH v7 1/3] clk: qcom: clk-rcg2: document calc_rate function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-starqltechn_integration_upstream-v7-1-78eaf21ecee9@gmail.com>
References: <20241024-starqltechn_integration_upstream-v7-0-78eaf21ecee9@gmail.com>
In-Reply-To: <20241024-starqltechn_integration_upstream-v7-0-78eaf21ecee9@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729764800; l=1073;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=cU9P4qzHC4jP9o3v4wIQ+UaeV1Ek/oCy3Sa5T8uuL30=;
 b=EG5fpZM9D8fDjigq3ofy2poFvugR54iI3hQVzMkeD7fnBC/JoUZDspdxfhEl3QYDnC3MXRaVm
 Zm4bQ5tX8ruCGxTyxfHfDuOYr/0tKLDN8No3IqRH/UTc4FJB0miIBqB
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


