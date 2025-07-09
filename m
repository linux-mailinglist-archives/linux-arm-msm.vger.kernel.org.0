Return-Path: <linux-arm-msm+bounces-64147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8446AFE3F1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94B881C2484A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 09:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFFF286405;
	Wed,  9 Jul 2025 09:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WkMktpap"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3711A284B25
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 09:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752052728; cv=none; b=iJ0t4j24hR2EExKVGVQxuUnBFX+W4cwKroJA/l7DJwTU/Uv0huT4kFGi/bB6eGrtsnQVa6RwDoVz0ftLTNH9Ov2oEaHvYC7GZbojMnZ/bKPZT4CLcC43RVjd/cg17KtEqQNJG+Ygv2Gy6qTYs/8YX/YEPQA1e6jKT5d8zin7LrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752052728; c=relaxed/simple;
	bh=7JJoxQwx+4/wfRhr6BUnD92Rt+QxpRRv67tdCjuoJ3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UV7eiUinF9FOVrCogHww3srAPdp6cgc2Yxgo0GzG2qMQ8yYbzPPaWu0z90cNiUcBiAHOrAbLK+q9IqZQGFr7zIm5HNZuNxDpbgQbM5jSY5HESvG7GTVc4AsP9Mhv1QE4sMRH9hPNXqsv/a+c8OEecHhwWNteYt/Nepv/ZTlFye0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WkMktpap; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so168232466b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 02:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752052723; x=1752657523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtyDxcaqf+W6rW1o4o1i13PWl3ydZ1ok9YquBu8um3Q=;
        b=WkMktpaptbkQiclgmBkddw6afxQXm1IZuxPDIGHC+Mkykq1l8d1si5novmawXmXP1a
         VpDihgpCJyC2Cl1R5subZPqGplDLDE1zxmByQOOpbFZk3H/aRqbRqzDluCYywL2ibOIM
         2Y9KdWPZ7Ts0jqrTda5NzdhMUdq1rTRDoTCqPlRQJjCLgASCA18XbQtlVJVDir3KEdMd
         uTwwcPPTOoCY6yT2E8+8iougRjx4bn/TzA+wqMXSB9gs1UwcMvzWPL0CarFyyLudnhyb
         4f7WMHxQNqwu8toWwbdPx6+O9S6KVu4Prl+X5YpnT+DAtbYVwYLFgh+GSqoiOPKbZxOh
         aAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752052723; x=1752657523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtyDxcaqf+W6rW1o4o1i13PWl3ydZ1ok9YquBu8um3Q=;
        b=FFWr1mObPwYhvyZr0fuLVm1HO4Ke/NlqHByeRJI3jfEQGIX86cYIpITvElXLh3zDaF
         983j3enjwUxQmHpZ9oA3BNvZL/IYOlybE0eeCvqX8rCz9F0KcD0nTPqu5rNlx6K6JBam
         tzuIwae6UNj43/LNarnmjlDOg1a8sOoS+w10qhrDMC9ybDbpX79aMKb/Zm9nonEXnmO+
         yWF2kqmL3dAFJy7BEkK0vnhRHfoR2cDMwbRCdJWe7axt0+MD4A0iC4vi6g8tXayKLt39
         RiZNQa/TyE5rL/0me3MzcZ/iRa5LBNAHNLJqG/CJOtejJSvXdd3A1F2svaEL3YhAZNc7
         imBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWBo1zfvynqfNDAvy4VXYvmVkE5rMlIOwN/s16hWh2ylX5hKG6af5n/vXsaQpZU4vf5gyYQvuvyV8q/TS0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq6YqV5XcrhNXlPCtS4bqysrosl1d5DvayAYlmbBt1LoA5nq4h
	eOargayJUNN+cQvadgnaiS4AXwJZgxVp6ik+K/uEJkyn1gYLFPkgSFi3veRou/5TfyE=
X-Gm-Gg: ASbGncsAr5LEQZYyAhmscrMKsIIZokbXlTSYvIZs36hgqVhQrT/rZQI+DKr0gF/icbu
	IUjaIW6ZIsEAiTz4+kjISD9wd5piCQquiLIom5lJ2f2hGokIBOFlF9fc65AO5905O6b4DDgHR2a
	Sos0BikSBqlqPMCPu71C76nEcqNMHG6Mn6UU0lvKAigfswC4POL/JqG+4o57kU9mi0HL9DRuqmF
	EdaDBezZhVfmGd84oQsaSxqVOH2H3WrMGvziKu4kRmvTIe7q83SQvhipgH6av5IbJc3FPLktLSy
	QypU9y5ID/FoTqb1VByOZ+VDDfvxl6JonZYwrAL9p9gbgd8jbDAtfrBwcyqN0uTxut1/26NMolW
	XJg4hDWSDbmpzGgoUPUI52La3wywD0LMB
X-Google-Smtp-Source: AGHT+IFjTub1n0rD6n3C//VfI0DUfJzgzG0dPyTmQDEg3WymTFqbXYGq9le/+InO8pAn1caBoGUS2g==
X-Received: by 2002:a17:907:6029:b0:ae0:a7a1:593c with SMTP id a640c23a62f3a-ae6b2721112mr451588566b.25.1752052723357;
        Wed, 09 Jul 2025 02:18:43 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e737sm1060116866b.142.2025.07.09.02.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 02:18:43 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 11:18:16 +0200
Subject: [PATCH v2 2/4] dt-bindings: phy: qcom,snps-eusb2: document the
 Milos Synopsys eUSB2 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-eusb-phy-v2-2-4790eeee7ae0@fairphone.com>
References: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
In-Reply-To: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752052719; l=906;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=7JJoxQwx+4/wfRhr6BUnD92Rt+QxpRRv67tdCjuoJ3o=;
 b=oqiJgUa+pEZRn08K3xP+dwnnlVdD43KZEv90EWs1Nrv4/EhFmjFjk3Ol3Z2ZY5J0FzMl9SErh
 Br1G8yHy40UB4v66KWr2gkRj2YnN84GLBloqxJIe/DNzop3jd8tCHDK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Synopsys eUSB2 PHY on the Milos SoC by using the SM8550 as
fallback.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 142b3c8839d62d91377061ade3a7c400eb970609..854f70af0a6c1ff93615fa8dc1031b4c1ecc2e71 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,milos-snps-eusb2-phy
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy

-- 
2.50.0


