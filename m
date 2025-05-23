Return-Path: <linux-arm-msm+bounces-59215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FC7AC223F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 13:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 679CF3B96A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 11:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F2D20CCD3;
	Fri, 23 May 2025 11:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VK/qvHkx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B2A1C8631
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 11:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748001437; cv=none; b=oWp09WWgKeKnsv1tzqOa6kpq33v4dt9jscG9kG6NC/jnb8vVOS+IuDiB24paSp2auK2CbxZzSBTzyS7jO71CIaeamUXQHoZ/HHO7MU7oqrUtZlOXkrnZBcf80GwbFLfyMIirhMsYTau6YSL+gjsija76Id0wa5ALg8YFeHRBlAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748001437; c=relaxed/simple;
	bh=JOM6Fbx27n4PNGlHxnz1bx9VX7HuFXn+oZzHQ4T8tKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FABH5RQqRz3uc2WHxibybpApgmHSP+K0JC1gk4RTPjdWMMVMeF7+oW81a0+uQYbSYKGxlJan9MXmh8xF/XNrdIoJCMU6EjYLC7DUqAl/gHC/Ma6d8zwV7gp+pJWuYhkwjpNprtEX94VQYoACOQILlfHtVdrWczNtzxpH+G+xsr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VK/qvHkx; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a375888297so521618f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 04:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748001434; x=1748606234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jHv3PmM//9SAbvQ/ymuXc7lSwPjHHcb/twyK5VurVoo=;
        b=VK/qvHkxT041PWOpXF6aLgG1y8pQqc/K0QTFTwL8/aTIyi7IfCm1UUnx/i8fWzeBY+
         cDGePsHps9HHW0T3e3C4NOQt/tdB0FiCiuI6VSLCqq9vSgPcxjIKLPDP4u17Ae9PAvOu
         aBG9TnjdaYDkqE99+xSj2zOJ49qF/akcYZ5AzNwJWubrS677CK4WxrzmbkHCw0OvqaMN
         xaGfkZeApuq4s1PWlzT5g5qtCkLuz89Q1TyfNgr1u9gw1kTSlUC8jx3uJR3zc64IPwNf
         1zdYlwN49iY9Ws8GGJ/8wGnIeOPChlEcOVXCpSPFaz5MRqEJiRFDk7sz0g+HCZsTjBrk
         HVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748001434; x=1748606234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jHv3PmM//9SAbvQ/ymuXc7lSwPjHHcb/twyK5VurVoo=;
        b=YGYypxRSeOySuVj/Rpp3nW9L7j8bxvWpIO6oQgqEbohhEhKM0fytSdmr/ixqpD9Ka1
         FnAq0DeA4hBve6urBoohUcHYUJltGO8ZhtCrOvlVjQs3ebefpBiFxTlTsFlwuqkd9Rmn
         uXaknxfSBo7UvDOjIVBY5bYMkPz7nXKBvdgG95xkmAMipYeXUx5hnuXCZDRz54TCkGp1
         JBXHeu5tSb2Rmds6jPGsuSciDyjCiuSnuE0ZtQ6gz00Lr5dGVIgnBO1Z8GtdZryRKC/0
         JALdH5YhbuCLB58eenTipa/4Yk+w/LsqP6Y4r9iEyfoPWr7CmnVJuPMOJQo9xBbZ66k0
         S9IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh/fRixgG5POv3C6VGVNX2HVZE3ylpd3CEKMNvjXHucHTpLZyohZ7P++yx4MgMtaO5amWTK12yiz3cpzwW@vger.kernel.org
X-Gm-Message-State: AOJu0YzOUtHnWzlrYQO5WfWtDJ6F2VDAx+CNTwTgNZQkKmgFnoYSSVtq
	mJEtx8Fn8lK6BVMwWb0qINcAUTlwpJ4rcdVrSaEA8evqsbs7g0Xi0r7CZA5V9qCHbBk=
X-Gm-Gg: ASbGncvTejjvV6VMhhWn8L/D/RRV8yg24e1j9xqW1Of8W2//JpNe1oRpZmxiPkTUsGM
	E5Wwv32/QG6fii7fjyTMUsS9YbiANCKs+SCzsjaK5OBujLFF5iS9SxKGg8HgxCLhJtb2GuYNTCG
	0+H1zh5ZmrTBXDQoBujzoQfZ5wWByyVGULC6o4xTQiC3grRx6XQ1MDmeoTwRwX5wTvcidTkgiNi
	fQemJCn6t9fUTxO7hjQGaqfasaNDYKgxHr9Hmo3XW5CWlWMyFYeXw+iFJ/+S7LkLFJEgCpQkN/8
	ll4R79xiXGmPXTVxGjKHEqs6LaBvcEWSf3QyP5U6UgQnxegMvDaKvvdBbKq4hLIq879j6kSu8Qw
	k+uJKaIYXVA7ZwWzZrqw=
X-Google-Smtp-Source: AGHT+IFNrvccAlUMqw8s3fI0AfxthWK2WloBf38YsDtOvp9eZ2IIkUyBeD4AiDDkZoSs+CcivTfhrQ==
X-Received: by 2002:a05:6000:2584:b0:3a3:7465:7e60 with SMTP id ffacd0b85a97d-3a4c15589c4mr3501435f8f.26.1748001434253;
        Fri, 23 May 2025 04:57:14 -0700 (PDT)
Received: from toyger.tail248178.ts.net (i5E863BE1.versanet.de. [94.134.59.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88978sm26836364f8f.65.2025.05.23.04.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 04:57:13 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
To: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Nishanth Menon <nm@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Will Deacon <will@kernel.org>
Cc: Casey Connolly <casey.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RESEND] arm64: defconfig: update renamed PHY_SNPS_EUSB2
Date: Fri, 23 May 2025 13:55:34 +0200
Message-ID: <20250523115630.459249-3-casey.connolly@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This config option was renamed, update the defconfig to match.

Fixes: 8d3b5f637546 ("phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory")
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
Resend to correct Fixes tag

Cc: linux-arm-msm@vger.kernel.org
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..7e04a2905ce4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1572,8 +1572,9 @@ CONFIG_RESET_IMX7=y
 CONFIG_RESET_QCOM_AOSS=y
 CONFIG_RESET_QCOM_PDC=m
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_RESET_TI_SCI=y
+CONFIG_PHY_SNPS_EUSB2=m
 CONFIG_PHY_XGENE=y
 CONFIG_PHY_CAN_TRANSCEIVER=m
 CONFIG_PHY_NXP_PTN3222=m
 CONFIG_PHY_SUN4I_USB=y
@@ -1596,9 +1597,8 @@ CONFIG_PHY_MTK_DP=m
 CONFIG_PHY_QCOM_EDP=m
 CONFIG_PHY_QCOM_PCIE2=m
 CONFIG_PHY_QCOM_QMP=m
 CONFIG_PHY_QCOM_QUSB2=m
-CONFIG_PHY_QCOM_SNPS_EUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
 CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
-- 
2.49.0


