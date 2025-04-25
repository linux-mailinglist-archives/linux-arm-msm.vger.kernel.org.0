Return-Path: <linux-arm-msm+bounces-55621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6628A9C82C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 13:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77371189172A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFF924C084;
	Fri, 25 Apr 2025 11:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pd+0BoSl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4900724A041
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582037; cv=none; b=jJhHD8+4Z3nZUt0lzSeEWwQyGd22Xd+4GKhbnWfltEnwkOgwdMa9/HQ+E+oxgRWEj9F4HO4RJXthJEOUgsWB+C4UkigIDlwRLty5thzRqwL+BjKDPConV7cLke9NOjySWl2USw6diDSBecAlZbhq61BxBKRooVlLjZ9I4AH/S6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582037; c=relaxed/simple;
	bh=gyFYvyLOAHq8IYJIi43QPF8e6AqlsdV5izSiDomzIgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Txyi44fzdc7ZUOMZtmkdXPh/gPSPigIXAkPKkANimUnWaI8r+/Yjw/CxEN0jlgCb5VvFQCI3vkzKBTy+V7zybR96cmxPjJh0rE1RcFIjAbtuJcZmODIChwqZSEcEIjL/C8WRgYmnQc7f5Rsak0bu28/SOLfNUXzLs0Wu8Tcuw8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pd+0BoSl; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso376400166b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 04:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582033; x=1746186833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPVI8KDcHJIY37Gh8WYwOAoMPWdQlCF9Un3uk5nmyN0=;
        b=pd+0BoSlvXR9l85DJRn1TPUxhSsgBk0JZfp1hTiO5j8Fl0vkwzmX6qKqkEK4u08a9p
         JQpRfRBbyzsSxs9ZsoTSRd3DIqRYpB7PlqIbAit+4IQBQNClJOnr5QpJnaxau8q3hET6
         OMe7djcTCrZosblqcv/wHI4sFOkCTW7HCBtrec4nkh7DyRDyOD+Jsd0xUnsqT8odGLax
         j029JFxa9hwkh+cZJRbszXjta8GnvLHcIC5zJGO1uh15NA/QMucPB50m7ES4TsJ6VSi8
         yyBL6Gsxbp3xfxuFnchErWrCnZntX04MODISPZm4scXo6dr6/bDMamlLH6JNxYMsS5Iz
         jScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582033; x=1746186833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JPVI8KDcHJIY37Gh8WYwOAoMPWdQlCF9Un3uk5nmyN0=;
        b=xDOizJ6/viKWjKdwcHIVgTq/XxxcF1AthwPQYRd1t/LeMDlCJcCg1xs+ImJUwtSBWO
         ns7tgVXs/UYTBbdQUkqIqtjvSzWLAN+Vsg2jYJzcdAVggzctzhqsLM7UX7YB0ufTOZpu
         byXc4inUYL5o/Ob1HZLNvT4z4tj/eDBdtm00LQTUrC9jEP6/C6BV3CDORJB54xRBHSkl
         zwQX5RVQp695TujQZglfSZcpoHsuvaGsosL0nyc4GKSLXF4XwJ0CwqqrgiQRcjf5Bp1B
         1usl7rF9EboBeFRaiKqUQEPrzMDGcI3S5Xfvsdcsu/W19O44HnicGyvLitAleWlRMcsQ
         cBIw==
X-Forwarded-Encrypted: i=1; AJvYcCWpIYKBUqCmlpN36bE/o9Tw4DWTiz4vsybGy2FzqG5oR6libV7VbfCj/QbnZTUFsSn5xTDILCwLHnUXghC8@vger.kernel.org
X-Gm-Message-State: AOJu0YzRdQnBk7TDa2l6ZgSdjQu6BePcBvy7HSmANdQLLZvAm44pnt+X
	jpzD95QGbgNT6PhUnt6P/JP0XSe3i1AyHe8JdVc4xQvyo5FMRY0ZznIaGubehj8=
X-Gm-Gg: ASbGncsByX74y2y1sDrdySJebmeE8cMq03GaKGDnTH9K1iUeHc6ExrrcO9HafyRHVIq
	h8A2N+DM+Tx5elxL6+tEZGfyLnx3Hth8JSU9RFdLbXanrDFEaD5CBf20qoQ+FTsUUNziLYQqF/5
	KMVkbB090HGool8fxcu0VWA3G5KwqMeUeFMNJE0ahwMGrDyaouJq+tVWkIwdG8ssuLuom1xBUNc
	EvzXiUUrQ402bVeWdPa57l1QbnYbyXtAXoGDmjpip9NrFeBmcOPTzakLVPsHmlf/IAyDYYDqbgP
	SffcKEeGgEbihBrvfUqxLlH9b3rRFgsis755V7NxKL12myfgbfjKH8RsUgH7b7Dr3NvA7JzGJhn
	lTtUVowQzXJzvD3Wap9RGBH4SQDm8X1vlo9gKln04oW41CvdRKttuXRDf
X-Google-Smtp-Source: AGHT+IFgepbIUAFC/V0EgENhCUYHFuQKU2OLBduHNUTZF6ly9RhAxZl7IPrUTyzvO4S9nM/lVXSNqA==
X-Received: by 2002:a17:907:1c08:b0:ac2:9ac:a062 with SMTP id a640c23a62f3a-ace73a45d0dmr167162566b.23.1745582033567;
        Fri, 25 Apr 2025 04:53:53 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:53:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:41 +0200
Subject: [PATCH 02/11] arm64: dts: qcom: msm8916-modem-qdsp6: Use q6asm
 defines for reg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-2-28308e2ce7d4@fairphone.com>
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
 arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi b/arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi
index 0399616226330b17d0076460c116f4ae27b4b00f..75103168c1fcdcf9ae968acee9a639d04aa61b62 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi
@@ -58,19 +58,19 @@ dai@20 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 		direction = <Q6ASM_DAI_RX>;
 	};
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 		direction = <Q6ASM_DAI_TX>;
 	};
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 		direction = <Q6ASM_DAI_RX>;
 	};
 	dai@3 {
-		reg = <3>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
 		direction = <Q6ASM_DAI_RX>;
 		is-compress-dai;
 	};

-- 
2.49.0


