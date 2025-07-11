Return-Path: <linux-arm-msm+bounces-64496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB46B014AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C88AB44C9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 07:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774951EE7DD;
	Fri, 11 Jul 2025 07:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Eqbr0wAD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870F31EA7CE
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 07:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752218932; cv=none; b=UXQ7ev3XsRTWLwc2QtUiaCuHtocrtg3AygLKNsMm1LsxJyDZcEJWZDI/hzgvxcbL8abXxEYvPtcXRA4a1HxD497f+exak46jxt5Qiur2NNv0LGCMXEFxozKayxbJdUNkaTov8DTAtF+yMVr6+iSSg/F+R6vIe4AcQnQEf1ie1w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752218932; c=relaxed/simple;
	bh=5OC6pNsGYReu9joXH5h7Rf/JTtrwn+xwy7Hj9WpXny0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=diWza/qPHvJaBe/cpJ7dxTm0yKmxiDsQgCTtXDkZKVoGuG2SZrmMP+5g3Lh3TsUOr17rHVeWkB2aTrrgnD5Zr30+Q4ROd5F7KwfKEABuxiW95A937buuo2QqJKQW1uVh6Zkw0Gn2FxKR4kJRKb/KVzOgZzeHepWyDzzydezOvGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Eqbr0wAD; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae3ec622d2fso311579766b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 00:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752218929; x=1752823729; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5Djg5nQME5vYcmqvKhQyglqok2nNFSKPkcFvGfQlWU=;
        b=Eqbr0wADPS+ux4wCPZ/91HAiOBohYE8E0LO8kfZwj6GY2NaqOE37zHke2Gte/8OeXd
         dBwVAkA2KxAYQchsGQ0WKgESwI04Odl0gOnvuD5KIILXRR1g+gX1EiEGh541nTTJ/VCG
         hFoguoF2iV255yUTc8HqzabVOc/jFDrb0OP3nBNNV5F8378ZX5BAw4hG/3WIxVS1ELXm
         Ff0mSV7mujU/QZfRjK2AS2gpA6+PfqEFRDd2eYbnGMV4GJhOwPwKF/3sijdB6To/kG0o
         4GQgagXkZe5tt+KcW1IyZSIwvu1j/TFpNPpwT9fuiwi2NOOVbT37u+KqaAG+KPPt5dDU
         dcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752218929; x=1752823729;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5Djg5nQME5vYcmqvKhQyglqok2nNFSKPkcFvGfQlWU=;
        b=NKbmOPPdqRwdZctYkguhAAtjBFsjTQOfu9H1nCARPG1FL2tZLgutDZRW7efV4Tsw8v
         lFGILFg8Zc8gqR2RW5BLsX26xt7nYi8p7npk3jGLqnDBA8cVD/I/yS+t3FsZZ4jZ+kpP
         yVjZQE4PAnRPoctpnp5MDTrMehwcAl7fxB/qSJpmxaJT4iaLG1csbQqQZqqEM36xpZIX
         MffHnob6SboedZ3jr61lKd5uafgnLaFaTymS6Mz2qNDxyP9IuMUi5SCHwgfArLbRLIsE
         3A7VfHTGQ+GEX0j1XKD5WoEffxvWyOQSy9Mh+yb1qw+hvydAZaEjY4AP4TbJ2rPYY+jO
         Vg4A==
X-Forwarded-Encrypted: i=1; AJvYcCXkMSI3wuPwgUn/ZE/yajJ1sA90s8LOyoYSq4A+xrAIomhdvi6GmpHzeT+MeGMZBtkO1eTH2bFX+/tjUSmg@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbn59oLJQa4I6LlaXhLIHjQP70pzU+wrgIaxBIlc+5TZFLiigs
	pfsy0iumK8cosT74U02bZ087uGpqpUYCpBDkrOzUnIABp73d/MnZqjay1QWcdE6hvS0=
X-Gm-Gg: ASbGncuKodIu1Wvicz9wqmjc72jYc01EHGdJ0tYzLH64XkZ6Cz2qrsivkkd6PvbuL15
	Ta0fsRJnldUznH8nAPjgD5JGL1W+/s6S/Yk1eaddGDj9uoCw36355QZYRR8Skh3uXuKd9NyE/2q
	/tsI6imv4Vhkp4G5Te4tlPSXTUsFRY8YnpCW+I6vruc5zyAAV65LVqp5GGoEosys6gFUuvm+8Uf
	mLX6eJRBSGS+9T3nAWHWrvhOOvSWDsZ8/A1qtl+4Ji21LrPJQEvhXJvYyA3N2dXTlSa5SBdv8ut
	CIq/xNlXnDs5siuk4mUzGotMOaTCQH+ljb0V4ITxcn0+0POVE2hXBGJJaQIGDnL0dlB9AU8kfoP
	O4Ya1Aobgc1OCzSyBbgy5K8QdXeni9dV5+6FTRKU4uXsMLJ9d3YjS1kBOZ2XrZJtqCfM2
X-Google-Smtp-Source: AGHT+IESgHYrJC+OdzlgHSAzNOcP6fy4JRfSY2wbcPvJRMMY/vEnmKTinb85fT9gtTl2Ni2GigiZmA==
X-Received: by 2002:a17:907:3d51:b0:ae0:d1f3:f7f4 with SMTP id a640c23a62f3a-ae6fbfa5a2fmr207016766b.13.1752218928862;
        Fri, 11 Jul 2025 00:28:48 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90c1dsm252600966b.4.2025.07.11.00.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 00:28:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/4] Add RPMh regulator support for PM7550 & PMR735B
Date: Fri, 11 Jul 2025 09:28:38 +0200
Message-Id: <20250711-pm7550-pmr735b-rpmh-regs-v2-0-bca8cc15c199@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACe9cGgC/3WNzQqDMBCEX0X23C0xsv705HsUDzFdTQ6asCnSI
 r57U6HHnoZvYL7ZIbF4TnArdhDefPJhzaAvBVhn1pnRPzKDVppUrSuMS0OkckhT0YgSF4fCc0J
 Vq7ZhGivTdZDnUXjyr1N9HzI7n55B3ufTVn7bn5T+S7cSFVoztjxpJtvpfjJeogsrX21YYDiO4
 wM9o3hXxAAAAA==
X-Change-ID: 20250623-pm7550-pmr735b-rpmh-regs-06087e5b3a99
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752218928; l=1136;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=5OC6pNsGYReu9joXH5h7Rf/JTtrwn+xwy7Hj9WpXny0=;
 b=Vh8dM9rS4cRJ4mw0SRv1GCJrTOGSf2g2lykF7iWN1GB14UZcrbdwfr4dbRRoizqR0VWLy31j+
 20lVoDCl+ltC0ieh5zYxgD77yrYkZLaMtIC6utCzZk7fPNhzx0maYV9
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document and add support for the regulators on PM7550 and PMR735B, which
can be paired with the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Update pm7550 ldo12/13 type to pmic5_pldo515_mv
- Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com

---
Luca Weiss (4):
      regulator: dt-bindings: qcom,rpmh: Add PM7550 compatible
      regulator: dt-bindings: qcom,rpmh: Add PMR735B compatible
      regulator: qcom-rpmh: add support for pmr735b regulators
      regulator: qcom-rpmh: add support for pm7550 regulators

 .../bindings/regulator/qcom,rpmh-regulator.yaml    | 35 +++++++++++++
 drivers/regulator/qcom-rpmh-regulator.c            | 58 ++++++++++++++++++++++
 2 files changed, 93 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250623-pm7550-pmr735b-rpmh-regs-06087e5b3a99

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


