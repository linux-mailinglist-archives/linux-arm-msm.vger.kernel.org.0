Return-Path: <linux-arm-msm+bounces-111861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TryRJUGwJmrWbAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:06:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 316CE655F50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:06:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=D9UV4agn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111861-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111861-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C44F3010922
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 12:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9922372EFB;
	Mon,  8 Jun 2026 12:06:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16198376467
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 12:06:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920376; cv=none; b=CfL7sdIpmj5sXcgfPz/dX0YmYmVrgDsrir3sZg8wjJOrxNjNq/xSZiwJ3EMd5nJ4mkV8dLdrBrd6EEdSC8Qu/E6/FMpszV4atLmU8ABqjbKcfhTxLsiT7uQmlyam2hN3yDZKtBwUK+zq8G5J0VzrM5raOIlxIGljYS+B2r50dhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920376; c=relaxed/simple;
	bh=I0MRNDhtPil/XdRFHR6g64yWZF1AHbnM3WQ2SyhhCNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uxrgPss7XN+DW4cjLxyc0nTX1Ji0ECgR4NQ6p/dos4rIVaD6jN8n0ZWJj6MBr6BRNmKvdIqD/uUqmKLq4VhPb6E/gOgmlBbs0r1DcbpuLaVikAVFZcDD65p/fNpohIp7zSIy3HiKD9vHM3eXdotOu+ddDnIL08TIHMpFmXaZrXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D9UV4agn; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b9318997so30987825e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 05:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780920373; x=1781525173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPTIML/fjZVyuVRpqLdTSfDMUxOQRLiEiydHZK8Z8OM=;
        b=D9UV4agnLMvlH1l0ogLRYjFWHvUNkJjYeOiooKlczeU5XSzmUg4DamUt9pUo2dMGMx
         r+P3oFcoUmEKv2lWMkkOvDuP20uHum/25SGwOLKTiwus+KbDm2LUg7+UoVSY8Ce/qxeq
         lRA98vk3oe2hmAI9rj6HTUtehPyDsXHUjKIcUdhSNf8zta0TaVeXLMGWoJC5AauXHzKX
         aqitmqH7eCS5vG1peXdWBWyKOSjMznxK70adRsJWelAFArR7lxjjeMBeBNQZYowVct+B
         QL3K59owyIY461tAkuBbeBUxOKsv0/Vuza/nKUtYoISY5nA2eCt/Ty3diOS3nVcqpUtd
         HHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780920373; x=1781525173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZPTIML/fjZVyuVRpqLdTSfDMUxOQRLiEiydHZK8Z8OM=;
        b=sOwvZHV7/0wS/cywwDTGxdRr/0hGGm2Wi5F07kuq8zsBKKfdYBMgwEkXIUmYXhk18K
         Qh865iU3Y/oKCgLmzQurGApuQLy47qIcmwgiUl0sxv6eAjcOBKAapPOYzfkbLTZOXOfF
         HUYzb1K3OBjczSTpBqeH6mmzS+LkgRRaE6jS0uG+MO2/ZHCILQmX9tIkO7j5ANfB4qlT
         maGUjs5od8d0UO7bWbxk6dAdM2RkrZCrWbQjNNbbQRL7lco9URqFsewJIJWrSQNAAaKA
         0qj3D3QrfY/rYB5nuyizKfxjFcT5qggVsBDiIfyZR1VfNsAyZzmENmWgPir0qf7ldQKt
         89Fw==
X-Forwarded-Encrypted: i=1; AFNElJ8pBdPj9wzmq0fbDlCEjfghEr1Er2+ixwoigHgyyQF1CuFH+0c6TZq4G4RvhT3xS4588pwqpNva6mCCwIA9@vger.kernel.org
X-Gm-Message-State: AOJu0YzbGS5soeqLw6giLNHWvVeOxIhlkwYDchCqyyQVzNSNBbhADeho
	v++snSqQH0QvLgJyP2uEhnOShzWS+klmBSwKJ8+UNo9OpGl8cpUw6+qaAO2QvSqKjxw=
X-Gm-Gg: Acq92OFPKDdo6SEqyD2W4yXWxfVZsphhR6GyITe/oQQfdtXHQYiEQ/fzPewFqRtiHoo
	eAcmTyt7FcQgdWt30gmudcQyrQhcOHrPztJYcXiC9zah/CkM0REXcmqMJUpmgbuAuhiKwxbgYiG
	eecavZuw1yJguEYSEXaA9/BTNr9UuMIz5obmU0znbAzcK8qBN+w0KpM6twT/z/JJltTjJvUv/s4
	3EjLpAWWZrsJpAz+Z3cnXQw1ZoqszgRuBVu5HyRKMd/gW681+fVUB/rl2pClmLEb99VxJwKZxPV
	1xywGl/qx/pS4CYiYb5Gjp+RDnf3KRrdOpoLLu/RBIzybIHTQ8fSClr6O4rIYIIrUSYvUivHysq
	lfW604kFni4MknxTJxJQUgzVlDTW69q8ABvrwCnnc2jr9IyvcL986vtBNJEHQ28KMOzzNVE8skI
	u76UpJ2bzMuXdUArPnwnVbke/MKj0g3V2zcuDis3YKZ0svY58vAj+9Hk5CoQ==
X-Received: by 2002:a05:600c:6087:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-490c25b0231mr265490125e9.11.1780920373102;
        Mon, 08 Jun 2026 05:06:13 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:7dca:9001:34e4:f362])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d30eeasm250331745e9.1.2026.06.08.05.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:06:12 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 08 Jun 2026 14:05:43 +0200
Subject: [PATCH 1/2] regulator: dt-bindings: qcom,smd-rpm-regulator: Add
 PM8019
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-rpm-smd-regulator-pm8019-v1-1-c671388b9ea5@linaro.org>
References: <20260608-rpm-smd-regulator-pm8019-v1-0-c671388b9ea5@linaro.org>
In-Reply-To: <20260608-rpm-smd-regulator-pm8019-v1-0-c671388b9ea5@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111861-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 316CE655F50

Add the qcom,rpm-pm8019-regulators compatible to allow describing
regulators controlled by the RPM firmware on platforms that use PM8019.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 .../devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
index 0fa0db7eef23..0d8bc9bf996a 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
@@ -35,6 +35,9 @@ description:
 
   For pm660l s1, s2, s3, s5, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, bob
 
+  For pm8019, s1, s2, s3, s4, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11,
+  l12, l13, l14
+
   For pm8150, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, l1, l2, l3, l4, l5, l6,
   l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18
 
@@ -94,6 +97,7 @@ properties:
       - qcom,rpm-pm6125-regulators
       - qcom,rpm-pm660-regulators
       - qcom,rpm-pm660l-regulators
+      - qcom,rpm-pm8019-regulators
       - qcom,rpm-pm8150-regulators
       - qcom,rpm-pm8226-regulators
       - qcom,rpm-pm8841-regulators

-- 
2.54.0


