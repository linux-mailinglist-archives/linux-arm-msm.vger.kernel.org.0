Return-Path: <linux-arm-msm+bounces-100743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNLVAJVPymlr7gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:25:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E05D43592D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 73B82302F1BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A403C3C09;
	Mon, 30 Mar 2026 10:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJfPQAG2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB663C3C03
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865677; cv=none; b=acKMlJsMKvqauliNIoaEJ/4smCuJvnZE6Sm7LexaL55M4dNx1Nvwp/V74xRXesitGpIoaNj3o2Qg2SXnOu+F61klHkj0rdR6yf7L45D5T/tVrOJNejP3DVtUmjAeu0KnMFwrwosKow7ANUlew2mXB1qVZOsPul2eRhYDL0VM/T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865677; c=relaxed/simple;
	bh=spVe4EUNVFlJB2QdEc96OFgvjKCHaL0PLCg0uw+Bke0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gXxdCiHNOGBWlH/ZHZs1VPoQn7vl3cTSpDKkOMPscFy+7FwyDYTcs5MQcZsAtfwl4OeRndNl6QpMbXvMd5jSltcxJY43eQ+hp8cNCPAF9g9J21ZHzgJrvsy4NmQ3hv5bK0K7tVMfqN2f7R+IVTkj78lkiyXefQYLdlgsr5Mudzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJfPQAG2; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-829afe24fb5so3024046b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865674; x=1775470474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1XVgipd/TT6ujaFT3/XiuBYTRFfr7ZfTZaRy1KGDmM=;
        b=SJfPQAG2gvjArsgafQ+L0PoIVewB2WQh87knwVXw/2Y5SeVZQfNsqp1s9vZ3JHoOAm
         rlGKbPHelqSaT+td+cqzJRZSd+Puo4O2YvHI542h+vy6vp3LM1UfkvWqPCuplEr3jZgm
         Pdpr2heqoCBHISDCqGSDLSlD42VLIy1Y3N7GOQ6d9hf6X5moO/gsfnKwooSgI/cSB6IT
         gBcjc7nQVoED/oZB9pfnve8gRTk5LRVFY4WQ0RL343GEQoLB7Rxk5pbVX93zUZ+ugBMn
         ockt7YGCkX8Mcb5BbG+lLia/48eWIL552wdFuN8k139vCmitsTwLoYGFDjQsBSKux+L6
         nLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865674; x=1775470474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I1XVgipd/TT6ujaFT3/XiuBYTRFfr7ZfTZaRy1KGDmM=;
        b=RcLpzZOM7qd+eaJaH/BU3cZ/xLtut4/BxSMPt86uNe5KJDgNbNAtVM4T417rRlQOts
         63ONzTNJHoELWrmB2yglslNwRpgnHAlv94VUnQBHKhjbZ/7CY8jwzQcTY8fW+mgw++2t
         WkkvByCP9zk49frLOt6vmWU37MozeQznPo4KMx5+yDyroVre2p8LJUeL4AYExA1Z8lBC
         rxSWa1Pu5krxKlvtf9N0E8foIDG2WnKqu6J5BI+GSXl4q+KwYVaEip7kqrlAcEsclVEx
         a1UGvDtaZMazqnEKAxgRvFR+GPVUpEKxBUsRwU3Yx3AVhlSX/MI6ImFpQd63f5k8DKl9
         8JYQ==
X-Gm-Message-State: AOJu0Yy5KdRzWdwqn1NDhYfMVpRumWlERRiiHepu/e4/CnBFDtnwxr6j
	RaoDjKFZW1ggrMRTrm3mDRr07rdT06Ng0+bCRjQ48dGhb2CYrnZbSSDL
X-Gm-Gg: ATEYQzyi8PWgcgUMbwBRHRS8r2cdsxaBhzPSGWzxR9wuXA7X4p5QY23kED35UxAPlV8
	o49dGdPgw8fFzPCpv4mzFT2giGcZ2O5LfY87spb7U/PvjMgJyc2mVC50rZnTnZoI0cB/HQMk1Jc
	ZYnmXRHB2BE0LBBEh+sQpExV6uKWNH8+AYjRFgjMmF/kZXkdR7vWmf6Ht/WszwTWXJd1XYLBZtN
	JmeLYHAru2tp4SXGt7Q1RvWzlJlZoy/jdfzqtrrGEWFoEbmyK4sEZVHun4gJadsUrstJ0QmSP4Q
	FjawTz+Qi8s0VpNxaFzPlvas08GqDIXKuTV0oyyvJwqMdKsPADGjsSQIOrFjEnCtCtKNSxlGmTq
	gNvIAuyNhKkBwPOEQj8QxKqurBtmMtyX27suzOzrxJwzlPLum49fiABtA+yHkG30PkeVA0nJgYD
	8jScG26wuwweSCVVg6j2MKSEpRA/QxV4nbUqSSGv8=
X-Received: by 2002:a05:6a00:1495:b0:824:93df:6d86 with SMTP id d2e1a72fcca58-82c96036e65mr11779450b3a.50.1774865674423;
        Mon, 30 Mar 2026 03:14:34 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:14:34 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Mon, 30 Mar 2026 10:13:49 +0000
Subject: [PATCH v3 2/7] dt-bindings: clock: qcom,sm6125-dispcc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-2-c4b778b0d7f8@gmail.com>
References: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
In-Reply-To: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=1915;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=spVe4EUNVFlJB2QdEc96OFgvjKCHaL0PLCg0uw+Bke0=;
 b=NNw7v9ceZUsctwz0YvIUnOV2mrBB63atvgyvrQ82fLAnWvBuN/ux6B76TiGmJv0mP3XHayamM
 CVgeFYNRSpyDqongSmEey30Cq5OezDMrbgrvjHa02mfdXn4uwluMlSf
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100743-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,intel.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E05D43592D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Just like most of Qualcomm clock controllers, we can reference common
qcom,gcc.yaml schema to unify the common parts of the binding. This
also adds the '#reset-cells' property which is permitted for the
SM6125 SoC clock controllers, but not listed as a valid property.

Fixes: bb4d28e377cf ("arm64: dts: qcom: sm6125: Add missing MDSS core reset")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603150629.GYoouFwZ-lkp@intel.com/
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../devicetree/bindings/clock/qcom,dispcc-sm6125.yaml   | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
index ef2b1e204430..a177a1934b19 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
@@ -42,12 +42,6 @@ properties:
       - const: cfg_ahb_clk
       - const: gcc_disp_gpll0_div_clk_src
 
-  '#clock-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
   power-domains:
     description:
       A phandle and PM domain specifier for the CX power domain.
@@ -58,18 +52,16 @@ properties:
       A phandle to an OPP node describing the power domain's performance point.
     maxItems: 1
 
-  reg:
-    maxItems: 1
-
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
   - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -101,6 +93,7 @@ examples:
       power-domains = <&rpmpd SM6125_VDDCX>;
 
       #clock-cells = <1>;
+      #reset-cells = <1>;
       #power-domain-cells = <1>;
     };
 ...

-- 
2.53.0


