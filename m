Return-Path: <linux-arm-msm+bounces-88146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33029D06477
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 22:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29A6D30AFA8F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 21:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9BA338F4A;
	Thu,  8 Jan 2026 21:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="crgE1G+j";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fGyJbHGM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AAF33893D
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 21:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907119; cv=none; b=tEezbCcFYfJN368MgbJHdJboVatbid7cnawYHvUM/IA+wzXh3duOKuIUCVMMkT4eYC93J4hiwreMrAW/PM7ivyRE2pUmuziU3CRMaN90VHmCTT6+5z+Hziqv2e6pcAKQAAt1cI43Zaf1jYlvvrRE8qJShOpacBi3SZSyPypuCM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907119; c=relaxed/simple;
	bh=jKoFCsEBXQYv3wszRGARIkmwQoIgPv/cscixawXTpW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U8MyxhmERtCfOQ8bGRP7hy0Hvwg9ZVWqjKAck4aOqTMmQtNt+DEGk8GBrt4KgflVcNUsiT2GgKhPsgX6kZxo2u7kH3+6Oy0ExoVXXl/gdYvR5xjNmU2x8aS1AMGGHU/HOzGek/s5UKzh6Q1Ttyar4+c2e0uBnTkuPOJzECDBj58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=crgE1G+j; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fGyJbHGM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G319IdeSa6D2FCy2w1nMqWvaYhCLIz6HSe4OLMwnyMI=;
	b=crgE1G+jaNB6oU1yignyiaRRjsCdrHGRbbLF1mtt1i/yzMX8iLklbgjbOel4fw0En27vGS
	73DzGhK6hP+YKB++AAIKBape8LBWc5h1BULrzUGurGQVlzcbHEoFrhjMCqBe+ZePm+r75+
	kvAoGC4Utp1j+n2+OeZmDJbc+0dCvig=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-7cvdugdiP_ajyEei8faubg-1; Thu, 08 Jan 2026 16:18:31 -0500
X-MC-Unique: 7cvdugdiP_ajyEei8faubg-1
X-Mimecast-MFC-AGG-ID: 7cvdugdiP_ajyEei8faubg_1767907111
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-93f62c9ab4aso4170168241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 13:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907111; x=1768511911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G319IdeSa6D2FCy2w1nMqWvaYhCLIz6HSe4OLMwnyMI=;
        b=fGyJbHGMmlZQFzeagyMJdCWUEXtXCpQJBtfJdDapbBWEpaC/iPCRWfrGg2/iyf99At
         1WTX4WTztamFq0wvre51W9alO+dnXCr7E52McIV0ELAgG7RYHjzcqZssHOQ268PzT9Io
         mA+HDUgQPSGJ1Dzi+5E9wctOorbXi5fTJZeAVG4HIiMno+FV+azZR9x0NCmR0EHOAL12
         2FmFPFjJS5qsJPGspvAlqqX9r5ffHdqj0RDHXHtPImj7azmaOSWDyekNxP/gi/ZtX2OG
         3K9/neD4zcQvWg2i6cR13qs8j4JS9tp93TQkLcxZr4nbUBwOlsDoewmZqxGXm7cnRhjt
         Md7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907111; x=1768511911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G319IdeSa6D2FCy2w1nMqWvaYhCLIz6HSe4OLMwnyMI=;
        b=IucxBsQ78BN5hC62cB5oRJRifCNtfZvikEHRor+6XvcUUZLiw4CsfJNTkEhBOCUUEO
         VEG+D0pYBQL7J5WMcD9u8FQumYUBnqLjVl8TBsMAILfrrty1Odvjc5HuGNZXbHS6Vndi
         bjiOU9vcS3lT4LuibtdLxx/rzrvgU/c9CF4rVnSwGfwYsbZ16xwVpkTpEbz80zz4ahgH
         uP6fC3rqfERnMT0J+19lVyC2pIypTkbWJgtkBKBuVi5Kfdp7XJOohkRVl8R+LSC2tdnI
         LKi+G0ICjG7/+Zm7YBp0MyK8+TnFEBWzolZmE1R6rddmSvlENhHP4Hzty9lH8Ig3CIYX
         YUUg==
X-Forwarded-Encrypted: i=1; AJvYcCXh9surN22rnqHYgawMRrHaArf2yfoNmUAoiNM8ETF/ZLmgSk5oghI6fhccehMiqAjF8ubYw5C4yRBR66Rv@vger.kernel.org
X-Gm-Message-State: AOJu0YysXZr0IUdObTrPVyZ7YisrczyvqaLmL6dB7q+o8asz0Hv8wRdO
	06bwyJlWhCcr/o9YkuZ7/0IA0GOV56UebFd2rsObEmwrML6U5tXaCl1Te2hWg1wyS3GG9TUJ6wb
	y+C4gG0hoQzoVg+en03fdToBvuz2uLsVkXTxf85HX9dR2mz8xRpKLmYQovjRLi0rqAOulg8K7sk
	k=
X-Gm-Gg: AY/fxX41lbtOdqWN71mkcdl9Ek0yM6Lu7eAI2PYbe7KryF9KcJcEQDCTg68GbJqsZ8r
	78L6wnYcKa3bHAc0A6akSJNURb1v5jKTjJli8XQKC7p81Ai+derIa0Up96KqyxysN5vAtRne8Vg
	FU+YA0TwW+ByckHFAmFMwmR0uADVtunDzAbB55YSgie/bUajDka0fwLsxDx2WhpPtjT/JyjZqH2
	zq1iJlHMdrLVf9pnqWEinvVN9nOsx0nOqUo4BiaQ7pDmoSCX3qCAlTzj8cRj1wUSqB+zrg2C9T/
	7e68HSd57A5Je85nDobgKEsWr6xyHu61EoCd5L3iIYI8H+K5F0FMoKhtC+d4QBCf8gikWLz/oKr
	kPhEcN/VOYNlbxOc=
X-Received: by 2002:a05:6102:605c:b0:5ed:c98:37d6 with SMTP id ada2fe7eead31-5ed0c983b74mr2379677137.2.1767907111121;
        Thu, 08 Jan 2026 13:18:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQG9r/cfeCX4euCrFgcXsjUzjAkSa0Qn6QkdRAVCwULp0yuaXtFnMp4bzwiLqhiT0LgSUeTQ==
X-Received: by 2002:a05:6102:605c:b0:5ed:c98:37d6 with SMTP id ada2fe7eead31-5ed0c983b74mr2379668137.2.1767907110607;
        Thu, 08 Jan 2026 13:18:30 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:18:30 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:34 -0500
Subject: [PATCH 16/27] clk: qcom: regmap-divider: convert from
 divider_round_rate() to divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-16-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=jKoFCsEBXQYv3wszRGARIkmwQoIgPv/cscixawXTpW0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5HbUHDGfOfna4u2eepsUzj3ScAxyq9zPfaPF0HHJU
 7F1Mh9bOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIcj9GhtUClxmE8ztenimK
 Lp2i/MFFUnSZ+bLL0jHF0/bKTt+gYMDIMHdhWgNXdo643aoNdk17ND8Jc0S9nhieKjir/fdri/Z
 jjAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: b6f90511c165 ("clk: qcom: regmap-divider: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
---
 drivers/clk/qcom/clk-regmap-divider.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/clk-regmap-divider.c b/drivers/clk/qcom/clk-regmap-divider.c
index af9c01dd785372166122224e717c119a2365f4e1..672e82caf2050446d14e64617a4b90d0b09201a4 100644
--- a/drivers/clk/qcom/clk-regmap-divider.c
+++ b/drivers/clk/qcom/clk-regmap-divider.c
@@ -34,12 +34,8 @@ static int div_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 {
 	struct clk_regmap_div *divider = to_clk_regmap_div(hw);
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       NULL,
-				       divider->width,
-				       CLK_DIVIDER_ROUND_CLOSEST);
-
-	return 0;
+	return divider_determine_rate(hw, req, NULL, divider->width,
+				      CLK_DIVIDER_ROUND_CLOSEST);
 }
 
 static int div_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.52.0


