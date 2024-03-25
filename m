Return-Path: <linux-arm-msm+bounces-14975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9E188A3E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 15:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10A131C39995
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 14:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F49212C7E6;
	Mon, 25 Mar 2024 10:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="awcdaXQe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642801966AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 10:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711361064; cv=none; b=nTz2HEwJXNkJBsCDc19Ymg/jz5jPvXtdlbeoQak8r+xRZY2CVULzRAQEe5xF6k6Ujb/OEbgh/+KzwxnN9U8cpO9Jt+1aPN8wpjyqNvT2dGnu3B9cp6DMWkZNnYMAe/KzNOE5SHrHCrU7g2236f+OXOwb4VEjQ/OOyl76F4Jv3TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711361064; c=relaxed/simple;
	bh=QWs5yD7pCzhRl7RqY1eyIygDCxtu2ITbSn6PwROjTD0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LGnIcDpPsYHbV8Xkf/aMZr93tV87xKJVe3b5P4Ov0aIK9PZe3GgC7dJc6OZyGR4u7eBoJOklO2I9L06QJMm6XLo3iuUxEVmJHkmDD0LEO6QYGc9mvmK+yCaMBHJ9AggP2YFW9O1nLpuI3QZtzGCYJBrTTFIyJF2btixcf/HChCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=awcdaXQe; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-341cce3e5f0so795840f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 03:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711361060; x=1711965860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vea42ognBMGcSaAHWG2mdmwkMm3Lc8ado5KZvfpR8+M=;
        b=awcdaXQeFvSmG/GFRsh+dLMO8JexYG9uCvB8cJpIzJY4QwcgmmM85vch2eRfg5o01P
         Q+XsP04eLMnXDSnINFouUB83z4vQGc4zifpUlSdwHxA5LmHaLypyizYGOym6sNSLb75B
         l9bOy1U2HDwoNZZmMm1iesR98B140CM9vQchMBx2YGgBNwKoa44Ib6K5U6SL27buHLn1
         ZCKD57Gd/0wW8bJDdrAOHIkpWtupWAvHcfxy0MyHsSD8Iq5K+v8i7y7zedGUWt3G4yx0
         LxjfhqkmiaEFGTMq38Ykqh8CXQ7OlXwDxch1o2xjyLXXY+zmi3K5kOfrAI6azEcZUHz2
         pBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361060; x=1711965860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vea42ognBMGcSaAHWG2mdmwkMm3Lc8ado5KZvfpR8+M=;
        b=ZQunn0mwD6VuSRbunRUhzlu0AAhGRDFGwxfvasz+EG5Da0PCXqIHEBhnMndYZTCJLM
         GXf71iNEntBtCTii9Gym7FptrgTjHSkO3e8NebzHpQFnu5O98MXoif1lpn3AwLqenrYn
         Qpp33jNR3PmDvXW+7YMJs7KtLUkL5RMU4s9KK3RSGVNC0SK3nARthOMyIu+I6TucgxVH
         TpXsEA4XYrABumB9TUIKcrjaVoY9UhSG/fZzeeMfbAld3Bn50ylFwOZvXEJe7KBpRIFa
         Wjg/dGwCyUy66e66qAdfwg1f9Zgbx15/t4b142+CZ8+uP3zsdXdgZ6vtFgZWZlnTUqyQ
         u1lg==
X-Gm-Message-State: AOJu0YzvLzhNaiubYS+TylYzb5AoyvJKs2ltmdaAn9lTbSJsasLcy2p6
	UPk/NydEsWdtB0NZMVk2uem9igUHkrbkMNyHjJgCfstt8FgPPIHuHsUzF0YD45E=
X-Google-Smtp-Source: AGHT+IHkCZySHrP6x9NbzchPEUB1+eY0Z3c8mhgqYy6D1q3Q3MuEQvHmA/zyMe9GnYYIHuG6ThLpMQ==
X-Received: by 2002:adf:f483:0:b0:33d:c2cb:c18d with SMTP id l3-20020adff483000000b0033dc2cbc18dmr5631688wro.32.1711361059941;
        Mon, 25 Mar 2024 03:04:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:861d:8b72:a859:4ce9])
        by smtp.gmail.com with ESMTPSA id dv13-20020a0560000d8d00b0033e25c39ac3sm9086874wrb.80.2024.03.25.03.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:04:19 -0700 (PDT)
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
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Deepti Jaggi <quic_djaggi@quicinc.com>
Subject: [PATCH v9 12/13] firmware: qcom: scm: clarify the comment in qcom_scm_pas_init_image()
Date: Mon, 25 Mar 2024 11:03:58 +0100
Message-Id: <20240325100359.17001-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325100359.17001-1-brgl@bgdev.pl>
References: <20240325100359.17001-1-brgl@bgdev.pl>
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
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 7a8d67c7b71c..1972757f8931 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -563,6 +563,13 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	 * During the scm call memory protection will be enabled for the meta
 	 * data blob, so make sure it's physically contiguous, 4K aligned and
 	 * non-cachable to avoid XPU violations.
+	 *
+	 * For PIL calls the hypervisor creates SHM Bridges for the blob
+	 * buffers on behalf of Linus so we must not do it ourselves hence
+	 * not using the TZMem allocator here.
+	 *
+	 * If we pass a buffer that is already part of an SHM Bridge to this
+	 * call, it will fail.
 	 */
 	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
 				       GFP_KERNEL);
-- 
2.40.1


