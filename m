Return-Path: <linux-arm-msm+bounces-14985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E13A488A3FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 15:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1ED601C3ACEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 14:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6DE181BB8;
	Mon, 25 Mar 2024 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="S247ssFR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409C4196696
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 10:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711361054; cv=none; b=I+9zZbtNdjQ9nLhBNWR0ZO2W9To8n+keuKBM/t2AouRw1cunokgEQXaEl1VZn63hX8jO+5V9023SahzMsWDUMa/tmzGZJMbN5Ccvp8A0jnTEIq/bvToTo9qOUcUTiiNyOl/nV7EoUHQSXyty/0s0qJgP65FPF1z4Ddm0Hudvdh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711361054; c=relaxed/simple;
	bh=yc3TA3xqOHykGX9wkzx96KfZURh2W53MzHIuanKsFYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aburRwcuGb1+ThF28Z/5NWt0J6mcsS5ynfKZFmAvFHkMZ08H/wb5/zycchtebL9f16GCYzNPz7bQuTP9dYJzAVHSJp4vLIixdT3hPuf3gjEHaYrsIXOewmaaL0A1G7F/MVXVEAO9NTd9yRudjc5tbgFvMBpWzuKyodCHeqrmvZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=S247ssFR; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33ec7e1d542so2899496f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 03:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711361052; x=1711965852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Pvx+Hod+Kla6c/44/4Di1ACsNH6U9GMcNcbC9Uj+TQ=;
        b=S247ssFRUwdSk8T9nwaJeFrXqaE3XsUzH+RHlg1oLRmzeXvswXL4MENvqO53kz5ATl
         bPedPuaqgCAGf83V6kT1FBlSZwdeg70mVJH9OKD/IHSkvG6nc7Fm98O1o2ngcoL/8Mcw
         2W0nh9u/RjDwe9Xva3qmi8YtzaFOiqMQQwj1LnNVTNvjRnPO55hzozlbhNG/XaVSUglf
         opybVWEmLZLEIbXR32/cLqD/MNCcvhUK2d9B4geEcG45H29uDUwyzV8sw2sRolwTgeCV
         ZngxA/2+RUXh2mI0GN56nlwdMc4wrshEUEjD9QyUZttInUDK7HLXRsvZK4h4KuKkviOf
         G8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361052; x=1711965852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Pvx+Hod+Kla6c/44/4Di1ACsNH6U9GMcNcbC9Uj+TQ=;
        b=OWgsUi9z90TqQo/7ZIQMCctGoYF2ZYjNBKBM30G5nqZCvTD54iZ8F1tgu2rRU1MSQJ
         JVRh77+pxjV3Qs9dPHHXfX8v9vZLrnvnFHDeVOF5xlze3MCUVX8LZes/01hq19z+uVvy
         MAh5zhWw6RH/sGx8VLSGfTwDloqqrJh50zE1ltSoRnPPBC0vn/PooBWHZ9WdHCJMwk+a
         bUqKjDGrTdx17qjXpN93kUzy2x2LZj8Hy2l5hZU2OKWJYNIa7dnGSVvs2VOu/e38vbQ1
         LVZWg/Q1U/WAbUvjQPRm2KWRDIrFyZDmExNw0jHhVzuF7ufqvEf1/QVaiqpL8ZmTQ1TM
         qW/A==
X-Gm-Message-State: AOJu0YxCrcynznNmfrTjbL9U2iT04maD+1ilLz4nmkU6RoSDG8bvNm65
	ePRYr/JNciWP6do/fcqeeGqZK1n/G94qP8UUbO280V4WbRMOMHJR3LVdx6pXLTQ=
X-Google-Smtp-Source: AGHT+IF/JifOKum2RJKJjuImyaM+c3DW2K0mf/mB+xqoUjr7FECmMn9fB6GN+Y/rnUOjDbOdeYspBA==
X-Received: by 2002:adf:e8c6:0:b0:33e:7a71:1a34 with SMTP id k6-20020adfe8c6000000b0033e7a711a34mr4747426wrn.57.1711361051756;
        Mon, 25 Mar 2024 03:04:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:861d:8b72:a859:4ce9])
        by smtp.gmail.com with ESMTPSA id dv13-20020a0560000d8d00b0033e25c39ac3sm9086874wrb.80.2024.03.25.03.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:04:10 -0700 (PDT)
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
Subject: [PATCH v9 06/13] firmware: qcom: scm: make qcom_scm_lmh_dcvsh() use the TZ allocator
Date: Mon, 25 Mar 2024 11:03:52 +0100
Message-Id: <20240325100359.17001-7-brgl@bgdev.pl>
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

Let's use the new TZ memory allocator to obtain a buffer for this call
instead of using dma_alloc_coherent().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index de66319cbfb9..feb44cc03d2c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1343,8 +1343,6 @@ EXPORT_SYMBOL_GPL(qcom_scm_lmh_profile_change);
 int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 		       u64 limit_node, u32 node_id, u64 version)
 {
-	dma_addr_t payload_phys;
-	u32 *payload_buf;
 	int ret, payload_size = 5 * sizeof(u32);
 
 	struct qcom_scm_desc desc = {
@@ -1359,7 +1357,9 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 
-	payload_buf = dma_alloc_coherent(__scm->dev, payload_size, &payload_phys, GFP_KERNEL);
+	u32 *payload_buf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+							       payload_size,
+							       GFP_KERNEL);
 	if (!payload_buf)
 		return -ENOMEM;
 
@@ -1369,11 +1369,10 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 	payload_buf[3] = 1;
 	payload_buf[4] = payload_val;
 
-	desc.args[0] = payload_phys;
+	desc.args[0] = qcom_tzmem_to_phys(payload_buf);
 
 	ret = qcom_scm_call(__scm->dev, &desc, NULL);
 
-	dma_free_coherent(__scm->dev, payload_size, payload_buf, payload_phys);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh);
-- 
2.40.1


