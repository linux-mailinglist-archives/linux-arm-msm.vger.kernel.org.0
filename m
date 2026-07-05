Return-Path: <linux-arm-msm+bounces-116541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QgRTJBszSmpO/QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 12:34:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7E4709C19
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 12:34:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Pv9fKxqR;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116541-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116541-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F6153007AD4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 10:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCAE229D26C;
	Sun,  5 Jul 2026 10:33:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AD1176238
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 10:33:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783247617; cv=none; b=KWmhDFuhbKWcylHrzIi4xVgviqAvnENPTurkqKGvJoFtXLFCwMJqG4dsjrIbDJWRr4MAEmBNnY+i2i6sTag6lQQxO2V5H1PnPnBStf0pIKx4iq/aH07tsLOC2p6T4KD5AF7JPVRCih/WNR45eMPgsbitOb9l45vBDqHN3AREHRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783247617; c=relaxed/simple;
	bh=IH2rmdFf68e8sbNHOLcOM1yfWLZ8oytcgcEHqnHEMxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nirUF+HmuqM1G4O/bNsrxGcCpRkv8IJ/HyF6Azz9/3sgMGF7ZBLKTt8hSCIKa/4DxOsHwlvGzLJ72kxkSr5CCfVAsDVeK3rENWyBhpCkhmmNcxMbl87c0sFq6XydXQlh/zJ8o/gLJNE8I4OMWxg/qiBwYo7rnZSnZctW/+G0Mvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pv9fKxqR; arc=none smtp.client-ip=209.85.128.179
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-80cbb0688c8so28068567b3.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 03:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783247615; x=1783852415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dB/6fGjmkTqxYckhOj0WVrDKQ6UfwK7gmAtGLmYXX4o=;
        b=Pv9fKxqRb1Kl5fU8y1gnXIgL6uVEe4I+gAxOxw3+nqxKVyjSpVzJxR6GpItRJFbhpZ
         7nl0nVwQwZvDLJzzXQ+RafVfRiQ9cVNUPvsax4NaBjt6rcAEIXlnkNpoaD32mW2TEDd4
         ajafBMTW5hSdRAq7Ls2QGSsouG2/Tfs+qiKh8L7iP9H0Q8XyfDZ4vTGzIy0tslvXrHyH
         bsRTE53LvxTybQiqZFOvVkFqqSiinpt45czwKsrZtmiVeGIXinLB2YttRVTCuYRs6Mkr
         +D/6jBqVDsdfIUVplD7mX2Broowlwvh/sdVHP9BP4GaWRsDMakCg0EprNTv99Cfz//ha
         UaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783247615; x=1783852415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dB/6fGjmkTqxYckhOj0WVrDKQ6UfwK7gmAtGLmYXX4o=;
        b=E5pGSs9ufsStXL5stuUfWoj19YK43+lzZGLj7qHu127gOSN1ZSRcMQ3HMIOSajRgUS
         3HFOoUX0BdZkYbTyPgEqLfIum8UHA0lE84tFmCTwafAr1KJDgBqPCfgPR9dGxhu5sPRw
         pamxLtFlRTSzNBDrYl+Ly35k2WzET9oy+vOXCmZmMhM/4WWn5VpsoYDWkf25rAW72oDd
         V2ce3b0h5S1nT9nDYAZkYgaMmSo0C7klATtOcEYSfui12yyk5iqBYErUFBOTM4rsFYqI
         M5ThgFIwjLz08Fs7wStNM+QQAIxQdoE23rU1IVwD6Du6fRQEWjSiT4pw0guzS0BbaSAI
         jL4Q==
X-Gm-Message-State: AOJu0YyS04JhAmV70vavGhDt2nM5qTz008EA7iaYCQ0v5uRmT5n84G5p
	gjgdQ0yoocJk1zGs0kZLDOM5VevfOePabEDix1IM+F+41CpLvYZ6W8Cn
X-Gm-Gg: AfdE7cnQLVGjiCXYYKyLnlBepO3y3E2H3FPg+I2WGQAruc77jIIeu6xqKmbwLZJ5042
	BjwzgpmyUSd0m7tMtB6uSqtceFuLy8Oxe8G6ud6mAZZ/zQLaCLGzEEpASyOOCdzAOPbPDkus0h3
	cZW5NWhQ626zT5vf/YgNrGMyMCiQtpyg6FMK+/Nsjie9Ce2wpPW0i4I8LQTGs2jSUMrR+JJNUu7
	2CUHLkR9Xsb2PDYs8zdQAK44nHgBgXKjf4b4cKBTz/k0n7tYTODuIP0LUMtb6jzDUQ6/4bQx8Sw
	/999BCSNY2EgNSIfakjJDRm9WOJNp2Xrgp/ySx3Esy+pJY/Lzs7OUhKEPmE4IIByGKIq+Ci2Iqz
	sfV6cbD21QGUWnYGPUJHBXrstzar2uEy4XCCQGVQv3ZRur01pjLkuJ4oPNjZLMyXOGHOA9ZjL7y
	1l+QSN+ARE5RxDglrFJXDTxzVWXl9r
X-Received: by 2002:a05:690c:c4e7:b0:80a:9f1a:d48b with SMTP id 00721157ae682-81739bf2ec9mr69908907b3.54.1783247615583;
        Sun, 05 Jul 2026 03:33:35 -0700 (PDT)
Received: from crusty-box.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144ba2665dsm44421007b3.41.2026.07.05.03.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 03:33:34 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 05 Jul 2026 13:30:27 +0300
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Document Samsung Galaxy
 A52/A72
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-sm7125-samsung-v2-1-d3b17005ecb3@gmail.com>
References: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
In-Reply-To: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116541-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:newbyte@postmarketos.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:david@ixit.cz,m:xerikasxx@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,postmarketos.org,lists.sr.ht,ixit.cz,gmail.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF7E4709C19

Add compatibles for Samsung Galaxy A52 and A72.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9df4074bb582..45f35141bd30 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1036,6 +1036,8 @@ properties:
 
       - items:
           - enum:
+              - samsung,a52q
+              - samsung,a72q
               - xiaomi,curtana
               - xiaomi,joyeuse
           - const: qcom,sm7125

-- 
2.55.0


