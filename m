Return-Path: <linux-arm-msm+bounces-2102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FF07FA243
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 15:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98D2EB213C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 14:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4812B31590;
	Mon, 27 Nov 2023 14:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="plkoYkmB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31203C25
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:16:26 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c8880fbb33so55624801fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701094585; x=1701699385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4fo0VIV7uqzpyPDAWdX5Jk/6XQkZo9JW17PTbGLI2E=;
        b=plkoYkmB9344i0oHWaJmZoffQRgZkzJ1Sx01e8tdZHSdQsj4PBZNoBL2aDS8zugNvt
         ix++MXL/nETMJMcpJUmIPSMPba0JFms3vZdWV11CPFjo+N/a2WPhox7AKDk323g1SIxM
         cZWTU+QlGh19thyyx7oHVuztVBPILN10g2kncaUBtk05DcsBmOHYV3YB3XT+0w49LbHx
         cVQ9aaY4vubs4CnyWKqQxMVF5WqRzgs9pMsYEnck3F+k0pfevQKwr4xT7+GmDgBfHFK8
         ymU8r2WHwsQod2Hhxif/nsejwuyURi+DFg8BkAquIi14Gzss/u5WNTuNwipKGTh6U4Ag
         m5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094585; x=1701699385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4fo0VIV7uqzpyPDAWdX5Jk/6XQkZo9JW17PTbGLI2E=;
        b=w2StQpr0y7rcvutWC2HGWfe74c2wFREF02fZW6ldJPQ8QlLEpFi5YMxCd8IXZRoKc3
         5yEuN2efwqgrHc6zqsXHBnPZr4xwumuGUN4I3PduXDU47qeUTcb5kB/IEDiGSwwKTkxk
         rzS1SAtXeOhlNJV6eacM3Bh1/LXKsjg+yWfbQ/d8a9aWOd9cFV1d1/rSfcf6Oc0uypxI
         r7hzjuoUJl0viXYVF+QV4tHm24Isbgo2F7/09cXwH/VihQYb/Wrp8tLI02xqWbbrXUUh
         jM3Xtb4+UITdkN4AJwL3GizDuniQsTihYqzs3FMefUT63DhppZqtp+q4taIG5gIa52bW
         l/aA==
X-Gm-Message-State: AOJu0YwECVJGZ4ubgrWxvWbej2vZ4DZ7IAQN23PlXPBSeAr5dIS3J8NV
	qudRWt2XAT+ZL6pTP1ImyUtsqg==
X-Google-Smtp-Source: AGHT+IE4q3cN3fNNKCJN0/rwHtASmaX4mdUnjMTHPVaZwS7nJPgA+zX7NazFQnJHsHbeV+bI2LGPTw==
X-Received: by 2002:a2e:a7cd:0:b0:2c9:a09a:dde0 with SMTP id x13-20020a2ea7cd000000b002c9a09adde0mr3080219ljp.28.1701094584920;
        Mon, 27 Nov 2023 06:16:24 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:bf33:77c7:8131:5e64])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b00405442edc69sm14658830wmb.14.2023.11.27.06.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 06:16:23 -0800 (PST)
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
Subject: [PATCH v6 12/13] firmware: qcom: scm: clarify the comment in qcom_scm_pas_init_image()
Date: Mon, 27 Nov 2023 15:15:59 +0100
Message-Id: <20231127141600.20929-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231127141600.20929-1-brgl@bgdev.pl>
References: <20231127141600.20929-1-brgl@bgdev.pl>
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


