Return-Path: <linux-arm-msm+bounces-94777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNdrOor6pGlIxQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 03:48:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B901D2890
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 03:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED40130053CB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 02:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853B928D8DA;
	Mon,  2 Mar 2026 02:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LWOgcwqW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LOb2Hiuc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F22176025
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 02:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772419627; cv=none; b=IAJR4NaZEpSUSB+DMBCiGMXD4L9XdGidAVFKzew8gvvsZYS2azXlhVjUfUDw39U+3PGwCFzNn0aEsqG3Pytsvdt00d/TniHtVgMH0W44TdR61FbL1WRbAJx7Diw0HudPLSkCGSFTpNyamWqXt14qupKGKKmPH+2hIoaPI9JQTZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772419627; c=relaxed/simple;
	bh=E1qxH9Rxqp/WVoPXq2XiuAEUIfqgRisB2c/DoZN/pFc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cP5UDbAYognYVxuPk0bKWB3dM4Af9jsUd1T8LVlUFRaYBn2dtSGOqNph7TbFOUA0L+n7vnolHiGhws9PsEJraZukbhEGGk0CA7s/PBTjZN4zB2zywELKtEwK+yBklOqnIhqrV1E1laybv8YybFBdGKNP6TlNJahbYlZHjW3R5Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LWOgcwqW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LOb2Hiuc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621MUDlJ2392738
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 02:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GvCgDjdGX42ztielkrXm2FhQj0uEUDj0OeI
	5oSwBSTs=; b=LWOgcwqWd8rSxMZk4oVeKZm6w+p3j4JDSxnbNkWXSmrQ8XovUD6
	CPUTj2AjlwjGle3EVLfJ4pAnwu8VjdpHglvlMSEmtl99MAhmC47enI8+eGBKEXVC
	fItVZPx/bDnlxedsILKd+ot+VhTSqioPpUFtyniwVvWcAIdVT7+QJPryLg7Js6NR
	DMQXpDDDp6iUc37xwsYnf/2XyGgqk/YQYoEvkI5TCmsUoCBeLYav4NAalTBbnwzV
	3nH/ho1qjmbxiqlexlxIUuG+aInOVhnRhInYWCZorxsgV4Dlgr6oWIM5kGBvExQD
	60uNFNMb67sukN880iVc9MbzKtatFLf1TMQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgq3seg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:47:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2be059afe26so52972eec.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 18:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772419625; x=1773024425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GvCgDjdGX42ztielkrXm2FhQj0uEUDj0OeI5oSwBSTs=;
        b=LOb2HiucgqMrdewvZOf+w6Xqu9Mp24Bk7zgmXeA+AqrWuPr/gfMigxUUCCOg9IfpnZ
         HFVOtRWYrqZV8C4n4fZxcvB9cLXxaSIbTM2Nzhqdx0zBClgxa5lR+OMfOMuPXMwZ5G5o
         zCnpI1FymTHIM0zitbXbchlabuhSl/Q7r9kNsI/G/DLYh77vKCsCmXsMd+9CMd15Rmsb
         XiCTN0mKOTVJdu0XwbK+wofD+G5QiWeEVriYQfiP+3h8snFLyeHNKuDVgmt/QquXVBwK
         IR8wmJx9UM9IFEkoxPo4RxiQQ6erh6d3XVAbCCDG/p3s0YD8qvZ8+Q8N3PPbA2++4XL7
         D1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772419625; x=1773024425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvCgDjdGX42ztielkrXm2FhQj0uEUDj0OeI5oSwBSTs=;
        b=kQKTbEgdrYbledV33JR5whfz62HnWq+R2D8DrJQx/9bbfYx0M8hj4IvSLmDFCc0I6X
         Fczw7+pI/f+vXwS9kN2hyfJTrU8HhIp9sDxFat6T58mDkB8m1tPlGeNjV5UMftevx5Q3
         XLRGbXNynwaG2DbkLvyNH0qF0WlOKZ05OPcZGjAy9QC89TUCnjxBeV16xaWOEFbMFCsv
         ok3b32kAwhiNFSKT5/PZ6BlK6X2E0qIphto2aX1/+LeBTde/zIkgUykQ75C1qEGPvVHF
         rrrtD2TVHN98NTi6VKKA6ovMm/cAislebRFGDEtfInV+jGbQSg4aZ5JRvx3nGJuOe/Zh
         SwWg==
X-Gm-Message-State: AOJu0YzslVjBEtVOIjIR1uaviHhAn3cCdkkfrXm1/0XDUY3T/aHmIy/g
	Ejau/lKfXtlYGMZhKZNmH8D+jESNNnI6bMjxb4I9hBcNBoY2qTx5GPvyOjXZaOh6HItW7nrLisz
	NmmqSH8I6pwshkyCGMomU+/NhDgWCTeGgbVYzGokM3jVkOHywxax/mIJsrSRDh42Eff8w
X-Gm-Gg: ATEYQzxj5bntaiblJLODFJyQ6fjsBnfQNJtO1RpiFHXGI757M1hdBIZxSl9BmJQtn8t
	ZhOhkH1OhRYjGNZoTfLNtsHCA1Td8XZ+6Yt5f5DU6clbjKyVxo7c0tzgkEnMVyFajzbgQ/FuxHM
	fO3ujDvqcPvLiJsGgPwBrL0Xmyb/IRtwyhvlvoexePhtNog8Ff5P/uV7SyfMYMlO5Wo3yNnP1WD
	v/ETxqq2MrGurlczrhlk4d0lgZq8NUj+q8V2zaucqxv7u+ocNdUMfbcM0wzo61a/DBt47FjJ+9b
	p1Lc7aF8/WvvKhxv8TLfNyR1qpJ+zer9+KTUPj3oXrA994mWxB0r/n7eGrgtN91bySpYAe8Df9Q
	7p5tVWWlUIIu/5rVpPaZI5RY+YtEwJPilbtGeUm3zkqWS
X-Received: by 2002:a05:7023:b06:b0:119:e56b:46ba with SMTP id a92af1059eb24-1278fcd91f4mr2302122c88.4.1772419624782;
        Sun, 01 Mar 2026 18:47:04 -0800 (PST)
X-Received: by 2002:a05:7023:b06:b0:119:e56b:46ba with SMTP id a92af1059eb24-1278fcd91f4mr2302102c88.4.1772419624173;
        Sun, 01 Mar 2026 18:47:04 -0800 (PST)
Received: from hu-weiden-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a43885sm15274748c88.12.2026.03.01.18.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 18:47:03 -0800 (PST)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-pm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V4] arm64: dts: qcom: qcs8300-ride: Enable Bluetooth support
Date: Mon,  2 Mar 2026 08:16:58 +0530
Message-Id: <20260302024658.2836798-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nMZn7fK4IMjLMEDfjAux9pLKb35CTbN8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDAyNCBTYWx0ZWRfXzLpl0GvasRnl
 4l0F2ywA5XjVXfwEdF0Q3Bij95G614/UblcK5LqVw9Lo1QbiuqrzMFfot76BvXCzD28feYxOJa4
 ajQSd9oS40Fts7QRX3hVH7VxXirMHGgJfwqyAt8GpQEYoSv5/F7Zn6yFyMjZeFyCPhe+eDPhl2E
 puvZn/wxiWxY6F0Z865v9tsv1UGQ9qYZGpVZYo1QdA6wXe13caGjEb5kaAeWR72lXxggwqrj0w2
 ORdwlr6djYuoeqx44ECqlySR7FbPf9wMbpQzenrW5nYIU172MWdrBst3PEJVk8dFA100Os66ZcB
 Ys9mwQoBsLeUmDphTmHaYQYkbOdS3BR968FngPyAZVkQ98eAdFkpVlik1JpIL0HjXV5RoEMafyC
 EMgmHTs3yerAqSo6GB9RoFOOiyVHPpSjeevnSPImKa+KSaF3jb4foH+0SV5OtMVPVAxh/8wV+0c
 icAqS/oGg7y5pP1KtOA==
X-Authority-Analysis: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=69a4fa29 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lDHZPWx9vk9YBGX9cKsA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: nMZn7fK4IMjLMEDfjAux9pLKb35CTbN8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020024
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94777-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 50B901D2890
X-Rspamd-Action: no action

Enable BT on qcs8300-ride by adding a BT device tree node.

Since the platform uses the QCA6698 Bluetooth chip. While
the QCA6698 shares the same IP core as the WCN6855, it has
different RF components and RAM sizes, requiring new firmware
files. Use the firmware-name property to specify the NVM and
rampatch firmware to load.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
This patch depends on:
- WLAN
https://lore.kernel.org/all/20260225071459.1600394-1-wei.zhang@oss.qualcomm.com/

Changes in v4:
- Rebase patches
- Add an empty line before the bluetooth subnode (Konrad,Dmitry)
- Link to v3: https://lore.kernel.org/all/20260225091700.286108-1-wei.deng@oss.qualcomm.com/

Changes in v3:
- Rebase patches
- Remove unintended 'output-low' from bt-en-state pinctrl
- Use prerequisite-message-id to replace prerequisite-patch-id (Konrad)
- Link to v2: https://lore.kernel.org/all/20251118140406.1551669-2-wei.deng@oss.qualcomm.com/

Changes for v2
- Update commit message, add firmware name detail
- Reorganize patchset
- Link to v1: https://lore.kernel.org/all/20251113130942.2661069-1-wei.deng@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 2ed1015b3465..01ec10dd4879 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -18,6 +18,7 @@ / {
 	aliases {
 		serial0 = &uart7;
 		mmc0 = &sdhc_1;
+		serial1 = &uart2;
 	};
 
 	chosen {
@@ -108,6 +109,7 @@ wcn6855-pmu {
 		vddpcie1p3-supply = <&vreg_conn_1p35>;
 		vddpcie1p9-supply = <&vreg_conn_1p95>;
 
+		bt-enable-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>;
 		wlan-enable-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
 
 		regulators {
@@ -560,6 +562,12 @@ &sdhc_1 {
 };
 
 &tlmm {
+	bt_en_state: bt-en-state {
+		pins = "gpio55";
+		function = "gpio";
+		bias-pull-down;
+	};
+
 	pcie0_default_state: pcie0-default-state {
 		wake-pins {
 			pins = "gpio0";
@@ -635,6 +643,25 @@ wlan_en_state: wlan-en-state {
 	};
 };
 
+&uart2 {
+	status = "okay";
+
+	bluetooth: bluetooth {
+		compatible = "qcom,wcn6855-bt";
+		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
+		max-speed = <3200000>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
 &uart7 {
 	status = "okay";
 };

base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
prerequisite-message-id: 20260225071459.1600394-1-wei.zhang@oss.qualcomm.com
-- 
2.25.1


