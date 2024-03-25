Return-Path: <linux-arm-msm+bounces-14978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C404D88A3E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 15:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 444FC1F3DC2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 14:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2650D181319;
	Mon, 25 Mar 2024 10:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OONMxdDp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E98B1966AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 10:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711361063; cv=none; b=T0VDTvFned8Qbrq2zI2DK51IrKENotkXqd0NQzi2ciInD/grcq7ciKz5Otkoa+dUsNk6ZbD9+5VYXNaPdvPQCBuTVYBabqFtxppSSCFWlzHp0/n/aJVPGhyQmNBw24iI1KOV1Ns+8hObQTcOmQ/kVLtOe9JtvTjpuiVqhe14Vi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711361063; c=relaxed/simple;
	bh=6xEiiGScK7JJxdpF/lD70fvnsCf+NygXdoWJFOV3UZk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BKXU29Nd15AmA8fuoPIQYu9MH1t0ljoeFALLYQb1o1tia3hbtpE1cqHrnMbRiHD52nMpsoYAFDXS2+9SC/cxPOQmShmuFv5RLgxCl2e25Z9BqAsHZZAE816T51xqOIdlOTS4Gg0+o3RJs9fVe9ZTEmXK8xc4WgKF9TPDdk/eb0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OONMxdDp; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-341b01dbebbso2948170f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 03:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711361060; x=1711965860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WaZeoNiyzTwiMheeiYsNuMRt9KraQvAJ66Q4WnMYg4o=;
        b=OONMxdDpfNMhCCIftkO33kqBib4Z4lJT6Ch9RFTT+bUsfbXkjj9WNDPn2UJyJ8ig++
         ruiGSsytPHv7fzyZZ2YVw7FrJ4/NgAW+AjN7EUkbN2JhfZpJ7sp9L6KvzYtkLGqViUra
         wEKkwnwQSEgzKckD4X5CoHS6q25s06Bs7cc11Odt7YOOGuHepPc0SzKAqbyWC0XmQv6N
         XPhCkIVs4eT5kUpGF2BUnhxKx4f8kHyy7jY7Y35E2KpmcPd6TIPqPG1N08ip+5s7ItGk
         9Dp7kVTiElIXk1fUeGFq7KwLT14zlVBBjEAE/hMUsPLsEByHuxIDwv4uQLwINcSOwO4C
         PL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361060; x=1711965860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WaZeoNiyzTwiMheeiYsNuMRt9KraQvAJ66Q4WnMYg4o=;
        b=pjiNPvHBr3O381j764PPvtgjJZB3LZilUMSg7YBsvDS0CP19vo41t9QYWYZOMWuwhT
         jw45l9dYg7MemOkIhJAY1yafbmRu8yorxZtBHD5jNfpYx37V88JHUpN8xJuW4enJ+8z5
         FyRuL6+wQ8fHdBmd18AH4WaCbK8IS5xK7/A/Nvtr6yGOxuI8x9cup6ba3ysfB+thqqlc
         GM6sREwspNg6eXDFIyme7OLh20AJ1ApGBEUvQ0Bb/QgGd4r3Q00+9nIG9SynjS/loKwB
         YQUXzmuGyYBhxBho148QIn0obZjQed19ULNYxIhCtoS0029u8cUKblWL5r/95whcG0q1
         joSw==
X-Gm-Message-State: AOJu0YytFTKEgMUxsilaR71cTcES5c7CLTIulEziVknthp1sO4/ZcR3J
	Xq3GvVsvCkPW2/7zITAOakxpmKrfMPNpogWPWxGqPLoLaIA10c/0kibBdqH0lGo=
X-Google-Smtp-Source: AGHT+IHujk/ZzEH2RHwabsHqfC9LHoEHea4fncmGvBpbM34nOuQQYGhnlfRPNRlbV05z0T5eyAWzgQ==
X-Received: by 2002:adf:ed06:0:b0:33d:3566:b5c8 with SMTP id a6-20020adfed06000000b0033d3566b5c8mr5472793wro.13.1711361060775;
        Mon, 25 Mar 2024 03:04:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:861d:8b72:a859:4ce9])
        by smtp.gmail.com with ESMTPSA id dv13-20020a0560000d8d00b0033e25c39ac3sm9086874wrb.80.2024.03.25.03.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:04:20 -0700 (PDT)
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
Subject: [PATCH v9 13/13] arm64: defconfig: enable SHM Bridge support for the TZ memory allocator
Date: Mon, 25 Mar 2024 11:03:59 +0100
Message-Id: <20240325100359.17001-14-brgl@bgdev.pl>
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
index 6c45a465a071..37280815dc6f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -255,6 +255,7 @@ CONFIG_GOOGLE_CBMEM=m
 CONFIG_GOOGLE_COREBOOT_TABLE=m
 CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_IMX_SCU=y
+CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
 CONFIG_GNSS=m
-- 
2.40.1


