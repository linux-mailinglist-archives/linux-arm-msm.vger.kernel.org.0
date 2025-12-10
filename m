Return-Path: <linux-arm-msm+bounces-84849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F53CB1A31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 02:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 262E731185A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01AD9233D9C;
	Wed, 10 Dec 2025 01:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Im6H2wz6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC1E227BB5
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765331036; cv=none; b=SGlWOA2yucun9MFcXUUewL1DYL1h3QtWAw6Qi5hzto+N/PF2lArMn+BWGKyxJCBVFm2rO7yjX5XA6OS/0gWt981Mc9g2LeOM5U1jIc54OqYz4VCMT8aCYwsfBw8+WpXnshrxn0uLFx9iu+h35njIqQ4KrISGMjKV3rhSCrJARpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765331036; c=relaxed/simple;
	bh=64R8FCiMEBBuwRxLEqvZs1seDkt/c99ioBjBkZyRvHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rw1da2meZAlX3G+WnQXhiTt5CFrFYvamZIsWNCMvTSl/a0pxOSJuSfwTT0tzATKBkEJJnuKKxTBSj4klwPLJ2rAPzKnDq7sMaeCzJV5b1U9nlxHjgjnL69uf/DYA6gJGv0pONBHtPBxChM/TCwspLE+Ieo4F+iXXd6iu8mT8NBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Im6H2wz6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so53906485e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 17:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1765331033; x=1765935833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRkZVQo8Cy9rpkzUUZawgGrEURlfhJDKheEKuiyOhG0=;
        b=Im6H2wz6ZpCbSPMSItjq5MXhQRVhes/7SiyWlZRkjrpAvWuL5ZD/t1NP5jAtba8TaP
         Jky/oGbEW36YV08lAlfNlAbptgCKC9qmSRpfSfcVeeimYowD3bDB6JS5UuRFXIrqlZWq
         knIwyMg8raKGjClldjYIStxpJIFGP+gNrMwcmE/j4iRiTd0pzwrRGHdOQbjdz3rehznZ
         czfFjkdi1N7LIDRFtBSCi2gVUzdCSdDRpO7C9FdnHLtW7BGySW0wJEMTCN6ULWAYyQCe
         z7QajDfr1IO83kM84VSvDktSsVp7EBwaZXwTCaqjz8cbaaebZZLc23EpNF4a0Q1ucOkP
         aUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765331033; x=1765935833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fRkZVQo8Cy9rpkzUUZawgGrEURlfhJDKheEKuiyOhG0=;
        b=sSKwiT5vSgKMc9nLCLhQrFdfxirZlLNyGoGoDlD9bNnYTES6OYPvdOY6SP2an0ga3J
         tOcQJS8yTBcUxbBJUEreHI97AbAxNh0uuyd/8COT91NR5FczYIs0EWCq+LNhBCG6AKqZ
         E2cAtE4pH3tx+/Q0vrhlgqw+Hdf/qKhy7HUtIDPilzq/Bpiukn4uVu+Yle/hWiMKwepi
         /7yBVto1xFCVYelYB3E0y23r0QXcXhrU1kpS9i76DoMBmhgsOCOI49XfTQk4JeBXLWKi
         kR3htD+8Lv7xBSjyz7QQ0sihNEMLQLtVL7j4DIG9+H1w8JPDFy3zeIhXHWgXjk5PQAmH
         Lk1w==
X-Forwarded-Encrypted: i=1; AJvYcCXdAsPir3QZAHUqZTuDgkygl6RHgaXjsn7W0s4RmRCNpWwwxUuEMujokbP/x4q7gm9B4xuWFxExWyRxdCHn@vger.kernel.org
X-Gm-Message-State: AOJu0YwTy+nDFBHUEgyXOaIEOBMAHzvH2x0JIqo7wHYTkBjP4sum9x4v
	n1ySzdrnbNa+uBgw0x9O/2jaKLEMp0lxr8wrRu15/PGOrFLjj3xvow1lLdF4xZN44y4=
X-Gm-Gg: ASbGncv6HMGSOY6S+cIN43jZyuOC4IWu/2YLmS7GyLknI31X6VAwQ60/uB5IZUUU5fH
	xry6gTs9FdxnBPNrSfnvttz6hxJaqoAKtvYjNEz9I5Vg/SuJyuHSZUlhavteFfqHKZ8zGlmdGKh
	IbpW+0iohWeD6x45d7SOy/Eg3+MguvoioG3/SAuZdxar54D68+QYNRoQNGifWeumEA3r95B8uV9
	oiV4FEqpC5uFqpx4yuGPZ8ma8/dv3xfMAaEkch+SuNnMMJ9+0ZMjBvl/t4ZRx1hzGAl4bOJRGMz
	5bUY9sVGvonTfnL67UUlFJ7tIz96VUC4xSCp1az+Hb+KwQEPxAm2gJ7Eh3esAGhb648QabMvh3Q
	fE1vvDH1B1xAM1CCZecvYkOQ9+cghyHhVnM5iGhOCB0xU9gXehXOSeCQbl8c0NOM+9EnYF+0ydO
	v7KFmEsSLpcCNI2ybMUjw4liWNi0WOa/8fBjC6WLKtsRE3BX4piw==
X-Google-Smtp-Source: AGHT+IEqEijBe4vhE35mjP/G97WmH3BU6oTyIW6Qj47gs0IT6FwNpkQDR5rTFw4LpB8j9mZgSjrgaA==
X-Received: by 2002:a05:600c:548f:b0:477:b0b9:3131 with SMTP id 5b1f17b1804b1-47a83745633mr6952945e9.8.1765331032968;
        Tue, 09 Dec 2025 17:43:52 -0800 (PST)
Received: from [10.200.8.8] (p99249-ipoefx.ipoe.ocn.ne.jp. [153.246.134.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a7000c984sm705234a91.6.2025.12.09.17.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:43:52 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 10 Dec 2025 10:43:27 +0900
Subject: [PATCH v4 3/9] dt-bindings: qcom,pdc: document the Milos Power
 Domain Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-sm7635-fp6-initial-v4-3-b05fddd8b45c@fairphone.com>
References: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
In-Reply-To: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765331010; l=902;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=64R8FCiMEBBuwRxLEqvZs1seDkt/c99ioBjBkZyRvHI=;
 b=mS3y+bW1cfkBNdq9xXjZsHMDg9KgFcK33rSnqdmmReA8YaNj9DNz+pBy+zfhLNlKKb8jKt0Dj
 9TE9ZpjTAS1AbioGTNl4NiN0f/N3jL0VZ44slBPjbpXyAPv/MTK1/BH
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Power Domain Controller on the Milos SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 38d0c2d57dd6..0c80bf79c162 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -27,6 +27,7 @@ properties:
     items:
       - enum:
           - qcom,glymur-pdc
+          - qcom,milos-pdc
           - qcom,qcs615-pdc
           - qcom,qcs8300-pdc
           - qcom,qdu1000-pdc

-- 
2.52.0


