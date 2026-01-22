Return-Path: <linux-arm-msm+bounces-90112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OB1bO4e3cWmcLgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 06:37:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7613462049
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 06:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5C05A4F759B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 05:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA61478E57;
	Thu, 22 Jan 2026 05:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGXBKSUL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ev5SfbKe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922F5477E54
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 05:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769060196; cv=none; b=IMn9ixnSR23en2zepucKw1vJK5TqgxYOS5nILl0/E+CdJCnsG3rDQBoYy5ObEt0/cYapArWrsj+mLwBRHzxH+ars2bpZCNC5YIjxABRUdedqhEt9Ux7FWIBsqYH0vvly6lbx+wMbAjbVaAT69k3TluJ94Y0HzmAguHVQJy7bdLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769060196; c=relaxed/simple;
	bh=HdPBmSbbbUJZLGi50kGYZS+6s878YAqGZGx7WUM/YB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fPL7cUstFoc7gJ12tGNhI/wF1R+PmqVVfs66ACdTS5+jNpMcr2iCpjAbEF63eMHejwkrEf5miCIHZXZYjxA4OWLyj7jS1det4SzjdGssZHIibNCITlCFZKeUvMyDPLPUkoRfsQ3yqfyQY6X0FBCjb9k31F+BIVlchsXDFKiJPXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGXBKSUL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ev5SfbKe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LNT6VS2727071
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 05:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=a/CSaUDzfgYGuTTeVU4tENKnC6dFEA0wxlr
	KdJBm4vk=; b=BGXBKSUL9pvbtdNFHRPvZhpfXWq3QrN4CtCyXEX7/t+g6tj/f+H
	qVrW+aXM0XLtXw/9GIbUDp64Zxb1HGuAPSomJjTRYTQ7Oi9ONcI10wOBMyNiS0d6
	bzuSkSo7v38brL6XtEvD8qrRtmv6PT8x4VBx3Dz00kNJNM/l2ZsaDI8VyZ4z6Pwg
	jUb72HlUgDvqHVv45atjglOeG7WZ4Jtrx5eP0iV6fsmNaooLTewnbfmk5LvJfyxr
	Spk2D1yB2iNpXgJOXdDItBCGZrqPn9a5fwAhXv2kQkvjj9MXF+cXyM+HTRYsc9Gi
	z/UMEIXgdIRwmVdz0UVkTtZgOYioq9TwddA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btysftqrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 05:36:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b6a8afb513so819202eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 21:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769060191; x=1769664991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a/CSaUDzfgYGuTTeVU4tENKnC6dFEA0wxlrKdJBm4vk=;
        b=ev5SfbKe8IM3IIiuiYV4QA4ievrSui59MMjPEZCVQ5SQw7amWpBvmd9j20MVDLaKXE
         +V+8miz4KO+dAMxaUnXcs2H1Qt6AraPKNmRFaxaxLAE8BS8qVod2IEl7/pdZJxjwo1mJ
         1Gbq72/pJqFzyPuX9Xa331uqBKeh8kJF1sCic0UfP0EpklpgkF83212bD7X+4Xs6vIaB
         zE2jIeNcHV1y7OhGUyHDP/nVeq7+IG3Rsr+bz2b8lrgi4sD3y/gBtxmouNBtIchGC9ot
         mhzhQ0lQ1CERYv5kPsvH3KV0iHO0a1SjE1/PFa8bUQ3UNBx8IfW37D9L5ZTCY2YGnsy+
         F+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769060191; x=1769664991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/CSaUDzfgYGuTTeVU4tENKnC6dFEA0wxlrKdJBm4vk=;
        b=VhX+sSPp0W4/f6G4NCFWo2lcYev0CGnT/f3pVtreDjwmts+pnPJmIkrFA970uAYRM1
         SzPcM5svBXfwAggY8rnc5pVWHz65uV1Z2ScmotawrGqrLX8F4Tzs1bNBnFq3wEQnmntZ
         R3WGjpPE11L4FWV8uYrV63JOS4CM0y4FV213RGAS51wEmuI4zFHyUPA87hrt6HvYlfoP
         pmVRFgNjc//Effw80MlfCWp92lT9pPfU0Nro+fQ8St5hUYwI5N9aZSZmG5YF9LZMRogJ
         lXGNeG6oIPZlcyJdCieNHR+UySOaV5dP9nvbNzUOKOIxazHE8VDXHmh0tty4afz0emV3
         yrgA==
X-Gm-Message-State: AOJu0Yy5nujVjE1+mtkzocB8RH8WyMV/8YUIwHdUumOkWrLo0GPFx/hs
	1fbNz0WBJynDnkXlKCbiPOxCf+5iYgVAaJa+/tK/2oEJyS2/bJTGYnBOrWJxcp+vC4zNPOstr6H
	0ulalT+8axadWeP7lDFckTxP6Ek8MAqzpVRLlW4PUbwMS7HasRmN1EewermLShIZ0t53J
X-Gm-Gg: AZuq6aITagkJ/AYZMwn2iXyZd2MJ7Jjir/vY5Q78YB92Ya4IZ35nuHj8VWTH5kyAQtO
	/hTzvRfcRlVZkNPQ+p4MtPC2zieH/D+n0m8NvJ1U+2gl1q5+OVzluT92yA9ov3QQat6UHkWX7Ae
	r/t+Y3JG4Dhw62MtrUuAmjHSkc36CQhGVKwr3iW6DYpsv0vz6U//MWHno3hJCjriJo9PoUYxtyj
	NqheVlqQ+VCHKAwZ5jBfl8gk76QwQbqzgRrjt0yl7jEyXd/hB70uYE0qUlVu83jTxT+zwW8q/nX
	S2WUQ8/i6P6gKj4sSkcvs6gAxEmUuH6sDAW6MgHer4sDOsUw8RxsrNHo/rgKLgyjaAsXSA+ucFl
	eCgnMm9C27baEjZTVQEt0m3PK/RWc8kmUSmLRqXj5Lux+CidhNcTw4LaxEQHB/oU24A==
X-Received: by 2002:a05:7301:3804:b0:2ae:5d3b:e1c6 with SMTP id 5a478bee46e88-2b6b4e64b90mr15721917eec.21.1769060191190;
        Wed, 21 Jan 2026 21:36:31 -0800 (PST)
X-Received: by 2002:a05:7301:3804:b0:2ae:5d3b:e1c6 with SMTP id 5a478bee46e88-2b6b4e64b90mr15721901eec.21.1769060190578;
        Wed, 21 Jan 2026 21:36:30 -0800 (PST)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502d22sm24190235eec.10.2026.01.21.21.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 21:36:30 -0800 (PST)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wei Zhang <wei.zhang@oss.qualcomm.com>
Subject: [PATCH v9] arm64: dts: qcom: qcs8300-ride: enable WLAN on qcs8300-ride
Date: Wed, 21 Jan 2026 21:36:24 -0800
Message-ID: <20260122053624.4068718-1-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=N8Ik1m9B c=1 sm=1 tr=0 ts=6971b760 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=b5B5FA7t-L3a07aDtOMA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kUhIdkDlJGJdML66lgo-ISboc7TxcvS8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAzNCBTYWx0ZWRfXxjFa5LSymtHT
 xsbxJWPP54zWId8mEgpAs3PQi9h6A1dYxhZHRYH1BvvHpmDHOB3K3whedrWAqzFpoaRkUWA7y1r
 cDS+CfuyMQMnTrk6h0XSE7ruly+dBmGWYMty/Rs6uGra376mAHchnaZ1UIi7WA67AyGdNqHQ+0w
 orsKTCXTilF9+69tMD/65ERMaz2a/npR9P5vOxdWf5Oq2pI6JhekSP9l/NUWRHjS4E0u49/xMne
 mHDLpqUaNG01jcOg02y5vKVC3+BUDCRGn3JmJv2HilFKrs9WFO6Bfzsl6Dq1lyF8HC1CFcW2bLB
 f2nnBlxYWLIkgFtOjUrUFkEmXMdASFD3goXN0l4t9BWHR2xOzifziurjTxLoOszcTlOH1hbiW5T
 y4VOp1QGt6XcR4pgn3WBMq0KwtafQybPvMrAo3obtyfjfRVq/0n4j90P1wez7iYt9H+2NgZpTuu
 cjtNPtf7zPgB1oNAA2g==
X-Proofpoint-ORIG-GUID: kUhIdkDlJGJdML66lgo-ISboc7TxcvS8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220034
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90112-lists,linux-arm-msm=lfdr.de];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NEQ_ENVFROM(0.00)[wei.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7613462049
X-Rspamd-Action: no action

Enable WLAN on qcs8300-ride by adding a node for the PMU module
of the WCN6855 and assigning its LDO power outputs to the existing
WiFi module.

On the qcs8300-ride platform, the corresponding firmware and BDF
are QCA6698AQ instead of WCN6855, which have been added in the
20250211 release.

Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
---
This patch depends on:
- PCIe
https://lore.kernel.org/all/20251128104928.4070050-1-ziyue.zhang@oss.qualcomm.com/

Changes in v9:
- Refine and add precise descriptions of the WLAN voltage rails
- Link to v8: https://lore.kernel.org/all/20260120070650.3192679-1-wei.zhang@oss.qualcomm.com/

Changes in v8:
- Reordered regulator nodes to maintain alphabetical consistency (Dmitry)
- Link to v7: https://lore.kernel.org/all/20260119090758.2780678-1-wei.zhang@oss.qualcomm.com/

Changes in v7:
- Align regulator node names to match the existing naming style in the dts (Dmitry)
- Link to v6: https://lore.kernel.org/all/20260119080125.2761623-1-wei.zhang@oss.qualcomm.com/

Changes in v6:
- Rebase patches
- Remove unintended 'output-low' from wlan-en-state pinctrl (Konrad)
- Link to v5: https://lore.kernel.org/all/20251113055148.2729943-1-wei.zhang@oss.qualcomm.com/

Changes in v5:
- Rebase patches
- Flip the order of property-n and property-names (Konrad)
- Flip the order of bias and output property (Konrad)
- Link to v4: https://lore.kernel.org/all/20250325075331.1662306-1-quic_stonez@quicinc.com/

Changes in v4:
- Rename the symbol pcieport0 to pcie0_port0 (Konrad)
- Adjust the property order in node pcie0_port0 (Konrad)
- Add to the commit message mentioning FW and BDF used by QCS8300 (Dmitry)
- Specify the calibration data using the correct variant (Dmitry)
- Link to v3: https://lore.kernel.org/all/20250318093350.2682132-1-quic_stonez@quicinc.com/

Changes in v3:
- Complete the nodes property definitions according to DTS binding requirements (Bjorn)
- Link to v2: https://lore.kernel.org/all/20250227065439.1407230-1-quic_stonez@quicinc.com/

Changes in v2:
- Rename the nodes name according to DTS coding style (Konrad & Krzysztof)
- Provide regulator-min/max-microvolt to the regulators (Konrad)
- Link to v1: https://lore.kernel.org/all/20250210062910.3618336-1-quic_stonez@quicinc.com/
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 130 ++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 68691f7b5f94..f8f021cfdf21 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -24,6 +24,50 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	vreg_conn_1p05: regulator-conn-1p05 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_1p05";
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+		vin-supply = <&vreg_conn_1p8>;
+	};
+
+	vreg_conn_1p35: regulator-conn-1p35 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_1p35";
+		regulator-min-microvolt = <1350000>;
+		regulator-max-microvolt = <1350000>;
+		vin-supply = <&vreg_conn_1p8>;
+	};
+
+	vreg_conn_1p8: regulator-conn-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pmm8650au_1_gpios 4 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_conn_1p95: regulator-conn-1p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_1p95";
+		regulator-min-microvolt = <1950000>;
+		regulator-max-microvolt = <1950000>;
+		vin-supply = <&vreg_conn_1p8>;
+	};
+
+	vreg_conn_pa: regulator-conn-pa {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_pa";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pmm8650au_1_gpios 6 GPIO_ACTIVE_HIGH>;
+	};
+
 	regulator-usb2-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "USB2_VBUS";
@@ -33,6 +77,69 @@ regulator-usb2-vbus {
 		enable-active-high;
 		regulator-always-on;
 	};
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6855-pmu";
+
+		pinctrl-0 = <&wlan_en_state>;
+		pinctrl-names = "default";
+
+		vddio-supply = <&vreg_conn_pa>;
+		vddaon-supply = <&vreg_conn_1p8>;
+		vddpmu-supply = <&vreg_conn_pa>;
+		vddpmumx-supply = <&vreg_conn_1p8>;
+		vddpmucx-supply = <&vreg_conn_pa>;
+		/* WLAN rails: 1.05/1.35/1.95V (nominal 0.95/1.30/1.90V) */
+		vddrfa0p95-supply = <&vreg_conn_1p05>;
+		vddrfa1p3-supply = <&vreg_conn_1p35>;
+		vddrfa1p9-supply = <&vreg_conn_1p95>;
+		vddpcie1p3-supply = <&vreg_conn_1p35>;
+		vddpcie1p9-supply = <&vreg_conn_1p95>;
+
+		wlan-enable-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -327,6 +434,23 @@ &pcie0 {
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+
+	wifi@0 {
+		compatible = "pci17cb,1103";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+
+		qcom,calibration-variant = "QC_QCS8300_Ride";
+	};
 };
 
 &pcie0_phy {
@@ -461,6 +585,12 @@ perst-pins {
 			bias-pull-down;
 		};
 	};
+
+	wlan_en_state: wlan-en-state {
+		pins = "gpio54";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart7 {

base-commit: cf38b2340c0e60ef695b7137440a4d187ed49c88
prerequisite-patch-id: 0e8aad7b8514142fb33c17829386f17c3a55127a
prerequisite-patch-id: e641f09d4139ac77c34757bd08af2db746de3963
prerequisite-patch-id: 4d16e87cf6213d6e25b2c40e2753d4e629778d53
prerequisite-patch-id: 40187dae2c9518a10866104b9fcd5a481ac67d51
prerequisite-patch-id: dd3bdf2aebda74f3603aff24a2c9aaa7f4fd6763
-- 
2.34.1


