Return-Path: <linux-arm-msm+bounces-32587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA81398756B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 16:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AE7E1F2765F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 14:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90ACD155A3C;
	Thu, 26 Sep 2024 14:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce10lAtr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA9215380A;
	Thu, 26 Sep 2024 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360547; cv=none; b=eRf4pmviLs428d7mVM5YChNuY/+WF/BY5HRDglEs7R90EMlW7t+gZQvf9sFSb2DdVUS3G0yUOgu7PSI1ZnOA0HyRuCEDjx0OcWqmkVW6p7YeQ2fnagnzXZk93GD/naKBurRzJIM7jFgIAlGDdJInUGTzrpd/JtJ1qpfpdYqXk5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360547; c=relaxed/simple;
	bh=LXgqSMJKPpptWHRjG5sGV+9Z8Lxj5jA8H20WF+m2cbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZsPy2LvRzBH4zZIq1TaFlWl26jbijZt/c0YdR1wVB2Ujhl+irx2JA9htd4vZ98/JoX/kphcgRkad9Meimw5oYClYevxrpKjblPHSfBJYmtpfDbROnz4fSmpIuEp5uLsIy37EGYLJze0pt1sk1RoG3ozRPnnyHyzxDsimjbYx7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce10lAtr; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5365d3f9d34so1311085e87.3;
        Thu, 26 Sep 2024 07:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360544; x=1727965344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxV+xEnMJ80gLhFAUliu5RFc0rPgxSLDZdSiAt5SbDY=;
        b=ce10lAtrSgxmLrioRZb63t5Rq1tpXJu3Zi2aAnsa8oBIpZ79XFF0WhDUwHqAe859+L
         PTzY1k0YmSHSUB1R+ij8yuos3OkIRrC13rKOshbF3viH8gWDPJ7bInTvqoUI4dKNXAmN
         XUGm7IQkG5uBtgq67qbIAICTNqYM+NcjhAeiyQ5CDIC9OpIwmpQySAMmTX0aMdmZe+Re
         6dTjO0TUIbEAT9Y/D5NGgK7H1p7wmpVgMYbyRvIYujHgEtuGsCGu9SveeUi1q8RmTlps
         U8ssYiht0DltZxNpBPm8u7ESSXfxfr5+w4fcUtJglPgQf95+DiW7yvfd4SmwQv9TWrdz
         H6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360544; x=1727965344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxV+xEnMJ80gLhFAUliu5RFc0rPgxSLDZdSiAt5SbDY=;
        b=wQAr/D5TKQci9cYKDpg/lWOViohQ3Q/VEeosBJUT3HTTm6egZBy3zZ6xiAegZMzNCE
         zx2bL8q6CqllGiJScHb9C68ltmlX2c78tbLZCciSeuIeD9xK27aDzFs8RvmRBvruMkXq
         laYngfW3Z8LoFqzblRPezJAjct7LL0f8ZQSwUdJeCOt2iKg+wG1Gpyf8Flo8bDI4JZ+J
         lnLX0nLVzh/FXSicEJxMjENn/sR6UklKXF2AAHoxKzSJWFyFRK6KjWhATqI1cjgNrDQF
         g4Neaq9IKaxoIhKhTVhx/wvTUGsoODEOMgotVgX2XJ7v+OYqADF9QUCIn08LtLfeoChE
         i7Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVlD5VQGZtrY51QGM9Gm/0JJAjmKrUAN7c9NgBGV7TEJ3wpvPC3nyf12VpzFGZ33XZPfXirhJp/8nbUJQUO@vger.kernel.org, AJvYcCXN19tPWGdsQi44BG9PzX+QyfXNU5DyTOOdFWTLJZ7GvFs3cnYCG6TDuRmCHzP6TZfZHReIhfhLqbIY@vger.kernel.org
X-Gm-Message-State: AOJu0YzGhBUfUWTXJIL74DWANRvNJGlyNSu/XCFod5tlSpBJI56phmu2
	l0oC7/Ezrl337SnbK5iHBXOtVZCqaO8O6wLKvblLrdiXaCHVktTB
X-Google-Smtp-Source: AGHT+IHo2CqRjGCt7AS/PS2S+eLZZlyl9h0o91nijvmPiuMm5NOWDfFnxaPm9jZdCiv955t8VBNfKg==
X-Received: by 2002:a05:6512:3d8f:b0:536:54d6:e6e3 with SMTP id 2adb3069b0e04-538800b273emr3675734e87.61.1727360543729;
        Thu, 26 Sep 2024 07:22:23 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by. [93.84.1.20])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-537a864db1bsm815803e87.267.2024.09.26.07.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:22:22 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 26 Sep 2024 17:22:04 +0300
Subject: [PATCH v5 04/12] arm64: dts: qcom: starqltechn: refactor node
 order
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-starqltechn_integration_upstream-v5-4-d2084672ff2f@gmail.com>
References: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
In-Reply-To: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727360533; l=898;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=LXgqSMJKPpptWHRjG5sGV+9Z8Lxj5jA8H20WF+m2cbs=;
 b=FkKXXAfRScrdQGItDXKX2n3lV87d9TD7RpkCGv3JkPwxv53eVMCyh/1Fg+0biSUHXWaJ60yUe
 AxV7VK/i4b9CYfSYlkfCbd1ljV8wsVDq1Mx05Jeu53sohLb+1dqdFsC
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index f3f2b25883d8..8a0d63bd594b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -382,8 +382,8 @@ &ufs_mem_phy {
 };
 
 &sdhc_2 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sdc2_clk_state &sdc2_cmd_state &sdc2_data_state &sd_card_det_n_state>;
+	pinctrl-names = "default";
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&vreg_l21a_2p95>;
 	vqmmc-supply = <&vddpx_2>;

-- 
2.39.2


