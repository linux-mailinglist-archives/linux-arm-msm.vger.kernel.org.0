Return-Path: <linux-arm-msm+bounces-105990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CBtL58I+mkEIgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 17:11:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9892A4D0021
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 17:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DAD7E30409CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 15:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AC348166D;
	Tue,  5 May 2026 15:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="EY9YGAun"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586CB48123C
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777993727; cv=none; b=er6vSapJrimrr7XWAWu+/RjRd+a8kY781MZHB1WYaTpvBp9EjI29Kl/O6PLxh6HkPkEfA//DPtL+cY3xaeRX1Flj28waKSQ+dZ8U0WOm6EQkNMiirEST7lEz335vHiHOTwRm405qZt6dFOt1snVm/OJa3se9mcbZ0IT8CTZo5zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777993727; c=relaxed/simple;
	bh=e2pYmLL72fwV4h7HoDkzJW9C4malcZs0f+OzkynG6hw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qANNfVT3crHIXYm0+3oX+/uOV2QZq4Jya3WJ5H/a78e7wEKO2uD+CO7XdwxZLyZfUtqXg+QYDLIi3/1BAHCALtA0lSG2V5bcwOK/zxAbNyDtU0dRo0qDwRrs95JgLys3PlUMEXMbPp/4LeVeZUVVaDhOMkxPo7MXyRfU5GRbfAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=EY9YGAun; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ba7a1cc0380so907850866b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 08:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777993725; x=1778598525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTnCFBORpaeiea8kdIBVEdmJcWQUYz6wO+fctU4NtdU=;
        b=EY9YGAun/APRodUfI+QHb5NW55ZItqvZ0LaoEcWzD5xdFwaYIvC+PZ0aYj8YPnGrMq
         xYgxz5TtRpOB5Yk2Bp3MYLuIhNCu+KHuXUhSs+RWUM59lmxNQahyihYkLlgGi9cNIqcF
         sB0A8QQ23G3RB4JZQmAU/qQK/AQlQE4nKCXeY0HOA94uBVVuFrEz+By5qvs4keG17fiz
         7LZcvGNyHeuUBFhgvMMOtEtkSfI0by9eijthTvMOG6OqFNRORVXhpe8lr1ZnoNrAugvb
         /RugBZJXJWH0wvOf34ukL4jqbObitnAPa7QDoUXwc5RR7CopjDD3PVEU+S3hmg4B8UGr
         c5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777993725; x=1778598525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CTnCFBORpaeiea8kdIBVEdmJcWQUYz6wO+fctU4NtdU=;
        b=YHLj3uhpMeNdmwxm/23UyZRvnAFuP4O8nR2jN/+ROBMeaASHDtsUkERpcOtqZjzI3f
         sMq9UIwxPIJl8Y11KccyZtXNrWcYBHI9cpQvp0AD6crZkxQNRFn61M+oNv7TBX5zxFRJ
         FZT9wTnA/Jh72ipojX2/QMexoQYM6cwCpasH/bBVcyuzu1lfO7t4iARxJp+LrjJyEYHt
         dySkslS1H0PF07gB2w1PeKRRshoVfTe7UGrOHFAFBNjIUx5C9RdHJdKwZ5TPRBaD050n
         aEEBU5ujhzGRWEr39/fHE61XbdOPGOxkSCVDbf0N5CPEWUQqfVWzUrENy8+0LxmgwkNc
         i/lg==
X-Forwarded-Encrypted: i=1; AFNElJ8J+kAo30KN7rgSBlNRX2ikh8rJb5fW6vaCbQbAM4a6DHtVLei7/XOBBVm/yvZOPgpKMB651f/Dn945Pvyx@vger.kernel.org
X-Gm-Message-State: AOJu0YyJxQMKAh7PDlh7lZ3uRqzJMC6MN4PURmIxjrFVLQk4ojCN//AQ
	vn5+M/xmq/v4//5u3nkPir/L91NofA4PQpzdc4QrzKB4YT8pRXzXvxixcbQbsp6HKTM=
X-Gm-Gg: AeBDiet7bmHYPmeSmSIm/IUhleUYc+tB3iYzSqnPeCjnP68WGVTIOXEWZjsVjCIduOf
	hNfcXcbL1Tu13hJFT/Udt7RlHSBoSJN4pQaSzSxalVtMnmh9ApAXvtwG51SdX89vGDC2ZIkjWcl
	q6eU5nIuHnCpTLe0/rbScneK9Y5G3ck8f0QORrYHSFLY9n2cFUTEFUsYqx4VyREqP+L0eb4A3KX
	6CRbICyJ44U8oCu7EfqpNGtvkyOJNwCyLfv6IgOP2c1GJKsqUWYgQQvISR0Eunr6gdjj3OQSvwe
	CNoFMmeXANmzrjCfBCDZV9LNCpUA/kg8KWfn+qvRGdREDIbmKV0AvUcuhrmq5pak/VPyRJEwpDj
	FsANwEtjv/4am98vpRPb7VwVH4Q6U/fusjuXpDUGDI5DK/W8vJXhsxc3YPPyEIJEE7IxZcfMi+V
	YmP4n/3xXbe0/HTvdmE/5DvXiBoqnYSixOMldONJ2WziBZpciBSj2LObzqaEcPTexAnl2OtWdIJ
	KTGjZY8uyK793Z6S1ihA3oz4jcJHXs+6SWlSm1P4t2sEqoL
X-Received: by 2002:a17:907:db03:b0:bc3:784f:e143 with SMTP id a640c23a62f3a-bc40fd1a7ebmr198407766b.19.1777993724310;
        Tue, 05 May 2026 08:08:44 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc28c4ea2casm196662266b.53.2026.05.05.08.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:08:43 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 05 May 2026 17:08:34 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: sm6350: Add PIL info region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-sm6350-misc-v1-2-0b9efc22690c@fairphone.com>
References: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
In-Reply-To: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777993721; l=762;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=e2pYmLL72fwV4h7HoDkzJW9C4malcZs0f+OzkynG6hw=;
 b=LzqyjIXgy+BsSpDTCVDeJ3tfwIlSeXRkL0BDgmVrW+GloE1b7+2stddVFsJlNalPqkM2XhCTf
 iAddJNpbHzgCa/n1hOGN3bYf6AyQQSaNQKfmSdnBDnI/DpdrRN8vFki
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 9892A4D0021
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105990-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.223.255.192:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.228.225.192:email,0.0.109.96:email]

Define the PIL relocation info region, so that post mortem tools will be
able to locate the loaded remoteprocs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index f37096cf11d6..7cb9ade1f0c8 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2754,6 +2754,11 @@ sram@14680000 {
 			ipa_modem_tables: modem-tables@28000 {
 				reg = <0x28000 0x2000>;
 			};
+
+			pil-reloc@2a94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x2a94c 0xc8>;
+			};
 		};
 
 		apps_smmu: iommu@15000000 {

-- 
2.54.0


