Return-Path: <linux-arm-msm+bounces-106307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHixIjFS/GlOOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:49:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADA74E5210
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 695BB30BD4A8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3346382F10;
	Thu,  7 May 2026 08:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="ObKnWdsE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8249437B003
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 08:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143024; cv=none; b=h3l3PkMyPFny+4fVFK7ciqZz7yC4U4d35DR67W9cQKZYQC2iFgW9FsOvKAs/IKBh2PS9Rmr4ikXNE2bX36F+ujyWH4o6QgZi/JsXs+SC2r0Pps4eBKzObdt8hL3+mdyUfYVsika8ynjqT6lPVv95zc6YjOfKW6K4dgIRX/Ghw/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143024; c=relaxed/simple;
	bh=QblJLYUxWFmFzazdWdnyTl6+OSvjApGOaFwY40TrSx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MDxahK8bpmyyJrdaP05FwaQKPJ9v0YzKquFHK/gkOwZuzHD5kEN/NzpknpZcNlqPgLbIeFSTJ3EGZ5uO4EIkxHwbfpAlvha9HMnua22eP1jDiPNHNeVgufxgyi4OlMYkTFt8fAPKJq/YAdW7mKynLqby0v0VJ9vTEtwm/JROMyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=ObKnWdsE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso6644565e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1778143015; x=1778747815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2GFJfRBDAiYvavg+mzcOx1RG8QRX7o2Aee/h+OWKfc=;
        b=ObKnWdsE2LrK0uuKGkwNbauCGzO7JS7xioGcDN6AJhnc4yW8FlEWGpIjC82XEASH1g
         eE/u6KpoJfQYctIuvCEadVBXMgOaTE3d+HKaY+uCt3XyD0/oXT9hK3eB5OpDvzJnDm+p
         3LMGArkSRnqRMYFO9Cm5hdQYw2Chvk5KUqKsQInXqUjLX1KwX4Emx1eN6qF54L8AYQ8O
         n4khypmUSJHb9d/96x/0o/qL7xN99pdiHVJRfHmRt2g4jo24AKgWfjSpY7uaGss8JwB8
         3Nbq/QILR/hPCCIR4mF1w3ias0ZDBBjFJq2vFMr7ahQ/HGDhtviDAWVR8YJf5kXR246h
         cxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143015; x=1778747815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e2GFJfRBDAiYvavg+mzcOx1RG8QRX7o2Aee/h+OWKfc=;
        b=RGm5qB5pnSNaiiTykRGylAjwPvSrMMkO1ZXU0maMP555CmvX7ZHFYEaKh9xCJ/mqcg
         PO5DEy+SB/Eaz0QgTTSF6Ggzt1Jk3gpJITjVaF5C/Fy9EX6/ip7xHL4+ABNG7cvfbs71
         0vFf/OQSMeqkci7HpmwtD0zSgXKNUn4Nvc7AMbWE3lMoBYkheDvjWxNIYitbhavdz44g
         NJZgxpWc68x9BKg3hmGnAHtAlrt7IPnvLleARg7J6nDSO9qRJiHI4C+kj5YaHz/gjtN7
         TcRINLboNGmpIoWDb/fMzvV+AqSH62TjOnq3xhRLEo0f+tXpem8ToNKZ/ooAWy5/wr+3
         Wylg==
X-Forwarded-Encrypted: i=1; AFNElJ8mvYCZYsTiRPvJuIa5YFERJ1zNgYduC1Obkj1nlQ7/U7nBwwnWwbGWAmgcryAbq/DFxVnf+JRVKjxaQSau@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+fBGBbZNWeJnhoBXiMs7OQJccrfOQ8dMzgQW1TQ8cl7qQj7zk
	2IZjqKuvqCsgkwvBH6tfC+nnBTmW+dWJKrE08Lnbv1M2OonX+SrJ6Tt4uSuGE62BV/I=
X-Gm-Gg: AeBDievZ5JN7UKO/S2C6bWPNvbzzx7Y2pkaVl/pdAZVL19bFG4kn4K0kpY7qDfq3zXq
	m30CXMJ5nNd/Qs50KtknAI9qNxKD5QsVMH7Z8E6I5LgLJbgLAMeAvJkypE28mM2I8JynAJAnaef
	04ek+QHpi9p+PUkwgXmlatxSm78qMwntMhQuvzfoqRZPBjR7hnxjun4boMMJF5d6CN7MczBQ1vk
	VtkJBXtLcQ6INEqR93V80r4QQ3ZqTLA6kk+Dk2r6x4B8cdJFLhvabT0CvYvjGf3QiNWzMY5Q8nm
	gAzWgJxhsK7YLAF4KI5i8LmQ/zLhJZ6uZZaJIDUuMR5M9IIyIrUwG5Q3fbZbqvBAdDQR8qJRljW
	pQNYthWMaPANkqJgmCAha7qfnjtGHs9JQE5V/qmqAeuOfe9R4bs+4rrwmhfcOz3LbgtrV7X0/MI
	xJroOXvCs+LhARQnAeV3xvqlcBRJUzHHTPgShiKLz4AY2qShFA5oI6sPwdYe4dv2NI3Eno9PZhU
	3e3ktED7/3fSlJmzPZTFxpapXJWq6LOAOApX/PXc4AB3Q==
X-Received: by 2002:a05:600c:34c8:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48e51f2ed22mr128679615e9.15.1778143014929;
        Thu, 07 May 2026 01:36:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:cfa9:e812:def6:e9af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5313a158sm35602705e9.24.2026.05.07.01.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:36:54 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 07 May 2026 09:36:41 +0100
Subject: [PATCH v3 2/4] dt-bindings: arm: qcom: Document IMDT QCS8550
 SBC/SoM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-imdt-qcs8550-sbc-rfc-v3-2-47d3d3372b33@imd-tec.com>
References: <20260507-imdt-qcs8550-sbc-rfc-v3-0-47d3d3372b33@imd-tec.com>
In-Reply-To: <20260507-imdt-qcs8550-sbc-rfc-v3-0-47d3d3372b33@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 2ADA74E5210
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106307-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,imd-tec.com:email,imd-tec.com:mid,imd-tec.com:dkim]
X-Rspamd-Action: no action

Document the IMDT QCS8550 SBC which consists of an IMDT QCS8550 SoM
soldered onto an IMDT QCS8550 carrier board.

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index cc29b06621a9..97735d31f1cf 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1073,6 +1073,13 @@ properties:
               - sony,pdx234
           - const: qcom,sm8550
 
+      - items:
+          - enum:
+              - imdt,qcs8550-sbc
+          - const: imdt,qcs8550-som
+          - const: qcom,qcs8550
+          - const: qcom,sm8550
+
       - items:
           - enum:
               - qcom,qcs8550-aim300-aiot

-- 
2.43.0


