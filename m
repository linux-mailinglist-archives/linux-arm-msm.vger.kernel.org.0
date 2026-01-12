Return-Path: <linux-arm-msm+bounces-88576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 420DBD12F45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 14:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D69FB307798C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 13:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571C135C1B0;
	Mon, 12 Jan 2026 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Ci5jx4i4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2074C35B157
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 13:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768226001; cv=none; b=J+E0HQPOwR7NBa3bCGAfepm4IOSSw4LafgSo2fHEAPJpFIbMDEqWZnLV5SNIrDgfoo5NcQP9CZgdUncdiS3EP2butqAtnJwtn0EZNp6bHGRyghoB1SdvM5HyO46u3VMm1NT+6v8Fqem32DH/pqb9An2qKkG4AMKkYAmYv0Z/pbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768226001; c=relaxed/simple;
	bh=qxN/7SFXQgGYehqBL9aUXI1J2mEyleNlSfDJOc+cUfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hbilkZSrTAreU6MwaUWJzMhvD+/PWyuPldk+S/Cxl+sY9RKAcpwOGaSr1UUQqH8k9+/d9nEubCi+Z0HBPvhHEe0d0In7/6GFCnb6F8hl1422iKRjq/l0SrDI0mD1WfXwb6LeXa6MP0P2jE439Xf/6XyB+gZ6zkadTeUPkf+zCvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Ci5jx4i4; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-64d4d8b3ad7so10501465a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 05:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768225997; x=1768830797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p6GBn7KiZoLHRbB+eXZ1LBCN30jAII3dIqXdIjZE+DM=;
        b=Ci5jx4i4kBvNw4Um7TQF5M4EvSRjawQQMfERBEl/Hozpiw2R51VjDR68WDTw6MKTYh
         wf35WKtTih69BRNEOJXrGdpO8NLdOgsWQSeW0hDs2GENoeJnhjRVczN+fGyJ9XiejK0x
         XrWMaWQV/wuNX1lKPgT2fBGbZJSqAF+e4YTdGpCOTdp/gzoqTkQYhbwTOtHTK45t7GCM
         PMEpzwWZ4i/7xo+AlxNd6BzV9HoEJAJjP2eubryW9H8H7sRVfVNl6DIG+UVjY1/+c1OJ
         okZfo5ftkT5sPmH7r3knud0XWnYp9qkCEkg8rrW2iGRTWij/EC59VVn9BNaUgjKY9cy6
         sEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768225997; x=1768830797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p6GBn7KiZoLHRbB+eXZ1LBCN30jAII3dIqXdIjZE+DM=;
        b=w+ClnjJmgzzns+33c8HSZFtP6zrxWtunhhV0eyFhqkPtnZDthxnA8Gf8ZyLJZxyl/E
         FBJKw6BFSJ79QbJMCGxfl7huR5SDqL9Vq5/hxoHjKnGcLVvB8Y6b2s1AXgNqx5xmm596
         KtlAGsXB/kJrsjZEfDMboV+c38dfDwZ4Dckq0uhUtVsOiMUCG7LtdAaSHFigyGfD0q/k
         bZ2jimxEc4MbM2bRjPjFp+wWpw9jNMXD6zMCoJRiwwyLksv4cxHdFu10zlmeMIqg6SL8
         H1i6lq0UUSn74AdCeFyKJszk9CQVuPEKkdfrrk1moGs3Jv0sAdhzP9NNWojqzcFHmpnt
         K7jA==
X-Forwarded-Encrypted: i=1; AJvYcCVYDIEKPfGmDphf5zKg+4j1rI5C3p9yAfWTViS+W5iUrRt9b6taOuQXFQ23USVfabaSGJL8Pf32R7bLczJz@vger.kernel.org
X-Gm-Message-State: AOJu0YyRm7L7nTYcmDlMq2NqYAx5nooMXCuxsub3K5vdiX79v7yHcrU1
	K/E+Pae6wb7JkZ8KQ51QSwos2cRbtyJEvgsQI3qGTyDoMUhopPt3sQ0MKemgUj3OErs=
X-Gm-Gg: AY/fxX6Rqe6c2or60jY58ZOtGIBOH3AwMkJW0X3lOnsRDfDxogLZyqukD//MmENbqv1
	/Q+LnY6Vv3gjk5WkF+5J6+fIc+85LoSgGhOXAaqtvoqoRHc3LRqdOTyu3Va8GhFjQH/tYEmnbfR
	rX8u/FiZ21sWIyCa9Nx9v4HU/b5k0j2yEI6bPyg3XJHjKhMSNQYwv79uusgCDITdp9aoFUILaz+
	z4NpTpYlWd40oCTM2feYwKiu46HZhHlGIevyLvEXoQaGwpmN9xpBojApY+81G5MgCyJtLgNR3fK
	gu38Eke3+oeIpPDvFZgsw13buk8pxuahE2HDr782wbT4Mf3BAmGFFJCoB1M/b5pWqc9fHNcwDx2
	YmbgP0BZOrkG63cM3auURsdEV+rL/jhaFYF2fNbB7AX5r3Ujdd69KUH9W9dpKPgxKBiY/ZrIkz8
	jXvQgoGeD3G12OouVBoSZYh0k8JwbveyAQWGsU55cAQ2+3zZLEwztvxvefV9hiEAKc
X-Google-Smtp-Source: AGHT+IEd+nXuoyJH7y+5irMovJmQYLD5UodxDOlxMBwAbUiTSj+cIGE3y+/oEJNpNUV3FWxwU1bJFA==
X-Received: by 2002:a17:907:3e83:b0:b7a:32:3d60 with SMTP id a640c23a62f3a-b844518a88dmr1900919266b.11.1768225997580;
        Mon, 12 Jan 2026 05:53:17 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8731f071e4sm25700466b.66.2026.01.12.05.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 05:53:17 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 12 Jan 2026 14:53:14 +0100
Subject: [PATCH v2 1/6] dt-bindings: crypto: qcom,inline-crypto-engine:
 document the Milos ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-milos-ufs-v2-1-d3ce4f61f030@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768225995; l=978;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=qxN/7SFXQgGYehqBL9aUXI1J2mEyleNlSfDJOc+cUfo=;
 b=+6y4wusQhtRueAHKb3ZVs4ptUD/5lU0HvbI8iylXgKJDlb89tUPOMEzoqIO5WEYaPfvbSmSYp
 Pq9sp8tM9qrDpSD5sTGW1dElYTST04D3dJj3ez+bzIGdUXXzHTuaQbM
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Inline Crypto Engine (ICE) on the Milos SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index c3408dcf5d20..061ff718b23d 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,kaanapali-inline-crypto-engine
+          - qcom,milos-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine

-- 
2.52.0


