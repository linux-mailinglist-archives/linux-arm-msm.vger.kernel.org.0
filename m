Return-Path: <linux-arm-msm+bounces-49568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF38A46F38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 00:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B01CF16D5C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 23:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747162702C3;
	Wed, 26 Feb 2025 23:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdU+Mqxq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4CB2702AA;
	Wed, 26 Feb 2025 23:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740611696; cv=none; b=QqrJA8Jm4XHd/b73qq3uzhxSwLGzuM77r8JKqN8/f1MkFKrLYAnSQ5DAfH9//tA1eoOK8pvGdaYomvwld4CtHXx6XqBSRgAVhHIScVUPV/2cThfIAflCLgvidvuLzM0yUvwGb7AidywzR39LBmJHRNI1rNAiuKI1ONkGQVYrKGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740611696; c=relaxed/simple;
	bh=PtJkB6mjmGaxcgGjphB0u4kVZaQ9U2aXXx48Yt6lzbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GW33WxWX1+idmkD/d+07olElBR9X86psnZgbWMCYPBs5vYnlsHL3SF25VjPBW7QsddatiyB55NCmaE2w0u9Y2DB5cYhl9iXBFeB4WwDKvXUe0ype3QsIkiM+gNBU4OaqElQN1/SHflP/TgdTJYaEU+TshLn3LiGR/ECpSOWuD8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdU+Mqxq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so2247445e9.3;
        Wed, 26 Feb 2025 15:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740611693; x=1741216493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqdtSuzGM4WDVcC/MyS8JSBVotz4SrdZ4uESSjxA+UI=;
        b=DdU+MqxqGYrjMzFLLHTukANdsGaeqBnJqZNPIurgIgOYgFpSqBB0qKtAriX0woYVaK
         GNgTK/VCRS9PVx+GZvOHlUCNzlmzsOL+KY5sdnBDgIGZE5aEYiY6GfF5DSAI1QbP+N69
         b7pYYK0PDvQm7FquNyScHVJemZplRXDLUuHCWYitw0ymt0hikagVgMqaRvhoyISx7K8L
         4AVh85KjQzwDYRV+94IoTgHCirA0BIX+AnBZYZkrRFgxbYZxIO+Blcn0ZrixHKpRKD8N
         hLsrNs/NuoY4SyM6w6hlejkoWUtr12tX3KLHhdIuBT6m5YLSTkt0xSWx+mfxsYutgCaM
         fNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740611693; x=1741216493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqdtSuzGM4WDVcC/MyS8JSBVotz4SrdZ4uESSjxA+UI=;
        b=iie39MqUDJF3j0PWfGlGcrewyKDLYTGFvjYUC9DMXAGbXlzCmIgrsaiJTfvbDvxubP
         IyRGmjCEqgS+H8g79PlVmUtSEUPVSkQDfNeiTDRSfZVokPWF5W8yc7I8Vvqn2XMHd+1F
         QXTow+cUkoa1C1k6qf8KjdFFQi0PXbW85Ld19B8x+kEnHSiyA0WL0kHjcbIqD1dNHfJz
         OzZaTtbTEAhd9IvlGReUCo1LkKPZYPv78mUxUmvlJSQwBlVPkPOGnwJhpsOUlizbOlrK
         5FX7x+ykYGQZR0bHlsuG67oXJTMApG6g0hRBBiHK471ZXIxHSKjWk9K29o30+C3ibY2u
         Ooag==
X-Forwarded-Encrypted: i=1; AJvYcCU9jkdzUfVNLxYwE+AyoQC/DnFSoU9KXk6GfRiaQScTzCTsG2kSqe+XWuADlBhvJl3ev8kvSx9QZjM8jv11Gg==@vger.kernel.org, AJvYcCUjmyAvK9+o9Cvu6EM8UKe7IsEI5DdRI1ZR5QY4PBoFXv7eddoQtPuXo84dxRklZovj4m+Fd886PRhPfTdG@vger.kernel.org, AJvYcCXJEEiAt+W5K5W3mC9rwZr+t4NLyNqg2NkwxQBwyY2f7Y+KvdA2NafuaPHBvswFo0bFDVKD5RnoL00u@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ6MNJXRhcWVeZgn2k5DRfaDvLuBjHcex6qb88L7+qGE3HQLe4
	Uj5/5wqlPoeQOlF4OWwzR7f6U5aJRffVzYro/g7ccQ2A4lRt/BY=
X-Gm-Gg: ASbGncsdMuWESKNbXWyw9gj70YqPN4Krw8xCmXdklBS3vWToxmkD+RS4Bmb+XWlaK+g
	aJPKxDnqCHB6KAaJ/vpzJRRpQiG9mbt4aSBzYwpAbopI9jnYFISe+AUoKmesT7atk/GoykICMpf
	ZfgCwhHNrAh1FaEZrxO6Gtg+qqFZhV1LzX1a4xDTmvC8z2NSqKvQ9STKK+vsMy14cO7ofoT3O1F
	kMBhgnFD6PW25kxgakOycVCbcQXnY0gK+KPb/LteHB0YQ8N3yW5RfAiYK4zCsRkKO914KnK9OBb
	PdH3LF9W/WQsqEENmKORByFk8si1YWh2dTX5oYmuJPqktwWlwtte7YaoDYNaNJFQJWiqRwBi3w=
	=
X-Google-Smtp-Source: AGHT+IHdSrUHl+uwg3LZk01jygX1eUE/puOuw/dMqIUw2cqzOhq0TnjTqwSY94Ra8xhLqYMLXPnkXA==
X-Received: by 2002:a05:600c:190b:b0:439:5747:7f2d with SMTP id 5b1f17b1804b1-439ae21cdeemr166982545e9.21.1740611692444;
        Wed, 26 Feb 2025 15:14:52 -0800 (PST)
Received: from alex-XPS-13-9345.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm238134f8f.5.2025.02.26.15.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:14:52 -0800 (PST)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 1/4] arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable external DP support
Date: Thu, 27 Feb 2025 00:12:09 +0100
Message-ID: <20250226231436.16138-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250226231436.16138-1-alex.vinarskis@gmail.com>
References: <20250226231436.16138-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Particular laptops comes with two USB Type-C ports, both supporting DP
alt mode. Enable output on both of them. Explicitly list supported
frequencies including HBR3/8.1Gbps for all external DisplayPort(s).

Due to support missing in the USB/DisplayPort combo PHY driver,
the external DisplayPort is limited to 2 lanes.

Derived from:
arm64: dts: qcom: x1e80100-t14s: Add external DP support

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 86e87f03b0ec..124051334be0 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -770,6 +770,24 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
-- 
2.45.2


