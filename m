Return-Path: <linux-arm-msm+bounces-106080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAxSCZ//+mkOVQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 10:45:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B1B4D80B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 10:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F13363077569
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 08:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97EFB3E5EC4;
	Wed,  6 May 2026 08:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SxWxlS4w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GrlfD8j2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22DC3E5EF0
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 08:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057050; cv=none; b=trlAC+r1cS8UkQaFx0xiHwX6/zPrwm8v+rkpuaOXyOgCbAzoJYO+aTyxLLwcH1lxjhdAf59Qf3zO6A0PeNo73oKsIqiMcYOympynSe2zl2J8Dxe7pagHMISN196cibaKJ7BEvEDjUmmdfu+4XnV6oPTXC84nSumwDZbBCBjcykU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057050; c=relaxed/simple;
	bh=yyksNRbGKOAS3rMbPtNPWOGGGB0beDwIaP5hEkpK2Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNna6NRoMB4exD8flLYr5Mb01YMR1LWiCSsdQoLeQaQFgTwQuJifZkTspsTi4bkXbF0tCmIIB3y6gmMez9JJT0x+W0rAFzzHDjl5trV0I5NEifQlEGt+uEFdUl8sAhN00Ms6bBzaS8Rt4fxomoEP3tci6ArzCr4p0Xr0mRuB/VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SxWxlS4w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GrlfD8j2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466DbJD911955
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 08:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aax74Xsy1hxYCxPdadlpSBnofeDzZn5V1X3zjKrLfVg=; b=SxWxlS4wS7VPILG1
	kppM8GNiYdadAL+QIRiHTMIJABg17BLCE4Xn02KBeW0twlMRuN4w7mJnJt39pP5N
	vGsww5BigxlqNERBmsMc2tSt5mI1XsEljKa4gtmAwGSSoTZ01Le72xUv9fYqRO3o
	ZVn647DYibPhacWxjOqCdu6LXaDqSt8Q0UWOj0vx1P/D5/gyJNr/P24UOznNPzVw
	jbqjomVQ1lbTVk9ewiJTs4uk7FSzbwfJFKYn9j+BUl3/YKJRmFt5ZQhY6loPlvaT
	ghFodw+BiMyWAd9yFEbCTRQOfr0FwckrFlX1g7LC9S1Ixdo/T6rvnhod2xWsjE1w
	/KSNbA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj7jku7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 08:44:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b81ff82e3cso370758eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 01:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778057046; x=1778661846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aax74Xsy1hxYCxPdadlpSBnofeDzZn5V1X3zjKrLfVg=;
        b=GrlfD8j2SFzh6YODJZRLx4rfM1vgYFpGXYrQBQv4LEE+q7IMoQVV7jngMRE9bsrQRl
         Rhq/WVZ4BOhPQMUZo6Czy8vmejB7znQPDk//U8jtlxmwjlJyIWumQG00ZI4CWlQZeD/U
         sIdH0Ga2fPWLgopMvXIXAhpLdyXzTa6OZfyBQodM0ADbwJ1mRLz8Vpk3BMmdgPlmF9QS
         Y//7z0x28ZpAhCuWxk0E+7BeaVfYBp+TNXIIazie9PMlJO/5k5TuD2Xkpzx3upTVzd3G
         Kw+8Q/i+c88wZFpyyjook5CQa01k2zz8VGPeAjvcSFkZykvWQjs2ptEHhEnH7c15eXZW
         x4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778057046; x=1778661846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aax74Xsy1hxYCxPdadlpSBnofeDzZn5V1X3zjKrLfVg=;
        b=hJgn3bhLaeDbhhS4ihQUDp2FHvcEEXCI5+Ltk0qkiwM0VDgEJiqNbiEFV8pqZ4M0kp
         Tpn+VQUqsG2JTFnrUeK8rwILDdRgiVKE80K4WUdhIB6iWs/BePWceVQKIXuVLpTNjBS8
         QEwCTPqm6nYx9S4vDOhzIHhBs+0h9PYj56vruEr0BEq9vbyHNO1fvFchhm4TtOnYfRkD
         jXSA1+f9C0yLGIzlnEHq7+ovihNyvub1bktGQL9jChpHVUqHZdPcX9QqIf8FN5jeqxVn
         GpiT4gGqzq6g2tcV7VnU5lGPl7P1sG9A9aqEI8qHJfdVAmKUInETiyTDdOgvuZX6yuEB
         k45g==
X-Gm-Message-State: AOJu0YzN4z+P6sP6irKDdn8uICO/mmU/BMEFwExMsvesCnAoJO+BE/Uk
	oR97jsK/wT3W0j0nK27OoBySA+qkaNJXbrTnQEDMMglUeEwiD2Fq5JzlEqVpvc+PrDINDuXIhXQ
	pF+r6NLFuejYn9O1aXpm8cv7CCgGvqy/qep4k7P78iexzBOYu7CGaUQYh7wdXsi6nbkGW
X-Gm-Gg: AeBDiesiDLHZau7a2pDD61x63RZPpl4/P5orwJwcGdGwTsvE4eptd3vF0OuXhSXrmm2
	Iwf+5Kjuu0W3pXHzm2hI5CBrU0j3MD1OF/tKoGomDU9QY/75Dl1tyDhstu48FT7PIE4F4wl5VYB
	0h7ARb8pl/7ciQSY3NGOPIlydteXKNOZ2LCs4w1c0jk+/3jnTm4tkOxbdpNkuXnBdP3QGkTaqbx
	fjtWby+1eq/oX9jTGXmQX+Qnpr7dsk4cnlkArjoarrPzFWiF+8Yyx4lJmjZtL0kcwnzT2n5xbDE
	ZBY9E1e1MKceywJiFkgiuP+mno4vDMovuKbQLRT1Si3ZAXeaDmkHiV4BCm+iUPlVVcHxSFG6286
	eZ19BK0T3CJtCuToQ/yO7tiYp58YunHfVObuZ6PpYLEYg73OrspOTT8FY3mmG50THjpfLfWhv9+
	LljoU=
X-Received: by 2002:a05:7022:6622:b0:123:3301:a718 with SMTP id a92af1059eb24-131a771ca3fmr915165c88.1.1778057046566;
        Wed, 06 May 2026 01:44:06 -0700 (PDT)
X-Received: by 2002:a05:7022:6622:b0:123:3301:a718 with SMTP id a92af1059eb24-131a771ca3fmr915153c88.1.1778057046051;
        Wed, 06 May 2026 01:44:06 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13202fbf0efsm2257796c88.13.2026.05.06.01.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 01:44:05 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 06 May 2026 01:43:54 -0700
Subject: [PATCH v3 4/4] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-qref_vote_0506-v3-4-5ab71d2e6f16@oss.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
In-Reply-To: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778057040; l=1676;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=yyksNRbGKOAS3rMbPtNPWOGGGB0beDwIaP5hEkpK2Zw=;
 b=Vf8Bn68UCpxcj8ofhd/XbsDqSsXtypYZxhuiMZtGUI4F8gukWtodD6DpH/jBxOssPmgO755Wr
 soHheNW0ES0Dyd7wuUK8xd3dwcft7YsKwPj7I7oKFVeTnudjA7a8o0u
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4NCBTYWx0ZWRfXwGHjQVRkrRLg
 yeudoHeqh+u4WEoBk7hAhW3W4JCTVQ21LsGS+golO/2/UZU2WeVhnXVxRdwW7FOBl9jGO28Helb
 XVD79x1mmRhblgw8Ua9lwmH7wpuziBZXWKOkIiWFKUx2t+YZPL2KvQD9qRSEIATQvYej1ONPxX2
 sSJfHJMlovAR2Hb4l9YL1EnIrEcnN+uiNIPX4C1nW9A6GehDaSNheuaQrUJKzra7DLfuvfzMLGN
 HT0hEzFa9iWwOpsIBlLh8PZDddBoYRhLzoWo1+Cuxq0cURPXDmiPyPtDd3F/IisRXUCAsMnc5FI
 LVEQupagl12xBytccSs+kSTCQBRTPlVl7fH80iImMYY4hnf+lMOYp1kXpF8zFq2CHoOVRBzjANo
 bwhhuw1cid5ZXKNjXk7NAVj1gQ55WyeY6D2OS36M6vg6SPP9Jvo+rmf0s+txsnrAXrgYTERStMH
 vRsdA7EMg0bd0fQhthA==
X-Proofpoint-GUID: XJh__yG77dvP-eIg4Gh269bW0ILkwl6f
X-Authority-Analysis: v=2.4 cv=FpA1OWrq c=1 sm=1 tr=0 ts=69faff57 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Gcy0W0cHAWauOcWtTx0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: XJh__yG77dvP-eIg4Gh269bW0ILkwl6f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060084
X-Rspamd-Queue-Id: 98B1B4D80B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106080-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The TCSR clkref clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board:

- vdda-refgen_0p9/1p2: LDOs for the refgen block that generates the
  reference voltage for QREF
- vdda-qrefrx/tx/rpt: LDOs for the QREF receiver, transmitter
  and repeater circuits

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 35aaf09e4e2b..382398e44296 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -358,6 +358,25 @@ &usb_1 {
 	status = "okay";
 };
 
+&tcsr {
+	vdda-refgen-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen-1p2-supply = <&vreg_l4f_e1_1p08>;
+
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+};
+
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in1>;
 };

-- 
2.34.1


