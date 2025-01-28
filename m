Return-Path: <linux-arm-msm+bounces-46380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97966A209F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 12:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D044E3A4AF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 11:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42E61A238B;
	Tue, 28 Jan 2025 11:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VNtVR+ef"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BC519AA56
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738065220; cv=none; b=NRPmliOc/06zPCIeVryrHTa8FKVaL7aTpE5H2vAdnr7y/krEbjO6i03wu+CMy1ijhXBZbLD/R8muQfA+N30KM4z4XzMvfkqN0m7uf4atqaxo9FtGFUpD1i+d3r5eFNyIP8ukXFs3Hnot08NOSlBZZWdNSk75QIr+EsqsWb4IeoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738065220; c=relaxed/simple;
	bh=thYreHVKI5SWRkq5Ra0cLWy8XMUJv5l48C+D+iV+2F8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T4AKmuIv9sF+LobAi7xEX3l7ziRV4s6tlIJ0Y6pRwvX9DH8YFPpZfhsZqQobioJoiHtL5dcGKwIlfojKkFvTGr4VCgZCGMpDqKQoqb36/RrODK1qoXQMC7MpYi/RuaDyhJj69jpM8V1LfmBSyS6RKZUZs8iS0hD6XuEE49R1yjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VNtVR+ef; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436203f1203so4244315e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 03:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738065217; x=1738670017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iKMNbtERschnPULr7kKZxRmXBW6dOIFE/0WjjIKe8d0=;
        b=VNtVR+efDbloL5UHhB2lan0N44xB9tVE9xDkSQOmKstwRvwC2sElEbv0AcOgQZTN7l
         uDAwVwPGLf7Ob5EN23vgJ+ATWRZUxgfNn0Tf5B4V3c5RPfScNyrmaSmWzQFTD0VrJXr4
         211HFAKB+WLIxeXAsZjL83fVG6sWaLClK7NcOttwLr2EdoVVxkyMkTnus5jgVboWSEV1
         5s8zbNkf1BHRJ6mlntdO0u/pB38VPpsoq5djlnb5PDunud/GgJIvUO4/SJY9nNQz3rhy
         rBURfSz/FXkSP09N6B1yTbzNNdE6h9Ccb2FCXpXX2JlQ3j0z5411UYjtToalNAIMFy91
         8XfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738065217; x=1738670017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKMNbtERschnPULr7kKZxRmXBW6dOIFE/0WjjIKe8d0=;
        b=gGj6lf/k1S+l3WBXq9S5knTEC1n7BfIrQMHXXylqtIKm3X5ycMiqXNpKuZLWWSojSz
         15mE45jVhkDSoo7BQnqggIaDxf076OfrcdIDFAV5rQ8bs7dJHST5AcLu6stLgOpjkVmx
         gY7pfFDZ2Toc5Y5XEJn85clYibDZ+u09oBC7mfCzA6LIOJFccESe3SHbAkXXdw4uVOHK
         fkw61auhKyjuecYJWXy0S6lAJ4DmJECoePRy30CwP6gq9IVCssZwI0IAblurRhjJUv6N
         WSoHLWj7ftG1yk47BZZRCRGC19LBlQ0PSnbDJaoeqg4QrN3wkRzkfQgyTX3UncpsZoJC
         zsTg==
X-Forwarded-Encrypted: i=1; AJvYcCWPeFvb1w1LoqxgjqanDLvoZt1njoQWwMBSAkAtoxTrpCPSo7pz88Cfrb3XBzM7Nb2U5VIzN5fC+COFk4kv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ESYBqFzwyrlO/YUOqYb1VOWbtOBsNR+4nw3uDdjVIMlYs9Db
	Ja+VrJ2MrzyjB1DrM3b8D6m7s2COOL3CMncFo+9DxMAXuqSQ6TWC5wdkqqzH3cY=
X-Gm-Gg: ASbGncutSo3SFyffMzIn9JwtwEJU62NXjGJ/JmYMYuwI1kFHKQz2WO1D0y9S33T2H62
	6GxgdshT5eJdi75v2yzWkTbmAdQJdxgJpTy1rcqA8gk2QmjMpFcfASfS3QkFMq/aFJqH7zUxZxu
	vIfqUsCFtf9bXTrvO0a6P1mLkMQHfq9ZKX8fQe4rj/E8aXg4q5eOpgCSWy49B8SVAwyD1c+hLbD
	Iq4jG8UDxzyRPddQhYp5/PodVAmbr4xovseRcizZCNUtULmJNaBJO/EbqSaeB6i4CR4a/aBVtAm
	FoIIkY/5IVXXOLHlmCK4qJIUS5Qa
X-Google-Smtp-Source: AGHT+IHaKxNKbstmg/oVxzJ+41YPYsfc+Wp4zXa4sdTmv66gglPRj7ELhLUFhy9UduKgbaE7dDdkoQ==
X-Received: by 2002:a05:600c:4ecd:b0:436:1ada:944d with SMTP id 5b1f17b1804b1-438b17b0bdcmr92799705e9.4.1738065216894;
        Tue, 28 Jan 2025 03:53:36 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f269sm169140195e9.8.2025.01.28.03.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 03:53:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: sa8775p: Partially revert "arm64: dts: qcom: sa8775p: add QCrypto nodes"
Date: Tue, 28 Jan 2025 12:53:32 +0100
Message-ID: <20250128115333.95021-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Partially revert commit 7ff3da43ef44 ("arm64: dts: qcom: sa8775p: add
QCrypto nodes") by dropping the untested QCE device node.  Devicetree
bindings test failures were reported on mailing list on 16th of January
and after two weeks still no fixes:

  sa8775p-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
    ...
    'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']

Reported-by: Rob Herring <robh@kernel.org>
Closes: https://lore.kernel.org/all/CAL_JsqJG_w9jyWjVR=QnPuJganG4uj9+9cEXZ__UAiCw2ZYZZA@mail.gmail.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 3394ae2d1300..23049cc58896 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2418,17 +2418,6 @@ cryptobam: dma-controller@1dc4000 {
 				 <&apps_smmu 0x481 0x00>;
 		};
 
-		crypto: crypto@1dfa000 {
-			compatible = "qcom,sa8775p-qce", "qcom,qce";
-			reg = <0x0 0x01dfa000 0x0 0x6000>;
-			dmas = <&cryptobam 4>, <&cryptobam 5>;
-			dma-names = "rx", "tx";
-			iommus = <&apps_smmu 0x480 0x00>,
-				 <&apps_smmu 0x481 0x00>;
-			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 0 &mc_virt SLAVE_EBI1 0>;
-			interconnect-names = "memory";
-		};
-
 		stm: stm@4002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x4002000 0x0 0x1000>,
-- 
2.43.0


