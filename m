Return-Path: <linux-arm-msm+bounces-97416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIl5Cczos2nZcwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:37:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C14142818EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 469803281B63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48583358BF;
	Fri, 13 Mar 2026 10:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SyLJzQ75";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JIWkrUly"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA2C2BEFF5
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397917; cv=none; b=NDXIw/CCTTX4uY8Cbcl4nEcwoXYQ8etjdjR0DQplA6V6dsaB0X04J1Gc2X1srFXakYfhMGPBVqmyTsgvO21RhH1lATo7mbUbH0PUMgGSFKothnYjCULidq11p98i00Hrfw+Qu0I+Wo20HGjzkKBukIXBylTLbPXNQ91Ap/jDxS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397917; c=relaxed/simple;
	bh=0gCStdfi90J1zLoNtjQkeV5b9HZ470QUaFZu2d3u/MU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QwoDN/OI3avo1IR5vIh2ZYyb6DoKtP2XLAPp/IIb7cliTWWeIUPVleUZpNLP4skUeKMQaB2pslq9ftssLHM99w8rzkOdlulQl0JqQLq1yBiD2BhhUb6hp8g5eRBPQi4Ch4kC39uIzkDCrP7U5reTgfxt1mAnVxYc9XXkUOPA/Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SyLJzQ75; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JIWkrUly; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5td9K1574535
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1sM8vUnMjs/6i3/VG+5tMcUkWBVpAHwFVnLhbHyrhA=; b=SyLJzQ75N9vv376X
	Vm05qVy8QrVP1Lgftu2Sxg4jvLtPD+vgx2P3gp/0Lhzbjp4905e3bI/vQCfwtyVd
	ih19WTUMO+ClgasaHn456GF0uAUYCmzkjUO8Zl/+zMJC7Xx/zmawjR5Sxv+L2++I
	NK5lvzoDFxNkTs50xxf+LR3CdnM4cfrPgF3tp7FhYeHAXyv55ctNCHlut7eWOvsc
	auz3Kur0hiVvunnkAFLdc8vxwfG/SqbY+At5IAtuPXVdHiw83PyNoB+qkctdx5Rr
	EFndXyVthBIybpDb8tSnsb6gC73Tpbw+uzwUwc+PE2iObOJ6PeVVoVMs2GmqXEtV
	qHHuMw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53nnr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:31:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35a0337930eso1454684a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773397914; x=1774002714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1sM8vUnMjs/6i3/VG+5tMcUkWBVpAHwFVnLhbHyrhA=;
        b=JIWkrUly33bfkQm5sM4VmgbeEQjYUdLGtOtuRaM5aI/YdDXIRt1T2v9s65J0xMeciz
         sYSIp+nLsAILSNvT8jiCWkuL53+Hrg2fLbprA98U6q+xOz2OGTEXIO3bU8q4Q0kuclL5
         yAf4fBXDHTeT7R2F/w1NJJGApo/v8qOknutPkZOn+EPUhcDQpjBu9bM5PHk55r9sT/Ms
         LUMmoKFZwNaM7xG4beDTqS2vN+dmpim4Wr9TmB8BT6GYY+Q6EHmX6sFivnAu58SUJPd9
         Iuobv+Au2X4md65rc04WXEV9Fa3VJRmZ+xPf8uw7JMiOOmP9BEQcP2CVUNdcnWpGrcj3
         P6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773397914; x=1774002714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G1sM8vUnMjs/6i3/VG+5tMcUkWBVpAHwFVnLhbHyrhA=;
        b=cpjMUhc+a8veU/AtxB62rwsj+LQlS0bGDmmWDLyPnWTyf5jU14UyZM/lZUHLTpvPBn
         kfsjlYu5xPDhjqqm2Aoz922eFFZ2aU7ahpKv6QZDlujuHXE2A4khqDlvxSjQFmHY2BAB
         WwHJf/qswuyGXLqiPSRrwM4qmh7EBceSEvtWBVhUexA/rwnp0iVAK9oiNtsoAjtsLCM3
         00j1XzrvOLuXIM/L2fxNjV1C23iktv0H/204Hic49YuQSzeN/3XKWSnw9s0ryT2/THoL
         5rjTlifZknc5EpY2HLwtbuSQsSZR8Lw42N/3/jIhnPnaR5TPl3TNw5EJBhkA9vhod42Z
         3VOw==
X-Gm-Message-State: AOJu0YyTET6Pvc5eWp91i5Wib9VnnCQdrx7SZQlc3hlJkiy8rqvx7BMz
	tufJTiHJWBDn4DnZWpZozwxEMQDfNpxQ6EiYcKlJFkPcOWwVjtaSpj36mps+CNDzltwh4hCLhYM
	SXpiMfI8iTJWKEa0XvaalXUhZDI2CbJxNXC0PNKoHf8sdlq9LqgvR1Gc7ouj7JKL5swXQ
X-Gm-Gg: ATEYQzzXiSiI537lhLaGxj78WT/7iDBoAz3AgdPcApm+gfC6ZeJntYRQ217elKOUzeZ
	6D/CPuOfkvxuE9t8k0Xgqcx/uPZ/d1eQimm/mlGkyJcMI88OxMR50Fya1jHDgweE46ciUVUhtYs
	hct7lmI3e2c6bOiFK60+/D+eLj0VpGqM9o9AM6yVWPz0QLVxb7dpVi+Xn1rwQJOoEiQXNMaaAhi
	b4jSFYHr+NbaCfK25qgJqKbF3toA5HZCNBtJCCQwTplQId9ubEZx6JwPY8o6fAfiZgl6dWBRMft
	R5buAM53UzTqBe1XfgPdXt5See0q2XEiLvgX8X3Rb9qZ0MVoehi9jMdooctsMY9jjwEIa38729+
	Ooska8yJgrPW6MvjTT5TbvaW+/wiw+XxuUxchpUmTCqU+ZhTn4URWJoe5M3g5UbZhb4SL1gOtDd
	PZdFE81xYYNqkntmoDrBgxny72tfTvWgcWlw==
X-Received: by 2002:a17:90b:3f85:b0:359:9083:3661 with SMTP id 98e67ed59e1d1-35a21ef110fmr2504042a91.15.1773397914395;
        Fri, 13 Mar 2026 03:31:54 -0700 (PDT)
X-Received: by 2002:a17:90b:3f85:b0:359:9083:3661 with SMTP id 98e67ed59e1d1-35a21ef110fmr2504010a91.15.1773397913946;
        Fri, 13 Mar 2026 03:31:53 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fc9454sm8604577a91.12.2026.03.13.03.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:31:53 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 15:59:55 +0530
Subject: [PATCH v4 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-v04-add-driver-for-ec-v4-5-ca9d0efd62aa@oss.qualcomm.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773397885; l=1383;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=koKZLgJJmkvuQ2/G2ERJ69WkW+ygNkTLSWIVLY+GMAQ=;
 b=mkDfQv7TN6sC9yKQkRfX1VHj36JLzGcZfXhroqENPftWosj0joaCcUq56nrCtg65b3Ouuj9yC
 f8ZdxNRK+r9DPu+oqOGGHT8xFpnP+mvNejHvJXCyzTmLgOfj21+B5aF
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b3e79b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=um1wo07bdbQtbc5qrgwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MiBTYWx0ZWRfX7Fihz3BMr6nY
 vbaL7/w2uOVOBZWWYfVw6I/9BWoes2aZ6SRESofi7DRvH75Y20n0CwnYBYXGKb7VynzMjEILAVj
 K0+nqFla8SOOuODbmLcPjpkjHo1yXbziaYQ0zsfl23R7NrnN3DRpt4LtC+ciXn/gNeuhIO9nXQQ
 9M2R09QEF6vbC1OJv75ijb+dEAxlWXyzCLPofHWC45EAXG0fpZNDx7QatUBClP5e6mpdZ/+J48Q
 gwd9ilogjy3jZh1Weu0NvKEDu3g/M7jllqo3XNcFhQWdl4QP2x4PfO3OmpOq/G4YE447jQ5Pwnj
 u1LXEpoIF+1q+CAsUUbN2TwQUzFJ+jJ79jlfFWIpQ50elS3BGz33JCDMbkAy/diBPZtCCr11vit
 MI7I6UYysIQNSY2mJyhnrJt/AlhMe46DOWBkEerNhf2qG8/25J/A0ZFOkCxI4LrE2PJuiX+BYYh
 hv3O4ZLxM1U1PF0dpnA==
X-Proofpoint-GUID: I9oa4APjxwG04BP79ldaU5BVuTjCHXNK
X-Proofpoint-ORIG-GUID: I9oa4APjxwG04BP79ldaU5BVuTjCHXNK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97416-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.76:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,4f:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C14142818EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 630642baa435..b3430424a052 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -799,6 +799,16 @@ eusb6_repeater: redriver@4f {
 		pinctrl-0 = <&eusb6_reset_n>;
 		pinctrl-names = "default";
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-iot-evk-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1272,6 +1282,12 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1


