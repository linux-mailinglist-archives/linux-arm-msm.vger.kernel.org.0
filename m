Return-Path: <linux-arm-msm+bounces-88299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D06E2D0AD6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 16:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A18133058453
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 15:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8264F289811;
	Fri,  9 Jan 2026 15:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="AbwCjr0q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C1C12D21B
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767971684; cv=none; b=srRjL7rTe4fL5xwwnq7770XMp0aWOQH/Vq06baYTMFRK3xyRkwOhKHhRe34kz5JDEpJa2MM1IN5oJUn2ZzUODbZ8spZcAwNBZ81qApclJAKQvaJHy/FOJmpQMC+f/n6iwHSIeVPB/A9U6j9PueFHj6zB/JmUUcx9LYnH1fMRa+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767971684; c=relaxed/simple;
	bh=3wJw3C/+hh4NQMeHHX68eyDgMfZwVmWs26kYc8+dwvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MWl+oVxG9VdzxFwf6Y3Rt7JhqJbcrJh5wp40KFzj8kHDLiRsbtuuHG6eCBKVqiBpovjezE6c91NeCO4HX38mK7dUaxo3unICyksFi+245xbtZ9A1NyDJ+jPEgdLdGpL+YtRuCHiU3dUQNgxCVWk9WiwB3iypm/lMwBD2BMCIuWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=AbwCjr0q; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-64b921d9e67so7338596a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 07:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1767971681; x=1768576481; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vzsN76gbuzfMHxHnC7MWTahrr4LZDPF4d6JCQ9x6L60=;
        b=AbwCjr0qE8snxBIpfYofa4Vf5XzgmPfMfSiqqfplMSsbzVXkubaCKs1Gow1xFhdHn1
         qZ2kdmySTLVzjssMKSOVEgTS5BcC+Q14DwgHgx6j+6xswuB+vTne5SnAEM8EjaWbh3wi
         Q8j9TWv7p0wL+IHkHo0GuiVKyYCK/lQIsv7Zcp60zKOaAJajL6kMzlHar90CnZN8lAqy
         MqlUrfNUFpA41Z01KLStfxvumdRQMND1FfpIOufv8QpdIq8ZAQNcJwLz8s3MaAu24AFR
         Nwe2IcfqPQUENn0kP6WwXvcj0CZeh2AoOri9lNmIq7aY95Jshfw5jvE17Xb50ljhFGFI
         aIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767971681; x=1768576481;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzsN76gbuzfMHxHnC7MWTahrr4LZDPF4d6JCQ9x6L60=;
        b=JAXxL5j7U82mW6YB/G+5wxR2UiPgYaioNFlmrDk1BRxCgeZn4WEV6g4peELspvN7jJ
         KalpqgqFGbvsOCD70xEhrGyeao9BOydWMYaudLb9gt3EXiFihYexrh+6hz/CAQIMkGVa
         KlUGpZNPEj75Rezb74Sz7mAKtElp1vj9SsXoM3zTCJ8jKdMaJAOCJUDOD2AdhjNtsgZr
         xT6yqc3pdokJFCUhgAUOPlfFHyAXdE3z8hJ2NIw5kLj+VNJChZjYpBZtgzlvkDLgS3rp
         nIa+IEQWhHIPhRdUo4JfLdHydvJ6BuvmqB1YDaDz6ZS6jEIGNhXH7BbXS9KpzlTE8YEm
         3IkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYHJB1aT93q9c6u1sflnsFzw2irNJmPRyaRvhY8ksmo0wJrHihPigEPyrqkaEbpUkwpTGxYSFjOsLy9crm@vger.kernel.org
X-Gm-Message-State: AOJu0YzfGTJdjUMEfsadk8YNSmVDWfpwwb9D4OS8rqFAJctmtPGQxI6k
	Qzo8H3S6P3sXNzo3UP4DfTyatR/V77ukQccUspa05Fq8Uj0s1mWTREzUhUBG8+3xEEg=
X-Gm-Gg: AY/fxX7NYpaQCgygEcDMzL5h+VdcsnGR9wNcf+xdfazvjQBfyTrBQhPkbQAFj0icubY
	s3AhlNitOxBIIxrB+JvHVZUALPw+KeK3Gwieo4OmfLrrTYmUQ2144hgfYm989EeOlHQP4Zw2QsU
	HqF6nV8IoDL+ZQqGR+oFEeCfAkJllR5c2Rr+NanRaitCYZPoUHGXpnCshmXojU92qUe6402uzRR
	c3wv+9pgSbDDevKAKp3k/INiH8xmW5wbzxNSNW62CZktEeMlLZfMoGefRemjOAxyCSNl26sijSy
	TIyNXT4nNv6t1CtqIMR/xomjxrgnMOM0mRb6BYx+XK8mIB8Lzik/BBOYRPsxG2Eg7treWaniI2p
	tRWVv3+090nG9XS4wXIYAAf7ueljavlaIzGgcJehZwItQJYmzYy2hr4tdR1vhuesmaUfinnHzbH
	YPYTY6UnzQuFmSZWkvxVwklmh9dr0rVs6K1WbvahfPIFoqgby+WRF1vF1P94rXX8qZNQCxM/q8Z
	Bk=
X-Google-Smtp-Source: AGHT+IEWXRBm5Yt+mRPm4TDFGhALAHUKOfO9MZDpvsMN2Ad6i/iMOL07Iv/Bnx4RypeMPrSqbNgVFQ==
X-Received: by 2002:a05:6402:35c4:b0:64c:584c:556c with SMTP id 4fb4d7f45d1cf-65097e733c9mr9290437a12.30.1767971681192;
        Fri, 09 Jan 2026 07:14:41 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d4c89sm10100742a12.10.2026.01.09.07.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:14:40 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Jan 2026 16:14:34 +0100
Subject: [PATCH] arm64: dts: qcom: kodiak: Add missing clock votes for
 lpass_tlmm
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-kodiak-lpass-tlmm-clocks-v1-1-746112687772@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAFkbYWkC/y2NQQqDMBBFrxJm3YEoVqlXKS7SZGwHTWIzsQji3
 Rtql+/Df28HocQk0KsdEn1YOIYC1UWBfZnwJGRXGGpdt7rSN5yiYzPhvBgRzLP3aOdoJ8HOmaa
 9ukaTGaHcl0Qjbz/1fTg50XsthXyO8DBCaKP3nHsVaMv4r3QwHMcX4nQeZpsAAAA=
X-Change-ID: 20260109-kodiak-lpass-tlmm-clocks-7da465d40eaf
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, 
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767971680; l=2691;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3wJw3C/+hh4NQMeHHX68eyDgMfZwVmWs26kYc8+dwvw=;
 b=6gzuUyvGJu+bIp9v+03BDrHW7vD+Umn5JYZov1W5Sz3HUmUSaapFRseeqLaQVkty++r4o7Dtq
 8VBN5MFKJosB6zBg+vm9c+6TMN+cN08Gp5qVYhmKRuQL80QCz5Ymvix
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Without the correct clock votes set, we may be hitting a synchronous
external abort error when touching the lpi registers.

  Internal error: synchronous external abort: 0000000096000010 [#1]  SMP
  <...>
  Call trace:
   lpi_gpio_read.isra.0+0x2c/0x58 (P)
   pinmux_enable_setting+0x218/0x300
   pinctrl_commit_state+0xb0/0x280
   pinctrl_select_state+0x28/0x48
   pinctrl_bind_pins+0x1f4/0x2a0
   really_probe+0x64/0x3a8

Add the clocks to fix that.

Platforms with this SoC using AudioReach won't be impacted due to
qcs6490-audioreach.dtsi already setting clocks & clock-names for
q6prmcc. The sc7280-chrome-common.dtsi has also been adjusted to keep
the behavior the same as they also do not use Elite with q6afecc.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
This issue is somewhat of a race condition, with some kernel configs it
cannot (easily) be triggered, with others relatively reliably but it
seems also to be somewhat related to cold boot.

Also I can't pinpoint a good Fixes tag, lpass_tlmm was introduced before
q6afecc got added for this SoC, and that worked fine for those boards it
seems. It's just needed on boards with Elite audio architecture.
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi               | 5 +++++
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 076069f14495..f478c5e1d2d5 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2994,6 +2994,11 @@ lpass_tlmm: pinctrl@33c0000 {
 			compatible = "qcom,sc7280-lpass-lpi-pinctrl";
 			reg = <0 0x033c0000 0x0 0x20000>,
 				<0 0x03550000 0x0 0x10000>;
+
+			clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core", "audio";
+
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&lpass_tlmm 0 0 15>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index 84c6d662b54f..617a39d32488 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -67,6 +67,11 @@ &lpass_hm {
 	status = "okay";
 };
 
+&lpass_tlmm {
+	/delete-property/ clocks;
+	/delete-property/ clock-names;
+};
+
 &lpasscc {
 	status = "okay";
 };

---
base-commit: ef1c7b875741bef0ff37ae8ab8a9aaf407dc141c
change-id: 20260109-kodiak-lpass-tlmm-clocks-7da465d40eaf

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


