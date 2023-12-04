Return-Path: <linux-arm-msm+bounces-3202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AE1802F7A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 11:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FE88B20A23
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 10:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA421EB39;
	Mon,  4 Dec 2023 10:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FG22JHgT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00FC4102
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 02:01:25 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a06e59384b6so583812866b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 02:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701684084; x=1702288884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gcpWgbYxTJM4cDAhuGusGlvYgR0Ejalgkc6iMWP0mY=;
        b=FG22JHgTG56LLk+w8LIVub6yVamtIsam+1oKG9ylMA91dBQxWyOq91GuDLokRa+Y6q
         CP0jdSRAeIl6ONcbmjuS4J5kacFHrBeujbjMOO7SATzv4Loi6YDwoEQU0YW7W43OSPi+
         Hm+B2jni6kzHJMpW4y7vHY6fN4Qm5Yj2uBxt5GT/eHRQXeSwfHBBfvDrn1hX0naFWcJX
         Ql9gbjHMJHpli3z7v8vK25iJKKTalkCEs/Ibkw6eWkoQHdABwXaaM7N6Zg8M5TVw678b
         wyrafC12qtAvZNiXAmn90MUUo/TC8Vp2dXjOydaanwIiWieAMW2hTz0MfGu3nEdb0CHw
         djRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701684084; x=1702288884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5gcpWgbYxTJM4cDAhuGusGlvYgR0Ejalgkc6iMWP0mY=;
        b=odhsI1rbr9jZ+CVUuj0AMM6dNGNOSdLQiIVcewiQtL8Bz2Jug+Ay9STNmCY48sjLXd
         BTWo/atE+/a+8c7/pb2YSMP8iOIR4be8q7PJGcDFHWpiC2gXanu5V39WBKkTtrhi0jBf
         PGqzH7cBSZvsLIVHMT0QZU5fSuxDHOWaC5tWPvYk+ZTT2hROB0YdC6HRsr5MScRIs1yK
         cLWP8IXsvLhjtJlB8ZxNF+ICj+xM91Cxd/x5DeKXxk9gUnixcJN7nNScJDSKxqnfT1pW
         Zzi6sNjjrjUw56sUYvcXU/DJfE9YmAzZ/kNauuAnuHWuKP8lTOq+L/sd2xhN8/zgt1zW
         a7MQ==
X-Gm-Message-State: AOJu0Ywa6/kGlTXyaiHyX2iddpiQRx2jUXqmYfVCxTlZ6etGkdY6tmQZ
	AqOGmVSDWa9c4YfHFON12sX61g==
X-Google-Smtp-Source: AGHT+IGIU3jORR6B0x3FGVJgT+5hu64J0FQmCPUvyJ3aNFTkxr8CSXX7InvfFNXJYlFuqoPmGBKcKQ==
X-Received: by 2002:a17:906:3f57:b0:a1b:7313:504f with SMTP id f23-20020a1709063f5700b00a1b7313504fmr701721ejj.101.1701684084486;
        Mon, 04 Dec 2023 02:01:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id pj21-20020a170906d79500b00a188fe9563esm5065572ejb.131.2023.12.04.02.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 02:01:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ASoC: dt-bindings: qcom,sm8250: Add X1E80100 sound card
Date: Mon,  4 Dec 2023 11:01:16 +0100
Message-Id: <20231204100116.211898-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204100116.211898-1-krzysztof.kozlowski@linaro.org>
References: <20231204100116.211898-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document bindings for the Qualcomm X1E80100 SoC sound card.  The
bindings are the same as for other newer Qualcomm ADSP sound cards, thus
keep them in existing qcom,sm8250.yaml file, even though Linux driver is
separate.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index ec641fa2cd4b..4673fdffe312 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -34,6 +34,7 @@ properties:
           - qcom,sdm845-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
+          - qcom,x1e80100-sndcard
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-- 
2.34.1


