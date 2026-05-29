Return-Path: <linux-arm-msm+bounces-110329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFM3Jsv4GWqN0QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 22:36:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10681608977
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 22:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59D2B303431E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 20:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801C93AD526;
	Fri, 29 May 2026 20:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8gqnNrH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQVwoCjJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BF6408004
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 20:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780086450; cv=none; b=lYTGUZpFKBz33+VozbN3m8daBirBk1OzYcg3ofpSgMCEow0s/4AVWLupMVrjqgfazwWsZQ+e6PjjdEH9vy/qGvlui0IQocbFZFs+rlGQpe98JGYju7Ry3mP/s0oKD9DU+y/+nD+piP6/mwvyLksA9nh7UvbJc/AZZbTQijNzNRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780086450; c=relaxed/simple;
	bh=cuVL+gwQ31mrNk9hMzsr+h/PFasOty3vgrF171jnPSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TZNexWqpvLE2yC1d0S91NNliTTfJZB/JMCfJX2q9vAd6DJ4WBDLHQPtgGi11sntv0YjGFwa77pQh6IwbLtEPQfiMjVc7hvor/dITSSHcz4rghoRjaMM8YUvww0l6iaXIaKqXtTJPQp6YR4qIlpCqcr6kOgzvoUhDV8fVJUlJ4uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8gqnNrH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQVwoCjJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TI2OMj1862680
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 20:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sJOpYNEEndwBy2X7DEJEDx
	OWb29hGyZcHdz+7poWAS0=; b=Q8gqnNrH+d73FZ5B/7b0Kb87w+wl+aPnNCl4vJ
	4yrSFDei/liTADlpIYurXwqRPtFbxi7pTaB5sTqL2jM/n45LvAEo+SUgpAtlF9yF
	Xh8Z/yVbSdO9ZL9quprFhLMuT4OuD/B7W8TlLyOG8ZypwEHLYHBYWZH7Z2e8/p8I
	EFuthSTvBk2SOhQ3OT+CkhnZgiZ4ZQgZKSSX1sIJfxOZftHLZ/8ttanWMRb0YqmU
	1wqTgEFehNTX5EEenc1VzWHQ2wgRI+3zAPhgA2vmbIFIbAMjSeqT6e80V+oanLQt
	9GSYoKpMOD5me/VUcBUMa+P5qBF53SZhtFp2GglxpOiNJvzA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef3te4cvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 20:27:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2befec3fd8fso18101825ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 13:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780086445; x=1780691245; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sJOpYNEEndwBy2X7DEJEDxOWb29hGyZcHdz+7poWAS0=;
        b=HQVwoCjJrcmnnBwcbgNeG78K4BNW4jfkYyMlC2OVU+25YMkf0nwJa2cf2HqI8StAl1
         iwARL0nkQuzterRpXN7zNfrNnp0e43pVPpzSSI+QYFTIwkhUn9ypiSME2wESW7liS10K
         ocPmQ0+cOs4XisNl5gL1djbY5Zq4mP4TOO459IYi2UV8AlZtSyLaG00PsQDsIH361fCM
         ZsG9+VvdRazm1JhhfUakiPwsFnYLT6K4G0H+WYAEftM+ZilLJYWKDWi6FC0Yc4WaHvcy
         xtU+KfXw76sbS07798/EkRznMSvvR3nXlqNaVPBprg+O4Asjx3VW28t0Pb6NuURBpool
         p3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780086445; x=1780691245;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJOpYNEEndwBy2X7DEJEDxOWb29hGyZcHdz+7poWAS0=;
        b=TUFYmZW5Slh9J4rNnzceiialtJqKTGhIVKVzJQodDqWZIGrl+B4Up8RqfbnYWO4I5u
         N21APcfPqkvg/SYeCxe6VBlwbKBjZcphgx9TlLDMs5ZYsbBJbdqfihftO3sLeyBWU1p4
         Ph6lliRFg7UEKW83wiTM8+ujnCOWXPbnzhbMGMbM9tYc/qT8CTk9G7RXHE4b1aWU/jN8
         jWKhgQUXwB3xIsseDGeCn0hje85Qawu2x8QJwVz80hRayL2yeiaSt3m6jxo8xNZnLfqZ
         yS9M7RsOPRoVlrtVqnHB7iSLEvd5H3jeEfckGKo3QVoJJhWfUfrCnu5GbVfa+uSlgVFy
         FXxg==
X-Gm-Message-State: AOJu0YxqPXRw+6Vq75/+tBMfmLwuflBM7jNBdYc2KqcEuIjiDGhP+sKy
	YBs5+fg1dQMriVVYYuIHDOtSXePRW50XW+Lj/nPq8DNoq8EHYifvHo3chsaqgGkF31ridfSlWq2
	ob6oqfK7+68CNJUP5HkYWWapG2QUW2ZChb5NsRGjiuKOqxrQ1Y34vi39TwCzPf4q+pmWZ
X-Gm-Gg: Acq92OFiPv+727SByLhnchLdTXxY+cBx7s6qtfIsKmAKyN8UjWX1LwwhcObAfwernyG
	QVlGxXPYbs1QoYgh5jQfaOmBqiXu8VgiqdcW6LxXqITvJUMkbHPpLpXOzJP1yvX/9i0B/hQMcGA
	h0iNajC5vwvMdmDR0GrsktDa1RVuKZVHUEye/QMuRz5wQ6yDmlz+f1XhIGlwYr2bKWnTFxrBAYl
	ZYlJpBVnTGZFgBrVRUW5ZLDcmZ1rcJbq+F4Bq0BOlB6FHYa+Z4Pk/5l9ExixiD3+ze0H7nvUAnU
	DNNS1WncPUidXolACziu3huS3/grEzA4YQDKeeecQmXZkx5mQ5tUoqz3rjVWnJ2Yje2o2liQstj
	KkRKhURQIfc1EYj6QQw27aYCVhJGzE/igq4J9gYBqx/tqQQzmNSO6Kzt0e7UiakBvqIZ5Yw==
X-Received: by 2002:a17:903:1905:b0:2bf:23c3:34b2 with SMTP id d9443c01a7336-2bf36867d31mr16830215ad.32.1780086445504;
        Fri, 29 May 2026 13:27:25 -0700 (PDT)
X-Received: by 2002:a17:903:1905:b0:2bf:23c3:34b2 with SMTP id d9443c01a7336-2bf36867d31mr16829875ad.32.1780086445058;
        Fri, 29 May 2026 13:27:25 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b00e68sm29913825ad.44.2026.05.29.13.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 13:27:24 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Sat, 30 May 2026 01:57:19 +0530
Subject: [PATCH v2] arm64: dts: qcom: lemans: Add OPP-table for ICE UFS
 device node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-add-opp-table-for-lemans-ice-ufs-v2-1-2b46d3ac37d5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKb2GWoC/4WNwQqDMBAFf0Vy7kqSkog99T+Kh5hsakCNZlVax
 H9vKvTcy4N5h5mdEaaAxG7FzhJugUIcM8hLwWxnxidCcJmZ5FJzJRUY5yBOEyym7RF8TNDjYEa
 CYBFWTyCUdhVHqWttWdZMCX14nYlHk7kLtMT0Poub+L4/efVfvgkQcPV15ZVFzV17j0TlvJrex
 mEo87DmOI4PrY1LjdcAAAA=
X-Change-ID: 20260525-add-opp-table-for-lemans-ice-ufs-156d70e2696c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: bqJUd-79C3zeONCyvRjbEGd8tI81bOje
X-Proofpoint-GUID: bqJUd-79C3zeONCyvRjbEGd8tI81bOje
X-Authority-Analysis: v=2.4 cv=daSwG3Xe c=1 sm=1 tr=0 ts=6a19f6ae cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F-gtwfDqNy-CsTC3YnkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDIwNCBTYWx0ZWRfX8PjFeIs/NtcB
 RK6Q5iEmpL9CMFwtQRZX0c+rC+SbMHesN9QmL2nabceEXp7l7KocE+FNuG49sj0Js0YqWPsGSDZ
 ccTAHXe+yGwhZVcGPEO/36dgfanieEv0IIAo4S6wJFUi94Jas7gDJDaRCfo27BZo3QDPodmdJ1d
 OxNfu6qx4Gs6XClDBduUXa0rGRAroTReeTo3lXrPsh3BkjKZijkdQBgQlZIuwETU0qYfsY4TXfS
 gwYLSncFsrnN3mzj5buLKTx10NFg9BCsZ01gAijdIgGiJM61hzE4Vl2gW8GOGFHayqnV3AAm4eH
 9DzcOHqAsihCBxRc+I7urvArUUQLFQzzg/HRf9me+ureBZtIxDDdy5dCZ2Lo2l1v+AhhZ4lf5BO
 Ed/agqSj0n1oHmFsPKDTBoPsxfVXh2It4zjVE4vZ4dsDEvK48k9UzC2K6Oy3zWIpCGiI18YC+5a
 ns2cL6SUZoS6zF2hsVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290204
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-110329-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 10681608977
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm Inline Crypto Engine (ICE) platform driver now supports
an optional OPP-table.

Add OPP-table for ICE UFS device nodes for LeMans platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
Testing:
* dtbs_check
* Validated on LeMans-evk platform
---
Changes in v2:
- Fix svs_l1 frequency from 750MHz to 75MHz.
- Link to v1: https://lore.kernel.org/r/20260527-add-opp-table-for-lemans-ice-ufs-v1-1-3f97f5ce60db@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 522ba43836a2425a8612506f5f7113f291f34706..9624f641212e5a80b74da52b82ea54a303aeee13 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3109,6 +3109,32 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		cryptobam: dma-controller@1dc4000 {

---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260525-add-opp-table-for-lemans-ice-ufs-156d70e2696c

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>


