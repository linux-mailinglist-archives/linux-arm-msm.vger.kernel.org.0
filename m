Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0125F67D2DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 18:16:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbjAZRQ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 12:16:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjAZRQz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 12:16:55 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA14268E
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 09:16:50 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so3699236wmb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 09:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r5LCjwLjOuFVCi8otDZp+iuYYMC362EZyOZ/0jYj5zg=;
        b=IrnGzhfPqSSl682h8vY2KJeVmiCAwsZs5/KI1OoK8Akq36GMmArzzBcJajqgRZXtfr
         DXIoLsQU6SJu/ImVB6RoI9BUv5s3tYOJ0bZcGyVsxozPL12exi7F7zDnlWkqrTVNEtKf
         61xHslb9pYBAON2utKxzi6HLrY61LLvbgwS60PWlgrZUw84ztIFD/VCzz5rcVS7uWn1A
         rrQrHYlXAhvao2UDZzR1W3poFpsrNp1QTgqWRjRwGNkUiAdSsNEkpryQTFXOsppNG0Kp
         Wl+3XRFEfFXe0+3j6NujXAOFBBLisL4GmJU2ZdoAmo8h0B2iQJSXhZFxeALOKR4gEyQt
         NPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5LCjwLjOuFVCi8otDZp+iuYYMC362EZyOZ/0jYj5zg=;
        b=VqO16L1rwe98qgs0OH2QCGRIkxPuRwLKWCK1xee6V791qsz7YCr7KTiBGs39kfXMSs
         Jn/Ps6d8jPqLNw+GmgvLaqglgSMvReO22lpgtBgcQgWOCDZAm4MXdOfoRBFrvSM2SH5I
         y2Fm4K2BOU2aJGOGXR1Ov0v9ffrqg4juDL/qmoxRgzxL2iQflh0xBf5SfBTJcE54qDP2
         UwHisB6eC05fpov5ywLEAZdXswD+bNqn6YybWsspVAER0FEacFWn24bFSP3zwazEjxBj
         ek5tln4CTBStukUIM1vs/h7W62fSVjgM49JLvvJqor/u9tzkNbrAQk8pq2R/bxgmfxDz
         wXOA==
X-Gm-Message-State: AFqh2kpzxY6HPN0zqEOoTcBqkODrWrW08gKeeWakH16s58/RMBRv5jAU
        XEKQ+4w3HhA5hdthJX2KT+pQjQ==
X-Google-Smtp-Source: AMrXdXszdrpAsBAPpUkynp/6Dq1vBx2wRSJICOBK+2iwuwZLHmhb3WGhYcRW8LuAqpU1N+7nqIu6+Q==
X-Received: by 2002:a05:600c:214f:b0:3da:f665:5b6b with SMTP id v15-20020a05600c214f00b003daf6655b6bmr35499329wml.25.1674753409490;
        Thu, 26 Jan 2023 09:16:49 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id d11-20020a05600c3acb00b003db30be4a54sm5134371wms.38.2023.01.26.09.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 09:16:48 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Johan Hovold <johan@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH] soc: qcom: llcc: Fix slice configuration values for SC8280XP
Date:   Thu, 26 Jan 2023 19:16:36 +0200
Message-Id: <20230126171636.2319496-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The new values have been taken from downstream kernel.

Fixes: ec69dfbdc426 ("soc: qcom: llcc: Add sc8180x and sc8280xp configurations")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/soc/qcom/llcc-qcom.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 23ce2f78c4ed..5702354fb946 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -183,17 +183,17 @@ static const struct llcc_slice_config sc8280xp_data[] = {
 	{ LLCC_AUDIO,    6,  1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 0, 0, 0 },
 	{ LLCC_CMPT,     10, 6144, 1, 1, 0xfff, 0x0, 0, 0, 0, 0, 0, 0 },
 	{ LLCC_GPUHTW,   11, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
-	{ LLCC_GPU,      12, 4096, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 1 },
+	{ LLCC_GPU,      12, 4608, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 1 },
 	{ LLCC_MMUHWT,   13, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
 	{ LLCC_DISP,     16, 6144, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
 	{ LLCC_AUDHW,    22, 2048, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
 	{ LLCC_DRE,      26, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
 	{ LLCC_CVP,      28, 512,  3, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
 	{ LLCC_APTCM,    30, 1024, 3, 1, 0x0,   0x1, 1, 0, 0, 1, 0, 0 },
-	{ LLCC_WRCACHE,  31, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
-	{ LLCC_CVPFW,    32, 512,  1, 0, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
-	{ LLCC_CPUSS1,   33, 2048, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
-	{ LLCC_CPUHWT,   36, 512,  1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_WRCACHE,  31, 512, 1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_CVPFW,    17, 512,  1, 0, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_CPUSS1,   3, 2048, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_CPUHWT,   5, 512,  1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
 };
 
 static const struct llcc_slice_config sdm845_data[] =  {
-- 
2.34.1

