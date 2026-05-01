Return-Path: <linux-arm-msm+bounces-105457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENo+CQJw9GmKBQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 11:18:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8846F4AB3E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 11:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E87C3028EA6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 09:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41CA3803CF;
	Fri,  1 May 2026 09:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Owb5HHBa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772DF3815F4
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 09:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627121; cv=none; b=EnwgZfVlAtQpSbA8YmwxVBAtyV8Lcr4QCoKTJtS5fHmuASNS4d7LKY4JRCcTZ2HB9rPMEq2CQZyGMPDAhNA4JNYyuzZ3rZUprD4/vExgRn4717sirjsTzDLbpw/wdCxyZSqMg5alFjZMSR2r06b8xyPHlEJYnGZRcNbjKCojkaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627121; c=relaxed/simple;
	bh=YmwJZh9JOI6WzIBDXZoUlM82ToEJjTRJKA1/rBWV68o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uODpBr6SO4UZTULILE04W5bbrS3FIfiWRQHOEBAF+HDSJnyh/ca4v8QM/Ahhhq/osB7TrS48XUEu8Vmh094OTmRMnC+FO4Y1TzAuN0Eio6dUy+gGQRVhrTYQumeiXOe7FvxivD3dYkYNiJFSJIWdXEAjplOtFoRgriY57hswzNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Owb5HHBa; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso20070265e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 02:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777627118; x=1778231918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vg2B5QYgg71nEreyYDVlmpHAn8rPoh5lm0nWaDaj3E=;
        b=Owb5HHBaJ6Ent4NRFarh3IMFOcz7ExYc2HKLgWJAu6nts7VYl/xhyt1cAm15+tKHOR
         tkb5G6XmNDFYvp3qFzBPcsQhadAgv3Ka8RFxnJ9p+AXEg4PkBwTgD5loyft/8tGDAtCW
         wDmmFCezZCIIkZhj8Z34NboLXQpvhRWI18ZhYvsyVDFuE6+/bOdeqMZGaUTF5H/YCCfT
         9921MZQjU8mirMDauvOUHu23qzwWrJYQzSenoRaPIaTJYG7voR/EkKmxtFy68dFJdqZa
         Tm2hwnMnvDdDGqt9JkDYHt/XCHX+cRFBVaGiJtfHG8qc2SV47JN0dKKf5u2aNLNozjG4
         cwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627118; x=1778231918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3vg2B5QYgg71nEreyYDVlmpHAn8rPoh5lm0nWaDaj3E=;
        b=kkf12Zuv8dT8aJ1vhenSQpl/6jqoyfvEdisd41p9tCt+jkHs66GgE6x0l/kIkLblgC
         bpjFAwYQFQXl6JjTfswyNYr/gT5WzZ2F2W30bov6C041yFmf6hlaE3Z6n0fOeAZJbJrJ
         lJgDiU///f7+46Og9o0RlsmSFEp6LVkONDeug9ZqWRG8Kl1zFOMToN3W/CBNwRnrRRhe
         A3zoBUkJGH4sQzDNyXjmAqCldJ/2estNv49t8i9jn+5zaMwwv8SkMMjF9R0BJx6/AdPr
         /7ZQB1iF6Gnz4DaldlQv0ijtBMr9JorVZX6sC1rhf9UA4ivuplbMBXFzmjLL9YKlti0/
         zbfw==
X-Forwarded-Encrypted: i=1; AFNElJ/8RVRCQFKM+VBE1E9QbYRFgi/rE3fOG234tG92XbDUE1It4ZclEX2QoqCi4eiZjOZpHPZL+v9i5aFMZVy6@vger.kernel.org
X-Gm-Message-State: AOJu0YzRZSWJKgWu2Iz9CeLNCm7kZ72z9Rvkyn1f9i9XmaCbGnA22f3I
	qRKoWX2janES34nFUN1j8yAoH8W+TcPfdLO8UQlhGyGRfzAWfVN+QfnnHBwQTls8Hik=
X-Gm-Gg: AeBDievkTnIbbHUmxk2CbPg8+h0ibStfykGjnqmTw2hBm8yFTW1mlF8KcNrw3RqI32j
	JpKJjquhyP6lIkO93VHSL4RLy288884fDNerUzXEdAFszIOMxQUL6iaq4WTpd/ubVXLD8TaHbPY
	VXxzV6/C0xlbMVUQih9KzPyB6X0vS3NwGZHLgdCNMK765y/QE7T5vr0ADUa08WXdOR7J24LNRlf
	ecfBePYFoSd06nGmKpStZB8FrcEOHnkncjTkLX1hc6fN4bMtOADQVWt6WGhz0trbwCzR4yarGI5
	6+xxZNKHYMoRVVutgSyYF29ahslf6xWc2YvBbNPX0L3tWhKgFAF2m4+efiYZB74WjhJL2xUDlz6
	HWFoQ+6lyHihD8nOgu1934zK1YufvHqPz54OilX0Tjdk3p682Iav0UM1V8m+/KVkU3aeLa2VboJ
	ZB/NK7/I9dwdh5EEvmBsT2nE2e+vwaQmabn55P87Ta01xfyE73vIqSRTmRhriN9XVonCRkZDlIq
	vKeV84vbMNTF8xZ1iA=
X-Received: by 2002:a05:600c:4e0c:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-48a8444a520mr106471165e9.9.1777627118033;
        Fri, 01 May 2026 02:18:38 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76fd0sm3820787f8f.35.2026.05.01.02.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:18:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 11:18:30 +0200
Subject: [PATCH v2 2/5] dt-bindings: clock: qcom,milos-camcc: Document
 interconnect path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-camcc-icc-v2-2-bb83c1256cc3@fairphone.com>
References: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
In-Reply-To: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777627112; l=1631;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=YmwJZh9JOI6WzIBDXZoUlM82ToEJjTRJKA1/rBWV68o=;
 b=g5Waz95YiXeLxPaliX00ixcxlQN9A2bYYjj5iIh3hpW01/05nrkK4yEIk0joIYOpy/N+7sWdY
 42tZiGQUEXLCi3azpu7zmtrWAclrnKX/jTmH3tbZOYbMDOWfVi3lQGE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 8846F4AB3E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105457-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid]

Document an interconnect path for camcc which needs to be enabled so
that the CAMSS_TOP_GDSC power domain can turn on successfully.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
index f63149ecf3e1..707b25d2c11e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
@@ -25,6 +25,10 @@ properties:
       - description: Sleep clock source
       - description: Camera AHB clock from GCC
 
+  interconnects:
+    items:
+      - description: Interconnect path to enable the MultiMedia NoC
+
 required:
   - compatible
   - clocks
@@ -37,12 +41,16 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
     clock-controller@adb0000 {
         compatible = "qcom,milos-camcc";
         reg = <0x0adb0000 0x40000>;
         clocks = <&bi_tcxo_div2>,
                  <&sleep_clk>,
                  <&gcc GCC_CAMERA_AHB_CLK>;
+        interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                         &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.54.0


