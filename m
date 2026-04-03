Return-Path: <linux-arm-msm+bounces-101607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFUIDf5gz2kVvwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 08:41:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D68039175C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 08:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A22130179E1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 06:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D4F346FB3;
	Fri,  3 Apr 2026 06:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNcllLCW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RcHY313D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B36232143D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 06:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775198445; cv=none; b=DHVuNq77DMPUG3R6RLEKGqtDlznO9omKPhyPDaNPRRWgg+h+Ew97Ibnv0Nm/GXApiBW0zrKd8rNKSB/EYn4AEXxdRzToeOHtHXY5HykHaH7OvuIfF+nv52CxNubD7mnhHFr3Q+pNdkzRqte3OClRfhYuBHvj5Jp8NVAviMK+tqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775198445; c=relaxed/simple;
	bh=bPDhPXgl46lmDkY1ccCTPH7wpob9U0VLvsNT//3FoIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u7ISPgyQMlpVqW9/1LbHnmcoYiYqiZ/8eon6lIqpf6rWSslnD8QVpUbGcNzDAJjNgWph8HvyTg3ivaec3EyYcewrCcYIsg9U+UCdYVpoaxVqejsuT1ASBVK5tjhhCrU6q5xj3dX8JevmlUDkvWkalhf21MvgXGQzqIpV+ntspIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNcllLCW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RcHY313D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336Euwo140830
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 06:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U0OjGPGZa4Km5KBADfSjfK
	QEn7OpNDKm4icfB6LIFmk=; b=dNcllLCW17AzZxfSvjXg0LhTReJ73ytGWjym6O
	sUQALxbddtLes8pLYCLjdUtziOdLJ3vweBvBpvyjnEcQ5z8fEQZIvXAP5XKRiHcJ
	ll7cppz7gtm0VcqFmmeFdeG2w8SnBRfFNY25gIFMu5RmTsi+3ySpXOVZK7wlnTXj
	0lsChWHTBXrSNEf6K2Lf1DNglQ4Q2Mz+k5Sgf1PtDL/aFZOgy0XkZELMq6srTdYX
	vpqQ223SNewWkBOGSugDrBoXMkL3tuG/QC78nmrW0S9BwI+aG1gJfrYWXHP7JkQb
	t86w8Tn9U7iV1dtQb5izeDRWsZ4QToUQ2wqnsADe34OXkTZQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y02gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 06:40:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c714cb672so875482b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 23:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775198443; x=1775803243; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U0OjGPGZa4Km5KBADfSjfKQEn7OpNDKm4icfB6LIFmk=;
        b=RcHY313DZRICpHUDcAx6SDAIHPuX7ize9Synni18R7808dxT8hsDHGMORwmowoa/Ym
         G55DGBe2pT5PymGFr9wbkZfg/k/nwCSs4/83QEY4aNVVJvNA0QeIXtal4gGqQWniUZIA
         mTNiBvJYoFr4NU5b8WHGmuQZ7BpBTcxiQ5bysI8mbyTBol6dNXB7mGvebPj9nfyE2ZkQ
         /xMNQCGj/WHIlXaULnK6S2anBP01GOD/juLzi0M6fsM+LT7gh21qr5c2E+1MrboV5n6C
         7O5eIE7DQLqCBffVEZUDRMNm4H2XSogNx1NLyh161vsO2WeEbppaDlRXlk4cD8XwkrWO
         iSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775198443; x=1775803243;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0OjGPGZa4Km5KBADfSjfKQEn7OpNDKm4icfB6LIFmk=;
        b=EBo0VwUa3lOQtxCOjpP154utaHZlw/8h9COytgD2l69vguIWbg6WwipV0iqqlr/mdU
         uCn4qsjw9Zc+49kbpGTYQophVEYchay/Xxs5f9QCLgk9GctXkpddTe9iriisxiun8KRz
         yS7PLEwwRh8i5rD3bYMSL+pFVW6lT5wd6bwEYytkMy2OBvuh5B3OPKXWQbjZCzWmO2VI
         YHvOwt8JLBczCWJ3llhj7YzK7T+zZ+EWLnulvsj8U2ftb6oBr/J9Wjz9Z2b2nCoUy4rP
         Mh/yitYNMoA1ydbBtXLT1Jj8ji3B2DQuA89+vmBbI/8iXL/SslazGTY7uaTrYLkmNVIu
         Erdw==
X-Gm-Message-State: AOJu0YyKCQCnXz+O+rwVAvSpJO/siMwtS9jLbwyURxT8TEQLxyqexrwl
	9wUQ0SDdEt4RfYY64M0nv+SgMY29Gb9V2T8N6yGJgegA+8s5tNuw/XlgndPrCEVkz7THY8gE5Hg
	Nr74OWNxjU/lE+/mw+OX6ksl8IsCFuFXbCRXgRlhtTDpGVwQNNs2NOH2GQH1kpZeMtBHv
X-Gm-Gg: ATEYQzxinye0gmNzj2mmq6m3RgSFTfZOF/Qa/FwA4fiPGddZLynZ7zn7RqV+k4W/VbS
	ze1LXfKvg/I1GWS2HXP4p/udtg0ylL/LsKrchSRuxi6uOhb7BFYCeASr5TVM2b4I854sj48QW0C
	SGH2l6k6igWbZUutH5DXainRkLAcfG2/rL3CN/m7CWVnTvOGwFVA6VPyf16T1wzFg8SpCOaTW5G
	mJ5rWLACwilWb6jzn5sT9aSFWyGoN2m+rRCS2izD6kFNhVQ7Uy7hYK5j++l0rc50jNp7CAsQIYi
	8hoaXxGrtIsvcPjjWc7aZoDoqGQruLNXhYpW9db0CLj9o7Z8TmajlgDgpgCrO1obeYrgpZtcmTu
	5/GHv9f0zLTlNTuwwRWpX1aslHo+qnKSM1+WYR24JEd3+srIddpZx41kftQ==
X-Received: by 2002:a05:6a00:b92:b0:81f:4cf5:f252 with SMTP id d2e1a72fcca58-82d0da74df2mr2119193b3a.24.1775198442629;
        Thu, 02 Apr 2026 23:40:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:b92:b0:81f:4cf5:f252 with SMTP id d2e1a72fcca58-82d0da74df2mr2119160b3a.24.1775198442103;
        Thu, 02 Apr 2026 23:40:42 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82d11cd2ce2sm1015919b3a.6.2026.04.02.23.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 23:40:41 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 12:10:34 +0530
Subject: [PATCH v1] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260403-can-spi-kodiak-dtsi-v1-1-4055e67dd3fc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOJgz2kC/yWMwQqDMBAFf0XeuQtJDFL6K6WHmKztVoiStVIQ/
 93YHmdgZoNyEVbcmg2FV1GZcgV7aRBfIT+ZJFWGM64z3rQUQyadhcYpSRgpLSrU+cjcD+7qW4t
 azoUH+f6ud6wWj7/TT//muJw77PsBI1sO2HsAAAA=
X-Change-ID: 20260403-can-spi-kodiak-dtsi-64ceebf28431
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775198438; l=1440;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=bPDhPXgl46lmDkY1ccCTPH7wpob9U0VLvsNT//3FoIs=;
 b=ZBVdQ4ASfsYLhOHWXMGtTMFPVisdtrjkV4abi++C17c1XY69+odW2UeTZ734QIdWwRQm1QyfJ
 yX8J/ldHnuzAx9OkA2SIVrAB/ZIa1fkk0COpmHSMpwgX0a09EZX9s3R
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69cf60eb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_ikZVEo30FcIfUUojBsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: A3DPwhvt6EqLcC0rNeVe4jh_CTgHfjv5
X-Proofpoint-GUID: A3DPwhvt6EqLcC0rNeVe4jh_CTgHfjv5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA1OCBTYWx0ZWRfX4WnrpeBntuwf
 B1wv9QzG0eHWFeARGyCyGp+ObX8jy4fVMMmhlPDRhT1XBR6C56xPvOb6VEoq0xUNuBfTp3LLS+C
 aV3gmvh2bKZvXN4jHgOXvubj7rIxHWnMpQbhhVhcpfS4mjDjPLMyQirtx0yicbQL+EwpvNVQtuf
 oRi5WAOzzUurkpgts2bXQ2CA+JYrKFOG60V2zWbbhVaSYfiiNGlA+Pu288SCNrgjIBYfTPc/NSd
 oy9HDw+G+4t0aR/uol19IVJVzchesNW1ty6JGdPhBr4w0bB7ZrgxYO5J0msWJnGqGq1zXBrLVzs
 R5XlHKbD5tsI/1C0llsCkgj2zYHwJEJ329Hl01r/TMCljA7YIA0c32/P+abH99LNn9wa62ZTGMh
 EKaHdJOfUt0r81wXOYzZdvNud/Q51PJzPjFJ3j295YcLCzIcny679984G4fa9qvgGSfPuatrIz0
 JNM2wwACf8Zvj4mdTGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030058
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101607-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D68039175C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
The controller is connected via SPI3 and uses a 40 MHz oscillator.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e393ccf1884a..ceb68a890bf4 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -44,6 +44,14 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	clocks {
+		mcp2518fd_osc: can-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <40000000>;
+			#clock-cells = <0>;
+		};
+	};
+
 	dp-connector {
 		compatible = "dp-connector";
 		label = "DP";
@@ -1208,6 +1216,20 @@ platform {
 	};
 };
 
+&spi3 {
+	status = "okay";
+
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		interrupts-extended = <&tlmm 7 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mcp2518fd_osc>;
+		spi-max-frequency = <14000000>;
+		vdd-supply = <&vreg_l11c_2p8>;
+		microchip,xstbyen;
+	};
+};
+
 &swr2 {
 	status = "okay";
 

---
base-commit: cc13002a9f984d37906e9476f3e532a8cdd126f5
change-id: 20260403-can-spi-kodiak-dtsi-64ceebf28431

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>


