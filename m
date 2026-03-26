Return-Path: <linux-arm-msm+bounces-100024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP83E4S3xGlf2wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:35:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CF51732F17A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61079304D14F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0E435DA53;
	Thu, 26 Mar 2026 04:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4xh37ge";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Va1+6ZMI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC34392C50
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499631; cv=none; b=W7zZ5O+uRWAVE2lF3jmIebS98R71pUmlc1FyukKBu74tVSpxrYAYKW0ZlBUv7v7lzBg4Dzh6GcMGVy696s/4DxxzJ8Dkitv6YR1sHUsDS5snl0SV3Zt50fcsyoWTxXYApr9sQ+aaArMquYbbNVat2wXqYoSPYtJUi9UlXNgHWPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499631; c=relaxed/simple;
	bh=Ua0zHZvTYxgJeKurVOMitZ4An0khWIUfUsSSIgPAcf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kx8u2T7Gx+el+d5dw2iNunp/cuAHMsotcelYz9l3aj2I9caAGiE8JMujsHjglc2QV9c/rC/zJnULXiRjqLGk6f9meegL/5dfb+YJJp/17dwqKmyWiNnv65l7jpPuuLjHuuEqwJhNr9AbLa/l0GHdSQqVGkE5U2KWQZmgtPV0oMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4xh37ge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Va1+6ZMI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKwGxB1175631
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Yp2wQ0vAoaf
	Lcjx/jnVKsTWIoUwH6nSDD3/qLWpglqk=; b=I4xh37gelGQVBSGA/2FZIUM/zWB
	rwC/UI0m5WcsqNsz5enka/nSmfdJxOWSbQdcmWujN6BtSAHhI7Ney6lvaa8SnmQl
	uW06596q2e3RTZL4+M5xZ7u7Y+bpOnG+joG/LoSOqU91+c+DjCVghkDCTmrb9eis
	sE1DC+zOce6POcbJsLZReVaVlsyQuHvbTm+O0mEMPlTolL0YPTexdYeFrjhhKLhK
	7+PukJQbvKbwoT55B648c7R0YKyooDhc8dKMqnkIPCwpsMJM4KLWEzm+YZlXElub
	dGAK77BDybiU1GdQ8E+FoB1qCUFHykjsboj6d8h6gl8HnBLyiOSIg4pumaA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q76s5f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:33:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0601ff3d9so8876965ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 21:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774499629; x=1775104429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yp2wQ0vAoafLcjx/jnVKsTWIoUwH6nSDD3/qLWpglqk=;
        b=Va1+6ZMIcoqZwkXmjmppvsCL8VKC6C0xAPNwgM5/euu0z7MDAvT+PXXKateghAgtI5
         iMCk2lGw4L5yAagk43k9TngCH13nzeYPuE97cZbJwG9b049pviT8RwzHM6mYSS7skiUV
         WvN2PPSchz1ur1kHVDf28Me5p5vD+rD9+ndHvtRftlk9MFYFkNGIaE0lRJgmVSfXATbY
         BF9JqahRsAal1e6LQK0KodL0KQU0gWpux5wVCn4ybXpUEHHS4Hpj2OFLvx4L47MhI8BA
         KSZ42QYkgQJeRujMYQwzCtNZsQi8kgn4/Q4bfrAZw58hmKH5DUv6GUOyDaHj33k34BTN
         SGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499629; x=1775104429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yp2wQ0vAoafLcjx/jnVKsTWIoUwH6nSDD3/qLWpglqk=;
        b=bsUcpWjc/q+/DmmJp3qbh7opwNBzqrocQTXb9dAmK1v658e7+/y4XuVACDwo9SC/sR
         Ix8ZfabRMP7Y6lZKyIC51iM0enTJXdKfK7h1vwTPwhBHj95+KSaCjYJaDlJY6OYdXtKK
         DIEajpGasqtPK14xPNfXUhdGFruUuVSvKIKZ3eM+rTRACkVktZbbnOwGR2fIMY1kmjHs
         WGdeAz9LmDCaKwDuPX5oRrKF2T/8xa13jyismrr92lSprllNzCAh+ul3LjCOAYakKZ8U
         x0Y42LBWruoxE5XK46i8QsClL00mXJhL3yshfKCNKD16GlOAsy+RnUdKxmfGx3ZRQuLT
         j4fw==
X-Forwarded-Encrypted: i=1; AJvYcCU+KvHWM3cVphDnzI/EamS8VptHg3T7mImFC9evNYwMFhvyib0P5PDS5TMAFfHT3Vmh39CUh9PlcvpyOrHp@vger.kernel.org
X-Gm-Message-State: AOJu0YxTiA9yKS6lbjk6hXU0ncXi9yV9K9Pk/HnsRBMjVoCas5+1YHdY
	xHCvRv2HNzGlap+zjO56MAxp0vT6CRF/uFYpcb30mOrQKd4p75l4mnJ6DryREC2v3hyKVDCTLHO
	EXxXkD/ZRT4oOAuCU/xHlDWWXw+6Zz4/95x3wb4KxWtHPz1J84+vOKQbHpN4zphtDUDug
X-Gm-Gg: ATEYQzzbqwIeoooenIzEdQ7wN1tSAcGTqwowEBN4h83YfulBd1NYBtHcsWab8bfDF35
	XU0Wa2z8qUktpyiqhr0QNCo9Qo52mLi+7CFYUb8DvTJURzwNzZq+/TR6rJjODfkduYS+ecCW6y5
	d2e3J0IZJlWssjQKf4+yrxYLpGMtNwhQXXFAbpiWDkeEVW7NWiePnWcf5YFw8TDUaL1RYZn1nmh
	XAI2dwONvUP96oMqukf5TUwmgIDtHPok2nLFzyLacyCciakXuMbUYr2grgtKkiRpWmTElJgsBnr
	eqDnmbujmDDivdB4ECEsH9UGLk4qPcsIHWvV4Fa3rt0g1KxnExwGUkCAC2K/YPdSRhKoNQf1sD2
	BZH+vxdSudfAVUZeBQBKTrE6TQGpx26NDKSUvRnbNEgfLCkGM3jlOz5LkXCzZ3WLXb25CjtZnDL
	MT31lg0RZll9VCNqXnjaZcFThZP8stqIPqZO/ftjNr/MHKrq1xPok=
X-Received: by 2002:a17:903:41c5:b0:2b0:c0a8:5000 with SMTP id d9443c01a7336-2b0c0a85571mr14369515ad.14.1774499629258;
        Wed, 25 Mar 2026 21:33:49 -0700 (PDT)
X-Received: by 2002:a17:903:41c5:b0:2b0:c0a8:5000 with SMTP id d9443c01a7336-2b0c0a85571mr14369225ad.14.1774499628751;
        Wed, 25 Mar 2026 21:33:48 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7b233fsm15163715ad.32.2026.03.25.21.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:33:48 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v11 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up q6
Date: Thu, 26 Mar 2026 10:03:18 +0530
Message-Id: <20260326043320.2507890-5-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NOPYOk6g c=1 sm=1 tr=0 ts=69c4b72d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=bkM7E5Y1nIw_8vhdTpAA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: _WOxKLdKJt4PBEfBtdVWyLIq8LaNwD0H
X-Proofpoint-GUID: _WOxKLdKJt4PBEfBtdVWyLIq8LaNwD0H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMiBTYWx0ZWRfX09zTxPXnmN4t
 pL11wvxGvQUrWdNiZ45GvERDQOtkhVDQ0YkUYe54LO9uSyUdIwKKhaXnnHSU4yi4qMAPaf/S+PK
 2rEUR0xA8TwLCniIhN4/AHknFvOeTPtDXRTesH9y6MQzpr4dhqsSdqZMB5dwFfXRmoHRaWw0H18
 ug5joqWLN2TALhaAcFd3wFxf4yolrgTIC7XEOcd89ds0Ga8JiwHoq+kmsxmMW7f35/Vt6AqMqmW
 V+/PLDWI+OopZOe7qjKCOZ2IdkChxpBZyEA/nLkcBMh+zOatDzGdsPHAXAM+yWFi8aT1TTza/7y
 FrFuspKlOywl176CDM7PuLL7IdIKL6+NG9zKOjSfnRADmO8yNNhaypMrjheFCWMYzL+mrn2cTlR
 XnvQX+JTxuk6YaHlYjjLNs1/ZKTO/3SbAp2i7shoRT5QnVmRLWn2GP0PvAIuFRU8pWzGUQLxbnf
 xwO4/wvYiCO///YkYbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260032
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[outlook.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100024-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,4ac00000:email,outlook.com:email,cd00000:email,qualcomm.com:dkim,qualcomm.com:email,4b000000:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF51732F17A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


