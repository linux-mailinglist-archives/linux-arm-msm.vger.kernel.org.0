Return-Path: <linux-arm-msm+bounces-18812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CF68B5C67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 17:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A9BB2819A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 15:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCDB82866;
	Mon, 29 Apr 2024 15:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ly3b7w2l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6FE81745
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 15:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403087; cv=none; b=BhOpRaDTeT1lKPhp/O/ureNWB5/VAbKv4RqzIT/VYetUUsr51ZzXoZpYiE0aZHSzDk6/7UfuN9qIucsmbbFZFEyjV/IStrWsaPTWxn702tmPZQ5dneq+4rNQV6pLB+/oQT0p++WuIR4ykMz+zoDGhKoKlHGt87yanYgTWDdSJsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403087; c=relaxed/simple;
	bh=urLejDAQyDwbji+siqv8Du9RbhkbIBb0Js/GJvw2ut0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=loZpuum1AScLMCy29SN8VvEEf0xhdw8EX47se8ZwM4bwkcoWRLlGRUYjNf7AQbhRBKD5Nx49+M9EwlfqkS+8YFl5VkgrluDuRUBchfMJOlk4t74UGCUxdcuLWyTLgNHEsNkDNHLVBL3KuEUrjicTFtgsIo+ynDvA8LYmQa2x7p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ly3b7w2l; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-78efd533a00so336949885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 08:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403085; x=1715007885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBoYdFZFpJunUvgv52P8o/805oLnG0rRdaJVdgyqfIE=;
        b=ly3b7w2ldh9tt7qi4JOWn/CMOZMz+OYVG6YUlFxRGgCKzoq4hpxr9X/913NxU+opE3
         It4LRZgp7qqSYZLLXk74gAHL+aeCnJqVcWpEAK0/Is+hx5HuANk4ZEIfVbqSzXQAX/k1
         k/rT+rilwSu/eK7owA9o3wVS3Bina1cD5i0C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403085; x=1715007885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBoYdFZFpJunUvgv52P8o/805oLnG0rRdaJVdgyqfIE=;
        b=fmkXM/oq7UQb0qIGCVno/FBS9EekCmxQ5ED86+aadryGM4aTvNgl3BYMXryBXTqhIc
         /pSkuEPFDUBqu+cBV+5NlVajQF5Cr+RyNa14FwIa9LbTy7XHn7ssLJFlYVwqcdPr0zVZ
         9iB/RgZ8c0X4MwPl0Bs+H0zcO9Dx+0OB3l7v8zAZcFqs3vkelT6h15NT4hzS7YAv89hX
         vreNTaIeqWBS+BckqtVt6rFbNOwNmOMroz1hw2LY9hBTfPptR0UPUgDHj82ePaG2K3+z
         1hgyAdEPPZ2/hkB5sLlcDsG8wqoZwvfMir8a4wDdK+Xqm6eOzGtJzA00rVhjTeMu1I10
         OviQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIOrnRoDe51kjBlx3iY9t7UKlMzD+vVHOc1Ta7hMbCogRE4rUD6E/Lb+XuztUH5f5IljKDgJCFce96HLDYq0szxKmnvCFsbo+i7w+f9A==
X-Gm-Message-State: AOJu0YxwQZuj8z/ah77Rh5/1B8WUiwf38yj3vRaJce++3iY+jm6LyB9e
	vS/NqskAmhZYlIIb5469lYpWjszcxX2MWuSTAw6K4r/2Qt4ev40JL+2KEWUz+w==
X-Google-Smtp-Source: AGHT+IF+chYPShGmmjcrkgz/giMi8LlMh1kKDt+AWNRJgL6Fjthaoaa54O+J4vw4mx2W4IdeglySVQ==
X-Received: by 2002:a05:620a:39d:b0:790:944d:65b3 with SMTP id q29-20020a05620a039d00b00790944d65b3mr8124237qkm.62.1714403084821;
        Mon, 29 Apr 2024 08:04:44 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:41 +0000
Subject: [PATCH v3 02/26] media: stb0899: Simplify check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-2-3c4865f5a4b0@chromium.org>
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

chip_id is an unsigned number, it can never be < 0

Fixes cocci check:
drivers/media/dvb-frontends/stb0899_drv.c:1280:8-15: WARNING: Unsigned expression compared with zero: chip_id > 0

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/stb0899_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/stb0899_drv.c b/drivers/media/dvb-frontends/stb0899_drv.c
index 2f4d8fb400cd..35634f9a8ab5 100644
--- a/drivers/media/dvb-frontends/stb0899_drv.c
+++ b/drivers/media/dvb-frontends/stb0899_drv.c
@@ -1277,7 +1277,7 @@ static int stb0899_get_dev_id(struct stb0899_state *state)
 	dprintk(state->verbose, FE_ERROR, 1, "Demodulator Core ID=[%s], Version=[%d]", (char *) &demod_str, demod_ver);
 	CONVERT32(STB0899_READ_S2REG(STB0899_S2FEC, FEC_CORE_ID_REG), (char *)&fec_str);
 	fec_ver = STB0899_READ_S2REG(STB0899_S2FEC, FEC_VER_ID_REG);
-	if (! (chip_id > 0)) {
+	if (!chip_id) {
 		dprintk(state->verbose, FE_ERROR, 1, "couldn't find a STB 0899");
 
 		return -ENODEV;

-- 
2.44.0.769.g3c40516874-goog


