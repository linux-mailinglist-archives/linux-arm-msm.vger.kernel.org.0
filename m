Return-Path: <linux-arm-msm+bounces-4407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D197B80ECA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 13:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 881E61F2147D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 12:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A68260EDA;
	Tue, 12 Dec 2023 12:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ptNPZqnK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DFFB7
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 04:56:38 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40c517d0de5so5695305e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 04:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702385797; x=1702990597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/REoHRC8EpvIBFzSqK+riwD+PQlohKwOub1bzwmxD4g=;
        b=ptNPZqnKnsJ5+gY/Z4ISW4ASlY5ML4F+bU8YImS2Yv8RVh7+FSQScQOfesoaTKl+BO
         ZNSMHJfBLOwG/trU4K54lN53j05/cEclJ9Avnk/DKmonKu9EPdKdZeIqp8TTt0EdT2OX
         MvBCkvmWw6gLyKHhIXz75y1QM6ymBw3LDM37q8jwmtsa8D6pvqkMpYXxEpqvKAjwC17j
         cMyZMG9NXzYbZ+DMq/fslIkUUO32jAvfVwFFI+cMNBjG4G6QmeI4wDnS7zm44ZLMfjng
         Mle0v219RhGUSNozxCzLca7RRof0sqditzQGpE7eFLh0fzUAQccwo8ZmVD6b0mD0lYWm
         W4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702385797; x=1702990597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/REoHRC8EpvIBFzSqK+riwD+PQlohKwOub1bzwmxD4g=;
        b=Gd+524UJWM22+f8GBxTEw48K5jtv8K/mmI53bvToxUNSA4Cojw8oPUGNevH1+onHrE
         WWmts4PZUHAid1oZQ3uyGkGv93RtMd/v/INKKtjU7MoCRqgwXHUhsApOnKBr5QTJx/No
         zuigzDiOeXavZAD4JnijaQQ2K6Yh6UrI8Fk1dp7QSaFOI6udljyEI3yMYCS17t+BJOAn
         wOzdyYtJZMHEZwloHnD4o/fX3zkzP+3J6sk5+u8cFYeqmwmZz1vGNaoxhRDbiDbwBWYW
         iTWikSvJizq388QXln/LOH6IkALMYzXx7DXtHVV1DSFOcFeG5OMgw5yJ0kktNgVfsJvk
         nqjQ==
X-Gm-Message-State: AOJu0Yw360UltjO42aZtDkue+P4iSUZXRsZ6IzjG9/GDPGU69EOfSKCR
	0Gvuh8iz1BwXCv+g3eYO+y9IIg==
X-Google-Smtp-Source: AGHT+IEX3/ysuozCRgiqNGdA66zA1f/uo2y1zcKGzyzZ3Bq8GOq9UOx1wFEjekqDrbKxtL9ycZEgDw==
X-Received: by 2002:a05:600c:ac6:b0:40c:2d85:3a01 with SMTP id c6-20020a05600c0ac600b0040c2d853a01mr3273027wmr.161.1702385797071;
        Tue, 12 Dec 2023 04:56:37 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id e12-20020a05600c4e4c00b0040b398f0585sm16820693wmq.9.2023.12.12.04.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 04:56:36 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: x1e80100: add ADSP pieces
Date: Tue, 12 Dec 2023 13:56:30 +0100
Message-Id: <20231212125632.54021-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Depends on:
https://lore.kernel.org/all/20231212-x1e80100-dts-missing-nodes-v1-0-1472efec2b08@linaro.org/

Bindings were already applied.

Best regards,
Krzysztof

Cc: Abel Vesa <abel.vesa@linaro.org>

Krzysztof Kozlowski (2):
  arm64: dts: qcom: x1e80100: add ADSP GPR
  arm64: dts: qcom: x1e80100: add LPASS LPI pin controller

 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 56 ++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

-- 
2.34.1


