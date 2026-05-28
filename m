Return-Path: <linux-arm-msm+bounces-110038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBHiJyuqF2qhMQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 04:36:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFF15EBDE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 04:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65F433158AFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 02:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1CE30567D;
	Thu, 28 May 2026 02:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSN/fdek";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xzvy42uX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00C82FE579
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 02:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935372; cv=none; b=K9jloT9flBcj8A/ypaRH+yFLeXyhQ4+FEwMgAHCTZyydWEVQYBO2tsHCzYwctsuZdEN6YImCgzYeOFi3se/BfPhdH40q3ObAJnZYQeDIPK1eAmqdi3kgT6sRi0Pnl/Ttc6gFjdIwYzEfXcU2S+EygISXYcmZ+w/419nK9odQgX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935372; c=relaxed/simple;
	bh=KLhquYMQkAQ8A3wNcTBTQpFINKPhWmq+7HBhPnnQ+ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gy8HoDfVv2ehQXCMUvRltga9EIYx03t2JYt9VR+3pEj649jGeP6zCkAuD9GmIvAGyYIz64H6XbSDOxtYYc9QrWX/r5eWJuz07NqrHjEJKw9fGLionanj8y2tIBlvYSmL3Neg70TqOrCZ6BhXfhznGjE3cvil+i0QlW/fDRZIp2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSN/fdek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xzvy42uX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKn42t3197934
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 02:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cay4mMkDSlsEaWE5CsOFYU7WQj2lsq6UmMxDXTOsSdE=; b=FSN/fdekEh1CeICV
	YTtcHvbdLzZ/kWwJrbwZogLzGwgdS6ZTYw7MFJ9Lh9Y/QxcCrT4+9EJgO9XgPdLP
	vuPLVgNdjdko9J/hlwEayqXVxCqZlKvIKxutEu5e3LbM7dy5KfH7DrfZALPS9OdK
	l7E7bCgVMK71PZgTREA0bOmFEzW8Zm6Ma3ILFwTBr4uuiJm47m2gGaygpqroObAK
	tycWwUoCcVJ/cZ/BREzg0BTKQ7EvagkaTgL+Oydt4zwnOdpDsU1WMSt5CXENW4UV
	BhhiXyVPRlI1xuHyuf0p6EmGRu2TjHJ2uKLxVC4+7zl1YUOvnBjvOzfgjKZnqi+0
	XR/uqA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yngxyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 02:29:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304b8d0ee63so2176065eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 19:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779935369; x=1780540169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cay4mMkDSlsEaWE5CsOFYU7WQj2lsq6UmMxDXTOsSdE=;
        b=Xzvy42uXQgCS2o2VpSiZRsd0H3BVh/We1LFMvwCM6VKyp2NzF6oXOesq8Tkn5gjNgt
         kEDc9nP/oKQEZVlpM3Vqm7mdCiNJsh+ly3IcNf4et98YPeL/Wjab4o2+wk23umCd+eZK
         rESqT7CXaXYqwlpaEm9SqDYLjluiHTrJTWlNZQjiOJfN1Uly8NSeeUEjCsAjhaTLj9F5
         pUyYhvbV60m/m4910DfzmBvMG4PxHxahxaGucwGWeHSNKDT6ZNEQ36/2eOGzUGRfOcTX
         j1HWFfvc+0oZhf2W76j5LY9bsKjyPevp5KU9BjAQZ2PJ0FBdFGW8TFCyADWILp4KQ7s6
         yOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935369; x=1780540169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cay4mMkDSlsEaWE5CsOFYU7WQj2lsq6UmMxDXTOsSdE=;
        b=judKedv2AZyIg2k7p+fPiEBBQ46zpHd96zc/ZQoqKv4F9lvqzDOxHGdgLbYdRYJ5Q9
         VWEGj94nukTSiHX/ts+SQL0/TlF+HKRVOMcQQHhei7Mxpc/wHPZsL55ORqNBOQj8ECZb
         SwbweCFlTog7mgM50TtwTSaq0jqrSnpYgFZxo3e7jWWX13QXWofTUB4IYOAb0Gf/6VXA
         RDHeImrccsmM5KET+eB6651ajimB/r2iBxcmIi9oQE9BXeJGGGJ1k7oyDU77ucyXL9ZA
         17/OpIUcSgxpeoeoWcfrZx7fcXvoJiyLf2vgMROXo9fFxbHyWmOsusgs8dbstUqHa+eU
         1zSA==
X-Gm-Message-State: AOJu0YyH6IFXA2o9p2/7lFmR4Whr6Hcl1KlQAedZvBPcnXBu2sGFQF5C
	HIgZrtS0GpfNB19ng0iaehKsyY9uHm0Fp+D4OY8Ys1SWu5i86Kew2LPUjGfErcHPUNBKEh2vYwC
	3u/j5l5Ml/Msh8tL5ykAPmTVB1GsOzZs3F+71ttNK8N8xzKtnIEFHlC9CzhQgQC0YLbtR
X-Gm-Gg: Acq92OEmVyFAbcpzNvJJIkL4JwdgimF+uk+J1z8isPkO94SlLNOA2LSvKMFmhNbeGE6
	H0c2djIOZ/Bwg8XtgNXX6H4c8sh/9GoIpUCRfKhsVfT2NjfqzwjqwUXYfNTFmE+ZfwWddxPIhZr
	+56pvvTWGLGt1aSXoen6Mh3QPFITkqh78XXwSwnWp4upZfCBfFLqdXmAFa5woiMdlYSRbEJlrSV
	GOHdn4Do0bEgj8/EcFmdjQf5b+uwx0+SATYc/Yv02n+lHIKKjELlnlIWSQTdq9btsZ3dAw2pe60
	0cSTfqVEUMkkFb2E0j6CRMJszGL0rSxMNh7F2Aby16HkmIncSue04QMSDztPPaMGq4hQWlfjisE
	YgzypypZkz9yhX6Ex3xttXIot0tiBtZ8VriXTfpj8p8mLy+WM7gqselDY5SEYiBvylQI7XBhWBB
	Jo1Ms=
X-Received: by 2002:a05:693c:2c0c:b0:303:a1af:5042 with SMTP id 5a478bee46e88-30448d51723mr12215042eec.0.1779935369457;
        Wed, 27 May 2026 19:29:29 -0700 (PDT)
X-Received: by 2002:a05:693c:2c0c:b0:303:a1af:5042 with SMTP id 5a478bee46e88-30448d51723mr12215035eec.0.1779935368983;
        Wed, 27 May 2026 19:29:28 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304d4222060sm691653eec.29.2026.05.27.19.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:29:28 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:29:16 -0700
Subject: [PATCH v4 5/7] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-tcsr_qref_0527-v4-5-ded83866c9d9@oss.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779935361; l=1589;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=KLhquYMQkAQ8A3wNcTBTQpFINKPhWmq+7HBhPnnQ+ak=;
 b=l4y5twY8oeGyvBZydsAuEFQe7hJ3FP/48U8j6FXs/nf473j9OaKVBzNEzPhnUHMnt1jAisqrw
 th8zo/7/mP8DLg+ldlW1xzoqbtJU3yTCyRjcHqwGoU1A9cmHKwrKV88
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: uqz_-gR8nvqi_us80SeqwV_ZwOS9HyIV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyMSBTYWx0ZWRfXzhyuc5DRPgBe
 CvD9rmd3Dijw5czeICPpybEUSwJt38utKsntdOyaaJV+IRVcjCGdaAyUA6/ytAy13HRl6rnzDDx
 LgGoRdQHW1UK6bYfGQ7a2iQMP9SCcWG5sT7Q5xSaJNb1Kgng9QcXN12/e5sEfLec3OQYj3xsAR2
 9bzwsL7KbR+7/nFRsBqaNozPc/XG/ACNB1sjD6WOQQar13OuXC6f29OkCK0TQAdqeAmvjVGfXRK
 fdrpdZI/StvrtUn2U4nSiE9B2LtojTfF7czICthhX3JhIZG6WnZTz4ujUvxkD6MQS7K/GMvD+4s
 1x3WB8gxsjQqfvHZtta3aUK4LKPEcagyxuGkVSw659jHrNSHLhEoD5hBrIpHhGZ/cfALN/lbOVJ
 eLzqp089bA1kwGFgHTr9JuMbojnexeNue1+9USNjCRK1nCBpP0EzDG41MxJ5i3SbG7wmhdF5B+g
 gtqg+sM1PR3eF2MJp4Q==
X-Proofpoint-ORIG-GUID: uqz_-gR8nvqi_us80SeqwV_ZwOS9HyIV
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a17a88a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=J05kOiREooJSWT36y8oA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280021
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110038-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3EFF15EBDE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The TCSR clkref_en clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..be8497ef0da3 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -354,6 +354,26 @@ &usb_1 {
 	status = "okay";
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
+
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in1>;
 };

-- 
2.34.1


