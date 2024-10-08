Return-Path: <linux-arm-msm+bounces-33594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 081AF9954F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 18:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B37E81F2551F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 16:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194A51E1A25;
	Tue,  8 Oct 2024 16:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSzVkWTQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7331E1325;
	Tue,  8 Oct 2024 16:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728406327; cv=none; b=dUtu0ymt/yQ+wJVnrxDmIr7Tc1Dqh2STkWKma2QtUhBD2l3WMsmcwQP8rduarYNHEpwWxGMJYZGEtsrPWn1GGrpOAG+EnsDGu6PygHDuFmdLcLYSt71j0iQQXjEaTSB8ubKAuE7IANY3Kid6gpPmYLj7DZ7PywZwhM0Fn00gC8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728406327; c=relaxed/simple;
	bh=MNFja6W380cwQsBchet1ML0lpqm/tvbaxl8U848Ww/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TTG3Er3Jf0vtYdvIu+ewhDqjNDhKb5bCK2e0tjEbQjnAaROaZcm5+VqGvNE+BJABl7aNGK0AU9iAF1YXds3xlLKAozXwRxteVm9XeY7JPUwDabcEuFEaHLthrq3YA5nr6ValzbDy1vI4T6Eat8sfRGZp0CZ1kPvZXN2whyvhuDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSzVkWTQ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5398fb1a871so5824051e87.3;
        Tue, 08 Oct 2024 09:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728406324; x=1729011124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAB8XHmiE8ZYuOnqpUEx7UlvnEeWEHhpQdnsw/C+4Og=;
        b=aSzVkWTQn/DvamuARLeRmRyuqRkkLWHqODpRnUURG6lanOngROnMccve7gdiYKFDHO
         X7kv0hgli9RdCcXihcXA8UgdMsatl7rw/nxUCswt2oUb1XtMvllawrxFfD+XGlz5u1Tw
         7lrtC25E+rzBfRfUB1C3p85301Dp+bX5N7dZ14b0wIdMtXmucvEjBH6X7+w8MrUZbx+7
         a+eMMZqdqpDmMBNLHQyHDbwxKjPgCd7h9TvH6ZCKFqeJhRZ1UdG6o/BUNvGECmzPdObt
         5q0OPpozdkbFFI9StSsMqEGdMsP501WpK2FzKOUX87P6HivAAzoppcaW4vZo27yZ4j1C
         fnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728406324; x=1729011124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAB8XHmiE8ZYuOnqpUEx7UlvnEeWEHhpQdnsw/C+4Og=;
        b=EbXFwL5PDPXoTjFNgIi4Hfr6/ssQLpFYQVCxUexv4ourLv7hVDQnfZ/cKBKS7Qleqz
         QnVgf0b88MKufUGVPubmjPe5A94nPEqQ68tc5oWJtewEmf/wQQnAaaCzsmbjl1YZSsyM
         jjfJ7L5rXi1BKwTbjOgGROulftP6z2MpdW/LzwNQDnSZeE4R7ucAxMp7y1N2QarzG55b
         FUJHIUur77h25STDFzhnWxGT66yap2pZjnITZHOOHpBKD3A3NbS11nVEY1qlDXb0r3il
         bHpPaGt1/L/6nhR+YLHocK60X/Zmso/E/70ZgFT1ImBqfpycPJXnKWbvx8UO7F0GsSJG
         42vA==
X-Forwarded-Encrypted: i=1; AJvYcCUmSuDePKHehp+M1BtgtJ63f9rYm5Of4BS4dlNO+BdhGXMW6ACpB60Tdu9QF4+lQAhSHZJE9DX/yrPx@vger.kernel.org, AJvYcCW7qlyQIpbx8fEklNsbSGxI1fBaTEpRztnDlp9vWu7TBJopqnTc+iRqOVk8XU5i/gyAB0m1rZZAFsLA0EyR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3fjRDGYrbmmbAS/g2FpYA8Q422O+VE8/LT92IzlD6HFbfxAWq
	Tu+X6L5JU/IHKeeAYtyqbMFmmmIv2DbQDyUp1idPTw4xYqnF3JMn
X-Google-Smtp-Source: AGHT+IFO7B5nlrMVJbn30TfVdbjC+rnHecA+X/U/u5tldvhXsBZGN0a3xgGAgpg56K3oA1N/zJvDfg==
X-Received: by 2002:a05:6512:318d:b0:52f:cdb0:11c0 with SMTP id 2adb3069b0e04-539ab85883fmr7975944e87.21.1728406323380;
        Tue, 08 Oct 2024 09:52:03 -0700 (PDT)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-75.telecom.by. [46.53.210.75])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-539aff23e5fsm1260736e87.235.2024.10.08.09.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 09:52:02 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 08 Oct 2024 19:51:41 +0300
Subject: [PATCH v6 04/12] arm64: dts: qcom: sdm845-starqltechn: refactor
 node order
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-starqltechn_integration_upstream-v6-4-5445365d3052@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728406308; l=1030;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=MNFja6W380cwQsBchet1ML0lpqm/tvbaxl8U848Ww/4=;
 b=iT0ceDU2eXRU/TmnKwHoN2kmaxtDGGyClXfVICkq9B/OouXtJqnbg4F2rG0sNvUOjf2RLTm3r
 o0i92BDGQYQDHd7ER907wcbQCU8vTDX9BObu0R+7yQwgVJEkTs8NOIF
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v6:
- refactor: no space between tag in commit message.
- refactor: s/starqltechn/sdm845-starqltechn in subject.
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index f3f2b25883d8..8a0d63bd594b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -382,8 +382,8 @@ &ufs_mem_phy {
 };
 
 &sdhc_2 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sdc2_clk_state &sdc2_cmd_state &sdc2_data_state &sd_card_det_n_state>;
+	pinctrl-names = "default";
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&vreg_l21a_2p95>;
 	vqmmc-supply = <&vddpx_2>;

-- 
2.39.2


