Return-Path: <linux-arm-msm+bounces-17338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EE88A305D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 16:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81CF21F244C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 14:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED6286252;
	Fri, 12 Apr 2024 14:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="MABhp0+q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A8F8615C
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 14:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712931600; cv=none; b=BAgcfp4S1KszYAjSMHhTBH4mwq6jre8Ggos7AwP28sgeka3HMKEr3OHkE44v2jjxN07oCGTR8/tOEab5QlWg2Ru1alr1lyGocK0t2NyGT8F5Xxr4haQKhmWU72+KZkE+AAWpCE/VdsA8Mj90P5YNwbs1Q9gU2jTatxwPLweB9TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712931600; c=relaxed/simple;
	bh=6UZg2PMKGEVFmidiPHnfxY1Bc8juCTuAW/lviqlEAgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FYfZs3zYxTHjtEnEiYBQC4Gxv0ba66zQHPoy7P6rvWNwZ8muHpSdT/A0hAMj9bA0l/or+FWsZwAasOTLEZbbB6bIJzrCr3ggz+uaosrHakjqyc8GbK7h9aWgJP//sB7Ad7oORDqONjJ1EgeHQmnNG4m+/ipO0XF3A+/WfoNcYyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=MABhp0+q; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57009161122so259798a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 07:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1712931597; x=1713536397; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YQsE65kxl32daih06Z5LQ2GRCxgTRsV2P+cCXBqOo8Y=;
        b=MABhp0+qKXr36GWUembLKrNRmTMDFfU6wxB2lmMVrIidlcB0rDF6ozzpsEVl+c5Lxm
         4xPZxPtAZHir8p7z93kAzG58N1elayR0mfnePdwWa7uFzhvqLyouFzWqmQ4vLOYAUAYz
         MbYuhvvsXP5YSNKGsHGTtRtXztrEEJm6FSP+jNhqjD2SRuBKZMvks452oQCxw8g4ciFo
         enctp7x+BXtyATx7XwLX/X+T0WnuwwXWPZOKbcjXu8PtglSBKShzkBHgHboLZIbUOudw
         zLDNKbYBUP3siKtBWJZNWNZsU+y0HzgceQEWVy7dEfYIq3AQ+p35PlM3btu4WVkAC7ic
         thjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712931597; x=1713536397;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQsE65kxl32daih06Z5LQ2GRCxgTRsV2P+cCXBqOo8Y=;
        b=ZpXCA7Wq/nHpTTZM+CxnCzmT7GloItWwjtK5sWHQdUiiUoq4Rf1OvKMeXtZsNJ07Fg
         I+fpddUZI4Z8NjpXXUcSrS6lKbG4NWONLN7xOFKJcD9mHC/Cx/Q+FB4+IhKXFGqSl8C4
         NYnuMIVwAGziO8Xxuh8oAUh1NAa1rOhY6eoxNMNqD4BYJXWV5avrlyR6wqYGR3kgQXZE
         0LIUV9d+gstvFZXZMjeymG3f/tbxQStyLWqa4N2nK13oiXAWuhJjRhTJjs4PbyNj60pt
         0cJaf6TISDPud3uYfQupH9n6yebqEHQx5dIaWvAFlj9Q9PAgdLA9GDIjAMNll/NWFWLg
         45Lw==
X-Forwarded-Encrypted: i=1; AJvYcCW4dswGG2Hh6FP0lb8kvgHbeoCrkw9aCzDeOnqUQDENmK4onfY+8wS5pHQF2AnQTxGaNfdz+atSqzcvHNlFsQ3zbNrOj0EwPvgg6ChAuQ==
X-Gm-Message-State: AOJu0YzyAiJQMT3CNCRX9eF1gC60AGIA7CrpGkQwB9v+/uNcoDQwr+W0
	ITLHVcop0amWJjzVpBGWYNgOeemlHGAVVWX6oxHsn1dEvM23G5MVgSEGImG5PvY=
X-Google-Smtp-Source: AGHT+IGKj8XZqLdJ98ZKpJeEDnb8u+b2a/tdKdHn1TQCGxbINivns7Z1Inoz6n2Zx4JNYGOzijn8Qg==
X-Received: by 2002:a17:907:c29:b0:a51:9304:19fa with SMTP id ga41-20020a1709070c2900b00a51930419famr2005912ejc.70.1712931597392;
        Fri, 12 Apr 2024 07:19:57 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id pj24-20020a170906d79800b00a46a3ad035esm1877005ejb.179.2024.04.12.07.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 07:19:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 12 Apr 2024 16:19:50 +0200
Subject: [PATCH v2] media: dt-bindings: qcom,sc7280-venus: Allow one IOMMU
 entry
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240412-sc7280-venus-bindings-v2-1-48ca8c2ec532@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAVDGWYC/4WNQQ6CMBBFr0Jm7Zh2Qqp15T0Mi1IGmIUtabHRE
 O5u5QIu30v++xtkTsIZbs0GiYtkiaECnRrwswsTowyVgRS1SpPF7C90VVg4vDL2EgYJU0bDhpy
 1htTAULdL4lHeR/fRVZ4lrzF9jpuif/ZfsWjUSMrZ3mnbeqPuo5O0zDHw2ccndPu+fwHfYHCFv
 gAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Some SC7280-based boards crash when providing the "secure_non_pixel"
context bank, so allow only one iommu in the bindings also.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Reference:
https://lore.kernel.org/linux-arm-msm/20231201-sc7280-venus-pas-v3-2-bc132dc5fc30@fairphone.com/
---
Changes in v2:
- Pick up tags
- Otherwise just a resend, v1 was sent in January
- Link to v1: https://lore.kernel.org/r/20240129-sc7280-venus-bindings-v1-1-20a9ba194c60@fairphone.com
---
 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
index 8f9b6433aeb8..10c334e6b3dc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
@@ -43,6 +43,7 @@ properties:
       - const: vcodec_bus
 
   iommus:
+    minItems: 1
     maxItems: 2
 
   interconnects:

---
base-commit: 9ed46da14b9b9b2ad4edb3b0c545b6dbe5c00d39
change-id: 20240129-sc7280-venus-bindings-6e62a99620de

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


