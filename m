Return-Path: <linux-arm-msm+bounces-7763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3850835F8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 11:25:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02E5F1C25377
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 10:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FEB73D3BC;
	Mon, 22 Jan 2024 10:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qWLmpWb7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5BD3D0D9
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705918941; cv=none; b=RPWnpEgmHE4LBuHDqyOQpfa8KDAGhvxpLqHA7Qj/oRelTRxd8CwfhsHD/nKhKLnoACYkwmwpDym6kGAEKNR55IOMrny46isZunCb37xZGRJ6zn8x/W3Mko9PSTE0LoeGXZhS15TZ0/rUhdpC+LENYYsHI0eOS6H6/XzDiu/Tue4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705918941; c=relaxed/simple;
	bh=LZfgbhUnLx5DwPbySeH7M/oXcgqr+FxGPWib5/pJNeI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P9rAmb6qFkIJqElMms7L2b6Gk8EoN7fdJt41VvQw0VCA2klbTOUImaJ7F1AlCCkYYTXMOsEn6pE1kWOWCUgDx+IYoDPp+tANhETfc7WRncwukap4aS9zSci/JQTCIVhHHGlDcEYj1n6+K/FaGEsg8q5NsU+fGtJLcgGo5g1UT4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qWLmpWb7; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40ea5653f6bso22517135e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 02:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705918938; x=1706523738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lalvSbjsX1nGni0gXE16NpSAE0FFmKU1SqK46Owrhtw=;
        b=qWLmpWb7/ihpAkeWYU9kZojnWCuutXFJAHrz6z1D7T+kIKNTmtdS5mKEi6E+6jP79B
         lSRhYe2Kdfc4yCUpdSxsUtmHYt2LaS8tUhLwkxYyzOfXpaP6EevPIrhSo0z6kzHfG29R
         Nf3aQtUp/Ils7IymicuZj6EoFeGYu+Ent6K4Kg1WrHRXfU1OzQX7+svDz+GdxCL8RKC8
         WBmu1WOK8qvhtxSu7UiXzbw1q8v2m+lFzB5EaBH2aC2Sp0/wA8A1BDkPtne21X53Ney9
         1isWrz+z75WPjedfR/FhxxBQeXKEry4C1kOWuUC4O7xI1X7AMpdR7XM7fwKLc24TF7BA
         EO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705918938; x=1706523738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lalvSbjsX1nGni0gXE16NpSAE0FFmKU1SqK46Owrhtw=;
        b=JGFpGBWyAU6F0vTcivMoMGolvLmnrhkOHUL+fJcRHICo8t/C+A6hMUyYd0WcxYaPIB
         i50TGmwdcHZLdXDUlca47VPCiYKE0oyCReXw3ehEy3hZiPyMMvv70Tar+pZ8gcOtPk/N
         v0hW4g6shlsSyZU15OHBjDa3SQx4p1LL7OwOXYKWW0aCUMjkpsBIF9xOF4AJb2fqVmTj
         ASmkZU5Dbxwb8xjkvQ6bD8kzwsogCjYfv82b/HZlUO+uncv66+h7e1IEb/zwpWp5bkqT
         N3MB5vgdwqhrJ8WQCe7MjapCDyBB0/A99RN2g1DmaFslBe6A5Q9VcYMtk9NV/Lwf1CfX
         gwlQ==
X-Gm-Message-State: AOJu0Yzf4i1RMUUh/Azt/sR3wokcdRMyueqGVJ/25nhFsCyWlr1ooJtY
	9TteoyQUFslIX0e3Hoat/+PeyY9YJlqM5+DqJ4gZBOWTCLkjljUfWbXl0b/Zycs=
X-Google-Smtp-Source: AGHT+IEpKsNdwYZEVS8Yao5oTwFGu6BmEkSUNiDQ+jJqNJ8dTqzDh8ajse/ScTF26QX3aTiYAs/sYg==
X-Received: by 2002:a05:600c:4e93:b0:40e:abb8:1b2 with SMTP id f19-20020a05600c4e9300b0040eabb801b2mr1000679wmq.90.1705918937973;
        Mon, 22 Jan 2024 02:22:17 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:92a0:6172:d229:1898])
        by smtp.gmail.com with ESMTPSA id q7-20020adffec7000000b0033926505eafsm6377904wrs.32.2024.01.22.02.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 02:22:17 -0800 (PST)
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Deepti Jaggi <quic_djaggi@quicinc.com>
Subject: [RESEND PATCH v6 12/12] arm64: defconfig: enable SHM Bridge support for the TZ memory allocator
Date: Mon, 22 Jan 2024 11:21:57 +0100
Message-Id: <20240122102157.22761-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240122102157.22761-1-brgl@bgdev.pl>
References: <20240122102157.22761-1-brgl@bgdev.pl>
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
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e6cf3e5d63c3..7a9428e333c1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -253,6 +253,7 @@ CONFIG_INTEL_STRATIX10_RSU=m
 CONFIG_MTK_ADSP_IPC=m
 CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_IMX_SCU=y
+CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
 CONFIG_GNSS=m
-- 
2.40.1


