Return-Path: <linux-arm-msm+bounces-107716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFm8NS6zBmqKnAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:46:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C42549B56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5AC9F3092D8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 05:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B6836495E;
	Fri, 15 May 2026 05:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8czAkuL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D232B364025
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778823790; cv=none; b=fdc6IqVoeBp9VEpLfGQISnbZvWRUh2ODNZKjaVeDFQ4pT3i3Jhrg93PElF+Q3iu54E8eDXPSsPcwfJjVIbIYrsbwt6YHX+geKZZrflGa0qO3cDf+XNZ4qerOF1XTac8qCmOf6Y7RHG0GfOsUbuS0dEgYyS7IcRXIQd2BlTW6p4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778823790; c=relaxed/simple;
	bh=SiUP5HbQ3G7apTtOZhLEzXF9Q4mu0oKKv/Ar7YPzG9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c+SYLJn0veJ7+wAe3q+IBJFNN1vImkmQ9NKoJnCwJVdtJYCJoa84FBdssdPMpX2yTdaF/qo55dRVfZ2nyF4CPbeo5/hv7pItdPcwptag0tm/gQgK/+xXS7iM4jRuiaWXpgJUypZSQzn3D166R5bWa9wiWqbDHejCUfUZFXALqwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8czAkuL; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c80148ae949so3873202a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 22:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778823788; x=1779428588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGxg0Mcj6I7tC+AGT1Hg22gidJPewv2bFQbIhOlsycI=;
        b=i8czAkuL1qW7uKzNR3k7OK4djrO5NzYP4Acolbdic9GR/FqgjvJcz1k8vkm0Ft3tAi
         BJfkl28OfMhjrkOLzhzYcCR2yWaP6o/I1MquqZxPaa4BCUM5KVXoTGj8vDHfURZa5Ikw
         ye7cov56zt8IijoCeD236toJq55mOhtNG+4B0P44fw8jrCXdBQlmJcbTfKFZT5mMqzrP
         /ZplfFKJ/shAl4ZHU9bBKAnfmx1nIhWNFxCg0/6WgRmVJShMggzza59UvsImGxBjPiGa
         RB2QtqbQRZ62bNtj0XSPY8NTXCz3R/SA0ydNmemq3RsqD+Vd0U8W16cXW4AiB2+M3ZZs
         iWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778823788; x=1779428588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PGxg0Mcj6I7tC+AGT1Hg22gidJPewv2bFQbIhOlsycI=;
        b=rQafvHOlMGFr0OsXwse66l1Rs6Yep8naADz28Wh+R6vFNVkolUKOHzbGtJlTYJLl7V
         /wUGFQc/e2DdTF1uOJroeSj4QJ6iKAuZrBMyzDLpkK4HQF73PsTX+YfA+Di/Va7RF0MR
         mBPJPxqMCs+DcY7pCeNFnbE0Vz86pjQEkoTdJxM3Mtg3ztuYUcuENeVUaR4GMIM2ZHF+
         80CCdK120giJsjAToQqUBdCO6N0Q6hX7GeDWSeOWnSD4sPoO2ydn67liP5+fpgQgP+NH
         76hKgq9XnUhp7ckzlTxeUBLoD0L6RHvKsqMrSAXt67xvwFEQ0ZWPtSLdToQCy7pQxD4V
         bZJg==
X-Forwarded-Encrypted: i=1; AFNElJ+cVI8szYraDlhFJ+9yF51/7CNcor/G+/MEQVlFiSjFrM48sNnvx1yUgPrzWqENWoZVHndxKSigPe6VlGjV@vger.kernel.org
X-Gm-Message-State: AOJu0YyMSEL8W+cVr2nwMijjlqt56dl53zgop9EmZo1Vu6x0bIrjSUfC
	jgtjB5VSrtuZ2mtjRWBiupzo6Z2Td/Q0blLacsWCuZlFJlczBUGNinjp
X-Gm-Gg: Acq92OGDPB/K4tEZyjAJIyUZ0P5VYGHRysBM+cVo0eyfUaWN5x80aDoxlV3Ug+Ud6Mv
	Pf60iKmhOoJ8edM95oj+G1cAX0gbmxo8/4qSsZ+b4nG1A31Rh7i4nNp4EzfDD6/aY1fuOCVKy6k
	GwtQ99P4wXf4n16yuyqT+ZxgYvmJBkzG8HpNKT8cenbkHOco2WsnHmtwHOUiXDgaGWtW3GSt1GY
	gIqe7Alt2O8Y2vLm+aakHCNdlngXNhs1MVFZZChJQ2Od36OAlBSX5p6UfpKIzFjayxJ+/VRZXZF
	5Y4tcIDs3mAWqqY7vE4cZQUZ9BLmbG4MBkqGWiS0bMEfWxiqIRy62O+BcI64sclZ2A9zUyZCJID
	ozN3I3aiG7ACrkDjmHmaWtdpTZUEryWDkjj1EKi4jotqv2J/2cMku6b3LpK60rWp9UeoxWUHJtF
	4LephK94lXfMDHoWjO7UMfJtAaHf6xpL8DNUeoehDZupl5o4ty9gJV8SVZrtCfwKAZeXIjOfmRA
	e/8pCulByto1EKPS8LO4PJmzLo=
X-Received: by 2002:a05:6a20:158b:b0:3aa:f9cb:d43c with SMTP id adf61e73a8af0-3b22ed00276mr2807800637.34.1778823788168;
        Thu, 14 May 2026 22:43:08 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.wework.com ([203.117.161.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2b9bec8fsm3106116b3a.33.2026.05.14.22.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:43:07 -0700 (PDT)
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
Subject: [PATCH v2 6/7] arm64: dts: qcom: hamoa: Add inline crypto for UFS
Date: Fri, 15 May 2026 15:41:51 +1000
Message-ID: <30c12b79c6cc481afb13ac93630c5a16bc856ae4.1778822464.git.harrison.vanderbyl@gmail.com>
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
X-Rspamd-Queue-Id: 54C42549B56
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-107716-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,gmail.com,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gondor.apana.org.au,davemloft.net,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,1d88000:email]
X-Rspamd-Action: no action

Add the Inline Crypto node and wire it to ufs_mem,
enabling UFS storage encryption on x1e80100 and
derivative SOCs.

This is needed to support encrypted storage on
the Microsoft Surface Pro 12-inch.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..22420d0a323a 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3952,6 +3952,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 
+			qcom,ice = <&ice>;
+
 			#reset-cells = <1>;
 
 			status = "disabled";
@@ -3997,6 +3999,14 @@ opp-300000000 {
 			};
 		};
 
+		ice: crypto@1d88000 {
+			compatible = "qcom,x1e80100-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x01d88000 0x0 0x8000>;
+
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+		};
+
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;
-- 
2.53.0


