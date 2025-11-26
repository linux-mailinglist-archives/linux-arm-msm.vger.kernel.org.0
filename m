Return-Path: <linux-arm-msm+bounces-83349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEBDC87AED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 02:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16C6B3B5D49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 01:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7B727990A;
	Wed, 26 Nov 2025 01:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y3cYb33t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65F32F618B
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764120054; cv=none; b=ExQ0LGPxP9cl/KOweOhZL3nZoBk9Q90Nf63sL/FmAOW8dMfZ5fJbTYugfx/3WG7IHVVTPVpoFt6StuZREvCZrT6gTdwySaO3bx21vwBDm2vpg9rRX6lu5aQREyXFAT1BqOuQ9Kf0NhA41Oh31P3YWwJceEHb4eKn0Hnt7LbnFd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764120054; c=relaxed/simple;
	bh=TJkE6EA9MYc+r4fwPmai5qLeS7Y35N/6xWPs7PUnR8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AmxrqhrlVdqQxB/xtSC7vmRPW9NCLRwX55MvTNOkPlkFwAkKO5FdhdBaNSn98ohVDpAf0sV+TD3lEI+9KhdAzsnhN3v8/rBOp/94861G98FYP+myfWosMi3g0HFwXT3uPgzO53ZTvripjcmfx/UG2cCZfwCV1oFoerTDLZ0dRMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y3cYb33t; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5957befc880so868510e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 17:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764120051; x=1764724851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJ5Gb0YeTDQlClzp6XBRU5i8ryJVwCMEcAaftwXMTfM=;
        b=Y3cYb33trOEeQdH32rdPsy9DKMnvhjF859uLYh0YVSZlX8g4O1vfolYQ/xw8XTXgWO
         DUgo0SbCWKfg35J1JZvltTdfgEFLYNEVqPr2WXAttVwiHVFvvn9veAZ2LddZiRjASoJS
         b78cB9oYjwcHyfE3DnLzLbZ02ufeeQNMuEGG7dJCW2GvsqG676QF8OdyRA/1Iy7GCnye
         jntu8UsHqkTRkg0vjwSCrin9pmD1gxudE12yMQt2TbJA5lg4RpP9PSxY14O2wqFDFrjg
         Ty3jEJ+fOE6cUodCWpDgA+lL1DVPOjN/d4/K+G0c8yG9UapyM9zl08X8iiLakE3v7yP9
         ilSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764120051; x=1764724851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tJ5Gb0YeTDQlClzp6XBRU5i8ryJVwCMEcAaftwXMTfM=;
        b=reXnl81j9Y34pk5Kgyzn6rmZQEWGPaC88fDPkQgyw8vpZWiegihCUYIJKkbVOql0iP
         Z191V1Io13RxwlwdocKPukHhMhD/4aJm51ONguLZhzKeT0OePK/uujXiEDk5eZLXZt+m
         2E7d9e5261bYFpFKzBQ7MQfEyxEO+ahdNp8Ntf+LtEAtpFMocHrrBxDXJxnHnHS8J7xj
         glZ8nZGamjSLfckKgFxnPslfG3i3PCWnjCO5tPINzEun9mA8Iy7H9u6acoaenyFH2YAB
         XGb89T0eg0Ic+KqVBX2nyzSeVuJ6r8fjU+D0LjvH1+d53ywCMpOzNCLsEQMwTUTsozjE
         lztA==
X-Forwarded-Encrypted: i=1; AJvYcCUuCyGk0QIvPFbZplqRVNbV1PH5V5E0Dp7p/FAv0AFBVi3GeRVB3JltLqeWsKRWDYatBO+AwK0GfAqpX+x+@vger.kernel.org
X-Gm-Message-State: AOJu0YwnftaK6YgzFjGsS9RISPK94FzuIrdHRLYqbgNDCQUWOjt8QZYB
	1EXEOsDM8j8SsFAIdoccVlOJK4LOBb+ESPFOpwjVDtKIo2nWSMvB3spo2GVuLTZJTcI=
X-Gm-Gg: ASbGncuMsKXpNqkAjCQf7Howj4mGC+tO0Y8GeBUBKPSlB0JtD/wJ4YMW4Rk40reuhtp
	XTRBAaC2MD1qktXcK40uQUTTzWy/JZL+Jo2YEzVjIyJWFJhzryXPxRqBUJ8a7+NFXBm+XmKVP+/
	hQ8EfcR1dTD6x8f1zxzQqbcF89SiAnzyETlHG8TMfdR0KgpTLH4Z70YtmaNHWbZn0XoS5Ad8gSl
	I5K5FSwIEaxGRjTYtz6dooUlyIDLKiu8nkwKo7644B2h2HIciWjh2WpQAYNOmBmcWWsgi6lGgRa
	oCCaxDTR+9BJE8hvDgE4BQ5ab8oPEo4jUYbG6cIkIijOFXG2zXhJWGugY110qzoWlhY57okJmmp
	1LxNgBKKHD+4YKYUQxHrolUILxaTtCxqvlT2fm8tHfzJyYjjkSHTsd4eg8yKipaTvlxN8Nvin54
	ruo9kQA1qIb/Ztlq1tveQvi3uVwtF5PvxIDeNOL52Sa7DxE2nKAbqIBg==
X-Google-Smtp-Source: AGHT+IHq1ZzXlsHhgLOrWHMejUP1OHfmY6kS2djMQAAlb6XYSQEDvjwrlN1XD6LGBJboIVVUwLH6fg==
X-Received: by 2002:a05:6512:308c:b0:594:51bd:8fe5 with SMTP id 2adb3069b0e04-596a528b537mr3268555e87.2.1764120050869;
        Tue, 25 Nov 2025 17:20:50 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc597bsm5584426e87.69.2025.11.25.17.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 17:20:49 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: qcom: sm8450: Enable UHS-I SDR50 and SDR104 SD card modes
Date: Wed, 26 Nov 2025 03:20:41 +0200
Message-ID: <20251126012043.3764567-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251126012043.3764567-1-vladimir.zapolskiy@linaro.org>
References: <20251126012043.3764567-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reported problem of some non-working UHS-I speed modes on SM8450
originates in commit 0a631a36f724 ("arm64: dts: qcom: Add device tree
for Sony Xperia 1 IV"), and then it was spread to all SM8450 powered
platforms by commit 9d561dc4e5cc ("arm64: dts: qcom: sm8450: disable
SDHCI SDR104/SDR50 on all boards").

The tests show that the rootcause of the problem was related to an
overclocking of SD cards, and it's fixed later on by commit a27ac3806b0a
("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs").

Since then both SDR50 and SDR104 speed modes are working fine on SM8450,
tested on SM8450-HDK:

SDR50 speed mode:

    mmc0: new UHS-I speed SDR50 SDHC card at address 0001
    mmcblk0: mmc0:0001 00000 14.6 GiB
     mmcblk0: p1

    % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
    1024+0 records in
    1024+0 records out
    1073741824 bytes (1.1 GB, 1.0 GiB) copied, 24.6254 s, 43.6 MB/s

SDR104 speed mode:

    mmc0: new UHS-I speed SDR104 SDHC card at address 59b4
    mmcblk0: mmc0:59b4 USDU1 28.3 GiB
     mmcblk0: p1

    % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
    1024+0 records in
    1024+0 records out
    1073741824 bytes (1.1 GB, 1.0 GiB) copied, 12.3266 s, 87.1 MB/s

Remove the restrictions on SD card speed modes from the SM8450 platform
dtsi file and enable UHS-I speed modes.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 23420e692472..fc4b7bc04532 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5404,9 +5404,6 @@ sdhc_2: mmc@8804000 {
 			bus-width = <4>;
 			dma-coherent;
 
-			/* Forbid SDR104/SDR50 - broken hw! */
-			sdhci-caps-mask = <0x3 0x0>;
-
 			status = "disabled";
 
 			sdhc2_opp_table: opp-table {
-- 
2.49.0


