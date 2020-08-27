Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3E2525422A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 11:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728461AbgH0JZT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Aug 2020 05:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728572AbgH0JZM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Aug 2020 05:25:12 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A98CCC061232
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 02:25:11 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id l7so831222wrx.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 02:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0eCfFeFtXjHXIodrcKhLpjQr96RreOehlMwqbi2m3L0=;
        b=zWcqoY99HF1GAUcKh/XWZ9HNBfRTXXaWoVaRQJ9zF1qxVu/p6/x/TOjGWJCBQHIve0
         GPY2/Ol5ofoZ7OEc1ayT0bqW38mwkO3m1HIMH5Fc6/pEQ8oH9cI4mHfHJ09xzKdsywZx
         qNt/QAfCEVjAzZOrlUNZW2gbUo9UoZRwlE9fwy4H1SM2jBQEBa9hrPbbzmAZQy3anYcr
         FwtQ4NcrmkKSpXEvmt8X+B0rq4lZwc2l0x65t+aQc9pyUIHQcx67vSz3VDNaMREcgxuh
         VWNoWgVjHo+TYmwlyno+zDQIhDLb+DLKwZIl+DHf3VOALWmRbahItcaQsu3oCH8lhS1z
         +oGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0eCfFeFtXjHXIodrcKhLpjQr96RreOehlMwqbi2m3L0=;
        b=MQeVLu1iVnjpkOnab+wi8adup69ILcrN7ArUaUZbXkmy7K43FxcUFvc/kIDtTiTRWK
         loMyBCZwNMuZPTvyGpMT3i3OHXNncAbdiQQsgtpXmrJVhvCY54m04OLCa/kvM/nDBlrz
         K+cE8NckRpWVO1OuUT/6LOTE9Y570iu2OjI0KnStN+r0qWyso9XEnhtSkYl1ywVun0bl
         dzy3c93/CsXp9AIZQidA9YVicgG9woD2OEoJfjJOiRVIvLobREHncfSxmbJ0WQuHeG5h
         qz8j7sIn/f235ZlQRpICu9V5r5OUM2pg/2TuT4gr/nGxpHCLELk3u/L/rjfdfL/sOebX
         U1iQ==
X-Gm-Message-State: AOAM5335bY5wlBrAdD8Wj2xv3Q7p5JW+0BcFG6gmd36NQBiJaN5yNJfG
        RoL8wKIShvQD/pc0J/1+uJXnnw==
X-Google-Smtp-Source: ABdhPJyfs4eoq6+kaoC5k2A9U0onDK75BpM1AxuVerK9Bdme4ywD/zqsEuevLJYTMvXQPl/tec/8wg==
X-Received: by 2002:a5d:6ca9:: with SMTP id a9mr8066983wra.131.1598520310361;
        Thu, 27 Aug 2020 02:25:10 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id z203sm4357330wmc.31.2020.08.27.02.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 02:25:09 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 07/13] venus: hfi_plat: Add platform ops for getting number of VPP pipes
Date:   Thu, 27 Aug 2020 12:24:11 +0300
Message-Id: <20200827092417.16040-8-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
References: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Starting from v6 we have one more hfi property which will be needed
to calculate buffer sizes/count for particular codec and session type.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_platform.c | 14 ++++++++++++++
 drivers/media/platform/qcom/venus/hfi_platform.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
index 65559cae21aa..06f46900cae8 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform.c
@@ -47,3 +47,17 @@ hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec, u32 session
 
 	return freq;
 }
+
+u8 hfi_platform_num_vpp_pipes(enum hfi_version version)
+{
+	const struct hfi_platform *plat;
+
+	plat = hfi_platform_get(version);
+	if (!plat)
+		return 0;
+
+	if (plat->num_vpp_pipes)
+		return plat->num_vpp_pipes();
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
index 8084d092d5d1..f2a6512b3950 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.h
+++ b/drivers/media/platform/qcom/venus/hfi_platform.h
@@ -48,6 +48,7 @@ struct hfi_platform {
 	unsigned long (*codec_vsp_freq)(u32 session_type, u32 codec);
 	void (*codecs)(u32 *enc_codecs, u32 *dec_codecs, u32 *count);
 	const struct hfi_plat_caps *(*capabilities)(unsigned int *entries);
+	u8 (*num_vpp_pipes)(void);
 };
 
 extern const struct hfi_platform hfi_plat_v4;
@@ -57,4 +58,5 @@ unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 code
 					      u32 session_type);
 unsigned long hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec,
 					      u32 session_type);
+u8 hfi_platform_num_vpp_pipes(enum hfi_version version);
 #endif
-- 
2.17.1

