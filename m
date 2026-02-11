Return-Path: <linux-arm-msm+bounces-92604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCzhF7mEjGmfqAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 14:31:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D01D124C67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 14:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 356F1304808D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 13:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B4C27B34E;
	Wed, 11 Feb 2026 13:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hd84I2QF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IYffNPSU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBACE1E9B35
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 13:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770816616; cv=none; b=qm11n9bB/JmQHvzRWKlNqg2Ad5BYC2DQfPGRHA5iG2ZCT+0Own7SAXlsWzQg9//eNfa3KU8+7eDN5tWr/ZE10gIdgzUrn16R1ktgxGGS3/fI+RJWIDfj/CdCBepCGzB5jMciETISVuJnZIGcXFim121asIBtFxslEBLqGE4Uatc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770816616; c=relaxed/simple;
	bh=gdujZ99MevCVsCb4NBaclIUNi1Glc0RnL/gPWCQ/g1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nt/0zw6WFBob3NiCLEOpByM1au7lbuNEhMezvZ4G3AgFqwGtxhz7AfCvUfoRihbNMrNcvoU1rxv5srlBTkJbo2DPlZDBXMZWRxIQ7nk+lQQhNlvEzV5/ZKvFbIJlLfKQhJdVwRqxqu1iwN3AgHWhkkSPsn3T2tzVywf16G740SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hd84I2QF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYffNPSU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BBPTYr1199306
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 13:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yBxQPWSZi11
	Gi7fw7yJ514mCuqG/sJlj9eUQZXPJahI=; b=hd84I2QFoG2o8wydmcKyOdgB8VC
	zvLHHYCfmvquU0D6I1mPVBrcI/y4ZqTQis7+VGF1L0JV/K3y2M7T5n5s++hSpQ16
	fHCNLBbYLBLwcf2EQOKRn+213CZ1aRSbdABqL5PIx2ODMNRGwK+B5JU5Le02N+s0
	ZvKWA0Gn/B76KmJ6pNFN3NeJXhktYJNs8JCb2rfNQN3c9TEm2yaV42mf2Ov+x75h
	wnMqm+S3fb2nYjWeiLYxHqhHbJmimXhdjaubz6g3+61eEwdSC/fHfWnl+BwO+wIA
	rOoTUmC6NAP4snoXBokUMlGflYpS/RiG98gt5I8GrjABQbLKuhTLz9JWcQg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8rvb8b8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 13:30:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81f48cec0ccso6062628b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 05:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770816614; x=1771421414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBxQPWSZi11Gi7fw7yJ514mCuqG/sJlj9eUQZXPJahI=;
        b=IYffNPSUWCZOQqzKMnSyVhc160unRrFaoS30Fiyd0aK1GrPw8euciOKKGE/a8DmadT
         8q+V1FAMUnHnBdY82GgUKeCfJM/QPUeI4ptjgAMeXPJZW/JvSpizn43CBLsUds2cuJCY
         XP9xmSonN6pFo0MKlM0IVQCA6hCc+SZfcWFBKSCnHXmqRStgnTJw3RSvRCe361jWNDal
         fZ2O0OpjXvcBWbG/m7cLQ1PeP2UY0vs/I9M0HseDlLUKh3sU/UBRQzWXwaTSQdpCbU6p
         kEKpqRde3LjMoJR4XFOHiQNGUz0W2bCBvRWqQU4mBArZ63K//O7a60Pu1tF7qh3qpxRd
         KtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770816614; x=1771421414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yBxQPWSZi11Gi7fw7yJ514mCuqG/sJlj9eUQZXPJahI=;
        b=f9qysrf2YkLYVnvu9AkuZivKkw7xft+ZLX+2hL3QssjcsPI4aap4I3jSeQonyh4UHy
         JPWk/xDCt5RpNSHSUl+qQfM1rfiKIvxpmY4HwfpKSELb35pRXELT8HWs41VdH0LktGRB
         2CG1U6SMM8uAH0SCL/XBw7PTqkb64tIOTlCC0Ab3+z0DUsUQjkVb1xNTbHvR0TwHemFc
         9QlhVND992QCoanRlR5Aef/jA7UFdT0+Hd4vKlDNmA5WouYUsYya+8IP+M1InPsK/1vV
         vpbByKAi7aOn6jw27TT03mtulbwEh5nPL3X+1nwP/KGhGSQouc0hXScHadwhZC1vL5yV
         GN2g==
X-Gm-Message-State: AOJu0YxyydG8ZOa7P7hgOxUcRHJ0L1oI5NbuwgQamxm0NpOis3DSs6ZE
	Ebiz1eMtCZmIUY5qDSvdVi/M1SRoCU0gYK9Irf3iy7CNZ2xmOEkOkdg12i/msQTXHsg6iZAe5tp
	iS+bhBSTypKz3Y85H4mz8GeCp9HisB2DawehBj65u0xqfUOTqajt8ccEobMAatCm5HHaJ
X-Gm-Gg: AZuq6aJNRkNlr9EJQ918a1o6qHjNQiFKctHrhzsvWgIPPG/kRFxY32exlTqo41g/kX/
	VnNa9QnyGMo6GHPN+2hbdBikd6kd1EvGtSv7Mmup26r/fjbnL6/wx1S2aDBsGqBnc7EPWm280uC
	ClNqaYsufcfB4UC2Qpv0uahzXm1q05Usc0G41y6nmyIH0W3WqWyfsbSt2Pwi3QFZJ+0dk5Bnpv4
	0RJxia7PSEjBM8DXjGxkiUgVoSWCN0st3IyWDS4plCME1oBJ7h8Qu86kZNtlTEdfTlD8A3Hf3h9
	5L8PYT3Fh7WOINuz4mbdzqUc4usnyNRygF+GU/sGo82iDj+eFYjYZGydToNlxsb4uQ1S6Eq9tYj
	Gvbfep/mxQBWu9koHc2jzMFBiCRV1B+jCz3ML8SBknFPbRZYedRwSeaPgl7z3lZA6
X-Received: by 2002:a05:6a00:6ca1:b0:824:374a:1402 with SMTP id d2e1a72fcca58-8249fc25cbfmr1597577b3a.11.1770816613598;
        Wed, 11 Feb 2026 05:30:13 -0800 (PST)
X-Received: by 2002:a05:6a00:6ca1:b0:824:374a:1402 with SMTP id d2e1a72fcca58-8249fc25cbfmr1597539b3a.11.1770816613061;
        Wed, 11 Feb 2026 05:30:13 -0800 (PST)
Received: from hu-pragalla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e84bc1asm2143655b3a.58.2026.02.11.05.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 05:30:11 -0800 (PST)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH V5 3/3] arm64: dts: qcom: hamoa-iot-evk: Enable UFS
Date: Wed, 11 Feb 2026 18:59:26 +0530
Message-Id: <20260211132926.3716716-4-pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260211132926.3716716-1-pradeep.pragallapati@oss.qualcomm.com>
References: <20260211132926.3716716-1-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H+XWAuYi c=1 sm=1 tr=0 ts=698c8466 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=M7MUb3q_Ox69Zn6kGXoA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEwNCBTYWx0ZWRfX8SpbL+Bsfjk5
 FvZQCOtWBPmC5TIxDHG9ZG0NsJpkB4sacPzVAQcpUHV2wgIjmjsbvjVZeh3B2u1WKpmJNUr+ZiO
 lFeEOnmV048zxCpORqb90M1BfOWbbsilPTHl1/r2yttwTfPWQQ+CoM0Q3DS+YYa19flwXBkeY74
 ctydMGliyslXRRI/qafHJ2yK4mx0eK3M1R+Eb6d+DhYRR6u+AvrBkiiUsoxUfNYMiJFIeHG8vhs
 NPvxVvO9xEQBWRPDUR5S9jYebZoB8Kt9ANr5gO/UHxsxWv1l81a+sRfcuCVoFMIJCqlOBn87NhF
 wpikp3/SycFlXflu3ZHijviXSMeyhm+mrk95iFMcyc3sG2tXLyijqtRWuwKcVIh/2UevWoObnBH
 M9QHWIvx7jewnZXlNHT6D5ZOyB0+SoCHDCxK5oJuVG4s7lyAzDrOuZg/rkeBptcxGPMz4zOREnT
 NAj57kldwbXvRhC3gnA==
X-Proofpoint-GUID: 11TtQn-n2NIrwxPTZ-77_f1BbFJtyON2
X-Proofpoint-ORIG-GUID: 11TtQn-n2NIrwxPTZ-77_f1BbFJtyON2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_01,2026-02-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92604-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pradeep.pragallapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D01D124C67
X-Rspamd-Action: no action

Enable UFS for HAMOA-IOT-EVK board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 2390648a248f..fccf1d1bdc60 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1461,6 +1461,24 @@ &uart21 {
 	status = "okay";
 };
 
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l3i_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l2i_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
 &usb_1_ss0_dwc3_hs {
 	remote-endpoint = <&pmic_glink_ss0_hs_in>;
 };
-- 
2.34.1


