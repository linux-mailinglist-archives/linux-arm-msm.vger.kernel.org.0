Return-Path: <linux-arm-msm+bounces-91274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAthGD+MfGnyNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:47:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C36AEB981E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C444305597C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8142E36A037;
	Fri, 30 Jan 2026 10:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QjpJVZ82";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Op9AQByY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD033783B9
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769769907; cv=none; b=CvXux69vT7DVEv5Pb3fAIkscS9eJybUunXloOWyAmGuMT+2+kZcvLPM/OGmO9DGr//f4idnHJT0mUg5xm3o089tCYVpGxCZnT1qPz5lpjjKufj23XeEQ7Df3/GLCUw7lFuho6MY7Lx/7/u0YpMX+oC+wfb+tMf2DhKosbsENESE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769769907; c=relaxed/simple;
	bh=q99Qqc+U7uBkSM9gi2OdFlBatTczLX8GNf343bWjK5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ijf18lGgNaPN3XNRFa6+28KjIgrzBB4cgD3Tlvx5DX6XBOGwR1e/w1qlMCzNOAQVo5MY4eOPJcPUGDnQYcSqVgoMwpTe54VLt3ZpmSie3awkpR3Rj4ah3UGm6tD/wGJgofPKCbJySZrysJps3paKGSqzHeiHNHX57CdsHWs0T64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QjpJVZ82; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Op9AQByY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U4tqfv2295325
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q9VuwPEH5V9+Td7nRq5PK2t6fgfchqZ3xAcPCIZiZK4=; b=QjpJVZ82KSZaELDN
	rPLTOrCm6k5mGfVwwtnmLUVlQpNKbiYNYHzFjnMTZ2P4g0Alom+3bsu1eQONntp7
	mg+2iYZK4DvQzg/k0tccqqNdVoRu4sVCGJq9Xc3SHSjVf2379KrNuEKAivY46TsA
	PeeZPQ449xPvPukiR5MJHMxpXsePRe1RSSwFiR0nM1pEjXSOvOGd/mvTbWC1J4yd
	MWqwe1o8ER+cTe5n/UYqp2IDI6ZyEvpm3okx8rQa8vt4caglkZK2omK36+aCmAwX
	wxYUhWcLCY+w2/OqlL81rz39zX0VsqKIwsg8wcimJqUSY3ec7SVUvuiQ2xFlnOrg
	fsHoDg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0p1x8yn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:45:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a8c54bbe46so30759665ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769769901; x=1770374701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9VuwPEH5V9+Td7nRq5PK2t6fgfchqZ3xAcPCIZiZK4=;
        b=Op9AQByYJZ2IO8mtRDe5k3lBkFUAdHKEEV5VOlFiZQi/+mjQj6D0Go3LwsE+OG2oT1
         snrj0gNq7xwSwYCUsoXWJo+3e6ogJTzty1re39hZBO18RRVYvWyH2Yno+eIYw7vC6XI1
         mQ+VYiwnoN/uipVmeoSHKGg4kqIT2EZ1Mm9e0kf5qjgWYY/orw5Ym0eu9O4dWf8wVdtc
         AHB2+JOEjf6mcHcobnsRSMN5mRBtyT6EHdFifn2ycRgppo9+hzlpFiBxaFyfMgSSofln
         rl5wqtyE5HPW7BfN3KYMN0ZXFtCDR2P3Ctm4GNSCTxvuETCxogWyDjYmqUU/cm0t3I+i
         ls4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769769901; x=1770374701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q9VuwPEH5V9+Td7nRq5PK2t6fgfchqZ3xAcPCIZiZK4=;
        b=LQFQyg+J5g5alX3EQBG2ea9ys3DOpDzbUxZ0RJqqLpT+sbiQnmCp/60OeTdtCBU0d0
         IjA9DnDyDT1nZRILh8kdRJdhXqbg/CLHiQ4ycGfkW0pMXHGbgj6k2AgxNX9G1JEfO3aF
         WAuA2cxxc4Dakbme/HEd3Udd2zaI0Awq3nAajzpkbGbRk9u5rGd5BVS7xIJcD4Pw4x2S
         24uYyDj2CtBK2Kw41oQ+JqtETjfpFcCodnhlUJXmr3/+nrrRPOnvS7yzNDor2oj95Af9
         BHSUbl7bq3iFezyXGEif+KCVw4QKZ+qdQFHD9vig6awQou5a4Q8I51rzaDuOasH3O22W
         LpDA==
X-Gm-Message-State: AOJu0Yx43WKgbNVfPKdmw1Wnyqzdy7k469vpgIFinV3SlYcTsS6BqRQu
	60f6aTc6mSMHi8gWrk7JBybF6JS15yPRGf0+RrrBpllwQTihpz+qyJBHDxauymODQSKoDwwB5+b
	aS/C/ak2sLrkXloA1ProvHiurB5yGWd/kyOKcMTkaATViZeNNeAUAQYbq22KyxQGsLKVB
X-Gm-Gg: AZuq6aI8zpSXs3GU+nqSn0sIFrScWb9C7xJkqD0pQjPBdIltg+GrQFvcKUnqtVnVyf0
	VHmLaahRcsJYoAdGgBPGvTlSilgjRnTN96SQGgAA3eLnFRKaF0hEDE1vlMoZYzFs1Dv66HqDgiO
	a2LVUYc2t2apgoRA5PD9exhQhkq8rzPWy2QjqLACt40gMrvEM4oMh1eOZufSSGNoDl5hSYyuJMC
	PaJHtqIBK7DdbqisekPW7li/TCJq/GEjgdjq80K9Y+1XUMWWGYPxbH/w6Bn4dIRC6OM7yRZaI+Q
	+u/ohyk17160W6x9udz118aw1LXaVFRU/7Y4fd4Koyd3Wy86FF4uexSxLCubKGBwg4DbEZNVrxU
	SSJ0hdwm6HOuY1YAIRef9oXy2OQzIKOlIROk/PioZBJhbV6abwwKL5a6AXXrc4Vgsaqt8EbNho3
	NkDKnAfYh703paxeDwN4n66RsQD2OA9NayZFZy9wV5/jfD
X-Received: by 2002:a17:903:1b47:b0:2a0:b4f6:5595 with SMTP id d9443c01a7336-2a8d99404a0mr20467705ad.50.1769769900705;
        Fri, 30 Jan 2026 02:45:00 -0800 (PST)
X-Received: by 2002:a17:903:1b47:b0:2a0:b4f6:5595 with SMTP id d9443c01a7336-2a8d99404a0mr20467465ad.50.1769769900262;
        Fri, 30 Jan 2026 02:45:00 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm71231465ad.69.2026.01.30.02.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 02:44:59 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 16:14:34 +0530
Subject: [PATCH v6 5/5] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-wdt_reset_reason-v6-5-417ab789cd97@oss.qualcomm.com>
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
In-Reply-To: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769769874; l=1339;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=q99Qqc+U7uBkSM9gi2OdFlBatTczLX8GNf343bWjK5o=;
 b=Ghfc0JwemKQ+o7B+z4KwjfCC4qGkEMzypMum3Cld/85VCjFIeIRyqQjynccIedvTvMJlLKkU4
 7wY42maPE5qCrWWxq3fCi0YSD2zjU9txw7StJjmuJZpZ+NxdXkaXXWi
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: hLqRfzU34phfz-LEtgiShRspZv-dUKFo
X-Proofpoint-ORIG-GUID: hLqRfzU34phfz-LEtgiShRspZv-dUKFo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4NyBTYWx0ZWRfX2I7Nha12YsMX
 NcL+mIdnvZEqFvumQZbUMbhVyoZjC/XHkcdK1TxU+j2MfwvK8ddP4xC47e37HhUYXgT41goECzz
 MturyyoraQgfjvgSndqhzfwM2ICkkZjYpaXUCX0xxyGxjBeefW3CSOggPUFLMB42EJEoGsh7re7
 1qsxIW+/7s0wKSOmfeKRi2INLKlPQmV0XSCU8sXsymzl/nYzzNmI7CMHm8UWLrrSuq35i8mwOzs
 1Bo5wNEtidv/8asxckXt0Y6nXz9mGEPljGWH9G6dnmBdPrAbgnBN0wPCAS6o20mCQyi5/ZT+TRs
 iJ0s/HKlhe2z6wtAuwpgnYy5F5iZPx7LJGLcXrxo1zIoG4R54H+X0pX4lBMw68x3yQY8eNDXShs
 eWGxyZPOUvbFhPZgAev0MY3rGHIR9lm3A90Z9TtyVn9DizeAFzgdQ3H0I9fKbkcn5HyonZsdkdA
 eAUvtGGnOr4lhaii1Cw==
X-Authority-Analysis: v=2.4 cv=G5cR0tk5 c=1 sm=1 tr=0 ts=697c8bad cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=H2taRdZ_j9poMSv-UmkA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300087
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91274-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[f410000:email,8a00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.1.21.88:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,7b0:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.131.57.192:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C36AEB981E
X-Rspamd-Action: no action

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v6:
	- Update the 'sram' property to point to the SRAM region
Changes in v5:
	- Rename the property 'qcom,imem' to 'sram'
Changes in v4:
	- New patch
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 90790f99f0597b63801d4e07b9b72cd372ad46d4..dd91113c770502346dc4c65bd447a14bcbec4a27 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -591,6 +591,7 @@ watchdog@f410000 {
 			reg = <0 0x0f410000 0 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
+			sram = <&restart_reason>;
 		};
 
 		qusb_phy_1: phy@71000 {
@@ -704,6 +705,10 @@ sram@8600000 {
 
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7b0 {
+				reg = <0x7b0 0x4>;
+			};
 		};
 
 		usb3: usb3@8a00000 {

-- 
2.34.1


