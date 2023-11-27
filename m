Return-Path: <linux-arm-msm+bounces-2103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 353E67FA242
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 15:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67E181C20E4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 14:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC77731597;
	Mon, 27 Nov 2023 14:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cRAMTeie"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D3F3C32
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:16:27 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40b3e7f2fd9so17370875e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701094586; x=1701699386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFfJP54/xc7BHA8KKJGYnGca16T3qiUmmV3jKwTKBQY=;
        b=cRAMTeieivsjBt3avR+Ku8wbD7USPcTI+VQgBm1XvLzK/brMTu3AP8cO5HzIpey8HI
         Bf7gLKsxI+jTcFKYnhoATmSYZkQnHfoqq/Q04pWBNzo4+wDdysgNZppkncwHk7eiVK1X
         5Aidk6/DLkDndCHIYPVU46XRgH1rjdiBrTXTY0y4k5SXm/o/IYvkdtwQTzY2OvSN76uq
         e8zP7dnMUIO4teYD+KL2Ne72K0+bSKNYZh+FWYPNfw+alDQhkZb39FlmOgIwjJ1jPKTI
         5WVE8PrTn5gGRJq+t5wMgD3GdO2by596Xc0KCRZYTYamq9FxuSGJT0FW848qK18b8oap
         KiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094586; x=1701699386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFfJP54/xc7BHA8KKJGYnGca16T3qiUmmV3jKwTKBQY=;
        b=W/VEoa8il2PafBPLdHf06I8MqazUswp2EZDDY4rogcImNEd8dscWERNyFirS+dWfsM
         UK0enp8NZzCALRpsFBEJ7/mXYYvs8+pI+DDFMSmCVZBITJojZTchL+kmbRVa43pWxVcM
         h/gigW5FdDK90TvtHCOaiKD4mnYzxMAb79t06/jNFWcdgSXokmpUn/ZPSEWZTeR5DJpU
         o8SQGav7svQaapPAB12IiBUgDw0STFC7Bha9DAwXyNFBTjXJOI14Dysz/shhdQx9RwCK
         ZAiVTubPE1D5cvtq4882pv4a6Afz67izYbzhhjO2hC196qOVStdp6o7ZQbF5m/5FNVI+
         KbPw==
X-Gm-Message-State: AOJu0YzY+xIoZRczdG2peBAwbCQ2D0wKsVOaJNK4aq2SLWzFGGiQ4fK1
	qYvnZY5XqUf673ff2TiIUIuqYA==
X-Google-Smtp-Source: AGHT+IEIgowsVDZas+3HVfgHYGIPV66wNOaSjrs3VAw1BwpW78zUkRBqHRUWw0OYTYY+L65OxkyE0Q==
X-Received: by 2002:a05:600c:600a:b0:40b:32e7:2e89 with SMTP id az10-20020a05600c600a00b0040b32e72e89mr8536462wmb.18.1701094585913;
        Mon, 27 Nov 2023 06:16:25 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:bf33:77c7:8131:5e64])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b00405442edc69sm14658830wmb.14.2023.11.27.06.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 06:16:25 -0800 (PST)
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
Subject: [PATCH v6 13/13] arm64: defconfig: enable SHM Bridge support for the TZ memory allocator
Date: Mon, 27 Nov 2023 15:16:00 +0100
Message-Id: <20231127141600.20929-14-brgl@bgdev.pl>
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


