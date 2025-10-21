Return-Path: <linux-arm-msm+bounces-78204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3318BF805A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 20:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DD69404B0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 18:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5E43502B2;
	Tue, 21 Oct 2025 18:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="sh1xbfEs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7113E350294
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 18:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761070194; cv=none; b=hDmEHah4vBpdC0CT4gV8cmUGhPzRu0XmOyo7itsPkwW/y2Q5x3NOmZOs97tyXRvzP2kRNd9QPIWb5d0OgyvQF2nAILHnLfI8iEn4H6OE94mE9MY2/+9bYBWz2gETPJKDcPnk4QLJNsjM+elXhVKv7SFC6DaSbkUHwsB96J0ClWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761070194; c=relaxed/simple;
	bh=2Eq9A/AKwnR3gDsuZiWxdapYlfrJ603IEtmRzywXGso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/+Co129J4FXmwoVws0DJFCCFuCWnQ/gjVp9Wa2fS1llKqukCH1B4DjSqxF0HcddlLDV1tS4sJreTaAUkSgIsq8sh5C8Iy67ONyp1NZzlVXR1hD2jqjmW8f+CguqT+3mJ309XdjbfvPaO9BL0a5rCC7OBSjrSHfU+JT1R9rPhBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=sh1xbfEs; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so1135122566b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 11:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761070191; x=1761674991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZfW33wDtMvPrY5GE5lKPaP3JYy6uTE6Yvy/BumW9Tk=;
        b=sh1xbfEsyxanZhnJmfRlO51HBynpowWXhNcWWzxCls8DOoxtH+tF+SMuDv4h0N+zIw
         Q9VFMeD5DXWVUxy7814uTRkzm03NGgEXi+uiAaiU8oi8awVUu4tBhavwhUpEF/Tw1TXl
         HQvEuZN3qsGAq/3ST+y50EfczyPtH4Xp9g+zhDYCRTMRUBTjBmbM7puP+8R0nBoFDZqZ
         XNqUQVrb2WvXEgk0rQN+jUU8+q3EHHa5JQO7oyUP1CNIA5UFkGwAFbE6u0daksFN5TSr
         IHk+SaXCU7z1lWtlGyUuHpQBKYUeqv5M0DHDYFvCl3PprphxtMvr5idP92uN9yrRmj/O
         oVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761070191; x=1761674991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZfW33wDtMvPrY5GE5lKPaP3JYy6uTE6Yvy/BumW9Tk=;
        b=dXN8CC0/up8lMd1Yqch+2RH7gAZMI7ep7GXCcZTk9yrC7Xt9sR3j+lWADRvdBn+ShW
         SX/RDal9Ji5bWAA87cg8+3yDHFzQdkCdAtUn1tQjua/ZxRUKrz+X+z12op2m90atyFSZ
         TlwxMFm5j1VHOvCPsAU0JN31uZ4iJB7wA7aao1tjXSwfeLSYF4XxtPEtiQxJh8jEygPK
         0rLY/LR8kt0iYHYDnCAI9+IZvpt6x1OKOtZwWEy5ln7m8WTalT1f/8DtQfSModegJ2oa
         Sl021sEA1f+JZN39hyW0qy2U/N1TMAKVCGJvE+ug1YI++HsTYTLUGBZ8CURDevaRFUUm
         u4Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUIx/Hev5JlidsTjeITyfI4aXgT9awoudtfvpo8ckWBBbjU5i35pStG1YJI6WOL8uyOleg5e5dTw4bPmxMl@vger.kernel.org
X-Gm-Message-State: AOJu0YwjcIN3LWkqabOdyTcBams4p6uhDrBdtWe3No+23TErnk8nYgy3
	eGMFFCAgdg6J80+vvtFynBUtPs0OuEnSlCJW7dJ9cqPO7eeN1bi+AjRppCfGxCVO6ck=
X-Gm-Gg: ASbGncvzz1vOTD3IXvYxXeyavnNgZqQICw1ryQhHCMvtG9uHM4txFSisIUEKZE+t2z3
	pk0HKhbQQ9Kr8y5Cox/j3cICBJ80LNZAF+r7QX9aMDHBGoALi07dV66tyNPnMuYJ0v16XzpRDmD
	Nj85JYjwcEotvOOKq4JxuUvm6e30ihEQOpjSgc4ol5YOS+LkGcZ9lC0mKhMqwYeuhfYuLQMwphb
	nVNcKowoRk6GOombz0oefIlzrDfZmijXqN3nRiJSZqBTATB2hXH9ZX3A74AqjdMunc72AFo0noE
	AEQSwKSR/UXsJH1GptL50lh+8G0ZQQzXcr0egZGsxYeQbZqJlifYW+TuQLG9y96wr8ohn6jbcVB
	/dBq51UhxEGX5zbXShkGlnlQuTY0NTwcCMosc8aeMLku6vwHth3k9UHKmPInn4qkHnwyCA7kUj/
	Mftzkshrk=
X-Google-Smtp-Source: AGHT+IEtlpg7hHwYviAs9wYaJ8CDpbBGpkeU1rbRL5K3RYBz0JwLkuE1x94/3J0jWIixwOjEj4tdUA==
X-Received: by 2002:a17:907:9288:b0:b3c:a161:6843 with SMTP id a640c23a62f3a-b647403a56amr2215928266b.4.1761070190578;
        Tue, 21 Oct 2025 11:09:50 -0700 (PDT)
Received: from otso.local ([213.208.157.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8393778sm1116758166b.24.2025.10.21.11.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 11:09:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 21 Oct 2025 20:08:55 +0200
Subject: [PATCH 2/2] clk: qcom: camcc-sm7150: Fix PLL config of PLL2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-agera-pll-fixups-v1-2-8c1d8aff4afc@fairphone.com>
References: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
In-Reply-To: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Danila Tikhonov <danila@jiaxyga.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761070183; l=1299;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=2Eq9A/AKwnR3gDsuZiWxdapYlfrJ603IEtmRzywXGso=;
 b=f6OVJw7dVaXmR3bN8+qrmYA4vRl/NtjHLvMpHGDllO4eZ6Umrt9okj7FpWsAidTFfMYCwvrIZ
 iLD5F0UgX4PAioKrJoBKaV0jcuvrWD9MRfX9FRK+H0QYJ90gLRud5yX
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The 'Agera' PLLs (with clk_agera_pll_configure) do not take some of the
parameters that are provided in the vendor driver. Instead the upstream
configuration should provide the final user_ctl value that is written to
the USER_CTL register.

Fix the config so that the PLL is configured correctly.

Fixes: 9f0532da4226 ("clk: qcom: Add Camera Clock Controller driver for SM7150")
Suggested-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/camcc-sm7150.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm7150.c b/drivers/clk/qcom/camcc-sm7150.c
index 4a3baf5d8e85..590548cac45b 100644
--- a/drivers/clk/qcom/camcc-sm7150.c
+++ b/drivers/clk/qcom/camcc-sm7150.c
@@ -139,13 +139,9 @@ static struct clk_fixed_factor camcc_pll1_out_even = {
 /* 1920MHz configuration */
 static const struct alpha_pll_config camcc_pll2_config = {
 	.l = 0x64,
-	.post_div_val = 0x3 << 8,
-	.post_div_mask = 0x3 << 8,
-	.early_output_mask = BIT(3),
-	.aux_output_mask = BIT(1),
-	.main_output_mask = BIT(0),
 	.config_ctl_hi_val = 0x400003d6,
 	.config_ctl_val = 0x20000954,
+	.user_ctl_val = 0x0000030b,
 };
 
 static struct clk_alpha_pll camcc_pll2 = {

-- 
2.51.1


