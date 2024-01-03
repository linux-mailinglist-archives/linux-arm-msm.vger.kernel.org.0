Return-Path: <linux-arm-msm+bounces-6396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6AF823641
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 21:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F48CB22CD9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 20:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3FA01D540;
	Wed,  3 Jan 2024 20:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dOm3VXUt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B64B1D526
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jan 2024 20:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40d5f402571so75608445e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jan 2024 12:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704312950; x=1704917750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kA0goKiU/w/eOBM3jnw0mpxXWTxX87LBykvS1BaWQpQ=;
        b=dOm3VXUt/EeoIsMTvSAnDt/XmoLhalSCRx8G014/9eMD2CtkoIgCpNibv09ZWATFMU
         Vg/2jRcWgIc8+ZslYud81p0OpfjW7YA1T2dKtQPAhPgu5UtMan1ABaLRZU9q6+w3M9OU
         70wyWjgOrt54Cih4a1LGIj+/7Lyvely+s+HRQpnWR31KnpypX6c8gg6qdnytLcRI4hqa
         5VzAjrEyaKqsWIMJnRnUKMXUQ7A0HigCEtoGJn6yiEfcTYx7HVidtuvpkw8huyMpUKvn
         uxsTHyD86Fkt2Nxlw2APJy9zW+FByCYfMGWgVbzlyyTIU3DRWf62hN2Pj/4MTLUN8ex8
         2pLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704312950; x=1704917750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kA0goKiU/w/eOBM3jnw0mpxXWTxX87LBykvS1BaWQpQ=;
        b=KOwhqliJPlqrzhKpR1Aphsmo7sAZXXmANeBfSRI1V1iylhSglt1WnsycERUVRLvbwQ
         UIWmCUTrt/9nMMS8Gl4HrNWhE+7IMeaYASwueu+3ptFwc+cbBx8i9qs+lEd7SHwEM1yo
         vLkargiWi0RTJUHN8FzJx72akeSOsDsBOVe/zAj3o7PsYGYSS7Gf7dYU5f9qXbO3spNY
         FTi2TVwWLdpNHxWXia6pFahE8g2+sjA5ehJ54z3Vrgx9raG4LN79SjAeV21izTGqXkS9
         DmsKwN8Od0B6kCWf26CHCVei4DXspisEko+5/LFvO3tHhKlAhU6ihIqMZ96v9yUXLeMw
         NtqQ==
X-Gm-Message-State: AOJu0YypVvp2vDjwq4gZOald56WzIYictUWPyCMJd/yvx77CZfWlewwf
	wLvVPR1AL/IushJq8XlFiGA5R8LhXiFY8g==
X-Google-Smtp-Source: AGHT+IG4C77xT/Mm6jNN5jpYils2zCkudK+B5GjU9oJeIhDRBtCpW291etSan+mLgVzx4z+hpzglnQ==
X-Received: by 2002:a05:600c:3d8c:b0:40d:83c4:ff34 with SMTP id bi12-20020a05600c3d8c00b0040d83c4ff34mr3624896wmb.133.1704312950359;
        Wed, 03 Jan 2024 12:15:50 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id fg9-20020a056402548900b00552691fc7f9sm17549670edb.66.2024.01.03.12.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 12:15:50 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 03 Jan 2024 21:15:31 +0100
Subject: [PATCH v3 1/9] dt-bindings: usb: qcom,dwc3: Fix SDM660 clock
 description
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v3-1-a66e698932e3@linaro.org>
References: <20230721-topic-rpm_clk_cleanup-v3-0-a66e698932e3@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v3-0-a66e698932e3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704312946; l=1330;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=2zYtbmnPKi8lLyIi803aWMWnlOZwvsMRdhGUfkJMl0w=;
 b=Ouo9OU8f7I6J1dCDUCpa1GERSaWBKioAqR3dCOfE7I3avHasuEWB2EY+44edvTFHYUr61p+bf
 EGvqd07Mxp1DSnrryk+PoSgSVMrzaWXPbXLwU2u4YWIZciYElrAoae4
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

SDM660 was abusingly referencing one of the internal bus clocks, that
were recently dropped from Linux (because the original implementation
did not make much sense), circumventing the interconnect framework.

Drop it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 473c4bfaf8a2..967cc6db56fa 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -291,8 +291,8 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 5
-          maxItems: 6
+          minItems: 4
+          maxItems: 5
         clock-names:
           oneOf:
             - items:
@@ -301,13 +301,11 @@ allOf:
                 - const: iface
                 - const: sleep
                 - const: mock_utmi
-                - const: bus
             - items:
                 - const: cfg_noc
                 - const: core
                 - const: sleep
                 - const: mock_utmi
-                - const: bus
 
   - if:
       properties:

-- 
2.43.0


