Return-Path: <linux-arm-msm+bounces-73182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C29C3B53D58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 22:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C6F55A0A7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 20:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434532D9796;
	Thu, 11 Sep 2025 20:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMuLMZfJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955362D7DF2
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 20:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757624227; cv=none; b=Lsot3gANv+da1g3tewO5bl9aNBaSKDGjirJkENsOXXVHiC6R10z1ITSLE8Cd1AF2Qh5wTKMPV02dQwOVTqW7uWDwq8Z6mjBVFJByA0eHB/kBwL/V1GLzzXSFy2FBk3zNWyw9GW2M/JRt7krEwvGqWL0G3R55T88TfmnNPhhvmSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757624227; c=relaxed/simple;
	bh=nUEAyXgbLn4v9azKT5n1vztEvNCnWVI0bOzq5dWBoz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFTuFmq6fwTBWqEulmUp7URi5kQJW8aeIbMUjHdV8Jyu5yzb75rUccPFooCYoabeZGCun4FKjkQppvGcj5DK6VG1Tk+ZRaRgQKq9tCzH7m2EsKlpGka5YXLGLUITqLJuqPfWQZc+Qb/b1PQ/CoaeQFMmGan1AOvbd2HtSjut9FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMuLMZfJ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7a16441so177657566b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 13:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757624224; x=1758229024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0JmqMyBdGbQ8gI7VodLEj+HaxvKC2psqCBIe1Mn6TI=;
        b=DMuLMZfJNajLmfaPEPIeJslP5wEBbAiy6kG2XpsUU4ilXr/Uiw+bFTqA9gMPqVTnCy
         B/aEBONHFp43C/fatEgZ+tYnFIZMed5ZZKk+676tnPiQNqu/MtxHzN3OG3wcVv7XV4iX
         S9126ms33ZfGkeEdbhIizVmfFrLqy/i4vPbWV9r5GQxRznm1yE9pw4MOzuikkzVMf4uW
         zUPdfi9CUvW8q5iZDLDLbsB8i5L9V9AWxeqTm2UqMuTyRYXDbFHai6NZHTAcogKxegZk
         kfXEtajtuWCCDWbKYhXveNfNTcY/LR2i4Wwk4gxbc4B9FkESTDvsqWqVlfKa9vlBLoiw
         CEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757624224; x=1758229024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0JmqMyBdGbQ8gI7VodLEj+HaxvKC2psqCBIe1Mn6TI=;
        b=qDKjfO+8BdnYvABZ8kjDBYkEYKKIWsaO+wHHzKMCUWYrJ6e/O2Qat2rrBt0uSdgQ9Q
         CViNBU2iaUD5uxMiWFb0Dgt61g/WwG5Slh4gbQ2ThYMRVDBScHtHy4q6ih2fHEyWjX6o
         E79auHgSPHU4BF/ZuwFum0uY1Dm2kWFg3OMsFnudX3aB6t7vHy3bliFoKalA4wd7Fj+x
         b37dJlzIvAIN7yRowbh+OhUMHFYekDy7LaD50lu8/EGAkVeuXMw7IZXGqrWPaDN+7s26
         kHoO3vi/pcqxoMzQRRa9WP9RFrwLmbBAcBISp1Oi13n97b0049jOP1GkOcwd1+NTNXtu
         MCQg==
X-Gm-Message-State: AOJu0Yzu5xps6/CtgYO6uK61uUCCyvbCyB6uLNHpKQa88+xvZWnZKWPB
	7R85PjezZ0q5b27Vu9VJvW2ki6hT6bZZhNtHcEdJ+34YhToWV8D6X37G
X-Gm-Gg: ASbGncuUt2tD8sy9c8wXP8Ug8HFZBUQ6kYBa5C8ukmn+4OAuDGCjOaLMdhPeB86vbKu
	OhzDxIWq1v5kpXKzosshkZKpEw5HeffVNzwxYtz0UqO28MoZjzQvihCvF+gZ4nOZYs+agtTNW5I
	DB2kFsL+gNbwp/I3gtrV9u/DiifQP0NeE//CFj0Jqx0SfZEhTVgciABHs3AufZB5r9eEZ0PQl5t
	/bqsKoeAKvTb1H4TSohaI/jYhlG1ZNraFP1KgUs5UwmyiuyM/Qzo6Zmsxe8KHOihrdEiMZ7yPCD
	ZF/Qndx2+SGFcGhptBQ0ssAseu68Znw3cCOGnPCYce1HVRbmt2STQyeH2R9Bf8vTGeHWjIIJzDd
	8mOc+ux9nyl8fsIdFm2mEJd4fdpdJoME=
X-Google-Smtp-Source: AGHT+IF32n+ghR2lvp3OruPrYSdGU7Y+rlNr3st/nMIgdWGllWQUKQeSB5kNG3qCsFPT9IxV4Ues/g==
X-Received: by 2002:a17:907:9705:b0:afe:764d:6b22 with SMTP id a640c23a62f3a-b07c347fa5cmr49768566b.9.1757624223756;
        Thu, 11 Sep 2025 13:57:03 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b07c28f190fsm38775366b.39.2025.09.11.13.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 13:57:03 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 11 Sep 2025 23:56:57 +0300
Subject: [PATCH 2/2] arm64: dts: qcom: sdm845-starqltechn: add slpi support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-starqltechn_slpi-v1-2-93ebf951a932@gmail.com>
References: <20250911-starqltechn_slpi-v1-0-93ebf951a932@gmail.com>
In-Reply-To: <20250911-starqltechn_slpi-v1-0-93ebf951a932@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757624220; l=1353;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=nUEAyXgbLn4v9azKT5n1vztEvNCnWVI0bOzq5dWBoz4=;
 b=27svf7Ue9vYWwhzsEw473UyOaGIigV5yMC8y292nwZYZx8smqYzOpcLd5YpIxLyOkNEf7ioH3
 7TNd6E/3hIbDI+dM/LRkxqhQEgg05+jN7I+Z7kRmQ/a1S00gttS36VN
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for Qualcomm sensor low power island.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 32ce666fc57e..2c1157ee7b2d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -902,6 +902,14 @@ &ipa {
 	status = "okay";
 };
 
+&slpi_pas {
+	firmware-name = "qcom/sdm845/starqltechn/slpi.mbn";
+	pinctrl-0 = <&slpi_ldo_active_state>;
+	pinctrl-1 = <&slpi_ldo_sleep_state>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+};
+
 &usb_1 {
 	status = "okay";
 };
@@ -1028,6 +1036,22 @@ sd_card_det_n_state: sd-card-det-n-state {
 		bias-pull-up;
 	};
 
+	slpi_ldo_active_state: slpi-ldo-active-state {
+		pins = "gpio8";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	slpi_ldo_sleep_state: slpi-ldo-sleep-state {
+		pins = "gpio8";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
 	touch_irq_state: touch-irq-state {
 		pins = "gpio120";
 		function = "gpio";

-- 
2.39.5


