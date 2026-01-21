Return-Path: <linux-arm-msm+bounces-90024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GRYM7vccGnCaQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:03:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DEF581AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 931DA6A4F5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2B3494A0A;
	Wed, 21 Jan 2026 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwiFNn8u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB44F49251C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 13:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769002003; cv=none; b=up9kzSW+bA1PFgvMfs2UuEr8aFJ3wQBOUoOnG0sMEl6PhSobbVHI63Zx8Mf2ScPFhwSsHB7gosJshtQwt21MtPiTTUX+QVYJuD3zA0WwcxbYMOAUGTgeEhw6CtVJRie/hOrOhzRQjROuOFrK4+K+nDPuZnOHozYSBksotcO7aB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769002003; c=relaxed/simple;
	bh=hB2PWZM4ZB4CYZFskv7vZ7lEVdcGMkMbujOg9c56v/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CenvoRrmMGxoKZtfqHlDaYLek20SFiKuMwmtBYAozglOi+FIYWQOD5kFNeeDeWk4wKZkKJ6pWm/GJSzqHTcXqCvZfNqI8IG8C3DNKFhP/vQ4LH6dzMaPEpQKoIdwGa2zpDFuVNzvYsdXk0Wr+fU0NHqxC7pYYa9Dy8TOTNy4wUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwiFNn8u; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a7b23dd036so2555665ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 05:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769002000; x=1769606800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+7aTGNuxDFTgmCknBnDaH+B7WOs4xXCLJbz/Zl7coA=;
        b=lwiFNn8uC+rfRIsxEnP6L0qpRgKk1Vc+OVSZFlFiUBkiWgTwKC0vvFfLn99HjRZOEl
         F3r3KnoXSXbcy0w9wCdvnCUpnQL1n/XHxECmn76zgGVCOjh89gyswjn0Y+i6w8XSQuEh
         GMt3K82Kw1nlwwNR7YBfc+3DI2xdAGUoi7DLbBB+Ty1ToC0orD3mufsdHHMR/Nbbnp6g
         NmsvCIZLeQUakTPApk1lJw9kHKR0XgOtaPOPwudrBK39JS06hBfs/LHvdUSB2n8Dt3Eb
         3s+RA5zTfUMwCKLyXkjfETG5zWZnKjsgMwywpCZ6bQ19JXhgu0AhcnGyq+QjvgNNhJ1e
         MbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769002000; x=1769606800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R+7aTGNuxDFTgmCknBnDaH+B7WOs4xXCLJbz/Zl7coA=;
        b=fgdQqXudCmxArnhywRo6SQwBIo7Pdbwq6DE3jwv35FWIOGPPxxVBTufCvxerQu/Hsz
         2WGj+gZiAAToE1GWP0x84P+HZ5CAQVOfuxnShkN5lo4C5rdNJ0vpRNUEi9M7aJKKkvDo
         rQWbq39Ow18YqpAYU3dQNScxNakVBtIn+6Uhy44eO+tjGXqIxy6WR7bYwmjH5gbBQ4X3
         jGgxM3MlxmEQ+K0k88hGlAWixlnpwHky87oChbujejXcxLxuFgwGHx+qvLaGt70R0Vq6
         2MJYFEnSOM/+4nA+O0g5MbweH5AKcdXT0yANn2gCFv0uXmMtFQV0u4glXgvTHkfi8BSd
         8wwQ==
X-Gm-Message-State: AOJu0Yw1XZrgFx2VMmzPzWxJdKZpD+/kunURzdUv4R2NfSjkEcMr4O6c
	GAoSMVUqQHuRIEGMzT/ushjxkWTIgKga0n8j7ZMGpVrD23Kmpfz7aMYU
X-Gm-Gg: AZuq6aLLjC2QIpJBsImR3bqQ7Fx5rdB8+yqOk9TlTjzq4RsFf+oV0xUUdMQZkzFIsBo
	NbdPCLFP8wt8foTs/xwV2i19ECndLtlvHLdDD9du6NRB5eVDdw+yHAlUdO4Vjp9rB26RQTnjQmO
	9YpdaNYFtAG3Tg80D5qzcTA0g+3UNZBY5NaJcrD7m4BRQeGwRoio8/B07QichyNLja37K8vIY41
	Yb/Obc4Pmt32Tx8NPXS0WFgUBDKbGCmiYuCXmFz6qOUR9lq7+KDg0munp2YB7Tkp72nBOGsiuzl
	4QChwnadX/5tF7yueitxkmCjS3Se/GotpETdrsVoyDyRG08xUR6ORNeMQTrY/XPCJzrlN0i/MhT
	X0pU91x60ErI5CLaamOxXaOsG/AMqGvtaMdG+Gl3CXNe5kDXr4DBum38kxsV1Y7sDwfPpvyS/zv
	1r5NyIdkrSwU9lbw5A
X-Received: by 2002:a17:902:f745:b0:2a7:9163:8e68 with SMTP id d9443c01a7336-2a7916393e4mr31219985ad.6.1769002000008;
        Wed, 21 Jan 2026 05:26:40 -0800 (PST)
Received: from [192.168.0.101] ([45.113.101.30])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a7194164dfsm151487235ad.88.2026.01.21.05.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:26:39 -0800 (PST)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 21 Jan 2026 13:26:19 +0000
Subject: [PATCH v2 3/5] arm64: dts: qcom: sm6125: Add debug UART node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-xiaomi-ginkgo-features-v2-3-fb3ee94922d0@gmail.com>
References: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
In-Reply-To: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769001984; l=1390;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=hB2PWZM4ZB4CYZFskv7vZ7lEVdcGMkMbujOg9c56v/I=;
 b=+tNfMlVu/60v1/8jW5BzCD87Jr+udO9JBnfv1+at5mgstF0y01P/XnjTm2D/jC+ZQZOKWxtXQ
 CNMWoZ8Q7QIA4QyH+6lk30XL2gRk//hJ9pIY3ZMNOH2n58HjwHir+DH
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90024-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4c00000:email,4a90000:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:email,0.21.92.192:email]
X-Rspamd-Queue-Id: B6DEF581AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

qup0 on sm6125 has 6 SEs and SE4 is used as debug uart. The uart node
and the associated pinctrl are added here.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index e60d4d74c..0540fb865 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -661,6 +661,13 @@ qup_spi9_sleep: qup-spi9-sleep-state {
 				drive-strength = <6>;
 				bias-disable;
 			};
+
+			qup_uart4_default: qup-uart4-default-state {
+				pins = "gpio16", "gpio17";
+				function = "qup04";
+				drive-strength = <2>;
+				bias-disable;
+			};
 		};
 
 		gcc: clock-controller@1400000 {
@@ -985,6 +992,17 @@ i2c4: i2c@4a90000 {
 				#size-cells = <0>;
 				status = "disabled";
 			};
+
+			uart4: serial@4a90000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x04a90000 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&qup_uart4_default>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
 		};
 
 		gpi_dma1: dma-controller@4c00000 {

-- 
2.52.0


