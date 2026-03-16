Return-Path: <linux-arm-msm+bounces-97754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKzzOtNWt2lsQAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:03:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 034642933C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B87273009383
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 01:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1D0277029;
	Mon, 16 Mar 2026 01:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NfQmxLYG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E7925FA29
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773622931; cv=none; b=SOH3WuVVj21RlKewQUdhWQhUxu/T57nTYRQaXIasb4k+IzRpY8HL+UZ1m0KuOgapLrf0gEU8KjupFNm90bFRjibwxR0d73TS4R2GHiCZdAxvAYzHQoeopKiqOA6bPv2Xs24IgQe/YIrT3ObluxJxyk/RE6b0jIwRGMzgdJKFnd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773622931; c=relaxed/simple;
	bh=FC2WtnD/edrrO3dvh2jkDAJh4YtyCCg10TeND1JFtJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lAbxOcEqycj7BuXsqq4On4+TEBrQ/OQYOuQI12YOImNRYfENK/lwY2C8vc7fqJ5G+9LplmTlKKlb/DDwtA/73E2X3jaWnvkONFkSPLnOMUL97vCV/dkllJ31aC8KPv8O3E44NGR3V/QUpeH75IeELTUbxXhMb7/+vJgBhD9SaO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NfQmxLYG; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so4529451f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 18:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773622927; x=1774227727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAo229F1McxQvEyDk0hFi46mMGpyqb1mbBmM/21egy4=;
        b=NfQmxLYG11UTF3quj8+GGKmTCVINbKzCjzLZYxXSNtqYKoXrzgji7ss7nyArimQGsU
         ch/zacNjrLDi8F+twkyzQkNcpp69I4NKWmGp3FYV4R8WbwbWcCAaEqMe3Fbe5fIlgNaE
         jy150tf/7f2tbJWqr/RVXZXsLwUKLkyIdZWlv6YFnw7CH0TSjAz7G/F+0jZJyA6JH/C9
         znj6/7kIhG+00YjOY5v7sAr6vdBpN8G9kKpFZeWlRVepM4OU6adDSgGImsvVUHSpX+fe
         nTeQUGY/wwNaK2f6UBT4CR7Qka6ilHBUboRxyVQWjRl12lrIAgsbSlLO5ig+qiudtqhc
         rqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622927; x=1774227727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mAo229F1McxQvEyDk0hFi46mMGpyqb1mbBmM/21egy4=;
        b=KTNKgNtB2h6pKzpOqqgt4KaCV9KA7evfEBYDV0PvZyckxuC7Cw9F+damw4YLjPzogW
         xQLrcw6MlAnSJo46CszC7/EHyXPB09SlbmQW8U25Y1HeTyutipJnRACuMVx1FFVs39sE
         le7BzilWy3XcgKkgqYiMw7bFk8dSSIL+fAbfHGZq26rYFseVyk187p8/45xG5Ozw6inI
         bP8h7zpnqUXm8Vxg8/BeeMpZNexmdJfJ+9BZCbTISXNJdbHRnJgh7wp7qMIby/ycvhHC
         MuyYZ62kXqzRmOk589rXGocGlI3Eid4fiHyMhgurqmwpQhagsNjh6HFK+EE8oP7Q2QQc
         Uc6Q==
X-Gm-Message-State: AOJu0YxtofytNzpQPGsLPaTKfYon59ro+g2yv6HCI6gluVAykbjctoWF
	nf9zxA/jo72SiyAnXVBg7A1iWtdvyNTWfO35JbuPWgqWccUKUBFyr5svTuLP6ExnGOo=
X-Gm-Gg: ATEYQzx/XYhQ4jnVRlfLmt3IleARpjRgUNBfNPbLJfKCypyCDQQm4n9yOVx/9C/3lTr
	W/jVlfA+7Nk2ojbaH83+LTw1H10x6BMlPHUHp/cEJJt893ImNGXjcSsGWSndi1wuJ6/ulPmWjlJ
	AtLAMC8h5oycRuePZZmyxKwr8psipIGA48IjV+7WMHkG62ByteMPAeyVIrZiCcqemOngonAdH8b
	f1eka98UsLnbjtXRB4U2EwhllU+L8LNm/C+YTf3ufgvlYPMl7QHeO+eV8yW1ppR/o84alTF5Xu8
	0DjqmWysolTw8POupCt3QsTR8sLgkM3auqGel5H5QicdUgFRmO7SLGLMTMQzZ9QKAq57QDEQEn1
	mdN5KZXe/wMmzBEnoKGM4iSsZfYbY+aylJst85U9r3nglY8jgf1+8LZtQ6f7N45xkrbGDkmMoDf
	3jhL5Grn+CjcHD79uDSPu34LQzoCZ4s8V2A0k=
X-Received: by 2002:a05:6000:2dc5:b0:43b:446e:dfa9 with SMTP id ffacd0b85a97d-43b446ee04cmr2149892f8f.31.1773622927092;
        Sun, 15 Mar 2026 18:02:07 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe228986sm34729700f8f.35.2026.03.15.18.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:02:06 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:02:04 +0000
Subject: [PATCH v10 4/7] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-4-fdfe984fe941@linaro.org>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
In-Reply-To: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=FC2WtnD/edrrO3dvh2jkDAJh4YtyCCg10TeND1JFtJ8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpt1aMzJ83rYlyOJ1kxjRv1WgXzSpbIkFQKgLw8
 F3m/nXWEV6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCabdWjAAKCRAicTuzoY3I
 OoCxD/9mLTNXYyGtwAmDBDdtoEYmY9lu+YbQhHBVUtS8n55a3L/QgHuFaELhpBfP9Qvt2ndzVvP
 sMUYa2uaxMZKvWo4jae3sIudbJpRwYLCEqbag1G6sCWTb65ueA4dcewp7jTES+EudGCcr8cTd9/
 s60+KKlHb1R9I1Z/HECpbTIOGolfY0GSq9mDjapcDamBLRJhc2Z0VWmAsfWZuIbi2wf3eQkNjSX
 eC9/z9Li7OwE2siqaY+eyvY8wlbCwpt4ydAWYz/o4V6kDRVTqUI9PlRb6a9rCXYW9JKL6Fj+FvJ
 rvVmsJZNmobYlIS9ov2xOraAYEtMuTL/DwcipCHoOUGFg1Zx2lOAdlt22E0Y9B/3PIlynBiLe1g
 M00UCg2g/UZenZw53rl7NfGuAvsOG6Ilrqa1p01uhOgiTlgOf8evi/cFoDAtXAWqYcBTsqox442
 hCN2I/4Gupf2GLxOYkPiXyRqGVNfFYMRS+httONrEkcAHui7CX9OMx+GhG8/07SUo0S+Ks5aEdv
 ncIn1eqNgTVjEcvwUFZDtXh7CMuDerOq8eN2B0CCDW0iPaeUCry1MXBa5psHwtFwciX1qKFLFRW
 v4EBexrx0ZFf4KQFtVOtcCMoBtk1wYr8E1bysV08CFLFC5CH4KqMGN+tiEeoKaMge8wUpLfd3Oc
 gNVWIML4bZqt0Zg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97754-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 034642933C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The original iommus list included entries for ICP and BPS/IPE S1
contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
CDM IFE. The remaining entries serve other hardware blocks which will
be described in their own nodes as support is added.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 94a29f439ccf4..3e91bbfb808b3 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -116,7 +116,22 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
-    maxItems: 8
+    oneOf:
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+          - description: Legacy slot 0 - do not use
+          - description: Legacy slot 1 - do not use
+          - description: Legacy slot 2 - do not use
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
 
   power-domains:
     items:
@@ -426,13 +441,10 @@ examples:
                                  "sf_icp_mnoc";
 
             iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>,
+                     <&apps_smmu 0x840 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
-                     <&apps_smmu 0x1860 0x60>,
-                     <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
-                     <&apps_smmu 0x19a0 0x20>;
+                     <&apps_smmu 0x18a0 0x0>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
                             <&camcc CAM_CC_IFE_1_GDSC>,

-- 
2.52.0


