Return-Path: <linux-arm-msm+bounces-10637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5D7851434
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 14:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09C821F22BE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 13:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF283B2AD;
	Mon, 12 Feb 2024 13:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QzL1Yrcw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8633B194
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707743427; cv=none; b=uAIq6v5DBfbPfoO6uIRdFpd+i+sTPfT5Urx+6ZNOAdZQnYGdptLr1/WO2j5P3CSHs+vPlJ7D2Slow16zc3qSDjdJwMxyxLwAF0pGi3VAp6M20/G0221GV049g6GmTzNWezZblTa3Lb+LXB8YAZuMnden8samkIAYdLDFJEQpKkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707743427; c=relaxed/simple;
	bh=OOS7lbYOFBWS9cWYXmiccxamzx9nSjNqu+J04bjACok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CTP1ruYi6jqMmFMaBofEutOnDMKcikGrNBOUqHUfZtyIAqPSEmxtdu3rpukS8qVZOAGYVUCr9JaUMAsaW4Zl97G+heY7a6PAglzPnATGDj65efniYmlHOZe9yb4QV3PBOGSotVUUTSXXrqEJ+oV2fAd6Iwi1FPe+tSgJ8YdJ/vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QzL1Yrcw; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55ff5f6a610so3716262a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 05:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707743424; x=1708348224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IEntnUmUKGyVECFoIVOH3J47fJEuz2/ADzixCid4iQw=;
        b=QzL1YrcwvNnB0+buCZ5j45kgFiPDo8AwfT47auuW3EaFkT4P+osiOKXE+X3xT9EzO/
         V2UEP8FmGgn5eSNzZ18QMF8TR8s47H0uMJq425X7OpfMJnKvrqsTFQ9BxxeiZej3+snf
         lkVj7W+92Ia8YvIHZXzQNiNH9BhgOP31ZyNgfdKc1yCUHN5f/4eAe98ZAvHVFcRMNozx
         J4qbWcEkcaecA2lX+L6lxjnikjFVZS567M18kKLQIKBlMuLZVW17eRbTpVyD0MnSRtXb
         bhxkd4Zgu8KgmnQqxKVyVSE4Y1W/wWGcv0PQCzule+6bNTFQ1mJym6eXLumy1W7+aeW5
         J1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707743424; x=1708348224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEntnUmUKGyVECFoIVOH3J47fJEuz2/ADzixCid4iQw=;
        b=LWzSdLncHjYYz313sHrAKCi2bqXP6lHA6OnKXVrtmBxAJVXEH+SLSblO1zTHGxc1Af
         iPyAwu8eOq6L0u4vLFZeU0D4jKjyzev4Q7ZitZSBi4EOItzzDvJZ2lC2KfQvfmjEMrdI
         AteeQlIPVJfXzgkeSFFYlRv3lDyxt6rF5Ob4/BhWC20oASXiFsR19YynaQ65MuvDdPIr
         mFsJtlttRRggq/qudvtuPrjWXlqxiSqD1XsEKkVodRWseS++1qsz+gpW9jW32APfRQqk
         NcnveOMt+fm1JC4s8WXnNQGaWceFWEz2ic8jAi+mu7cU7TXJkDp4Vt1e9bbuo7lfXi7P
         Cb9w==
X-Gm-Message-State: AOJu0YxnITq585osIC3lCgulNZj39xLPJUStWhy/pocT99yXnmt1Hagt
	ZJFVN0mfChoLlJGRxMxtbuLvznWlDC+91K3OntZu3v1qjxa82Eg2mJLwZsmGNN8=
X-Google-Smtp-Source: AGHT+IHMtZG1xVNXYMfZXJ8coAjFTW1R7mL6BXbztL3soxJqjE6fKCKuAA3JhTttTglvZqU4x5W7Ew==
X-Received: by 2002:a17:906:7f12:b0:a3c:b9b7:8067 with SMTP id d18-20020a1709067f1200b00a3cb9b78067mr1423292ejr.58.1707743424223;
        Mon, 12 Feb 2024 05:10:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURzPBLM3V3pV6Zw67C/ZVKsX8g9TwLnPSvNTaf+U/694OvBmMT/7IVH7YT2czLnc2gkS/XLiUrl8mTJA3KRFbdJdAA5q3Ygu/vs1SLUs2JAXu84TaRGJ1Jg37/XFly3vUtNm1ovQBcvBc11bybT3ruWOhEut/d06SesX6qHjQkPyE9V7qagy4RGzI94IkdHJU8ysZ00Tu5A3tALRtOKwuWsejve6zuUrsd8a8YE57RlrVu9kvq9dC2AAQh/Yjs2fxjlue0p2vyhxIWKKYxEGoG4lrlGy5BdLj7n3fSLCjeJHNWq+Vk0wuwczCinw8gcHFri4BPyiblbDf4fyy/MUGMPSDiYgWM6sf1gWhTP4Q7E26c5TlbLwpblwMemhFxpUN7GJ1qsv/JrI15gnI5y70LiYLcx4MjwtyPtYRG32BVKZSp3BetOgEPalz0v/hfGuf6ThlYOPjBNVPyPql6nc0SUnM5dlcMGOfIStPu/kdeK3kcGphDpf7+od0H3O23KmeqEDFnBYQ1WjDMzXHqbEBu5QnG9SkdTDZos4YdS9hAQRFT87WLiuCNACdDU7YGPA6b2AUYeuo432WAoVs3iuIOFbnAt4sPRnzITrVs/Yz+rSYBT5V3ieyZpJiZSMT/Xgb41El/Rrk1BAUhKieoW+VZa3Hh3X8MC4mvTEmHkyTui3ogeYIpaw8eXa3Fz9/rYh7LGTUxiWEl6VMrT57lDl6HhZXm/gpobcHDSBWxSIcePlI5Rl1jsRPuYgOruEyRZG3tDp6Z7a3tUM/OS9ALILUInqAakWjQYKQm7975jk7boA5MT1hcBWSJlRghvnmvtyfNgdhYZiEKrmB9AFRpIpoWEgiH
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id gz9-20020a170906f2c900b00a3515b35be4sm193052ejb.104.2024.02.12.05.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:10:23 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 12 Feb 2024 14:10:11 +0100
Subject: [PATCH 3/7] arm64: dts: qcom: sm8550: Mark QUPs and GPI
 dma-coherent
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240210-topic-1v-v1-3-fda0db38e29b@linaro.org>
References: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
In-Reply-To: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
To: James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>, 
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707743413; l=1550;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=OOS7lbYOFBWS9cWYXmiccxamzx9nSjNqu+J04bjACok=;
 b=H1Bcg2rzFfpWZ+ONZTsv+XotMsPZWzH0sPWJa5fy6xS93138s4pZiqOTYI7h7EjM4AclTuj9G
 +Ermko5L4yxCW2wmwFkyuUOJYChewCVx9fjKmkcNEtaHvWwgWA+efNV
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

These peripherals are DMA-coherent on 8550. Mark them as such.

Interestingly enough, the I2C master hubs are not.

Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index b8f1c7f97e48..d696ec6c6850 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -812,6 +812,7 @@ gpi_dma2: dma-controller@800000 {
 			dma-channels = <12>;
 			dma-channel-mask = <0x3e>;
 			iommus = <&apps_smmu 0x436 0>;
+			dma-coherent;
 			status = "disabled";
 		};
 
@@ -823,6 +824,7 @@ qupv3_id_1: geniqup@8c0000 {
 			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
 				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
 			iommus = <&apps_smmu 0x423 0>;
+			dma-coherent;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			status = "disabled";
@@ -1322,6 +1324,7 @@ gpi_dma1: dma-controller@a00000 {
 			dma-channels = <12>;
 			dma-channel-mask = <0x1e>;
 			iommus = <&apps_smmu 0xb6 0>;
+			dma-coherent;
 			status = "disabled";
 		};
 
@@ -1335,6 +1338,7 @@ qupv3_id_0: geniqup@ac0000 {
 			iommus = <&apps_smmu 0xa3 0>;
 			interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>;
 			interconnect-names = "qup-core";
+			dma-coherent;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			status = "disabled";

-- 
2.43.1


