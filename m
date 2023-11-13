Return-Path: <linux-arm-msm+bounces-549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8709B7E985E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 09:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 163DEB20AD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 08:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3ED41A5B1;
	Mon, 13 Nov 2023 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qUwO+ta1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE79818629
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 08:56:36 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3904E171B
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 00:56:35 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5409bc907edso6474484a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 00:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1699865793; x=1700470593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHFRmzvU5T3tlzyLJ6u+L9D1svx2JsEEqR5zHg9JW1s=;
        b=qUwO+ta1ElsepjclimtwfnWbQX16Z+Q7FjTwuVNuPDBAhAk1VhXGKqUVy/HgJgBtYw
         90VbKbOA2H3fPTMWutCMGwEoooBYSkz618InRSpGLoRDc7emjltlnMlCzsr8rjIeF5Z0
         PcRCY2m3ssO5/tEbAwHIGQLHobetEqPS110Odj5c1lNdwnoml8bhoBt8O4Lyxc+tCh8K
         7O4FFfts/Nix3cmEhIm0j+lyWu0xkaIwcuJO3kz4Ikadozxi/xePv/MmCh9hmzRlEV3E
         IPnjiJoz51Kqfx+w6UWHUjne2xCzEzixfvJnRDDpte9qQEoqn72LtSMA+RYR7EYWKtrl
         tFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699865793; x=1700470593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHFRmzvU5T3tlzyLJ6u+L9D1svx2JsEEqR5zHg9JW1s=;
        b=A2xQ31gEKTkgScWJCfsoPnv/9lwvWRa15BosXtVTj6FQU2ydd59IvF3/mQyhp3byyE
         M3DNL6WFc5KrXWRkXgY4Z9pXrm4ZZ5YvMEc7+mdZLAOiPoWO2LuSeHFm95DQvKUzA4Bx
         VbQVGr3GaWi7nXFt/GbV95Qg8LIVBGMr2fmfhBW1qBhVI/AFLfWXCZvhnnlemUdv4wmF
         9AofGsPxc9feeGvDd6IUWSSmog9UsCzwtDjiRPjdXZIJ/+h0YtAlenOrch7cmDAD/7BX
         H5xK0i951IzeN+ROze9Xf6rHOTBxxF0WeS2OATSjA+R53Egh7q8Bfo5T+7nye3MD5mSc
         SJvQ==
X-Gm-Message-State: AOJu0YxoXj2mv8YF8t1CF4HPr6tLHuCTsmBe4mAMH6bPHKIC4tkZeDD+
	28mNxHEVa171RjLOs+RNiCbRxw==
X-Google-Smtp-Source: AGHT+IHa8Pb31leGcq/BfLuDTezKdtxG/yoxKfwEJl9LGFiOL4LSbWDBIt1ehToQWQGdY76XglA3OA==
X-Received: by 2002:a17:906:7fd7:b0:9de:b20c:be5e with SMTP id r23-20020a1709067fd700b009deb20cbe5emr4170846ejs.53.1699865793553;
        Mon, 13 Nov 2023 00:56:33 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (k10064.upc-k.chello.nl. [62.108.10.64])
        by smtp.gmail.com with ESMTPSA id kk22-20020a170907767600b009c758b6cdefsm3673538ejc.128.2023.11.13.00.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 00:56:32 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 13 Nov 2023 09:56:22 +0100
Subject: [PATCH v2 11/11] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable
 WiFi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231113-sc7280-remoteprocs-v2-11-e5c5fd5268a7@fairphone.com>
References: <20231113-sc7280-remoteprocs-v2-0-e5c5fd5268a7@fairphone.com>
In-Reply-To: <20231113-sc7280-remoteprocs-v2-0-e5c5fd5268a7@fairphone.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Now that the WPSS remoteproc is enabled, enable wifi so we can use it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Depends on (just to resolve merge conflicts, could also rebase without
that):
https://lore.kernel.org/linux-arm-msm/20231002-sc7280-venus-pas-v2-3-bd2408891317@fairphone.com/
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 307062c1a0cb..c0287d8f4ed6 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -693,3 +693,8 @@ &venus {
 	firmware-name = "qcom/qcm6490/fairphone5/venus.mbn";
 	status = "okay";
 };
+
+&wifi {
+	qcom,ath11k-calibration-variant = "Fairphone_5";
+	status = "okay";
+};

-- 
2.42.1


