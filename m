Return-Path: <linux-arm-msm+bounces-16962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF7D89E28E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 20:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15F8A1C2277A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 18:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEA4156C6C;
	Tue,  9 Apr 2024 18:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ryjTTAOl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA9D156F46
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 18:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712687283; cv=none; b=dVFDNEIFerlsImAqITTLqyH9Ry2pguiPMUTxG87FuZSI/+npRwI8w73MlF0frukc/RyGzw2roySyOL1y2jI+WjBclrzMcbZX2UFSqafpar3UFhgrrv4aKiI/G2Rb+ysYB5JDee2XpCbydC/WzW9CR+2xgKggha2UugXYzO71mCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712687283; c=relaxed/simple;
	bh=ON/Jmx/QXAviGOVQnS5wbLX/IpvoGt1RwOc8dKxnnkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=euEAr3hsK2bHKwZSdxNPtye5UiTN0Ig2L6QCkqkjToKl8+d410lUpCdkk8uudJVGeHA0b5ySRt5m59bZq1RY1+2HQF4/4qA00uH5UxQBkuHzG326uXdtG2RAfpe0WpA5uem5p8f+r+QtJky31cQcmW0S22MFOvadHuoeRZAv6GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ryjTTAOl; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-516cbf3fd3dso6874942e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 11:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712687280; x=1713292080; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pfn5ON4+qvaVM5CVY2KVztRRsBtOVkzEQFAvvZznvQU=;
        b=ryjTTAOlegjHUeXs7TGzb6AqPga+ObjE2LdfacxYWGfGYFSQ4fpD91X5fKsLbVqbYq
         n5F/B1a3l5SlLiYSge8pjT6hIZ1RnmP6QtN3JblXMdfpIEbBqPPBxTGz82T6D3n0Ojdb
         PGR/VMrQOmR2aBSBc/7TQowm+x5futiLgswMpHfSF2ynUl4Y3iWzZ2ymJYSO4uUnFzr+
         8F3kcBwkBS3AELN1L4Alwg4RyGxPBiMF0YgH5E22Jh7nZzPXp8vkgffl0hzDEDunqszJ
         cnmSy6fpZFjOcbhGY4OKwAJkiku0rQiYigimqXpAN4Sy4CWQxoUTM7lua5F5ZcsKj5em
         DwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712687280; x=1713292080;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pfn5ON4+qvaVM5CVY2KVztRRsBtOVkzEQFAvvZznvQU=;
        b=nPEzbhzu/u3eCmBijHYcJ0dTmvhEEEsipDcnm0TsEcpJrh4Pv9SF5IVTrMMVcSBhGe
         4F/l/W2ZXVtgjycvwmmgwRIElzDtUARzWWrgN26ICd7KBeTV17sDrpEa/stgh8x1bCKW
         +evLK3ifGxws/RMoeASTGey+u0uX4nfT0AESsDL/1TfhTXb5ERXCQKdJ4haTPIp0zPvd
         lM47hEmTKV1OYMFmLwTvu3X95zGOsTmMvPPoIO37Fz+mzYkeAl/ODqO8IwVITA5Bzm/Z
         X8Ngcrg/y1f+oKzzsYrt4KfY2dR1dZZKplaYiINmNPRAT1ge1YLysUbPZazsYiZ8M5o/
         Ktdw==
X-Gm-Message-State: AOJu0YwrEMjeqbKfmDd0/cS0iJrl3pysR0vQyXMd0UqYEQfgx7avsBwR
	SJdas3iqDluRpMXOW2XzJnRi0kVkGfRTcWPypqGYco9+fRoJs36wQWquH8VG5fM=
X-Google-Smtp-Source: AGHT+IHwLkjEvVdA9HrboaUQvs7V4xXPJn9wBd8/nRrE59KElnGmMllY/2zmHqlU81lXkZhAgK9GRQ==
X-Received: by 2002:ac2:44c8:0:b0:515:c07a:87ff with SMTP id d8-20020ac244c8000000b00515c07a87ffmr206897lfm.30.1712687279670;
        Tue, 09 Apr 2024 11:27:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p21-20020a056512329500b00514b627aab4sm1588139lfe.63.2024.04.09.11.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 11:27:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 09 Apr 2024 21:27:54 +0300
Subject: [PATCH] arm64: defconfig: build INTERCONNECT_QCOM_SM6115 as module
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-enable-sm6115-icc-v1-1-bf894fb5a585@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKmIFWYC/x3MTQqAIBBA4avErBsYxX6vEi3UphooC4UIorsnL
 b/Few8kjsIJ+uKByJckOUKGKgvwqw0Lo0zZoEkbMtQhB+s2xrTXSlUo3mPjyJGndrLaQe7OyLP
 c/3MY3/cDRghyIGMAAAA=
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=958;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ON/Jmx/QXAviGOVQnS5wbLX/IpvoGt1RwOc8dKxnnkw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmFYivI8AoHLVBXadi7tWxVV42J//fh858fVDvU
 wiPtwFNJbWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhWIrwAKCRCLPIo+Aiko
 1ZzgCACxB5+7UNjnphRcPZH4407D6zyjOPTTPNCt7/4CnhbrkAzWW5Hnvk62J+gg7VdVPJikh+2
 lYCKznl+VV+V9icIqR2L29/lBcJBgkpmv5PJwec+p+pWz2KasgBkTfI0YRuXLn6/59zGeR9Z/on
 Y7od0dOosRJ1Lx1h3iEHl0kpfYlEA+O4co5fhMMICqpHkipcsDR41pLHukayiTBGo4I2+cV9Y3w
 lXxlN1QGzal1eo0PbzkypM+1x4eTEKeKoFco/tPcr4VuelYob81kUYsHzs8U6np86HYiazZQUIn
 eD7uaYylEThaKBXNrjYbtIrwX5PfHtep1ThsovkA+m34crpz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable CONFIG_INTERCONNECT_QCOM_SM6115 as module to enable the
interconnect driver for the SoC used on Qualcomm Robotics RB2 board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9957e126e32d..14d727173c8c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1600,6 +1600,7 @@ CONFIG_INTERCONNECT_QCOM_SC8180X=y
 CONFIG_INTERCONNECT_QCOM_SC8280XP=y
 CONFIG_INTERCONNECT_QCOM_SDM845=y
 CONFIG_INTERCONNECT_QCOM_SDX75=y
+CONFIG_INTERCONNECT_QCOM_SM6115=m
 CONFIG_INTERCONNECT_QCOM_SM8150=m
 CONFIG_INTERCONNECT_QCOM_SM8250=y
 CONFIG_INTERCONNECT_QCOM_SM8350=m

---
base-commit: a053fd3ca5d1b927a8655f239c84b0d790218fda
change-id: 20240409-enable-sm6115-icc-7b0b0c08da2b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


