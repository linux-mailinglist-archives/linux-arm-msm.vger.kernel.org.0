Return-Path: <linux-arm-msm+bounces-105989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKWFFIAJ+mlsIgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 17:15:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC80C4D011A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 17:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0166D30C74ED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 15:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30A1480DD0;
	Tue,  5 May 2026 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VRr/ObNr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C990480DD5
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 15:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777993726; cv=none; b=bGiYMUrDc9zpRpC3tBqunpQRG65ZA/MbcEinfqR8a6VEXmQPdkZuAw9vqRF8BXPXkwA6CqEDAhNwNfRZaZ1OCC/p5/TO/JYtNqPw7yQN6gPqhYtyzbFGI3Ri8Kxfl3oxXH8MA6HoSz15AyWcKAgYU8pcodYYLOwds6jdldjuQsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777993726; c=relaxed/simple;
	bh=rQUCYnfbXyXEqu7Tx4LFLNr91pjKCEeeqx3H4w2eCqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uqc9ex7JfAuUsO5thh3hxfjGFOf74BGm+MG+LNnQ89+UpPxbfnfbc7WBy+ugIQsNkKiyhqKSCOxzOrwbfOFD2FQIrWyFswx/PCsMFP2Vyi7fo8+g/Zu5EVjmr9DQWB4dXpd3r56aa98l2EInK0rh7o8dW7eyE5a4nnzo3LGVOrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VRr/ObNr; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ba6838e76f2so642769466b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 08:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777993723; x=1778598523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJo6VLFR01nTvu+1qx2IZwoaGOrF2oyQXcIC32vljIw=;
        b=VRr/ObNrmPUg/U4G1Y6xRjlH2X5vEHppQpIhvJA8muhHsg6hjS08jxsNEwLhwgzmoT
         9uofSTajEBjaH8ePA76zCw6/VIfeehGf4n68utCsEPU22lhIQR8ASL5qVSkYLCp2pAt8
         45UemJANBb+cx8G1x9HdbBzGhVsawsMOpqP9DQRYiUpDW46W6CYsaQ8RfpmFrcyY7V+q
         WVuymwiGlE6wM4fpgf4/Ym6oiUEqSm6zehyytIBNNZIbd3Re2gVomH3RgyrtgwfIIg6b
         5vGNMzSJwIaWci+yvSYDbKHB9QPvPtvvLvM7HpmXNz1yA2PA7HCO8A9IXoJsbkt/E14M
         u3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777993723; x=1778598523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cJo6VLFR01nTvu+1qx2IZwoaGOrF2oyQXcIC32vljIw=;
        b=olz2rlHMGg+w+P9pIYEWgdeiVcwTdZM++gqQbFw+BAu3LavBulRDieeuarjpWW9J/W
         bslS2zIEW2Oh3rBM2q/tvyPccTL2tbO3WsZKsfsvrzbxn6pdxj5uRLEHE7Qr7pNevQ9W
         E1BVDA1RUXPGXuwvF0U66NlDzKxzcy45F7uPu4DWhs3sKesark3QmjjMdFe8r8Cqu5ox
         VqYwQcaizcW2ueRLFm/aJs54BztcvGOOpjll59UyA+h+E2HyTRTZT6hexYNttqh2wHas
         E3pf8fHKV2IxvnDiEStY2RYP7SjtGllujZhnyJEKi2mkc4V5YfRqSyvRxhrrci7+0j0O
         h8Ew==
X-Forwarded-Encrypted: i=1; AFNElJ+N3UMITbYHfWTIWXQNWU4HmUvbck/67v/m1a2Dq1+khViiUe71MatkPI52hxc8ukaqUiNnazH5kwqsmJPY@vger.kernel.org
X-Gm-Message-State: AOJu0YxQNfNB3s4nEYxipRD3kor9kCwriX5RZatoosGL3m8PpbyHRuqO
	GrrxrKBj/A9ZW/Vy6yg8HYHad5jjMUT1nbjk4oHaYZ16NfXgNXaUKB8hjsyJdYO5XgU=
X-Gm-Gg: AeBDieut2APIiUGZUb5knqZHVZM1BiTAASLqVL1s8fDPY5/1v9lBJ+lhrmoQz8sNqMJ
	2aUcpbYSMpBEKBExTvByqo0PeLFTEsRWsCUpwEGqEH6z7OhsHYh8ordM0xUjN0bYI/QTpKr6lR1
	/FxBCzpwBpuxCCOV+m/9autObM4BIlkA+mS7RlhEiyXxfO4EbxFXUVJJTDVaY4za8dxMJagojmD
	CLaS+yfbe4UStxoBJXg1a2f852crqp2keF0YOv49FLgEkxDLHVwdOzfvDv4VfeUra+KupRWRyxd
	ilGdb1buFvPJ0SuVZwxsaNyO0gOj/UC7O6kJEjhLNAQaEBFs0h5Yk/IsWzE1QBw0Gw5/7pLpygU
	Q7zTPU/BqGaTyLkB1AR0/80ot/IakN2XX4uHpROo2soLJCXB+YiKdkAoyZQzR768kP844bGkmI2
	1sumP4JPVvopikVsWJ1lUTCrcNXzbJ6SKyAi/gBFED9brnyY2knel6Ol4N/i2yiWsmeIdqFCJJN
	KLHKAOEWXq14WU9yhmPMNi5ZWsYOymzJcFDQ6azpIQktHfp
X-Received: by 2002:a17:907:e8f:b0:ba5:a3a0:4a5f with SMTP id a640c23a62f3a-bbff8dc79c9mr816717966b.8.1777993723405;
        Tue, 05 May 2026 08:08:43 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc28c4ea2casm196662266b.53.2026.05.05.08.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:08:43 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 05 May 2026 17:08:33 +0200
Subject: [PATCH 1/3] arm64: dts: qcom: sm6350: Add interconnects for GPU,
 MPSS & CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-sm6350-misc-v1-1-0b9efc22690c@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777993721; l=1491;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=rQUCYnfbXyXEqu7Tx4LFLNr91pjKCEeeqx3H4w2eCqs=;
 b=01bXAry7oAV8NzHQLxyLoFHCvP/azPCD9Q6oe/wQBm/AiJqZv+ee+3Jq44SMZ1prIsQmTmRk0
 X/NfVlMsSumBS2OCwcRhADdisYTqNarCiBoRPIzp+avNKAZAewrTPD6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: AC80C4D011A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105989-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,0.62.65.128:email,0.126.165.224:email]

Add some interconnect paths for the GPU, the MPSS (modem) and CDSP.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 034545d2af2d..f37096cf11d6 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1461,6 +1461,9 @@ gpu: gpu@3d00000 {
 			iommus = <&adreno_smmu 0>;
 			operating-points-v2 = <&gpu_opp_table>;
 			qcom,gmu = <&gmu>;
+			interconnects = <&gem_noc MASTER_GRAPHICS_3D QCOM_ICC_TAG_ALWAYS
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
 			nvmem-cells = <&gpu_speed_bin>;
 			nvmem-cell-names = "speed_bin";
 			#cooling-cells = <2>;
@@ -1622,6 +1625,9 @@ mpss: remoteproc@4080000 {
 					<&rpmhpd SM6350_MSS>;
 			power-domain-names = "cx", "mss";
 
+			interconnects = <&clk_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+
 			memory-region = <&pil_modem_mem>;
 
 			qcom,qmp = <&aoss_qmp>;
@@ -1661,6 +1667,9 @@ cdsp: remoteproc@8300000 {
 					<&rpmhpd SM6350_MX>;
 			power-domain-names = "cx", "mx";
 
+			interconnects = <&compute_noc MASTER_NPU QCOM_ICC_TAG_ALWAYS
+					 &compute_noc SLAVE_CDSP_GEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
 			memory-region = <&pil_cdsp_mem>;
 
 			qcom,qmp = <&aoss_qmp>;

-- 
2.54.0


