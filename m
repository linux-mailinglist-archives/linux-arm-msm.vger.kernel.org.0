Return-Path: <linux-arm-msm+bounces-93710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDVfNTpqnGmcGAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:54:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FDE178497
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 379FC305B482
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3975263F34;
	Mon, 23 Feb 2026 14:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JmjSKREB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gi+sy7Cm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2080224A069
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858473; cv=none; b=Wii3E8g2UDnXWG4lz8ji2eMP/Vijikp12EKKNXwayzsHoeEKN75YGG9wrfWDFjqsVu2Pr1c21/6phrwnP8WU95kJhW63I2Swhab6ywQqcgCjKOfZ9Dt2g3NWYR/nfuzq9EHN4v7lbZDjsyitWj/SjrmceyzVIyYAOc4Mp9oDEFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858473; c=relaxed/simple;
	bh=RhpJ/E2AORggDiyh37Au9PnwOibTCVNTpG8JY3R245A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V3Lf3wQTqiR88uwbXRAei5jr/Hwe61P0oXpLLZQ5cI61XbI1wZ36WG7sIpIuROBJddaD4KkoX/SZHUDhUuCVdwL+vJdiYO/jc60sbav43cKeVSql/fV5hrJgRaS1UVjf53OlOUF5qsIUsTVqCGfoopLh7mQNgZJH+JAjHB0Ex1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JmjSKREB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gi+sy7Cm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYc4q322188
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2VHQyVBKwAa3zzQ8tmiECTh6nd1rW+Vh3YzI9ViFQoA=; b=JmjSKREBAf0WWX/6
	Cua/P4vI9wVc+/bf3QvOex1hcBVKvXQe2i6WNqUrXy/uKrX96B1u/Jp1u27DEJUe
	OTQfADilgRGEdDubuMVoZD/cd4ZSt+hv57eYx2DUvLdsUc4zGWMYLPi0evJvlpvT
	u2aM5tRQq1XZ+LpJxszOmb21H+IZ/As0wLNtSMW/juP+rn+YW+Men41foRVaXQIU
	rvhRjhseqG7g6RzzeoAueuOAkkxmhy1Fe84hmokhKMVxJzZYpW8iYASzJ9xNibF3
	+y/vbdanUfo15k7oAXZNlKg7YQrHTqgIjfnRXNTCInBsKf4Zk7jceUvbitWVdx7l
	2exe0w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y0pk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:54:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70d16d5a9so3847716085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771858470; x=1772463270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VHQyVBKwAa3zzQ8tmiECTh6nd1rW+Vh3YzI9ViFQoA=;
        b=Gi+sy7CmU5fiSlmPDUa6wGjy0Qx8q/o9R1CzjMT8Xh4yd7g9VJVSEhJN1MlvI0pVPv
         m4iCavWiCeOQhI4mMm2ypfVZYWNAWeyfi05jzAILwX3H69cDb/LEYW+oXJUCHJM8aoQX
         3jCxaAYxBxIjpuS5Nip0Bra3vQF7A/yu+9hCiaLdcu25fIJyvDYv/wGsdpNyCHDbXUN6
         B3dep9ThWMAgi5I3CXAYWnV/t4fdY9oZn8KyymyGrGLAyM6NZa7w0QMjeHg2nbIZVkcm
         QM2g0VEOmTTDl7O3WblIAu9h2Sn6M8+Qn8g1MN5E2nbe89nG64G9qUH1moMSj+S/MapP
         NgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771858470; x=1772463270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2VHQyVBKwAa3zzQ8tmiECTh6nd1rW+Vh3YzI9ViFQoA=;
        b=xE6K5/yNCZCvN7nVmSdg1QEC6pZWGGnDkW/ANfXAyVr2a1BhtgtyPQhsPyXdNOUCyE
         vkDTeaIZNKFt31gjRT73bHV7mmTyWqd2r7cquMjk/odfdG4Vmz6CplpFVVoPZkxbKyR/
         9Z+iNmp1TDv6lKbozp6eVXIc1f0za36d6MIfifFw9WMJitwJwKbpFo39W+DI+OgEWa4v
         D12XFKZPtiwZDLvYLgn/3uIhS0Ef1HgsRw6TYr+Z7f607UyARwf5n1R5NCMmk+AJd+Ge
         6SpLJ+0UPNBzmdT76gT00pR1fFWS0a0QQoPepUc1qe1Azttx9wAskEP5n4RMmCryBOR5
         m9MA==
X-Gm-Message-State: AOJu0YzozRxU5xUqWchrEtPVOLtamCawwKt5A9npyBtrQ++urLgb6ShQ
	lK94QKkOJXY003XO/WTzIHXYk2Xy5CKwcz65Cwief/WtqWS5LhFPUbEOUo5om+DX66w4n6PdfIp
	4nPAxBi7Qk3eCrYvUD0pKTOm8jYMfzDIJVh0skQY3zlnwopOMYzZWpgLKODywRvgAIJMc
X-Gm-Gg: AZuq6aKJBZhTjv6EiUcMZD0SZkEsZQ95B7jI01S5fqZJuFug0lXItNganW0Gbo7akVh
	Fwh80tzdAe5Vagod/NRyQMpxUoZuU8C5BWd9miOPmY/iUUxHWbTR+FfAu4ciwZ1XY8hBhm2XIKU
	aLD2+oPHoDpgwpqXRQCc6xOUEZdHAXyLY9OZF28qiDJCVZoEholnQlk0yct1BF/bK1+TkfOiHQ5
	nu8WAQI/m0IW3SLptUyX5JUWR5yhOib1bTN8O5MdGJP49FjgQz6NELdUyOXstWe3Jr7qZQ1k3HA
	FtcT6kcyCM5PhmEsfLJjMB2tm6pLo5qtE3tZK39JrFdrTNiAY1UwpKBZrqDcKEX8tzKdAS1fh64
	w7d5HEo8Eb56RYsxzs7RQXEjleQ8ImJytbvY1GQC7bGynxw==
X-Received: by 2002:a05:620a:2725:b0:8ca:90de:43f5 with SMTP id af79cd13be357-8cb8ca8d5dfmr1316400885a.63.1771858470371;
        Mon, 23 Feb 2026 06:54:30 -0800 (PST)
X-Received: by 2002:a05:620a:2725:b0:8ca:90de:43f5 with SMTP id af79cd13be357-8cb8ca8d5dfmr1316397485a.63.1771858469902;
        Mon, 23 Feb 2026 06:54:29 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb0b88esm1646629e87.8.2026.02.23.06.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:54:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 15:54:18 +0100
Subject: [PATCH 2/5] arm64: dts: qcom: qcs615-ride: Drop redundant
 non-controllable supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-qcom-dts-supplies-v1-2-f90ac885b3fd@oss.qualcomm.com>
References: <20260223-qcom-dts-supplies-v1-0-f90ac885b3fd@oss.qualcomm.com>
In-Reply-To: <20260223-qcom-dts-supplies-v1-0-f90ac885b3fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1961;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RhpJ/E2AORggDiyh37Au9PnwOibTCVNTpG8JY3R245A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnGocAWtrMgLhxOiAUJdnTpF7NdtGimkZ4evHc
 4BbVm9mRWWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZxqHAAKCRDBN2bmhouD
 10ZbD/oC37CLUEZdqT5vTJky6tQcGSLPt1cVpMNaUejrlDIH/69/O4xZ9oigXTGkTntNxhiI7j3
 iaxw0SaeE6x+nUg2cHnhOvItsRRnxjemXkoFfuwM6K5QChsljmXR48vLAQ+uBFwQS/Sob31KfTP
 aBKATqyKKm5v6Ucli+LV6hMCrdHqTiNeIDwrvE0gvHZMzQPcI90sX/RGAuvVM7sD1ndMURjfBQp
 qULR02uLbbYZ86B9J5b6vLbygwivVb/gp5fWXcGpD66EOlhK7+Vh9p7bxdgQEt9DAC00WbhqG10
 lffMtfU5N3i7dftlMzhkr4n3lrCqRrk0BGmovt+yOsL9n9Iqc/AAZ/jrcKEtEYGgEN3Oz/f3y2Z
 L5Yw1X3KK3vAOdxxqEpkmpwvpoNReNyDb7D1FFguIf3rj6ZjW3duq/cREULpTpYq7JnLjekDPlw
 5xF0e4xdAQkXJxyPRXorgbc2kaLIe0WioWkzgGbMFg1L2G77jcmJqFbZV7Vdo9dI1mqYJSEPt1x
 3xuRF/ms2SEr9OjKWptZnMSZWJz3Gst77CphJco2UEOGK9yqMmKy83iUWoROdqH2lhF+ON5R9+R
 cIQ5Oke44DKsFms56UeI6rX3ujgtCPgnLHtkaWWTA4HYLlZaOCmdSGIN40eeHhSxiV7/5UPOcoQ
 JP6IsIqs3mtRICQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEyNyBTYWx0ZWRfX44sBWei7pWiH
 xIiTCWzFtAPwA2oLPol93kpgy2zg2BYiiHv5LlNbYKEko2DJNnXGESJbzcVIqaHRViyYKhEp9vR
 BvQweJyKOiataTLKm3N0DUs1JdoD+ehvaF21p2Yy24Mb36QWtgH6Q46YUyTbuxyso46hBL9cbGZ
 3Qrt91rYixtXU354ZXwvYUlmLSy6FbVQmT/HBSGkkKateLZ8tqOnYTrsG5Tt2DhQkJIMb0TLYrc
 xCTe/nsviHmOoUJujSE9QEnSTTo1O6yZsO0LUS+Q8SW3qOsKvBwkc++M6G7weYlsmLCKGamIANQ
 3GsMwkV+1ccXcyGKHTsDcAdqDUQzpWIOBwnHWUurUMkwVzQ3SQ0VAbi/DBvMHXst8DeYEwDjKF7
 E+DW0ccnPHXe2WOhRUiXgrGeI1Nh08htQRBje0PJPsE5K/xTRYM66B6f9zA8/8n0a3iWe91TJkU
 lf3cm7bxj/GgM6oPDIg==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c6a27 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-3cLnZj8YNrZoULhp2sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: RXW4E5wQu-mMcwD5xI_T8ywd8HEf1QZ6
X-Proofpoint-ORIG-GUID: RXW4E5wQu-mMcwD5xI_T8ywd8HEf1QZ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230127
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93710-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99FDE178497
X-Rspamd-Action: no action

Drop completely redundant non-controllable chain of "regulator-fixed"
supplies, which serve no purpose except growing DTS and kernel boot
time.  They represent no added value and because of being completely
transparent for any users of DTS (except the bloat), they should not be
represented in DTS, just like we do not represent every transistor
there.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 5a24c19c415e..acb16cad6df0 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -91,16 +91,6 @@ regulator-usb2-vbus {
 		regulator-always-on;
 	};
 
-	vreg_12p0: regulator-vreg-12p0 {
-		compatible = "regulator-fixed";
-		regulator-name = "VREG_12P0";
-
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-	};
-
 	vreg_1p0: regulator-vreg-1p0 {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_1P0";
@@ -121,8 +111,6 @@ vreg_1p8: regulator-vreg-1p8 {
 		regulator-boot-on;
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-
-		vin-supply = <&vreg_5p0>;
 	};
 
 	vreg_3p0: regulator-vreg-3p0 {
@@ -133,20 +121,6 @@ vreg_3p0: regulator-vreg-3p0 {
 		regulator-boot-on;
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
-
-		vin-supply = <&vreg_12p0>;
-	};
-
-	vreg_5p0: regulator-vreg-5p0 {
-		compatible = "regulator-fixed";
-		regulator-name = "VREG_5P0";
-
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-
-		vin-supply = <&vreg_12p0>;
 	};
 
 	wcn6855-pmu {

-- 
2.51.0


