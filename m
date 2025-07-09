Return-Path: <linux-arm-msm+bounces-64145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B073CAFE3E6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5991448762C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 09:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1957E28507E;
	Wed,  9 Jul 2025 09:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="5kOdlUBY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AAE275867
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 09:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752052726; cv=none; b=l+STVjoh3DW6ihyrC90MrlJSF2s0kIATWD1aLymECqkoLnZe3iuaFBI1mrNYpFc45rOP1HK0FFUbJjEcFnYY3DUKhw7Kguxg1JwirsAphOOUE/nx/aJBkfg7BYvq7sAUsXMrke4Dz++QHuhSNvqZnNfkphJqRbW/902+UQukcPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752052726; c=relaxed/simple;
	bh=N1DuyPNcj5JKCc1IHvUuzahkrwJboCfhgqDrPUo+Zic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S8MdwVK42+JW1tDmB5JYkOgW6ligrZyR46OG4wEE85QR8CfeihN6EoijXXi+CSL5dJ4dwIGBCuy+fbZ0Dg/betpYEt70nYUGWGBhrymjys7+ZBuFl9TtLv9yZ2G7G1hXHA+9maC1Yth5cTF9vp5BfGG78Tf/GgJB3N/MAo3jnFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=5kOdlUBY; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso1139311366b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 02:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752052722; x=1752657522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+YzGffSdl0SelALHaNtnKuFhO/J9qLrb0FjuAIV2ya4=;
        b=5kOdlUBYcOsuIB/hCmWJxrif+7v7Ne3pKpNmfpcSf8/diAlBwk5iIcjTJIe9QS47wc
         sMTlH9H72c6pQ+j5POhsHs6z49htzyqoR88BJkwKdOeGBIXLE8lJJNumJ3c3DGys50uu
         u7ofD0Udk+Az8BE4+OsiAZ34qDjldOwSU04iC+crYiw+QfumE/OE/N2V2nEPV1l4UtKa
         Ar+z7fxHkyAt+95b/EDfiOOsAYXyQg0WavGqIX1U90JEGNxzbuSRPqNodlSE4K3mw4jB
         cxmqF/zPaxesgLzjUSZSfJ8APMU0QapEWyT6U3HxlyiHla+ih8WWnN0xStTX0G4zm7No
         rpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752052722; x=1752657522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YzGffSdl0SelALHaNtnKuFhO/J9qLrb0FjuAIV2ya4=;
        b=DsBaeTCkhux3vPtIEss1hvn8yHVLxpLqfBIypuhfiPspIeYnD9jcHhMbMVHvDzlDaS
         zAKVGhq/2N+3wergpH1N3svxzp23GZX5OsKI/hq0OxChZsbsXWX3oxi64J/l8Kzk7Fml
         99+qluq3INmPmcRQt+Rc89uHJ3DibIWFPnCWsxNX2anFWIUcbw1l9NDhWFU56mDLrusV
         Lot4oJ0NsJNK0RPuiNiCyEw0wQLzNYoDf+emxQZ5edWxy4Y7+RsPLcZ0K19+zx3f/d1x
         9bUvBwM1vwP7458mBj3sMnFSpwKmu/XH+JLQ38MmXTq52Qsvgg2g4UMKaKUrgNYiLZEI
         YYLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYD6oWZ201f0QAOlkcr0gjonDRyoxLLmZpAq4+B3GL/93t0uFlXbmSZNvKUTXAQ8faDwVmsrRbawIb74vH@vger.kernel.org
X-Gm-Message-State: AOJu0YxL5xbitsodQ6De7Zv1N+RPoTQqKHTDApsrIWoi+JNtNFTpG7ke
	Y7qcbUmTH4t6vD+vRjFFzs3804p9wfN7J1qhNSLyAKb8bLw+nk5dhY8ecR2x+n3jhPs=
X-Gm-Gg: ASbGncvejN06W3DovtjBc52+rXFE6UQ8Qqa8/zfiRnVrpB5oMYHaoxD+fpA0yhoijFN
	xXZesDSTG3KRj7h+tX58biB/2iGU6gX+OFe9heg+UDcdMMuUvJjskbsgcKPacC9WfcpQ6Shq0h4
	Wdlbj/i+stIY8+uVJyRSQDL91jmAc3H+0Ve/qfrU+3+4z8s+3kVr2NI8MixXXZi6lzXRqnkF689
	Mb/a5mYXNwHYxh4TLH2pVTRouhrc2v8ZJwHkENdamQOQchJurw8bvk9XjAU64RFkm/IkW0BDfnV
	ipaU8vWeQZVUlBcGssXHpgBxsX+yNqtbrjehWDNAbllptaZe0bLHOJ/HB0PcV063e9R5isu/DXd
	8ACRMV89pFKR3m8Vx2q+GnJ3FMP0f4gEU
X-Google-Smtp-Source: AGHT+IHxUaM+C2R6jkXjJD6rCqMOZdTnVavMM1pgYMFVzDnu9HtXv6fIbTrykY0qZGIVD/WAolgKPw==
X-Received: by 2002:a17:907:3f17:b0:ae0:bb16:1cb3 with SMTP id a640c23a62f3a-ae6cfc3e135mr185121566b.51.1752052722372;
        Wed, 09 Jul 2025 02:18:42 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e737sm1060116866b.142.2025.07.09.02.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 02:18:42 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 11:18:15 +0200
Subject: [PATCH v2 1/4] dt-bindings: usb: qcom,snps-dwc3: Add Milos
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-eusb-phy-v2-1-4790eeee7ae0@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752052719; l=1258;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=N1DuyPNcj5JKCc1IHvUuzahkrwJboCfhgqDrPUo+Zic=;
 b=rb96OCei+nJnNOyzP4b1MNdnFGw98NO2wwz7mhvHHcJLFGHhCzGptxQ88EaQxQvSSui0OygF3
 0BbqX2XwpQhAMBbPnBeOAM30ehgBH0np3JfuopEX/Zk0s7vD8pLqeUn
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Milos dwc3 compatible.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8dac5eba61b45bc2ea78b23ff38678f909e21317..dfd084ed90242f0e77cb2cde16023c3421c5dfab 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,ipq8064-dwc3
           - qcom,ipq8074-dwc3
           - qcom,ipq9574-dwc3
+          - qcom,milos-dwc3
           - qcom,msm8953-dwc3
           - qcom,msm8994-dwc3
           - qcom,msm8996-dwc3
@@ -338,6 +339,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,milos-dwc3
               - qcom,qcm2290-dwc3
               - qcom,qcs615-dwc3
               - qcom,sar2130p-dwc3
@@ -453,6 +455,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,milos-dwc3
               - qcom,x1e80100-dwc3
     then:
       properties:

-- 
2.50.0


