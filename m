Return-Path: <linux-arm-msm+bounces-14540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C52CC88019B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E48561C224E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4025565BAA;
	Tue, 19 Mar 2024 16:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lM71VhRE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972488174B
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864823; cv=none; b=lpYI/U2yFkZT3TgVeYA9bBqTQpGQ9T7FRzAZPvr5TkBNmnpKzChAyo03zoHlj6Vaer+DxMoCQI8CwonZgGlEz/yZjT6G2nX9Uxsn5R1OFqy7G4LA4OxMrMDypD3AWMXf5dplkuFAibb/v6L97ufprgYeO1AMSffS7anJzBsj9h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864823; c=relaxed/simple;
	bh=3OaHTjRWxVOFqq6QwFWr9Vf1yPoRQgChqqNEL0LMK/U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Reee75j9v7rc0ZrJV0WaudakMRPHIUvg5pg6mOElktdXNicYMngT5uty/lWPTErT8hZHZaQDSOSYeuAwNJOyjzLHfiEimQbEPW/rhxf/oJHyH8720S24JgIKfEzrng8z/zhS84FYUWi2oSZ6lAtgwBZPP5+i+rtVX3CicJtfftY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lM71VhRE; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-513dd2d2415so4495446e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864819; x=1711469619; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b4V4CmtBHIR1w/0/gGzCFIaeKfwz/9sDrWmne1XV4j0=;
        b=lM71VhRE4nSM5iYQUJlcvlj/LOczqOP06tRI30JKi8MxZ6HDPpLK5PD8YJjmAbIyOU
         SkHo97DDUujK3S6C4bB/3nA7gEaaT0Jiiqg6QRWZhRriVrVKK8xjoXz9FCbzTLL2CgiT
         FSjI/aDrx6RvNbLRyMwRTMq+iO0yTNTUgH7fZNcr/CO4NYhINmbhFVOi3SFa0wbQ7jh8
         CMhHdL0HkjvavHIfLeb2WdyC52so4YoWjBBycabov66QHD5E3ViiRz15gFhQst3aeeFr
         GnXON9KlzsBBw6upJEI2OSpd3CAfpBlFVkz2bFY6HgBoJsT1AkHpSJFVWRgjJ24/aRcE
         dRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864819; x=1711469619;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4V4CmtBHIR1w/0/gGzCFIaeKfwz/9sDrWmne1XV4j0=;
        b=HvL1DAzDHtjxvcIldlyNlp2VrBJpRrNH39kvM2vdwsg5li26WZKaypEGUACJQ/z3ot
         2GJ1n4neO78QIN2C3HlISj9SV9s1a923ttdsCkx3J5JbQDukFMDJ7jBSG++G5j4CmxFW
         K05EupMGCRcXuXKIhlzLOZ9wDPba/drBCxLnOOCyYNRtS5w3ZPdZSgyos0uM8pSGSsmn
         uhy9Hm86JaarYtgVODWuNt9TqArSHx67pih3mI922WFUen3QKhUZetYeL73sK/AXfe+K
         qtg2pkZerzJ0DF/trlDTpvtZxLup6GwGIRPQQ9QZ1MXZMAumgphCZvaKmZPbccCIGdIA
         UgMA==
X-Gm-Message-State: AOJu0YzuiuNtA6SzVc0Fx/75KdimsAZRZjeqTWaVowcr4D0FkdqAXQwj
	lSkhDHf0MLZTUd3tJaCXX25q5yOwrO/gx9aVTFcelRNMxyosB2a0tJnZ1dd8HzI=
X-Google-Smtp-Source: AGHT+IFsaOH79x756pVmwPZU66WQtsB5zOqjXh2+A9Qk7o/xaEluA6voZuVxAdAmJ7G3RSQbJFaTmA==
X-Received: by 2002:a19:8c0f:0:b0:513:9da7:3792 with SMTP id o15-20020a198c0f000000b005139da73792mr9914687lfd.19.1710864818621;
        Tue, 19 Mar 2024 09:13:38 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id dx9-20020a0565122c0900b00513ee207982sm607686lfb.198.2024.03.19.09.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:13:38 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 00/31] Clean up thermal zone polling-delay
Date: Tue, 19 Mar 2024 17:13:30 +0100
Message-Id: <20240319-topic-msm-polling-cleanup-v1-0-e0aee1dbcd78@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK+5+WUC/x3MywrCMBBA0V8Js+5AEqU+fqV0EccxDuRF0opQ8
 u8Gl2dx7wGNq3CDuzqg8kea5DRgJgX0dskzynMYrLZnfTI33HIRwtgilhyCJI8U2KW9oJ3N7K4
 PJr5oGH2p/JLv/72svf8AFmdz9msAAAA=
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c

A trivial follow-up on the changes introduced in Commit 488164006a28
("thermal/of: Assume polling-delay(-passive) 0 when absent").

Should probably wait until v6.9-rc1 so that the patch in question is
in the base tree, otherwise TZs will fail to register.

FWIW, Compile-tested only (except 8280).

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (31):
      arm64: dts: qcom: ipq6018-*: Remove thermal zone polling delays
      arm64: dts: qcom: ipq8074-*: Remove thermal zone polling delays
      arm64: dts: qcom: ipq9574-*: Remove thermal zone polling delays
      arm64: dts: qcom: msm8916-*: Remove thermal zone polling delays
      arm64: dts: qcom: msm8939-*: Remove thermal zone polling delays
      arm64: dts: qcom: msm8953-*: Remove thermal zone polling delays
      arm64: dts: qcom: msm8976-*: Remove thermal zone polling delays
      arm64: dts: qcom: msm8996-*: Remove thermal zone polling delays
      arm64: dts: qcom: msm8998-*: Remove thermal zone polling delays
      arm64: dts: qcom: pm7550ba: Remove thermal zone polling delays
      arm64: dts: qcom: pms405: Remove thermal zone polling delays
      arm64: dts: qcom: pmx75: Remove thermal zone polling delays
      arm64: dts: qcom: qcm2290-*: Remove thermal zone polling delays
      arm64: dts: qcom: qcs404-*: Remove thermal zone polling delays
      arm64: dts: qcom: sa8775p-*: Remove thermal zone polling delays
      arm64: dts: qcom: sc7180-*: Remove thermal zone polling delays
      arm64: dts: qcom: sc7280-*: Remove thermal zone polling delays
      arm64: dts: qcom: sc8180x-*: Remove thermal zone polling delays
      arm64: dts: qcom: sc8280xp-*: Remove thermal zone polling delays
      arm64: dts: qcom: sdm660-*: Remove thermal zone polling delays
      arm64: dts: qcom: sdm845-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm6115-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm6125-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm6350-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm6375-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm8150-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm8250-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm8350-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm8450-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm8550-*: Remove thermal zone polling delays
      arm64: dts: qcom: sm8650-*: Remove thermal zone polling delays

 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  14 --
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |  36 -----
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  26 ----
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  15 ---
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  27 ----
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |  18 ---
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |  26 ----
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  42 ------
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  57 --------
 arch/arm64/boot/dts/qcom/pm6125.dtsi               |   3 -
 arch/arm64/boot/dts/qcom/pm6150.dtsi               |   2 -
 arch/arm64/boot/dts/qcom/pm6150l.dtsi              |   3 -
 arch/arm64/boot/dts/qcom/pm6350.dtsi               |   3 -
 arch/arm64/boot/dts/qcom/pm660.dtsi                |   3 -
 arch/arm64/boot/dts/qcom/pm660l.dtsi               |   3 -
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              |   3 -
 arch/arm64/boot/dts/qcom/pm7325.dtsi               |   2 -
 arch/arm64/boot/dts/qcom/pm7550ba.dtsi             |   3 -
 arch/arm64/boot/dts/qcom/pm8010.dtsi               |   6 -
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |   3 -
 arch/arm64/boot/dts/qcom/pm8150b.dtsi              |   3 -
 arch/arm64/boot/dts/qcom/pm8150l.dtsi              |   3 -
 arch/arm64/boot/dts/qcom/pm8350.dtsi               |   2 -
 arch/arm64/boot/dts/qcom/pm8350b.dtsi              |   2 -
 arch/arm64/boot/dts/qcom/pm8350c.dtsi              |   2 -
 arch/arm64/boot/dts/qcom/pm8450.dtsi               |   3 -
 arch/arm64/boot/dts/qcom/pm8550.dtsi               |   3 -
 arch/arm64/boot/dts/qcom/pm8550b.dtsi              |   3 -
 arch/arm64/boot/dts/qcom/pm8550ve.dtsi             |   3 -
 arch/arm64/boot/dts/qcom/pm8550vs.dtsi             |  12 --
 arch/arm64/boot/dts/qcom/pm8953.dtsi               |   3 -
 arch/arm64/boot/dts/qcom/pm8994.dtsi               |   3 -
 arch/arm64/boot/dts/qcom/pm8998.dtsi               |   3 -
 arch/arm64/boot/dts/qcom/pmi632.dtsi               |   3 -
 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi          |   3 -
 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi          |   3 -
 arch/arm64/boot/dts/qcom/pmr735a.dtsi              |   2 -
 arch/arm64/boot/dts/qcom/pmr735b.dtsi              |   2 -
 arch/arm64/boot/dts/qcom/pmr735d_a.dtsi            |   3 -
 arch/arm64/boot/dts/qcom/pmr735d_b.dtsi            |   3 -
 arch/arm64/boot/dts/qcom/pms405.dtsi               |   3 -
 arch/arm64/boot/dts/qcom/pmx75.dtsi                |   3 -
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |  30 -----
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  14 --
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |  30 -----
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |  10 --
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi        |   8 --
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 150 ---------------------
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |   3 -
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |   3 -
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |   3 -
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |   3 -
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |   3 -
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  75 -----------
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  81 -----------
 arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi        |   6 -
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  78 -----------
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   2 -
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi       |   4 -
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  33 -----
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |  27 ----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |  12 --
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  63 ---------
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |  32 -----
 .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |   8 --
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  |   6 -
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  81 -----------
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |  78 -----------
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |   4 -
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  84 ------------
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |  14 --
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  75 -----------
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  87 ------------
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |  16 ---
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  64 ---------
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  82 -----------
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  88 ------------
 77 files changed, 1722 deletions(-)
---
base-commit: 226d3c72fcde130a99d760895ebdd20e78e02cb5
change-id: 20240319-topic-msm-polling-cleanup-2616a8bece70

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


