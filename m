Return-Path: <linux-arm-msm+bounces-55627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7423FA9C848
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 13:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F5F79C168A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADFB2580FB;
	Fri, 25 Apr 2025 11:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ctLEYos1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ED52561AC
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582044; cv=none; b=bf9x0feQVSwPGAQ7jXCovMWi9Yqh9+DQ+q843MS4ElziX9Zrt8TSGwJj65c8Js0dM61aJysT56p2CPGfqdJ8JFt5HE2MnP14mh9uwAW5sXlFkqbXHvpC8qAp4Uix5wJ95ggUGJZtGdDUuOMuR6n9yoUeCB+v1ntR/kMGwRYDjtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582044; c=relaxed/simple;
	bh=GWQqKqhR9R+AOl4YVrKqeXpFyCgWMIrLiGYVX0UFDvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jUzaoPO7/iWdKIR7fHr0rWWEzbTwB6/wr/qyCY4PQGAepo2wmR+GLgG2pdqGiFSD0YK5USD5uUGpa48MyA+cPS1mnIYlQLhUTUtOGB0oceHsy3hhYh1Is6f621Cf2hTxCBzWNAbusLFftLzw29cG4dNtOOqeUybt4voILLHn6Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ctLEYos1; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso471393666b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 04:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582041; x=1746186841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDdEuB5Uf2ftGqBR1zZgMGIrqfvZkuIBMu2lF7TePII=;
        b=ctLEYos1sTpiIbQM6kORCja2NAExUxH7/ZWqu5Kiep//S0Vmz1hu08U7qHvsgdPzHb
         WYapIJ2qqSLXXz2ri13Cg6Z8UTw/ZnxWKXRsX8uuSj6oOYFv8ED4OOWratc5z8jCRjT8
         DFH2VtJiSghWeONESHnnbgBqW741mAKV6TGZwxhiBpRI7o7rNhSPxOfP3I2iJFxtDJkq
         f34iZMdjIE4az0gTn5TLW8eNtqKyd9To9lgmGtnn+kSgCDgSDbumaLzlnRNh5Bmt2His
         VLgVlIGRNok/jImQoHoW/fNARKR3QjIcIHU0BNL8hBeKP5r4XyUmrLWP5wh21rV263gF
         m/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582041; x=1746186841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDdEuB5Uf2ftGqBR1zZgMGIrqfvZkuIBMu2lF7TePII=;
        b=TgKY62tDu1nH2/UyBATFs7oOfowrcfmN1E91n39as7vXt+DLkaN0zdn2bGe3sfpwqv
         Fevg5qtkcDCKeZnLnRo4Oc+/ItwGNA11M8wr7P5JWqRxNzOOZ3nWchgLq1Hn7C5v928C
         jTQBFWLHU8mRHA3lUCcmBVhlKK3O3w5YY6dAAL9D1CuLHqylp+vZt8uaH3wghDq7zWVa
         OGkxbqs4PsMwuKXOduBcKBq+ZGLZQOKKEyHRIDwn55mL5CanjbB2VMkjEuGhQV+mUgTr
         Nf0ypIOfH8aAUm9BbB1Ap3EFm/7bTNTq7zvbbOCxFsdZtNHi6+8upIltrGVp9o4fd6id
         1Afw==
X-Forwarded-Encrypted: i=1; AJvYcCWAO+dNLXprC514HOeskzhW7w3RCZNVsbcIjd9Urm6hC1hxwTXaGiGGx50Y0ry88N/is46XY03KQB7rsWJy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7+0qBtxebSkGHCkEQy25w87Vugl6C7jrlSDh5m+1xenSXx2IN
	B0H9R6wNq+L9e1ldbUAfsd3r5yQ00mrWArK4dGsQ4j66UU0hidnUwETllgFgcUg=
X-Gm-Gg: ASbGncuBsR6YKI4GYX2E6sX1ouFtqhU2TcILaF6rcpa/j9H8/no/2tJqW4AN9/QJdnD
	mc0ECjrfRfFCAiFJPvCdEZDQCY0WthmPJ6qr/aLTC4pC3sIs5p0jgz4aupWCSnkHg66akY9Jl0Y
	JyS3COPo1QD4eTpEhgL/NAm1DUcWzVe6QH6HJgNlN9uJz3EwxEUHAAnn+2WQPCYY/eQ4g8ZHptu
	AJEqAlwEgRkqm97wdmFv1IlV+VJywg9L+T8pmXklAMCU5SiflkYSa8jt+JGCnRNhUsDudznO84E
	RZHAdmWwS5nDH1cKDAg4KAwtCWUXTwvETJ3MeXN20ea7YxOgIUa3w7vpYGKlejmyXUC16vHGvP1
	H/bOqGiyvYb4eRsJrf7E2GqnQCI2OUydu3a0cii1lC/FqLb+LsUgcSxUT
X-Google-Smtp-Source: AGHT+IG4Z132zO4DlBBlTSecMUKdMkW4PCG2puRXamZip8fJXNOQgwUPsWLBjFF15YC/bWh/tZwUrQ==
X-Received: by 2002:a17:907:c10:b0:acb:5f17:623d with SMTP id a640c23a62f3a-ace711177bbmr168306766b.24.1745582040456;
        Fri, 25 Apr 2025 04:54:00 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:54:00 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:47 +0200
Subject: [PATCH 08/11] arm64: dts: qcom: sdm845*: Use q6asm defines for reg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-8-28308e2ce7d4@fairphone.com>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
In-Reply-To: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
readable. No functional change intended.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   |  8 ++++----
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          | 12 ++++++------
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi |  6 +++---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           |  6 +++---
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index adfd916270055df0a957c573868302e0d77c614d..b5c63fa0365d28fdc4a61dfe67ab6a184e748473 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -714,19 +714,19 @@ dai@22 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 
 	dai@3 {
-		reg = <3>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
 		direction = <2>;
 		is-compress-dai;
 	};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 8a0f154bffc3d55ae2134ef28cb7653dde702552..b118d666e535a433f44b66c71b36e55df2ce5c80 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -517,27 +517,27 @@ dai@23 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 
 	dai@3 {
-		reg = <3>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
 	};
 
 	dai@4 {
-		reg = <4>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA5>;
 	};
 
 	dai@5 {
-		reg = <5>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA6>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index f790eb73abdd4c850fa0fe6f8f332e57c4cb9386..341b9d345f049570a48f2a4473a3178646a57eae 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -388,15 +388,15 @@ dai@22 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
index 501575c9beda966dea233079847ae375b41a2d18..63cf879a7a297e161c57ba5256d52c9d6cfe9767 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
@@ -543,15 +543,15 @@ dai@22 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 };
 

-- 
2.49.0


