Return-Path: <linux-arm-msm+bounces-101690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLiuEHLuz2mt1wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:44:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC4A3968D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6DE60302EA6B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 16:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC83E3CFF5D;
	Fri,  3 Apr 2026 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="KhYjomze"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265D53CEBAF
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 16:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775234648; cv=none; b=lZGI+PCCrtql57zCNg1ni9XMhNHNVqT9/AA7hA5w4dNKXgCZHAE8J/u91hD6H8m1/+a52x4VkdZ/1CoEPCKZdFPZXe7pfyn2VlxOCEJ/UCw2YWUFy91k1/DXDlYR/KPTZg7xRCwrNNbvA0zw7e3RBZavYkGnRcj5luMRsWPIa4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775234648; c=relaxed/simple;
	bh=vDbmeaqL6j039OEqNItmPJ9fxW8hfiNnCv9Ev3C9C08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RYyNa5yf8w2hjX+ZQ3HoV0slZRcJGmrYS/ZxwhdhX+oueQL6kzcWYF0mTQSsk9yAgxELNWeewhHWa4d4zTvD9KHw7zZXEtUBoktFmjnxwnXrk8BDqxVr7HghreuxUYlb4V+Cgq8Y8ttdktx0udA+FM0cmZtWOg9IGYgBgV+PD24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=KhYjomze; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66ba9898ae8so5085821a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775234644; x=1775839444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7CKDzUVCGIYSeYc4ZNCps7II5Y1x+X+SqlRkbx3cDqc=;
        b=KhYjomzem+V7R0EavqlwkPcYjpOag4mY5muiXu/ykKnnWBmH9iwZFhAI+hgEccWVS3
         65jYrBj+GQ0kS4rwxQtNavczRNoXqwR2selZv66jS4VAlE2gtfc5CTSCQ2tLp9lupyrg
         ewZigJ3/noibsB3Qy8VmoDoe/9tihmzhAJfC4NCn2OQns23pSYQgNQ3K1PwobndPcWW0
         guG9lrogxQ7zc7bWff4l4jsyGmCaYMgKOYbRlWNl56Q4QX6vyug7Ttrk5tm2YzkIZDnV
         V5JuIlvYoB2rCkrFLuar5Knuv4QNf+2bnfvh+P3B8o4IQUI+sIj9kgQppisu4pECed45
         EdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234644; x=1775839444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7CKDzUVCGIYSeYc4ZNCps7II5Y1x+X+SqlRkbx3cDqc=;
        b=OnglTNPXkFmpcEsn4wnyMtOs8aTBXQX+CAVWsacy6piIkUVM+6Js1Ihe2qJs6FmQFq
         eKTYla48LBhxzmbBxqTurKbX1qGnopj09S5M4MF6BU+0tRT0CD7AwdYLTX50bFDR9emD
         E8CjiStYbPKqe/Xbia4o/6KPGREW6i6S9k9PiTow/i9SUza0KxPoXF9ImXitpiqkEAip
         RWnlC6xgD27lbiW+tIIewQsXIMO6AT92+yendboXCzeRZ6IMt8aTwzQkb1kWuWYqXcym
         XiDVIMqMWzYEJfxcGuDvRABKKubWhEHJnivCSBaRNjmDrvceypzIRp9Ff4wyeNM0Mels
         89Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUDOHsZdLqtgL6Osgd/qzTFsdYFFSsPJfKk7wYwuhcuKa9yGrqYFOX0EvY8eIYaetvPzzla5VVhylWiY2uP@vger.kernel.org
X-Gm-Message-State: AOJu0YxWV9L08SpE6zm8R6z/Fg83F5E6Qxj5fEh3sfH+9MEb/dd9M5JO
	MXKlJeeGoqlNnY4U5EkrU9+5SlPhvVZpbsQ9j7v73+1sekfyznjHbDB5gRzsn3+T3SQ=
X-Gm-Gg: AeBDievt5OVRg3sRzIgg6/o8qKdaikxte/9RsaW5j3Wr9Sj4f0FLUsu6z+d49fJVdJa
	cTONgv6xeT3739l4ryDvBoC+qIbhPZhZpR5yDUiul2LPr+WmSx1kFsiN1qRv2QKlAYaJcR0gCes
	UEGIUXs4fL0DJZmRPm2OcSi0q3/YdszhjtL0H2/8khnve2ZZDXWbXRdyKgB34HTxDjPmvmFb5OV
	Uei2tb9apPeFXoGswxCinQZOfg4TRNBj+rm22WbT4QJstDJOA6MNXQpP+AwzGe/ZIhBHt5dL7aH
	kuhNxxvkxjaOO6LXlyRGDqDPAjrgi2q6daj3K4OrXFKGLpMEet/FOzbCxNVaN6c2UMfa8eFRX5+
	/IeShw/RSgzSiz2UqFR8EozxASOYE+cmMo5z5PDDgAalODdS2DehKWcJ+IFxwTtqlGhs/qaZIWl
	sPfR+WIdx7px7cPLVlzT+eijyB1mZBwE36inMXZEFFcO7kOC45VROi2n4rkgjT1lgLjF8zCGBy4
	MwUZflvN98mYijvDuFjSUoKo7285tbmIvAYZQ==
X-Received: by 2002:a17:907:3d0c:b0:b9c:7b62:7bc9 with SMTP id a640c23a62f3a-b9c7b628bf4mr89943966b.11.1775234644481;
        Fri, 03 Apr 2026 09:44:04 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca9a145sm213492566b.25.2026.04.03.09.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 09:44:04 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 18:43:49 +0200
Subject: [PATCH 3/6] dt-bindings: net: qcom,ipa: add Milos compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-ipa-v1-3-01e9e4e03d3e@fairphone.com>
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
In-Reply-To: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
To: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775234639; l=699;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=vDbmeaqL6j039OEqNItmPJ9fxW8hfiNnCv9Ev3C9C08=;
 b=mXWJEgU3e2IoxjKyItffyoAa4WLNpmWiImybdREDj076J1O8EJOtjTJ/7E60j+8rTZskknyqm
 86UuGN77F5JBZbIiCMC4s+p6WmmcYX3+n9viols85CSHwizdDPeijAs
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101690-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2AC4A3968D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the Milos SoC, which uses IPA v5.2.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index e4bb627e1757..fdeaa81b9645 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -44,6 +44,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,milos-ipa
           - qcom,msm8998-ipa
           - qcom,sc7180-ipa
           - qcom,sc7280-ipa

-- 
2.53.0


