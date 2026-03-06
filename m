Return-Path: <linux-arm-msm+bounces-95825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG8bKu3eqmlqXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:04:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E325222434
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:04:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 451523115E23
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033823A9619;
	Fri,  6 Mar 2026 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3jass/54"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DA038F22A
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805702; cv=none; b=L9y6LHr6J9y+r6VTd2prezbzE+4GaFOdr7bOqe4BRQOj11w8JXEZ4NN5JONZkcKbmH1bjTlMa+Kjh4VOszDnY6HGrqN9Ndv7aREpHSX6IUDG84bpzCXEQGkLBU/eQSmav119/Oc8bSSG85aUstsCnjYBRf1zloS6DGYwscotYy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805702; c=relaxed/simple;
	bh=wkBia88uzJMGxqRD6S3lsbMjeBW6LiNh1cpModx72H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g9CFdDa+9TroFTji9FSP3fffuY/44efJUcXqH6IG57kpGs9YPFpWqdAN8dzDKu9ChQc3+yIWoucl9b6srALMrt6ujqhcT8UMq4dtAM45S1FPfxHaB2zoMzjah6khDZzHLZ59gImHZnruGK4Mj1TmGEqelCNE2Xy3gKjr7MMC0Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3jass/54; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439c5cce2c6so3146812f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772805690; x=1773410490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCjpNt6dWkJQCAOzL3i/TG9URIgkeT7ZM1PwnUPeAYg=;
        b=3jass/54aoPksJpnbGLfLY6ttoD1Zpx3BHtjzdQJyCJm1jLjc40eJP84wlrfLOf9ux
         LQMxpFUsWPpJSjiC85b74awObqplD0VWZhQVirFFhlUQoR94faghRQMn5Vc0DOO8S7RZ
         lk3TerFSKTeN8O4zYeciSLQJZq6xqHeC1PxuUl98X30iAThX0HQEKojAoft+e0HgS/cl
         ejOfn8F8y30FWBSEPiS9Yl2VsMuh1Jz3QFBWQqMi9TVR08DDtRvJh2CCBCZo4HLtKZIN
         T1updq20ftXssojIG8f5LBbRjcUx1LzTaQj+C+BDrk7e8UB5ESJjm+HOW/nPn7QH6z7Z
         NQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805690; x=1773410490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vCjpNt6dWkJQCAOzL3i/TG9URIgkeT7ZM1PwnUPeAYg=;
        b=di44N4GxCA772UDUSYJzUMT7lwmmj8Rbm0lXex6jv0Y5KQ2v4QAGg2kjWm+9OF1HqE
         126WV6muvDopJpTUp6L+9S9mMvSG09+dz8CZONe7x3trLTYQjVxE851TElJNpu5HuDKh
         kHX7zAmVnS1JM17yL77Zmgm37eauCNCA/z4c9aZH2B03ZFsM+cn1w2ZDeu2ZllIRY3jV
         sXLPg/DeH87rUnugBXt7bnP89JkJVkZS1PsA71INSU75dmdpsl1jl7iPK7VKTm3Ckkiz
         jFNt/XoeoB1kDan+1/x+ugej7banmGwrD5aydehQ9aMywnZQ9c1yKk6H/cPlD3GauMA9
         Tbew==
X-Forwarded-Encrypted: i=1; AJvYcCVkCj/FwE9Ss5e/wc59kGQuhV0j+gQ2HDg3pI2hzDKEKXDWyki7e3THKPcAHIXkWuLTJglsIlcIWfOT+r9r@vger.kernel.org
X-Gm-Message-State: AOJu0YzL2D3SkwQIMBl5Y2qk8JKjA3/Y2Kex4j+7g2vY3FU9gq9uzh9x
	qQnSnUAqdjb1OEprbrqAitFF0hE1Y1Wxf6pauSZToZLAkOQLvJLjGAHtj4uJRtWPXsI=
X-Gm-Gg: ATEYQzwPp9BQnuRs/+DNmScnKR7A1BuG2zf64tUTdroozAR2bzuyduVRVb64ONXU6Rq
	vmhsv92PY0/mwZfgF3nk7h/iUm4nyA/AYpeSx/sDGrvAyQvcR1VjUd4xq0JYfhq3oDhTh0WRa2i
	h+CtBPZ/s97mtjymAP1BX52JbGgeyAQOduTkH33blWdhf8WIDS9XZu7TW8oo5AuHMkzp1wZu8LY
	7kRMMyQ2Tq5+15fdoh89TNZV0+9h7qbLRaL5Re1GjE2WV2cpH/AYWC+BC1OzP/Gb5qiK2XWMHoK
	J1eSaD9Qe2zcm8m33yqFRQjkh/apMiJZUq3j/N90uIYrqjwEXIUbgvaoM9wyQvwYjytIMUBpsuI
	EOSmHwh963m7x40iyp+aCM6fQe8wBlcUKwCmDoPiZ0/LILZp0SWlvl2tieqvwAk17NYOMwVZj0h
	N7FVMdCid5QpyVe9MAIMo5wXNzsVTIm9LGE4y6nC2m8o8wqUAEXRqQj4lZUXVeXd5NPXQ81KvnH
	/Zs
X-Received: by 2002:a05:6000:400f:b0:439:b374:c6d8 with SMTP id ffacd0b85a97d-439da89bbdcmr3621790f8f.46.1772805685236;
        Fri, 06 Mar 2026 06:01:25 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97be5sm4313828f8f.11.2026.03.06.06.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:01:24 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 15:01:19 +0100
Subject: [PATCH 1/2] arm64: dts: qcom: milos: Add fastrpc nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-fastrpc-gpr-v1-1-893eb98869ce@fairphone.com>
References: <20260306-milos-fastrpc-gpr-v1-0-893eb98869ce@fairphone.com>
In-Reply-To: <20260306-milos-fastrpc-gpr-v1-0-893eb98869ce@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772805682; l=4212;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wkBia88uzJMGxqRD6S3lsbMjeBW6LiNh1cpModx72H8=;
 b=NGipAl+gIt6Q9KQUFZ1cGi4ANI7T7hMgguIpm8JNWRYfC/gARnHOgFgUgmwep/FbNtS6jxYsq
 /NvLG2HgSKUCTTED5we7gq5h53zjFNyj8tC0ny+3+LWA3IWMU3P6UfZ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 0E325222434
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95825-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add fastrpc nodes for both ADSP and CDSP.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 144 ++++++++++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index e1a51d43943f..83a454ae9bf8 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1214,6 +1214,55 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "lpass";
 				qcom,remote-pid = <2>;
+
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
+						iommus = <&apps_smmu 0x1003 0x0>,
+							 <&apps_smmu 0x1063 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1004 0x0>,
+							 <&apps_smmu 0x1064 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1005 0x0>,
+							 <&apps_smmu 0x1065 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x1006 0x0>,
+							 <&apps_smmu 0x1066 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x1007 0x0>,
+							 <&apps_smmu 0x1067 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 
@@ -2164,6 +2213,101 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "cdsp";
 				qcom,remote-pid = <5>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0c01 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0c02 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0c03 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x0c04 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x0c05 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x0c06 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x0c07 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x0c08 0x0>;
+						dma-coherent;
+					};
+
+					/* note: secure cb9 in downstream */
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu 0x0c0c 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu 0x0c0d 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@14 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <14>;
+						iommus = <&apps_smmu 0x0c0e 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@15 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <15>;
+						iommus = <&apps_smmu 0x0c0f 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 	};

-- 
2.53.0


