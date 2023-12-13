Return-Path: <linux-arm-msm+bounces-4532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CB481195C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 17:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE33B1C20F1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 16:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B8E935EE4;
	Wed, 13 Dec 2023 16:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pxwaXIwX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F645EA
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 08:29:03 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50bfa7f7093so9232541e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 08:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702484941; x=1703089741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vMU6rrGmxgyuL5TMMGyP9RyaaPrkiegeHhKObIZg/xs=;
        b=pxwaXIwX4eK62b6KK02Qic7oVBJUz3Sc/ud+9RUe9/2GgTv/TK9i0qiqD7vjlZ5S5r
         H9/0dis6EPbn8T4z/wvppxISmfPhPDT195WAv3MsDCJ7vRxf5ggHx3pbRw5k1Ou4Mflx
         E58hRkKsBdGDGF7i5zUXpo/KWmqZYcIyNQRSMF+XMQJtdMXPz6DVScdE3PyteE43eoxn
         UpN1OpG04VnOLObepRO+4tJU4m3Oct04pKU3SbrgMWqqU/Q/MIPlSTdwOCxhC6sjRjj0
         5tDPJuLBAFJAXtJcVRhtVCXilK/CCUC2LDop6zaNcEIGczBeCiF5BeDLfOR088B4NnmC
         iyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702484941; x=1703089741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMU6rrGmxgyuL5TMMGyP9RyaaPrkiegeHhKObIZg/xs=;
        b=iPvPAAjyOnpo7EXucJdb2HQoFFBTB1PPZHDFu6bLGy8iQs0XiIgmDvGchnvc6BVg85
         pdKhhp4XNjlHCYolskNYKEffAojq3EISUNINC8IdpwzuFzBgLlyyoaYIiZbpXQ8FHAne
         WmMSRdTQMd7q3rjz1n6g3SQlMQNivuhAuIJdNR41wgW4TOGifTkXe8XEMc6b4J2bTOoY
         /xusy7VfAaVCOwcTt+KN4YAnU0dyED71PAj0dII4ctnHu9iIpwu3K7avcHhW9CZIQ7Ib
         73eNIXAmL2Fn5QzAD2ZZ7lt0d67S8cs8q3BA5qqNPBTpH+EruX9IuM1B4Ma+JZXHIxqe
         MswA==
X-Gm-Message-State: AOJu0Yz783xkTrflLd5bpNn/mg/BKjwo9gjAkOgapGipf5PBsYYbWjmR
	JosCuvCP9k1kElGx16FDoYdJBmGIydOud/sSlK4=
X-Google-Smtp-Source: AGHT+IFJu6vsF/X1yu3ijUE5ikBJmKtuP5O78EYgVqbIzMF1rD5Pj8yPIiXoKlW7GBWTwlov6p8k3A==
X-Received: by 2002:a05:6512:969:b0:50b:fcd4:832d with SMTP id v9-20020a056512096900b0050bfcd4832dmr3753987lft.113.1702484941699;
        Wed, 13 Dec 2023 08:29:01 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id br7-20020a056512400700b0050bfe37d28asm1641026lfb.34.2023.12.13.08.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 08:29:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/4] arm64: dts: qcom: few improvements
Date: Wed, 13 Dec 2023 17:28:52 +0100
Message-Id: <20231213162856.188566-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
1. Previous submission included stale patch.  Resend without it. No
actual changes, but marking it v2 for convenience.

Best regards,
Krzysztof


Krzysztof Kozlowski (4):
  arm64: dts: qcom: sm8450: move Soundwire pinctrl to its nodes
  arm64: dts: qcom: sm8450: drop unneeded assigned-clocks from codec
    macros
  arm64: dts: qcom: sm8550: move Soundwire pinctrl to its nodes
  arm64: dts: qcom: sm8550: drop unneeded assigned-clocks from codec
    macros

 arch/arm64/boot/dts/qcom/sm8450.dtsi | 36 ++++++++++------------------
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 34 ++++++++++----------------
 2 files changed, 24 insertions(+), 46 deletions(-)

-- 
2.34.1


