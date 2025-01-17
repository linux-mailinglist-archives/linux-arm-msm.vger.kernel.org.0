Return-Path: <linux-arm-msm+bounces-45402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8ADA150FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 14:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D35D3A9822
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 13:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F28200100;
	Fri, 17 Jan 2025 13:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mwrVVWG8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAA01FF7D6
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 13:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737122053; cv=none; b=OHRtlxfW6CdWSg3pmTipriAdedyox0K7IjF4ow8dqecbga2g8VgaroBy1MEjJ2rXe2CD6jmpQssF8hMkdCwJzHmQnJ0U0EBGgcQxpuVNHWEqljHULYL8v4UdwtNOnW3hJe81VypwjIR6JjByTbuZl475qY4g9S2r/mTYGFthNJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737122053; c=relaxed/simple;
	bh=omQ0q5abBpkqFmtYz9fwRWfVIX08QuZYwIw+MD/b79k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k6KGE7LQetVMzwONHYO8Z0mr//DjSQYynkR/LVep9KaDoZWR2dVwE8zsBBltPNalrlhmp/rLvfAP5lqg2cqa5ovx1eIFI/5tQBIQBXKq59rGDMnD/YrMn8T/GeGktwkMTJGmBnYRtS8vfChStaDKhDtyIXL5HTDNAw8LFgw7vt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mwrVVWG8; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385df53e559so1646166f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 05:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737122050; x=1737726850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15Ks6wACBMUt+4Fhjb6F/swKHnhyTvT40HtN0zm9yGU=;
        b=mwrVVWG8w/RSivIzMfzqWiK5Qcb3+bwgwMj5kQ6uixnvHpWThQXSYwRvlgf2936N3N
         UlCoDENsk3KKsOgRGEp4RuptBjLEN9ODcIuUDmvH6cHTYvTaJwF/Mjj8MJq3h5FoloA4
         PeRnVgXFpACxnGIOieCtHGoUaT+pPQDmwILSkbRAqnpTx/A61tOrCa7u7lG+uFSfI8bN
         28zA4QFbHfYl5z283A03ZnqiVRlfahQrn0pVE7veTR64DJNMgmQ5zSyg0JAO6ePYm9rX
         2KTjjSxBQGynbesuaHX3b5x7w7M/L3bDvL07gGvWLOTtFHGunDAIu5ckeL7cwLCFLGzZ
         7pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737122050; x=1737726850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15Ks6wACBMUt+4Fhjb6F/swKHnhyTvT40HtN0zm9yGU=;
        b=Lh0SZNKLnUESnyecHVpLMMm0psmpm/INwhuQXiTO3Ly/tgYmA2/UG02Abywt4gn6l2
         mjGKzv76/ZIuuud9Gw14h3l7/RuVaOfySM/VY9UB0Dzp6HsLJZFhAJ5Pd6qlc8SdKfJ+
         RcyERCFbUzOc3mRhlPQscGvQaZ5QSSiwoDoCDkrVunc8BffOtDMPIqvwOJpSqWlavULW
         /HmQ/En8hpR0I4tH8peyeSt7YUtXQclvzKmFiKBkgNc1iYAndO4S9y1TwLbJTibo42P+
         vCZocf7E3J8+Hc61z8r7Ug+qzbgapbMB/x1EjxQfRm8JK2KdrvAdi9VTrg4hmlxCfOFC
         5B6g==
X-Gm-Message-State: AOJu0YwpRz1RSU7QWWniiPV0UUEPUgZYJqu2i9jbmoJK2o6H2n5Eyt0l
	Ru/io4tE8gC3cpgMNBMMeDe3TkHE/TYXMxTvki5pub7qPG3OTtypdLDbFvfjYyc=
X-Gm-Gg: ASbGncse7deJFDfI/CF5Umm67wFcGPfE1rDS5v0ilO82K06JXOh071JNkyfxvXdeDXI
	4S7apZryhOBaK+2eFE0i4WuKFVcWxhMZTwvlChzn+B2BWf9GKK5+GM06Avxzdpyo5QCv6uvAOSI
	Qmb7NE9kHNKH+TrrNc6S2ZeCNoSFk6M0vLleDe0X4XeyYkTtu6ob8ihX/B5dXct/nqYZBRuXXNW
	+XFlfvRxUT42upS90HDXZrrjvndtiqCnJmXZu8TytBSZZ7pJp5L3s7zQ9WCeYupGg==
X-Google-Smtp-Source: AGHT+IHNmLQm1j06TtGNOkJWIFaFS+c+vU1YTf1B5SrEFcW5N5PbHLEVJA/tlx1fts1YuOCHHCZpgQ==
X-Received: by 2002:a05:6000:1faa:b0:38b:f04c:25e6 with SMTP id ffacd0b85a97d-38bf56626d4mr3033027f8f.14.1737122050037;
        Fri, 17 Jan 2025 05:54:10 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221bf0sm2545279f8f.28.2025.01.17.05.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 05:54:09 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 17 Jan 2025 13:54:07 +0000
Subject: [PATCH v10 1/4] clk: qcom: gdsc: Release pm subdomains in reverse
 add order
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-1-13f2bb656dad@linaro.org>
References: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-0-13f2bb656dad@linaro.org>
In-Reply-To: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-0-13f2bb656dad@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-1b0d6

gdsc_unregister() should release subdomains in the reverse order to the
order in which those subdomains were added.

I've made this patch a standalone patch because it facilitates a subsequent
fix to stable.

Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index fa5fe4c2a2ee7786c2e8858f3e41301f639e5d59..bc1b1e37bf4222017c172b77603f8dedba961ed5 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -571,7 +571,7 @@ void gdsc_unregister(struct gdsc_desc *desc)
 	size_t num = desc->num;
 
 	/* Remove subdomains */
-	for (i = 0; i < num; i++) {
+	for (i = num - 1; i >= 0; i--) {
 		if (!scs[i])
 			continue;
 		if (scs[i]->parent)

-- 
2.47.1


