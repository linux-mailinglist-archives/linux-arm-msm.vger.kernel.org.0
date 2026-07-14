Return-Path: <linux-arm-msm+bounces-118899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SvqtG6uXVWpLqgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:58:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EF8750383
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:58:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=otCWIbPg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DFGhb0Sj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118899-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118899-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C41C300753E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 01:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E94374A04;
	Tue, 14 Jul 2026 01:58:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCF2371887
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 01:57:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783994280; cv=none; b=Nc0M8S/UfYiZFr1Xx6q0kA/oQcBkzZ34EhS7bJqcid1Pki3NUQBkzdKWXvAtBy0mj1Xhf1L+afvLrrwWidY7nygaC4z03jyoHeKGxPS4lABqG1kpPCmuk8ET/yOBVJHN7Ve1K6hiQ59/Z9oKzISe08k90NU9IiKt55CnWqGmAeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783994280; c=relaxed/simple;
	bh=yjgqlv3QNTHFAGoM9H54PKvSKonzDssY7W96XG/oOiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RHdPMrNbduWdQ91WUzvaOGGph7QmjsiQkvJvMJSf6T9yWhYLZEaKaKE8Mh5TL16VSQIJl1hRksTX1+aIxn7lFZdcKw+YkYppzObaUwt4aXxODf0GuMzj/cDia8Cuc/cpt+lUQi9ZsTNDzoOEqUXyW+CTGQWe4VW5K4aAg2Lf95s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otCWIbPg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFGhb0Sj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DNnbnc2986202
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 01:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9nvPpuACviZ5FLIt1UswJ9sGYlO0hmf0Ng5zekU/zo=; b=otCWIbPgFb6LuIY+
	Y14V1Ykusdpb9sWMpaiVvK2zXR+oKLbvfrftuPd8sCXuwTaYt7EKpx0+P52zbTH+
	ziQbNljQ+PC39/8BPGjwmd5AmgGXWDmsBCTbEFkpWIoqzwltibac0VHMP0XT0ZeZ
	P9k5Vf432Y7D4KbAR8f3K2l0h8cn24a7Q3k2GJRHALNmOBMkvcNvIOXCH+6aG14s
	Sz57Relk3lPSSdKWLxxD0NRXhI9/D4ubU1qCI82K5ozymJ9OTu6FajnAHkxHERpX
	esrax+rbkVKakc+XrrTVI3W1tu/zNSkAG3cw/7spp5LEu3ipKZpxWF3Dx812r4ZV
	qHVoJw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44j1gn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 01:57:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848568a6f62so6671217b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 18:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783994277; x=1784599077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9nvPpuACviZ5FLIt1UswJ9sGYlO0hmf0Ng5zekU/zo=;
        b=DFGhb0SjAuVuGHe4LQ7jA/C9GpNz1Y/wJEy/pELO/AzBUroU1r9n7EVnVDhBLxYSGY
         t82VB9Clh2obBXl2VPPSJLPnZmcZJXTpbn3P4eLpIWNtxB1MgaiWSIWchGZ1zYeonr5N
         UbrVePpk+HIYEFEwBeYS+QygZhlPtqZAripklWu1uno7yGWvdOvH1D4hZHfEhQzZQ4VG
         xhR00Ok8b+sSDfx3aTRkBiMCLVQ0ywekihEGgwZjfd3l38wAkpLTd1gX3rVUPeAvYG7l
         TUois0SSLRMANuuoSf6jK1XkDFa4nSSbDYdEvw6igs+bQqq1B/1agNfozoxhgOqsOwND
         pSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783994277; x=1784599077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9nvPpuACviZ5FLIt1UswJ9sGYlO0hmf0Ng5zekU/zo=;
        b=HRy1TCUKMe3/wM2R2L+otjRp+q+pxdt764aGot8T1rr8v9Pe9BUWaMc5n8by+KgViH
         BYyqYUju/y6u/SMs8b/Wg86N4HPpFw2NTH+bw9SftE2i82OE36GiN/PK8ib4j1jJpt/Y
         zmerzW+Ob8xXaW1PSDwAagNRiUBfc8g2SgZGNLaxVf0owTD3dEzRMaNNYFpXucTxTzT1
         26Z3D9tytJAIoqx7JPZI9R5kt7DEhj4O276yhXnM56FMmo1VZqE5XI3ATwNbsUuP1hoj
         2P0+HUqPtvhKWk2vssOnNZSzuA/C1ZN99TXspF83exDP7vF1gtJyEw+gA4pKD6j9VV+A
         +AVg==
X-Forwarded-Encrypted: i=1; AHgh+RqrqrUFrxy4WwU7jP0K2hHM38CGHXUdaPgv7ASbDPIicXGME9FofjP+xIXptdNqRPCFh5XA2zJU+FnJh+k/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1PcPVATvXlZ8wFHXIKre89QtM6nSMC4CV6flOoMgVTlKvBpLF
	zzjfOuCQ/X2yTsZDM+5aw8RJnaLbTuVwiMNzwGNHImtxj1u4g3x+TjVQfXOJRXQ2znGUQZy0Txv
	Sa1ky3MyQJZRfSyp9C4ZT4N3zq6cmNdhkGeA/+ZuEQre9Hmc5w8FNqAAqHrx81jOUxc8nfqQyxx
	prLaQ=
X-Gm-Gg: AfdE7cnJ5x+g28AzE1gdENrNh+yhasHMDg+2FHQO6mrqlsHG8mLsPhd5rkzwn7pJmF2
	Jk1p5Rc4mAb0V2tn9voKUnd8VZcZN9AfydAc05T0caJ/Xyea0MaB0pN2a99D2EISRYi4NrDWwdC
	T4EAH+TueP7Vi+fWkUZfCLJ9/vhSB9ZFcCMBM9tpqs8nOHOyxzAWe8dH978o+LFKOah66XGi+U1
	9G42Lie+oleQchJMhLIG6mgfYd07SECO+k/bpN5NEZVz2DuyUhOpl/CMtw6B2QKfp2uTIcJR6a5
	LLeFel+IVfF0gwVTCsR7z1y+uyfmsn6TOyLUfs/5y4+F4A9TkmMdm9AolmeFySucZ0b3VjcR5TO
	TRxF4/k9X82gAgoTvuYJkErnV7tZ1L50RVk8UI77V82rYxQ5bHdw03H3GioWf0RvptQDV300bAg
	==
X-Received: by 2002:a05:6a00:21d2:b0:845:4126:222b with SMTP id d2e1a72fcca58-84a55750083mr494224b3a.28.1783994276304;
        Mon, 13 Jul 2026 18:57:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:21d2:b0:845:4126:222b with SMTP id d2e1a72fcca58-84a55750083mr494191b3a.28.1783994275664;
        Mon, 13 Jul 2026 18:57:55 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f29ed3dsm634191b3a.27.2026.07.13.18.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 18:57:55 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:57:26 +0800
Subject: [PATCH 2/2] arm64: dts: qcom: shikra: Add coresight nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-add-coresight-nodes-for-shikra-v1-2-b1cf85962455@oss.qualcomm.com>
References: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
In-Reply-To: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783994260; l=27951;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=yjgqlv3QNTHFAGoM9H54PKvSKonzDssY7W96XG/oOiA=;
 b=t5I1Mpk3TXLXVpb4m0JDPw2T/unmUG5UT4VlYEYZ7pItzSY4f7UIoGW3P/sHn4Oswo/EBKVfe
 mhpFvE2wxEaD3ENXd9K631UkaLx4r1535LfF9edma9d7c7uZx9yceGj
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDAxNyBTYWx0ZWRfX5eYxDx89UZ8x
 nxQ97HITNpeEi+jhHOpPdhoa0ljAUbnoS4D3DM+gfxpu4GCb6wFXhzleB9xWlYd0LKA0iTmypAf
 3oJb0/K0q3ftvlyVDCzgR9nkqVec0dY=
X-Authority-Analysis: v=2.4 cv=N4UZ0W9B c=1 sm=1 tr=0 ts=6a5597a5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=cwPG6XMBaqf5cbKo9vYA:9 a=6PrL1bzTSInMHGBt:21
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Pu396qBH2onlX88nmOTAi0yHn8RSVyZ4
X-Proofpoint-ORIG-GUID: Pu396qBH2onlX88nmOTAi0yHn8RSVyZ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDAxNyBTYWx0ZWRfX5cfB29sLgZQc
 nsx0UvlRdQiX/JNpR2vyUjFEuBIKjZ1wWE34mQd01GDYvekPoRdHoPLPdJly6wYVCQNCh3DyfE+
 6rwOSnZU3EgC7GnIKLjtieRjbAnpD0OIRZRZFmMWgulQ+XYPPsmqAX7zSHCuc+hsP6nXyHYslCC
 NQfQJX7xvaCeYjMcRxU2rKDMB0xZeX3v2FOHTzPPSseegBaJ1jO4Kk4U7p7zAoPWPYHRm2cR4Ea
 IS2fz+VBN556JRCHOskAVTIj6ezlBeleiIk46DF8CWMjgzuyk0ch84kqyGwChFuAWHzWQ+T6oPI
 tDXhjbVfonOHHU6T4598IbcMyVrCzAaMlxhxHOmQfv8D02EN1vQKAsSMHs8/3Mg15Hru5iPaOgo
 xLGfa2+JEH344dhZAc6/VXpheLVmMbchaa5y7YGR76Z5lHpbh/pHcqFd3XwWHXMtqK2h2Il3630
 lS1+dk2jx4RIbitYtkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140017
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118899-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:jie.gan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00EF8750383

Add DT nodes for the CoreSight debug and trace subsystem on Qualcomm
Shikra SoC.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 1298 ++++++++++++++++++++++++++++++++++
 1 file changed, 1298 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8e..84c906be16a9 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -113,6 +113,19 @@ l3: l3-cache {
 		};
 	};
 
+	dummy-eud {
+		compatible = "arm,coresight-dummy-sink";
+		label = "eud";
+
+		in-ports {
+			port {
+				eud_in: endpoint {
+					remote-endpoint = <&replicator_eud_out1>;
+				};
+			};
+		};
+	};
+
 	firmware {
 		scm {
 			compatible = "qcom,scm-shikra", "qcom,scm";
@@ -131,6 +144,21 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
+	modem-etm0 {
+		compatible = "arm,coresight-dummy-source";
+
+		label = "modem_etm0";
+		arm,static-trace-id = <36>;
+
+		out-ports {
+			port {
+				modem_etm0_out: endpoint {
+					remote-endpoint = <&funnel_in1_in4>;
+				};
+			};
+		};
+	};
+
 	pmu-a55 {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
@@ -640,6 +668,1261 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		ctcu@8001000 {
+			compatible = "qcom,shikra-ctcu", "qcom,sa8775p-ctcu";
+			reg = <0x0 0x08001000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb";
+
+			in-ports {
+				port {
+					ctcu_in0: endpoint {
+						remote-endpoint = <&etr0_out>;
+					};
+				};
+			};
+		};
+
+		stm@8002000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0x0 0x08002000 0x0 0x1000>,
+			      <0x0 0x0e280000 0x0 0x180000>;
+			reg-names = "stm-base",
+				    "stm-stimulus-base";
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					stm_out: endpoint {
+						remote-endpoint = <&funnel_in0_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@8003000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08003000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_dcc";
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_dcc_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in0>;
+					};
+				};
+			};
+		};
+
+		tpda@8004000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x08004000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					tpda_qdss_in0: endpoint {
+						remote-endpoint = <&tpdm_dcc_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_qdss_in1: endpoint {
+						remote-endpoint = <&tpdm_spdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_qdss_out: endpoint {
+						remote-endpoint = <&funnel_in0_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@800f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x0800f000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_spdm";
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_spdm_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@8041000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x08041000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@5 {
+					reg = <5>;
+
+					funnel_in0_in5: endpoint {
+						remote-endpoint = <&snoc_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					funnel_in0_in6: endpoint {
+						remote-endpoint = <&tpda_qdss_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel_in0_in7: endpoint {
+						remote-endpoint = <&stm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_in0_out: endpoint {
+						remote-endpoint = <&funnel_merg_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@8042000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x08042000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					funnel_in1_in1: endpoint {
+						remote-endpoint = <&tpda_aodbg_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					funnel_in1_in4: endpoint {
+						remote-endpoint = <&modem_etm0_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					funnel_in1_in6: endpoint {
+						remote-endpoint = <&funnel_cpuss1_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel_in1_in7: endpoint {
+						remote-endpoint = <&funnel_center_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_in1_out: endpoint {
+						remote-endpoint = <&funnel_merg_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@8045000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x08045000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					funnel_merg_in0: endpoint {
+						remote-endpoint = <&funnel_in0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					funnel_merg_in1: endpoint {
+						remote-endpoint = <&funnel_in1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_merg_out: endpoint {
+						remote-endpoint = <&tmc_etf_in>;
+					};
+				};
+			};
+		};
+
+		replicator@8046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x08046000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					replicator_qdss_in: endpoint {
+						remote-endpoint = <&tmc_etf_out>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					replicator_qdss_out0: endpoint {
+						remote-endpoint = <&etr0_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					replicator_qdss_out1: endpoint {
+						remote-endpoint = <&replicator_eud_in>;
+					};
+				};
+			};
+		};
+
+		tmc@8047000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x08047000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tmc_etf_in: endpoint {
+						remote-endpoint = <&funnel_merg_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tmc_etf_out: endpoint {
+						remote-endpoint = <&replicator_qdss_in>;
+					};
+				};
+			};
+		};
+
+		tmc@8048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x08048000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			iommus = <&apps_smmu 0x0160 0x0>;
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					etr0_in: endpoint {
+						remote-endpoint = <&replicator_qdss_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr0_out: endpoint {
+						remote-endpoint = <&ctcu_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@804a000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x0804a000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					replicator_eud_in: endpoint {
+						remote-endpoint = <&replicator_qdss_out1>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					replicator_eud_out1: endpoint {
+						remote-endpoint = <&eud_in>;
+					};
+				};
+			};
+		};
+
+		tpdm@8800000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08800000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_cdsp";
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <4>;
+
+			out-ports {
+				port {
+					tpdm_cdsp_out: endpoint {
+						remote-endpoint = <&funnel_cdsp_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@8801000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x08801000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_cdsp_in0: endpoint {
+						remote-endpoint = <&tpdm_cdsp_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_cdsp_out0: endpoint {
+						remote-endpoint = <&tpda_center_in3>;
+					};
+				};
+			};
+		};
+
+		cti@8807000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08807000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_turing_q6";
+		};
+
+		cti@8833000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08833000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_mss_q6";
+		};
+
+		tpdm@8840000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08840000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_vsense";
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_vsense_out: endpoint {
+						remote-endpoint = <&tpda_center_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@8844000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08844000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_dlct_1";
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_dlct_1_out: endpoint {
+						remote-endpoint = <&tpda_center_in13>;
+					};
+				};
+			};
+		};
+
+		tpda@8845000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x08845000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					tpda_center_in0: endpoint {
+						remote-endpoint = <&funnel_mcu_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					tpda_center_in2: endpoint {
+						remote-endpoint = <&tpdm_dlct_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					tpda_center_in3: endpoint {
+						remote-endpoint = <&funnel_cdsp_out0>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					tpda_center_in4: endpoint {
+						remote-endpoint = <&funnel_ddr_out0>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					tpda_center_in6: endpoint {
+						remote-endpoint = <&tpdm_vsense_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					tpda_center_in7: endpoint {
+						remote-endpoint = <&tpdm_prng_out>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+
+					tpda_center_in8: endpoint {
+						remote-endpoint = <&tpdm_west_out>;
+					};
+				};
+
+				port@9 {
+					reg = <9>;
+
+					tpda_center_in9: endpoint {
+						remote-endpoint = <&tpdm_qm_out>;
+					};
+				};
+
+				port@a {
+					reg = <0xa>;
+
+					tpda_center_in10: endpoint {
+						remote-endpoint = <&tpdm_pimem_out>;
+					};
+				};
+
+				port@d {
+					reg = <0xd>;
+
+					tpda_center_in13: endpoint {
+						remote-endpoint = <&tpdm_dlct_1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_center_out: endpoint {
+						remote-endpoint = <&funnel_center_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@8846000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x08846000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_center_in0: endpoint {
+						remote-endpoint = <&tpda_center_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_center_out: endpoint {
+						remote-endpoint = <&funnel_in1_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@884c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x0884c000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_prng";
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_prng_out: endpoint {
+						remote-endpoint = <&tpda_center_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@8850000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08850000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_pimem";
+			qcom,cmb-element-bits = <64>;
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_pimem_out: endpoint {
+						remote-endpoint = <&tpda_center_in10>;
+					};
+				};
+			};
+		};
+
+		tpdm@8980000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08980000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_mcu";
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <16>;
+
+			out-ports {
+				port {
+					tpdm_mcu_out: endpoint {
+						remote-endpoint = <&funnel_mcu_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@8982000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x08982000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_mcu_in0: endpoint {
+						remote-endpoint = <&tpdm_mcu_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_mcu_out: endpoint {
+						remote-endpoint = <&tpda_center_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@89d0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x089d0000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_qm";
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_qm_out: endpoint {
+						remote-endpoint = <&tpda_center_in9>;
+					};
+				};
+			};
+		};
+
+		tpdm@8a01000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08a01000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_mapss";
+			qcom,cmb-element-bits = <32>;
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <16>;
+
+			out-ports {
+				port {
+					tpdm_mapss_out: endpoint {
+						remote-endpoint = <&tpda_aodbg_in>;
+					};
+				};
+			};
+		};
+
+		cti@8a02000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08a02000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_mapss";
+		};
+
+		tpda@8a04000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x08a04000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tpda_aodbg_in: endpoint {
+						remote-endpoint = <&tpdm_mapss_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_aodbg_out: endpoint {
+						remote-endpoint = <&funnel_in1_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@8a58000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08a58000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_west";
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <16>;
+
+			out-ports {
+				port {
+					tpdm_west_out: endpoint {
+						remote-endpoint = <&tpda_center_in8>;
+					};
+				};
+			};
+		};
+
+		cti@8b30000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08b30000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_cortex_m3";
+		};
+
+		tpdm@8b58000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08b58000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_dlct";
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <16>;
+
+			out-ports {
+				port {
+					tpdm_dlct_out: endpoint {
+						remote-endpoint = <&tpda_center_in2>;
+					};
+				};
+			};
+		};
+
+		cti@8b59000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08b59000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_dlct_0";
+		};
+
+		cti@8b5a000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08b5a000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_dlct_1";
+		};
+
+		cti@8b5b000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08b5b000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_dlct_2";
+		};
+
+		cti@8b5c000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08b5c000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_dlct_3";
+		};
+
+		tpdm@8b60000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08b60000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_ddr";
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <1>;
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_ddr_out: endpoint {
+						remote-endpoint = <&funnel_ddr_in0>;
+					};
+				};
+			};
+		};
+
+		cti@8b62000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08b62000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_ddr_dl_0";
+		};
+
+		funnel@8b65000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x08b65000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					funnel_ddr_in0: endpoint {
+						remote-endpoint = <&tpdm_ddr_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_ddr_out0: endpoint {
+						remote-endpoint = <&tpda_center_in4>;
+					};
+				};
+			};
+		};
+
+		cti@8b70000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08b70000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_ddr_dl_0_1";
+		};
+
+		cti@8b71000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08b71000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_ddr_dl_1_1";
+		};
+
+		cti@9020000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x09020000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_apss_pe0";
+		};
+
+		etm@9040000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+			reg = <0x0 0x09040000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu0>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm0_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in0>;
+					};
+				};
+			};
+		};
+
+		cti@90e0000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x090e0000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_apss_cluster";
+		};
+
+		cti@9120000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x09120000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_apss_pe1";
+		};
+
+		etm@9140000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+			reg = <0x0 0x09140000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu1>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm1_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in1>;
+					};
+				};
+			};
+		};
+
+		cti@9220000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x09220000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_apss_pe2";
+		};
+
+		etm@9240000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+			reg = <0x0 0x09240000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu2>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm2_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in2>;
+					};
+				};
+			};
+		};
+
+		cti@9320000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x09320000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_apss_pe3";
+		};
+
+		etm@9340000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+			reg = <0x0 0x09340000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu3>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm3_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in3>;
+					};
+				};
+			};
+		};
+
+		funnel@9800000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x09800000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					funnel_cpuss0_in0: endpoint {
+						remote-endpoint = <&etm0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					funnel_cpuss0_in1: endpoint {
+						remote-endpoint = <&etm1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					funnel_cpuss0_in2: endpoint {
+						remote-endpoint = <&etm2_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					funnel_cpuss0_in3: endpoint {
+						remote-endpoint = <&etm3_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_cpuss0_out: endpoint {
+						remote-endpoint = <&funnel_cpuss1_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@9810000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x09810000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					funnel_cpuss1_in0: endpoint {
+						remote-endpoint = <&funnel_cpuss0_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					funnel_cpuss1_in3: endpoint {
+						remote-endpoint = <&tpda_apss_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_cpuss1_out: endpoint {
+						remote-endpoint = <&funnel_in1_in6>;
+					};
+				};
+			};
+		};
+
+		cti@982b000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x0982b000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_riscv";
+		};
+
+		tpdm@9860000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x09860000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_actpm";
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <1>;
+
+			out-ports {
+				port {
+					tpdm_actpm_out: endpoint {
+						remote-endpoint = <&tpda_apss_in2>;
+					};
+				};
+			};
+		};
+
+		tpdm@9861000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x09861000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_hwe";
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_hwe_out: endpoint {
+						remote-endpoint = <&tpda_apss_in3>;
+					};
+				};
+			};
+		};
+
+		tpda@9863000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x09863000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					tpda_apss_in0: endpoint {
+						remote-endpoint = <&tpdm_llm_silver_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					tpda_apss_in2: endpoint {
+						remote-endpoint = <&tpdm_actpm_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					tpda_apss_in3: endpoint {
+						remote-endpoint = <&tpdm_hwe_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_apss_out: endpoint {
+						remote-endpoint = <&funnel_cpuss1_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@98a0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x098a0000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_llm_silver";
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <12>;
+
+			out-ports {
+				port {
+					tpdm_llm_silver_out: endpoint {
+						remote-endpoint = <&tpda_apss_in0>;
+					};
+				};
+			};
+		};
+
+		cti@98e0000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x098e0000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_apss_0";
+		};
+
+		cti@98f0000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x098f0000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_apss_1";
+		};
+
+		cti@9900000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x09900000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_apss_2";
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;
@@ -831,6 +2114,21 @@ frame@f42d000 {
 		};
 	};
 
+	snoc {
+		compatible = "arm,coresight-dummy-source";
+		arm,static-trace-id = <18>;
+
+		label = "snoc";
+
+		out-ports {
+			port {
+				snoc_out: endpoint {
+					remote-endpoint = <&funnel_in0_in5>;
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 

-- 
2.34.1


