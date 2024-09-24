Return-Path: <linux-arm-msm+bounces-32251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8232A98430D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 12:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D699EB29975
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B873C166F13;
	Tue, 24 Sep 2024 10:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SZF6YM3e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AAE170A2E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 10:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727172375; cv=none; b=fROCv2f3vB2CEjRQpduQ8eRiTCU09vnE+mmDWtKwkJvWd+U6B4ivFbW56wFBJ/2nX447zb0I3+jdIn65oc8BGv8WB6KEQrPJnULQvuF/DjNOTo11IbvffE9+iW3rN/cyn4SB+9FBj6Zs1p1lP/+BLOPIUTuLmFeNSOB47cco274=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727172375; c=relaxed/simple;
	bh=zkahsviwki8GXsoZwkhRGFigYmdwDtUEdbmNHhplhkI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I7wlWpN+w+Cdmv9nLPvxmc/H6/J5XKIVyuHw3LXx0xvu3uVZyD82JHdC6+jjkv9iGAJb7Y2Vv3GJCc47/muDD2+B7akT+Nn97y/cqDTwvEufhthbFkE67eQSIrFoz7G6Jh57I4xj6j2bXLTfXOURsuaILX33E8QPkZvwIUCqX0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SZF6YM3e; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5361bae70b9so620053e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 03:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727172372; x=1727777172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dYMWidRmgvw5DpCJ6m4DHjOiTyGgtTJOiC5xaZSRePo=;
        b=SZF6YM3emYDJeKchgwghUGqFLCDL+nBL3PxN1YMCohJocgYKWdeFa7mWAbenfXNs9B
         ZUigzqkVs9KPJdrZQEa3vOZNAw8EKFQjlb9wB63/fElAfAlZBxiHxUeS7HiHOb2q3fzA
         GD9l3gkP71Fy4j+Zescdu7WxVMKqx0InqxHtwokAwW2dBHfuzio1f/yh9FdkCN6890KU
         cVGxr2EqW2cEe/EwQvQRlSVKYC5CFittNMfbrwu+YjUxQojiLGe5hh9AMOI0MXDqFiT5
         +Vt5Y9rm4oOE+WlM9CCFaPMZsOB13sDEC17kEo+THUosjQUHX2iP/Hip6tlFL1d7qnhP
         /RHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727172372; x=1727777172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYMWidRmgvw5DpCJ6m4DHjOiTyGgtTJOiC5xaZSRePo=;
        b=WDumjwH71jAXP6eDHD85YcgDCXZIBYdslGxaE/+2mNOuz3nZzeGaXYyewFFShG20Ry
         tuTWrCRlv6ZquuJ8W8dw4LNfabXlrEAwHiU0tWuxQFkGfkpDiJ5ocvnH3OvXCSNg9vfD
         MSrFLW242NEQecC7FGPxnsmnya9jDdx9fSBXidPwFsyzZwXGxKNbz2T8EC1NEyN/2eGZ
         wuev0P9Gd31XAXmlp1SQb4x1caKHFzz7Qd8ivLiLQJoJCbpa9Aw7MkeyxHXH61ZtemcU
         Kbr4ZtsB1kOjGkSaoblEOF8D5Nr5yUV9831DO45vlA9AyIUTl6gy9L1e21BsXrv3WoLT
         OsqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvPr3DrYf27mijf4vV3aJlHVLpMMizh2bkppiLnQ90a+iP/KCHvIdOnozhp31Jby5JZtZO0ueZg+kqqkm2@vger.kernel.org
X-Gm-Message-State: AOJu0YxhcdbsQbbl4IXwLTpqgjIZhiqeqHNLQJIkDAJ+wLhE+2na+kZF
	H5XUu3Gj6J0ZI/qM1NtvXuo2majvfjdPdW/TJoNEsTS5dsYstULvMoyME1OHhjIbx6smwHwxtLN
	mWe4=
X-Google-Smtp-Source: AGHT+IErDp1X6SrI4w45Sikp6UI6Kly6KLi87PihXNnRidcBYC8jyeSm4WRMysds2Shl+hCXkoHN1A==
X-Received: by 2002:a05:6512:23a3:b0:536:7362:5913 with SMTP id 2adb3069b0e04-536ac2d0367mr2289853e87.2.1727172372079;
        Tue, 24 Sep 2024 03:06:12 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a864d937sm156713e87.273.2024.09.24.03.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 03:06:10 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/9] arm64: dts: qcom: enable dispcc controllers by default
Date: Tue, 24 Sep 2024 13:05:53 +0300
Message-ID: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The changeset is based on a discussion about necessity of enabling clock
controllers, which is found here:

  https://lore.kernel.org/all/9ac4117c-755e-4e49-b3a2-661e7195a7ed@linaro.org/

Still on a few boards display clock controllers are kept as disabled
to follow the intention of having a non-function changeset.

Vladimir Zapolskiy (9):
  arm64: dts: qcom: sm8350-hdk: remove a blank overwrite of dispcc node
    status
  arm64: dts: qcom: sm8450-qrd: explicitly disable dispcc on the board
  arm64: dts: qcom: sm8450-sony-xperia-nagara: disable dispcc on derived
    boards
  arm64: dts: qcom: sm8450: don't disable dispcc by default
  arm64: dts: qcom: sm8450-hdk: remove status property from dispcc
    device tree node
  arm64: dts: qcom: sm8650: don't disable dispcc by default
  arm64: dts: qcom: sm8650-hdk: remove status property from dispcc
    device tree node
  arm64: dts: qcom: sm8650-mtp: remove status property from dispcc
    device tree node
  arm64: dts: qcom: sm8650-qrd: remove status property from dispcc
    device tree node

 arch/arm64/boot/dts/qcom/sm8350-hdk.dts                 | 4 ----
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts                 | 4 ----
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts                 | 4 ++++
 arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi | 4 ++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi                    | 1 -
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts                 | 4 ----
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts                 | 4 ----
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts                 | 4 ----
 arch/arm64/boot/dts/qcom/sm8650.dtsi                    | 2 --
 9 files changed, 8 insertions(+), 23 deletions(-)

-- 
2.45.2


