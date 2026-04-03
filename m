Return-Path: <linux-arm-msm+bounces-101638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG+MNSuuz2kjzQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 14:10:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EF7393F10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 14:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 256FC3011C78
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 12:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF3936657D;
	Fri,  3 Apr 2026 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQ6AMxUx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125E13254B2
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 12:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775218130; cv=none; b=lFOtgezWSxo4j/9vL9Eg2+IIoF/oyKX5UuvOikS0BgKTGBpYWhATs0B7gIHGPxloUezMDoTOxtPOHwZZAJk+hElEc2ABmnm3d0M0WOlwg/KDp/lLQuolKvDFF80lXbEhojA2OLQneZd0MlS+vWGPf+YA/RSMFn3NG9+fzhVAfD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775218130; c=relaxed/simple;
	bh=W78zLFEUBYK3Umfr5VFantLvQf8xy7/WNThoCj7zKjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oIlzfrQ0PACI4hi43sPgtjOcLjrTsjMPGR4xn8EqqR3crJA9ajU5muYMe8wFNI1XI0MGpViIQOSR3U0f6ZZ3hQQKAQSYrQv2YILHpxjtLJHqFOyWC0Ic24xfh0a79KP9vxh8QPd+sqMkmXTf8sulxUERq54TSADcpIiiCWjggGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQ6AMxUx; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35d971fb6f1so1585569a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 05:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775218128; x=1775822928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5wmsZ7aJLbe+iLC+rK57UUTbvfLEuAbzyuSZU/YdcCM=;
        b=lQ6AMxUx7TuvJrBxIElEKe5hsMDfoOTuP5KcomwZlVh4lBnac78pzHHyZRAJ1ukB6B
         wx8FncOvdqVj6xdzUznyiOuhSR0IafaNsi1/v1Yk36+faZ/5pz5r6etPkeSAGReFSVJP
         XXLVoVEjUlJ6CUQfAaixyBrj7pEq7tcKb6mkZquM8MVMptIG3vNmTKTz2iPPGSbSc0nj
         gLZVWg7ugWy/gFWPFj4RfDXOAlJAt+CUrtOsjhPj2wmkC0Pbt5yEWCWd0XlNqsay5AX2
         bCSXuqfjRUVhsRwZk6lmr+t4ogoS3wmBpjySr6+rcJr+3BUCIYTmPdDwbuvoiTyJQCVk
         pD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775218128; x=1775822928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wmsZ7aJLbe+iLC+rK57UUTbvfLEuAbzyuSZU/YdcCM=;
        b=mGoa4JJ16GJcRoYscllfihNOcdre1muYLv/Z/rkOH6Kw7e8sLa+eYlxJABIz07B4Zl
         amp1tjsGyn4aY/ijfRRrVu+dXjJv8FbR4ln/jehsqJSLs2LynUq4Ij9sL01gV/89uY7T
         zBHE8AbliCQen6e6p5zBGmjGC0rFYWrroMotZKW2y8VJ09KKl4aH18Dww72hofmEylLW
         jtzD9KlgysvtIpM49/cQbvefRTyS4gPRKO2ydhggX7UvXJxQzWvTMCziOccDpGbnldFn
         f1e0FgvJjJR+mMuMXMSNUel/qQh1hFCwn8QW1dRobbnjbftAMIRKnk/dbhDzvr+nAuBg
         Nk0g==
X-Forwarded-Encrypted: i=1; AJvYcCWbi5wUjWwlMerm7sr4Td3Qm9vQpHXzHGIgIhvmryod/mP4VPYebLV+ULF9cTk4JN4N/1DUJJebFYdiaT9z@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq4I/co7LBNRvAXp8uiNKoxJVl1XN3IUV2j7VK1cRXjIcFnuIl
	JBTKvY9/kv6q/ik0NWX3zoXJM4phfHKtbIncqHX/9ETMWskK4nZ3Z+lL
X-Gm-Gg: AeBDiet5KPswvqSQCFJzeGNRp3LujZ+iKeAcYcA+7/a3NqTGDn/cyQVKKB9h14HhuS2
	cENCM7D39v4mO3Uw57lEhgFdaOPSf6J+ZBf1q6MYdfUuzWf20TMAA6ZfZ34Dg7/wVBEsAnmrwkW
	wDjEGrqlfJG8D/i2MzsC7nnDjKoRa1QKMQAOwTAnyKcZy0KdTMdWDJOI7SGSNldUl3Xq9fjg/IP
	Hz/GCeLFrtfm6kYkJwtKXPcCF1iU6pAEj9QhHISr+nxVPF/2Sxknz2hfnJ/RV0dyoCSW3EB7qEy
	Ta9o8mNfOur28xcW0CtJ6lcVTo4YDQ+xXS2AJTNudlkT01hZtgGeO3Z+JsykQLEMWQlOCmLfPxd
	XCWd84SFT42oLluWri0Jfmxm4ZiRMpAi0yQukIWvpyZZoExbC6L/DZw8qZ+yUqdeg21zCXFniQn
	MK5Nc9/Q0ZRVXSAlrxAw==
X-Received: by 2002:a17:903:3c47:b0:2b0:67a7:5c4b with SMTP id d9443c01a7336-2b281802d24mr32407485ad.28.1775218128287;
        Fri, 03 Apr 2026 05:08:48 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274979d5csm55240055ad.38.2026.04.03.05.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 05:08:47 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc8280xp: Add ADSP FastRPC node
Date: Fri,  3 Apr 2026 20:07:52 +0800
Message-ID: <20260403120753.105869-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-101638-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.3:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.5:email,0.0.0.4:email]
X-Rspamd-Queue-Id: 74EF7393F10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the FastRPC node to enable offloading compute tasks to the ADSP
via the FastRPC framework.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..ee02acd18856 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2966,6 +2966,33 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0c03 0x0>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x0c04 0x0>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x0c05 0x0>;
+					};
+				};
+
 				gpr {
 					compatible = "qcom,gpr";
 					qcom,glink-channels = "adsp_apps";
-- 
2.53.0


