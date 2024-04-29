Return-Path: <linux-arm-msm+bounces-18831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDBB8B5CC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 17:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ADA0281059
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 15:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7687512C465;
	Mon, 29 Apr 2024 15:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dThykxgo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F90129A74
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 15:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403111; cv=none; b=NmpdtjnhMvrZWUugAUrgd8g1Dx8+73lotUYqU6VpY/DVzI/astSI8NDGx6FK4GtorDP1hIxVRFmxwyPrazzeeL8quzsn839XEMScV9L6iXRH9GhmszKPnLUsz1rDsEAEIErcvkWfEXT6zGPCVLhi9/zjLgHvH+2wfuPHK8j0Q3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403111; c=relaxed/simple;
	bh=jlNXpmWLkhoBvAVUnCnFp5WG/uIoSkDxDimhD2tWIcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uqcpRZW6oOxMq3J415r2daxteYWbM7p5N3dH0qx87G6WR3yCHAGhBI+YpuIIhpob6YgOz6MRiWgj7z8MgOBFhvZEix79ott8j6kgVcf2sBXOdPHgnrapw+/WEuDpyLdIO8XhrAqJwrsballNPt/I3M5UflKLz4RVxypPeEtRqC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dThykxgo; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-790f699eb2cso103554185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 08:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403104; x=1715007904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OKO6D6+Uymjr7y5phUxNbL6FrIK2B37/+KaDSdt/b8=;
        b=dThykxgobM784tJZMzgxIe2MO7lURGdnGjwmcK4JdKkjGDmvekBIC9ZG1QK2G82ggl
         GfthJaw2M3InyVw7LrUgeeJ7DCXxovmFRwTqiK4Uwa94Z0daiCQesqo9kvr5D4U2OaOC
         ZaYdVO7H6LriZkQmKHpqXp3M2IX5mg+awbOec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403104; x=1715007904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OKO6D6+Uymjr7y5phUxNbL6FrIK2B37/+KaDSdt/b8=;
        b=q/OrSctZs47x9OWIOdd+dCq+0OWfwSOlqZIVqMrAJ7IHsr2as5EVgs/04LJWfovByB
         JR8ux0ZbhMHI52gbuofN3rLW2bhWnWrUC0H6QoWnIOc8aDeJbY5aVF6V6svU6vv8rY4f
         9Iobs70Rs7S4EMv5mH39JTSRrg1RXn/0b5LLYAmGT9JabXNDpmbP3yakHwzyWLdHDfes
         8MW6/5ihCPaDjwzbgRizS72ha93CWey960GiekebbrPLlCKyPzCIewbHwybfU1Jx8cjF
         Yz4w+n4pC+JIx1PIBL8z8iB0OiKG9PbMUQwBCQGnEaZ9Mu/LQ78nx2jQ9TN4c//Y3N7f
         OxvA==
X-Forwarded-Encrypted: i=1; AJvYcCVNA3boStlv8va0oM+1d6YD6FxBCo7qSNnIPil7npLvfuciRrGn/a9g5RBtENXuRQjFCSrRWc6otDF6m9dZmXh+KLSgLUGN1R6+ckJ49Q==
X-Gm-Message-State: AOJu0YzKzIO+XnTR4D0Y6TS2V4HNY/b5+vODUicjf/IeX8feQZNE4Tam
	9sO6asYGH79bpFRF0hGyvJUdStNozt08w5wU/ReToG8249j05IsSDG6brGjdER3nm2IDndlYWmo
	=
X-Google-Smtp-Source: AGHT+IFaMtke8GiK3PVK81BO+wCQ6+s/afNMwPPBZtmDsaryJW0dODmZmCJQPhu+Legma0gxWaBb/A==
X-Received: by 2002:a05:620a:561c:b0:78e:d4f6:3949 with SMTP id vu28-20020a05620a561c00b0078ed4f63949mr12152221qkn.25.1714403104299;
        Mon, 29 Apr 2024 08:05:04 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:05:00 +0000
Subject: [PATCH v3 21/26] media: i2c: st-mipid02: Use the correct div
 function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-21-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

link_freq does not fit in 32 bits.

Found by cocci:
drivers/media/i2c/st-mipid02.c:329:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_s64 instead.

Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/st-mipid02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index f250640729ca..b947a55281f0 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -326,7 +326,7 @@ static int mipid02_configure_from_rx_speed(struct mipid02_dev *bridge,
 	}
 
 	dev_dbg(&client->dev, "detect link_freq = %lld Hz", link_freq);
-	do_div(ui_4, link_freq);
+	ui_4 = div64_u64(ui_4, link_freq);
 	bridge->r.clk_lane_reg1 |= ui_4 << 2;
 
 	return 0;

-- 
2.44.0.769.g3c40516874-goog


