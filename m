Return-Path: <linux-arm-msm+bounces-82029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D02AC6261C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 06:19:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DC6854EBA57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328CE315761;
	Mon, 17 Nov 2025 05:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="CK3hVbv3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B772314A74
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356639; cv=none; b=DOnERJYIJ1Hzuy83jjshz/G0OnqD0SwWSqObK8qUkNjMzNGJqh7s706UIv9Nd6n+IenLTpLbjjWP17qIdFshkz8MWPmvvpmJD7SMB8z46goZ99Ucv4S3HCXa1InO/wX2Evlh084Gf65+JxnD90w1Iec/ZFyNRmrvseZlmDXvth0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356639; c=relaxed/simple;
	bh=nxfCsocaK0cFweuyt80/qsHaaKO8U7Cv6z1iAWrdcgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IBlYInmCJPxdWb6q0HzkabjUX56S5z0evBN822N5GEUjsiRxAEcqivohDq1i92FxnvLNi1zSdkb27aDzYxZlDFd1rFYOy7eAWPXhkz8wSM58F5OyNnuWlMzXI+4Xve2VReFNBbiS6tjDX7JL54QV+5d5Fn+cKIEqXiWJCaLA7oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=CK3hVbv3; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b2dec4d115so140928285a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 21:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763356636; x=1763961436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhu/xwE3akCLuvlVIvCt12pssctwOpgKAURZZ/wZRw4=;
        b=CK3hVbv3qRcHEXQxGd5g0lfeqsVXtRCkIKIbyDCZlrQ4neZlweaHo7Tx+TU7ZBNkrA
         hBVeHtMeikqHdCl62LvW7M67tsdfm6J7lrpy/7+E/UoPN791/x2DJPt4jH21Wuh3Lc5a
         w4Fgjj8ld9epHKhTSsaEw7uyT/+BbbBlRXyx4nkmRhi4K/XEAyRDbOM8qIJEqe5fbZvg
         6JUbAoTWVWQbvEXh94eSUokMRMNHPXr8pGo+WbqNBZq0NSBkwsWlVrAF+MgpINOYtOMA
         g+Fnnr6ZdtzDGOfQp2ujdpReIvZCBdq0TIwjF7CNFmk1f6NMeLzWJMWYAzRFV6J6iCpx
         DERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356636; x=1763961436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xhu/xwE3akCLuvlVIvCt12pssctwOpgKAURZZ/wZRw4=;
        b=b+KEVBMIjxP5SFjpDkvtzMupLYSlLX7zXNkDBZkNkA/0GDu23pjw6T9AG3/tPj5Zxl
         grBw1oc8nY1JikgUsFfNdcEYGhZIFFUxAzkRaIrZMWakDUPAVESmcm+Sqb0NCclNLC2H
         EdZcDIk8CKBa4XG68bJXPikGD95nKjYU2mZsVwukuH+xRrwGv2whwfsiJdkC/PUvu8Sd
         2Q82NzYnGF//BkM28084/YD5o/I9S91AawwW0hsEJ0fkDq9N6lgmDs+KL4mN0ApSUQku
         JHNqMqxYgYsd1jLhJYb1KINcUi8ni8L2CF8v4sN0uUnWUZksxxdys6bzv8PL3OFhl+2k
         cLeQ==
X-Gm-Message-State: AOJu0YwhbN0uVg0D7QylK+1g8M/WnGZTuhp8DXmV8sGkE9LYhwc2moAv
	J1h7n/CrV5HQuXgcY5YeOdIIL/7bkneJQIbvSA++uKMCuvnsbvz5Yn0+t80V01EKq+Ohv3I56qq
	CYKHp
X-Gm-Gg: ASbGncs9Cz7mmUjl+ZTKM0Tv7RA3sUhwroUJIuuAXwfbQf9aOIlxj6sq1694IdECiqG
	117X4zwBbhIMEIgNONXWMbg91HizKgnvKhNf68gRVFdle1rd6gJEzr2aG/Tb1a4JrjuvTwEBtRD
	4tH2aLpz/L+m19Hgy8700Wa0txO5y9mANPJA30jzDahlJsT7HzFdf6nF3PyXxmp/BHbYE5EemfX
	o6Yr0lGiS3dO3rJ/h5KbimGPBB+EnCHwm6U2q3XYeDsBvEWTbmzPO2gy7ZcE1n4XdWquRkVH16a
	7q8iA0YVcCHPqOmvpqeBQS2XGuM9ytYGAdWGfmn2+d20gD49RFsRoi7r3/zXalZLGAMr8gaHQBj
	e/JMICL4+uFfInxLH5TDXuRpvg19Z4ebw57os69B+BhjXvB8ZC7LH/nVyS3AFTrL8TiPXkXWte9
	dmd+YsCps0zfjWqCx061QMyMZaCCf/pZCcgzXzfUjk8WH0JR5ZlFay11Q=
X-Google-Smtp-Source: AGHT+IEgJnqQ0EhhsbG4Q0ct0bfnX4ZHO7Bu8ZyywX9Vj3w0sULS5OMvdnUpE3L4eiQGjIBhYG/pUQ==
X-Received: by 2002:a05:620a:199c:b0:8b2:f145:7f28 with SMTP id af79cd13be357-8b2f1458d4bmr183844885a.33.1763356635974;
        Sun, 16 Nov 2025 21:17:15 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aef2f936sm906417185a.29.2025.11.16.21.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:17:14 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/9] ASoC: codecs: lpass-wsa-macro: fix path clock dependencies
Date: Mon, 17 Nov 2025 00:15:16 -0500
Message-ID: <20251117051523.16462-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117051523.16462-1-jonathan@marek.ca>
References: <20251117051523.16462-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"WSA_RX0_CLK",etc. are path clocks, but "WSA RX0",etc. are ports, and there
isn't a correspondence between the ports and paths.
For example "WSA RX0" port could be used by the "RX1 MIX" path.
The problem becomes obvious when RX4,etc. ports are added.

Enabling the path clocks should depend on the path being enabled.

With this fix, the main path clock will be enabled whenever the path is
active: previously using the mix ports only would only activate the mix
path clock and no audio would play.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-wsa-macro.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 06570e474c850..27c8c060cab19 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2496,10 +2496,8 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
 	{"WSA RX_MIX0", NULL, "WSA RX_MIX0 MUX"},
 	{"WSA RX_MIX1", NULL, "WSA RX_MIX1 MUX"},
 
-	{"WSA RX0", NULL, "WSA_RX0_CLK"},
-	{"WSA RX1", NULL, "WSA_RX1_CLK"},
-	{"WSA RX_MIX0", NULL, "WSA_RX_MIX0_CLK"},
-	{"WSA RX_MIX1", NULL, "WSA_RX_MIX1_CLK"},
+	{"WSA_RX INT0 MIX", NULL, "WSA_RX0_CLK"},
+	{"WSA_RX INT1 MIX", NULL, "WSA_RX1_CLK"},
 
 	{"WSA_RX0 INP0", "RX0", "WSA RX0"},
 	{"WSA_RX0 INP0", "RX1", "WSA RX1"},
@@ -2529,6 +2527,8 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
 	{"WSA_RX0 MIX INP", "RX1", "WSA RX1"},
 	{"WSA_RX0 MIX INP", "RX_MIX0", "WSA RX_MIX0"},
 	{"WSA_RX0 MIX INP", "RX_MIX1", "WSA RX_MIX1"},
+	{"WSA_RX0 MIX INP", NULL, "WSA_RX0_CLK"},
+	{"WSA_RX0 MIX INP", NULL, "WSA_RX_MIX0_CLK"},
 	{"WSA_RX INT0 SEC MIX", NULL, "WSA_RX0 MIX INP"},
 
 	{"WSA_RX INT0 SEC MIX", NULL, "WSA_RX INT0 MIX"},
@@ -2568,6 +2568,8 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
 	{"WSA_RX1 MIX INP", "RX1", "WSA RX1"},
 	{"WSA_RX1 MIX INP", "RX_MIX0", "WSA RX_MIX0"},
 	{"WSA_RX1 MIX INP", "RX_MIX1", "WSA RX_MIX1"},
+	{"WSA_RX1 MIX INP", NULL, "WSA_RX1_CLK"},
+	{"WSA_RX1 MIX INP", NULL, "WSA_RX_MIX1_CLK"},
 	{"WSA_RX INT1 SEC MIX", NULL, "WSA_RX1 MIX INP"},
 
 	{"WSA_RX INT1 SEC MIX", NULL, "WSA_RX INT1 MIX"},
-- 
2.51.0


