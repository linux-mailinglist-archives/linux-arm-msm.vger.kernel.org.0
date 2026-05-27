Return-Path: <linux-arm-msm+bounces-109931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBzcEiuDFmoznAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 07:37:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B18FC5DF7DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 07:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66CDC30429BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 05:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FAD4274B46;
	Wed, 27 May 2026 05:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AhXaZtC+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ur5wDkbe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7AC30ACFB
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 05:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779860252; cv=none; b=AgCVyJNX3fmRJ/4IfAAHAVH5AmuBPtQfhGqEwgMIVvwbccd27jZwCT+EIIPCWiU7kv0ucOlrqfKDZSSiHtdZ7mlK/vtpFqFwJ9PVtpCCDnUEdQedbTHOAdjyyg3XBkUBxRwlSGcGAUsE8gAaDxYKpp+iwAWzsEg0q/dksDpeSus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779860252; c=relaxed/simple;
	bh=BTH6nTAXC/KuAIchvlkMkIC0ei+c8gu3isXqJezhZKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sPlztAN+IDnF3CShtCcPq57SYG7PljqMLuw7PkQyypNlPEdtIp6bO+XMBJXtRdODujgOP+USWn3kkttl1A5lR4vEROCTjkWNYMr6Wpv2EiaUAxYaZpg6wtrKS5D5Y4/XSsivqS/jOv1gGaL0HL1nWe6S4z1c0H26ygP113RbSMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AhXaZtC+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ur5wDkbe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R2X4OV1435316
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 05:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pAXXV36i2LQZgLrwaGCgB2un0YBjbCrnXi9C4ta3F1w=; b=AhXaZtC+2RBlkkLW
	I/bxAzXN7QyqbTcS5ivhk9KmqHjmEiH1TiM3zDrS2eAazUERdjaTirDPtjsEqCl4
	wTpHbkTQLkUvdXWnZToYuwMXOKjWPSN8mo3HKu3vqa4b4gFBWcjvnUib0T11WRCz
	EB3XhhSA93TGfarY8JJFrw7bbcLOUZ+4jUIJ8TvVs+a3RJ85zYa8mMFS7qdqz3zO
	4gSQyfRB6khYDRlb6nWd0AuHagO/EIrKNxltg0UXzbcZ22R0Gipnv/CtzvEuJrkf
	77kNeTovq+TBzdv7tHVNrsRlAx7guXOtnLgX4OsP/467MTym6sM2leGiRhVo0km9
	/ADGtg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eddd7tyjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 05:37:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baf7748d0aso115883065ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 22:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779860249; x=1780465049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pAXXV36i2LQZgLrwaGCgB2un0YBjbCrnXi9C4ta3F1w=;
        b=Ur5wDkbe7bnYJYw0ov+je44s7lAO1NvDZuUOuwyaCI54t0YklA57rZs2wdy67sWFMA
         tBowaiyKi9/2/D+nYphz2Rq/ZnsieglSmPcascb5FzBVOu+L4C6eNSbqWelV7EhvuN/m
         7KfHaVuHqArMvM0fDn5amCiouPTRtrnnNVuijKDRprI/GfoQCSc3cSm3fsNGjsfHRiSK
         7fpObJtWaKgNXtYm0w4gN12EvTP5j8LU5/zgwXOYkg8DIwcCiEczXQByHcLdsYL4Vk2y
         B+h9p9klvpkQS9pvIknJZM+SRMdIPwArhtJMtsBdoeoYnv/peV5k+RqkwpIkvpDyYaAQ
         vNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779860249; x=1780465049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pAXXV36i2LQZgLrwaGCgB2un0YBjbCrnXi9C4ta3F1w=;
        b=B0f5wXXstpAg2Y8jCnsGOsKYVa1UySYCs6GnX4lUiAlQTXtWtmwFpImKwRdmoEvW7N
         jjYS+WFvCcSgn6rOQgSLAc4Ufipjv7kaw67WZbLxDRnGhaeBsr3WvNIsILkWnrAkslGA
         77ixs094ZIYMYSQpnGswdpDQRIt/XTENPl+KOlvMqXoQxbEzqy9qVI7NTlXlwllI80Ty
         +D1zVj6eRUh11QDfzEmZQXwDGgLx7W+64khATzJSe0e5ced4LWdtb24qsamv3zzBgNKI
         JOulUFq3a4zvrnH3G0axDC37M43XqhnwJzPS2g5Nnk/hhZRZMJVczWVVCnnfdGEzoQMw
         mzqg==
X-Gm-Message-State: AOJu0YzPQ59vgiz15hfx0IN8tLIihBMg1bVNScRAS73tRmaRyc8LzJSK
	tMGlhO7th4/Rb++UbV3aS7krB7LMDc+IatzijWOil0Oo7AigB5/P/4S0X69yCqxycNuPHTlOGET
	+SP3nutlAErgqUdK/YNnbtxpFV4u2NgdpXqjwl6X7fv+8FJJ7Nt3kU7u+Rt77N4AKDTjW
X-Gm-Gg: Acq92OGFRADMbWkYDtHUlFb53lOYX5D0nr7RVgTTGr64gfMchxXijv10pv+G00bF/rM
	5MQdCwUgm7lq8FC7Z120QMKR93EwPdPPuLQTQlhr/x0JeYhVxj308LKFecfxwQ1MpfG+NySjcgR
	vkx2vevPoZ1Yyc/pUudsdIx1EyqXAN8GH4MDPXJSihSd6RfL1rkwu4c4N8p48Vwe2Vt9DNytvI0
	w4HQ9DOwtVhfp0jY+56QQ9sgzKgvyy1gl8ROm7io2dJW+aIx8WlK7KXtzF1d9cpqMt+4jY+g3Yl
	5OCH11VI7naQJgMDfB9n9CJ5QDlreDI+u5DwCMd6npl+vD8b4TTlaZ72kmwWD/mKpsULQNWfjZK
	Cl8b6IDESs/MJVDLTjnOOtvPeILPVFf3IJPGWjCLZUUU3
X-Received: by 2002:a17:902:e790:b0:2bd:9061:d544 with SMTP id d9443c01a7336-2beb06a07cdmr229487905ad.34.1779860249456;
        Tue, 26 May 2026 22:37:29 -0700 (PDT)
X-Received: by 2002:a17:902:e790:b0:2bd:9061:d544 with SMTP id d9443c01a7336-2beb06a07cdmr229487625ad.34.1779860248999;
        Tue, 26 May 2026 22:37:28 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb569592dsm136338585ad.16.2026.05.26.22.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 22:37:28 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Wed, 27 May 2026 05:37:11 +0000
Subject: [PATCH v2 3/3] arm64: dts: qcom: x1e80100: Add clocks for QoS
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-x1e80100_qos-v2-3-305c6539e6d2@oss.qualcomm.com>
References: <20260527-x1e80100_qos-v2-0-305c6539e6d2@oss.qualcomm.com>
In-Reply-To: <20260527-x1e80100_qos-v2-0-305c6539e6d2@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA1MiBTYWx0ZWRfX2NdbkdWo4Evx
 Xubu/ueHNJcZXhK+quCN8SdjIA8y8UAdGmL0Rjullojo4KCsN9Qv860zRtkvd48D+9StSCYwzDR
 iKiSXJDTpilCAMg6X97Ux3ZASJ7YyFu9RqcwZngIFv88c5QFD99L1tlQ+nvm3pw3g2S5fZJPrPa
 qKIzpEkFgeF86vLzmLdVLpOQcxRBT+vhBRpoRAvlzr4a8xeCOg6wQnBxhUOVxSQQRT7d341jES3
 cV3Y4NWjf37+d0m+Ro/WPB8H9YjkoU/avxWxz+bC1o7WSNfodhUSth77BlLFcToD5u5BZcHcJY6
 BCtnn3gYCwGAv1wzzrzPlHzLqHSsLtauT7zs6cn8sCLSUY01z2wEDLqApInRX0X+T+viAzlFlsY
 ZqBtkQz12lTcxA4/lDPyhZDyrCbIDbxDvm18zZXt5dxNK7IQLqFfpMlbkfKZjY69eXfWqszDOAB
 yZ+4EP5VPvhu55hGtHg==
X-Proofpoint-GUID: v-9rY_y6r_yUbZoiVHCrVcuIsYz-pEsH
X-Authority-Analysis: v=2.4 cv=fKsJG5ae c=1 sm=1 tr=0 ts=6a16831a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=k0pzShdNuwS7EJf8KIMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: v-9rY_y6r_yUbZoiVHCrVcuIsYz-pEsH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270052
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-109931-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,16e0000:email,0.27.2.16:email,0.27.41.32:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.25.240.160:email,0.26.219.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B18FC5DF7DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add clocks which need to be enabled for configuring QoS on
x1e80100 SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142..1a2d9b3f7a70 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3132,6 +3132,7 @@ aggre1_noc: interconnect@16e0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
 			#interconnect-cells = <2>;
+			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>;
 		};
 
 		aggre2_noc: interconnect@1700000 {
@@ -3168,6 +3169,8 @@ usb_north_anoc: interconnect@1760000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
 			#interconnect-cells = <2>;
+			clocks = <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_MP_AXI_CLK>;
 		};
 
 		usb_south_anoc: interconnect@1770000 {
@@ -3177,6 +3180,12 @@ usb_south_anoc: interconnect@1770000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
 			#interconnect-cells = <2>;
+			clocks = <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_TERT_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB4_0_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB4_1_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB4_2_AXI_CLK>;
 		};
 
 		mmss_noc: interconnect@1780000 {

-- 
2.43.0


