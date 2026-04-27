Return-Path: <linux-arm-msm+bounces-104797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEi8NgCm72mvDgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:08:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ECF478383
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54AB0310FE72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0803EBF29;
	Mon, 27 Apr 2026 17:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFVDmrB+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D063E868F
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312741; cv=none; b=WKlabqflIo74xa+lgix+qrWToYR+szjd9A2tiVukKyppMaktbcPCD/x532q1Bsd14M5G0GQhjaKZXub3vd5dMLRQGNqc2OpRFF7WnmUu8sSoolc6KUN7hy50HPTiDctSRgodlp/GVlW/boLYref24Mof2xzHQzvWo0I6VmZcHB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312741; c=relaxed/simple;
	bh=ZEu2LQcuP/U1oFZihO1ZCMi51Bv/ruis1G1kHDtRAtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L2y724XtBybT77zYuuSSisd7uJhvYb7VzzX0UJmsl2Kq17qJJgmsz5RwAIrwvoQrh86ev2t+6M3GMvPicaJLNT3NDTZB73e1NoJve6cLd/T9CQbOMf/G8WIJij5zREKP8DTDXiLCSP+9KBqqOutTXDhU8sgusgdK4ZodcLk73c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFVDmrB+; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79cd8f8e261so67567347b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312739; x=1777917539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbpuikSocIfY8I9ag+pa38zqNQnau5eLp1wx9M3PRIU=;
        b=CFVDmrB+L3PbQB1GOEx1wXL98J+2Pn7fvW6r88+13oVUncAg7LzK4CWDl547PBCGeH
         c+Q2Cs1cle3DIvJ85C1psCmW02xW+9b/cfRvk+saZj3xYBSgjSju4JaTJZ65Dwi+DheJ
         058tf3tF7Phm0ayQhDyixCGJ/e8soVsO1KSTc/KZ5+zEz6X0f18QRlNH9FKTLMwCwXR7
         oPz7yg+g0TlhqDFv97xX0eZBU1w5HRoc8U2R7bAq4TWuihHmtAYZgKZjMGP5T+EcqKRF
         01U+Qd/UcA68oTSaLZjp92nfG1QnJ/Vbcl5esosXm/r9pvHIc512Cvm80rJU9pVjivKo
         Oaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312739; x=1777917539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PbpuikSocIfY8I9ag+pa38zqNQnau5eLp1wx9M3PRIU=;
        b=rYX3pMF4rxdTubZp6dc5Gl4Xl+9n6ATseTdxrAJ1iS+VVRJmDzLs/029HkXnelSnb/
         ovZSja1tDt4T8vsKMQqRJFomE6xTMyrreQlOjLGJNWV6Wd1+tM8Y6W0NX1J3dO6JV2z6
         MbNmuRRQQQoIOx8kFn3K76VV0CSN3wGDh7DtMtpuFowHd7flVOs9lVcH+uaK/D3drN+e
         keeXNNfpOpS+29BrlyyQEadV/Th8s6d2gHTwUqfh+2IRKuns0UhawGzwjTACkqapdaZU
         0IFjzqr/q3WS2EZnkyPE7Z1eEBkGRzY47VXAWhweSEcXo/0uSMqDb5kbC/RD4JDf2MdA
         yAjg==
X-Forwarded-Encrypted: i=1; AFNElJ8eXSFmyCXw6TK4V9ZWI7QlsWpgG3esu43Bu5VAHTMOvqujim4ckGvgWcUmos+lg2hDTYymXxlQpugAVJwv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz72SNENTUYK/STzEJQJJLJ7WjOLp9xQNvMo4QDWdJwUFPz9PxO
	11oc9IxKil9ClzltA8WriHVimVoHCB8Lwsb+yj3CQZkHT0TU3IdZvQkj/Zc4xRKLA9k=
X-Gm-Gg: AeBDietUDicsYm1F6bcYKD3yXzN5F9u9b3kOWQiLsI5vC3Krgk+vhSnJ4tldYD5p9eT
	SyxeDuPvAhCd5Ulv6acTw4cAFnqsjbPPOXceF3T+JyDijXBakruYN/te5mHuwrzQXXO4yZgQDWG
	0tYlcmu1YhhSDXBCdQFaaxFtgVYCXxWIXq1lK8ve9r6pLgcgrXHrDV9rkIN4/tU9/vRf6Lun/sF
	3tlHbiCRk4cXrriU4Gz3VRJFdf9YfDiSglAPECLx5WxtSl9RJs6Mb1U/4W1/vGgKwChmqb+uKS7
	4IQwTTHLFtzdoC0kxcGEiOQW1jKZd2/j6fjVV7tirJKJCM2IgEDAZIdDlWDcb+gZGXCXPXyrdJJ
	k1nI8UtrVBmZG32UdkOMTm3HLS59ulAANhStYNgaY9R5URmbpXyz9vSObYPw7KKJ1358ZYqkTB6
	6h1oaZKzmhtSe2riWjrZ4zpNvoFxW0yhp9LURm
X-Received: by 2002:a05:690c:10d:b0:79f:d961:47bf with SMTP id 00721157ae682-7bced8dc2a2mr3592067b3.8.1777312738423;
        Mon, 27 Apr 2026 10:58:58 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:58:57 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:26 +0300
Subject: [PATCH RFC v3 04/11] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-msm8939-venus-rfc-v3-4-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 88ECF478383
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-104797-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[apitzsch.eu:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1d00000:email,1ef0000:email]

From: André Apitzsch <git@apitzsch.eu>

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..6b295d3f8256 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,40 @@ opp-19200000 {
 			};
 		};
 
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8939-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>;
+			clock-names = "core", "iface", "bus";
+			power-domains = <&gcc VENUS_GDSC>;
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+
+			video-decoder {
+				compatible = "venus-decoder";
+				clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+					 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+				clock-names = "core0", "core1";
+				power-domains = <&gcc VENUS_CORE0_GDSC>,
+						<&gcc VENUS_CORE1_GDSC>;
+				power-domain-names = "core0", "core1";
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+				clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+					 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+				clock-names = "core0", "core1";
+				power-domains = <&gcc VENUS_CORE0_GDSC>,
+						<&gcc VENUS_CORE1_GDSC>;
+				power-domain-names = "core0", "core1";
+			};
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.54.0


