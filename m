Return-Path: <linux-arm-msm+bounces-64420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9E6B007C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 17:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37EA41C44DA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 15:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE1827CCCD;
	Thu, 10 Jul 2025 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LxsQQNRD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDCF27A131
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 15:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162720; cv=none; b=rk1HaYTJHwAATqPP83ouGWorHnpxRBXvzY3dm7wElwXlEWj/gH4imO0P2Xbv6fEBXW6E498KT5BVrbJecKWFTwqwJ55Zkr9wnjhLuuTFqFpPkOSGlUDmZJMBMcYP8R/5QmMHR3BsmXpFQBNiCsNhj4J2tbrmAjlLDetRHSsflWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162720; c=relaxed/simple;
	bh=irsEjDFgWLJcIRLSdB719V4Ehwxr6Hq/ROabLh9M7vY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L9TN2OIiPGAP+Zv0XNR7L4ZBJhKfdq26w2+qDOzcMOn2ZdVYecWou1/QikyD0MEvN5WgNxOddOXIUNcsZYVUynL+DANhKd9stfEYIFHLUBKoXvNkIoOTcN2LTkSRzq7hng0rr/mv42pwiKGLx2OeNO0V/je47WmKorBcT8t7GfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LxsQQNRD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eG1BadWZpL7H715pVBNXXfvnkpwspQ8t98toz4xLpZQ=;
	b=LxsQQNRD5kYg8iuL/gL1TFABlTHwjoIEEkBAptN2ASi7pZ9NWppQh5/MwR8gMV6lXle1sU
	F5LWtKHi1sm/SDHAc7+aeFqct17j7HNtXE7vR0DGnuPJfa20jKwnzBgaJ1WEu9MIUaSxCD
	h5xHtYfnUUtdhxBWE01sifML+AF6Ntw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-Cq3gQda5O3SLj7K8Z-k6sg-1; Thu, 10 Jul 2025 11:51:56 -0400
X-MC-Unique: Cq3gQda5O3SLj7K8Z-k6sg-1
X-Mimecast-MFC-AGG-ID: Cq3gQda5O3SLj7K8Z-k6sg_1752162716
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb520a74c8so21041776d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 08:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162716; x=1752767516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eG1BadWZpL7H715pVBNXXfvnkpwspQ8t98toz4xLpZQ=;
        b=AdUtHcez5L1NfJ+HQ4yomETlRn8YHA66nOq5isB+KoGzSoDrEJK9WxQCtB22vxcqAK
         65E4NomHxe7BepHSZ9O5wVlLAYPsitMDsgwI7i7fFGw/3jkzRt15xCSf3Hr4+xWN2d1m
         WylUS/QyW1F3lb0cBlbNJjwyVIEaLz1170Sw9TAq9WsXed6b1tGxpcaWrh+H4uI8KXrV
         2AZftuHd7rG/ihxXgWX15rv+DBvDV+eJuUdCxKDqVX+K3+4Dl6CBVV5l2lzRY5jl6I6L
         cz4XMpZgPz9u7HegPsSXb0mallKGgosq/LX9N6iUunKXsPD9LWSCbNFDinDNrJD1oRLS
         L1Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ/ks6zCsKtKdRgJBmbnOovVJhZJn8Wrtk88JRiiP7LkAiK4XRuxa4VQ6FBHvK6FHYSgkz/UGNDDHLhO8b@vger.kernel.org
X-Gm-Message-State: AOJu0YwSZIOmSV1EXvNwdKvbKViLYoDtjESJia0WCUw8+fae7BADW3l/
	qaQjS+oR8+6suue05IxU6IXy4d6HYtNirB/DI/+ea7/Z3R6IHlgOQgEwKfzGGsSvORDCynqKQGy
	Jx4I/xwct+FuDXV/H2Zj9BIYN+kU2rkAmvSeKGV2/bgx8ue4gRAkFqQS0m7hQrvQ/3Ac=
X-Gm-Gg: ASbGncs0HpFAksgqEvzAvorH4IJ2Dvc1zS1Mkz01CiY7kiMPdPZNed5qq2Qb2Z1eT61
	hSIWQOFX8ISLQzpYwCqtf7tITsLyKBDn+x2LQiT0OIWNhX4nxgov2loAhDKyy/NytydtbWO6kb0
	QYGmJiyBKks4gmil8bAjH9p9jmydqd8Jpe6pJCG9Xjc21lyFLekLfmDA7ZoBZyeZwqNSrW8mSPL
	9LsHAmd6dwFrYejinUlR7Zo/K9FWsRFeIn2lkyz07dVjJXRq5JVN1wgJEQs0tl1xsPnYQ4zm0Wh
	QL0LJQr0fnzrBgswUht1BBh9q+4UyKyg8kk9HCcKyumtS5Lzjqu1j9H+FnWB
X-Received: by 2002:a05:6214:2e92:b0:704:9588:f0b5 with SMTP id 6a1803df08f44-7049588f0d2mr46864626d6.16.1752162715903;
        Thu, 10 Jul 2025 08:51:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhATSlh+JJuRzkMWsk8YJM8HUQ4igJGizu8oIXouI4tsZbHB3hz8OxedljaxwZ18b6yh4tAA==
X-Received: by 2002:a05:6214:2e92:b0:704:9588:f0b5 with SMTP id 6a1803df08f44-7049588f0d2mr46864246d6.16.1752162715355;
        Thu, 10 Jul 2025 08:51:55 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:54 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:11 -0400
Subject: [PATCH 5/6] sound: soc: stm: stm32_i2s: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-sound-clk-round-rate-v1-5-4a9c3bb6ff3a@redhat.com>
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
In-Reply-To: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=1800;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=irsEjDFgWLJcIRLSdB719V4Ehwxr6Hq/ROabLh9M7vY=;
 b=w46CeQJbLms7jsanP0xDGuQgHsJotX9gQmmNfNXgBWY+HckWjmp9QYjCSEVuxHqbdfSej7iYE
 m2Ah4xmtB30AIx+iZaZOBsQNN8TYWOwYh9Bcz8BF3HVHSMRZ3eurvHX
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 sound/soc/stm/stm32_i2s.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 6037b7a9c97bf25621fccb1feb59c4caee3250ca..0e489097d9c1086efcd9e3d1013acffeb0a46d4a 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -461,20 +461,25 @@ static int stm32_i2s_set_parent_rate(struct stm32_i2s_data *i2s,
 	return -EINVAL;
 }
 
-static long stm32_i2smclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int stm32_i2smclk_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct stm32_i2smclk_data *mclk = to_mclk_data(hw);
 	struct stm32_i2s_data *i2s = mclk->i2s_data;
 	int ret;
 
-	ret = stm32_i2s_calc_clk_div(i2s, *prate, rate);
-	if (ret)
-		return ret;
+	ret = stm32_i2s_calc_clk_div(i2s, req->best_parent_rate, req->rate);
+	if (ret) {
+		req->rate = ret;
 
-	mclk->freq = *prate / i2s->divider;
+		return 0;
+	}
 
-	return mclk->freq;
+	mclk->freq = req->best_parent_rate / i2s->divider;
+
+	req->rate = mclk->freq;
+
+	return 0;
 }
 
 static unsigned long stm32_i2smclk_recalc_rate(struct clk_hw *hw,
@@ -530,7 +535,7 @@ static const struct clk_ops mclk_ops = {
 	.enable = stm32_i2smclk_enable,
 	.disable = stm32_i2smclk_disable,
 	.recalc_rate = stm32_i2smclk_recalc_rate,
-	.round_rate = stm32_i2smclk_round_rate,
+	.determine_rate = stm32_i2smclk_determine_rate,
 	.set_rate = stm32_i2smclk_set_rate,
 };
 

-- 
2.50.0


