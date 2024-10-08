Return-Path: <linux-arm-msm+bounces-33595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C067B9954FA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 18:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 369252854E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 16:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9151E1C0B;
	Tue,  8 Oct 2024 16:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tf6lRP25"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA441E1A36;
	Tue,  8 Oct 2024 16:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728406329; cv=none; b=SJDO8bRVp5QuQgJEbXFDshtFSdhGzg36u/GSpdjeRfklh+rQmWSF+qKRfcEkNej5ddI04nT9HhkRI74fPUyD3wnQkENmpH1lznMIv9+SZa7SAM+mpHKuoJrYRXrPO7XaFkBaAFtDArjVAdOrGiAEyxXu51Ikb9QI6z/qDNyGSzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728406329; c=relaxed/simple;
	bh=QspNxFKhs3wh9P/eiJFzCac/MvF862oX/Xvib2SoieY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lzWslv7/dIJlxetg4c1S8WyHQ1Q92yog8MFRJPtljULGf7xVQkV6Ufq865VV4NehOu6p9PTwYY7w5DAKL2oPO48dAmbrN1JLoFT/Hzo2IMdTKRax5MVAIyzdyLaJKp/+TIeJSqTb061kSl0I9qhbxWmtL3zmss0LaM3JqDKKaQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tf6lRP25; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so8064658e87.0;
        Tue, 08 Oct 2024 09:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728406326; x=1729011126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgUeOHnXS9kdchOpVvbBkF3RE/puVjbRIilUeIKwUxY=;
        b=Tf6lRP25h5a2c9DRXvCNFzcKZdfA1vwo4XJ9jMwJ/gtYLELMfCpTcFtzLs7sqElOpG
         3EOPGJUcgsdie5+WeJf4XfZFqr6rfC1g2UjzqnabKNkWaHXTeBUNFo1V01Rn1Lj3oWXL
         5QJzeWlRU+ByJB8iXF414HfKb5jZ5ocQexKtlBObhMKjCVWp0P6+kC+6CBr6JZ14Xw8T
         wvKhccEuHz+FZtkWDegrw5vwouUtJ84X3Zl4Q4smVnWEzVKYmOnCjiSzp/IbsUuGu/u4
         7yphlSQmoRQjtzEKXkLMRvWk/XXyzQGZKls3hGDu54SAy7kPTKFTsY8KkZBGJnS+6I15
         x70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728406326; x=1729011126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgUeOHnXS9kdchOpVvbBkF3RE/puVjbRIilUeIKwUxY=;
        b=nzGGvPv6a1Rz7pnbQrVpoSpNzgXvrg2wO+9ncedx9w566WhDDRT7BFl6Ba2l28wsQ9
         FLzM4bDYW9w4CeKd+MFejpjvJmO4lg2i0vGdJl+ysS1coZ7tPQxVidR5eL1ZXyLgpE4x
         qDIN6WZ0z1Yrl14dUBdGiI0t3cmr0WVvDHiLW5+KDJmnwn+QyzsnMY+kV28O2EkJZ3rS
         DtwFiml9QWjqAF6iMyDXa1W8czGgn8CzevLUbUSaqesu96nDb99jel9vwWmIB8aAsfcY
         jOXrSl7iFb+DIOyWMO2/RJojNIfGx3bk7YN/4e6SQBV6jkoN9U7N8K+ba1eQMdKhw501
         g6Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUCxGXtl+zq4Hr9yPbuj9y/3rFBzZtfZGPMnMLr1LAIC4p6bcnCSJ03zIlcb7Wfb5Gqc8LKEc+iKrkJjQ1Q@vger.kernel.org, AJvYcCWdC2Pfo4cQxaUG5dBD0MrcQxm/uh0bpZav6o+KOfCO+tJdgdMcatBWV/d6fNyt/BkVjQaUpgEiIf5m@vger.kernel.org
X-Gm-Message-State: AOJu0YwLjj7093hW92bBPol5z16wfwhCiHmMV93FwujhsAQduyFX01Jb
	6IiBsyzeowB1C5dMhlCYH0suDRwucj8j064kPZVp9YBBz3/5TuaO
X-Google-Smtp-Source: AGHT+IEsWA6+xbZqV9tHKTiBgOZiWaUd9khqrU6dXJusSeH/Ytdwx3/HvXsZlvw3tB1wKkrpcMcxwA==
X-Received: by 2002:a05:6512:138f:b0:535:d4e9:28c1 with SMTP id 2adb3069b0e04-539ab85897amr8045567e87.20.1728406325643;
        Tue, 08 Oct 2024 09:52:05 -0700 (PDT)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-75.telecom.by. [46.53.210.75])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-539aff23e5fsm1260736e87.235.2024.10.08.09.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 09:52:04 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 08 Oct 2024 19:51:42 +0300
Subject: [PATCH v6 05/12] arm64: dts: qcom: sdm845-starqltechn: remove
 excess reserved gpios
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-starqltechn_integration_upstream-v6-5-5445365d3052@gmail.com>
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
In-Reply-To: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728406308; l=1199;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=QspNxFKhs3wh9P/eiJFzCac/MvF862oX/Xvib2SoieY=;
 b=F+/fizlJR7MYMg62pVmNW0cNK3kaAepPGveIsgLA0/oFc2gpZRt0I3JUJaSVtdnwNqbncB0fl
 iDDSGG0EHVxC+y03LYnsvjnRPgUgsPHitZgAhAhGtYck6vnVHjovZW2
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Starqltechn has 2 reserved gpio ranges <27 4>, <85 4>.
<27 4> is spi for eSE(embedded Secure Element).
<85 4> is spi for fingerprint.

Remove excess reserved gpio regions.

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v6:
- refactor: no space between tag in commit message.
- refactor: s/starqltechn/sdm845-starqltechn in subject.
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 8a0d63bd594b..5948b401165c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -418,7 +418,8 @@ &usb_1_qmpphy {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <0 4>, <27 4>, <81 4>, <85 4>;
+	gpio-reserved-ranges = <27 4>, /* SPI (eSE - embedded Secure Element) */
+			       <85 4>; /* SPI (fingerprint reader) */
 
 	sdc2_clk_state: sdc2-clk-state {
 		pins = "sdc2_clk";

-- 
2.39.2


