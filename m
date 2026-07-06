Return-Path: <linux-arm-msm+bounces-116892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Km7dCubYS2pybQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:33:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9442E713555
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:33:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V8nkltYd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xwekt50p;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116892-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116892-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B485432B25D1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1003E41611A;
	Mon,  6 Jul 2026 14:14:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F74540A93B
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:14:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347259; cv=none; b=NYa7RX1zcAOj51je5Rs506YbmYLFzr9Lm+bdJFy5G+x+7EZKkIK7DNRs3ejI6TwnKeA7R7cOQIScqC5mJZ0UKtA/0gYWP7mA8EcCg1wyYS1NmgFi1IY7Dz6dKM8gHc4k0EDS7VR886d/rztAnE3nPOT8l48Vu2A4SbsjiT1y8Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347259; c=relaxed/simple;
	bh=7vQ0uKqrSlO2ZlaH3b9H/oONVwn/rPEPYu8psEecOtk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gD2mrlMw2rV0KifjUF6r9go5CGMvqOL3kEHj0o0r79iuz4+TXEnxwfxs07DmsMwKbEWw3pOa4NgiNAjU5CE+D9/Mkmb2iLtgk1WzyNv/msGw2TfV2f+qVwpc6bhtRMNzBs79h7oc2Ftv7ZYw98vKVyTirDSOZ5w74hO1Za1o0Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8nkltYd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xwekt50p; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EE438837668
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 14:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k/DdBXFWYVR
	feak4AuuwTZRxi77GMBHL1kC7LE0w84s=; b=V8nkltYdf7oTERsCPUwMDfxA99k
	UG5HtzRqQAh6KQcY1jCoyXResjn1ooDBoH/I9CjqdWMzEwkuqa6TIm6yyli/ho5k
	ZnkFBQF+xyHbiJtnS+c+yKMBJlS/CnQBCH12EyIInVGtV3vGapziqKvqE4BoRCbp
	gkhyxk0GS4vDrwFww/shdCmK5K+HYuklYF9vsKIww0eRhm8T+uqnU31d/c6TCR0q
	6smL0u1OUIAYF+Ilijti7shr6gQWLco70XihfnPmhCCzh/zi6xba9FVoJfiVG9uq
	sUNRgrR16peM2azKlKc6HfPGt5X8Z5OXZbmKpqYhjMnD7IcD5n2Ja8tmrPg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qph5a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:14:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fc66ee6a4so5860594a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783347257; x=1783952057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/DdBXFWYVRfeak4AuuwTZRxi77GMBHL1kC7LE0w84s=;
        b=Xwekt50pW1MClLr05q2TwaG7Pv8k9C1Xn9zMzwQN4Msg/p0SK5lQhrp+ruxQSj0456
         Ia1RHNLV3NYkeWrpS3BWbANTfkmv0JJdF8VRTM1dzrMC83XrApJBuxelFh0QUFw9wsiA
         rOJ1/BQUTx491SW8UNPheAxGJvcuhZReQ6rUsO79nuDet63Zx7f60fqH7up1zo7tuhZW
         q+gcQSpF79azb2zt2JN9YgsBlCfqlfcZw9EVmCTSXLwfa2+fWEjxO3CzF35TY4Woax1M
         OGaWlXK8y0doQ4k7LkGX6Jc1bKkFx9VS6dRk5u3kbgSggQPg/MTrEAJNg3O5TYvcEOAZ
         5Wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347257; x=1783952057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k/DdBXFWYVRfeak4AuuwTZRxi77GMBHL1kC7LE0w84s=;
        b=ksxnMXrTJG8tLXe60Z7ep6kRVn0gQXZojfAxupFn2xQX9owZ0OsAuPakuiMJTmGns8
         qzgc47DELYhUiZkgBFRmtTL5SLfvTVn+hWaAuwaq9n9cNz2goB/7Xa9jywMW1GXQslfV
         DkpL+RrW+zd6pcG5WX4O8N3UDlv3M8pcA3/sIP3burqm13YnxXg65vbBV71Hw8GL8DAw
         FYtobF87V1h1zE2URrqxT0awyehZtKzRemOOd58ugbfmqlsyURVtP6ILqTN/MhbBsRvJ
         Uqgm4vtzq7fCa66cfm6QJI6/CsZ8g/Wuytw5Zbn3+nJCFklLRS9A9g63vwzCw8S11PtX
         DiOw==
X-Forwarded-Encrypted: i=1; AHgh+RrnhJR0jbz6etYCq6Nu0pMAMU5RBLfL5uujn9CiB8sxkJBCmert9kEVPSMHj0QCscMTEBZ5pcC+1MUTA9CP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp/Qc2z98G3hkGQJAp4trjG9segQPAEHOty85rv6+TE4kQeLVx
	nmcZB/l9EBPHEHztAeEjnK1w+aZOZPDYvXyQrllKSLBgIoTjFAp4XKZRlL5MfChYwge3GB0uHOP
	wkC+n6EETQECgE/b51fhqfxQASWK8A1529aQNmi/dA36jHRV8LU+LTR8p8L7Dc4jqa5Y6yD75V4
	WO
X-Gm-Gg: AfdE7cnNuIw+6M04Xc6lfdbDGwTWkUq7leQg/IU48aww3c377yZJzxcj+TG8D9S5NXF
	uRwTC6BFMyfeyAXKC06vIOiIqk0IY/dbivsljhpHlaE+3xDfA7Jx8Md/RxyKhlX+fJSOst3Uofq
	74oCi8RRcyryCTV9DMuVmYvIpus3K2PzlWGKGXAK9QNn3D+9iWcM+TDf85JJZ78+84/K8I1/212
	l9Z//VqEyF3nRVEv0rvmUG+PMz9ImvNzaH5laUWCq97am7dVrEsyCkInjTdZDYqHolC/yCrwfYD
	vncPjfP+ao48+TWvW3WJyd39AGzvPUo3HDA1aU3cdBScMcN8XejsgSXy8oWLYQ9PVzt8I7s2UPJ
	xQuLd4zrcUD3ed2Fglc53dvkIT9eZ2LB+VOBaoA==
X-Received: by 2002:a17:90b:4ec5:b0:37f:d70a:9605 with SMTP id 98e67ed59e1d1-387568fe4aamr589567a91.9.1783347256543;
        Mon, 06 Jul 2026 07:14:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4ec5:b0:37f:d70a:9605 with SMTP id 98e67ed59e1d1-387568fe4aamr589507a91.9.1783347256069;
        Mon, 06 Jul 2026 07:14:16 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127ae5b06sm5118416a91.3.2026.07.06.07.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:14:15 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH V3 3/4] arm64: dts: qcom: Add SD Card support for Glymur SoC
Date: Mon,  6 Jul 2026 19:43:45 +0530
Message-Id: <20260706141346.4180348-4-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bb839 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=9wC1NwHXjCwt_iaUHW8A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: qob0i-ximk4RO0s0rXgDmas6mUM4MBsH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfXwjLSWhYdIcsM
 1CcJDtWn8Ua5nLyFuIQ9ijYojw/kHhtts3/ksXZ8lwqPL2qc2HxluYBdkOGO4dJA5GN94i1Tli9
 lnpDfsvkRAN4JmsIrTgLUfZojPrlF2i6wh+q4ccxzzVo79ZWMPPLubN81VIjvJQQKuawbS9/PiF
 7pt1BdsDq0kujU3z9S5DSTZUW9XwRrc2wFB2HO6ayU+ksYJPlE3J+x4nHUjDRz6rXfWTjr05E1g
 0r3YhR46BB/NIvTniwUtSHqna0WP4q567WQL/fqH325gkv7bZJub2bKTxavRUEQ9sxADJVHQgbt
 Hnd9ZiEnGAFB3C3ZuopklpZvikpHVqjsq7gIQepoVfPLHrCIwHIhrQVGmDDaVFgrklIf2UxhZdd
 nOP9+Mh74m8SQ9HIhBHEgSrJo9gCw4g6hsF4qE1eX3KYF68/bnPm1Dsr+AivfdQHNr8NyAsQnH5
 sULTbxWJgGpdiQzwHVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX4QEBFPwbJT0k
 ZyIEPp4ovcGwOcnwI7JNnnsLmMH/EujjgnyF7b8tGTRYA4whHFR1UWwr0YlsIT2QucSQDwA0kkN
 EvOcaEMf3k5t6U/M2bPFA1rXfmNHhOg=
X-Proofpoint-GUID: qob0i-ximk4RO0s0rXgDmas6mUM4MBsH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-116892-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:sachin.rathore@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9442E713555

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Add support for SD card on Glymur SoC and enable the required pinctrl
configurations.

Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 91 ++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e1c9cfee1ddb..ad70c9670008 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4149,6 +4149,58 @@ lpass_ag_noc: interconnect@7e40000 {
 			#interconnect-cells = <2>;
 		};
 
+		sdhc_2: mmc@8804000 {
+			compatible = "qcom,glymur-sdhci", "qcom,sdhci-msm-v5";
+
+			reg = <0x0 0x08804000 0x0 0x1000>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			iommus = <&apps_smmu 0xd00 0x0>;
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			interconnects = <&aggre3_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			bus-width = <4>;
+			dma-coherent;
+
+			resets = <&gcc GCC_SDCC2_BCR>;
+
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		usb_2_hsphy: phy@88e0000  {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";
@@ -5936,6 +5988,45 @@ rx-pins {
 					bias-disable;
 				};
 			};
+			sdc2_default_state: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_sleep_state: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
 		};
 
 		stm: stm@10002000 {
-- 
2.34.1


