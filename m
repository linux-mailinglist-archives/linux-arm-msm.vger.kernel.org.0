Return-Path: <linux-arm-msm+bounces-30989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B9A96DFFC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 18:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB366B23150
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A968C1487FF;
	Thu,  5 Sep 2024 16:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v66CVDSc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B701A0705
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 16:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725554513; cv=none; b=unnQEsikSSe/qKoR0XhlEjm01h21wBGIxWNBf9fNxmzSIWkiWNcPQ6/YXN+t78e/Vx049UsjAvmX9AR15wIaG6g8ru4SAW9qazatwI2TJrInioxjaWNEyovYqitoAU5GhHni1gMuY1FDibWVdAFYe9M0xhyWtcMkVPRK1/RhGyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725554513; c=relaxed/simple;
	bh=/n2w4WfL481QLP9giCdHjxL5pDOEV0EvTX+d0FaTApM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tCBKkm/jtbq7hA3T4ecEoUBVEqn4hWbE/7NO09Cw4Ln8Da1d99YTh5m/Uuh/nu/KJvhs/ZFiB2BDN4yL/QlDv//WyB0ZhbgL3OSkfclUVFtjUlAQj2tBimLUmAGa6r0qrCwZ0X7AZie1agm1cozhsbFGxndB5EAr5uLiG+slOZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v66CVDSc; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-536536f6f8fso134894e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 09:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725554510; x=1726159310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BITLSnNFqj9HqDQ/WsGrEC15ZzumQC3SBEJxW0vGrE4=;
        b=v66CVDScBxwcPFPnpPYwBbnLkdSJexjFPQG9GDXYCQFllRuNse/dhj6Uu9EqrYwo/v
         jYYSd9vBbL2ZTmaPhiFfjfxCWtk4j7ynb5SzRf1LQ4MsCy3zStWj3nzw7tF5skgcIN0Z
         ciQ2GqnyjIwwwocOTzZD9KSnO396ywb4NrEg3trygQvtDPHI/b8o4ChVBhxwXNeWbqE3
         IuXOt6MYZ/HPLqjV4UO7gyLSHQYhlHBe4QX9Et2JoWqg7PltK1DB3CA9wnSfeFiS0IA8
         6gOv/CeiR7WTRocgzB9O6nDWFRA3+8CE9jAaq0GZn3ys67Q6sMqMSKgsK+1VBd0AdOsz
         qecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725554510; x=1726159310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BITLSnNFqj9HqDQ/WsGrEC15ZzumQC3SBEJxW0vGrE4=;
        b=rOIqUFQ6uv0nPluvIEFYZ/6sWG/1RfHlifQO/PDb56+s31/7d7U7ybRI9X2c2OFdcp
         cg+3OLi8T+nLckH97hEchk6mJDUZJNNeMVieQShqa2S0kMC/xOyBbgUMfDV+EG8W01q4
         JCNRdv8GwKTbwc5OVpgIsteidJeTOsVxMCTLwNVOtb+l2VyH97T2CB63KOLpQ7S9MEBv
         nvJCWqjFYeZubBbzsNhfvhuk2vtNY+9oOeYcvNC10RWwqChoDUOVB+VN4+rtWMeOSaTZ
         L0QN9t4kVdWR+s6MNRnh0L92kBmItS6d8KUyKuooz6uu/wGyyEAsp/khZzQFESTGOKmA
         qD1A==
X-Forwarded-Encrypted: i=1; AJvYcCV27BCINBCjznIU4YZeDM/ITnJJspmJEw+ynRWINzFtXYR5uj2Feo6flpcUz555eCC6FV9LMyitwnsqQkni@vger.kernel.org
X-Gm-Message-State: AOJu0YzCDx/hHBJxUlt7pU4FCddw4AgNlurgrMJxosGCoMzlYEBKMyD7
	IRLy7S+pEeprHP0vh7+o19Il3A9FFou8G4rrRehciLJQnW1OQ+TTYTnJzb3UNpU=
X-Google-Smtp-Source: AGHT+IGWnGd0ssQFsIazN5TgFDkZGAmMFBgFDUI4pgKFBQoxwjNTwsPg/Vk9lHpOKiKJw42pMqaNKQ==
X-Received: by 2002:a05:6512:1390:b0:52e:ccf5:7c3e with SMTP id 2adb3069b0e04-53546b89e5cmr7114061e87.7.1725554509816;
        Thu, 05 Sep 2024 09:41:49 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53655182c91sm100674e87.306.2024.09.05.09.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 09:41:49 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/6] media: dt-bindings: media: camss: Fix interrupt types
Date: Thu,  5 Sep 2024 19:41:36 +0300
Message-ID: <20240905164142.3475873-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was discovered that on a few Qualcomm platforms types of interrupts
do not match both downstream code and a type requested by the CAMSS driver.

The mismatched interrupt type between firmware and the correspondent
CAMSS driver leads to known problems, which were discussed previously:

  https://lore.kernel.org/lkml/20220530080842.37024-4-manivannan.sadhasivam@linaro.org/

Here the situation is right the same, namely a repeated bind of camss
device is not possible due to a wrongly specified interrupt type, and
it may lead to an issue in runtime manifested like this:

  irq: type mismatch, failed to map hwirq-509 for interrupt-controller@17a00000!

Vladimir Zapolskiy (6):
  media: dt-bindings: media: qcom,sc8280xp-camss: Fix interrupt types
  media: dt-bindings: media: qcom,sdm845-camss: Fix interrupt types
  media: dt-bindings: media: qcom,sm8250-camss: Fix interrupt types
  arm64: dts: qcom: sc8280xp: Fix interrupt type of camss interrupts
  arm64: dts: qcom: sdm845: Fix interrupt types of camss interrupts
  arm64: dts: qcom: sm8250: Fix interrupt types of camss interrupts

 .../bindings/media/qcom,sc8280xp-camss.yaml   | 40 +++++++++----------
 .../bindings/media/qcom,sdm845-camss.yaml     | 20 +++++-----
 .../bindings/media/qcom,sm8250-camss.yaml     | 28 ++++++-------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 40 +++++++++----------
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 20 +++++-----
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 28 ++++++-------
 6 files changed, 88 insertions(+), 88 deletions(-)

-- 
2.45.2


