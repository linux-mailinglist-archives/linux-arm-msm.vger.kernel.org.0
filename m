Return-Path: <linux-arm-msm+bounces-13180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D9786F5B5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Mar 2024 16:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 793021C21A43
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Mar 2024 15:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639C16BB2D;
	Sun,  3 Mar 2024 15:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ADaenkqS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6236AF98
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Mar 2024 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709478098; cv=none; b=pU3HCny1s4XRyQzMwCdgiCBtN9JbEPh0WzpNhq647gD78nHGFD0irPK5iu3urI+1BO+bIC8gl030qCwpifU9puhLkT5vNxZbPuDzJ9d6ulWNjBaab1mT4KXAR5q+Fc3/JPDo6ixGI7+5W3sUiI7H68U3388Yh5mu2g/zNd9wd3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709478098; c=relaxed/simple;
	bh=r4MrdpfQItW+VY2TV1TWENdOVO+4+6domQX8f1WokzU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZjsCzTEF3fFzwrMuhXVy9FjtHg764/Lr1UvBYXNo0pDg1iYil5WPEo4LuMua8MwSdOXacVMrCrtt86xJRcBtN3t6BUGp1JaKxE3+t+9+K2pWT6dEY74myJH55Ddiab6FURLhkxoViTx+mosOotOEUGfNaqjarDbqPsBXkpiG6zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ADaenkqS; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a4417fa396fso478181166b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Mar 2024 07:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709478095; x=1710082895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wfEydsGbvddKil/3Z8l6vz+rSpkbDji/d2z7vS115c=;
        b=ADaenkqSJZTdy1iD5HXeDXQ6qAg/NB4ipyYmj7G0qKZ49nloYL/0dx7+dbVQ+4o0oA
         AzeKinUtDEC6uFzFmBOZTuTA4oLuIjNYy92iSjG1pHT+LIZlo0wo0K8FTrU6pr08Lf7z
         Fn9yYZ7yeVWdxHzEb2fngBWuyB9oQXYv9RWU4TvIOUFACH7Lxp2bRm5cBt+NJR+rv4S0
         1pE2GyKY61fNaCArkPWiXhXGWBSF98l4pEyhw5lH4DQYVuf3ejeEUWS7w+yh8PLkeHxG
         O6oEhFu+6a46r6S01pYv35ED3+bc1y4UPbunZmJsrAoX7e9DRaqWRSZw1tvd7DgjTc3m
         7rPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709478095; x=1710082895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wfEydsGbvddKil/3Z8l6vz+rSpkbDji/d2z7vS115c=;
        b=XIORHzdJZv0bTgpQNP206mpotRQ7uwj4ziY9Rym5CZ8vUm0WocXdVPJVUAQHyJko83
         GfcTke7mkPAw4U8gJ8DZWPsDs8EfxO5TrbcpPVCTx8xA1UnyNTMw0c/jawqPCSrqaeBM
         U/ZjfWdufdCaJ3r7dKqUgLeFIJqPJdBsLlinpeDCxX58XAqJW/R7vN9hnQPfx5KzLSxe
         P0aMB1TPRTbMx7K7QBgUJzHfd71xMNQoKOTUad3tQSpP+u1NQh1J+k1ibmQjOXT45gGJ
         AQDQvlet+Js6yJfjvy/uH8OkZ2v5+wjKL/GwYRvmeBG3CR8oQ2H1IeBcwEgxT6+miN3J
         88Yw==
X-Gm-Message-State: AOJu0YxXl9F4uBz/BNwcAgXrBOiS454MgziNSuekh35M6xaI/qBLqizd
	/qgFNX+5/olGMPa7sDBkoJerxja4H51dULKmwXP/dUmzbQ6mEX7eQfiuw2zvAe8=
X-Google-Smtp-Source: AGHT+IHaKPYTKkceAREIbdiaxB2ZZXS4LTPdk7piZ4fOASBtCzFFy+kH4Zbu3DN08O6YHZeK1/WFjg==
X-Received: by 2002:a17:906:24d4:b0:a3e:d835:5685 with SMTP id f20-20020a17090624d400b00a3ed8355685mr4362651ejb.67.1709478094847;
        Sun, 03 Mar 2024 07:01:34 -0800 (PST)
Received: from brgl-uxlite.. ([77.241.232.10])
        by smtp.gmail.com with ESMTPSA id ch14-20020a170906c2ce00b00a42ea946917sm3740293ejb.130.2024.03.03.07.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 07:01:34 -0800 (PST)
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
Subject: [PATCH v8 12/12] arm64: defconfig: enable SHM Bridge support for the TZ memory allocator
Date: Sun,  3 Mar 2024 16:01:15 +0100
Message-Id: <20240303150115.133633-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240303150115.133633-1-brgl@bgdev.pl>
References: <20240303150115.133633-1-brgl@bgdev.pl>
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
back to the generic allocator.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e70a599046b5..281cdcacc627 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -252,6 +252,7 @@ CONFIG_INTEL_STRATIX10_RSU=m
 CONFIG_MTK_ADSP_IPC=m
 CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_IMX_SCU=y
+CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
 CONFIG_GNSS=m
-- 
2.40.1


