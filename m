Return-Path: <linux-arm-msm+bounces-106802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EmXCqVUAGp5GQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 11:49:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C35A85036DE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 11:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3335300E382
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 09:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5062530F927;
	Sun, 10 May 2026 09:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgHH9C5W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81A0372B25
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 09:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406480; cv=none; b=mEc036FVCbZyeqetkqVNd95rLC7I5QbKk1RANEibFrqJpo4IgsBD01+3LSybrJmxIoHs7SfI2hx5kYF7JCT+7SILdadeRwJmUU4omHr4NlNkaAPP8+Rw5gp/k4DVJek7iAasZTQy4J0cCsYN2IbQ2Y178MBWIsy/Dd9e8vR9Lwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406480; c=relaxed/simple;
	bh=Wt9SYaYbBekuvxG0W9GzirhObD5B5YMMzByQDBZ74uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e6FUpsYEydFwxx/fyYPIg/rfSmQWXAYtRUS6LETMMzKUp96uDP2ReFC/R76gnbxHsmKytsiAfRjbEUADXPAKRJ8xOoR8XFSxgd21+x18G1ljY81EKcmbP6GxqFOXwtLLl+tjH1LlMuCEkZmp+/yQJQypP8MxRsjowl4t1tzHaTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pgHH9C5W; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44c350a5b87so2011197f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 02:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406477; x=1779011277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=pgHH9C5W1r7uAze3oD9RXkq7C4L2qTkllI9j8NHOP5dMkE7QRBAcksEfIqDzZo41fb
         lWJE09f6krDQe3SMCTt8nSkVomE8m7EFF4qY34VHpt3UjE7n6EUneYGLIxBjVKlR8iXJ
         SLLnp0TiMMTIGIdo4cHH7DevFUKGO8+nfeA6/NjjVQolByY/wdsm8Mx1IgY2ziARgy4n
         z/w2vE6oV25FC60Dmk2fAYvJk9P4WXfFqSsXXzNPcWmH5qatiCVAJVi+vI7pVpVPlgXz
         Tcmi4uWKbPpJ77bHxWLA9UzlA/DPJoEmMPbsqAEoENNkm7DyuFeD8Vv4CFcJfIMXo1w6
         K/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406477; x=1779011277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=OFzDzCdgQO2c8ZGjm/eIdrvQPz3Uj7I1kzXv3wf9ajrO3GkQvJxbQcHRWKBBXmtdcx
         3GNEoQPiZcxvdRpL+xv1t+yPcWc61iISfclOK9GAEiuuI8OigELnZZCTh9sh5gZlWGS4
         tIZRQ1vgtt/NGcB2xbaJl1vNdx/qZ894n9DP5GZP9kU3y9Rnjr7VbaesS1vvA+xMJYME
         xVLL7AyiCABBZJB/nN9PftiEmOxwodcbeULZNuqXoiEI27am5ohDce4vmHpaFnLaYwu7
         9XWfk/y3S1qvGPBMuMH+dFOtt9TMTvZ1TK5IrIuk9YJ7Fg60mP5Gn857CT5UqllbVWxS
         sIow==
X-Forwarded-Encrypted: i=1; AFNElJ/NXm+W8Vni2FfMA4Wz/J30Vg7K4S18BWrpLIOhcEPLqzyST2PhN7y7Lh4Bi3eaR7NrJrfMjtQkltvJmxbr@vger.kernel.org
X-Gm-Message-State: AOJu0YzJisW0iZxgbseyhe+rATSzNG+VZHd6BsD1rZru5E7ogELk0FDJ
	7J94f3tAknZLjDCabF4AGCcs6FMyQ6rRspStd3/GmASDeWJxVJJ+0/SpRCmRog==
X-Gm-Gg: Acq92OHLsfO1dGdOn3X48syf2TeSdXDU5LXQUbMynFzj8XL8mLAEeqYwvS/JvFdJukN
	jKoBL9GX1dGSwFDv0j0HOcKdIO77zGv6Y0PaMBt1LZPl7FlO5LhQisDkOK6RaMbFK17m3PMt14l
	8IyQ7hBPu/5Uu90kgSdSzeQyo/8sPAfRqlorenXXvudGj8c8WPcPPWyn+K7wK6uk4Jx/4/Cclyb
	Ds+MvjHI8kP3DLl9KaKBYyMAXnO9y1pzRjZWduXLJr5BqsxQFFNZX9ADAYqW1OyN7qTlozxnF/P
	sxyY6iM6El1LkCWKo+xYIX5hG+iBUfx4p11CZ30KFuv5o4Y7xO1eTaHCJXQA/0OObueBOAb/aVh
	yOdQuWoDlgstJGeFLBAKzYFBnGUhKkoW2tA4aTFEh7Dd7ZSj9nIqOAt+LvtjnZHjqMUnWTMtfDw
	9+62OAQMI2FyB7UNIyO3FDrlg6UGHMZOpwAydKL6A=
X-Received: by 2002:a05:600c:34c8:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-48e51f2f85emr346982995e9.13.1778406477218;
        Sun, 10 May 2026 02:47:57 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:47:56 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:40 +0300
Subject: [PATCH v6 2/8] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260510-msm8939-venus-rfc-v6-2-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
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
X-Rspamd-Queue-Id: C35A85036DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106802-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,apitzsch.eu:email]
X-Rspamd-Action: no action

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


