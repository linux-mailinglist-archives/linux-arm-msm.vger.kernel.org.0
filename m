Return-Path: <linux-arm-msm+bounces-102183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGlcMuce1Wnr0wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:12:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DD53B0B6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FE703039F62
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 15:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED9635F602;
	Tue,  7 Apr 2026 15:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CfESMLXs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7702E3603E7
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574687; cv=none; b=InEvEJpqR+0NGJeX1EoCyjdFlTHtfh1IaHae232NrJG4kVX/mjBysf470qNfAcb5tbJihVJ/k3+1U4TplXuNu94pGGInr2YgZbGj3ybr8yNO73vAJKtETmKp95Xmek2JJx82aHExszZySf/CgJ6c8UqqzUC/7ZRqwLRvlKdnXjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574687; c=relaxed/simple;
	bh=XnHGDE7VPDkthZ+NJoEGvNwIAX/8Td+XCz0h8UYR6uA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dku5X+rWl350TGY0wbAT6/OxM0Kx5PJ6JFYIz0CP0U6HIl39Rn/eqrnWtzWlhHVCguur8yYM8eLZCNFXvIR65BJcsJqKYCAoJmo5VHOXcYwEELpgdaD1Hy99jjT8F2kIWLXlAQRo8eHJWZtXp10c5BxA9m3XRHr32uV2J8arpL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CfESMLXs; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66c24b42efbso7672548a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 08:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775574685; x=1776179485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DW9/t5H928zsdNymoXJFEIFtWYYaTCLmqIgH1LiUfqs=;
        b=CfESMLXsXkMaNCVZucuJ8QEB0IAoYiWEuBwxZ5Vaf7PGSqNua3DX6TH6buyo4P8Z7K
         EakEugpOO/uin7WQx7Cf0fe5YloTb1LcqtVLX2oAihEv0zZlVaTkctdWtWi6FfTe1wGw
         DynzZDwMp5YnJ5QfZJV6T0ezaByXR0IdUFKhHxQg0wszTtWF51tgWp/b3sWcsOfwhi9p
         8B+ZaHcvxwGXjsEcSxzvSUrAVCyZf74/+LiX4K9BUzisxVAwDd/RYoATtsSVdSEhX5hX
         E2FuqT7uYlm4V+yoBQhWSIn3GYPjYsE6Y9nPsKAO3jbOeNvUMW3T7hVEChIP4eyLwS6t
         7j0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775574685; x=1776179485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DW9/t5H928zsdNymoXJFEIFtWYYaTCLmqIgH1LiUfqs=;
        b=qjq5Bfgtbdcl6J1tciEyMaD8aq2hvf3x6ZAlhe4RVAlBxTlkt6XtM4B5jF/jAj95Bo
         M1vEIYpK9kqIl6RQvAaAMFGgANDH0UIQqt/8qnpzrmHvdN5+E8a1mIGsO7avAkWfWJxQ
         ZKytG0zOBosbwbmvFIG2Jxo3pAfIPi/aAzlVyOHlVS3lF7+BmGTftPJdgknAl+8OvkHk
         RzCmufBQUg04ac+FE7eiH7KtyNNOg3TpBqG+UipmPR2SFj9TwzvYJsEXsGL7IMnvkB7g
         tO/d1U+YLOROVrlLPX3Phum/9VZwDrPpeIy8sDQwtJQsvnPbs7L6pPATLN9v09zdsgqy
         x/cg==
X-Forwarded-Encrypted: i=1; AJvYcCVrKI5c+nhRDlFX8cwgJExpqUQ4jgdWVOl6CAgotOJuXISS3L1hXtFN1fhloCzSrR5uP7L20ksXaifZXKBQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwfXx06p5J0YgtfkngDt9k7rvXeoU5rk7JPN6fyloqhfxjbEeaL
	tZQybqR6h6ww00miUVlf2NXnONj2r+EertqJy+cZ/HCw/3YCXbqnI6yiZ06El5tXsSc=
X-Gm-Gg: AeBDieulSDujBsOgEMJiTdHkca0KJrh2FDlHm73qXqvptJq3CtciZSTrrW6N58dml5t
	xlso2RE0vZ+ADsli5csU82ZvysOcTL3/GBWTJh2fiVt1QM1eWcmJhvEg9SuLjQXl5IXMbWvyhRv
	Ukn+UnZOTPv28MrED7RzchSx9hKL4+/3Jwkyxu4QOTahNQXum1VqAGbn1i0SW+JYW9jBi4XGKxP
	t1TmrTnEgMnzGWxzusqfrfSVVIJ09lZrhvVsO472bVHaZwgv4PZ9EOyDoJ7ajzYCyHgKsSQVYvD
	7hJKnLzG5hM0HRb5dGLDWpnTUsx05xDbzp/+gqnSTkh1HTHbY4rCZEbqjrCJ2Ux/aRv4rpaned3
	Vq/i/qmtN003cbMbbGZmwc3kePy2dWfOSgxjG2VR5cr6VxuOdF4ilADonMgVuqYH/A4c7a0jzU4
	OuUBKtC9d+fak/HgC/piFzCa6uQtXfPKNRvmu63MF58O4I5h3vEp4uSREsIBIrx9+sjfBQW/q4S
	GQEWw==
X-Received: by 2002:a05:6402:50ce:b0:66c:17d5:c18f with SMTP id 4fb4d7f45d1cf-66e3f86ed59mr8156709a12.21.1775574684793;
        Tue, 07 Apr 2026 08:11:24 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e6f10834asm2753326a12.15.2026.04.07.08.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:11:24 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 07 Apr 2026 17:11:11 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: milos: Add IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-milos-imem-v2-2-5084a490340c@fairphone.com>
References: <20260407-milos-imem-v2-0-5084a490340c@fairphone.com>
In-Reply-To: <20260407-milos-imem-v2-0-5084a490340c@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775574682; l=1301;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=XnHGDE7VPDkthZ+NJoEGvNwIAX/8Td+XCz0h8UYR6uA=;
 b=4r4wSsKQia86L9Pquz3QkVW7rgmralJ7ILdiFqwdAPoJfUtb8NjluAJ4VxxVoj21GuYBjqkuX
 MerAUeEaflbAWWUUM1tue7CrAZtjHeqexC7bumYG4A3YKRbNpv1VpVH
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102183-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.228.225.192:email,0.223.255.192:email,0.0.11.184:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,94c:email]
X-Rspamd-Queue-Id: 44DD53B0B6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a node for the IMEM found on Milos, which contains pil-reloc-info
and the modem tables for IPA, among others.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Not happy about the names of the subnodes. pil-reloc-sram is not allowed
it seems. Glymur calls it "pil-sram@94c", not sure this is wanted?

Please advice.
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..0c69d5810f5e 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2289,6 +2289,26 @@ scl-pins {
 			};
 		};
 
+		sram@14680000 {
+			compatible = "qcom,milos-imem", "mmio-sram";
+			reg = <0x0 0x14680000 0x0 0x2c000>;
+			ranges = <0 0 0x14680000 0x2c000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pilreloc-sram@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+
+			ipa_modem_tables: modemtables-sram@3000 {
+				reg = <0x3000 0x2000>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,milos-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;

-- 
2.53.0


