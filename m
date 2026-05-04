Return-Path: <linux-arm-msm+bounces-105779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AfhC2DL+Gma0wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 18:37:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA844C17FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 18:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B78FE3097D7B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 16:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A1E3E51D2;
	Mon,  4 May 2026 16:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LaLX6fMq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UHKiWTG3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFE23E4C73
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 16:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912287; cv=none; b=oZ2Tu8gfJl2Stf86+RuRisgMTwGldhKj+l6TUvfUvFx5IXjERbpV1jlYVXlTAIJsecYhfrzRmhqpwgcV7o8DYh32VwZH3GR0qAteO6aY5EkrYMan+EeYQi+kZmgLEfO4LXT+YJm0XKIChL68ayUoGP9Gm/jaItHUK0QgwQXf9Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912287; c=relaxed/simple;
	bh=uRIBRQsQHN1k8SN0i1NUocaKTlyCV7C0B7ba92hVDzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tqbJdw9tfZxY673yAm2s9at/NQ9AIMxPnlmoXGBE3FQndg9y/qWMayEFYpMQwrRaf0ucgGRdwXhiy5kL3H3c9i10f2HZvGVRvo56R8/2UdaDrzwSJI39iNOuysbE1IoOh3i3f7HjLR2JSUIUGvpFHR1DoLwCW3WuW+GZf7LY5HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LaLX6fMq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UHKiWTG3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644ELneM1960443
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 16:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wgnV2scb11GhDS3a288DgK6vG9GrzpI1FMk/LFDbTXI=; b=LaLX6fMqRURvbSuU
	ZlJENdSa4WhHHrVYcoSnBumA5fBGOW2JOsdfsHy2mxt4ShZ9vsNkVYqFtDJAqJ8w
	Jx45hxDRWqHf4Qul83P5uNYXr8bk5rpQ17omaLs47SiBtEngFp2qblakFcjrZYXO
	zkAtosMR9vK/r0rR3QdQsSPxpdNmZVlGgyBPLPZuC94C+zDWO1ynT6FD5YxBD/Q2
	YCsqcAPD10opvA2fyOTJ2f+PRi8lxLo/tlLh6yvj0ggnzZOrAAFv4WP5VzQgzYCd
	ZEPC1tDldu2POCROp/B0S2jwptAqDqDhM/u6iVlL528Vm8exS0vmOoTEjH3Tn3vN
	i7r1xQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5drgux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 16:31:25 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-462a9191720so6216432b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 09:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777912284; x=1778517084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wgnV2scb11GhDS3a288DgK6vG9GrzpI1FMk/LFDbTXI=;
        b=UHKiWTG3aGfqBE/NFnzQP8ft8pyMglFmrAOadozkIPYWSWdANBrU0MfigwVqIDs7xC
         NxK6U7Tth0bluK1BVgddSwiTg5dDJAHokTGxlAKv9S5DrifVsatRYAisgGy+VwF3L/yS
         dOF/pqCfmJmB4P4YwIwBqnI/g0KLugeYXEy0H8K9WSaXKk/flGiHwhKvcX24dxdaGDYr
         MczXLMqbEajTsDQTl7UqqCRUidSEISS7siiUrlqzvxcQwjn2GPKmUp9C87W051GphINh
         LqLGtQCftvyPeHe69vBS2T+J9U/Dp+GBAC+59PG0mo4DUucTwM+DWsag+qe5JPU7/ayS
         soug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777912284; x=1778517084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wgnV2scb11GhDS3a288DgK6vG9GrzpI1FMk/LFDbTXI=;
        b=ai1RbKcr7IOoYS6ADcxUDS18fMpopc6f/smtWurEZFdXblIKlaP4Z7HXU5dFMFEc6b
         RKRU0icqDC9zZFxLNIYABRxfAfAKX7exUiG4jxjA1EMcvqjozUXxhAoirTtZwztq6ZQu
         HLlOOKWd87WdIy+ty7woi13siB/3X3InLQaH67XbDPXt/E1PaRlgq2ibalaZThW7Ya0X
         Ep90nusWEVa36K+UQZ59niTooXFi193eNjQ1+Omwwx8+qFOwVeEuPi7UFYvaYEjx8iEE
         D3vPnJByvXvS9qeq8UdZ5neazTS+j7LKfq7uN3y3TyQuMSmnCh5BTWZDMasaDGjYOLYC
         Gtsg==
X-Gm-Message-State: AOJu0YwkcEFojtHMgg2dKdO6tNjPCZvk+Y9iRkRMJGlqIr9+IEMJQvM8
	/1zVCJe6qH33R2IFp1WQY32NYf2oYPSTeZLe6Ie0LrYr1OzZbUhcQJMrGjI6zqAlccMqL1jjD5E
	5b4uYQWtpvT54z6XkuEFliu26vlHgZINQU8K0Fq+mxa7hGmwpysYklSdzbzJfZryRT1mQ
X-Gm-Gg: AeBDieugg7c7hNA509SNrFdzBwbqkajFflIvXFH5SlUBJtLANz7NtbvtCBAu50fSqzV
	HOvmGv3s8lp49b+D4Xf1ROSW8Rm3b8QG7rIepx2c8++8DGhRngCVbv4lhWFJmXvZeoQavV2pZNa
	9ATK8AbDHMMIJfpXdh7qIyBayXZyf+c2A9lx+pI3oDnQCo/MCDTQPAi/SHlexaL8jVm1wQ9AVLR
	1fSV0/CFUX3xAYX4rRXXcLY62YzwDZ8glKlHGFCT3SbqKQi00+PTtpF3ruWrCX/RuGsy5ocTVUc
	CpLTuYHHzISVoM8uAWnpAhLONENSMbISbGls6RRodPhumKYwqYNLfsG6ePpS1rV1gRDces193xU
	xaS5kD4Kp/IGD9UfftYkj5Wj2Krq/2ZmMEOYC8d3K
X-Received: by 2002:a05:6808:e3c5:b0:467:880:7441 with SMTP id 5614622812f47-47c890544ddmr3649146b6e.18.1777912284427;
        Mon, 04 May 2026 09:31:24 -0700 (PDT)
X-Received: by 2002:a05:6808:e3c5:b0:467:880:7441 with SMTP id 5614622812f47-47c890544ddmr3649102b6e.18.1777912283583;
        Mon, 04 May 2026 09:31:23 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb75fc1sm294986075e9.7.2026.05.04.09.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:31:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 04 May 2026 19:31:07 +0300
Subject: [PATCH v2 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-eliza-adsp-usb-v2-3-18e0b0b0407f@oss.qualcomm.com>
References: <20260504-eliza-adsp-usb-v2-0-18e0b0b0407f@oss.qualcomm.com>
In-Reply-To: <20260504-eliza-adsp-usb-v2-0-18e0b0b0407f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2796;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=uRIBRQsQHN1k8SN0i1NUocaKTlyCV7C0B7ba92hVDzE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp+MnTHP0mtIo8i+IfrdskVx9DwQqDy9Uj+JZSB
 mGmd9mmaj6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCafjJ0wAKCRAbX0TJAJUV
 VgJeEADIgb8S7wNNL4zaVmSAr4yGXRpe3rSa50hs0r7xdGPE2D4/Ozu5MZw545+Aj/vHCsNBXuG
 63/8Rq80NOxncJmDWFNs/YWeKGPvd1OmP9NSt0jJgUXiWic73uHiKLU5u3EWJZVLBUrNP7GlCYO
 qXyjgm8hxkuxg6OsKCrnb95Q4f0TYqEcVgZEd9dyRezfT0RYnUW0DCMVHBFOXuWbXJybZ6tW7nr
 ormb56f9tG/mR0tDr4wdZDZ4l4fN9+MGGPIX8pHfYVOZQAKjYvmFpQjZY2CyzlmUxkqD3T4DiHf
 4Jq5sgKkMkJ/H6tMNL4nIZxVtFMFN2OxFQwLPFS12vrenBzftc5RO4Kkaolk0F5rttAzi03vYxj
 +reF8FjqUfSq2mJPYpWlYuSdRoGfT7uiv/yzh9UGde7A8xB6h5VDveP+KJPnTijcnB5lRhGLPPo
 FGnx763sR4iV4WqALfwKX/i0tb3F6xN6i9UJgnMU603oJSfXPM45R5x3ya27y48/qLKifak1rfj
 hGOfLo+Y8h/zMeI8m0jb+vbYcT9xE8bIEjas8W4Jw95c4vfSEnDoB0XTwcrWALLm6Ovi/UyJnbI
 TZ8CkdMERbgFtYtEspNfUckt2wDd9dFAQZCLUoC0rfvBwh6XMScMxfUk1cVPgVgSvp1JaVzUQQQ
 vFZB+eq5iFd6uEg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1MSBTYWx0ZWRfXy3CKL3YWGpwH
 pQmX0VBvulMx048CVeTVRrBw2mQ8KV0VFmGRrWQEgPuFlr5suDs3JQaCAsjHV3NtOl7mJ9ZN46t
 xDqeFdM15etiTp56ivApubjhRN2PQMLe2k6Nw5r8k1o4qQKgjAJVvPFm/+TnjUZJBdq8kZhI612
 c8kZ+sOkL2lrfApyoJ4Ij1Ns+OjfQdKddVJrzJXvwqFh1vVUPV2cMsEtd4Z1VaWK4EIc8UQ0jAo
 Dd+tjMm9Sf4r17DefXIQmtIlvgak75ZMoGBIIuJ2h1fVOh1QHSyycjeKv8F1GtSnSbi4fKIvUtw
 spk7HR8r18fG4bjk9X28h9whdWzHzzpP4jlrQPzRzbKMWHljY5D+cn8JR15Q2xRnLsTzcfCQGla
 pIT60QDZCsZ0e2vDio0IfGUGrwyRdQNoN/EWahJ1ffQ2cZM/Vy88E2K7Y6Nt3ocQ5bwReGUiayP
 5BEZq32sLEwhQRzbp4Q==
X-Proofpoint-GUID: JBF6AgDeB15tiO7OTGmSf1VICz0lEVpb
X-Proofpoint-ORIG-GUID: JBF6AgDeB15tiO7OTGmSf1VICz0lEVpb
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f8c9dd cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XerPLwBTpPCFuubScswA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040151
X-Rspamd-Queue-Id: 8EA844C17FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105779-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.1:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.138];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
routed through an eUSB2 repeater provided by the PM7750BA PMIC.

Describe the port and repeater, and enable the USB controller and PHYs.

Also specify the ADSP firmware and enable the remoteproc.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 81 ++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 90f629800cb0..3e41c95edb28 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -6,9 +6,12 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "eliza.dtsi"
 
+#include "pm7550ba-eliza.dtsi"
+
 / {
 	model = "Qualcomm Technologies, Inc. Eliza MTP";
 	compatible = "qcom,eliza-mtp", "qcom,eliza";
@@ -54,6 +57,44 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,eliza-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 122 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -376,6 +417,18 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&pm7550ba_eusb2_repeater {
+	vdd18-supply = <&vreg_l7b>;
+	vdd3-supply = <&vreg_l17b>;
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/eliza/adsp.mbn",
+			"qcom/eliza/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
 			       <111 2>,  /* WCN UART1 */
@@ -405,3 +458,31 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb {
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g>;
+	vdda-pll-supply = <&vreg_l7k>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l7k>;
+	vdda12-supply = <&vreg_l4b>;
+
+	phys = <&pm7550ba_eusb2_repeater>;
+
+	status = "okay";
+};

-- 
2.54.0


