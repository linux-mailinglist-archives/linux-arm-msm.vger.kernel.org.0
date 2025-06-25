Return-Path: <linux-arm-msm+bounces-62391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31197AE7D33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 494E93A486E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F912F2733;
	Wed, 25 Jun 2025 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="av86R8yv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCA62DF3D7
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843411; cv=none; b=IXmCagOBCx2q/ZJ+/BVkJ9PsKDH0G5k76T7/27cOpdKPxWxSQaaqs7iCrq+ea4UWNm76vRF7RJhZKJw6rjn5iAJQ1owKaqQi43SxuloaYyrHi/85HJxMXPv+1GV/3fE4SwrvVzQRqMPEpcEWwAP6fKWfhZaKwUvkGl8fRsVIsEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843411; c=relaxed/simple;
	bh=lSbZQMNS3mZ2Qhlodk3BCi0I8+R0Xssr2JSReaIqHv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bTTPbm2wYvX/EPpW/RoBGYAxl+4OqYdjIpNvcd8GhWuXAub9rNnemPJnSZAjg4BPxbnykpoaAudETAfshLOhIGaC9hZWZMSToZaeiPp4Eld9bU/t/RGLxBLiVarLG86VCu3F7kch1EqtQiMKjLZctnEe+nZi/Wbg3+b1bMB/sSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=av86R8yv; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6084dfb4cd5so1235100a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843402; x=1751448202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nlprjCXzNhYiu8119hAJidFX3Tj0Nj5OLp/Tir9pgMI=;
        b=av86R8yvptx9KLSMo40dYEQvwzrpVi2kRrZRWjZll06aOluwXC4GhtmpEXJ8t7HOXe
         e7WRdcLfnfownve0Cx5nNRDtBrqHXjoitLVLGsfUoimndoT/jNzeuQKUa04WifDLHQci
         gXUjPHI0ti9vhSmsEf1ucIP/RhKEuEM86LzzteYzSSpi+KmvohRj/0ncyUA2CJIxO7hk
         +EyhA11QwI88xrt+YFKWvRxQarPKFf4olPe/dIldn2eyOZpuFmCqIYH182bMQGRuWDrR
         mXu5hyGsMy97k8aK1+cNjVMCUuSImAqxUzvkknlLYBr4v6IUjBmfioh42UvqjKzN7Tjn
         4psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843402; x=1751448202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nlprjCXzNhYiu8119hAJidFX3Tj0Nj5OLp/Tir9pgMI=;
        b=lRNgoToKKPb8MgRaq7pJ9LISqiCeDhXseIwltARt3mfd7xcZkpk6KbnLd0/09LaFvW
         wOckl+59qJpCCNLfyPeV1H/uqwTHBlPCBvQFXFt6ANfylqqVWIqJDzoRy9ok6Fb1YeMI
         /2WbnxMyeB8iIKrTMN1q1+8O4nRkbUDVDZgF3AJmOhdeNS1tp0e3gt8o6BBCYamrIosH
         wjFP298oWONylO24ULmprv3+gyfp9tvss13fsSZvRYndI7KKu8fuJdWjYmrGz+bnd1q6
         92O8Ah3/62ve3evsfPzAQXjAnaU3hDo74Dy50BnI8nGJ4o90gqrP8P2Ff4/Dy0/oGcJt
         ysZg==
X-Forwarded-Encrypted: i=1; AJvYcCUx/FiTqwuEuvARLRy/RgpEvZOoOGWy/x5rhJVZyZtAqPplqYd7zIt3uOYfYxsPqt8iHXr631c31DqZzZgv@vger.kernel.org
X-Gm-Message-State: AOJu0YzO+0PX5vvCZlncJwxsW60JvLmecPH/nqOie7gqVS15H/38098C
	iTmbbDiiROkOzgX4UdzRnzwASh6AvNcHVBHLHavAoCMQSL6wQnb4NxejqIeDnbvmsho=
X-Gm-Gg: ASbGncv5nQUpLwbI9uKugBM4abqKem9zEhR56pA5lQ0VG8k3tdrGqZBZNiseIjpISsm
	yWdmnKanVeplNa6KdrslypvZpyOHRQwGwPLupiznBC3zEvpoUDLuiitS7KBHm8rLGsRa64ZZacI
	y8KTliKCsrLHhso+/5801E8n445VzR6n3uMnDvw1YX1HQGw3vEiunOw6aOqqyeJaEL8QEMzwcFK
	/opP/OHQdQim9mLxYBCA1XJjz9uN/E4Ax4BViYOAODb0XHz1hscWOfy6rjgJG9lJzrFBDQzd5rf
	wkGJW6Jy9nbdziEfifAOQfSAQHCLT22/y6+tPJGlZWsw4duP7quZVJZdh7MNpIGOf7AwDuAnHbX
	GRVmrye5I9eui9dM2lcje82m2ugqqmSMT
X-Google-Smtp-Source: AGHT+IFMjj0Y3e5vRaQHZvxh7fHnevj/9XdkbDfc1cM5LOi08SBv192uCl1KLf+bmxAA3PmbEJU5qQ==
X-Received: by 2002:a17:907:608e:b0:ad8:91e4:a92b with SMTP id a640c23a62f3a-ae0c08724d9mr179615566b.30.1750843401578;
        Wed, 25 Jun 2025 02:23:21 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:21 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:23:07 +0200
Subject: [PATCH 12/14] dt-bindings: arm: qcom: Add SM7635 and The Fairphone
 (Gen. 6)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-12-d9cd322eac1b@fairphone.com>
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
In-Reply-To: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=996;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=lSbZQMNS3mZ2Qhlodk3BCi0I8+R0Xssr2JSReaIqHv4=;
 b=yilPxLb4+1BOE1rCFDSywXfKUexVB1szD3ZMpoPtxgrPy4d6BGvUtVW9enhV9rLTafFlsiUdc
 CU20Ge/ADStBELDiO8FCnFwU5QmqC34bwJqV2yiobXy45sPeekuAPH0
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the SM7635-based The Fairphone (Gen. 6) smartphone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 56f78f0f3803fedcb6422efd6adec3bbc81c2e03..bb89f81437d4ae12ac9fa447377d6b48e3bfa581 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -93,6 +93,7 @@ description: |
         sm7150
         sm7225
         sm7325
+        sm7635
         sm8150
         sm8250
         sm8350
@@ -1056,6 +1057,11 @@ properties:
               - nothing,spacewar
           - const: qcom,sm7325
 
+      - items:
+          - enum:
+              - fairphone,fp6
+          - const: qcom,sm7635
+
       - items:
           - enum:
               - microsoft,surface-duo

-- 
2.50.0


