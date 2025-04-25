Return-Path: <linux-arm-msm+bounces-55630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0056A9C84F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 13:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4307A1BC68A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21075259CB2;
	Fri, 25 Apr 2025 11:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Z4PUtJxJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41966258CF4
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582048; cv=none; b=VL7ydYFo93qQujvc78WSlJu8F9jWIRp76Ue+r/ICjN5S9l9LPRi+gnKVzEtGqDLft0pEBlX4oiK6Epd4T3KNwokbMuOk0HvWNeALxnYDtSqwqhgW74j2CjnPWjdZijcfBv33D1Ig6qvYf/O98dHq4urDT4YvNQ7eHx52bqrukWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582048; c=relaxed/simple;
	bh=hZja3DhWp4DqnrVBJnrg1UV+uBVj5+fTNllqLDvHy7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gzwArbzBJBP5Hb9eHjLqRy3ivPwpjzzXtszPk9XAD0M3v3/Un6b9jHpN6Uy0ac+9nQXS+Rl6UfIVE20hxfWFzlxB2mGZda8XHC9U3enI7z8dxgNH2L5Xo6ZkfLq2P8VT3Vq76rVALw3Bar2IAoOtg22rrX7/7s24MvM1iGcMqJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Z4PUtJxJ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso4102962a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 04:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582044; x=1746186844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SK5p8vc5OlPwJ0lqNJy5P1rG3nKiW25/X8diyPQdNQ=;
        b=Z4PUtJxJO4gfCLPHreo8OzCCP/6I/FAAXoZyCx4vPtah7PJJ4/KLMBo0IEWkkqEyZ+
         5xlzuJ5AzJ4sUFLETHZpZ8HXfDdEfcznrzAwQimHdJyn5EnSNespk4cbGGodRfce6IoR
         i6vsmHtOEpGkPTfbNd/1YE/kdh83O0qrRyFay89sOlRYO1WYNFumrwhDXOYh3p7ouBSg
         78IIuwQbi5H8WkFuX0ZI95tr/hx/nNZTUoDMES8+6l7/Xa7XX9eYKXaMs7UDuUuquWVn
         ovfoYQtXz3dUswxjueyimsPY3Cx48OB8+uYjoAkZZ42MwX/bLQtUZwGC03ATDJm/j7Ci
         q9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582044; x=1746186844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SK5p8vc5OlPwJ0lqNJy5P1rG3nKiW25/X8diyPQdNQ=;
        b=D9io4qieYdxWGKZZn66qVOxTqYCQ7gDaEFTi6BJ/YqwRmtPPi+enTG/0DhPsXfUFtI
         3Lop4G2X/CmSdWMLY/qxgDb+bw7Zgn6BhcoCfxgUoDt8qTjRthbeZMIsDc3Ptj0ChKdY
         UT2zPvWDP8j7HBCUVMnQBMmkqph8etlHEtdECSsA5Lx+7Ik6V3qYOYcUOSWGFXkBfKZJ
         l0Ge1OX9HN37crdLeJ/Mtf1oYl6OCimjsFxu3T1pK0oOYm+xQ8fZg+QAU/u18XebWv/F
         VZ+1BK8HxSsUNHzpD72T/ruGGOGeI1Wy53Kgn9S5H3CSPmMifthdVyEOF1cu1N39SLwL
         JRFw==
X-Forwarded-Encrypted: i=1; AJvYcCUAI/lWIsazHSnD6rpn/0Iq2skVyvWy+Ihb2LaXkzYROe6HAuGq38AUe7/hSD/irkwrPCyBiQfFxyLkD6j1@vger.kernel.org
X-Gm-Message-State: AOJu0YzjRWz4DtlPhfoUq7CpT1TFcFhTNPtGhIKvCASF7+CnIG5QiMAg
	Q/3iHNPeS7Yxy1mCeajdmPzZh/CdgPqXwtb7Fc8pMuQqW1Hk0c07ZJhC3/1Jfd8=
X-Gm-Gg: ASbGncuk9v49zse6tcdbwENZJU6UqcE/KBkRlsYIJVvQ+3iBUNJBDzD4q29+hFsVH4C
	UljDZEmarwmEP5iDcDYvBeooCo3/sxvlo/yozDlgvNfEKcZccW8K/W3eCapHedeIdPJrk3IBAOO
	wGyv1T0YFx+KQyYThZhbnsKw5OGOWjH5rypFzX8mLmJ7p7Mgzf9qv4KQd3I8vzfL65EDhVNNOHG
	8347VrlccfxeT5/rS810ujkEn8gMsZxNXROE50K/ZvVkEKqeGZ3DJHv5DZEpaZ5JC9rsTGofyrB
	NGmbfLEU5dglex0r48kBSbD7agx18dZfrgK1kZd1e38Ngo97Gl0+UuVbYx/29OK5SeCXc3uu4dW
	p+kOo5BRlf0mSAtQCMHgpo/4v5ms1ovljnI+6qPCGnnwK+uYRi/S+4hF2
X-Google-Smtp-Source: AGHT+IH8pJR0qES2zOkoM2zky7c3n1R1b6HaoctvcHOLcvJ4CDgnk1ffCK87cpuY4+1yTGln4yQNJg==
X-Received: by 2002:a17:907:1b25:b0:acb:b6c9:90af with SMTP id a640c23a62f3a-ace7108a929mr190169466b.16.1745582044400;
        Fri, 25 Apr 2025 04:54:04 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:54:03 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:50 +0200
Subject: [PATCH 11/11] arm64: dts: qcom: sm8350: Use q6asm defines for reg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-11-28308e2ce7d4@fairphone.com>
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
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 04a30df4362b65594c073b758f25bf2ae0398541..f2e12da13e686e68071ced0e7251b727d08061b5 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -22,6 +22,7 @@
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/thermal/thermal.h>
 #include <dt-bindings/interconnect/qcom,sm8350.h>
 
@@ -1957,15 +1958,15 @@ q6asmdai: dais {
 							iommus = <&apps_smmu 0x1801 0x0>;
 
 							dai@0 {
-								reg = <0>;
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 							};
 
 							dai@1 {
-								reg = <1>;
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 							};
 
 							dai@2 {
-								reg = <2>;
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 							};
 						};
 					};

-- 
2.49.0


