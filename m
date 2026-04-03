Return-Path: <linux-arm-msm+bounces-101649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOb9MPnGz2lH0QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 15:56:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8669394C25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 15:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D9283029F67
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 13:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5013AD539;
	Fri,  3 Apr 2026 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="eMcDUq4k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD563845CD
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 13:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224526; cv=none; b=A6K4XnUZC3vcCJmXskHQptHa/pyosqwPC4JcqVULwGXNc8DAKYg7hPCMFLPZ1mw3QnSqMj7MJO45e7cCyadtp+w0PoqW7T80hJhMuMRYDNhbITN36BT1IzjAP+tiALF4qlX0IHa8u70SJccnblyM98uVuzBYm2033tCD+6TEapU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224526; c=relaxed/simple;
	bh=bX0RSkEhHMY0CQeWiiphb/xjS1x++AeW72AXUrJMhfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WyZqYI3jpf7cFHmT6eVifybPY4z3T7MM6B9KH1STuZB9M8yjZwYxvux+I5nS6KapAy82eqW0qOVCih6QYvhCrTYmIUf5OFlfhn7RHle7f8IhzHWSWN9qmFXwJK7c5+iz98zX2aWK8IhI8Na8n7KewGjwrgzTKcT6V2E2yOfB+i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=eMcDUq4k; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9c745e18a0so125305766b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 06:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224519; x=1775829319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00QsAJAs94/ZqUyZhadzKRAFArz8oATvGeKh7GrAju0=;
        b=eMcDUq4kDbXtJoLjYpvN4DIgSbal4SfAiQ0Bxs0F6N25Fnb15cXqGtpmsKKdnHVpq8
         CqLdZzyAlFZF0Pg6taXCioUz7T70PZlIyUcFqndMcZvtkhWtJdV7ifrGRv4iQoEkzWt+
         LutD/N5YlETUMeRA+y1H5VXvk9QNwV6ekKOL/TBPSmBoBbOkbWWsjWr20FJbFexyVJA4
         6z7DNHy3x4lAfjn+IjV8t5AFlAvu9V17eucFr2iaXX9QwJGtVsziti/srrzqpDfl2WgG
         XPoae8DCwCp2WfzEYiwRVA7m98eNXSbdZ/wcKK0Qz2SJyVvWaVboN2jj8VpK3NgT+PSs
         jo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224519; x=1775829319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=00QsAJAs94/ZqUyZhadzKRAFArz8oATvGeKh7GrAju0=;
        b=J6TEXQdyRVaBho5kWQSRHTTVcIrzwFrmT60GAHDe1FYdbFGRKCevEuVE8xrj5zorKf
         CnQILenf8VkF3WDaZJUCqSdjaI/R9TAjBr+s/pS95ClzVJHW82BWDG4Fa6aeSKINWlZX
         /A2JD1iHWuiJo+p/jwtP38uRgqUjz9SYUnAJrFz+DLaPhhpbv99Qvg9AjYoErlOZSuBT
         pYs4J8NEJndvc04ee0UR0gxBeCqRB+9LiWaH9yL5AM55uwkKuXyFpHRnjTUXwUtS2jVJ
         6Y3tmfUF4CQ8Clxe5Un3CMXR6lmfbj/EhLv86TCWOBOShnOB70jRT0L6v+h4AIuGG2SX
         lIhg==
X-Forwarded-Encrypted: i=1; AJvYcCW98mC16pJS+6jhW7qYWL11ZInZKym8MbquwENlZLt5zoAug1FGDeqXrbQ72DnBJ4o5wBcVGvMmOP4pL94B@vger.kernel.org
X-Gm-Message-State: AOJu0YxXQ+wHwkTJtpnGR5FrNUJiU8yUctfmcEUUu46kkTc/GLEcUQrM
	IwJ+SW0jm4BgAHUbbOFUbvXBYFjmlb8sFDGoRXpCWvAf5Oi5YAW2AAtGXjtpGYGIIz0=
X-Gm-Gg: AeBDiet+cumBvghuL/aHO2uZZx/dXS2eMBAjhv5NV3i/Cu0PCwVT6132fd9AoSTS649
	jOwQcvXFZ1HLfg1+pIRM+40nB4jICpika9i5y4pxC5Ca1s0TPKgHXLWsphxJcyxnWKmOUQBPPnt
	9y0lMc2NVTebiMeirDmU90XYhAK+pe4QqykEV1MraT+kFv/FVMBVGd5RUpgTUliBROVDy1R19ge
	ptwHuAVvrI83X0T0+V0SnZCCZBCJ49yo1Gru4dD8Io9ffpzm2RL2iypfhj4+1gfYUXTX/1ZCeig
	I8ap8qC0nZdDzNjAjiDIb06WJy7rRzk2Qy/DhZU15Jd2psxPQo9spZBSzpdq7S+1ZGWOpByRzFJ
	+uzgJXrJKMv2INgLE4bvPpq14z8EJSN2Tv0lul6POVP4V3GlRpFh333r9VhYl6ci1UtE4mlFGR7
	bKslwVkA4MqdTDnawvXwQ8Z1jCRchds1M2JG4CfF+Idu2U7IhvGj4BsQD8s3ITpj7J4r14XVFA3
	3VCramykhlpLPt3cc098IK8Y1s89Vkvaf16xA==
X-Received: by 2002:a17:906:6a02:b0:b9c:cb1:a61b with SMTP id a640c23a62f3a-b9c658742acmr142510866b.16.1775224516202;
        Fri, 03 Apr 2026 06:55:16 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:49 +0200
Subject: [PATCH v2 3/7] dt-bindings: net: wireless: ath11k: Document
 WCN6755 WiFi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-3-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1239;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=bX0RSkEhHMY0CQeWiiphb/xjS1x++AeW72AXUrJMhfA=;
 b=DTJTtJ7BKJd8qPXVe3nd0JrxaYiQE2N8bwiN41dxZ5jihuyHGd6fmesGzuo/2w99jisvtHofF
 h8Mx18K34cAAflNUNQSKgyj8B17L/9Yc4dJVyM76qpuovDBjx8PeKjI
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101649-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,pm.me,gmail.com,holtmann.org,quicinc.com,sipsolutions.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B8669394C25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the WCN6755 WiFi using a fallback to WCN6750 since the two
chips seem to be completely pin and software compatible. In fact the
original downstream kernel just pretends the WCN6755 is a WCN6750.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k.yaml    | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index 0cc1dbf2beef..94f8f8551756 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -16,11 +16,17 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,ipq8074-wifi
-      - qcom,ipq6018-wifi
-      - qcom,wcn6750-wifi
-      - qcom,ipq5018-wifi
+    oneOf:
+      - items:
+          - enum:
+              - qcom,wcn6755-wifi
+          - const: qcom,wcn6750-wifi
+
+      - enum:
+          - qcom,ipq8074-wifi
+          - qcom,ipq6018-wifi
+          - qcom,wcn6750-wifi
+          - qcom,ipq5018-wifi
 
   reg:
     maxItems: 1

-- 
2.53.0


