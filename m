Return-Path: <linux-arm-msm+bounces-4222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCF380C9D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 13:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C0F01C20EFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 12:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B573BB45;
	Mon, 11 Dec 2023 12:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OjRKB1P/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E15C0B4
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 04:31:15 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40c39e936b4so21228585e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 04:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702297874; x=1702902674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcGVygFqpR8Db5zL41FG9Nnjti+dXKsBMHzFUY86aEI=;
        b=OjRKB1P/OCXA1hCX7YrA9h7LtY8YUBZkI2tF/2rnBJBpRro0Lgx0HXSYm7Yy4IxG6V
         JiEQYna24C564wr8/OGuj2N0WiOKzvi7tCR1dZ62SS8UH4Cml9uTLugrYi4DDzzKtofx
         Os6DVPxo7Bj/aQ2JQ3eLvFd2k06b0wR5b+wZYEuWSoVkrSW27ZdRMlBcRvzU9So4yFDq
         i1Y202RbnEdEIo8dM2zWb9MsLYAaah1X54d8dnZjW0ryuyLO5KWrGj6SrhDejeZ9K8m4
         GF4lseUmSNQrQdX8O69smFNHWNb8SGjU9cJuQ6bsdkgIPTDfMuQHXhq8yXasUafIleyA
         1Ziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702297874; x=1702902674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcGVygFqpR8Db5zL41FG9Nnjti+dXKsBMHzFUY86aEI=;
        b=cfqhmj1LkL+vGgpMuzOK/8FJHw1EKbfb/h5fClOOieeXt5iuzPPV3JIwrvQZaTPceK
         mh1SpGWPYQoYoQOpd/2itxaAUaWn3MMlxyQTVLQMDXPYUijB+S+Y0xVfHr85yTSd4QC8
         XARiaVt5lDCJmnIIIQ/MSSMdEU8/2kT27xWXHevMBsQ3rhcTzhVwnDFlwmNONhiocugC
         DHsvWOxb4Xi6tp/Fon4U6HyYb65m31skkX4gPx7ty+giADc3GjMJfHX4/84G8dpOOiCT
         KYlAUKHKJf7b7BmfoGs96hn64P3maafxiQ3dUe9tOK8NBqmfs6EJfSN916XXbClV/SZZ
         DhTw==
X-Gm-Message-State: AOJu0YzbDfoZGQ+ZuGcBLZouvHEmROy5VWpp6A0uj/wcs0xpGQ/wPOBA
	rJ7htHiDqKCU1JGw4lpsUp9tmQ==
X-Google-Smtp-Source: AGHT+IEgRmUvqRfWL2mgGWOrAr42GAbQoTNF3qLYb8HpdTObG+vmkW4PZV39SZlVRZ5xK8rpQ42IqQ==
X-Received: by 2002:a7b:c456:0:b0:40c:2c0e:3196 with SMTP id l22-20020a7bc456000000b0040c2c0e3196mr1221840wmi.19.1702297874408;
        Mon, 11 Dec 2023 04:31:14 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id s5-20020a05600c384500b0040b632f31d2sm12932313wmr.5.2023.12.11.04.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 04:31:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100 LPASS WSA
Date: Mon, 11 Dec 2023 13:31:04 +0100
Message-Id: <20231211123104.72963-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
References: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for Qualcomm X1E80100 SoC Low Power Audio SubSystem (LPASS)
WSA macro codec, which looks like compatible with earlier SM8550.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 5fb39d35c8ec..06b5f7be3608 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -19,7 +19,9 @@ properties:
           - qcom,sm8550-lpass-wsa-macro
           - qcom,sc8280xp-lpass-wsa-macro
       - items:
-          - const: qcom,sm8650-lpass-wsa-macro
+          - enum:
+              - qcom,sm8650-lpass-wsa-macro
+              - qcom,x1e80100-lpass-wsa-macro
           - const: qcom,sm8550-lpass-wsa-macro
 
   reg:
-- 
2.34.1


