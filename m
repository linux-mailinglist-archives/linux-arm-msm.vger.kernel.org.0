Return-Path: <linux-arm-msm+bounces-109519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBYnAmpRE2pP+gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:28:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C205C39D1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A477830091DC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 19:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0376F33A70A;
	Sun, 24 May 2026 19:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGYNI2A1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TfxD+KY9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826E133ADA9
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779650785; cv=none; b=bd8ahl20OPrM0r09wwtS8T16MrEts5zoKtqifJ+RxZSadOlQ54CK3IusNCgoqR1KAwKP9oJhWco//Os8weCWIf1qGkl8lTE3ZAXCVvdGUV+0FWcAXkBZyQ1oPxrGRyJ/vgbfzZu32h2cxs/zH4Rvgdjwgp/PNHnCU26Ws7kyznA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779650785; c=relaxed/simple;
	bh=/x7fhiqRUVFf6KsQ4pl3FTJpHo09DykPuFw1fEIj6wA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N+Ab7Wl07QME3thGqOtu4xaHOdrlN93Pwtr/6burT+M3dNAHaom8eXQrWn+iy0vO/4lu6/iUatsUATuhDpOHXKTq2GOz/7je9sycJbRoUVtzBUfFkjhFIwxOB3jKYQqqvFBB9WPlUD43Cx7uKzK1FBbyhcA8Sh2CYOtZR8Pq2xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGYNI2A1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TfxD+KY9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OAxtJR335207
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DMOlm7hNmzx6629XwqNAUJiu1R6QF7UImrBpTqYLhBg=; b=MGYNI2A186PM3f/i
	SiuXuk9wLr00ADqXwwfM01E5ZuvFtZnjJwt0V4v4ezjfoAMEn7qADTwbAVnQjp+N
	K19wQBw26/q7217xCZZqhuD9/SyPq8lC9KKYxKDC3jOIFK59gfdZwIpcpsJOqroF
	AnugYWU1pGi0GWD5J3dYABndPKdqdeTgKaylppCIC3J64u/1umXuTByT86hBQLBW
	TkYaMpatmtjl5vkpfNGbH1wQCDWaoZo9QnPcf2xpnPrM0NJpaJmaBFdiBk8hc7vs
	GEHp5knbhHnA1VTbB2E88Jgepd1iB32WayYKqfyFQ1uFM+B6g/kiSAg/y1AP70hz
	6kV41g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w3bv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:26:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2be9e0905a9so45228965ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 12:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779650783; x=1780255583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMOlm7hNmzx6629XwqNAUJiu1R6QF7UImrBpTqYLhBg=;
        b=TfxD+KY9p+VMlBCQ7eGdbTsI8o+Cmm7jYubK99DoHIZgFI8xDpdhu4Kn0wsqpsri5n
         JmHiu6FSLwCsJwaULML0jMsU/SBmVeJfdWibPugwExK+ed8NhRJL2tMxfLYPtTfDVMkx
         MvdWKVvgYhnWuqNBJ4ngSR5pKe5gZCy/LtVcnpKD4GV4Kx4gfB7XXYTWdLJ0h9PVXLi5
         yCCCpfkH2Nsl/hbqQZYYy15HbZRzyRnipREIrFKhALNvADn5EoFHmOLiAEv9fkwPaHiO
         mPuRs3vCMOWPtnrHdlhmSbuEmguScRKXFGb8+A2jkYT5I9rCcTlu+ytZkO1X6cjqBWVj
         EviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779650783; x=1780255583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DMOlm7hNmzx6629XwqNAUJiu1R6QF7UImrBpTqYLhBg=;
        b=s10wx03hOFAM3gNMwpaXFKONwSggMR9ZRN5kesOTlxjuLgbf/BLvPZwHAmses2HfAC
         z/kZ4a84xSAg0jJkfyUJ8EEA/P2mY5WBSLtEEkrbZLCbl3vi+yKgop1XjQsXCNHF8i/o
         fao+o/WM4QNLqfnfvoOV++JAvZ5FcEQklIvkCWTR7Vra86wfRM6YGapAlo6MbqDJzAYF
         jJxr61JsxzeBV347ER/6aeWfO6HB/zG5yQX83gU7IVYlOwm8CFW1n0ta735p5MMuqIFu
         v57cuMvnt0oxPN7iwnkOkhkBThlht2bZBUDlQZ2QUGwF7S4/QyugLyzpwCAEPdKOl+HQ
         nWrg==
X-Gm-Message-State: AOJu0Yw95FnFeVh+PXZ58ZP8L5f4p/k4A7iMkOD3XannSJlJzZlofbnc
	5hzFuh2O2BJaAo/gTVQ9aOm3jkq27+F6zBprfl1qsZsjjlmZVeB5woOabOUAJZDHkqbCNsRyvkK
	LoaV8psgtAztRfBR2fZH/cfuysFAIW+0e/T832PyJqIN+yarB73B0IPdkKXaQqz+47X1P
X-Gm-Gg: Acq92OEwKhEiHE7OSUAQ1M5Fu89UDujToQ/rAPdHUTl5eIV8Cs7Qcixgpv9St+zzQUw
	SpYxygZl6cogVWA4VDH6S8z9nh1fVGBkvt2udWIoBcA8JjZTpFdskT5pwWvfxt8R+Ikzniyl82V
	yJpRAs0FkndNgEr+o6+roD2VfL3jkHpR9YyxZVljMOcKUwolTleXHtO1ExKQza9AxM3ZimLfVJq
	I/5NSrQBSzpjsDjru6JwdMmr1YkLNEWQ6qRW8iPCCtFG9CLX93P5dYg3ann5VWW4oXQyAKdeSwS
	soDbqT05LyQwfg7Xmqpsw+KEtmo7nYerNQxi+1Hyi465p7v0TZrGVI7u1ui7K1hv01g0fV6wsY/
	yaq5iWdZePCVknlAr+qm3N1ZQcrfaZ98xk9h3qyNYmAb2QkUnM4pVvztDXzZetBFh3re2Zg==
X-Received: by 2002:a17:903:1b70:b0:2bc:cf06:6835 with SMTP id d9443c01a7336-2beb0346047mr123255425ad.8.1779650783064;
        Sun, 24 May 2026 12:26:23 -0700 (PDT)
X-Received: by 2002:a17:903:1b70:b0:2bc:cf06:6835 with SMTP id d9443c01a7336-2beb0346047mr123255045ad.8.1779650782559;
        Sun, 24 May 2026 12:26:22 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ce2cdsm75329945ad.29.2026.05.24.12.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:26:22 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 25 May 2026 00:55:51 +0530
Subject: [PATCH v9 4/5] arm64: dts: qcom: kodiak: Add OPP-table for ICE UFS
 and ICE eMMC nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-enable-ice-clock-scaling-v9-4-c84613e9ce47@oss.qualcomm.com>
References: <20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com>
In-Reply-To: <20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a1350df cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IFdraIdqUsMg42QbtkkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5NCBTYWx0ZWRfX3TdnMeZTUoPv
 YVlplhUW2Rr4ZCsY8za+/vxF5k9tmz/qExGaQwYVHXD+a5Q9reifVmw94J/r1eS82LrrOJj+Ip+
 iUurz5Ya4bKtOP8TWrc2e5jSZfu3mgdUtvk4A6T3XKusnzkpPIrdwySNuDA8+4G0P6RwYiPuJ1m
 Y2pWpTEyImc7vRUVrlugbW6FJfqa8a5mjqL1D9h3s+4dtoI/580aZUZVv60qmK8uwlj5eLMBJ5q
 Bom5p349KE7+6+hIYsvluhd+jcLobkuHP4qR3Gp2ypLKMn3RElz6nwFjaNe+Aazr6Ogcg7M/fD/
 PFYQFv5kfN4OR1zsHUA2Gb4OV1fAd1kig5477H6c6CadNsg9q0a54ziiCXWCqVxXsdGuBRZPsEt
 uUcnk0WI1lqDJql1HAdeVVEJdD96euhBT6R2HYl33NGkUbugj3gkGUaQd6EhSAq/OsvjCYrjVIZ
 nLvMGkSzaeKF6bmTl3g==
X-Proofpoint-ORIG-GUID: TqBHY6wpolm4t_yTRog0oLyUpmtGriw6
X-Proofpoint-GUID: TqBHY6wpolm4t_yTRog0oLyUpmtGriw6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240194
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109519-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,1d88000:email,0.13.187.160:email,7c8000:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,1dc4000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F2C205C39D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE eMMC device nodes for Kodiak
platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index a8260f695058525e77653fd8005fd3d250715a91..8a8328c5dfa88b69594fca926f4f7c1825416259 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1087,6 +1087,27 @@ sdhc_ice: crypto@7c8000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmhpd SC7280_CX>;
+
+			operating-points-v2 = <&ice_mmc_opp_table>;
+
+			ice_mmc_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
 		};
 
 		gpi_dma0: dma-controller@900000 {
@@ -2597,6 +2618,27 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


