Return-Path: <linux-arm-msm+bounces-63588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F55AF841A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 01:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED7A93AAF88
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 23:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F90C2DF3CC;
	Thu,  3 Jul 2025 23:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gUby+oWj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0742B2DECA7
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 23:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584994; cv=none; b=GRtvhb5gRH0KA2LJFwnUj8wUF2A6CTdr80XEdGBY1PGzXfhK8V8PAVp8IH+PlTxtXcRJ94M5cfjHFi2eMY+q3J9kXp04K7sHbUdajXZXDzuUyOtWMUEfGlLIstU7MwhamvRArsA1xXw0dWGSJiefX88X+1yoDEILW4KsMHXl+H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584994; c=relaxed/simple;
	bh=xV38q5FTl0giHcO6B1fUUKKklwS+ypfUiAE8QJ9ufs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m9AOJvJK74Bxqjgf13ulyrk3Kv0KQ5riCi262XSehzV+hfIe4cGuzhTgyZUWokIO9dRfB2fKcJfugjHXjmPf015TgFiPR0babNiDNWHMSbAqZ5Q10sBvTwFhx+OQtBy7mYZm6LWul7t+PAn5khEveKT3PUQA750aED8zAAkVyUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gUby+oWj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751584992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1AzaXolkpwLeUXX6Tltm5nUeMgctbaGRt9VbQb3Als4=;
	b=gUby+oWjPqW/5/Nq30l4jEALNJ2TX90Xy4/7IsN470d3ATBztVaBTPLkq9xagsYEO5aoqL
	0wTdk10kr+mi+aY0+LD8y5EsP4Z5cA8uBfbl0cENe22kjQAycVc6on2kVycPbpBhukI/7n
	+tGr9Li9RCOBa2Gy0IL7Uw2a3MwvFOg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-INwStYKkPj66tLOOzwkMIw-1; Thu, 03 Jul 2025 19:23:09 -0400
X-MC-Unique: INwStYKkPj66tLOOzwkMIw-1
X-Mimecast-MFC-AGG-ID: INwStYKkPj66tLOOzwkMIw_1751584988
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb3487d422so4433716d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 16:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584988; x=1752189788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AzaXolkpwLeUXX6Tltm5nUeMgctbaGRt9VbQb3Als4=;
        b=afNpT23hQIlDjwXnP1mM5pXr/I/9wgej6nXRs49P2guLW9xqD65jXKFHsTBkVued/T
         NdchLKs0+ZxstAsW3KCQEruToCSlhd15orMk0GxiFwcAMZ+KjVhwDRsxaX7MLAJ15nO+
         75Khg3qZzbv86VUhgXQQQZCSpmh8EHr2aFA53ptetQRgcf0v+CR+o26o2rtotkAbMEE/
         snM2k7CkRN8y31KlIdYv4ZM401NVLuEx4iRn6JlBfNbmsNHWNjpdSzV4XupXezObN01I
         tXrr9sP5IDG2WnUj2MXZmZmrptGpxV2JBvImbVQCGNDasHcSjepPVedeB4ZQvMV2XznV
         ONBg==
X-Forwarded-Encrypted: i=1; AJvYcCUfjo/Wtikrgd0oD76Vq9OqXFYxGSAZghAnD0NBW9vBreE0GynaH8MYpW6qIBsHu/YQzishPQe09wzNk29O@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5tcx7/qY+NuxtKRAqO5YYboVQAFlmxnh0tTMZeAe4cS9VEO1X
	Q0BBx7LmDmkD/lS0o5poRFmZ74myg1qLydS5uClTr3zmW9SYUsPhatPLSjWAC66z8o2FSZeni2x
	8Ylwphi0URHQ+uONvxaUZ1lG0RmfZE9fHDlMk6M5xm25vqemqImjha0VoFtKgivI4Va8=
X-Gm-Gg: ASbGncu2sY8uGebR7Rsk2d/s7JCpAJa78+r3pV2+KqcyMH8BGrpAxEpzVtJ1uDdbvmP
	nH0J5NufQDl+KfMOzrYfq8Oc7nJZU4rb6/y8jO4W0megYgOoACsk2z8sc0NDmKEnfkUEzOGOnYD
	YFv8+0gbXyJ+zx0DoPOHE3aKAIDdGtar+7Br/2gbvSz3VgzLSf4RWlmN3j8Y6A0yOj1Z4DlXQk+
	MKx/dRc7Ae5WAgC+b1GGuN4roMZrRbbKh4Zkdo2KmymofW2nFWK3Zg3d86FIjmfOjjLjqG5yHCU
	rK8d/rokjHHUBBNDoPPkGRIdv6r8eF+VXyYDYYrFnxc0Mh0qUvLCNBi/NPgCEQ==
X-Received: by 2002:a0c:f40e:0:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-702c6d89379mr3029196d6.32.1751584988557;
        Thu, 03 Jul 2025 16:23:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENUtIQTiH949ayUO0n64DI+W13Cd0LYVyie5G9b3GrNFyICIYDd0Xx0nCu+hVBZqsPuJ4DLw==
X-Received: by 2002:a0c:f40e:0:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-702c6d89379mr3028786d6.32.1751584988220;
        Thu, 03 Jul 2025 16:23:08 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:07 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:27 -0400
Subject: [PATCH 03/10] clk: qcom: rpm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-3-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1752;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=xV38q5FTl0giHcO6B1fUUKKklwS+ypfUiAE8QJ9ufs0=;
 b=svr9/D7uxrC1Dyo7FmzxHVdb3SQ3e3f4HK+SsFrtv7eZKxGDXZOMRTNco/2iQ/OKe5mC+FRhE
 8ilIx65qxJ/DEVqiPHJ60/E+M1hDDeodgGsGMkUI7YBfZ4ZMx7XNLc8
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/clk-rpm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index ccc112c21667ebf8522b06b37234f46c69b07698..be0145631197bea65438f3bed10344f18d6de802 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -351,15 +351,15 @@ static int clk_rpm_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long clk_rpm_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int clk_rpm_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	/*
 	 * RPM handles rate rounding and we don't have a way to
 	 * know what the rate will be, so just return whatever
 	 * rate is requested.
 	 */
-	return rate;
+	return 0;
 }
 
 static unsigned long clk_rpm_recalc_rate(struct clk_hw *hw,
@@ -383,7 +383,7 @@ static const struct clk_ops clk_rpm_xo_ops = {
 static const struct clk_ops clk_rpm_fixed_ops = {
 	.prepare	= clk_rpm_fixed_prepare,
 	.unprepare	= clk_rpm_fixed_unprepare,
-	.round_rate	= clk_rpm_round_rate,
+	.determine_rate = clk_rpm_determine_rate,
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 
@@ -391,7 +391,7 @@ static const struct clk_ops clk_rpm_ops = {
 	.prepare	= clk_rpm_prepare,
 	.unprepare	= clk_rpm_unprepare,
 	.set_rate	= clk_rpm_set_rate,
-	.round_rate	= clk_rpm_round_rate,
+	.determine_rate = clk_rpm_determine_rate,
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 

-- 
2.50.0


