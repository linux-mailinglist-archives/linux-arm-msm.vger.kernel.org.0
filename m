Return-Path: <linux-arm-msm+bounces-98895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKy5Dd8BvWkO5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 09:14:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6882D7039
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 09:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF402303D10C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 08:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE475371CEC;
	Fri, 20 Mar 2026 08:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ITfFca0f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590CE372EDC
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773994220; cv=none; b=H26QIzDd+ZYQhErbZfeMQx0U4EShwV6rjHFPjXMZJZQ7Z4WK2s0brvhH3+VK4MbgVycJpTURccCaM1w28gfz9Lf3Yzmif/0F2RzlTK8RRBJmtaq7FqmxPA4ylHicLWyG+WSyOk4HdtB4c2ecrC5d/h7U/S9dD3Hv2d6qBzp5GvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773994220; c=relaxed/simple;
	bh=6dtGZbRSVFWRCcAZr6CS/BmuG6zhDBUqyFHzgT0ZE3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M4QV+kZF+Fu7I0GUjr4FANxpJefWjHE7pK+EXfpUdbaQqfBAfT5szYshjC0vhIHO2OlFNgrBQp6DkcLxC4f7uaeqnTOHojYFoEuEgDM3UNKuKWOVMFrCmhXztMAqrxg8EojFHhQI3o0Bl1Gz7rKEHsa61RUwAXIAjDhnZFYFahk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ITfFca0f; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b936331786dso157979166b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773994217; x=1774599017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BxUoG301RPYcoM5PiwD0xgoq1X+VWOiiJLhYwNLDCc=;
        b=ITfFca0fryZbQjsoaTVOK5meLa/1wyj8MwO9rvKvfZrCOQS6sl9PS5SoYfEp1fRVEi
         pWCPlBEbm0r216kPMJMhniYrPyJoDMFAJOqyq/x5fSn4M3BaBwnxmqKUWQgM6mdsbAmM
         n3X6URMeb2XP8DlbqvlweBy2OvcxUOnEVJEY/UXbohO4J4csTcUK79T41/UJxH6rZRQ3
         OVlCWxqzpfZ0Ok5m++t8JYCEo3MicFy1PZxUCwzh9YSGFRX58uRDETglxHxMtIuLJObK
         z+498bW6aCa2LN7CifNagbdg9w1R00pixxhAnWmHB6wjRM3XexMaqG6pQZ7eMgcPzvkn
         xKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773994217; x=1774599017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5BxUoG301RPYcoM5PiwD0xgoq1X+VWOiiJLhYwNLDCc=;
        b=R8oPH+4bCd6el/hpnmUg4F+SA3U5rcIcXmIW3kCrClTSVXiyg8+jQ/XdmXVzsUp56G
         uciQBk9x65eXYbMd0y4rr62e85BC/atCYr+X4Y9IVu72c+98Io6bJvAQ6Dp13sMJDKQW
         wOlF+QvlTZov8tT+ojWFJZ9JSZRGlDoYEe8rXiwXn72pza5E3qN8Z1oKpoQH57AKaV86
         D3jfHKqZBy5vg9aaKDT11mpRw1Ta04X6CwF+AQlL9qTzGcQpYfJn1OHxlgLbXGkjDJjw
         eDeH96iga2RrGb7lY6fSlcTegrbuJReijo9vgvmosSdfGiwgA2VtgsIeCLF3ki0fyVgi
         5YQA==
X-Forwarded-Encrypted: i=1; AJvYcCUIv9TaNM3s7P8nk5jjiq7T51ekU5v5uFekjOBbktR0bqiyo2dzcJecOWIS1Tx2aEfyDVwU979EyG1uVKet@vger.kernel.org
X-Gm-Message-State: AOJu0YxPUoYS1VZOyYrta023+83oWiQOOu7z8KoFTLjpJfEIkU8ulSTe
	JEEb4UHeZeyrr5GWdoiuAOoa/lo67Zp4es9x+nBExIYb0emNKn700Ex+PPmYBmoiZyY=
X-Gm-Gg: ATEYQzwOzCkxWifPMqpVONybH/bvODZjNKNJDkWbaUOtyVQN/i/IBkU1upmsJwTmON5
	nwUPGjW9YVI6iPmdK5PpeoA/ZfbgdpWKWm80EtgPUvA3zkOoVrwFIdbCl//42SMzkDbNeL6J113
	KQk12P7Z4/4TqM9PM/jBCfM7ExEJldFTKlLniM9s1WrWu4XTmhj0IBHIa3mUhxu1dlyJeHwoVU+
	lDryxI7eoUZoVNbi13kY2Mfif2YkBSjXYR+Atp1hXWd7HFr4uU5JOjTPqYOMO8pRPHv4vdB1rC/
	1DX9bC53crGAd3uXC8l5CgHgRLALEnXzKg+LXX2alAZ/MXfNaYzuQIjNwzd6wI8fPpIHjJIQ1Nb
	i7cI2fDTGf/I1LudrUv7bvsov/gWkySWnQOA4GTTsb55ztFjR3p/AP0j7jo3LQq2Hh1KOyvFyxw
	9GYBnnAJnGsOjKJ66u2s2qX8fqPEJgyCnnBnfVapfb37/fc9Qs3ql4IJqlWoBmuTo/rUme2IqRX
	xehqw==
X-Received: by 2002:a17:907:a191:b0:b8e:fe3c:2255 with SMTP id a640c23a62f3a-b982f0a94f0mr106385166b.5.1773994216560;
        Fri, 20 Mar 2026 01:10:16 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43b5csm121016466b.1.2026.03.20.01.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:10:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Mar 2026 09:09:49 +0100
Subject: [PATCH v2 1/3] dt-bindings: i2c: qcom-cci: Document Milos
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-milos-cci-v2-1-1947fc83f756@fairphone.com>
References: <20260320-milos-cci-v2-0-1947fc83f756@fairphone.com>
In-Reply-To: <20260320-milos-cci-v2-0-1947fc83f756@fairphone.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773994215; l=1353;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=6dtGZbRSVFWRCcAZr6CS/BmuG6zhDBUqyFHzgT0ZE3M=;
 b=HSxUaO9sCaviuTGLssmZ8jeEeOxakzeYqv1aIQWxIlpi2X6V7G8CHUAT2UYx1zXBV/IKgZDFH
 LJnoayH07leAU4f1eWpCQ+/7SY+3bIxZ7xRBhwiaAHwfs31WCyV7avd
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98895-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AF6882D7039
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Milos compatible for the CAMSS CCI interfaces.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 399a09409e07..816c1a48edd3 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - qcom,kaanapali-cci
+              - qcom,milos-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci
               - qcom,sa8775p-cci
@@ -265,6 +266,23 @@ allOf:
             - const: cpas_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,milos-cci
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: soc_ahb
+            - const: cpas_ahb
+            - const: cci
+
 additionalProperties: false
 
 examples:

-- 
2.53.0


