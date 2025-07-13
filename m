Return-Path: <linux-arm-msm+bounces-64694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0FAB02F82
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 10:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D95317434F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 08:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5D120D50C;
	Sun, 13 Jul 2025 08:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="N3gZsHt7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732A81DF26B
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 08:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752394014; cv=none; b=bfMRjXEr4S1EKNWYGEt5mo6rBdZFeCOTGNWcG/F06hdofKI/GZk2d8gc7RHRGS+q417BbXLPzUAqft5NVN3l8JEj/hv5tEnzna1A3eSrDQREhatADNJNU7v5cp2sPCX+YWXhWC4Or55e87pmRI5tefdQAPQrHsvvnJL13p2WVKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752394014; c=relaxed/simple;
	bh=Elfy6tnJleoo2wYkconqwz9MsTMigTuOtLwwGmq+1oU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ErQn2CnI73rvh6Ty8ytSRhhNQytE8xsLlGmySgbSJ27tNG+XY0B1OVrCiJ1eJFzNpIXET6RXbVZi4H1nhg6JSg8uhDZkGYeYUUcSFtgNSZ1Y2IwCao29N78nBoB6eUisi4VY/+lNFZ2ZGQcuuW7vvNpxTNWb+53Uo8TJk4FnCCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=N3gZsHt7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-456108bf94bso2899775e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 01:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752394011; x=1752998811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAW08S+Y4FxJpq/IdHakejhpfXSII54ErAoQ1lsTS5c=;
        b=N3gZsHt7V9hqmIcHZvDcCJdstid1626nMHcQ5wB9717CeCe3HvPTccBSZP+AeI8Z6u
         4ckINECSedmZCm3I+QThA3zguJU89ahIuhFVrdNzTvKtB1ciD23FHH2fWnj/Nn/I/o+4
         7U8Ed3O2+r88qjlrjjztgwbHEp+nnQY1HUx3lV4bJskQb+exKJ8sbNER8c6QOhygejI8
         RN2Oe5c4zp1aBxPUnHjXbCO5EwdYOsW5erhABSU9V2fa6DLCtZdFCeEP/SXX8rbnVSKg
         PeHE5yHL1zKEiUXM+Ai5uE3oEPbujXEDpL/1Ihb+DhtjqAsnCO2P6v3oiImVLj+LqC3c
         z61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752394011; x=1752998811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAW08S+Y4FxJpq/IdHakejhpfXSII54ErAoQ1lsTS5c=;
        b=xK2ghspApPBSMRrzqj/iqTFGdH0Zocmg+ifaONOj5S4XEhP9JQyxnqHkvmyLO8c2oX
         hYhfOFgqa5PsuBiLbjGvJ8JEMQLh7iifKxB0Gp47hGw4yXrR7F691YU10t4DAH8G2iRO
         cdxEhXM5qzSIGskmDWweZqvJT0jWPPKnbc6p8AFlzNevvHbWiA+dAvBNyt72RWIbxMPs
         4EbERsYjaGhJyu12Qt/hhorybz1X4zGZQhCiEadl2ApXYlJaLRwOj4YnS3hUVVoq8B8E
         qOJ7IecPoo3FFWRHbvqUBW5sITb153O8QVjkyqa65XtmhdexPZ2uIeT2cjqVEMmoTpCQ
         h7Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXrnZxNlsGZoNBCW/6Qaeou+Fx5BygGZ7pnz5UFb1cv6HVb2sE/2LXPVHL9QrXSgqBsXny37r14J4+ZTTgt@vger.kernel.org
X-Gm-Message-State: AOJu0YxOBlipc7ymXpIIQDY8hjQTPJJpKSMkVdKMRg29bwCqsP/ML/Wd
	N2oGKQv7NTIi2NMFHWZbCr4/iI+TvAZmhCglssTxXEMmx8l3PGhaXgQew0tfM6Iuoh4=
X-Gm-Gg: ASbGncuXHASiElvFiwfKlf8jsp0uE61WKysmCTdBcIoDSti8PnssULCllbRoezadsEr
	+u8gPsocTquPfFbm8u9jJs7OXkaS1a8+o9fPS02uQ4w9oYsHbEFQXiuFUEk2vx4HeQSxR0sjYiT
	qpTvaWeULK32RDn9ptUx1WVLVgSXu8wt3qvWDh5bbbPZ+Ynu/2pO4u4CaYD43jAF++pTDJ77iZD
	v8BwE/ipLnx4nT+PAUfsgDUj/DPjJC4ceVGsFNN+chMdp4l8WOSeRjfV8uluV3AchZoV7bxbA0j
	9hDG7Iu5vFDuOmQlSqiGplXwj5gQf5nh39eKeB1Enf84ng6Au6jdaysxSgOGzwO0oB7HmOeKbCJ
	RlxRzSD+cR8LtYsyGnG8B8I8dtHf9YCNHcWJr
X-Google-Smtp-Source: AGHT+IFzbSLLoq4xPNfOGVd8sTIPd/t0yDUx4KghGsVDwxM4zXUXdUnMHorpLtbhoNnu0OiVsDGzYw==
X-Received: by 2002:a05:600c:3512:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-454f425a934mr75835865e9.33.1752394010817;
        Sun, 13 Jul 2025 01:06:50 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:06:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:28 +0200
Subject: [PATCH v2 06/15] dt-bindings: mailbox: qcom-ipcc: document the
 Milos Inter-Processor Communication Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-6-e8f9a789505b@fairphone.com>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=806;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Elfy6tnJleoo2wYkconqwz9MsTMigTuOtLwwGmq+1oU=;
 b=T2sEIpk5VLO06Z/e33bFZTdbkdzXowfc67kVkvG9wOw56FtIAb0kMpA2M7/tW/buZQMtHaZQQ
 Pon1YBhAc/uBXmxbSDoNOEBzgAwqhggF7KCZYb3eZ+GNZX+lwv3/qKq
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Inter-Processor Communication Controller on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index f69c0ec5d19d3dd726a42d86f8a77433267fdf28..e5c423130db67109355d7da3e51e1eeb008dee84 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -24,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,milos-ipcc
           - qcom,qcs8300-ipcc
           - qcom,qdu1000-ipcc
           - qcom,sa8255p-ipcc

-- 
2.50.1


