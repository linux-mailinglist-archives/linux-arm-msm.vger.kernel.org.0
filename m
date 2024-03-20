Return-Path: <linux-arm-msm+bounces-14637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 384F48811A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Mar 2024 13:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1B111F2356F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Mar 2024 12:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716861E51F;
	Wed, 20 Mar 2024 12:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fEmbLziW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB9940845
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Mar 2024 12:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710937537; cv=none; b=iKRXx7Lte4tlxuoqHd5Dbxjfkvfwof8q9s4iyQoUP7e6gqmOEObTUOb1poUynqfJI+qoVW2KAOTe5jRpvHVS92fO0OHYKEclSo0hPQMXqZakZH1uTdz2hL7LvmyaIFsaJW6h23D5b5FIJtfswemxc4BOcOv64Y3mqHJnInkyYd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710937537; c=relaxed/simple;
	bh=O6nw9q4DjUyPQCcQqSpruvvcT6pJqqZaEGQnnbRnINc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aBDApsw6mIBHznsdZOUc+YJ1GWhlC2+eDMiCyNUwgK0aRim5VakqaeoBh5+d8/nwY5t/AdajaZmjbXWWOwioaDhrrT0MR6A6O34LzQks104qcrcXziLmu1W1pqv6IzwnYqHsJH+qgE1vosF2KNS7LB22l3TUkGaCFhSxVRfH2gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fEmbLziW; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d4886a1cb4so79666241fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Mar 2024 05:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710937534; x=1711542334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uYXISrxVZmG0cSqs1Z3wR5TStIOq15Iq2U3WIUX8ykA=;
        b=fEmbLziWRdImdGrFaFRieA5M9HTLr1tHmRdrP1WCzQZ7VXar1q23++wDfvPM3fBG7D
         St5VcQK29Fa4qQ7eOS8HW/q97DogQkWLUSrI952DmpkRfD/HgAGCh4SZgX3oraTSvQkY
         TCgCG+t3wUSny5888wNA9k84S9uVmskqHxDVI7Y/MwNrlXyDreFMDB1twALN5VLXuSCI
         uwaaQrZ3PBLaoWerGLqchauX2tMeF642SltB+N9hPZQOlylUBqEcdkHh6ThVH2i+mjm6
         Ago6GJ2hf53rdrEOIW9NrZLLbn2W6kQYIjug7G4IbWyJb7S51JzggmayIBEbmPVBion1
         886A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710937534; x=1711542334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYXISrxVZmG0cSqs1Z3wR5TStIOq15Iq2U3WIUX8ykA=;
        b=Hi6HM+XzjBaJItZw+RsSWvwIQi6fr8Bp1wRL8yJcx0HpD/yJcuPyzVVje3KetPoQQQ
         gWQ79s0iEJ/DSZmn6wyzvAmWawakF46jb/E5z95K9qB6lef0KWUhWTizgQ9cpqUHkwNS
         jXFX8EJ+RE7cOHoPu7V1bw+HZTTGTiucVtTsrMKURKyigFFVe17J6NVx5EvRrODqun4A
         Ca1DdOsTY7vS6DkrxSAH6Q54LH+jOVsBly9EOxsgs2oElb4q7f6hhed3oQtjhRZueyli
         N47Rzzt5p3plnqb7EgAj/DD/0Lv8cmtnGIEBz+2RrkXRa3Oc5kOP2wT7uwXgUGv0zUU1
         TeeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSgjvOkrzad/HtxjxAYrNbBBgOXSXRRAJ+V31xSusin9jsTEpcxe0x/IobVA4cAbIih5iXl9POW64StOIIVVF/qOWOEdh7dxx0DdrpAw==
X-Gm-Message-State: AOJu0YyuvWItw/PAMmzgdORk/WOjhsFPmRtMbd3ju0hjwgK2HvAGAzBB
	YOnRDFDZcJ/28N6JyTmc/V2Vx6dmD92EcYuhUxEWbAWM7dUIAtnsKtww9JNJGi4=
X-Google-Smtp-Source: AGHT+IFSGp6onmwOCG9iC5No7m0riFr/aKFnD+fp7Jq7Vi+y3DuhgxvL8EoLl7vw8JPfZL+MNJ6sNw==
X-Received: by 2002:a2e:3c12:0:b0:2d2:ccd2:3a9b with SMTP id j18-20020a2e3c12000000b002d2ccd23a9bmr1242515lja.28.1710937533687;
        Wed, 20 Mar 2024 05:25:33 -0700 (PDT)
Received: from lion.caleb.rex.connolly.tech (host-92-17-96-232.as13285.net. [92.17.96.232])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c358b00b004140e701884sm2062938wmq.22.2024.03.20.05.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 05:25:33 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sdm845-db845c: make pcie0_3p3v_dual always-on
Date: Wed, 20 Mar 2024 12:25:11 +0000
Message-ID: <20240320122515.3243711-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This regulator is responsible not just for the PCIe 3.3v rail, but also
for 5v VBUS on the left USB port. There is currently no way to correctly
model this dependency on the USB controller, as a result when the PCIe
driver is not available (for example when in the initramfs) USB is
non-functional.

Until support is added for modelling this property (likely by
referencing it as a supply under a usb-connector node), let's just make
it always on. We don't target any power constrained usecases and this
regulator is required for USB to function correctly.

Fixes: 3f72e2d3e682 ("arm64: dts: qcom: Add Dragonboard 845c")
Suggested-by: Bjorn Andersson <quic_bjorande@quicinc.com>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 1f517328199b..9a74464b8af9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -194,8 +194,14 @@ pcie0_3p3v_dual: vldo-3v3-regulator {
 		regulator-max-microvolt = <3300000>;
 
 		gpio = <&tlmm 90 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		/*
+		 * FIXME: this regulator is responsible for VBUS on the left USB
+		 * port. Keep it always on until we can correctly model this
+		 * this relationship.
+		 */
+		regulator-always-on;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&pcie0_pwren_state>;
 	};
-- 
2.44.0


