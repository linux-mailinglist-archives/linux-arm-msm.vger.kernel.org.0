Return-Path: <linux-arm-msm+bounces-105932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN1NDvDJ+WmFEAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:44:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5834CBB3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C6DCE3024009
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 10:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78AFD402BA7;
	Tue,  5 May 2026 10:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JaP8PCJk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jQ5+Ilw6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F262F401A35
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 10:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976625; cv=none; b=c2TvGL6uqX505Qe+q6idcl8bgtkLwMJI08HCX4NQCziJUR7Ol0sSbyZXjadSar5BNYRYK66avFh2BUO4Jr80y1a4xh5Pj0J7xy7tRJusZJwFQQpCrIajHEKruxBNyRlTYCp3K8aHAmWejarlWgmlNRLn7GAY5GcmrJEXBKqvxXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976625; c=relaxed/simple;
	bh=Ua0zHZvTYxgJeKurVOMitZ4An0khWIUfUsSSIgPAcf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dANMNJhbdW4nyv/RbcZ//M4L3veZsSU/9vYG8mTA4yZXGb3zPj01xlCFfUoCKN/8V3D9KZ11k2Cbz0GBWvNflz1wWlGhztTtevGjF0CpFHK6u7vV3UOEUYiB5PK6+SrM1kdRPgk7ORvLKjMuM8suGxfk4FuXcsmaTYd0MWw46ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JaP8PCJk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQ5+Ilw6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6459Va2M2859438
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 10:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Yp2wQ0vAoaf
	Lcjx/jnVKsTWIoUwH6nSDD3/qLWpglqk=; b=JaP8PCJkTqKGkXA3nwZdGxUfbXa
	K4L583hmpZwhUvuqWJ3b1MIbD4ojJC4JSA/ruGOj34cijd+DX6B0kz4sCgbQ8tmX
	JOIWgy5b6Qe6Ojn7oJw6N5PsXT/4MqXTRgW3LOic1zc5zn8TMNcjsbesD1xq/SiU
	pqwayG2DVMRaSIbj4ZU+I2EVJ4PQ2DugOJSdQiDROl3mNr2+jF3aEMl3hTxxWVhb
	HNWaIbYdkOSPpN8geLK4Ii9bH+TYDjzVOCeHx2u7pM9pTYF7sNHbYfuUHKAA6eyc
	KsLhVvI2GOXSFbMEBhtEvUj7mFlgyZ/Y+s+B+jDQ3n8E3hE8htBBTMi+ghw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dye0ag7b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 10:23:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3650a4eb60dso3571063a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 03:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976621; x=1778581421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yp2wQ0vAoafLcjx/jnVKsTWIoUwH6nSDD3/qLWpglqk=;
        b=jQ5+Ilw6e57coQq93E6DumebR6RlH3Yl3aIYTDyOWSw7wfmTdVzouuDqNf85AzYUOE
         FwwQbHtIHWsUVdVjvnfprahmrgBZOgZdC6pg1FrFv/9fwW56XSao/aZnJIhGyvYksEzN
         mA4cmr28o4gSIn88blIu8pKwPGW95TN4wR+l77bxY+EKKIqqkqHpg3PmyOBGbw2SKBF0
         OxFf8X5rCdo8YCYO9F6TSfNAcyewtt+aq+1szcL/VFqKgs73M8i9fUCjhG3FDkDAKWF3
         NdGthwqWLhA85AKzAvs03curS8n5bz36VwhMBUgNFUdqot0EOS6KgbtSkYGRmunuFhbL
         wg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976621; x=1778581421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yp2wQ0vAoafLcjx/jnVKsTWIoUwH6nSDD3/qLWpglqk=;
        b=tAtoLhHOMaUptTtP6JOhUcqfsemfhXEPoUPEXeXlo9e+iUL0ZvlR+tczxZsnfyHUnW
         XXnc1nv8D5gaNHpCAstX/M960tNL2pCY80O41r1Vd15+uBwP7xzk4Z8cx5GFekhemWe+
         MAWbUBkTjKVh+daUwZGyM+x5WStAAGfkvncWK1JotsS9educV/5SdbNPPjU03aRju/OM
         Zq4OT0vTl6QaANRZE/0snThgMO+iGIfhSEO+bKAfRAlmRp/vcwFHxdbDWN/+UNsFT50Q
         5TdUe8N4D3/dAAhAJqaVDWkmupeFq9/DwW/1Divik72H6utjWTAMhCrUtugoMuu/5MmH
         6+Bw==
X-Forwarded-Encrypted: i=1; AFNElJ9c1zReNtbQ8GZm8htitupSP8vHw2Q0sCrBxfE05C9h4cEJk7YzcdiWZOR//tbnuZHgRlLrAYJQifspx2be@vger.kernel.org
X-Gm-Message-State: AOJu0YzeG8YxZFDlTSqwro1GLi1CwGFjdK+nnBv8Jdlo7hcokR6097yt
	zLCMAfjde5Rc2aohbETquyYaONRidpMRx9lfFVO7xdY9M6t3ccOuqNDHBbb8flxW9O4pKndP2I4
	f+o5U5BMfj2nsHIzXHa1AUeELFyDOKMXYjupYPByYDlYkNC5zLHxVQrPS34FVh70YXHdf
X-Gm-Gg: AeBDievKjK9ae7wkvUKshrqZBSEtFgoWYJS3wkPsyjkIExh1ciDY356sM75JGxqwAkf
	fgh3IKr31hdfdTdbuil1LDdZpuMYTiKk9OYpYz5Ow3CzFSLrpf5CHBVbRZrjO7MAyIAhmC8xYHE
	KyHRMUNo5J12pU0M74/D+1k33kjvKT8dCMGkN90j3AcfYOk+5ZnKMuarxxdRh8CbPeS3GCuZHXS
	zAtIUpz0zk7tBnHoWD/2ru2m89IDsSQanZyuTRIV9TgtfPtZZr+rC/sWbzfajeaLdMYHkLSf+i6
	zLWZXICAeDg16RkakCydW0pAjL+18KlEFzDfbMvUXmpPbwcJRS+hDYXzsuLVYFJt6oDgjWtqqhY
	GQw9s54yYdZhGV1iyQgvO00KGsTdC4WK4gFI8HXkEhZ/ekpINCT8Th4IIgr7iBh6BGiymZhJNeQ
	OXbdYLENQSmppqgVbC6zv6O2z/Xn3yt9K1/MrDAH2BjHyfEv0aaJHtOJcCjO9IFA==
X-Received: by 2002:a17:90b:5890:b0:35b:e529:2d60 with SMTP id 98e67ed59e1d1-3650cd95fc6mr13409246a91.8.1777976620897;
        Tue, 05 May 2026 03:23:40 -0700 (PDT)
X-Received: by 2002:a17:90b:5890:b0:35b:e529:2d60 with SMTP id 98e67ed59e1d1-3650cd95fc6mr13409207a91.8.1777976620374;
        Tue, 05 May 2026 03:23:40 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3656ae05d30sm3299333a91.6.2026.05.05.03.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:23:39 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v12 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up q6
Date: Tue,  5 May 2026 15:53:08 +0530
Message-Id: <20260505102310.2925956-5-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfXwlcd2Z24Amb3
 DiAg2UKKV4oWRBJ+ty/pHKHJeM/047E+SR/S/pMoEAH1NrV1/Yo+og09DpS41jCukUOH3uslESR
 mN2SemeHjok2D2GjqfFG6Woe4qK65+YMTFBGjjDxxqCF9fBK3TAIriOZcA820zBTgZ+1yGOi5TP
 FVud9SGt2FomzlyXeS1dRu49aLNX0bPLxNBW3AmKXKgmk4HC6WVH+PzRPLL0NdW5lmzPXo8XYd7
 qNLmIXHMWBtp20jAOpBtVZMUKaaBLQZIxzeTqUmUBALqeKFLTwPH0MuqmdjzgLeCKvmOBXGtB2t
 kl2YnIHRRWHQdau1FxdxMZTfx4+Uzq8eE1E0w7ybxc9pCJRxlJumQYarErZpOx9HxUPPfIIJohW
 PS6eESHzQrkzXzUNCP+sYJUqDaFKl479krd2lR+bBU0piBwnnlHxej9ywB0lZlLaw0X9Pxr9HNh
 s9XJ8sHfrhT0Xl4J2LQ==
X-Authority-Analysis: v=2.4 cv=Wtkb99fv c=1 sm=1 tr=0 ts=69f9c52d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=bkM7E5Y1nIw_8vhdTpAA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 4ZTYoKnhh74WX_Pp6LLAkrXz4fUxtO91
X-Proofpoint-ORIG-GUID: 4ZTYoKnhh74WX_Pp6LLAkrXz4fUxtO91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050097
X-Rspamd-Queue-Id: 1F5834CBB3C
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[outlook.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-105932-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.943];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c15:e001:75::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Spam: Yes

From: George Moussalem <george.moussalem@outlook.com>

Enable nodes required for q6 remoteproc bring up.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Change 'qcom,smem-state-names' order to resolve dt-bindings-check error ]
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v11: R-b Konrad Dybcio
v8: Swap the order of the items in 'qcom,smem-state-names" to resolve dt-bindings-check error
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 64 +++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 6f8004a22a1f..e1f8b5840acd 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -158,6 +158,35 @@ tz_region: tz@4ac00000 {
 			reg = <0x0 0x4ac00000 0x0 0x200000>;
 			no-map;
 		};
+
+		q6_region: wcss@4b000000 {
+			no-map;
+			reg = <0x0 0x4b000000 0x0 0x1b00000>;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -721,6 +750,41 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq5018-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_SLEEP_CLK_SRC>,
+				 <&gcc GCC_SYS_NOC_WCSS_AHB_CLK>;
+			clock-names = "sleep",
+				      "interconnect";
+
+			qcom,smem-states = <&wcss_smp2p_out 1>,
+					   <&wcss_smp2p_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@80000000 {
 			compatible = "qcom,pcie-ipq5018";
 			reg = <0x80000000 0xf1d>,
-- 
2.34.1


