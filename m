Return-Path: <linux-arm-msm+bounces-62343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E42AE7C0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BD021C2014D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2762D6633;
	Wed, 25 Jun 2025 09:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Ffu9byyg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E5B2D5437
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842798; cv=none; b=tXkRMfjMc/nSMEo+1XlcO92y2ghK8iS4Re7h4Pk6gZjBwgsuO28dx8BJYP6vhoPALJTJg7FXEnNY8kZGGpXacYCKfkPq2337UT4EERCEcH4ak6TwTtWOcZtSBsDPmgC7DRKXnwV+ZJTzw9Ln+LxwR3Wpr6kguHMUSsPB7gxKFog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842798; c=relaxed/simple;
	bh=1JOfni8ZkAlhqNEZCQ4qgaOEPo7rOylqXJtAkm0jXyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sEkHiH1fnxPESajZLywzrj9NS6Xl8efw3bC7BDZO1Y+RnoGWhGB+ewg7VVuerbTSx07mEqx5sI0LUGWhniIrTyla7BbWDTwK3zFkxD+LHqRixWcwAG4l6OBnbCBliZZHA15SWlQnM98v0L9i2z/59I1e6B+QDuzfaoebWoKrcSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Ffu9byyg; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso972457466b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842795; x=1751447595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lF9jCYL0fjCtKteHdI1tv3/oJ2GPGAyZAnvXAOR5VA=;
        b=Ffu9byygsxI6mHBEtUUCTsq0r3/XKSJ3KBn63XdwsE+bqWWYwk1yZNn+4PBZoaVjRH
         UxjZ+NFDFbHNm8eygTNLnHw76P/80nOP1eKPo176p1/4P9LCXwKhpJWVsMaGmsU7nTSt
         zqK3PjArsoN3gb/mHSeQ5sbmESn+xe0VbnMRYtYtPU/EUoB2aFzSbr+qwF1g/zqAjM5S
         LBkpbPRjQkuyQtCMF1z6NV/SC4mgkQwhqhC91ldEBSoijQFL6YV2lC/2GoQRQD3Y/ws8
         kdqHpPXl0ajXG8TJTcNjDUVoxD9ObD9B/Hd/3hXz5qd9L8cMvIFulCx5EWjcK8CbIJ2U
         RrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842795; x=1751447595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lF9jCYL0fjCtKteHdI1tv3/oJ2GPGAyZAnvXAOR5VA=;
        b=mkqpV6dBUYFsVq1dbT0LKNrqJpkzhhmFnvA6IWNz8CwUfaw6CpPVQStDgkPmK/d3wV
         uLRmWVXIz8EtA/L9AhmwIB6pHjTkqVHjp96Pon5W4kq+RxOGzbYVVFsjo8TOA/BqRLu0
         WDt7+27Ovh8tbqWbp/WY3dlfl4cBuOeD+G5Liyuw+4YIl17eGjEM+Ml2IEAqBogTegsh
         g0k8DiIQy8V/ziW21qU+M/u6qpD9cXQfio6q10gkhwjIUlQ0t6UEGbHwH5x9cHjB4URL
         pwByi1Q0ugnbVVuM/QGmCevrLvH+IUcGStJq6hK7PI6NLMteOqn0XHuY5LY+IVTBV0wE
         EY7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUajoT0TSDa8W66JVgecM6uL4Cga3x1hZWnFRbzEEzp1Du8J+xNlzraqdjfZERQ0htDg47+S8PSy50oC0n6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ygjE7NAd6eR7Cl/2KhF2VLrkcGTxuKeH7/FuaewQrXCVfcI5
	XbIrfLGzxglF6lg3WMqG+EgCM+huwizK6/zbPMU2V7qgtiwkppky19vPMS4/N31LBto=
X-Gm-Gg: ASbGncvTYerSjeA2zqYz0UgMXqU6dicU3+oqwnTMKLXJWSf2zL2zM7IO/bNb9oz3+44
	E1pwbgmZVqVFteZOqVE2Aqn1A7t5MuXm7K+EP9bqdrBsdc2LrkEwOZ4YQ5cILR8fCATXp34i1wY
	7COOCORHy58Fzu4MZPJ9JQbTI4bCQjfwJN/FtsUBc5aG6a8cFAYJq+XPeoke//618V+KUoquUUS
	I84RjHPAD4MRnSZJK1ks6r+SyqUU0Opo9/ZOohQAvhZqrHUZOWul/CBcpU27ZDObdEvtuymGn+/
	4knruGjGs3RNEu2H0pkOrfheJe38XhbuAk7cYK7MWwMD8SR8jmOryhp2skTD9gH0vyT1y1plIs3
	auE3LHOVX2/qtzUfUUikAWx38zQJJl4Wt
X-Google-Smtp-Source: AGHT+IFPf461EnwzWCAllVo6gIU16fYgAoPXHUvYcyIX8YNtmHi+yAzHTOgZmKCIoR1P6uPVIJzgLw==
X-Received: by 2002:a17:907:3d0f:b0:ae0:bd48:b9ce with SMTP id a640c23a62f3a-ae0be7fb932mr201771066b.5.1750842795252;
        Wed, 25 Jun 2025 02:13:15 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a93f5e96sm272499466b.74.2025.06.25.02.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:49 +0200
Subject: [PATCH 3/4] dt-bindings: clock: qcom: document the SM7635 TCSR
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-clocks-misc-v1-3-45fea645d39b@fairphone.com>
References: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
In-Reply-To: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842791; l=839;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=1JOfni8ZkAlhqNEZCQ4qgaOEPo7rOylqXJtAkm0jXyA=;
 b=ZN+/dA0VomKn/kWmMDuNthqZKs1tzKqyPNj7BwrbYWGGfV4zAo4FR1LtEZ+SjLFcTk3tItRzS
 Fj8DufRZWs9BEVqAeHiZwe5w6NuyuoICv8vZnIzrY5EaUZHi2qp5YER
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the SM7635 TCSR Clock Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index f3afbb25e8682de83fb16acaa35448545f77ce77..f23a32befe4e860336365a17fd56d3ecb32ad44d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -23,6 +23,7 @@ properties:
     items:
       - enum:
           - qcom,sar2130p-tcsr
+          - qcom,sm7635-tcsr
           - qcom,sm8550-tcsr
           - qcom,sm8650-tcsr
           - qcom,sm8750-tcsr

-- 
2.50.0


