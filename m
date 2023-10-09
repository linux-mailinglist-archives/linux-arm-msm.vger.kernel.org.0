Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11B817BE4F6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 17:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377758AbjJIPf4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 11:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377757AbjJIPfb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 11:35:31 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41981139
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 08:35:00 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-32320381a07so4642325f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696865698; x=1697470498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICq8xSC80Kt4obE0o4+sSt1jGbe7ldZCyofAgnJ+E2Q=;
        b=jQ0ZKIZlzGyLX63Hd6C7dK8bEhUkd9OIc8rYtcT7RwTGzPxoaMcKraCSrPhbYelP7i
         SVm1aSneTNSxj/N5rWi2XIboQzi6ucXjckXWQhjR9WCQKLym2aLHX5J4WsyFa55Ctpx+
         WZpRf8ZyvJXJDV/bAZameAjywUToqs5L4rzbdfKv4+KdduUOF/mJwL28vAQB1OAoEv4U
         OXGmMHo66mb7sfWN90GB8NaWBx3L4rXg1Qan1pBiC7u8DNC2QGlkK9ucDma6uNrqsynY
         hRu04rz3J6tzROeWULJjAnFXf+cKcqJl/jBoSX26Lg4IhdxyOjyRT0K5Be+N0Pjc+w/L
         pl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696865698; x=1697470498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICq8xSC80Kt4obE0o4+sSt1jGbe7ldZCyofAgnJ+E2Q=;
        b=QnI/dllxjN6XuN++tuU5NTvSA4YKDQuIBjF+Yo9OH1oKP9jMXI/uQwGyOEChNhhoZ/
         Li/d1OV/0Df3VyMKXsbF6ViQk8D8+SBkkjbSgT5glFWVYwiP6s2oTcUINiRvV4N+ojMY
         K4Mz/muTjwbPkWm0HzIaR6MEINwwmfnC1HLW0WeX9mEplg9HyFMRMxeR7qrM9f7b/XXU
         8qQLOviUwyNmJ5URPjnA8fdAvmU3e5/gaPWD02Xc24gbel3W4DtlEWiEJBX3eyxVu589
         MnTUo0fv2WbpA4bN6gBlqKDJduoR1DUdieLWD0LzgvF8JRcWfAH/HKfbaa/ewWO7zYgW
         +2bg==
X-Gm-Message-State: AOJu0YzGGYlMl7SfGljuzVOtPz1d79Uueb6100nYOO4OKQqNm0Odw3mS
        sD0PRVQIXtgNxDv66QkOTW4z+A==
X-Google-Smtp-Source: AGHT+IGSVNNDH76sRB3Lqa5m+uNOKv1cgVjk/f2Eil+mLsb6i7DQTO49NsVCo55KWQXwRnMHeDJ5SQ==
X-Received: by 2002:adf:f08f:0:b0:318:f7a:e3c8 with SMTP id n15-20020adff08f000000b003180f7ae3c8mr15642287wro.57.1696865698736;
        Mon, 09 Oct 2023 08:34:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f20d:2959:7545:e99f])
        by smtp.gmail.com with ESMTPSA id b3-20020adff243000000b0031431fb40fasm10016521wrp.89.2023.10.09.08.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 08:34:58 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 15/15] arm64: defconfig: enable SHM Bridge support for the TZ memory allocator
Date:   Mon,  9 Oct 2023 17:34:27 +0200
Message-Id: <20231009153427.20951-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009153427.20951-1-brgl@bgdev.pl>
References: <20231009153427.20951-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable SHM Bridge support in the Qualcomm TrustZone allocator by default
as even on architectures that don't support it, we automatically fall
back to the default behavior.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 07011114eef8..ebe97fec6e33 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -255,6 +255,7 @@ CONFIG_INTEL_STRATIX10_RSU=m
 CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_IMX_SCU=y
 CONFIG_IMX_SCU_PD=y
+CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
-- 
2.39.2

