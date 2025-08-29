Return-Path: <linux-arm-msm+bounces-71208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B60ABB3B008
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 02:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 146BE460CB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 00:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52EA03EA8D;
	Fri, 29 Aug 2025 00:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RzunzfzD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69471FDA
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 00:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756428412; cv=none; b=hkjIAY8k/oq0+x3IptOi7HTzjIz5JWXjI0gBZtad+45GxNW3Hh0ntceCwjlexZdkfclgK2+yFIGzXw0fjYqRWpcYiPklPLwWMihKfYjOb9Dh4+N0J/oMgF9CkW+PZUU+gP0PNwYQ5MUhSXQjeismke0f1cJ1EAHSc6qjY85CegE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756428412; c=relaxed/simple;
	bh=lRErUXfhlVyOjMePggfg3EacyZAvSvm+w3vZGvHjG+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iI5b6BRLs6+fPZdtdWUpnV4e1xh9TB6pIRys6EcHlS3If1Xx8DfWvTffeNN2QVOxVKiPqKL3iJBI1Ah0/QpsGFHsaUDIL43JhrwTR4CLXyBM8ZWP/NXLptBrhH2qBoGySBxKMmTiKwSVpb6NurNobo2BBqTFUDMCrrVGorfF9oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RzunzfzD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756428409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OQVjNKRtGeYd79k9EsHTPhO8iq2mtofexnH8gr3Lua8=;
	b=RzunzfzDZ7yU7pa5L6n0wOy0XeXHjyjC4xgcThDgqdN/J9Sjp8EdqMdPupoTqvM75UUiMf
	jnebT353JebKEaTV8foleeCllsr25tybAOgS8YS/fiT1c2mgLct9km7OgXr5c5P6VvH3Of
	63zI5vDLvn0SqAhWxSYH2DnmY6qSsHo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-aHtTwbysPhKHUCeNwLKZMg-1; Thu, 28 Aug 2025 20:38:47 -0400
X-MC-Unique: aHtTwbysPhKHUCeNwLKZMg-1
X-Mimecast-MFC-AGG-ID: aHtTwbysPhKHUCeNwLKZMg_1756427926
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70ba7aa13c3so49194776d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 17:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427925; x=1757032725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQVjNKRtGeYd79k9EsHTPhO8iq2mtofexnH8gr3Lua8=;
        b=tnhFZo1bA1qJBN0vV/QNGdrJFk8ru7YxkM/OFo/Iakqwmwt5Q32ZNf4qtnJzqdGxlV
         BGpWSSN81wAGfMsTKXosQgxQC/18isxgluIGS0cW0el3EjtamTUd7CYBrZ44DedhZniY
         IzByLaxF/mqpnfq6cbkUby3oz+CkKFeIYgWG6x8wZXxvUbL3dzOSIou6rRROQxSOCqBx
         FBJaseH9mwXbmm7nHYintqmh8aAw7nkDsXCQLffCZfrYHobyj+zZj3e0laRvkmjeORB5
         FEV0WNBaHRhXOfn+87iL4uqSspM9uIxVJambwJQKotNJjPE6Uz76XxxdwwsHoA1y4gZz
         Aa2w==
X-Forwarded-Encrypted: i=1; AJvYcCU5zL7WgRgwtUbqYj31q0BfdMyNXlRsX5LSRUbjQyKUmrhaJVluPa800yqgL449B08gv0TMX0SOVg/2se5x@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1poeJLIeqq1x85/zc9Mymv2/d2VbAYoJSR79CmuaYBXRD8YhI
	vIMk0Yz2pW8RyRwFtHtRD7yhbcRBVxcdDo3KPL0sDeJdVigKwQcv9YC56DOS3yL1PzST0UkNVCl
	TzcyPGfzmqxx3yBgoZc9GD6j1/diJsMs22sux4ip0cke5Ae/izVlYxF91TIQnngkKnJOVZ00rMS
	vdXE+VGOujwmaZe7nXlzEy0Na1iKaBBJKihhSxvNwgp6nPRCcK7A==
X-Gm-Gg: ASbGnctT0V9EsRtUF9c4WOLDCChL7ZQhpp9FXb81JBBxGwFPN+6vX5ACTrq/bcz4+K8
	N+ugr1deVPqU+DXnRKP0e0YcP8n9fz7tXB1426eNUKgZDOSQu8Gv5yddOUYlCsbJeORnxjafvT2
	4X/F6xaDCDYqptXj+pa+NKsPw3gCzW3OpxZEPupyRssVMCHC8Ho0cHPl1psWAiBm07IDE8Q8h8g
	286DHzzloV/CoX0ib+LQ1j6JnUZpHwhWKSL+Nqeih7h4mnrI7/diUDo6z+STXIty3Oa4nQSutw6
	+2bYrdVYGTcjDW74uVcZRt88m7VkbpZlFdjbcqENBPQkArCA5gX0Cxqvi58L9klHg7GMFmQ57ZA
	bUcqItvEAPAN1MiEV/Hs9DF0p/WjTLy5qZA==
X-Received: by 2002:a05:6214:cae:b0:70e:782e:b23b with SMTP id 6a1803df08f44-70e782f22bamr10926716d6.3.1756427924956;
        Thu, 28 Aug 2025 17:38:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR8adeLmPp6i8NPj//2LYlvbZ2JGvJAUD70v2I2NLKTSUE6nmwskQ+vGH0x5SgjqCGSE+qBQ==
X-Received: by 2002:a05:6214:cae:b0:70e:782e:b23b with SMTP id 6a1803df08f44-70e782f22bamr10926366d6.3.1756427924487;
        Thu, 28 Aug 2025 17:38:44 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:43 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 28 Aug 2025 20:38:22 -0400
Subject: [PATCH 3/8] clk: rockchip: half-divider: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-clk-round-rate-v2-v1-3-b97ec8ba6cc4@redhat.com>
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
In-Reply-To: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=1835;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=lRErUXfhlVyOjMePggfg3EacyZAvSvm+w3vZGvHjG+s=;
 b=77L/EGAGdRYd5Zfk7wMZPiUoUyEJ+wFGI5TKO4e9gl+bXy3dLwkQMeaRO1HRElJrc9TAOKFe/
 f1vZeXk72u/BkLnWKmAly+0tQG9J1VwJ/BPTEXNwrw7PqrQdgLjH3+M
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/rockchip/clk-half-divider.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/rockchip/clk-half-divider.c b/drivers/clk/rockchip/clk-half-divider.c
index 64f7faad2148f27099d1ace36da45207e2315a1c..fbc018e8afa44c87a5a7b53475fc98b318ce1ec8 100644
--- a/drivers/clk/rockchip/clk-half-divider.c
+++ b/drivers/clk/rockchip/clk-half-divider.c
@@ -92,17 +92,19 @@ static int clk_half_divider_bestdiv(struct clk_hw *hw, unsigned long rate,
 	return bestdiv;
 }
 
-static long clk_half_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *prate)
+static int clk_half_divider_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct clk_divider *divider = to_clk_divider(hw);
 	int div;
 
-	div = clk_half_divider_bestdiv(hw, rate, prate,
+	div = clk_half_divider_bestdiv(hw, req->rate, &req->best_parent_rate,
 				       divider->width,
 				       divider->flags);
 
-	return DIV_ROUND_UP_ULL(((u64)*prate * 2), div * 2 + 3);
+	req->rate = DIV_ROUND_UP_ULL(((u64)req->best_parent_rate * 2), div * 2 + 3);
+
+	return 0;
 }
 
 static int clk_half_divider_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -141,7 +143,7 @@ static int clk_half_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_half_divider_ops = {
 	.recalc_rate = clk_half_divider_recalc_rate,
-	.round_rate = clk_half_divider_round_rate,
+	.determine_rate = clk_half_divider_determine_rate,
 	.set_rate = clk_half_divider_set_rate,
 };
 

-- 
2.50.1


