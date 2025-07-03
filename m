Return-Path: <linux-arm-msm+bounces-63591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8283FAF8426
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 01:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F0AD1BC1255
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 23:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4482E0402;
	Thu,  3 Jul 2025 23:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uni5hLcn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F8F2E03E5
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 23:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585002; cv=none; b=nQkppgWx7HUeSBnItvsd9GkYl4hEHPcHL2Sg6N0F5y6nLjkX4bQHU+oLLLu2Zv8CM8CqgfkCKNZ7eD1qIBXg8QZVlXEP8fJ38ns4Y9wMyuVeJIaNZvM0S/m2fw8z+La1AfuE6RwJxJMabQaYH3kYgdfhzkDE5upXd0sQXEBr0VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585002; c=relaxed/simple;
	bh=df3heNetVnGAakoOY8ifFlNFJTyILwhXaXx3zST6UYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fgt0mvkQkXBE0uNPg4oo5IcN/63mvSECICUD20IUdK36PKVgdybxtb/bRr7sFpMy8UJcaK38hEN2OpejYFaWbpRG0fX6zNInR7cFeqFKvbXXxcdfHmD8U+MkHeSaRmyJI1ShlgKqcYtXXn3YKLGHjc1Rj/FyBy1QLnu/Gt1vBjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uni5hLcn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QS4yMTSBWIACzdBsSvd1ueSXzxvii7AwO2574uYorUo=;
	b=Uni5hLcneoVvjFOFjOP6JKV3z/CYhmZ64jfC3lD6YKVbRpm7cSDKS9bNYr6GS77GVeKXeE
	7gw5Pd5oNwIyDHvg7s38eiluGxkeA/2wbg+aVQEeNv8YKPv4Be+kRa67tmyI3HVgdQfGmK
	vbQSnv2EhFRqQgj9LuOGs3u8jOybNnw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-zladtf94PlCi7fUKIQ2WJw-1; Thu, 03 Jul 2025 19:23:19 -0400
X-MC-Unique: zladtf94PlCi7fUKIQ2WJw-1
X-Mimecast-MFC-AGG-ID: zladtf94PlCi7fUKIQ2WJw_1751584999
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a44e608379so12344941cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 16:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584999; x=1752189799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QS4yMTSBWIACzdBsSvd1ueSXzxvii7AwO2574uYorUo=;
        b=xNJl9JMehtRkgGD3/n+6e/IX0ciznulUGsPN5N7JNeUmxRZJBM+38nvtujuERXQiAU
         7m4zPfIgHLhIcTCcjR4FX8v9Nsg5h+cJzQt2/CPmthFfs2kkgyBFK9OeaiQ/HygQvQ+1
         M3pMc173vheTDNMsk5hsksrvzjJMox7TBY2IBvegWsxjGVcu/lIoHX2PU6Xz5DqNizOz
         0klE0mmZ6KVz8f5zsFzEXir2r/BR5tUTT6cpv055JTddUm8ibbEZRHjs5y6D1cPNqxPy
         Oovv3OmDZMSqSJtghWpgbUziNooTc8SzErdHgX6NZcLfGrwgr84mPdrAg/eob6xpul1C
         UH+w==
X-Forwarded-Encrypted: i=1; AJvYcCVNcxvXavNphK4ARlS0EAKninsEsQqw2nOfpPTnOnTWXWEx2yKFHHEtgCPa0RYO+K8MI0DfB5L5eEYvcUiS@vger.kernel.org
X-Gm-Message-State: AOJu0YzkevE3hbR61EH9BDwYABHFMTQfrcPzLkVlSRl0pHZ2QKUJKstI
	D93LbRG22xRBV9/ws5tEOXoVN1ZCSVNG0shtr2eDhiWZNV1MBVZqDRAekCLtLZ4GZweqzwH25DN
	KKL0vRVLS8aZT4avfqZLUDFz3O9V+pkIwn46eNZNrdeIvBucsZEIx/nJt3o3+bMdzWwc=
X-Gm-Gg: ASbGncuF2pVAT8pkEwVXXtd60BURiHR4X2Nd4DknlQsTNUqRwS6bVRLHngUfpQbqZ4V
	+iWq2b7e/nsDfKHAHqqxaxqdRcu2iQUk9kCs+++F5G1sSNh3fskRVhOSthmzJGzd6Z0ECH5FkT3
	8m8YeqIoNfFSTX1oZS4sB0TqAzgHCb/BpdfGVcmLFo9jz49ES7FHESTSGajwL6rB/AWgd7CO6qP
	hZXXJWnfljmlYkBtRgxxIp/YMUqZu7mrXiusair3LkWhsbsBa2APJuw2e7CMgIy9LQPjIhjEyPl
	Cpy5cKWlD/Oelix2NzCvHsabAdBaX/cI2IgqkYYTRLBVW1iNxxWUqXwrkuhr0g==
X-Received: by 2002:a05:6214:3c8b:b0:6fa:c81a:6234 with SMTP id 6a1803df08f44-702c6d01143mr4642476d6.10.1751584999088;
        Thu, 03 Jul 2025 16:23:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnyRBtsxkt1pYtkVxxPc81mM4Wpf/ySmYd6WAtzuN8xInUs5YM90SqZ5QPpGic7Y9Pfr/12A==
X-Received: by 2002:a05:6214:3c8b:b0:6fa:c81a:6234 with SMTP id 6a1803df08f44-702c6d01143mr4642196d6.10.1751584998794;
        Thu, 03 Jul 2025 16:23:18 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:16 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:30 -0400
Subject: [PATCH 06/10] clk: qcom: spmi-pmic-div: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-6-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1685;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=df3heNetVnGAakoOY8ifFlNFJTyILwhXaXx3zST6UYs=;
 b=OFYVeMjBJG2jV2b1stxmQ5G0DPbn/iCRgth0RbTQpfPDnrwu1D4KE8bJib4qFP4WVG1I+0SfP
 A2XeBkjrP1YDSfU9lpFAunaG90ILx4mHMpjg4d3zzXSpuGBMZWLMybv
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/clk-spmi-pmic-div.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-spmi-pmic-div.c
index 41a0a4f3b4fb316827365a522079dcd99630c49f..3e2ac6745325a1e0a30a4587d27f14d93011a225 100644
--- a/drivers/clk/qcom/clk-spmi-pmic-div.c
+++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
@@ -112,16 +112,18 @@ static void clk_spmi_pmic_div_disable(struct clk_hw *hw)
 	spin_unlock_irqrestore(&clkdiv->lock, flags);
 }
 
-static long clk_spmi_pmic_div_round_rate(struct clk_hw *hw, unsigned long rate,
-					 unsigned long *parent_rate)
+static int clk_spmi_pmic_div_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
 {
 	unsigned int div, div_factor;
 
-	div = DIV_ROUND_UP(*parent_rate, rate);
+	div = DIV_ROUND_UP(req->best_parent_rate, req->rate);
 	div_factor = div_to_div_factor(div);
 	div = div_factor_to_div(div_factor);
 
-	return *parent_rate / div;
+	req->rate = req->best_parent_rate / div;
+
+	return 0;
 }
 
 static unsigned long
@@ -169,7 +171,7 @@ static const struct clk_ops clk_spmi_pmic_div_ops = {
 	.disable = clk_spmi_pmic_div_disable,
 	.set_rate = clk_spmi_pmic_div_set_rate,
 	.recalc_rate = clk_spmi_pmic_div_recalc_rate,
-	.round_rate = clk_spmi_pmic_div_round_rate,
+	.determine_rate = clk_spmi_pmic_div_determine_rate,
 };
 
 struct spmi_pmic_div_clk_cc {

-- 
2.50.0


