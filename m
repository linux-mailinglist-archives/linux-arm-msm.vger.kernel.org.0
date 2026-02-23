Return-Path: <linux-arm-msm+bounces-93649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGuwHSknnGlzAAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:08:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A2D174931
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D8EC305B371
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13A635D5F2;
	Mon, 23 Feb 2026 10:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PG0/rU3+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739433563E9;
	Mon, 23 Feb 2026 10:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841191; cv=none; b=o1qZ3+GrcjY1GlUFeT2CwII5/ZTmqYEdVMAoJMJ8DxZaprKuoP8o7SowN45sBfWkqUKExaL8RYupHYdiT54XSKIZu9zhwI/GMl41j2ylOo8qfsBS1Ys3JzEalRvouvUL7v2G2z/FlC7Lp/mgRwZ9/O8ipnAyXVYkU50n2sXpDh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841191; c=relaxed/simple;
	bh=Zsu+pBE0qiZjcPV76vWnzfK7mgNqNPRSujAL07Y/P/Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UZusEBZ5mv3TlWmdkyIsLNpeGJWNG7FtVzrKn987uQzZrvBOZ8gOWl2CF4stXK68F3hERKAAZGEvb5EGUieLJ8bJlImOcWGVrXk1HouXamINEM6mOO4sIM6QRWRbFlg14+n2aVxN+Z8ehp1m74oGiaqf43N/AA1HALk6wSJ8IvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PG0/rU3+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9c18N3234263;
	Mon, 23 Feb 2026 10:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y97j1LEt7cFIK/V1b5V1yJ7kkkM5HiZhfV4QiWYZ88Q=; b=PG0/rU3+G4deESDv
	vj34J46tBTYEqeWHK9WVSadaDS9icGtJ+3ylT7LLmQocupxzpLaaRaPyiWrAwzR2
	dUss6gWMKHKycrS5Re2nFX2tMIfJq/obb75mGKVCqXcqEn1OfE0CZpqVnH8pUzhD
	OFafYtbhQmCczMMTtmeLkdtFE2q9l3MB5VX1Swe2lig2rK7nJayeGFi0gl1toZLL
	FtLtUmzKsCPjBL/wX9QidGAsx9Dln12q5kgru2BNU8zbHB0eBP2VwRD4esCGH4Xo
	7yxd2i+5XGv229tYol1BmmzVt4qscNmPG7muKQERzA1prnUDPb8iRiBNc7erdJco
	lFpwgw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk48x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 10:06:28 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 61NA6RKr030146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 10:06:27 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 23 Feb 2026 02:06:24 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_mdalam@quicinc.com>
Subject: [PATCH v5 5/6] arm64: dts: qcom: ipq5424-rdp466: Remove eMMC support
Date: Mon, 23 Feb 2026 15:35:51 +0530
Message-ID: <20260223100552.1050303-6-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260223100552.1050303-1-quic_mdalam@quicinc.com>
References: <20260223100552.1050303-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699c26a4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=QIVe3DVYhI_-bwApSWIA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NiBTYWx0ZWRfX3ULVfB/IQyIp
 f66og/RnOWdh7YSE5H2V4jwnl7SHXW5DEDu1RtaFs+mnQk1QQbnvSVTyK1druai1Jv+UvHcRsnD
 tvdje11klU3nWbyHFduRp+1JR1HjpzT0dZKy7+brZEqBGCdcJ6jUJWnR8qVv8/BIQII/RiszRDS
 OETDau+Ov/jj8hLssiQYeKXSBk/4/E6YYDn/N4sxlpUV3xB3Y7LfrgWdqCGpO0DxdegJNJbLRcN
 ccWk1Bwf2mSt7SFSAW7xtj47Qn5O7cyNjJT/d4AggxgVX16oCxUwjwKnvRQTTZ6ob/pvdZ1FN5l
 dA3j1BNZUyq5Z2cHYqoehYan4ko5An2hxQcBXBNcQ+nJYjRpUXKVRp68t9f8oblvZF7rRUxf6w0
 xH8k4imhFthf3YjRaw57tTVDHnAYajSzV+BadEXc1eCq4mYsxXDuOWOmRQ7we4XHKPl4hP13JLk
 +gNCpWFNqrKFP0v5qRQ==
X-Proofpoint-ORIG-GUID: cuJ7-LbrskqPBCLOgBDHHb8MnOhNueoG
X-Proofpoint-GUID: cuJ7-LbrskqPBCLOgBDHHb8MnOhNueoG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93649-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[quicinc.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,quicinc.com:mid,quicinc.com:dkim,quicinc.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[quic_mdalam@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 29A2D174931
X-Rspamd-Action: no action

Remove eMMC support from the IPQ5424 RDP466 board configuration to
resolve GPIO pin conflicts with SPI NAND interface.

The IPQ5424 RDP466 board is designed with NOR + NAND as the default boot
mode configuration. The eMMC controller and SPI NAND controller share
the same GPIO pins, creating a hardware conflict:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v5]

* No change

Change in [v4]

* No change

Change in [v3]

* Added Reviewed-by tag

Change in [v2]

* updated board name commit message header

Change in [v1]

* Removed eMMC node

 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 30 ---------------------
 1 file changed, 30 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index 7c32fb8f9f73..de71b72ae6dc 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -124,13 +124,6 @@ &qusb_phy_1 {
 	status = "okay";
 };
 
-&sdhc {
-	pinctrl-0 = <&sdc_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
 &sleep_clk {
 	clock-frequency = <32000>;
 };
@@ -201,29 +194,6 @@ mosi-pins {
 		};
 	};
 
-	sdc_default_state: sdc-default-state {
-		clk-pins {
-			pins = "gpio5";
-			function = "sdc_clk";
-			drive-strength = <8>;
-			bias-disable;
-		};
-
-		cmd-pins {
-			pins = "gpio4";
-			function = "sdc_cmd";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		data-pins {
-			pins = "gpio0", "gpio1", "gpio2", "gpio3";
-			function = "sdc_data";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-
 	qpic_snand_default_state: qpic-snand-default-state {
 		clock-pins {
 			pins = "gpio5";
-- 
2.34.1


