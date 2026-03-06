Return-Path: <linux-arm-msm+bounces-95821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PheIFzbqmkZXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 14:49:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DD4222183
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 14:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E68E43021979
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 13:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923803A4F37;
	Fri,  6 Mar 2026 13:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="FL0TuqvY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C483A1CFF
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 13:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804929; cv=none; b=Oyvu8qAE+eL0+F4+4BFqIm5vKqc/oMwQIvS4BObqGkK8x0XpQem2AZXarUuCNDWotKt2nu9DUqp0hklEPiZHlJ5hVkmKlk6oO+mV16ja1PSrK4rCwta8EIjCXjNbmE+4HtbgjsT2nnsK5yZx5xsg1/1H4RUBgY/Oc09hhhteQ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804929; c=relaxed/simple;
	bh=sh6CHOb16k/4gSZCp2k+BEa4Dkc0sI/mIZiIfX6yj8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7rr9xAsXarIdt1PAtmTAG+doOU5OuRtRAj6KakXZQZv1jFVPBGwSKSAv1tmfuB4U6UTDZMeHPdwkPz9YjqiJE4mFLTFxrf1ijApNxmeLUfCecpQnJGp/+RIRevRoWihj1vxmRPY9HYqXLA5JD5swCIJOO1dgNmCee4G0ZDlUKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=FL0TuqvY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso4417815f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 05:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772804925; x=1773409725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0NLCQ6pVVPeDAMvh5rjRXQzwrKOPpCKjM6nme7d/FUk=;
        b=FL0TuqvYEQRCJVcnkV6MltEaP6XCq7evLzjYp7hV8teD9SN1p8WVarZcIunc6EdwfV
         oeYtCGnnquUkhrcvkkBEOK0t32Duh58cDneI8T8w+6Ht1mt2PqudsjSD/gT6ipIjPw2Q
         WzWCoRH51Ed/hPNLf3jqqhit+0/AzsLZ3ZRMd/1xfOPkDDTirhKQ/0f9g62KRbsksWQh
         xHR4vzk3T0jEdsIOfYqIfKdgx9l38Nenu+8uYdUtHPeOPPL2dO/YLm4YZyeOymzbMorx
         1vzZmYGRHDX/cQQwKKPqcUqDqUqr5Hb+1+scq8LIOOKPmXEbsQeJF8Fg7mH7Ql8plwJP
         ZGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804925; x=1773409725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0NLCQ6pVVPeDAMvh5rjRXQzwrKOPpCKjM6nme7d/FUk=;
        b=ijDd6XyVSBxYtxK7cB5I8xuzQBYZ8qSmwQmqQqracKJZiOuV7+CI5iursf6rr1GAfV
         JXLQ9ZLekWBC3tJEODQfF2o07X7LcXhpgERWMEvnAEVA+VAsIWKMnmNkHSOE9mnxlaAY
         DwiAG17MH9LDp19t0K8YdB3W4APBXHHxLh71uuKRhDYO9rlR7Zxco1Q6h+Q5HspbwwhA
         uAbOudJMfnew9dwNc7vYJs9h2Ze+cg8sEbWaDXed9A/QKbIshEm1L+zJscqxPSBOJuNc
         1WTePc+vZl8nSD4h1nxWw51jFXaeG+rwDhbQwHIa7L4X4yuLc3m4yNY1Y+SnJI6GmoWx
         WKjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSTSSHPCrsGkfQc+Q8HIZtoSqYcTW/HED2umDcLlnvYD9/N7oAV/gzPWNbPy8VzD8Vcve/MM84rHtjHEcg@vger.kernel.org
X-Gm-Message-State: AOJu0YwcMyQXwQh3mJZF/jw1zlfh/UheRyGGCmyLKawyImFUx+onIjwd
	aFawDJGO4TNlXuF1xOQff+pto/Z7mCTZ5rAIeNjRWmyzlzjQP3Fpi/o9iYvIJJj657Y=
X-Gm-Gg: ATEYQzyBr4JgnWTg2yDY2wB8IrM7rMyop23GsyJ+FulGEVAi4e5s3aNLeglezApF+Ik
	G7wcPkG6l84u16rx9+v6JqDpseMD7TFNVH0zbVvs6HEqow94h0DcdAEYu52EhELc7AiWjeEoAAL
	fDZnQrXNGIA17va1GmB0Xx6yx5gahrwRevsGBTmKN4Azb1zpzxHBBDfmFUex/DNL5hPvNNcEcP7
	DzUAeBLi///DYDvM8NNYH9+6rmRgYMzj0xrhkWM7DEDdQPfNf0ThVyPYUeQ4bwBkoB7c96pt4Em
	mWmof4sKtekwo4B1QbABJ4FtyEnmIVAfX5eSwGr0RTrgen88dQil/HMU/+XAkHKbFBSN16T9jka
	gyiJCHUdMmoC+gntwzJLgH8mhYNjtSugtc+bPcL1y6W+YLqOuOzoVcI4roEzjokHVfod7X3ajDq
	ASJbARqanvmoIbu4K/NxsWs5TlDg2XnB12VErm1jwuO/KpC1WLyXcAjgIFCmxp2ULgYuvYhqyTt
	8cp
X-Received: by 2002:adf:f74c:0:b0:439:ddc0:4bee with SMTP id ffacd0b85a97d-439ddc04d31mr1328872f8f.16.1772804925037;
        Fri, 06 Mar 2026 05:48:45 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8daf2sm4304767f8f.2.2026.03.06.05.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:48:44 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 14:48:39 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: milos: Add GX clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-gxclkctl-v1-3-00b09ee159a7@fairphone.com>
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772804920; l=942;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=sh6CHOb16k/4gSZCp2k+BEa4Dkc0sI/mIZiIfX6yj8k=;
 b=Rwk6ksYDrCy/cThAXlHI6XclEqEjFdyZIsN3Mj2VOEbOOYEO9KGJX1gdo6C++nUkWEidEBRdB
 oQSI5ukXauxDMw/IUpmkGg7SRWOspAU7NUong4soUzWJeEfr7rjyWFF
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 43DD4222183
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95821-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,3d64000:email,3c40000:email,3d90000:email]
X-Rspamd-Action: no action

Add a node for the GX clock controller, which provides a power domain to
consumers.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index e1a51d43943f..621f05820826 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1224,6 +1224,16 @@ lpass_ag_noc: interconnect@3c40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		gxclkctl: clock-controller@3d64000 {
+			compatible = "qcom,milos-gxclkctl";
+			reg = <0x0 0x03d64000 0x0 0x6000>;
+
+			power-domains = <&rpmhpd RPMHPD_GFX>,
+					<&gpucc GPU_CC_CX_GDSC>;
+
+			#power-domain-cells = <1>;
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,milos-gpucc";
 			reg = <0x0 0x03d90000 0x0 0x9800>;

-- 
2.53.0


