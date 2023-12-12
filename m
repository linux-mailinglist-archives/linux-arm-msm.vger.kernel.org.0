Return-Path: <linux-arm-msm+bounces-4344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F2580E57E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 09:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7130281935
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 08:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4CE182DB;
	Tue, 12 Dec 2023 08:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MqppB9n0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB51E11D
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 00:08:27 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3332efd75c9so4834011f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 00:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702368505; x=1702973305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjsUBVi5G85rjw5NZnVt5dU+RrCBs8LjzvSepIHmMNg=;
        b=MqppB9n0qOSb5krshvxyVlyFqO3hqqBC8bgXaBksGW6e7fkFIdruSgAN+hevdAqdao
         P5eQnYUBeU0FUtJVWUAbW228hEgu0N3VDynpfyYOsacPbQeaatigY26B4TIsPSoHxyl3
         gIJOh0YJtgF+irQ9GhB+kBdBytPlF2iqG4jWiMqY52V1AUoUYtiLqWwPrAxhkroxPNQL
         /VzJQq4CpGyk9nv33tCgtbjQC7H5Bg3joW/sqgHwDq7MHn+EHZVgJcxgGagK8yu40C4B
         0JRCDrFpXg1sIjHOzeHua51yluxtU+BXsFdcV9f0HNsgAgwm79qrxjPhfbAmle/VE1V5
         8Z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702368505; x=1702973305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjsUBVi5G85rjw5NZnVt5dU+RrCBs8LjzvSepIHmMNg=;
        b=VLQrq9/NdYMhbs8QUwOGc5R3wZlGkUhOyGDz+dRqpvKNd0XPmJHTzm16GHN00Tbu2+
         CYk0WlkWxlUV6E/AUyjcfmngVWWr4EibsIr0SxBjR378csyLbyvFwVbgyZIJreYTeZlF
         RevQ63F522xrbO41V3WueLpsaY4ZeXoZvnTHM7IkLq5UUQK42Y2Wzfm978vYGHNLkRHT
         Avb/n945Ji7BytP4dcR/r4RmD7rNjs0ltvVcfJgJ6DxyKtl+QwC1zsZAASZyPxuqddx/
         6cM3Nfcb4BLyPGaz1CC4Od9JZUIP3MQopm4dfB4SvMXUMDf8Z6zCBZidIOeUCNTYEjUV
         CW1Q==
X-Gm-Message-State: AOJu0Yyjw5BifKmTISBixVjjHVYnKD0FmG2Vx2iQBxxOorLLTZyU0NEN
	KcMNyzVrHD2lGtlCxL3xW4WDGA==
X-Google-Smtp-Source: AGHT+IFfkyqKnzf9B3uP20udjSsmX09jF+/627Q+ZztERDXFFvY7vVxZCsWpO5slEmEBeeU9gP2qxw==
X-Received: by 2002:a05:600c:6022:b0:40c:25c0:4927 with SMTP id az34-20020a05600c602200b0040c25c04927mr1539927wmb.302.1702368505751;
        Tue, 12 Dec 2023 00:08:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c500a00b004094e565e71sm15609355wmr.23.2023.12.12.00.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 00:08:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 12 Dec 2023 09:08:19 +0100
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,sm8250: document SM8650 sound
 card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231212-topic-sm8650-upstream-snd-card-v1-1-fbfc38471204@linaro.org>
References: <20231212-topic-sm8650-upstream-snd-card-v1-0-fbfc38471204@linaro.org>
In-Reply-To: <20231212-topic-sm8650-upstream-snd-card-v1-0-fbfc38471204@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=801;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=YWJTETWYjknlxDQZ6R477l//xiaIfg4p6od8XS8m8RM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBleBT2yc6YoUAH2Yn6SHJC6hShZxUVx5XttQcfq+LS
 p6KqGJGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXgU9gAKCRB33NvayMhJ0cPdD/
 9ltn3cS4Ik/pOu00+WF+DCyWydbN4iIb8DYdAlHZT9eAx5hnUrzYTLWC6SzJXDu2WpTmm3HbmneVm5
 rGH33RRDcwJUluu0waPT5w9o7mjdhpSe+98t/oBKomnI67GmknXEbCJIkYbPxFEDqyeuy9+1SNbUJt
 ZeGvzitvxcekKYQNpiNUaHKbo8qx1NdPccOTg2QNqhy54wme7hNOLMYSPBYXevWBWaozpIp4dBTOf/
 IeuUSfxx5VIYV3xEWGkA5sF8OxdMdkpSAU4MBhOE/hJ28RtpdKb6sPpAhzrU/HX0VXTjQ8j1fbZVhI
 hOQe+kptCO5LRV2vCQTf5+Opqx8XuiuzVNigJe5/IM+VEhE58PSHYKS+YfdmiCCstIa20LeufBLuJ6
 vGBYQOz7CjqiyyPe4fyxUtD9DEpetrN3JmEp2RsVBMIP5KJv8L9psxsZZEJi/2FOGgLG9N96Lf+H/j
 +ejPqjoJ33jHC82iaSO+02S5vmRvm5oabY+DWSbcQe3KSCUyyBboV1sN/XID06WKefep+ElXWmdl/G
 YjmwHyhDoAYicKK9DThir62fXIoWsqFdlN5yzTVOv8KVsCHtqb1IEv7VjkDtjjtQhBdwO2Sgf4TzLu
 MISS+gzEkgKwCcYQi3KYk5PRbASLI3KrKj5lSqmDPqSULGYBPMHLXm87twAQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add sound card for SM8650, which as of now looks fully compatible with
SM8450.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index ec641fa2cd4b..ce6b1242b06b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -24,6 +24,7 @@ properties:
       - items:
           - enum:
               - qcom,sm8550-sndcard
+              - qcom,sm8650-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
           - qcom,apq8016-sbc-sndcard

-- 
2.34.1


