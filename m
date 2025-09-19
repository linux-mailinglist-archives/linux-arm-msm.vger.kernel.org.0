Return-Path: <linux-arm-msm+bounces-74146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7739AB88BAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 12:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39A24586828
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 10:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A032FC03D;
	Fri, 19 Sep 2025 09:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PhZx8bOw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FE52F619F
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 09:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275965; cv=none; b=NqyO/xHPTqYTrDMzS+APWh4lUhQGQSMNVF5Ps6H8l3rYQOb5JCKRCiVZ0cznZ2AuU4cFrbE6YtoZc07lL0RuD0J5qzToF48Vnrh5FaUeq+F+47CjA7Kv7gL4Hxwk+5WrPYgyT6d+SgMEGE5JJQWAaWfRsMcrHne6b2vRoC5qVPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275965; c=relaxed/simple;
	bh=OUZ9IG+km58rNt7HS8env5yNHx5mMi+2MbMDqULuRsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JPmic4uU4qRWxt4e+s0LngIu+b1VjOLonmnEJUZkKhAyz0HkZ7CsM6D1XCT/RZxN2FyIj+Y8Lwpl+UK0OL+B13likJlZ8PL1GQdKGADgILT2D+Q2NPlhdJKuU1jdI5ch0cLL8anYxUVg8Zms8IgCKgjORF7KCi08we2G0n2e1Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PhZx8bOw; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b07c081660aso334016266b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 02:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758275960; x=1758880760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1GNGqseHGUM5oQ3biZBBX1kDZS/D/utgJSKJ0QYFic=;
        b=PhZx8bOwCbj6uddXoMcvj3L5E9ivOMXdCociE+4ZaUcQIxjiB6ShaPqd7UhCxAMZLG
         h1Ae4wUT1NVZaH2CCTVprf+Rd1JQdhG8IHQHFGulfujv6Ibhu6NQz4l48au739btb5fe
         v4PgEFcHDz0BODr48ozEEQ1pnexH5s31yUaUlSXAEyhqnnhrRKIUUHUGS9lWxKlq0bFM
         5WhWIW1D4ge0K0h/zUvgXQ3hM29eRGiO3W+jEEGbiAfBYD8mwQWsi5hW/Q9JNoirdGIZ
         eOXJz/DqcyW+290sGKiUKalS70kK1vAw83gV9Ccn0w8ElHy/EyNbZtMjH49lQcKoIhpQ
         YPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758275960; x=1758880760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1GNGqseHGUM5oQ3biZBBX1kDZS/D/utgJSKJ0QYFic=;
        b=QfPw/dTJ9j3ykGUgcL5mgcGqj+p9wSXozYuhWoVfDsg6q4I4A6NQSa2gQVJ7jIbNBK
         H/VLxdLNxl6V79DrCocBoNcVbLnBzE5Fs5C6uV1BFTeNMJm7lTYRu6wqOvRNdBqyZE2U
         BqC3jCsnv+cC2mFEm2UrEcxDTIx8C9Hq6R6NMEvHDFtiJ+t46j3kJ+pMYQEfm18BeV6d
         gg+C5M9F4ZYMWGFaO+YvAyy4u15IwgO4NYL+eHIU8fq3W+N8KaN3cL71cTEXt4zIRHwC
         A8SP6I+PO2WlZ+P46qtGfHNTdk/kRCcXU2GARcmYlyQVfEt86Bsx5Yhyr3UdxFwBE+64
         wFsg==
X-Forwarded-Encrypted: i=1; AJvYcCXp73C76+3XiwInRgqGCyl8XLzOzy8WkuLtqmzadzVkmncFQMCRN/PvmpeEXpwybOS0rRjfw5b1G7qD5JYA@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx2vUuM/31YUKikNnQMOI4EsiKtaoguS/C1R8BrpPOIc6AUE8c
	129SG4y7mKwjPXaienjop5vjcSCPmc4Aw5TXHLi9UlkZg7ukp32hGlcIVyDsl7DWHG8=
X-Gm-Gg: ASbGncsBWUN4OqyIj9iFumTKnsDSM3JGnx9nfUU6f4f5bg9cF7KWxTVmphgEQQyv/p/
	mVj/42CTQP9VoPp4DyYKUnQmNcBPSB7sQdq8de37HI03h66KKyMbhIiPwINE6/1g8gffM/hl5WR
	Os2dfw2U2+T/RszkKrIgCWvRpi9iB2ZbjCqFGgEWqs47K8HeoQyTa1a0NqPE+FSZoBqkv4DCJoC
	dbTG0U3alb9sHWpnQ4q5lH1d0xWBxze5cxjVwmcUTvf/LSUn5PEuniVrcPvbNwrgakq3AOfi4sH
	xITT+yqboMk0vu5rbUb7+iIXGeVbPOVIh9jRRKPKZP5yVvI+YZwODvvrhipMycw82ZXfeOGW+ZK
	ndVlAewNVu0wVDUQBrxn77QgHMf1QHJfMu3Q92hi9bdgiNJxgBRwsEXGOkG81OSoLox0xzQ==
X-Google-Smtp-Source: AGHT+IFHKKTi2KqgiASniTO0Gp9RLI9E4W0L4odjaW1XLQBKa1rfopUp5lUHyoEfK2xYfnHx3ihkQQ==
X-Received: by 2002:a17:907:7204:b0:b23:74d:b0cd with SMTP id a640c23a62f3a-b24ed887037mr267162266b.3.1758275960218;
        Fri, 19 Sep 2025 02:59:20 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa6f03008sm2972107a12.7.2025.09.19.02.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:59:19 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Sep 2025 11:57:25 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sm6350: Add MDSS_CORE reset to mdss
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-sm6350-mdss-reset-v1-3-48dcac917c73@fairphone.com>
References: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
In-Reply-To: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758275958; l=960;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=OUZ9IG+km58rNt7HS8env5yNHx5mMi+2MbMDqULuRsY=;
 b=itCMelDsenKT4NC/qIf87Yi9X7uzziQSnVu68bi4iCRJjxZ8ytLv2YOjIJ4rlkqTKGrcilOBW
 i3XJ6jjiISxDxjw32haNv0RDzcg5kyGbOW4ys9WXSkcGiROIp7JJNDb
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Like on other platforms, if the OS does not support recovering the state
left by the bootloader it needs access to MDSS_CORE, so that it can
clear the MDSS configuration. Add a reference to the relevant reset.

This also fixes display init on Linux v6.17.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index ff1eb2c53e7b865350d00ffbfa82d7d1e3cc5aa0..929c8a8b2d446505228531bfc55f3350ef2980b7 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2150,6 +2150,8 @@ &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
 			power-domains = <&dispcc MDSS_GDSC>;
 			iommus = <&apps_smmu 0x800 0x2>;
 
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;

-- 
2.51.0


