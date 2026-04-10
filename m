Return-Path: <linux-arm-msm+bounces-102607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLOuKeSy2Gk8hAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:20:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDDB3D3F99
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7892303F7DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 08:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9723AC0EC;
	Fri, 10 Apr 2026 08:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Khm1Bwjj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4603AA4E9
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775809032; cv=none; b=iYDUtFenHQ5v2SLbJhk040+Ffr//80is4IXVFMqeaUSIclLvFKaAghG/yVa2YyZJbDkK2XjrcSHpb2Fi+PwsWfW5mkMFwgIJrT9dkNm2aUHRxqanGZyNk1Fs9cPQY4Q46j44IgpjUstOOuV+53JrXU+I2RX4MITqSuDp2VOHY1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775809032; c=relaxed/simple;
	bh=ZWAwfG2XpfdLjaNvjdSryOsAf2k7DtBPb8gqj1pmol8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B7w0HAMYYPIv5ju+LfKuhG0ZmCftia35v9P1YidxZn/Qp/qX9ier7GdQSAUjZFuA22dWkAKeb8f1K4Is6wFIZrvQE/9As22VtVRs8XIu0yX4Ztg8e+3+wkxiQeo8bawmW+GxsFFlzeoM8QsrybZO2XeDRrLDl5k2yWSmYPY6eYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Khm1Bwjj; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66b2d49ffb0so2209094a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 01:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775809030; x=1776413830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jfAis8xEuy3S6/A9q6uSPPvDO/GKDEdIvBPSdbvLIY=;
        b=Khm1BwjjBY98bw7AtfiXvylnp2bWoHU4oHJkUvuIzezdXxYH16m6pUoPbmk1CWb/1U
         JvjOfPT8gL6uvwoeo42RIIvvgfMNtjjaJicPEHaZsORAYeIzJSjuzSm/h9yF2S5L5n3q
         7VHFvNauxgj/AXJf/uqgDXV/HBDNNtps6sVvJAbjkmDORO5OErXlCcVjfBR9rvhipJML
         rBUx3FShoJ3UC7VvmZnxx9jVepDu8FPBve7UbbQIVHvNuVaqFwzPRVxLkncrNg5UHSjc
         ycuhNjff9TTWM/95zou7oWxShnFqT4u9azy0B9YtZWKII3mV6jXwIeeGnhBq8VCI6+/6
         oaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775809030; x=1776413830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9jfAis8xEuy3S6/A9q6uSPPvDO/GKDEdIvBPSdbvLIY=;
        b=NJ3DoNIMRrHZCYAFksG7bm4KO9fOcfAJHFqZyLQ+n4JWfyk/PeBNPErJrnxWqiiUe8
         BPeYKKPEYgVyDluQTOJxbFJizpGWtaJguWpuOViKVl/g1hd6c7WQu+y9lUd+hkos/Txg
         6lTQbgE8evyqYzBDciNmCM3H6EZfoHGWn5Z5w44Hx6p3pquZmZmf3PFBVucZuw2DQ3DG
         RtNBaPeaYwJJpxP4GsoTAt8X4VezESupUCl97IgupIUITALCr7DFfbLRAj2x+Ip1K4Ub
         1dxRrFYvexNjZ9Ofbn0Y7oqZlM8gOsZzqg2zWcdEfHfMChgKA1kNT4x228jMIUAWQ2bL
         aiAA==
X-Forwarded-Encrypted: i=1; AJvYcCUPP8Ey/GANJa4WDXSqolo6xrQifopUhsDASl2Mikme09wpzdXrmcFlnmGMnLmj3DcynrKAXL1WlnHRAUwf@vger.kernel.org
X-Gm-Message-State: AOJu0YxodjRWCSjo6dPCbcaKn+FWG1VO0Gdx4rl17vCN6eseX7Hu1jxP
	8i4aUiF1gqyO92ezwl9Bh88u2lZFC+wazuMg5TPAIVmQnjTsqg6IwBgZTB+xjzgoGf4=
X-Gm-Gg: AeBDietGk8dotiJhMVO2876gwwnHOWazrCxwbV3QiegpbAEH5M/XtqnXIuRxsKmJXoF
	gtx9ozcEDgt3jFx5hP/Np1cwwMAYFwqovOEV/0VQFbOQQttc5d1lih6qy4ThS2mnIXdAKC7xuka
	6YmKnzc76Lu0auZ1OYP+5M/JmNX1eSd2jlTybDTpHIWR35FgXnLdVbsZZkfk9jwumGbQ08/UhAS
	VT4w+KQdQsHDIxsMU14FrsXdbnPM+bBptrYnr1g0ZbOjJ6RniVNe1i6sM43cnG/nMnjQ2Df+Njk
	PiQ9x+MuN1IY01rNEHN4jV5YGMLy8B7HTocl7WYubfwx5Zgtu8T8qsDQcPtDE9xnz3XofsidMLM
	JuDnl1J5G4OH3GPzAOSZGE+kl0jMFUGXq+/xnYX0Rm9Clni1fSJSOvGL1cCH50vsvcyK39WIBu6
	O64doCP+Tztz0s9PKKzIyJ3vT3kjBkiyI+Prmrw59c5RAhq7SlLnSwJyzD42Ui+0922db1x5tOA
	nJ46g==
X-Received: by 2002:a17:906:7947:b0:b93:51df:dd23 with SMTP id a640c23a62f3a-b9d7260deb7mr144752666b.16.1775809029729;
        Fri, 10 Apr 2026 01:17:09 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c7c81sm58488466b.43.2026.04.10.01.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 01:17:09 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Apr 2026 10:17:01 +0200
Subject: [PATCH v2 1/2] arm64: dts: qcom: milos: Add IPA node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-milos-ipa-v2-1-c699b6b8cf27@fairphone.com>
References: <20260410-milos-ipa-v2-0-c699b6b8cf27@fairphone.com>
In-Reply-To: <20260410-milos-ipa-v2-0-c699b6b8cf27@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775809026; l=2095;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZWAwfG2XpfdLjaNvjdSryOsAf2k7DtBPb8gqj1pmol8=;
 b=2F3uQtPsmuW6aLuY95NW9p4XavfYQkw2Y/tAn/kVBh4PvE+t1QufBsg3D8AkyGaO4imBU7cR/
 0K3Uz4rqUaBADqvZcAcTkOA/s4ZZWEhUUESH174ExG66JLXRjczONwW
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102607-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,3da0000:email,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,3f40000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.62.65.128:email]
X-Rspamd-Queue-Id: CCDDB3D3F99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the description of the IPA block in the Milos SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 44 +++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index a8536a873c69..9ef103d0e00c 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1599,6 +1599,50 @@ adreno_smmu: iommu@3da0000 {
 			dma-coherent;
 		};
 
+		ipa: ipa@3f40000 {
+			compatible = "qcom,milos-ipa";
+
+			reg = <0x0 0x03f40000 0x0 0x10000>,
+			      <0x0 0x03f50000 0x0 0x5000>,
+			      <0x0 0x03e04000 0x0 0xfc000>;
+			reg-names = "ipa-reg",
+				    "ipa-shared",
+				    "gsi";
+
+			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING 0>,
+					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&smp2p_ipa_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_ipa_in 1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ipa",
+					  "gsi",
+					  "ipa-clock-query",
+					  "ipa-setup-ready";
+
+			clocks = <&rpmhcc RPMH_IPA_CLK>;
+			clock-names = "core";
+
+			interconnects = <&aggre2_noc MASTER_IPA QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc_main SLAVE_IPA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "memory",
+					     "config";
+
+			iommus = <&apps_smmu 0x4a0 0x0>,
+				 <&apps_smmu 0x4a2 0x0>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_ipa_out 0>,
+					   <&smp2p_ipa_out 1>;
+			qcom,smem-state-names = "ipa-clock-enabled-valid",
+						"ipa-clock-enabled";
+
+			sram = <&ipa_modem_tables>;
+
+			status = "disabled";
+		};
+
 		remoteproc_mpss: remoteproc@4080000 {
 			compatible = "qcom,milos-mpss-pas";
 			reg = <0x0 0x04080000 0x0 0x10000>;

-- 
2.53.0


