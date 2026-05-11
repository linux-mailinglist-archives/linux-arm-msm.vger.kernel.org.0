Return-Path: <linux-arm-msm+bounces-106962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFS8OnLtAWpHmQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:53:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A5C5109E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45669306E789
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22D63FFAA1;
	Mon, 11 May 2026 14:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OI5spa9D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937613FF8B4
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 14:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510543; cv=none; b=NPwcc9GAxMGouSAAEX3zuXKceVcEYI4RJJZljKFdrKDaPn3B0mTn/RITkZ1k97x4Mtercx1QTS9Hcj2TKJmx6nTrmySoVz0sV2hJ7M8e/38i+8YHU2XAf5zos0YcIwQxkqPgy7MJATMFi8DQ4+KNACZUwwlTrM9c3XrmfO4INJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510543; c=relaxed/simple;
	bh=hb1C5aQJP9WB35OrPcztq1zXVygEQ/kny6JW3BxcH4U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OCDe5e5CCFIs/OecCuh2N+cd9hEx6o12FjI0T5KbJNP7oWLnoz6+1/NxeJdTXF132YbJaW6tiyL7jvZlTCCw5xf2pMNKk6g5b1CrESBjtoLqdSixQA5Am+wxkKcHapwnqqpwiftje1n3CN3qXat39/4ce+nV11K88fdtc9jA4e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OI5spa9D; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82fbdd60b64so3275073b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 07:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778510541; x=1779115341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5uGmegWoBDFbMwv9U1ANg7UscHU7WF1GRVedykGQS6o=;
        b=OI5spa9DlVOArZHTO/C/4pbzkEPTI4t8YPHzpnRxLE6KStao4qk+PyYx6RR+u4qt0Y
         EzOhTyuqTRYmmLWwGZTALzjwUKpcIseRhoVCkeVUG0mmsm13s2QhZ3oyC54WjeNyDDSh
         VWVjVHwQ72wkYRpe1NePd6+cAdLqqkxaWRyMX2inlc9K1ht7LoL94DKEar9XBLv3zQnt
         bVuz8YiiIGjgNQXqZ2gccWWJwHWCca/mf/YuN5USL/Vec2ENrXRPbNk8ifbQVodYgSWg
         H+1BuGpdKjHLORe+JpK7OLVu6y/xkRDN4Viv5qfacRVD+ic71aE3u8mUrVme5jhlZMLK
         aanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510541; x=1779115341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5uGmegWoBDFbMwv9U1ANg7UscHU7WF1GRVedykGQS6o=;
        b=WV4Ow82ucSoKsO68ywSt5vBz+n3MjBxpHOohUhiP/iBZsKS+PiCae5qSmz9Ub5Lkjr
         C4fdqttYwpjce/3yzpU7xAedTgW43E9Y7jY1qkFBuf8Yn6l/gUwtCGG3z9iZZsv2lJS7
         mVMG1wPgZ0lgsOvLdAx0pryJj7NpviRu5zUtztKjjzotj4BSmRFnUEVAvX6NLBZ8QM7b
         rJrIKcbrWECgg0UBnzdKU4Z6ytG2HzvVxN8bHinGuQADJAegod4H0ckIJTjE5njE70Sh
         mdphCsLifd4fU9ERuM9nyQGh2rO0cZ9P2g12AI6OPV9+wH16dUIPP17Td2S7BceSX15X
         Jzbg==
X-Gm-Message-State: AOJu0YxX4QPHKj4AK4+SJS1EckuObDFxOohhhS31PliYOtMQY+8sj90Z
	JnogHSxnhMAWejUnM5uL9RVXlWreVDCKuFtr8Uwnb1gHHDdBipiL/pQaQoXuIy86WWw=
X-Gm-Gg: Acq92OHONFM4fMh/LwZL6GbykCO2nFe5L/BEOdrWsPpsiUZ4ClWwatbKuodgrVF9kwn
	4ofF1W48b10eeQm2FLs5DRFU9/VJ1GNjd4NJVitOlS/byqGicIw8JQhCTyObNvL6n5C9FMRLhXy
	yYNfS1qLWXaYJWQ9mazpQTy0aoNhYqCleBlQvF1F0I9L9IG7tEt3n0CXaX+jbH+1RLxLedmt42g
	UmLpHFQcbxl4Fv7xW0UYnxqpGqQrD6BTZMrSpc+lCE4skWYCvNGX9+AIY4EzTbGzhmHNN4EdcT+
	2KDMmpHATQGzXGsYyxHuNR54AGgIgqlmbOW87lvxjCuZIrUlIOIG2d8PcySfA7wlzlQzafHXa6t
	muLcySdJwiDA+nJOwY6npp61un+e129bCk5hYy58wLdjcU2kpvkFOiOanPLOaIJP3Gn20pcQFNM
	Wqh5v99xT4vATTezLNiAPrEidfj7J+BRqGS8SjtG/Xggnu9Yu/HhA4eHlQFRYA2aVNf9FbsPdjS
	nl9MT2if4L7hg==
X-Received: by 2002:a05:6a00:4b52:b0:835:cc47:6fe7 with SMTP id d2e1a72fcca58-83e3afd76b0mr9723226b3a.30.1778510541513;
        Mon, 11 May 2026 07:42:21 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm26012405b3a.3.2026.05.11.07.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:42:21 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 7/8] arm64: dts: qcom: hamoa: Add inline crypto for UFS
Date: Tue, 12 May 2026 00:40:56 +1000
Message-ID: <3ef6b7bec298de5109296a9e64d12b896e017d0c.1778498477.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F0A5C5109E8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106962-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,1d88000:email]
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
index 051dee076416..35755eabe549 100644
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
+			reg = <0 0x01d88000 0 0x8000>;
+
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+		};
+
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;
-- 
2.53.0


