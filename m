Return-Path: <linux-arm-msm+bounces-87805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BA6CFC849
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 09:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 411F03098780
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 08:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D8D275B15;
	Wed,  7 Jan 2026 08:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="UsUyi7qn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A0A18859B
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 08:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773179; cv=none; b=XhroYSrPk5ObsC4mC8usHL7ORVexlGGbiJ0E9p5qImhFYh9BihYuul6uLbgg7v8Y2HG/FRnT0YWPEDrfCttNPe44J46zZTbdKN3QIV0o5RixhzexbvV/5p4lBzyHIQXE4pRWjUBA7o7xARdeToRaAe5bzCkvnFDGBcEtuYPKCCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773179; c=relaxed/simple;
	bh=TJq6smJNpzhUyCl9pcUEvogC5t0FBsHTmp+T+Fq62FE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oLn2tPMgNeS7IPWDscX0iklWY9CUXkpGfZgL6BH3JcbaSc4NsYgksbQAFE0nH5mAwpMYoiEcQ7JiPBPpAgZocJAauROZSvMT5iOZF5uZ17FjigVCUO2SA2g/2ZnY4WqhtC2l11tl1rtPHnZBvNjy4iJQfzKbFmJJ8M1Cjkh6DHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=UsUyi7qn; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b7a72874af1so333180266b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 00:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1767773171; x=1768377971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AsHvzqbYWPHqvIyyKZ5ziYmivvXzm7HgbZNmFTyTVlY=;
        b=UsUyi7qnFEqQrd8+g2l8PgjpdMne7azKR+mo5jGtV6mEMTKzEGxAIqC/7TVyeZTVrK
         rvyu4aO4h1ClI8H7eyRE9UorThQBBpHNrJzsyZpzXGCbqjIhAly46i3Q/847uLHWhrMt
         r2ODc8aCISrT1j/3gvYcjmHecOpOr6RGLcsOj68+LilNT6wct7EOMCM3U72VQb6occD5
         3GlTOZJOPyixqJsHqsCnFdv4esIraJLHC/owA/0FQqMqfQaWeaSZ0h8yMtg4cM8uvh2o
         RTrbWC9YfKCUJPG7WOaY2Rhx7q9Za6NzIVKqQnRtSynx/2y4vOwrafZ1w5SeGab2k7gJ
         TP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773171; x=1768377971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AsHvzqbYWPHqvIyyKZ5ziYmivvXzm7HgbZNmFTyTVlY=;
        b=PdDLSMfr/JYhEk6Kn9dHo4+5jiIqu3aL9u3tWEljWeYtRvSn1ut8UJBH7brk6AUXtH
         DARZ3K8rlD0fvwY4up68asJUpV4z7SzCQ4vZtx2ANGSxk6o7ja/8AdrJwiZDrxQOis9j
         YKzkWwA6mQvgdrb0461T3X7ORqZ4IRy8m20GWUoViIUxtrC3cUZvnar5i4FgtrRSg9Zo
         rZEBg3/7XA0uvGI2qfh/08FqJN5rezrI6MgRZiCZ3v3a5lYWDJq7xWH3bQPNX5f/qaeL
         AZ01aol44REhJyfGc+XRgqe7IAtkKlYnQHTq4fEdH7/mfYFxj5OOrk/Mpu4o1mnnDP6v
         iMiw==
X-Forwarded-Encrypted: i=1; AJvYcCV0m5/YGj+BMgr7bkeFZ71UciPU7MIDjQvU80jmWXGh1/IeYLw31VBUXRtHPFZ8c0M+EWu+5vBSPpRFOA9a@vger.kernel.org
X-Gm-Message-State: AOJu0YyEGB7laYB3T9ey/lvAD2TVic8mKaqF0JcVa4PnhEi+hF5BDW8G
	nq2HaDSuEF5OZnEyNQaPW/tIEJ+qyfBD7KhIS3ktd9F5PtHuByZYnxzmqoLcKxcc4l0=
X-Gm-Gg: AY/fxX6tdfXyK0GbXhV8/KzkSa3uvfiiXo8TibgdNak0CmejVl1Tmr+yikxA9mCAxCy
	noUrQwd0Q04RB/GZi/vfW5AfG9Kar7mbMu68ulS7c7eJgB+aSTmqRi0ebFE3rm8idTsJtiSsOtg
	HsiBlJCXohCUDd4WnFuPgA8qXwu1cuVzmjpKCLauQE1/A27SMLoQkCv66ChoZ6QojfhMzPRCLw9
	ywuWwCQZqjZAnvPklFW4sevH1Khk4xL56r1RkeNAts+skxUzqEfoNeAiKiHI3qZF1iuo6JPBRNx
	Mfkef07Sg7goKI/nPuNcAIuuuHCa7mUPZDc/3Alx3lZMTWA6wNn+EdW8Spp/COwpbm0ILzeVUBq
	0YvNSMNDV1BLfiEY73mLoV2ir5GD/DconaxarZX366tXHAB1MfFrLJqYlMAObxMJKjdUhBF4dgz
	yn4VThZ3ErmSJ2u4ydRDJUgJTn/Q==
X-Google-Smtp-Source: AGHT+IE4p/vShR93wKW4ZJiqzHFOVPLWCJgnEqo2jRVbm+FDwTqLGqE1aGXNP46YX4KBtv7HXppcKg==
X-Received: by 2002:a17:907:72d1:b0:b73:6b24:14a0 with SMTP id a640c23a62f3a-b8444c9f0eemr155635166b.18.1767773170902;
        Wed, 07 Jan 2026 00:06:10 -0800 (PST)
Received: from [192.168.224.78] ([213.208.157.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5absm3941299a12.33.2026.01.07.00.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:06:10 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 Jan 2026 09:05:52 +0100
Subject: [PATCH 2/6] scsi: ufs: qcom,sc7180-ufshc: dt-bindings: Document
 the Milos UFS Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-milos-ufs-v1-2-6982ab20d0ac@fairphone.com>
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
In-Reply-To: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
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
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767773155; l=959;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=TJq6smJNpzhUyCl9pcUEvogC5t0FBsHTmp+T+Fq62FE=;
 b=SDduZQ32z58+v5112RpYgH7igk0LTEEt4gvQOJlOViBskefmZPWHVqnyn4YLFTSn/Rxj3XIvm
 dlb0sn0jl3AAlOokauCExkdezRA9GPP42e6wIixJKqAMRF66ZMZSpuJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the UFS Controller on the Milos SoC.

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


