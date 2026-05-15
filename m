Return-Path: <linux-arm-msm+bounces-107711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF4iMWeyBmqKnAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:43:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CADF549A4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0C3130633D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 05:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C773630A3;
	Fri, 15 May 2026 05:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4zjnFXG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A03364044
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778823751; cv=none; b=Yz5/k0vfDmbuT2rVtftcmQ6UGFU0d2ATOtzcPEOA5Eg42b/3E0NFHVo9vU8ETyo41LTA/fDYJgcVL/GULdPgRhUWbQ5jq8BPXyBOijTrAwqmQr3xwnMdNB2PeBJOu5PLB9aVlx/e7WBTTk4LIS9u+PO/i/+yt1p5xQ3KX8baa14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778823751; c=relaxed/simple;
	bh=aVdFf5OymMVSZ4KFTnooyC2hd0qHH4hvBzmghV4dLpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IvTnqrUNI7DuqXq1kbs7kxPXo2EPJoDt5VlzjmI3nEjRbJtOshfDhK/dyVb2xHzGiM/IzzxNdBbU0y10kBqL3H5fnp3oC1lUM4bnyrdZoA1JA3iCcw8FVsm93B+IvC760iUPtTf+l4Ys5NaDYXU4GH4AkBqBBwk1wA44rCvR82A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4zjnFXG; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82f8b60e485so4387718b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 22:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778823750; x=1779428550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA3KbxtyArVx1TPayII+4ue5MWymrrbmptjetuH5M+E=;
        b=P4zjnFXGHsF/eBNiA1ijEPqz/NFATd7mTH554p4nTpVHGlaiIPzSNPOmme5yz7k36/
         DpR+N6STAkUWLTeCPyD/lw6+zaxnuRujKlOW9C/Mkk8GC2CGSCTTQEQ97eSY2tQcYWUJ
         ZQnYF1HtCwdD2QRW8eNCHv0gDugHAcmUGi7FOAPubXii4tDsSTxtzhEPxtSKK8YwhQhg
         ZgvtVdaNIo61i+GjMueX74rfcfVleUAT6JuR7FrXQd4MMDwJDhQ4Ghn3AN4a+drWzJdB
         mPQ9mL55ufgPy3oqpt688fTl8gcE0PnrU8Fm/9F3nkoe7CQ5j4byS8klEGelMiWokk3w
         Gvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778823750; x=1779428550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uA3KbxtyArVx1TPayII+4ue5MWymrrbmptjetuH5M+E=;
        b=o8MxIoIj0i7idt1bpKo7Te6d7x9SxYafcIXRJRjzNRMylebyulOC2hZhHQDhs2mIOY
         JXgl5M3zYvispVVK7X1gjb1yUJ3MeFVTOL9njUIHNvDqyIaqVa2qv23MPjMvg+QFRVx5
         CQdwV6lppmIIXuv0kbmnO/Vb0nhvLl2pgP8YZJ4gtA59bKt4FeeXjDwagc8tMB2nh90/
         gYAWf8DGhgKQ99eYL/oWcuPQrcFcmFHyYLOXltFgjtSUaaIPqhuwXg6j7P4sK6KYNF6B
         iZd/HhRGF7ysxVhv9FN4wOtiIHSay5jikJPfoIbHvLm5Mb76+LyoPT68Ks/Goea+JObE
         sLyQ==
X-Forwarded-Encrypted: i=1; AFNElJ90FlFe8sQ8ZkUZ/qUumqU1zwp9/QTpviJzyGVoXgfO5NY0Zi/zErArigYb66H8isLsmK1TIfL1dV/N8vLq@vger.kernel.org
X-Gm-Message-State: AOJu0YxCPnwT73pbElVTTwEunIRg+7TjgojxcDTKbkCjnLKjEf+vtvAB
	4NYm/n1zA62tX2/uRdG5Kqyrx2fATN97MUkqL+Er3oDmGGM5rpOboWWy
X-Gm-Gg: Acq92OFR98wsP8SiCH3wZ8m2bxenJhWcHNqXBsM3Z4qMfAQTbQqgOqBXKcwYM57Z8ay
	9TcAMa5lg0MuL5B52559DAcr44OSx7xkhEgQ78UcUjcwu6SNRoeVedJUsDkvyoQZ3HrJjTVE7HW
	CAJt2PPapCaq1o610qJGTArq0rhGbNCktC94Bmj7Q5sS/OEN2PnqMq5KNvz4niCeJoLk11BsBNm
	d5nmaYzqQ7L7YfsflHrra4wx9N+3bUvjB5j/X2Wd628nhZ3ob8WsymglzbUvO64llNB4RpaMKCp
	HjccUYUjnVNy8WNxlMrMW0u36GM0srV8+enT+/yzPxhXePifJ27jrU364DsQKJDV6BFauLBjgkN
	FFugBtm2i+RZciAEbvbhVbrCPGXTtT+fZKD5H2blWIs11JTTAKnkYqTRZPj61wROsuZd9gsX80H
	NbP36JeEIOddjB0XEKEOY4EDH9/b+B/RbmFyyfss85OWLT4SW6vZU7xQeubE/7xQXIxkxyAiXGR
	Sl1vfkeNU5geC9V+iMLBtGSJ3o=
X-Received: by 2002:a05:6a00:2793:b0:83f:2568:d456 with SMTP id d2e1a72fcca58-83f33d277e9mr2723997b3a.29.1778823749726;
        Thu, 14 May 2026 22:42:29 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.wework.com ([203.117.161.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2b9bec8fsm3106116b3a.33.2026.05.14.22.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:42:29 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jikos@kernel.org,
	bentiss@kernel.org,
	luzmaximilian@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: arm: qcom: Add Microsoft Surface Pro 12in
Date: Fri, 15 May 2026 15:41:46 +1000
Message-ID: <e54aa6c1e190b0e26d58504c5ea1b05fd09d64d3.1778822464.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
References: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6CADF549A4F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107711-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[chromium.org,gmail.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gondor.apana.org.au,davemloft.net,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Document the compatible string for the Microsoft Surface Pro
12-inch, 1st Edition with Snapdragon, based on the Qualcomm X1P42100
SoC.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..aaa9a129908a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1168,6 +1168,10 @@ properties:
           - const: microsoft,denali
           - const: qcom,x1e80100
 
+      - items:
+          - const: microsoft,surface-pro-12in
+          - const: qcom,x1p42100
+
       - items:
           - enum:
               - qcom,purwa-iot-evk
-- 
2.53.0


