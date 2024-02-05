Return-Path: <linux-arm-msm+bounces-9851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0725E84A263
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 19:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BB271C23B7F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 18:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15DA5646A;
	Mon,  5 Feb 2024 18:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i5Dw4jR9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222AC5578F
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Feb 2024 18:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707157716; cv=none; b=i1eOxL5co4i7EouHxSHoc5vcVc/QAcfc3Bj42Q9yD3Tq+wjnvLtM40pTYuEJq2XLPsoFGrh80KidTJiBCuPv2AJea8pMtNKEiYKoBXy/7yKsENfYmZs/WUz8nTEr32Ecj6QzXv9VsJFQwXvpt7P9vJ+ukYYe3kSEo+K5oUtQqVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707157716; c=relaxed/simple;
	bh=Pl+so0aiMzIcKyfkcKHnT7WaUdZ8Q+4vn9J/efZzwz8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lQFCoLXhg/8Sdykq8KhJg9sMryKZp1p+hhDwV4hnBG2/Ztb+Ld2HwF5AdskoCm9gHy1r1bJMVhRcZPp1I4CeRyCDM8T+/509qeZgD1BiuE7tK5hczdCYnSJ0AiGSEcxSAD8p6AWJPI3/LRX4EUt02rt6B31jbBN494AIBkMXiUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=i5Dw4jR9; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33b29b5eab5so1563372f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Feb 2024 10:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707157713; x=1707762513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxZtfpTVf0bCO7EHLm2jgbKpvylHq5U4dLxNmrei5Xc=;
        b=i5Dw4jR98wLKo+E8tnWNYkyb4roX1Crb5O68oLaKkXqqCKZ/2ZbW5ngvhunUdTYp8b
         bpynZkcAc+vlXVyCqPGZ4lii5R4euSMTxNOaIz2gdoVJPIORvudi1JoFkCw6PAOTyoG8
         7jX1BNyaQLPbk+yF5Zg0z0/M4v2D81+Z4V2N4mwgK99pK4seJANvKRxNzaqotKF3Ptf4
         3Vp6Xcx08d9bPPmIohiKF5dk71bHdR+zleNSh2D4E8v71clnBi1gS9qxAp/ix+8q4You
         dnG6YA8XO1dT1QFGqmwHj4GDyI77+VajfdGVahX/cLTN48RxWgBltq/P1kM6SsIJ9wiY
         DALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707157713; x=1707762513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxZtfpTVf0bCO7EHLm2jgbKpvylHq5U4dLxNmrei5Xc=;
        b=tmZQOcR6/n2qgD0Prk6mkWxvW+viV6hE8PioRrjfITFI8Zo2+Rica9YTP7BpoY9Rva
         fhFC7KWsuz+ProHIDgIQ8fL+BzagH9ZwiTmqw4NGJq9bH5/8/UU16cbGQAIlXOoFv5wT
         iaZ9USZ7Xe2l2jgukgyTzhKXumUqjNlvypPiUAEzeA6GIxfDrvxe/BZD1W4EFQkOtjdC
         KiuBNNFOjZbjkoPNFSuMd68Uk3iQBmYt0voj3XJNfuGD/DCi+jpnWkcFcFl6lsQfod9e
         YsjKndJuvzUbBEob8gmrWPL6Yf6eA8n/eR2gTlapxFJRvdZsynElPz0AIy99a2TWgIMd
         aC/w==
X-Gm-Message-State: AOJu0YxVk2ftawNead/W3Vid+27/A7/epw5emWwT/7EDv0r7SZdXsGKF
	yAfCY/vDcLeuXc8FWYm7hIyhgdEAUFRUJUXht89svdyUP1EJ/AvX+sas6Yxs7YM=
X-Google-Smtp-Source: AGHT+IFpmEq2moHMRC6KEcwqwdWJnF72beZnSyfAR3Lk3OBN++riqvciA4tBGfw4SSutLs3EC5Mtvw==
X-Received: by 2002:a5d:5046:0:b0:33a:fdb6:b1df with SMTP id h6-20020a5d5046000000b0033afdb6b1dfmr221612wrt.19.1707157713337;
        Mon, 05 Feb 2024 10:28:33 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX7L90gPRH+fHuzHbeWfH8QHoz87Z1cIzaDeTGyJLMvXregJGx7AldZkKxPdE76W2NmUy+OmNcRQPP+hhdXNHLgRrBNTtcGEPULvIQy9U8HOU7cpvnqVAz7AFiLwr6jsymAeFVKBRZ4bd1BajyXebwk56WRoaYKlje4/UKds5NONGlKTtlBrVroRq0AdK3w/8RVt5yHjkU8jMIKA0vRAgV0zxk2yk+XZ4Bv/k33b2oueE/xa0Ev46IFwfCbnQfTZ8RmTK6ZD45rQ9oUbbvmdv4IhWcwLIcocfxA5uEPhSlpBnukJyD57qK/6Jl5J2VSRhsjeu1PauXdeN2/9eZ7kZvZFnp4zHVKwNoezsgP/5m6zATsefIVtnR2V2eZB8FTd2PNFwf+N684UXz1o1p3SfrnFYZW0mdrl7obk9ZZ0cGkWRl6ZD3pSzC/hJiXahkaeJqrd8ZAFd85j3VFAXG5NZxtMyfx9A/ga2PPxmzSrJ7NF2+NZw23awiS7x2ObjVl0e2atYBBfUpiF6M3UEiRcM4XhPCmjKE1KgVjy6AsZQ7n7jVnm4Azili+HRtGGT51nJ8=
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d929:10db:5b5c:b49d])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d678f000000b0033b17e18df8sm203229wru.12.2024.02.05.10.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 10:28:32 -0800 (PST)
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
Subject: [PATCH v7 12/12] arm64: defconfig: enable SHM Bridge support for the TZ memory allocator
Date: Mon,  5 Feb 2024 19:28:10 +0100
Message-Id: <20240205182810.58382-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240205182810.58382-1-brgl@bgdev.pl>
References: <20240205182810.58382-1-brgl@bgdev.pl>
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
index cfa3e00def09..f17bd3ea4a7f 100644
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


