Return-Path: <linux-arm-msm+bounces-109839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aP0NClihFWprWwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:34:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D520B5D6939
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 194EB302BD08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BC33FDBFC;
	Tue, 26 May 2026 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/nC6G6E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC64D3FBB47
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802318; cv=none; b=iS4fqVfqne/tB2vAmxu5IDmf5qFDRAPS4VXyOqVPzGH7UHU3JIbeRoxL6JtWKWDAvTdoraGzeveBzaub4hvPfn91evJHkNWeYh0P+G1gQC+fS8vH24iE/Wb9JlOmsiSbEqSvAVzN4gOIdQuWB8Dyovig3pPXWqNQ2onsfWWSK3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802318; c=relaxed/simple;
	bh=Wt9SYaYbBekuvxG0W9GzirhObD5B5YMMzByQDBZ74uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nE21a8FOGq/w34EuzNt4y7OCZ9UkOa05IuxesWkkj14e7tROcR2APwOaMAJuwegaeaUc7ry5x+8gJ1yyqRf2+Gwcv7cW5IlmFCpEyCjagkH78Xf7mdUiCBkh678WOQtEFzIp7TwxM0Enox6Rb6apuTT8UeXT2DuuHN1NifmqvCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/nC6G6E; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso51046715e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802304; x=1780407104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=i/nC6G6E6uI9ZNs+tzZR6vYgyFCFEl3iIH7e9yQCNXjf2n2oF7gy0lJ65OAv2C41uS
         TfMpWecUZr7XAndGeVLxU8DqC6UVvi08EkA32KrfBgo0JZOCiItDpsL9PYjBebzZm4c4
         xhSy1w+tFAvWcWaXbGBLr/DCILszKgUnH2NPHFeMRDaahXzS6IT+vZfQ0WnixXHIbGgK
         wt0MPC6iolbAI6tkh2UblxEL2BCOg73UZ3Vv1AJcY+bayuKkRhESlxLCO9ZLLc9EqKUV
         J8pqlgEjQNcjansyAoUUkstoQR8tk2QORxOxJkexg2Wn2E8o5/DU3Uqjgai8GsxKA5bK
         feJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802304; x=1780407104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=RMU20T8YQB2SrmnlMjn1oDi3U8HSWRbuffkbiDX2RAWLAlehD8vb4cq/8I/sQp2ikq
         gbt2bR+8N6GmMXGV3iLM7QG+YgsBCTVS7+nK5kp2wwqiUjmx+Qpdl5zdboYEWa85sb/4
         FGYbY56yBN+PaFjOkhY7dyu10MXbZtYlq4JhjNTwrhT1yALcs1sJ+JxKsOJSFzqTWRif
         vXvOUsbw7iXTsR0UDgx6qH+4xWgIYR6IVi4e3uwQe4lVbCSfJCOtQDpI47N7ENc3favg
         KAYbDuOqyoM1tj3EknKuWWCSSg9rPS9in0oNlrpDzbjkvemBmH5ifu8qxkpO6ctCFdaK
         a5RQ==
X-Forwarded-Encrypted: i=1; AFNElJ+894ethxReVr858D2w4Qxni+9K9fs2SQSrsOgr9aifTv2ZEnjJxAx3DfZcsegx8mclDR8Yg6zQzGCvYzLC@vger.kernel.org
X-Gm-Message-State: AOJu0Yynj5oRgPjVCmkHPwFDfXhaM2vPLxGBQ+ID9BIqRa1ppI5O1ADW
	Sbq7lZceud+WIxNFtJOfh+MW7inXaMWM0/IjCKZ318qqjEjWZZ9JdHil
X-Gm-Gg: Acq92OGJOfnbu1yaafXqam5BmZN/KHtMJOtR0u0FSUEs/BuyzXsXHqcf7PenoYZl9du
	icoslnNwoWJ/zx2xijiU/7uQ/7FGqyhP2NVbBwDo/wRaowZBTEyO056qJqVxVNG/mM5sAEeXDpL
	7xr/w0XqtEL0Yu9hkZZzo2vCtlTQ4S1m/a2oqBLeftxUN8/dZtAxui0IyOQTYTn2PiiGnuCMVUK
	2UHqBWItxZTgaGaLnisiTq7mao5F3W5/42hXy0JA2pNPtZDQOZKMzQmBkXjFXAqiiaa9ohVqbtn
	yKpv4B0D2vVLm4vdM73HaktZGMfeC8jND8BiFDodWGTE+XTByq5nnpygzQsW5RN8aW1IzsMhwce
	a8nf+DQ8xBk/D21p+zLLDm8yUbiYNvyJMgHIXlMK/fjJPwcs9jJfrfvofnIhxuhz0KL7E4puiC+
	IpTRi5UBRtLDa9w5SVxu2mChZcxQ==
X-Received: by 2002:a05:600c:45ce:b0:490:52c0:73f1 with SMTP id 5b1f17b1804b1-49052c07823mr225521815e9.9.1779802303562;
        Tue, 26 May 2026 06:31:43 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:43 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:29 +0300
Subject: [PATCH v9 6/8] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-msm8939-venus-rfc-v9-6-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109839-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,apitzsch.eu:email,1ef0000:email]
X-Rspamd-Queue-Id: D520B5D6939
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: André Apitzsch <git@apitzsch.eu>

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..71e22584a46b 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,29 @@ opp-19200000 {
 			};
 		};
 
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8939-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>,
+				 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "vcodec0_core",
+				      "vcodec1_core";
+			power-domains = <&gcc VENUS_GDSC>,
+					<&gcc VENUS_CORE0_GDSC>,
+					<&gcc VENUS_CORE1_GDSC>;
+			power-domain-names = "venus", "vcodec0", "vcodec1";
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.54.0


