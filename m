Return-Path: <linux-arm-msm+bounces-48475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 711F5A3B7DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 10:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE94A3B5743
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 09:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609BF1E0DE5;
	Wed, 19 Feb 2025 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QTo5ZVyD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AC71805B
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 09:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739956079; cv=none; b=DzwWWklSXvPs3Sc87gHLfXZz5WSPJMygeTPTaC4bnvs+vn8CyZor3m7+8fAEM3dlXo+Yhh93m1Wa25OhyAF2mHdaUgYnRIK5F3xvAVztbO5+UzjsQgP5BqsPVLcWHoDS/gs27tsrIgFM2AlWwgcNlEisUu6cBxTZYxXzTUivUW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739956079; c=relaxed/simple;
	bh=y9+jjNrpYcM245Swk87rbOZAHH07o2CouN1Un1joEhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QwykzD4Qt8doqFkcu/8zbdLFHh4AjqayMgwzaUJt6uQ7ulNbZykaJZxPAAVHu0x2sOrRSeUOy3KF6X7KMFSVY2L23fbOoM9TM4IocUXDt7s8d2liXj3eBaPr5daX82r8b1BIXZGEZx76IXIVKaUVDi2XD3PYdW7jQpTHBb/1ghI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QTo5ZVyD; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abb9fac29d8so56621266b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 01:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739956075; x=1740560875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A4rf1uuU3YUUfNCVhsKahUo7qqP1R1Q6wSumwLKUuCA=;
        b=QTo5ZVyDFovRNXtvGjIOhyjiHG+YAvB0ASyble6KO3CcUkjUDwYBb8Noab73z6NQng
         WqjGqi8gJmoYVr+FC8mRd7Ld7f2FT96zYVUBDH5chR7zpEHC6gz5wLvtrSd81k7adMQ6
         U+pzSlcHzk5A1OPkjsn3OFmin3BOJg95ggYJu5zFoyOzEiR5mMjtl0yG1x0aV3p91FZN
         nh8Qwt7PFSqojBwojKW4tDjoZaBH14HQshl1GwXf4BAqh5EuYA+7+f2s7uLwH5n/w7CQ
         2XmzgIit5HF83XUn4ZeFIEmy4fp2Gh+8qqX9AvSIydXG8xfuG+Oe+oDDMziH3P/PQpxu
         bBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739956075; x=1740560875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4rf1uuU3YUUfNCVhsKahUo7qqP1R1Q6wSumwLKUuCA=;
        b=sBeqO1p5sA4e8PRPh1YYcxrEvvosWtmuKnNdRXNYMBvEAnKxQevXE2TOhl6wjBmY2R
         9mIPsWtKCExEV6qxI5EMAqZaKIECUSkVKTvm5wZi96t+G7lCzT8ZB9Vd94Dc4dELGKNr
         TQid8k6G6v7oUkHZDVOp+Oe11/iy5A9pIrfSpWrmJ6iUARGs0J+w50Q6uiwTz5uYktpU
         TWmCr9Cb6QNmKKpTDwnZy6W6MrOuKOXQeU45i30E8rO6gUxqVp0/VKWc8aL3Pcvs8qnz
         3LMEZYDShFQzW6PpTxEHjySs1AzdT0RQNRSK4mTxoip9cpt9FTGx1wxEDreDW69ROawC
         VuNw==
X-Forwarded-Encrypted: i=1; AJvYcCXBbubd7pNesY/84s9bQMKLPbRDtPrP2dKOw0+Ph5sRJLowS/6jYHu8wIFTS4JVZ/LqSPAYpTHPIVtPh0EW@vger.kernel.org
X-Gm-Message-State: AOJu0YyzcKGYXg+nkFe6oWvyy6PM/KfVtsCfjSofUUdW4Ds/b0pNskXW
	8u8uQRA6LowMF0mLMnfbUf9C0et7wg29j+onqmlSGqQ881nU5kGIZS1w65wUXwk=
X-Gm-Gg: ASbGncsVS8cab6A5vEU2CEdgofLLxQt+clBwhil1muW4cYNq/Tx+MiSzuwIOGWd+iOd
	RKEipaBOx045e2IdO9SOsWgCznilsSU0YRYZcgpViOagBHaGzIWgJPkRH2QuNYqLdJRfUv1ktCs
	a6NaK0GdjPgofbesEPX/1AsDrwgI3NpT36vIAB6c73hxhE/M9DI3lZN1f/rZmLIGRQrFOjLI/ip
	q+yQsCvtBzbH4iwn3DxmYo4Kovv9DGvEohEuB+2C/3tv++kcGSZKKf3GzieASfBG7kjJFkPIofD
	n9wimdNL0ifLSs6KADNncnXcRIq1UQ==
X-Google-Smtp-Source: AGHT+IFityvjq83wUTEdE8yjTveE+b43ohcX+t8dYdc8VYTkgfSmcSiAm3lB7Ph2sUv1UfqtdfKuZg==
X-Received: by 2002:a17:906:c116:b0:ab6:d519:f039 with SMTP id a640c23a62f3a-abb70d95951mr781534166b.8.1739956075448;
        Wed, 19 Feb 2025 01:07:55 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbac3242dcsm407695666b.107.2025.02.19.01.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 01:07:54 -0800 (PST)
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
Subject: [PATCH 1/2] arm64: dts: qcom: sm8750: Change labels to lower-case
Date: Wed, 19 Feb 2025 10:07:50 +0100
Message-ID: <20250219090751.124267-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3bbd7d18598e..abb92c81c76b 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -95,11 +95,11 @@ cpu6: cpu@10000 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10000>;
 			enable-method = "psci";
-			next-level-cache = <&L2_1>;
+			next-level-cache = <&l2_1>;
 			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
 
-			L2_1: l2-cache {
+			l2_1: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -111,7 +111,7 @@ cpu7: cpu@10100 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10100>;
 			enable-method = "psci";
-			next-level-cache = <&L2_1>;
+			next-level-cache = <&l2_1>;
 			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";
 		};
-- 
2.43.0


