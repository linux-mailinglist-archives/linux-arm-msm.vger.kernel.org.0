Return-Path: <linux-arm-msm+bounces-88577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B2AD12ED3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 14:54:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1818F3013D6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 13:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97C535CB86;
	Mon, 12 Jan 2026 13:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bvtd/Qce"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406F435BDCC
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 13:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768226002; cv=none; b=tVx85eGmE6nq7Z5Zulvc/b6ngWDHHWej2VGu+NetKbU4+K6d8nUA5DZO4nX5OnaMX2ltOeL+O95+FdRI8eiyhUvyPSTFw6pC7JoMD57+js05tyf5LY4t/mMprjzr1kjUhEsXp+5nUawRtmOOic5UYBwstopXyYb/Fhodh3CwN5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768226002; c=relaxed/simple;
	bh=th6axCGBijF8Kah9JfcUeQ/2xCVBCKHltRaRG2KfK10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=utDpgKN9UmelW/vepn7VIqR36EhXgPQaoPf+CTDOaRkCn5SH///OXWkQTHQDkkVaZ0ejY+WEPMt2L1G10l7lI0E99Ds5nAT779V/C5GaCPCQ9BVRKuHlcJhba7ba2WYNUzzPlDLwTHaM/oR/j7wZRPd8RrF/5MJclCv6PrD+cps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bvtd/Qce; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b871b6e0c70so148378466b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 05:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768225999; x=1768830799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8IKnx9yXSe0FPYJrKraQqEmWSwhdYk1T8goN1fuYRo=;
        b=bvtd/QceeYnli6Bs1+KL8Hr3/0qYmVT3pvd044d4DzKHoUxdthJgoCmmE4qC2LeDxa
         ydmAs8ErzXRKgL0egz5oK5HEWwr4SN8Jr1YC0Ul8AkGQH3eOHhFAAH6IP3q/LBEV/NFQ
         THR/bNe0CxdLuph8+laxTEHSlzCrJe/MBcvrdD3q7sg6+7HzX+6dMDkLyBjL6NKHP6LW
         QWGCwWAZiNDtb+zSsuC2/6IMuudEHxDvCdWtS+y9FUC1xSyG46+Ck09TO0iEc2mvsR6S
         1OAC4k56yWIk/RwOCQjUKb9QcyOl/seyM9f3uYMLCVBw5wKVaYu89TpPRdJm4f8ct9e2
         KS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768225999; x=1768830799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O8IKnx9yXSe0FPYJrKraQqEmWSwhdYk1T8goN1fuYRo=;
        b=G7jY2TnKZ89j9fHKlknEZr/HtT4BwdsWOcGNo6Gou3+Ia129Gg3CVnpscmSkFj/6qg
         yQfc/cMBqK/wJtZJCNr7XKgrD+xR8Y1JqK8O9hWYWxPYQ16tkwAkom96+m3h5kFdyS6B
         Vp+r7pU/ucGy/pyduIB6OW5ltMt7pr4QzEAIP1xsEDpOSS9rOFoJz4zhiUcZBOk/6eNa
         +hi3HWn/vD79mwSd1Iv9aqhiuSJDOFUW4B0DoPXv1lREr64jDo/uueq33R2IIO7QTn5A
         aAB3B5QIT2VXlsCMlAtxx2xuVeRdsiSXqq+HGxGqiy3nQmI9Lhcm/szUPPLK42wJQOZ0
         OorA==
X-Forwarded-Encrypted: i=1; AJvYcCX2p21osDX+XjVY1kIF4yLLp/McZ+DK9gE1ovuvN0c9fWAFsVjGDct8uE0hmM8t2N72DY5o+z8bznVtV9lW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1jvyevdyDmq2WSXdR325sPA+0l+MIgGkYPrEaW/kMjuHsN55q
	QxGffBgIvZl+VB543VvbHNbmsn0Wv87ocrWm47bUgKTBRPKRiCz13TTu4wfcyDDjFU4=
X-Gm-Gg: AY/fxX6FkFBUxnTXUbW7w5eFhll3ULzwYO7orsiNHj85eMrDevb2w+pW8g+2yGkZbFr
	2Of/8zQVksFyUFwmrAO9mmqOfGC9/w6gD3Qf/YPDTbz0UxcHGJ2VsYwNFYAyUBLS7EIghC5UdMI
	vEn2oZKLw4q2odT7STSi82AHEcoGptq7olL5oOj3aRNZX5wS3NAdN9ddrLVISPQcPBbTCNlDGES
	cwG+hDw6oOGcBgng0NkrZfSOuswgjE6mZnIV+ssEhZ3Dqyo4mU5FIN16DESqja+Ca13wuZ1jjKZ
	amqobJ601peqbAjhWBazKxhpA+KD9P7zVMshLr3RnydMw0W61yvJaYZgDO54pReDXPG7KHNiv+S
	xgWocGuUZqSSPoepXvU+oz7xXSLSohTltqdsJ5qc9IQ0a1UTim+lSK4zN7ixLKiwtmfxzUAdvEM
	oMX9L6TfwzQkyq6nmqk+Mx+JNIbe+8uJ6cdaQrP8JHJgJNxwPvjBxP35+JCNnFG18C
X-Google-Smtp-Source: AGHT+IG+AJ65kKB2Dp506sZrhGNvXlfvnMnaQWt8y8s6GD6rdulfK18GchB8ix/xHYp7NvkWK0olNQ==
X-Received: by 2002:a17:907:7b87:b0:b87:1a26:366d with SMTP id a640c23a62f3a-b871a265a30mr330532366b.49.1768225998538;
        Mon, 12 Jan 2026 05:53:18 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8731f071e4sm25700466b.66.2026.01.12.05.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 05:53:17 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 12 Jan 2026 14:53:15 +0100
Subject: [PATCH v2 2/6] scsi: ufs: qcom,sc7180-ufshc: dt-bindings: Document
 the Milos UFS Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-milos-ufs-v2-2-d3ce4f61f030@fairphone.com>
References: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
In-Reply-To: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768225995; l=1032;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=th6axCGBijF8Kah9JfcUeQ/2xCVBCKHltRaRG2KfK10=;
 b=294PpU4+wAexgNBjfPS7wMuzv8k505newwtgg10/kKLbAsBgxO3JAl/3GxpexhG6+tpOtAn2F
 pbq6ihiX5kQBk/D38DpXyiw6nLvGBd0OB0JwZO0FQ7fGpZDgw8b8oAn
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the UFS Controller on the Milos SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
index d94ef4e6b85a..c85f126e52a0 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - qcom,milos-ufshc
           - qcom,msm8998-ufshc
           - qcom,qcs8300-ufshc
           - qcom,sa8775p-ufshc
@@ -33,6 +34,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,milos-ufshc
           - qcom,msm8998-ufshc
           - qcom,qcs8300-ufshc
           - qcom,sa8775p-ufshc

-- 
2.52.0


