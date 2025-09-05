Return-Path: <linux-arm-msm+bounces-72256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B82ABB454EF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92F665C17A5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C74306D2A;
	Fri,  5 Sep 2025 10:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ZcwfmPxg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA3B3002A4
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757068866; cv=none; b=NFD50CKTsC+EL99yG3IKKLfIKZg9au7lbMtqMKOE7ADyQ7ud37qhaH8lY1V7zIJr8eGnqfLVTv4mN4YESeXAyQRwhYjTlwYvdRBNMQNOdJhJFqCoNZjXOm76Tw4c6jeTdwBEHqXEjdoEIDgNaLoIP2BvrQqHjeLOSfKe7i2LMDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757068866; c=relaxed/simple;
	bh=UimigBuUtMxs7F8gG6umklkndUZUFsafBa5o33+qqu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dkS/PM0AkjZfyLmjpfA/ueUKk+btC9DMyZL9Lp1mb7rv7mGPWkWeimDCzdePneqpIJ6HhZdfeM+vxcp8JHATaBWP+ZyIym0wWH5OyZfamNlCjoEYA3SqhoPKYTKe6yTNxg0jB6nphucxZ1s7RS8BDpPSs0ryZLak+VyGz5SRl1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ZcwfmPxg; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ceb9c3d98cso1203864f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 03:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1757068862; x=1757673662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4h7YaMzyJCzszrOQdboJaFyzXH8sFl3aopVTcpiY4P0=;
        b=ZcwfmPxg1kS7c4snlPFJGd3LpftrF0U4jOpMYyjkvXjXUhoB7GO4x7mwEedpHIGaac
         FcjWCBH80WKu9FwZ+ucf4GqwMtp5K++vVKguT8RLEaE5lrcY02Xmq/Bh7eS6yUM2t4Vc
         8aI+x+wV+lQZr8Nh1JBC60cITCIdfri5tpxAncb8erHY0IrYQAM33WlTwd9GzZPU4LPJ
         oM/n+gmfXBQNn/+7lOPnrvXOuU/a9ynpC8ZHeXOAD+HS5PMiLr9X0bVa+K+U/jCrBd2r
         Gh0j+uZCPbHi0gPt2zOuFVFPfECUufWbLy6lDfshjqzeUMlZLQu37VW7yUA4KC9AD4du
         MEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757068862; x=1757673662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4h7YaMzyJCzszrOQdboJaFyzXH8sFl3aopVTcpiY4P0=;
        b=TRYnqDGTFq/xa11cF5mqDgRKFmWTZP1n/ZRJzFrPJT//vL6IyXffc3Gq/SxtsEC8AW
         2pWVQNZylkbZoKFRZiKtCaxWz7nrtE4dB70MiYHBaxYHuIT2VVmPv4jBa4SNFQxH3sxO
         t68JmUqlowsZ9ZlUQuNZIwKsBXgVmOjZwyanq4pKLkKT2G+XYHWTXBmsvFj6qgsm821I
         7IEpsEPmGtmRSRoVW9FfGuO355ycxzU8EuGdSuobR86XMf3md+aIGlJpCtxjXakEz4j1
         UTuj7nFAezvpTMRqMKQwWWQxvSQaj9r/PJcVpqdAtNb60FJaX4D+s8oylseYFfv/adrU
         tzwA==
X-Forwarded-Encrypted: i=1; AJvYcCXZp790c74dWwq4YYP9jA3qZzF8bLMRa6ifJe3BN2M/lEb44F8KcBhJAZHY2cQG27Ao3+mfYBHOuRV/whFh@vger.kernel.org
X-Gm-Message-State: AOJu0YzPcq1heYtn1koYYwtKUn7BgiwO3irGbH15XBwOmwgdZcjjGHMb
	E7mk4esKChClSaJHvzsHL2LF28X8FrZXP2iaJFrtEfkMhqwY5cEMPP8lFZLNgMJLeM0=
X-Gm-Gg: ASbGncso+t7tFDRM/7JWyFXc5BExmDprxM/76P6LSFwqCopUYzu5atcJAOymvklAXps
	0w7Eyn6+kQZ9phebnlKoQRmNDFX2bMz6vBGv6In63dht9KBRAWqnIXnBw4fb5a1+4n6dz9lnOjm
	M5la45hs6YPs/ZSjAz457R9eEEE5pSReXdscyKpMybk0HcRNvIknfl4UpAUD1y24aniCfTmNqS7
	k3gXNLKODkIjZe+Zrj/4IAd59/IFyPcexZk6chda2JfFETmSsmqQhdCqhy3xcY7Zami2NwEQg4b
	T+ogIczwQqHfjZS8yLFTCy72M2RatHCsGZNNuf9j7vn2orTBVqYj9YXhJ/HUXygcGaxAGpZDKBM
	grFsbzY98sznIvHdi1PoQLJMJ54udZ3lYWVoYji3uJJDbZyn+Jej8EQzFcUpWwcDpFYVIh3UP3O
	491T0Er9PtU4MHA6CKsEVI3cQVfho3/w==
X-Google-Smtp-Source: AGHT+IGtbARUvUaTJ4NIeSDeweSSytYiW6yHSoPrHxfTOVtady6hveXqNdHAZNNKJxa9x3TrxVsf3A==
X-Received: by 2002:a05:6000:24c7:b0:3e0:152a:87b6 with SMTP id ffacd0b85a97d-3e0152a8a00mr6371616f8f.25.1757068862097;
        Fri, 05 Sep 2025 03:41:02 -0700 (PDT)
Received: from [172.18.170.139] (ip-185-104-138-158.ptr.icomera.net. [185.104.138.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d6cf485eb7sm20990738f8f.3.2025.09.05.03.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 03:41:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 05 Sep 2025 12:40:32 +0200
Subject: [PATCH v3 1/7] dt-bindings: cpufreq: qcom-hw: document Milos
 CPUFREQ Hardware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-sm7635-fp6-initial-v3-1-0117c2eff1b7@fairphone.com>
References: <20250905-sm7635-fp6-initial-v3-0-0117c2eff1b7@fairphone.com>
In-Reply-To: <20250905-sm7635-fp6-initial-v3-0-0117c2eff1b7@fairphone.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757068857; l=1212;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=UimigBuUtMxs7F8gG6umklkndUZUFsafBa5o33+qqu4=;
 b=DY1pFCOuq1avbn5t7ZPvcE56wWF7XIf1yrr3163XBBi/yD3M7RGi5JrUxggImZlz8IomMu7gf
 B9cbK5HaeebCOw3btr4WhZILE7SRIK7H7piwrfjlehWfycKYwf+7HoW
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the CPUFREQ Hardware on the Milos SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 2d42fc3d8ef811368c990977173f41b26535e0c8..22eeaef14f557d615b06ec13e71daf86018fcdc9 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -35,6 +35,7 @@ properties:
       - description: v2 of CPUFREQ HW (EPSS)
         items:
           - enum:
+              - qcom,milos-cpufreq-epss
               - qcom,qcs8300-cpufreq-epss
               - qcom,qdu1000-cpufreq-epss
               - qcom,sa8255p-cpufreq-epss
@@ -169,6 +170,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,milos-cpufreq-epss
               - qcom,qcs8300-cpufreq-epss
               - qcom,sc7280-cpufreq-epss
               - qcom,sm8250-cpufreq-epss

-- 
2.51.0


