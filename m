Return-Path: <linux-arm-msm+bounces-63129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F24AAAEEA8C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 00:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 388F03B4129
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 22:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CAF823D28C;
	Mon, 30 Jun 2025 22:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGjqN5Gf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1462E20C494;
	Mon, 30 Jun 2025 22:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751323330; cv=none; b=j2EriDpfIE4ARvW47scnl6DSo4xV4cYmwW71rEOwrpJEThn2dxBbNmsJOrIF4Wv2CkBF1yyd0nJcslT4mTxSc9tApjwra7F6YUyCZi8163UEyvwBkFM6iYScFReb5JPkmGMAfiuogTdmj0+dJzjfnZggiimDTZTNfCT1Lgzl8jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751323330; c=relaxed/simple;
	bh=ZACAeLHypgZbA+k+mIDgOUZv844BSsXVuBGPJnkjwjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fgew5BI1QdIjnsJnB6F5YyjjbLLAigYNTG1PpfNjMBJd9rapsLwwEeU/mQZLBDSKvDNVDI4eQi8Xs3+A8g7OcCAOzkkUYErt1qpxrrsPt5zplbyRv5F1k43iQt8PBGgucWec6+6mGODbKnkOMGfvWR4pTHvnXOm2BFey834QWIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGjqN5Gf; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6facba680a1so32380576d6.3;
        Mon, 30 Jun 2025 15:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751323328; x=1751928128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Befo3Hd0rTYAAPA3eF8LE+sYNdk5todNlRuDXpPF3eE=;
        b=aGjqN5Gf9oHCFJwoG4miISmqdMuP3Z+8oCvUn6KwxRaMuxFO9qXnku8TAfrBHTWiCt
         KmtpFKF9tEfw9R1Mlc4zVk7eN2TjqdOnlHfWCH4EB7vA3VyeRjEAfuE4dTAEUU/WCRyg
         LT9AFxogJZBFYZd6kFyFXoOHUuyYYR2l17Ua4hbxmqf8VzM6xc6SgRMuX+GxP7HwZNj/
         SfZjOwAGCgYi3YvVxSoSphTt932npAcF+dnmP1OwO1NwdUCyFnvbu8dXev3AIlWVn4RU
         HoT8OTgcyvTw/QUt+1ty1oFji/KQbuCvt5EOfe/RtSM9NXxncUppNoVmdVgqJZa8tY0I
         CwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751323328; x=1751928128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Befo3Hd0rTYAAPA3eF8LE+sYNdk5todNlRuDXpPF3eE=;
        b=ZZKlgIG2Vd9jsMqgYzRR4TyLMNYFdjpYtLLZHzwVMNw3tg+d/4z6YF87vUuz53yNis
         5vZvPntztY2rCPmNXryXhpeA/uGCz6N0qjJus2/nvxWbgUirxZnEPhgMPO1riOj24f6/
         NZcDYpJs4fCC07gUm/AJJKEc2NsgwywOjlK1AaHy8/LFfl9xUVOv3jfuorZ/ie5hTIbn
         LKKBuS/AnVVB/2E26xLtBwO3nCqZ35bPkz7oU4reI0QPm5uZyQ1K69GCwPhvnIE/HtqR
         rEZbDCXN0BSbiIEWK7fH6u0XVhbhVjhf3Pk6bcQsNa9GMsWrIUp27kf35A/MTgi1xxE3
         IHqw==
X-Forwarded-Encrypted: i=1; AJvYcCUjk8sQZ4R3ShsBVRmNAje0ez66v/6H7xHsYLD9azyVCD5tQlJq8PDES0k6/9zLPH3Jj6lzM9Sgq5mD@vger.kernel.org, AJvYcCWPN/TiNkC7i9q/0knX4ybkJxp6MjTx1EnztBm+3OQ9MwMOpuMB38qQoSRNPyMuyMH+T5uo1Uu4qWPkmosuWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2MV5a1lCwQ6YBYaUVZg5xdOZxEi3B3Giv1cXrST/Tzy0B6K9I
	pwnftvNCT2ybclWBJc3/i/p0xQVyUsZj28m8E7nb0XckaazXu37MzPr3
X-Gm-Gg: ASbGncvb1aiajRQclsQm1TjNecitspbuLqh9QfpuzJvNQDUkQGqc+bOwasdy8P1hmKU
	63XD7PF4XmPEbObzNaZovWy1ZPBbtOFgFdhWHlxvdII+pXoz7pPoXa4fYl/o2YH7YkcauBxxfK0
	y5OIYdULsxs3sdcWL9xJKGAa2IyBgFX85bbascHE4tUaFEPbLv0V/IkKMggmtTbHCFZ8TBNuKt4
	Qb505Fn6btLx5uX49qvkzeaUZklJXXgGOXBk+sdrojHbvK7+7TPJYNyeTrHpeb4uONdw2/EA6YE
	O6ckdybqcx0xGWYXT2snl/WoMGfwKGrfJU9eQiKCOsiJLW8NaQ==
X-Google-Smtp-Source: AGHT+IGhQnbKJwumZdlEwdhNaZ9o2G1IcqW1DCXdsstk9RxnPBm+AqOxKwRV5SciljUKnFz1Pj2HJg==
X-Received: by 2002:a05:6214:4a02:b0:6fb:96:36b0 with SMTP id 6a1803df08f44-70013d52afcmr296873976d6.31.1751323327711;
        Mon, 30 Jun 2025 15:42:07 -0700 (PDT)
Received: from localhost ([2607:fea8:3140:6800::10ce])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fd77313b17sm74853496d6.118.2025.06.30.15.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 15:42:07 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH] arm64: dts: qcom: sdm670-google-sargo: enable charger
Date: Mon, 30 Jun 2025 18:41:59 -0400
Message-ID: <20250630224158.249726-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Pixel 3a has a rechargeable 3000 mAh battery. Describe it and enable
its charging controller in PM660.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../arm64/boot/dts/qcom/sdm670-google-sargo.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index 74b5d9c68eb6..d01422844fbf 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -33,6 +33,14 @@ / {
 
 	aliases { };
 
+	battery: battery {
+		compatible = "simple-battery";
+
+		voltage-min-design-microvolt = <3312000>;
+		voltage-max-design-microvolt = <4400000>;
+		charge-full-design-microamp-hours = <3000000>;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 
@@ -478,6 +486,15 @@ &mdss_mdp {
 	status = "okay";
 };
 
+&pm660_charger {
+	monitored-battery = <&battery>;
+	status = "okay";
+};
+
+&pm660_rradc {
+	status = "okay";
+};
+
 &pm660l_flash {
 	status = "okay";
 
-- 
2.50.0


