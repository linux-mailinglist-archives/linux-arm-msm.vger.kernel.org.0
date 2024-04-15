Return-Path: <linux-arm-msm+bounces-17477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7048A5AEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 21:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3102E281365
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 19:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC7615D5B2;
	Mon, 15 Apr 2024 19:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Aeqhcgaf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C44515CD72
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209685; cv=none; b=btx13CbWC9wFUMzxm/GIDJ/gJuoIoHkoYbyuzBP6oneYDktb5qaIa1u0cEBY8gcvApcoSY4FJoGACYTyghp23JRpz2zEIXpGpXGLtubmaxBHjmcHoHmr8V9dgyOeki8+Zy+j233CuvmpBISnqPZDqGU0rfXKI92Hs/23+Kknj9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209685; c=relaxed/simple;
	bh=TRXkeyD5B7i5Fvl5qiVizRnVLIh9J7FqryymiPqCftY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r1MBIpe/zhBxMr0fMGQKeJThppEdb6IjykBlP6jtiHBydwOE6izyQhX25KZpuP/389hywpvmHojbKUomRgox0/znnbVNReGE0+sHvp4wf40Ek1YT4aaXy5JLb+cSxPDixzWXKnY558ddEZq0lXDrRQtJyM2lAyvr08GaWJLTDTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Aeqhcgaf; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78d77b309f2so322272985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 12:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209682; x=1713814482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CefUC+YxzIgWNX8CpaofkTMnPwq7GRiYus7oOXvNDPA=;
        b=AeqhcgafjHbyb8oWJvIzyzbABtR8V0l3RO8ouA/Y+q4INKanS8yMeeTKYyXvZgl3Z/
         xM2LsdDgtIj4PfmOvnksT9rCECuvr6z9EfENJpMV1i7ZUVTzzkONmyHr40kKb8/ejQvN
         icgG7magxBJCg0lgU1mYpi52GqKe+G4YQYbXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209682; x=1713814482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CefUC+YxzIgWNX8CpaofkTMnPwq7GRiYus7oOXvNDPA=;
        b=cv9TnBHWSok6bjgzwbDgzYfcSCXGLkXg6rEd+riSPSwBlsxzGTf3SK8Vk1YgAhsovJ
         n2NdHkOJsSk2Ck+6xVG5yC5PgIGIq5yZ3drSzC2YdEtHDbCqG8qksaYh7tMxWa/fQWvo
         EpWG7Nr6hkiGT1b3jX/MwlkT0bHi2D9y+3PEHLrTykTtEYkZUPEnVD3AmarDlIMaAi+c
         ZR4wZPA06wMlRVbSQBmkuQ76VGR5qc0Wbu528pcLZ38E0wjV0ubenFWp6VlaPySUa5aI
         4S6M0Gha0e+e/2IWRgE9uks8dUpEOHkQQTCYS3kmr2nw33ocmqwMf9gZMIaroNwHqUGy
         CgLw==
X-Forwarded-Encrypted: i=1; AJvYcCWOGycXgesWYJTozEh0ThWo7qxFGn3dFdO780rn1YkCw5PYWy6B8+7mkVOvQFVyuaKlP0uWQ8XMHIZGm33WSzOm0rjGeAQ7jlVnI/2brw==
X-Gm-Message-State: AOJu0Yxcwb6TbqvVgFw639e83OqeClxI1BtMmiIK783S1kC1Uwx6y6XV
	El5hM0fwwQSjK1TJQgcX2GpA2WNx1j+sFDmo4g5kZH3MSh4zhOkvS9Watgyo0w==
X-Google-Smtp-Source: AGHT+IE+3KdNYzINGLb3rrR3dbCdrA74Ddhjd2P3YHrcD0Jca/9uMwZH+j5PP3pBwpJxZ8tf3OsdUQ==
X-Received: by 2002:a05:620a:5a6e:b0:78d:6786:7637 with SMTP id wx46-20020a05620a5a6e00b0078d67867637mr11767547qkn.71.1713209682098;
        Mon, 15 Apr 2024 12:34:42 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:41 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:30 +0000
Subject: [PATCH 13/35] media: common: saa7146: Use min macro
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-13-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Simplifies the code. Found by cocci:

drivers/media/common/saa7146/saa7146_hlp.c:125:36-37: WARNING opportunity for min()
drivers/media/common/saa7146/saa7146_hlp.c:154:41-42: WARNING opportunity for min()
drivers/media/common/saa7146/saa7146_hlp.c:286:35-36: WARNING opportunity for min()
drivers/media/common/saa7146/saa7146_hlp.c:289:35-36: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/saa7146/saa7146_hlp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_hlp.c b/drivers/media/common/saa7146/saa7146_hlp.c
index 7569d8cdd4d8..fe3348af543e 100644
--- a/drivers/media/common/saa7146/saa7146_hlp.c
+++ b/drivers/media/common/saa7146/saa7146_hlp.c
@@ -122,7 +122,7 @@ static int calculate_h_scale_registers(struct saa7146_dev *dev,
 	xacm = 0;
 
 	/* set horizontal filter parameters (CXY = CXUV) */
-	cxy = hps_h_coeff_tab[( (xpsc - 1) < 63 ? (xpsc - 1) : 63 )].hps_coeff;
+	cxy = hps_h_coeff_tab[min(xpsc - 1, 63)].hps_coeff;
 	cxuv = cxy;
 
 	/* calculate and set horizontal fine scale (xsci) */
@@ -151,7 +151,7 @@ static int calculate_h_scale_registers(struct saa7146_dev *dev,
 		xacm = 0;
 		/* get best match in the table of attenuations
 		   for horizontal scaling */
-		h_atten = hps_h_coeff_tab[( (xpsc - 1) < 63 ? (xpsc - 1) : 63 )].weight_sum;
+		h_atten = hps_h_coeff_tab[min(xpsc - 1, 63)].weight_sum;
 
 		for (i = 0; h_attenuation[i] != 0; i++) {
 			if (h_attenuation[i] >= h_atten)
@@ -283,10 +283,10 @@ static int calculate_v_scale_registers(struct saa7146_dev *dev, enum v4l2_field
 		}
 
 		/* get filter coefficients for cya, cyb from table hps_v_coeff_tab */
-		cya_cyb = hps_v_coeff_tab[ (yacl < 63 ? yacl : 63 ) ].hps_coeff;
+		cya_cyb = hps_v_coeff_tab[min(yacl, 63)].hps_coeff;
 
 		/* get best match in the table of attenuations for vertical scaling */
-		v_atten = hps_v_coeff_tab[ (yacl < 63 ? yacl : 63 ) ].weight_sum;
+		v_atten = hps_v_coeff_tab[min(yacl, 63)].weight_sum;
 
 		for (i = 0; v_attenuation[i] != 0; i++) {
 			if (v_attenuation[i] >= v_atten)

-- 
2.44.0.683.g7961c838ac-goog


