Return-Path: <linux-arm-msm+bounces-112605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ytcCKp1DKmqplQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:11:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5131C66E6D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:11:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oaRqZXd5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XDwAJR0b;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112605-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112605-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 833453046EFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7D436A377;
	Thu, 11 Jun 2026 05:01:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A51430F958
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154061; cv=none; b=YockRIYAbPzqOMnfadZK7tflSnx+JHfVYkd/Q6qrJRSB14JTkeEJO6j+MDLYJ4MrGgN79d0zqzwx+3AhLMR6GV5OpGtZqq1nKlDtN3k7iJoTKWBE6UaXfl78JllKoJBLlAVBtu7c8QmZAJs+XO3xwWTNuRDG/z0Hr7w4H5Ph1QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154061; c=relaxed/simple;
	bh=L80h2On4bfqSssntkfNzGZ0RvyjR3lO+HJKD+5e5HFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q8EbITTFpbt4U6wnZ7/UAVDqaHF0uCH2CIijx91S1wHlCE8tz9I5Gg27MW0w+GeHqFRaSXl/oy90zg2Wa6IzJflwxl/B5e4rkOfEIADLsN6GaXqOwdBf7fC93YNH1CeNklCxk0XwLXw8FRQeKR+GaxIBWKcwlwYjn+CXXXy2bUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oaRqZXd5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDwAJR0b; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NbOm3132304
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mnEzl92G1eF7x+XcmO9TZ/YqDsaNnSCiMQYI09qQBs8=; b=oaRqZXd53DrhaIjO
	owQftyRzR329Vuxp5jSIcU3c8/3nesEzkxuJ4E2OOHjm6c0PU+iSzAGApxleinIY
	T5LFQgcOE/sEuOhhKlO72PTnuku6qNRLqJ5kEe/ti3xUbTutqAoRFwvD9dRagntv
	xLldp3y16pUT2lWd5qWReVH2WdBUrs7oYhptSnGApB9HRCCCFby8lolGLbhgSWJn
	0b6A4fxv4+J/nePpwowM32SuSwbDJhV1D6pMftYR3ceI0Dzb01HMpbyL56zzSZkK
	PsyHRsV6zQQ72nyNCNg6eL8TljB2CHmLKDRgqaHpqE6soykxRJYdEmIf7KTvs6qO
	xxyotw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6shqnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso76545655ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154047; x=1781758847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnEzl92G1eF7x+XcmO9TZ/YqDsaNnSCiMQYI09qQBs8=;
        b=XDwAJR0bsPmiNQcwPOrqSkIr0D8keweY/BUkmlS/9Q0ZmOLPIJTx8NKoYH80593cUo
         HF/Y1IB4kL2g2TZCN/N7LAY4cx3gVmyVAh3HZALOv4Ht/ptR5ia26nRiYfqPptS8Keh7
         NTS5bJn5RoYL61+xBcXyna/C3d9X37wNo6Sp3Iyp7QfSRqkFg34hWh6YAVIzGUC3NFU5
         OfRn6CujULl8w0R0DXPqeONv228ZfVV2lPvF5gWW/MU3h74LcECIpXMylN4W6IsTFml/
         3EtX75cfQvrJ8w3hb3VyWcrpwd1wdwef+dSNuJ/TQ6mExLa8106WPQtWXsPcnG6vbFUm
         7m7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154047; x=1781758847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mnEzl92G1eF7x+XcmO9TZ/YqDsaNnSCiMQYI09qQBs8=;
        b=GRLegWHyhJNppWPAaZy0/MQvkZm8LdhZhf6FfvWeGaYAeEZZsnXflnO99rbrk7OLQj
         gcLR+xIwpcMBn0UCKHBSfFlGGfvJ7hY5I7JzP4hEmUpPuRbm724V0Z0Av4ZekcGySChf
         uYZ1SV0pmi0NaiYC29S6gcDRsectcc5IgVtSmM2aw4H0ym9rBPNxwwNE3XYpCwpfmatk
         /RquIgTTOEerpLf8okKlS5IlLpAuLW96/D+p2akyUBmnhm3yeB3FzqOgzsqedmSH4a5K
         RqvtYqF8kcPbldMobUfKWZiQFu4lE7O8V6bMC8glrYrNXiV1XADeMRbotdzI2s/ZdTrP
         g+uA==
X-Gm-Message-State: AOJu0YyyLSEGG6QdPaElzYOS0sL/wm8XfA9oiQTPCmt4S8ZFc1O3bZFM
	CToa8ExZsUjc8UJUZ3WKBgfu1B0pe/1qLP3TFS2jEd5keQuFsSPXoDfim3BRjOYabXdj1anAwRV
	mAaAN2O8ewrSTdq8UIoSBhWlH+R1BmqOZe+nvGxZJr87ykFrKEoCp6i0jVWMK0Tm8I9f/kUwgIY
	Jv
X-Gm-Gg: Acq92OFcS9Xj0Xruz5legdQf3VVB97gOUuklCL/wfMRvikMlEr/rPrGcAtZSyoLA/9e
	mU7Obl6UO3h9P5+iBLGlbGnOz57zX4sy1jMb2w+OY1WYRmft8tNkvKXxxwMgZ2axCxkoMyNOAay
	xAh1G5BPtzwVr+yAenIma8+hlJgiZP+d/ifwJ3Qw878F51GF15lPVpBbjymut40EUMQwK8Ax3Z2
	h85oJT3o6+NhDdReW88jyDexKUOy+Um4h69YWykJ8uAWRtV3bjMBrOrgPtsx0iwNmB2lGJuvGHb
	dVppTv1j0eHk9y+7fhZMNLY3W5RT68R9hbZnd3LVcMVwpSQqmAAkgw7yRWCZ1IYK9ZhIF9vzTLB
	HK1qda7fkhLUpE1Id7IdakK/EObtN1ahK35TC2F7v57llGf96b/6AsYcMfKmQoo884eU=
X-Received: by 2002:a17:902:cccf:b0:2c1:d49c:8397 with SMTP id d9443c01a7336-2c2f21a0e1cmr14800365ad.12.1781154046509;
        Wed, 10 Jun 2026 22:00:46 -0700 (PDT)
X-Received: by 2002:a17:902:cccf:b0:2c1:d49c:8397 with SMTP id d9443c01a7336-2c2f21a0e1cmr14799385ad.12.1781154045520;
        Wed, 10 Jun 2026 22:00:45 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:45 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:04 +0530
Subject: [PATCH v2 28/37] arm64: dts: qcom: sdm845: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-28-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=3878;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=L80h2On4bfqSssntkfNzGZ0RvyjR3lO+HJKD+5e5HFY=;
 b=/sVH8kyl/3tn0deZS8Dh9SXYWmgXIs+aN+ZXGR75ErEnATdK0yyXqTDdY5MhuieQO7U8dmyJT
 tGl4uWHFwU3B6H7lWDPndl0xMGOVdHZofTj6bUCz3+ZfJY69ejm2EgM
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a40ff cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=wgeVbiqT6WWzazAUDA4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: h2mirvZQ-xfq8j1d_DaXzgZVk4EEDkAz
X-Proofpoint-GUID: h2mirvZQ-xfq8j1d_DaXzgZVk4EEDkAz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX5m97R7Ca3Fdx
 Hs8+gOFOVRcCS1KMnltNQVUFM39nfhTaFme93IXHO2ibG+1h1Ge6i/CZ1Bau0WBg/drL8pGba6Y
 SeWGzHE3dVKdEdCNzsdRs2QX0DQR+EdD+ub8YS+VcIWP6QclezWnkfywtzBsK5h1fhhHILug3Ly
 g27lwsuUd+xq+tgm2FtP4BT7Q/rIkIfYusp97MzDz2hkcPQV6E/nE5ONvojYTgn8N96YXcJgL5a
 FdHQelI7pYi4V3RxohJ5TXJU8ZTsQvUSgep6wH69ueX7+dX7M5djuPZ1niPe+pesWOcCfMi7dcv
 mJ9P4RRKTlv1UdWHeNvzT0TloFGg7CiA0mAmb0Gya0LxvxfHSHtzwRqgyYHoAsDnrgWgRj19H4p
 lCeUrNBVOBM/GmHdcIWtbV1RXG89zav6zOvdVp28Jb7dCXxx2os2Ug9GbthxOi+4a1jG/a8qhp9
 eMewfPlMtA2zB6mZrjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX042NbP21K7O1
 7nwFmi/03lxL0MY1OVAj8b7mKbDKGf6sGXQgkA1pRKUeIBzWNQxFwnKQQhq1qBnOh8NRs5EARLV
 AUP0XsDoLl+0q5T+aoy7OibSxl2WCdw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112605-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5131C66E6D9

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
board-level overrides. Move perst-gpios/wake-gpios from the
controller overrides to the respective port nodes in the board files,
renaming perst-gpios to reset-gpios to match the binding used in the
root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 13 +++++++++----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts    | 12 ++++++++----
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 14 ++++++--------
 3 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 24c0e97bb122..ad00f436800d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -618,15 +618,17 @@ &mss_pil {
 
 &pcie0 {
 	status = "okay";
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	status = "okay";
 
@@ -636,12 +638,15 @@ &pcie0_phy {
 
 &pcie1 {
 	status = "okay";
-	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 091568642faa..c173b870c943 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -510,14 +510,16 @@ &mss_pil {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l26a_1p2>;
@@ -526,14 +528,16 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4ae8627d6dbc..efaa71a1d13c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2394,12 +2394,9 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2407,6 +2404,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie0_phy>;
 			};
 		};
 
@@ -2524,12 +2523,9 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2537,6 +2533,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie1_phy>;
 			};
 		};
 

-- 
2.34.1


