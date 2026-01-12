Return-Path: <linux-arm-msm+bounces-88578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 039A6D12EDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 14:54:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E87B300A9BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 13:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5EA35CBAA;
	Mon, 12 Jan 2026 13:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="FZYi5v0Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EEA35C192
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 13:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768226004; cv=none; b=qzu285QNxqhVsRkvfqRo1eOGUYHvQJ71BOYd05ivee+/99nTVOWLIbVw5aE9I2vKHqDo4zzfi/V1P/gyWZeNAhROotOBO1btqtRzmFcJzHLloUAfCuIh3Fj46F++tREJwyI299DUUn+HfGXiArhzX5AThrFztz/pjzCVqMf8m/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768226004; c=relaxed/simple;
	bh=zh3of1YDtgoe8pLqLNknTMRnkRoApxNn8uXmHT9Ljkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rb2Gr32dQyCnCw61fvY+xwIhJ6bOoReejyaxFeKCAKx8TNFgzj+h+8Bh5pV1693H7CsxwdjG4EfZA3CoThkueMFum94PAuwPd6hgdIyql4j3QCbz8n9z/9SgOUihwoouM51X4uwW2oRiF0i/qbW27rcYa+uIs3Uv/Y7r/X31qng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=FZYi5v0Q; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b86ef1e864cso220060466b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 05:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768225999; x=1768830799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Riko22R3LEFHoPXODAPQuN7cY7xnzdRvNV/1KcDSv4c=;
        b=FZYi5v0QHK7CLjQ4KJRVOKYeki3+Oy4moavTOxJPhlzpNM0MguroNhdIO62jhl/W84
         bKyk17RqL9gKoirR19TtrODdDGOL9z06TUo9sGILQgGri+bnzuXWNuogypkTPoudynu9
         ImrWqhpnvA42IMRGdbfmXO8vRdJyxpT80x0RUzuqJEro3twawBJ6wkXJx7cIVbnS2eIg
         zH4jJtuPfHTSL3dXNjysfnfG7MdztHemN4FHJYI2Kd24wArusdXJv5hW3B0YSuHyzM3L
         05mkFAOdCowhTuyu9rstE/EUip59pq7iK1kVbH4o28mMU4PeDwVMCkxT5q1Ikv/JtIB5
         2pNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768225999; x=1768830799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Riko22R3LEFHoPXODAPQuN7cY7xnzdRvNV/1KcDSv4c=;
        b=Y6klSA5hg6eQF/cPhtaz70JPp/PVjnLQ4Up5Z30Lule9iYz1eFjk7WTAO1Ds21sdGs
         T51x6bRwjmxviYKGfOe+woeWF5SFzcZm2Z97HuE51Ls7WdMxJIaFVFzTlU9ybiMrQ6DD
         9UOJbO/MSYihH2sOm6R3CuLtansZxhq9uPsrRtU03RcQ6Ys+71rVzEUxqIFqU60oIblH
         HwFgRZNjAS4645swFUijd0InXBz3UV5TPzoz8QjVNZ0PG316Y8b1q08S5bafG6YXOkbb
         oCoGjEsMCVH2j1oDnHdlS5Py8DlAJyiE1CSGsxnpyRKbZ2hro0edKysyfYsuImuBZszo
         nj2A==
X-Forwarded-Encrypted: i=1; AJvYcCXqlVMhfiKAKSofjydx4AZgKPI4KF7ql2VtMFIod2aQiFRmvrRytIroIcFTnl7V2ZCnvgiWc/1lYZQzcERq@vger.kernel.org
X-Gm-Message-State: AOJu0YxFHxhKKWqfMgltuxfiwnoxz3mGd0V2D0/NxmoCI4CJwc1/nKJq
	dcOQrYsiB4emyaazqwMRrkfZ4o+/vgZHO6OimGtjv4Vju8BjCvx+E5h2j4i1ygh6QTQ=
X-Gm-Gg: AY/fxX6PSFP0w25ZVnpT5DToDJZsn/mkwOxxKBGFahG1myQc2AYkqC3oZHfmfIcTRjc
	Bi2FygtGi2DNYGB8B4qWrttIc25wN/BRnR/7s/kRdGQqeAukoUbTFNHUfE3Tafm7I98CRVGX4ay
	SLclXfT9Uso6LjaAk1CDrt4OQDqUGC2Sp065QWvr83Ij0TRVQky4omvdKSofakGQJ7U1Q/48wdI
	AqwXzInuXo/QuChaYi4+Xybgla45KbztgJW7EPu2GxUjW9gZ9gmHBBS8E8Ta4yatyB0hGY6E5cf
	YKW/1eJ4uoP4rudqYVK3/EgOsG68hScTT+IZeSqbzW0BV1PUQjOenm3tjzTJ0BNRGmo72dXCdlp
	soZ8+09E4IEJRYmfQx71E61Vcahkz5zIwVyIRHuiKr8Gm2W7cqWnQlswYKOYQQJCz2KBfYVp5P+
	xIIm9H8XMlrvaQpDx0OMwtFKa+ajWv1N73YW8OTfnTB0a5buqgmGAr7+HsMz326Puz
X-Google-Smtp-Source: AGHT+IHdJLxmu0+/UyOYC9vMKy7oBS2ps3RobFJH7GN6mmniuulIiVjJJaG/v4t7llHwrgOamXjL4A==
X-Received: by 2002:a17:907:6d0b:b0:b87:fc5:40bf with SMTP id a640c23a62f3a-b870fc61e5dmr388903366b.5.1768225999475;
        Mon, 12 Jan 2026 05:53:19 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8731f071e4sm25700466b.66.2026.01.12.05.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 05:53:18 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 12 Jan 2026 14:53:16 +0100
Subject: [PATCH v2 3/6] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy:
 document the Milos QMP UFS PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-milos-ufs-v2-3-d3ce4f61f030@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768225995; l=1204;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=zh3of1YDtgoe8pLqLNknTMRnkRoApxNn8uXmHT9Ljkc=;
 b=ab3LaAh0nqDakMPE7Y+uZxb7TiZnokZj/MjVglhe9gkUgHWQNgJhpTwAQV0kbZgOi7A7Kifjn
 B5zA13NSsnBCN3I5HDHb6fWcmf0WZDLqXXo1vlbop7PFojeA8ZII4xA
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the QMP UFS PHY on the Milos SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index fba7b2549dde..0b59b21b024c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,kaanapali-qmp-ufs-phy
           - const: qcom,sm8750-qmp-ufs-phy
       - enum:
+          - qcom,milos-qmp-ufs-phy
           - qcom,msm8996-qmp-ufs-phy
           - qcom,msm8998-qmp-ufs-phy
           - qcom,sa8775p-qmp-ufs-phy
@@ -98,6 +99,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,milos-qmp-ufs-phy
               - qcom,msm8998-qmp-ufs-phy
               - qcom,sa8775p-qmp-ufs-phy
               - qcom,sc7180-qmp-ufs-phy

-- 
2.52.0


