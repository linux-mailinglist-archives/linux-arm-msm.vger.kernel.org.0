Return-Path: <linux-arm-msm+bounces-1149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EF57F1444
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 14:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8138B1C2131E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 13:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974171B286;
	Mon, 20 Nov 2023 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NdESP99I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B1FD6C
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 05:21:37 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4079ed65582so14311245e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 05:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700486496; x=1701091296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFfJP54/xc7BHA8KKJGYnGca16T3qiUmmV3jKwTKBQY=;
        b=NdESP99IGCUYwnMudb8ziVws9edff90f4SR+4gN7YxJdAJvxG12sC5thHKsLDiN8mN
         8Qi0sAnHt7ev3dhLRTYxBy88W1SldgfgfXMFsWB4a+vKWGB28mmaVUTfrKcTd43s4qE5
         AVnch1gPxI3DfFHDTnqrwIKT4aJqFX5sjmTLCxqVbH+apQmV3j739B1Wjb8fqPN9RDVT
         J82DdVBB/RXXp/Df/OR4/MDSh27c2HF9dgljTZoek2Nca7/SX69XoS21ZjUbJshQJRCc
         dr8pyCskMG/wNVVrKnRrPbT0XRpDPPdQqLv8ZOoOaigfw0IEVIAcTKiE2j8sEfvLOWOa
         K91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700486496; x=1701091296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFfJP54/xc7BHA8KKJGYnGca16T3qiUmmV3jKwTKBQY=;
        b=iDBZrTsdQWckUNi6Wbe3mr/07mS+xS0/2X/A9UkMHKSO9XBHpLeFvZdfi/pqR16tMw
         LqQWX/y5KmHTM+uMOHLbMoCP4j1lH4uREkjcWlxmcNSvRsN8Kx2MNw1X8TINzFgbT45Y
         GE5PGymEhRzqNrXHGS+qy/4hzjf/o/yCjwgg6dUWsOyZIByVAxmXlIiv5YYP72+jsxUy
         XFwg4EveGBHXEWodgSm3BnAjpolBMp4OX8UYJBl4ILhK5U9PixjbvelG3pvxIl7SG3qh
         AKYeeJq4zd10soqaYcClxcbjoSblnGub0CxVLlSyElBG5olKwC9lhDK4Mn209mqtam4E
         c47A==
X-Gm-Message-State: AOJu0Yxnk48ySeXwnUW4/QBtYW9baSPVsIZnYh/pTJi8YZLEgTQXTlq+
	zNLx5SjiIM/IR01EM0OnfUx4Pw==
X-Google-Smtp-Source: AGHT+IEJNSSeruxg02NwqJzhB0OwZASyBXitkOUoyOM4mvHRqWQBf9cqK10RmvbSC3vq1f+NKZVwyA==
X-Received: by 2002:a05:600c:474b:b0:408:575e:f24f with SMTP id w11-20020a05600c474b00b00408575ef24fmr5640653wmo.28.1700486496200;
        Mon, 20 Nov 2023 05:21:36 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c590:a7ce:883:eba3])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c0b5200b004065e235417sm17329192wmr.21.2023.11.20.05.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:21:35 -0800 (PST)
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
Subject: [RESEND PATCH v5 12/12] arm64: defconfig: enable SHM Bridge support for the TZ memory allocator
Date: Mon, 20 Nov 2023 14:21:18 +0100
Message-Id: <20231120132118.30473-13-brgl@bgdev.pl>
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

Enable SHM Bridge support in the Qualcomm TrustZone allocator by default
as even on architectures that don't support it, we automatically fall
back to the default behavior.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b60aa1f89343..5380e78087a7 100644
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
2.40.1


