Return-Path: <linux-arm-msm+bounces-83351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2934FC87AEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 02:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 869B4354FAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 01:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4C52F618B;
	Wed, 26 Nov 2025 01:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TpDVx3VM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7D92D7DC7
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764120060; cv=none; b=jg2eNwIYh+625xVUo4RhUybKLOU9GQb2mYwuWVeyAEwEqBeFecAvnsH89o9uO7ZWvK1ZPt86+vKX2g5dIXDS4quVEcsizN7zZKdVW9yfcSSqLGbCvNDmI8l6yGibTV0QMa1jUK+On/C4rECd6tG8+735psD+uoVUPzOmVmmaxNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764120060; c=relaxed/simple;
	bh=MMAVu17Z6lsQGMpkcklYcagR8apwwyhnzuZyO0mETvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A5VwWa2Y20QhE8YsgckBSQM0DlMQwtwI3HMPmwF6s6Az1OApgwd/cI0RG/w4HapMi8ZkWmCERl7542fh/jLkPoblAt0arAVCNXnYNjLAsenmYeEelthrNGFRbgg/Wluy6hxZynsV0wlvQThniyVG351BOzZ42rqUT+JZhUudsOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TpDVx3VM; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5957a623c7fso1241202e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 17:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764120057; x=1764724857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Bjs5y4wIfqgfGmPRW6i3y+Z5BzYgPD3ho1e8bxhkys=;
        b=TpDVx3VMEcyUnE9xufWCGaWZVO5EcVDf7BUfEbPzbWPyJLUav09I9LmL6vsN62DWbQ
         4GfugjrkkYrhszlyFf2iksqqettjgSCsiMcnWZybBKe2U0ZEQ4GmmWihlWm5234ckED7
         7SMsI32Eo2H/XS2pOEwtfV8IENRRuOexhoYvT0E7XbOkk+P3jEwGTVlSdrF44cCBbWZv
         RLA2ao7JM01mctwRsCOs3zo707XrU7128ucWziK0vkikFJAHKbhEtp5vK7e9eGcYBbPm
         6Yig2oETYFqjkr0BY5G155RvH9Q9TeTiuh0/r0G0dCoQjESismJPSf8liyePuUbfeMFB
         9ZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764120057; x=1764724857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Bjs5y4wIfqgfGmPRW6i3y+Z5BzYgPD3ho1e8bxhkys=;
        b=dv19N1SHP3aBzHslpwo/5q4ercTaUXP8XN4vCbz2Gy0eqdXzdfvjFbsTF2ZbsrZ9VJ
         sbEGQhhp+3JPPB2thhIfaXQd4K9TdvCNscDG5060p29v90+yiv9OVXtCtA7k+9kApNUr
         XOU3co1wZrjqGATdEkUbEBDzwkE5ZFQsxpyIW4HJcIP6S//pYfSot+51trlvZ+tFj6jJ
         aAV9AAkJzeDcYNmAeN3lafs+6DGf2ZEDLJZ/ooLEJ6xVu9Rv+CDVbGI+y6L5M4uiUEny
         UQbcfx0rjJQ3AZqhyp/GZYXOmUA77DcZOCHcSp6flH3e5i1V40/hVlKEO3CMl1vZBLWI
         7uQg==
X-Forwarded-Encrypted: i=1; AJvYcCUTTr6yzT7q4lHFuvMG8ElrAl/qVvAMTevzHOsb3TSE0YkNlrGuFitq/d9/8NMZBGxA3FATIeLysA9iQWdP@vger.kernel.org
X-Gm-Message-State: AOJu0YyCQnW9sLra3RLTvWronoUTaQ+NdNKiazZrb3keMkQ/NWVtUs83
	6zlx+Jx2TkMZmRkpCR9+pMJtUZA2Q+Hk/FnXA2rlujMdSBAKw2lW9H5VECaVWlO4fbQ=
X-Gm-Gg: ASbGncvWvS7PtgNrkFNyFgVmhR9NNLXCbdePZgRH/H2znkPyNo8252Mx1OcYFcVWW3R
	N8BziKJ6K2MZ/sOhEhRZlypW6rdp6G01N+1L4mPYfKZweqa9PSWcqi7St9K4manMQdAGkuAjt3W
	FqMf+JeXelFKeFLIImw6XrFW11Bw1Gu1zJLt3ijgx/XrZ+/02a6T5Z6gQVIE6V57z0t298e7vpm
	BkryBlVTwGYKjdiZnozpd08FyAKnufrVy3NjkxwZPPE59xvh0PUssyJjoRNQB+BCyAv7nPOAj5q
	TGykLwDqGWh92o/I7W+cdaQ2WgHpdEBFqdOKdmQRLYoffxdlWvSVfJ+lHmLvq4bnIlta4/0rUFV
	5tLFqFVU1AMXtDtqnxoNCY/UzPOb0A1rg/7ZKfM1JsNjFdzq5HQpGKRKEnE4t3cJSD1491DnLwQ
	ksPw/4Oxe6U4RiXd89DBceceDIUi18l1u+2dHDTpv2teVifhdg7UNM7g==
X-Google-Smtp-Source: AGHT+IFM0ViELJ86HUyZ0HgZFAaMaiZVMbKWhPPYEYyIHk2GxgLKlTO9EioZQQxW4Cg+Yn3ZbvmnUw==
X-Received: by 2002:a05:651c:2583:b0:37a:407d:6359 with SMTP id 38308e7fff4ca-37cdc33f096mr23792521fa.1.1764120056892;
        Tue, 25 Nov 2025 17:20:56 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc597bsm5584426e87.69.2025.11.25.17.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 17:20:55 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sm8650: Enable UHS-I SDR50 and SDR104 SD card modes
Date: Wed, 26 Nov 2025 03:20:43 +0200
Message-ID: <20251126012043.3764567-4-vladimir.zapolskiy@linaro.org>
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

The restriction on UHS-I speed modes was added to all SM8650 platforms
by copying it from SM8450 and SM8550 dtsi files, and it was an actually
reproducible problem due to the overclocking of SD cards. Since the latter
issue has been fixed in the SM8650 GCC driver, UHS-I speed modes are
working fine on SM8650 boards, below is the test performed on SM8650-HDK:

SDR50 speed mode:

    mmc0: new UHS-I speed SDR50 SDHC card at address 0001
    mmcblk0: mmc0:0001 00000 14.6 GiB
     mmcblk0: p1

    % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
    1024+0 records in
    1024+0 records out
    1073741824 bytes (1.1 GB, 1.0 GiB) copied, 24.8086 s, 43.3 MB/s

    SDR104 speed mode:

    mmc0: new UHS-I speed SDR104 SDHC card at address 59b4
    mmcblk0: mmc0:59b4 USDU1 28.3 GiB
     mmcblk0: p1

    % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
    1024+0 records in
    1024+0 records out
    1073741824 bytes (1.1 GB, 1.0 GiB) copied, 12.9448 s, 82.9 MB/s

Unset the UHS-I speed mode restrictions from the SM8550 platform dtsi
file, there is no indication that the SDHC controller is broken.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index ebf1971b1bfb..1be709204cae 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4939,9 +4939,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			bus-width = <4>;
 
-			/* Forbid SDR104/SDR50 - broken hw! */
-			sdhci-caps-mask = <0x3 0>;
-
 			qcom,dll-config = <0x0007642c>;
 			qcom,ddr-config = <0x80040868>;
 
-- 
2.49.0


