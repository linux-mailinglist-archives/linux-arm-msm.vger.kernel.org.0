Return-Path: <linux-arm-msm+bounces-33364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1BF992C84
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 15:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B3941C22523
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 13:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B9C1D3185;
	Mon,  7 Oct 2024 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpANlU4e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC0F18BC14;
	Mon,  7 Oct 2024 13:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728306171; cv=none; b=r66NvpJ3KGwEDXhwN/oZShhu0YVKLBU7dearuMsLmW06LQlymn0rsoW6lfDQ+et9rfRnjyeTfgjFYzawP8o8u2ZcmFoyucuUxS0qibb4Rhd3RPjGYZUtpfkjj7uStGG54hFk7SXkVCYsz13hQvbO8+BbzbwfSrt4sjFhp0nkqN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728306171; c=relaxed/simple;
	bh=IYDtZxIA7LZg7GJ4+ijktScBKAXI1nBZ6evgJqXugw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KVuK3PNpEN1nos2DWcn79QrGsliG+A7ujqIN3lzRuKOuOUzHdVw11zYs/g7KHB2OAHmFBqkY9kbtpY3x1w+nZO3a2rqdlt4/HNXwE4sCkNYI4Cj8epEVSbGHiD84+VpmG2tWJpOob7v/9BDJwSsMxolTZjCVrsys2iwsTnlMvEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpANlU4e; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e0a060f6e8so3120465a91.1;
        Mon, 07 Oct 2024 06:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728306169; x=1728910969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CwQatre7HDmPEfiwWXMhAxTYd1eDybO1wBnpMYOLMc=;
        b=LpANlU4eLhRYCWBNkiCK/HtSAlZzap36f5EVXHFgRv0aMeDFNl6dblYHb67JFf/t91
         c/Vzk44TrQvbQDkzSHGdjJoW7ofwN3eK2J0rBUU8ALUyDH8ddV0etmv8TX+bakF6bBXc
         X/kKZpQn0yLmf12QYigDwFzHpTYktnHqu30q6pcc+tLq2NF52xuzjWEyN60Ak0A+0ESS
         65JLtBLadsRAc2ZDE7PHHekOkr9nSBYyAGHhjW2VID9HhpB7zjdVnqKUPPDG9eaSkLjT
         5MalfQi2ZJc9/Q71M8XtD7LAPHvPmVmDWwaDI0w6Rxjs4CylHZr9ALLhaOCe1lAIbYMW
         JECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728306169; x=1728910969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CwQatre7HDmPEfiwWXMhAxTYd1eDybO1wBnpMYOLMc=;
        b=o/dDvp21tM7fmr1zCgz6udY2qQ0u+KE4z+PdQZNLsmfwNBViAMJmzl0c2gFBJ41gPj
         y3jbYGJqkKjajXeRzkIq62TMY9tIBdFr3DUM0tfTCr2jHnbRrRrxueJRm4svTiXEK0sA
         BiN3vgILW9BZVNbBAoXT7oPtZ2NrS20B/fKrvxvr1bTfXIJXaV/GsDnWylmB8B88qwkO
         kiPmYrdApt/wLWPEbAPdT1RkC7p5RPxEr68zrZYIB1x7HjtdXAOLABCId5QB76kooljs
         ZcuevpK4r9faOXI6tlaPkxGaXCm2VuPPADHqUnYKVwUBMzmsPcMaSvP/l/dXAH2Z84fe
         moyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoCFSCtoz0U+ioyLgTFGIF2NhzVqVk5Wq+rnHGfO4qdsNWYjkxKViLXbkGImIAnyRODcCaYNPO8dq9GTf/@vger.kernel.org, AJvYcCUvTr7fo8yxXOKt6TyDHe7zyaCey8nXk0ETNYR25VdOPW/1S3DxaTzLov/8WPdRFTVlsPujf5Op3mji@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqs/EcAoBNAk19VWp3+vUn+5HGyvuTJy+7azd1WlaFahvHCfP/
	LTZFQtNarMVEWjTT2toh5XrPTgVs2HDLAkjwoavd/hzw69fagqK1Ewfutw==
X-Google-Smtp-Source: AGHT+IHphNi8wQvW0Re22UFHYUWUX4stPnQdkVdx94eKxUrXesf/TgfdflxgAcmdcunP3HnAr5R2+g==
X-Received: by 2002:a17:90a:db87:b0:2d1:bf48:e767 with SMTP id 98e67ed59e1d1-2e1e631e7a5mr12276086a91.29.1728306168961;
        Mon, 07 Oct 2024 06:02:48 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20b128847sm5306654a91.49.2024.10.07.06.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 06:02:48 -0700 (PDT)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Jianhua Lu <lujianhua000@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add bluetooth node
Date: Mon,  7 Oct 2024 21:02:51 +0800
Message-ID: <20241007130251.125022-3-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241007130251.125022-1-lujianhua000@gmail.com>
References: <20241007130251.125022-1-lujianhua000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bluetooth node and this bluetooth module is connected to uart.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
changes in v2:
1. pick up Dmitry Baryshkov's Reviewed-by

 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 7a55e271c3ac..100607da42ad 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -30,6 +30,10 @@ / {
 	qcom,msm-id = <QCOM_ID_SM8250 0x20001>; /* SM8250 v2.1 */
 	qcom,board-id = <0x10008 0>;
 
+	aliases {
+		serial0 = &uart6;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -799,6 +803,21 @@ wlan_en_state: wlan-default-state {
 	};
 };
 
+&uart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
 &usb_1 {
 	/* USB 2.0 only */
 	qcom,select-utmi-as-pipe-clk;
-- 
2.46.0


