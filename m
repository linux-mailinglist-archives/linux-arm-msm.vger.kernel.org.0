Return-Path: <linux-arm-msm+bounces-1150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 549BC7F1447
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 14:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D90DDB218BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 13:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC471B26E;
	Mon, 20 Nov 2023 13:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iWKVhgP0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA8BD61
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 05:21:37 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c59a4dd14cso52556321fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 05:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700486495; x=1701091295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4fo0VIV7uqzpyPDAWdX5Jk/6XQkZo9JW17PTbGLI2E=;
        b=iWKVhgP076gRs6u8mUnAthn3b+GbXzgyQq5/RZYt6OLIwMKauhpxdm78RN051Dmf7x
         QGJB+ouz5PCIozPqN17L2wBwF+Pp5HRyRj9XppfvUX0T3yqEKbSnOUT+12FEvC6+T2Dg
         c3qS+Sf73T49xawNZoLtGXnZuy7qVdsJEbZxk1/TctVOfXG5VWnDz1UTHGMXPHhks+Lz
         QG9m0rcCEIEtQ5Jwj9JD9JmS/59MihtOFZkvd4tIShke4r89BIiW18RnyedYTuC0zjHJ
         f+RfBGYfl4NVHz4elGxDsLZDa0Pp6xydLvQq51FAP36/iOSedfB+1Oudch0PBa9N61Ck
         HueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700486495; x=1701091295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4fo0VIV7uqzpyPDAWdX5Jk/6XQkZo9JW17PTbGLI2E=;
        b=auswKLIRhWfdozGHhEEEANF/7pDY14YbmoDrIFlpVfMHyoWb+oC8jbwOw4hbwOXFbO
         YOD8aNaO05TBmFcgmA3f8yCRqdK3WLfPUlMXC5nE2NMB2foi99IVku+/doco3Nx7EvJa
         EQvjomanU/M40JJQ+MDrBod4Obq7zVZvfFOY/e+tE6lrPGNxzWIO35KTwl3GVd9+rznk
         rCpILgE7dN4Sk9VQVsSHpPlzlA7RpanjIrQl/FrXS4rcFYs+Rx1Yg6g1aggy2oy9ryTv
         RZ+3NhlSH27JhUsuF3VtJrVz0n+fPPvUeY5Vb3nf6FX7RGxs5FXuH+c8RbqIr3WpO5uG
         IPwQ==
X-Gm-Message-State: AOJu0YxqmnxZmXhJdJk84BB7Y0v77SCnsRZyaXJCiqu5+dkWwJ2lerQJ
	8Vcy0oAkrDaEzLEzAxOtAUJOXA==
X-Google-Smtp-Source: AGHT+IFXdb7gzI4IMHiMj9vg7v37YVPJ3yyM6zb9TaX7RJaZc8/c+c1k+S0o3wgmpurQ4luAiGdbmQ==
X-Received: by 2002:a2e:9e02:0:b0:2c8:7130:c6e5 with SMTP id e2-20020a2e9e02000000b002c87130c6e5mr4656583ljk.6.1700486495208;
        Mon, 20 Nov 2023 05:21:35 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c590:a7ce:883:eba3])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c0b5200b004065e235417sm17329192wmr.21.2023.11.20.05.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:21:34 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RESEND PATCH v5 11/12] firmware: qcom: scm: clarify the comment in qcom_scm_pas_init_image()
Date: Mon, 20 Nov 2023 14:21:17 +0100
Message-Id: <20231120132118.30473-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120132118.30473-1-brgl@bgdev.pl>
References: <20231120132118.30473-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The "memory protection" mechanism mentioned in the comment is the SHM
Bridge. This is also the reason why we do not convert this call to using
the TZ memory allocator.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
---
 drivers/firmware/qcom/qcom_scm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 839773270a21..7ba5cff6e4e7 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -563,9 +563,13 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	struct qcom_scm_res res;
 
 	/*
-	 * During the scm call memory protection will be enabled for the meta
-	 * data blob, so make sure it's physically contiguous, 4K aligned and
-	 * non-cachable to avoid XPU violations.
+	 * During the SCM call the hypervisor will make the buffer containing
+	 * the program data into an SHM Bridge. This is why we exceptionally
+	 * must not use the TrustZone memory allocator here as - depending on
+	 * Kconfig - it may already use the SHM Bridge mechanism internally.
+	 *
+	 * If we pass a buffer that is already part of an SHM Bridge to this
+	 * call, it will fail.
 	 */
 	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
 				       GFP_KERNEL);
-- 
2.40.1


