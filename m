Return-Path: <linux-arm-msm+bounces-76098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAB2BBEFCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 20:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BE82D4F0C1D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 18:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4852DE6F1;
	Mon,  6 Oct 2025 18:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vDDr1mH1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DD827FB05
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 18:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759775851; cv=none; b=RU0/033Wq8Hc/ZfygjUdwcA6DhP3sZlOa10Bn4pgi36dGeaOAw+T42H/3dJxzsHhrOpOuae4K5DOC1ptbDefJwQz/QG0PN36VI+z21mzcqlycBPCu1Dtiyrzjr4rS47nqiSQjaPiWTCdTiASVh+eFgn94xc4dHzwLBlFBBB/nAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759775851; c=relaxed/simple;
	bh=Ab4sB+Gy9bByQ3KMwViBWKs43ahwrX4X82dPExLVPMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RXdERV6QAVGirPx5BE/jdqgPC5qcD7DMe/9eH5nxeYVdcAvit95a81e07v9Ulv/E9OeC/L9AbDMVVS6Po1JL90vSVKe04gMQ+EvZFGnX8b/XaPuu9kZVJqipIK2AP/wk/Vf4Vngw/vLYg4AwUCfDEvZGLoKQR0HdRzC6FDXt2Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vDDr1mH1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so51444755e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 11:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759775848; x=1760380648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsvdBaXnMo9ZV1t6Nz72zBmLT24LbwFczkk6xaDii9c=;
        b=vDDr1mH160NaU5i1wHtn/W4o71xCgILLPTtiGiiETnadwA8Fp0qNKUyY6FSqZB6RXj
         fJX87glsjikyW05LkJtGkRGVUS2JIlI/nSmUCWr/efk+m0NGuBIQjPy6yG55xGM64s0q
         lCxGg3ibXGUHFJ2T7GkR30ySLSPSn3D1SI+LxWf+wgJrtCoVXdpBis71zXFH2HAWdzex
         8YMov7SPUQWOmLtKNDNMIQt6hcM+dszVVWEPNznLdZKEqqIFigDL8ieFmsOl1uY0tZng
         fLhzJ6iDe0maE6cmYRvM8JTzxYV4pOQ0f1/Ymt5XHV9cO4czfS58M4zfcc0CZfhO3ybo
         w2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759775848; x=1760380648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsvdBaXnMo9ZV1t6Nz72zBmLT24LbwFczkk6xaDii9c=;
        b=ChK2mZ/KX8Y+QcIEkFDLfweOBRUysqhM5Ut7QEnFW376gugydWRaP6UN8avwa34qK+
         xuYUF1FDhcA/t9MjAue4tIqDpcc2aqOHgRPP/Xt4+AisixYNTSYXp6Hcv1UjpaibJcQw
         7M5Xl+FVHax7mvWPcq0rKggHfcuar9AjQIAnoZjNgjRUF0aEnQEh+Q1xxA2J59bDxg4P
         OSXX0+ufbGLO3PVO9kJhfIE97aMGV0AeewCplh6s2BG0Hh2jBo0jWGn5HUjKpVcEYfM0
         oC1nNsRMoEobDAFStjUdacpNUbm399M894/u7PWPpH8eH4SgD3VH0Ll3msfJxcjgPYHf
         QFaw==
X-Forwarded-Encrypted: i=1; AJvYcCWtI9G+yGuLIzzuBe4qxdqO3oWnknS8v67HBc+cf94TK40dXg1d7Lp5PSdnvMCir8C5uZi6soiJmMEQAwdm@vger.kernel.org
X-Gm-Message-State: AOJu0YxTYwN3EAJQA9ftfuYtseV81BL6iKu/fV1VCwSFuAT8cZ95mn3B
	2oFoFUIFsHkCRyxoGxSGcAnbLYFATkvknGRDE3It7TVKwPof/CJWOeT04URr3+B+/Xk=
X-Gm-Gg: ASbGncuWAvVJerPyojXyhK2MzcDpclRpuCW1lQDEURc50Q+YPEq2YkIPurpivJhyPMN
	M+LBtExVm9DGIPfG6wmYVo6XbAoGJ8wq8NgipeqMx+P+QDulqgN20ghlzz5ALsY1Atd6gvA4/Hs
	Jiol5cXNrvz8TE3tR+kotlP+1sgNEZ/apv1bVqOTqIEQV9a5BVgcb/A57bWfhpVC7wJIIPspLif
	hr8hyWJATd0wybeuRUHkOOJqlWvRwXihmn0twhqP8TWTMVSu9HrOwJYXu3NPkkRsVmiOLUiXfua
	7sjzvR6GVFGBFYhnRTnh0TQYdcexXkG/8Pgqdr+/ZglZ2gmKcQvhrNMINL74CI0fOGfiti8QmK5
	Vby+HUll0Kzdkel2hgQsoiH1ZLvPojUzx6Wd90Q1Ev/OkIzQyWy5250cvkwx71sux3b4fF0x9ds
	3HMCd2sw==
X-Google-Smtp-Source: AGHT+IE8HtaEmxZKyVDB8Fe6Wo9kldEjY3g8C0S4sDI5wHSp5Y21Sr1sIfnUCeq+V+Crm5qgopPFpQ==
X-Received: by 2002:a05:600c:1389:b0:45d:f83b:96aa with SMTP id 5b1f17b1804b1-46e710fe329mr100728725e9.7.1759775847435;
        Mon, 06 Oct 2025 11:37:27 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a022d8sm254997085e9.12.2025.10.06.11.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 11:37:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 06 Oct 2025 20:37:15 +0200
Subject: [PATCH RFC 2/6] ASoC: dt-bindings: qcom,sm8250: Add clocks
 properties for I2S
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-topic-sm8x50-next-hdk-i2s-v1-2-184b15a87e0a@linaro.org>
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
In-Reply-To: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Ab4sB+Gy9bByQ3KMwViBWKs43ahwrX4X82dPExLVPMs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo5AxiziWYdGMoTESpubxvDryul8gi4WsZdIme2OVK
 mPg8POuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaOQMYgAKCRB33NvayMhJ0V5XD/
 0U+nmQUnhJSG3oRTPxiXV2QGarF9uJWYOrfOdSXphsNhz7y7bQ3eY1qfSiLGnVhl+OJw3y4ouKejZ4
 4uJoQFTFF9Ad5rubdEnEYB364qY2NdpNPh2N+SG/1PBtaDcVcnlQxktoai1Rsusy+D07XZ6vu+7POh
 xHK7kjGgOGwMxUogo/NLEbkj7zzwEBxV/ErNevylowH8t8rKNrEJ89TEkUh173dEiuBIzxd+3/O78O
 xOPNicQ7Y1V3vMmSDLQ/ET889xYD0s4EThQJAAphiK0YdqT4vqa8Jl4HmB8lERKG0Yd+9IQnOTa464
 a3jiJNIQtxF/96xzkuV229ZWohIldS6Hfn7TSTqOR6Yq3O20+V73hywffNJHbbut+FUhPjgwUIyLWF
 yQz1+kos4YKLhnpxN2L09chr/wjdgbqEGt7q18LSwtBKH560yBeO7sTc3XwJ2h+eOODItc3v6Ughaa
 SLcXq2c3NLbE0L0tv5cJGmsEWyosoiM1mRRlUB2/sKKqfvROAgzz3UYUcO2ODy9py7WtXBOqPr73vG
 GmpN24Bfs6pEXhyi3TuoxAuD6Y74q9jwu4OEqzGjw73mWqQmIPnVyR9MlQOMd+woXjqzz4v6XLE+fp
 VooVGucdgqNFcVW9wsycQbZVyzrnIVytFKQlTT/F4q42ne+dFaXWUTbMX4Og==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order to describe the block and master clock of each I2S bus, add
the first 5 I2S busses clock entries.

The names (primary, secondary, tertiarty, quaternary, quinary) uses
the LPASS clock naming which were used for a long time on Qualcomm
LPASS firmware interfaces.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/sound/qcom,sm8250.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 8ac91625dce5ccba5c5f31748c36296b12fac1a6..fd0d7a7ddc7b363a66e1e7bd72c7290666efb511 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -64,6 +64,24 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     description: User visible long sound card name
 
+  clocks:
+    minItems: 2
+    maxItems: 10
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: primary-mi2s    # Primary I2S Bit Clock
+      - const: primary-mclk    # Primary I2S Master Clock
+      - const: secondary-mi2s  # Secondary I2S Bit Clock
+      - const: secondary-mclk  # Secondary I2S Master Clock
+      - const: tertiary-mi2s   # Tertiary I2S Bit Clock
+      - const: tertiary-mclk   # Tertiary I2S Master Clock
+      - const: quaternary-mi2s # Quaternary I2S Bit Clock
+      - const: quaternary-mclk # Quaternary I2S Master Clock
+      - const: quinary-mi2s    # Quinary I2S Bit Clock
+      - const: quinary-mclk    # Quinary I2S Master Clock
+
 patternProperties:
   ".*-dai-link$":
     description:

-- 
2.34.1


