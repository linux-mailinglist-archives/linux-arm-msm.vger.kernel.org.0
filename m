Return-Path: <linux-arm-msm+bounces-40380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F16579E46CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD21A286C02
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 21:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F771F542D;
	Wed,  4 Dec 2024 21:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grLbXG2J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BA61F03D8;
	Wed,  4 Dec 2024 21:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733348117; cv=none; b=XvYioCRES/97A8P/srLIv3Fwv6pAB8uASC1gMCKmeIa4g7h9XGgH9TR7n5f8AU7Aloqs6JLxgWMkHpwHZr37FRQWk+qxBCM5pynd1TYSvilOj7900VUkt05ttYEEVj/eoff4hpNtxCv5GMozjlpyaDrMshqPwuA/oPktJuznqTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733348117; c=relaxed/simple;
	bh=16zBqpIjJcj0/PKT4pKvPKuGnqVpPddOsvoLogicvsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pg1BpZm20TMthxT8W/laooOcWHNLPuRDQn/NWDYL3qiuyxIXu/6jZydxnacxT8szy2LcRYoTRzvMwd6n+8jyQ0DHmx3Q8m3edu3K6XIG+JUYc3jeGs/O2Up0Wg/6rXxNS83Qv6MjK+i3s81iA45+YNDJ5DfJ1JqXTwK2kuDKX74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grLbXG2J; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa549f2fa32so38854966b.0;
        Wed, 04 Dec 2024 13:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733348112; x=1733952912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNmUReYQq8n7K1A1rF3BjshEj9D6wX5MoDVYTGtf+6o=;
        b=grLbXG2Jpq398c1geVUvHdKGcLglJK6w+7aLKmNgeAPU0X2JdqSlVmhYqPXnewgPCP
         4ENr51HxOnOZZzjWBFnYAuky+PGMxMzNYWqcFLK+m6+PA3xpW7cfWnVmkU5KzaqFsSK+
         Tl33NFQ7JAlGsShpw2YVq/XPz214RFs6bUFNpYSHc/mTtsLgANRSyM1CXygEJNGS8SMW
         heBxxFVKU5NPydAZZQQ9mX4YysT2FPJfRGwPZH/NYeQKQ3cNuCqnAOtXNho30X2JgvGY
         zSFtl2VxxRK+rPDpbBH6+5ZKxd7PbOAsOYGCbjqO+Td0vAFmp+d8KyExu24paQLu3omK
         Xcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733348112; x=1733952912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNmUReYQq8n7K1A1rF3BjshEj9D6wX5MoDVYTGtf+6o=;
        b=OSUhN5Y4JAMVXwBqQWe7iYLFEk/XSyaBUl9BLpIB0Wpsa4Vg0WdNFNRZA2MLWiXrGh
         fw6lF8Hrp5cr+ZzXYnsJ0rBoTUNNJH1zs8UmFfsevytYPMm7TtQC6hNmxld/IHDqbFUV
         o3wSHWBHqkzQhZY/e2Vu9Sj4qfDrrM2BGyIf9CmSQ3Me85DXrewxxCxHJcXVelJkX+pV
         Y/GLJwuGCx1ybi0NtFPO4BawgJTmAttlwOkXFmgncjzF0XDiMpsWk8hp+RkoBsQto67x
         HdbIHcwitSzL7laVJZSLFUSWrupMicx6Gn1ZvjOt2OgsRpz17hymISCt/U8BWdr0ZTxL
         gwYA==
X-Forwarded-Encrypted: i=1; AJvYcCUSvBKl2OWZwXBJ1tkO12o4Zkuh8+kVm8sEfGmUSccIL+YlEj0rAeewIUHDUPi2I1g2H2EW1mn7PMJzKF8w@vger.kernel.org, AJvYcCXGWwbEPew1tiUqkYbEEyec0wXOR+35TaXdKAF2XgWi0yDgZkunAlzpwl1tvc5vPeVPFVxNiC9UPj8q@vger.kernel.org, AJvYcCXLqvk6KrXODxEs8um6RwQr1gzrLH0ltW/phWUB+2hrBFbLyFVnMpgVd5kzHNJMr22DcBHLEsOmvo7hgoc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2EOgBTOsfp++bihrbvWtuDqC8Um5m/yI3MIXp2kZBD9zFlOkq
	hzKOSHDZJ0+HjIGgBzK8LVxLrODaB4sMp/FnUurLLXZQCa8/GNkQWg1s9g==
X-Gm-Gg: ASbGncuiI6ZYpir07UExwDWu4ZICMFra8FO/nAZVaqRtva5WPH231qLX0kqHf0f52At
	ucrDUOzqXIqbO/l5+NPoqeJq4r3IdiY93COMXJO5snLpRe7DAFFLDXlvnb1H7neK1JBcjvb5Roa
	vIr4xKgV/el9jj39CpgZi8qv5o65ChH7xVFVGqPmljt02OpttXPcq84XtCIMv88FU/pF5f0PUTT
	xEk5iESV3hcxCE2swPZ4jqUsf4/7QvxQx8+hJ+bIFdXGrik
X-Google-Smtp-Source: AGHT+IGnlu5/3GrnMXqWqbEDOnytPQMasAnVm8x/yB3BcbZiXVWbuyqplOqyE0ScmkaznN8u4H579w==
X-Received: by 2002:a17:906:3183:b0:aa5:9303:1b96 with SMTP id a640c23a62f3a-aa5f7f11565mr661696966b.50.1733348112375;
        Wed, 04 Dec 2024 13:35:12 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa62601b5ddsm4506966b.118.2024.12.04.13.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 13:35:11 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 05 Dec 2024 00:34:52 +0300
Subject: [PATCH v7 05/14] arm64: dts: qcom: sdm845-starqltechn: fix usb
 regulator mistake
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-starqltechn_integration_upstream-v7-5-84f9a3547803@gmail.com>
References: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
In-Reply-To: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733348104; l=1272;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=16zBqpIjJcj0/PKT4pKvPKuGnqVpPddOsvoLogicvsM=;
 b=t7GfP1a8qsllgex+aY3l6FWLBCZ+F1grxDD6uTAGIRQ8q/Fo5BHXVMQYyCA4rUJqQo5iOkuBU
 fa26KYlXWDcA/MdKUCBbZDc0JZuHCNs7/OGVg/MO9heCznZRMQHtnBc
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Usb regulator was wrongly pointed to vreg_l1a_0p875.
However, on starqltechn it's powered from vreg_l5a_0p8.

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v6:
- refactor: no space between tag in commit message.
- refactor: s/starqltechn/sdm845-starqltechn in subject.
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 6fc30fd1262b..f3f2b25883d8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -135,8 +135,6 @@ vdda_pll_cc_ebi23:
 		vdda_sp_sensor:
 		vdda_ufs1_core:
 		vdda_ufs2_core:
-		vdda_usb1_ss_core:
-		vdda_usb2_ss_core:
 		vreg_l1a_0p875: ldo1 {
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
@@ -157,6 +155,7 @@ vreg_l3a_1p0: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vdda_usb1_ss_core:
 		vdd_wcss_cx:
 		vdd_wcss_mx:
 		vdda_wcss_pll:

-- 
2.39.5


