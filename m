Return-Path: <linux-arm-msm+bounces-33414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C5F993168
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 17:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AF251F221C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 15:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69ECA1D9334;
	Mon,  7 Oct 2024 15:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHtgrJxz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA42125B9;
	Mon,  7 Oct 2024 15:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728315379; cv=none; b=XhKKER/nu5WajQ8Y4Z5rx5cYPfKDWvourA029CxbXlgdhshRZMkLYKic+94OhBMVjKG1/4R+Zi89gMZWWPnLmtYwYD2pC8ga0cOVj8os51UQY8Y20DLYgNdX1omFFleegqaGPEWy+H6aMzeGRIFM7vCco5LcKvMDZ88LQPfrzIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728315379; c=relaxed/simple;
	bh=cU9P4qzHC4jP9o3v4wIQ+UaeV1Ek/oCy3Sa5T8uuL30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VQpH5Ig8Jr58gmd1y0q8iLjIB2EhLAqkZQe9wKXk3CThzcrQi8yh4C6r53a/NcJO2Iw+X3z2Hjc54znkIfvlURCX3AHYzyLMXDPmZgfpozmUN+56PqChqJb8rg+Px/kq8xNkfB5SzZVdLn0vsVDITjC8tjp1jbCrRe9jSLcLdeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHtgrJxz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so61855935e9.0;
        Mon, 07 Oct 2024 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728315376; x=1728920176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXV7innKMzJjCsw3L4AU06wd569JCGXLkPWGw2m6iWE=;
        b=IHtgrJxzHgv2MYKgivI4TyJ4Cj346Iib69T9RS8dfmx0/Q7Kq3xlfCCN8Zt7XgRYhS
         1psS9Ky6TBygLDnK+QaLmtRaP6XrauEs8fzP8C0OIl5Pqn14liNIk7uRU6iEWVU3g7dj
         hETlyn+LhGo1hhqQUvinhQ7VVcuaPoHIMs+dTy/j8Z38nPP3cuz/XS+x6yZRZF8MPU2e
         dTdXnLgklPAk3Rl0kh55g/KA3cbP8+A2QfK8HtB0W5OVzz6g0o1/orj8yrz5p8Qm5SMK
         qNfG4XaLgOlS+qqTbFrikD9MYbTmVUMGfVfD2wlzYPHigaAFPAsSRn9QA5OQwiG+w8Iq
         tz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728315376; x=1728920176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXV7innKMzJjCsw3L4AU06wd569JCGXLkPWGw2m6iWE=;
        b=iaRyM7lQ0RIpC9raAIHz+f48/0gQFe52B2AGPwpufJgK6JLaajiOpoEK3McaTVrlZD
         T/9gW2ClFYgSv2hwEcsOZFuvlisBT+C9ayIwfxGUcmQYipFiozlMwQtiO7vYCvO68tTU
         RLb7FuxKC5JCRca94frYGGb4JT5BgeF8zTqhqv+ygDcXaJPbCH57M1TECCXEW80JgJNc
         5YEf96b58ESa8V/ZNTVm6Z0kaf25swsrSj9bOzMNpQ1uiQio6wuU4zIrIusmJJV6G1Ep
         aofCpsq1TrnyewCUnRLl5oke3/vrCr4G5+MBBttMf5JTfdK1lBb3VHQCn027x+KE0UTf
         VvNg==
X-Forwarded-Encrypted: i=1; AJvYcCUgDAFK5j2X+AGJhnxEQu8kcqW6Ql4bH1kxcgy2E5ZuZBA1Z0hAAqSPx1bL4K/gBZqXzelcg1uPpYgA0YuI@vger.kernel.org, AJvYcCWL0Vh6td96TV0Jlvg8qqgHFwspyzaPbM98vygczN5Yj7sxZspK2ZGW/mc5/66CEFQta+1PyxgbB54=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx2vPg+f20YgzW3vCkMENVETRFDghRDig82nIxaZJEa+hycMOB
	vCgMFa1zQBocipUTIBdwiud3H61JKmRq0VGSjg0Q/+K/kfDnn4APgts0xw==
X-Google-Smtp-Source: AGHT+IFDbiYR0ZcDB6YG6fte/e+0x/cQYx16t0aNUZnuVdqwm1fQ/GkTE3vOsluRxpoT5+yWFHpjEw==
X-Received: by 2002:adf:a1c2:0:b0:37c:cf65:6b10 with SMTP id ffacd0b85a97d-37d0e72e5e4mr9796650f8f.18.1728315375762;
        Mon, 07 Oct 2024 08:36:15 -0700 (PDT)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-75.telecom.by. [46.53.210.75])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9937615e85sm367362266b.175.2024.10.07.08.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 08:36:15 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 07 Oct 2024 18:36:11 +0300
Subject: [PATCH v6 1/2] clk: qcom: clk-rcg2: document calc_rate function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-starqltechn_integration_upstream-v6-1-dd75c06c708d@gmail.com>
References: <20241007-starqltechn_integration_upstream-v6-0-dd75c06c708d@gmail.com>
In-Reply-To: <20241007-starqltechn_integration_upstream-v6-0-dd75c06c708d@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728315373; l=1073;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=cU9P4qzHC4jP9o3v4wIQ+UaeV1Ek/oCy3Sa5T8uuL30=;
 b=YHGGcbbo9NozoVD+cM54EVxC5xo7xOqJbPen9IPQEs7vjh+SRMqVF+WYhBkVmHCwXafVYvlZ1
 HxtNQzLLo0MDBOYfQndpEFYaGmL/VmZv+rj3vWYz1DPhP3seXf3e9FV
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


