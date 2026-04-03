Return-Path: <linux-arm-msm+bounces-101647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDZGA2rHz2lH0QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 15:58:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1C5394C8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 15:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 055C330541F9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 13:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8C438F24B;
	Fri,  3 Apr 2026 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lhspZ84U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8282C37AA81
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 13:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224522; cv=none; b=c6pQOqjCy/wvwwzO/FgwAgBwkkmunCm5MOdb+hwtAaXpkz+yZST1grKyPjbulgnPr2q67yX6u+zuW5XsU22XHcMkmiEU2Cww9pyLcBKQWJLRZ5EyDAfQAkt9NMVy83m+UaqFd8RwBnXJgQkLqEMl4zCLY4FoiM5EP1QTGdFfexQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224522; c=relaxed/simple;
	bh=pHexCrMEYsMQQy8zIs+sRrHJ1/ttZ3VMNeWvno6IS14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NTQ3mLzlSxGe9zCJnilwX3lzYjyHg0cOj3qcRCYNc8QoiElOvjEs/KdFsJuXuH4yZN2H13wjp6IIRebe9HG1AWGB6o5fG1AGc8sccATwg88/m1nHLp7LzstXbE/FwdpxKdvQN9W6NgfXDhlQWARuIVBgGNE7eqtSvlh0D5jJoos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lhspZ84U; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9358bc9c50so272167566b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 06:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224515; x=1775829315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOCuD1EIBix+K2H4tXL5BYaPaJquyNo2g3/MFSpuIHI=;
        b=lhspZ84UwlEkwAdlqjW5n7AVdmK6VsAiJ46y93iH/lNolffn7OPkbasRDhuPcWmmuX
         BgOMcQcCeBibMYg/ffAMRc998pjmsYuwBu5oPVaP4pdWaJlbXPeIn4Fotyva5x8S2N2Z
         GPtxOVEb9oQa3XB23ngXTYBqUTWnXFSj9FexaYvclASjAlf0EvxQJ7yQWCPqi6hryNav
         fqsnytSrW3F19wTB1X38uE0aQCgxyEaeb1ztiAE57Nir4f9+L/glB++C83mbIgk0+dZX
         w019zZjzxC0qeMU0dlidIWaQwouTbryA+R77eZZRYsUxVsfoWcKCRTvxwFzP/pP5SD10
         nSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224515; x=1775829315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YOCuD1EIBix+K2H4tXL5BYaPaJquyNo2g3/MFSpuIHI=;
        b=iNq4xons0ScQ+qtAzJTBoQIEJ8YatsvM8BlMOaOK9zH6dt02iU8UjydDB5ouMLbn0C
         ugkm8ali5j5O/XLS869/zXIye2zfsi4g9hEKi7vU5fr+ZhPZCfrz1E7jd/c687OgCsCV
         Eqc4XWBTfJEg/EuAY4vdaWld4ofwaU9GSqnV0BPyZZREKp2f2jo6f0V7m5cF753V5sCK
         D9J4AiYnfXVHxWR60Jdie2/Flu+8g9iZBHxGY43QdrGB7tTKNuHeMaspdldFEyoyHX8m
         rHU2RB5aJnnPca0YoybzS82RuZpVBIlSVKoAvLsY83Te2pMjyjuGvgiPy9Sm+uMZf5g+
         Jo6w==
X-Forwarded-Encrypted: i=1; AJvYcCX26mMUypBb6VqXtzR6rYJ2Iv4EXi4CQHs5e194iQSZQkE1q15xWsEdhO8nWQJnjzM6FHtldHGSrQvKDZ+w@vger.kernel.org
X-Gm-Message-State: AOJu0YyVeAoy7kHqzexA2YPqVuTxQLlvqQ6px2aYHCIbIEvQmunogMvr
	Ips6MobQUiVKsgvnAGbrEacvwvsDSdaZ+8Ml6PvXaBFgwSYubpw1uyrI2dWsrRCh2Mw=
X-Gm-Gg: AeBDietr/19wsT/t+syscbY3wfoL1dbKTjwVw6Bk1T5O6+0HIg0DcR8ax9JekI1PgRv
	QAIQatvCzTaXbC1BKySoPdRcYkbLCn/Q0RxFTLbxm8a3G4xTYcB0Vo36nYd4p1m8z2JGlMJBxui
	XAkManAeVd36qendjWz7zIm8krXqpNyezrjZi8wvg9HY76fGHLsOetyPKwo2pZJcH4CZ0ZWYZiF
	hCXzNL8EW39VJLKY1CN4E0xT95aLHNgcOj8539MFzHK0paT5XBZzgPRQk5THVt6Qj+CvLcCNt1Q
	A+3GG3m4t3RtSiu9RFmONCH6p8+rUa2lap7V+YZ/qyqAGsHJxlhXKHLKnJGn2Z4togRuBmUT7Mf
	sj3bbJ0uEF41Nb5h9BMl6vJO2bjLtO6TEQfLLx3Xw3JJB0lFqNdFDTKk2mwTFSCFn90jSVgvlJk
	hOjWnw5n4iUjTNRcEqsNN7AYEsljRqEiEqdQvqO7y9iA+xLAmDxBO+IHBc+QR4tOEwmfdISgpBW
	kRkFB55zBonsC3CSI9FMuISwAnJJ0DvJp1Kow==
X-Received: by 2002:a17:906:5189:10b0:b9b:1ea2:97d3 with SMTP id a640c23a62f3a-b9c67924de3mr103637866b.35.1775224515233;
        Fri, 03 Apr 2026 06:55:15 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:48 +0200
Subject: [PATCH v2 2/7] dt-bindings: bluetooth: qcom,wcn6750-bt: Document
 WCN6755 Bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-2-393322b27c5f@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1081;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=pHexCrMEYsMQQy8zIs+sRrHJ1/ttZ3VMNeWvno6IS14=;
 b=XCK+78nLfEjrwFntw0oaIZ6QCMaMqe0pdyMGnaJ0nfiCKkScqZ/j56Z2tA7Pr/+6ADMeTVzTg
 pRaItd1h5BQBiCmYvoHhG6jioNRifeUAqMjZopZPnAysEnsr3FFCL+h
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,pm.me,gmail.com,holtmann.org,quicinc.com,sipsolutions.net];
	TAGGED_FROM(0.00)[bounces-101647-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9A1C5394C8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the WCN6755 Bluetooth using a fallback to WCN6750 since the two
chips seem to be completely pin and software compatible. In fact the
original downstream kernel just pretends the WCN6755 is a WCN6750.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml     | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml
index 8606a45ac9b9..79522409d709 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml
@@ -12,8 +12,14 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,wcn6750-bt
+    oneOf:
+      - items:
+          - enum:
+              - qcom,wcn6755-bt
+          - const: qcom,wcn6750-bt
+
+      - enum:
+          - qcom,wcn6750-bt
 
   enable-gpios:
     maxItems: 1

-- 
2.53.0


