Return-Path: <linux-arm-msm+bounces-99191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KM37CYwWwWn5QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:31:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B902F01D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BBDA301AF57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8167F3876AE;
	Mon, 23 Mar 2026 10:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9nnbceJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xq0umdOr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD0A36B047
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261891; cv=none; b=MFu2moOqGNsVAhnjteDffdJwa/U0Ey1ESnKNWB47r2/iK3X1+0gznZcKt9DS8P/K+WXNK9gLLuxvB12TPpzq5SveTSYhP2c6i/9JZEZn1ONhWI3l74o+5ZhU95mAq0o1eZq3VRIydS46rsYB+w9BG6z+fGR0d6bLEC2JDCA8Sho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261891; c=relaxed/simple;
	bh=Oo+GOEPv+3YIRm8riWtprs5OqB2X6xCUcM3hpN+VDZk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JjSXzRFQMxXIdnQrIPBdUpxpmN1BTzpQ59xOmQYXJZi8SmvAAAeVc/f1mZvpafqGf/lrDRAD6J3YnomY5HIS/HP4ig3fUGhZdDodGELnCCps0oX9hm3Xkfsl02SQN1u+RCbf2ZJ7gGx5bGkCesbOH9WQwoU9bll2J/Kr4LjsKuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9nnbceJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xq0umdOr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5m3U0358710
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SJVeF025bhNlwWESFgetVBuQbpWMx7264F9
	qngqZLH4=; b=R9nnbceJKxKx/Fr4VRlnZyMkmKxrpUAaJcQ1jLkZh8AInJBkrPU
	bW3jVEsHQb+Gk8uHFysLW1jKzwTe9rrgekxX8iqwNT0rxRRLix8b9UKWRjHOSrdl
	oFyd+GlpA3KRt/XT5Eend609eR23E5uwCphzoFbW4pZk8SFjFSTYEdjrIH6x2A28
	LgXR+abNlwFtQnUlJ4ATI08wHVSDhtyAveDqoAyJUxRdjzPgzdCgMm3931ZSrTaV
	vscf9SvmXLEN9oV2uYZPTdz3gKYhwFRyVJfQuApgdkQrVH+RHJqn5s99+bfN95ZE
	ULCzRCFUiKPKY41ibgJkMwM/nDoLp8oYhCQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghctt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:31:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b059511554so1435975ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774261888; x=1774866688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SJVeF025bhNlwWESFgetVBuQbpWMx7264F9qngqZLH4=;
        b=Xq0umdOrjqQIqBws2zrHA5Gup+01ui63IHs6i4/gogZVnuHRI/q6kQAkNxXc3TmIkE
         tGpAnXT/qocLVmlp6+RxgFlSyNWuQBMVZm5APT7wVeCC2S9h8TC2uTsHm+hTKILr1NT8
         YdbdA0rbWiOzyO2LIv1ceFOS1jdcz/UfEtIZdAcroFRIWjcoIgFkUccCnx2QHmXJ4+tk
         2Jqn63VF9eQrCbbJ0xwCKX57oxAhGUuG++R3XT1hoBJVNDAswLo8ciijkn/iNIRxiDeW
         bzdSjMQjAwKmBxKptyEB7Ng6XcEWXWfftyCBajvI3yXvhccmgNBvAGj+ifE8mhwlumI2
         eZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261888; x=1774866688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJVeF025bhNlwWESFgetVBuQbpWMx7264F9qngqZLH4=;
        b=sWwgHpRY0zmFA9LYLhL/uxdE4yyyi8Hr0SDwIjF9AI+JbAgZ32mUkvmnxMcR6qS8qK
         BlKJFlRdAahuFTSULDgyyklJvyrfv7Q7gwZxCDClpsqjedeviYZW0ti1s6eN2QruROeH
         JkGKz64VxHa8nTXYaLj6igBzcyQ27jJ+tIuxbzty4JorBlYxN72sd0rzCr08Tq/3/ZyA
         TdwGYoEQT1ennLjYj8cfeL2TaDdvwMrzT2QiB4hREdRq2j5nyZ78SfiJLqhsl82Kg7j/
         YDuUKXAzL78HqhthC0MAmD9nflJ6XCH4kv8NrpKcT1DA2F2IZOMwt8vE0HfvQWk0X8CN
         asMw==
X-Gm-Message-State: AOJu0YzofnwgFOSVvqz6W6eO8hoqedCSAMEqFUjZQpU+8DlVis4liN4L
	UUoTVCbDYXKT4YgHBsnIWs8z4Dv2VZ8caZK+f0xhBBRuz0BhkXnX1tfvCJ61lTipY7zNzFzdXYW
	1OuImnbVOENUgsrsU0kWBhxhuhRxdvQdAE1u8tLBmQK5a76IdtWaLntjVI5fAoTP5yiUL
X-Gm-Gg: ATEYQzwWPucxtS8Aook/3kqpvZ1MgG9PXoW5IWPm8vJUuiKwsPPlO2skojTv9RIr2R7
	w6dUO+uO6TSwBPlglhintGExzZI5kJvqPMpR3RCrU+PoxnJQNzQQX7YOqz+FzBxefHeYkYX9S9m
	6CW3UPTAsTaMQO8vlVAsqwoshBvdbfwkEsDBY6w0ML8yQEJdIJI73gbeYIUROawEr+YX33eGquv
	wR1MeIfjZspZO0OJMwiHsLal2sENhGonCRVhyfU0ZA4RenWXp7ns3p3V6+nhwPMmDfrQB9oxnt/
	VZJq+Hssk4N33CwE3MvpohAJGelpcRWTyobP7wOeQBCjwxcMcxE9IM4JYUJY5q9j2ILGAMzqAxr
	53wxLbrNmzkK6UgKb87tYebx2njZHb4ftjKcJR6tDJfcNRDdGJFlrJ8uP8N0=
X-Received: by 2002:a17:902:f984:b0:2ae:c795:6b4a with SMTP id d9443c01a7336-2b0826d73f3mr78968815ad.11.1774261887272;
        Mon, 23 Mar 2026 03:31:27 -0700 (PDT)
X-Received: by 2002:a17:902:f984:b0:2ae:c795:6b4a with SMTP id d9443c01a7336-2b0826d73f3mr78968415ad.11.1774261886520;
        Mon, 23 Mar 2026 03:31:26 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083655b45sm143143755ad.42.2026.03.23.03.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:31:25 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: hamoa/purwa: Flatten usb controller nodes
Date: Mon, 23 Mar 2026 16:01:19 +0530
Message-Id: <20260323103119.1801139-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c11680 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lPW2TUEchK-Thtz8LSYA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: y93qNYoI_ytGnCqFh0jVeHMl_bpU66xG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MSBTYWx0ZWRfX39TdPft0gYHe
 BBJzqwD+GkBUWvtx2E5Wenry9wi9VzXF4uQzJM/Yfi0NAIIfh6Ey1W8tMvf3vVwCTxqxdJ7WbeX
 SAUSaP4JWEc5GGxxb8W78jkNpqGaXdbIbHdD5rTYRJKWvKOaaL45Vo9M3txfe4P4BPV4DF5v+0v
 uChZRmWPt2TIZWyN/Qhkioc8uDolNWSh+A1QhAJmMXTB3JeX+oWgoH0BGd31qR+Kp/EWdev1PUv
 LC+h96EK44aogTM2fSCgdJihNpsIvszmA0h0lzgwGITuXKjgM5BIbOVNdsfE+3XuB0jRX8K8evr
 OseBZ53iczJdDjtLo027BMWN37TyJ06OBoz8hXbeNzmtPxkFgPNcXNujQ62r7+Wxuk+u4TvjZYL
 oG+9IsToLoxsy2NTxlFFCsCS8zwzJHR8FldXo8UkMrEmIPAmmCD9iKetBVubNSMOkIEdpOxfuwU
 eec326CoNP2dsQk2dSQ==
X-Proofpoint-GUID: y93qNYoI_ytGnCqFh0jVeHMl_bpU66xG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230081
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99191-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A1B902F01D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Flatten usb controller nodes and update to using latest bindings and
flattened driver approach.

Tested this patch on CRD platform. For testing purpose, modified dr_mode
property and added usb-role-switch property to the 3 super speed capable
DRD controllers and valdiated both host and device mode. Also validated
host mode on the multiport controller.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v2:
- The second patch to fix compile warning is merged separately.
- Rebased on tip

Link to v1:
https://lore.kernel.org/all/20251014022121.1850871-2-krishna.kurapati@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi   |  24 +-
 arch/arm64/boot/dts/qcom/hamoa.dtsi           | 296 ++++++++----------
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi   |  24 +-
 .../boot/dts/qcom/x1-asus-vivobook-s15.dtsi   |  18 +-
 .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    |  12 +-
 arch/arm64/boot/dts/qcom/x1-crd.dtsi          |  18 +-
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi   |  18 +-
 .../boot/dts/qcom/x1-hp-omnibook-x14.dtsi     |  18 +-
 .../boot/dts/qcom/x1-microsoft-denali.dtsi    |  12 +-
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  |  18 +-
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  18 +-
 .../dts/qcom/x1e80100-dell-xps13-9345.dts     |  12 +-
 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  18 +-
 .../qcom/x1e80100-medion-sprchrgd-14-s1.dts   |  12 +-
 .../dts/qcom/x1e80100-microsoft-romulus.dtsi  |  12 +-
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts     |  18 +-
 .../dts/qcom/x1p42100-lenovo-thinkbook-16.dts |  23 +-
 17 files changed, 218 insertions(+), 353 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index 7292d823e13f..9c5e77df0054 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -576,12 +576,10 @@ wake-n-pins {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+
+	status = "okay";
 };
 
 &usb_1_ss0_hsphy {
@@ -599,12 +597,10 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+
+	status = "okay";
 };
 
 &usb_1_ss1_hsphy {
@@ -622,12 +618,10 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss2 {
-	status = "okay";
-};
-
-&usb_1_ss2_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+
+	status = "okay";
 };
 
 &usb_1_ss2_hsphy {
@@ -645,11 +639,9 @@ &usb_1_ss2_qmpphy {
 };
 
 &usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_2_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 0efeb7b7ff03..0abdb2b8b61e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -4920,9 +4920,9 @@ usb_mp_qmpphy1: phy@88e5000 {
 			status = "disabled";
 		};
 
-		usb_1_ss2: usb@a0f8800 {
-			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
-			reg = <0 0x0a0f8800 0 0x400>;
+		usb_1_ss2: usb@a000000 {
+			compatible = "qcom,x1e80100-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a000000 0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_TERT_AXI_CLK>,
 				 <&gcc GCC_USB30_TERT_MASTER_CLK>,
@@ -4948,11 +4948,13 @@ usb_1_ss2: usb@a0f8800 {
 			assigned-clock-rates = <19200000>,
 					       <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 58 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 57 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 10 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
 					  "ss_phy_irq";
@@ -4971,61 +4973,47 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			wakeup-source;
 
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			status = "disabled";
-
-			usb_1_ss2_dwc3: usb@a000000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a000000 0 0xcd00>;
-
-				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&apps_smmu 0x14a0 0x0>;
 
-				iommus = <&apps_smmu 0x14a0 0x0>;
+			phys = <&usb_1_ss2_hsphy>,
+			       <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
 
-				phys = <&usb_1_ss2_hsphy>,
-				       <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PHY>;
-				phy-names = "usb2-phy",
-				            "usb3-phy";
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,usb3_lpm_capable;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
 
-				snps,dis_u2_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-				snps,usb3_lpm_capable;
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
+			dma-coherent;
 
-				dma-coherent;
+			status = "disabled";
 
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-					port@0 {
-						reg = <0>;
+				port@0 {
+					reg = <0>;
 
-						usb_1_ss2_dwc3_hs: endpoint {
-						};
+					usb_1_ss2_dwc3_hs: endpoint {
 					};
+				};
 
-					port@1 {
-						reg = <1>;
+				port@1 {
+					reg = <1>;
 
-						usb_1_ss2_dwc3_ss: endpoint {
-							remote-endpoint = <&usb_1_ss2_qmpphy_usb_ss_in>;
-						};
+					usb_1_ss2_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_1_ss2_qmpphy_usb_ss_in>;
 					};
 				};
 			};
 		};
 
-		usb_2: usb@a2f8800 {
-			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
-			reg = <0 0x0a2f8800 0 0x400>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+		usb_2: usb@a200000 {
+			compatible = "qcom,x1e80100-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a200000 0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB20_MASTER_CLK>,
@@ -5050,10 +5038,12 @@ usb_2: usb@a2f8800 {
 					  <&gcc GCC_USB20_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 50 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 49 IRQ_TYPE_EDGE_BOTH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq";
 
@@ -5072,31 +5062,26 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,select-utmi-as-pipe-clk;
 			wakeup-source;
 
-			status = "disabled";
+			iommus = <&apps_smmu 0x14e0 0x0>;
+			phys = <&usb_2_hsphy>;
+			phy-names = "usb2-phy";
+			maximum-speed = "high-speed";
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
 
-			usb_2_dwc3: usb@a200000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a200000 0 0xcd00>;
-				interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x14e0 0x0>;
-				phys = <&usb_2_hsphy>;
-				phy-names = "usb2-phy";
-				maximum-speed = "high-speed";
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
+			dma-coherent;
 
-				dma-coherent;
+			status = "disabled";
 
-				port {
-					usb_2_dwc3_hs: endpoint {
-					};
+			port {
+				usb_2_dwc3_hs: endpoint {
 				};
 			};
 		};
 
-		usb_mp: usb@a4f8800 {
-			compatible = "qcom,x1e80100-dwc3-mp", "qcom,dwc3";
-			reg = <0 0x0a4f8800 0 0x400>;
+		usb_mp: usb@a400000 {
+			compatible = "qcom,x1e80100-dwc3-mp", "qcom,snps-dwc3";
+			reg = <0 0x0a400000 0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_MP_AXI_CLK>,
 				 <&gcc GCC_USB30_MP_MASTER_CLK>,
@@ -5122,7 +5107,8 @@ usb_mp: usb@a4f8800 {
 			assigned-clock-rates = <19200000>,
 					       <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
@@ -5132,7 +5118,8 @@ usb_mp: usb@a4f8800 {
 					      <&pdc 53 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 55 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 56 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event_1", "pwr_event_2",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event_1", "pwr_event_2",
 					  "hs_phy_1",	 "hs_phy_2",
 					  "dp_hs_phy_1", "dm_hs_phy_1",
 					  "dp_hs_phy_2", "dm_hs_phy_2",
@@ -5152,39 +5139,28 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			wakeup-source;
 
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			status = "disabled";
-
-			usb_mp_dwc3: usb@a400000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a400000 0 0xcd00>;
-
-				interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&apps_smmu 0x1400 0x0>;
 
-				iommus = <&apps_smmu 0x1400 0x0>;
+			phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>,
+			       <&usb_mp_hsphy1>, <&usb_mp_qmpphy1>;
+			phy-names = "usb2-0", "usb3-0",
+				    "usb2-1", "usb3-1";
+			dr_mode = "host";
 
-				phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>,
-				       <&usb_mp_hsphy1>, <&usb_mp_qmpphy1>;
-				phy-names = "usb2-0", "usb3-0",
-					    "usb2-1", "usb3-1";
-				dr_mode = "host";
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,usb3_lpm_capable;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
 
-				snps,dis_u2_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-				snps,usb3_lpm_capable;
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
+			dma-coherent;
 
-				dma-coherent;
-			};
+			status = "disabled";
 		};
 
-		usb_1_ss0: usb@a6f8800 {
-			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
-			reg = <0 0x0a6f8800 0 0x400>;
+		usb_1_ss0: usb@a600000 {
+			compatible = "qcom,x1e80100-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
@@ -5210,11 +5186,13 @@ usb_1_ss0: usb@a6f8800 {
 			assigned-clock-rates = <19200000>,
 					       <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 61 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
 					  "ss_phy_irq";
@@ -5226,58 +5204,47 @@ usb_1_ss0: usb@a6f8800 {
 
 			wakeup-source;
 
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			iommus = <&apps_smmu 0x1420 0x0>;
 
-			status = "disabled";
+			phys = <&usb_1_ss0_hsphy>,
+			       <&usb_1_ss0_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
 
-			usb_1_ss0_dwc3: usb@a600000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a600000 0 0xcd00>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,usb3_lpm_capable;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
 
-				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
-
-				iommus = <&apps_smmu 0x1420 0x0>;
-
-				phys = <&usb_1_ss0_hsphy>,
-				       <&usb_1_ss0_qmpphy QMP_USB43DP_USB3_PHY>;
-				phy-names = "usb2-phy",
-					    "usb3-phy";
-
-				snps,dis_u2_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-				snps,usb3_lpm_capable;
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
+			dma-coherent;
 
-				dma-coherent;
+			status = "disabled";
 
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-					port@0 {
-						reg = <0>;
+				port@0 {
+					reg = <0>;
 
-						usb_1_ss0_dwc3_hs: endpoint {
-						};
+					usb_1_ss0_dwc3_hs: endpoint {
 					};
+				};
 
-					port@1 {
-						reg = <1>;
+				port@1 {
+					reg = <1>;
 
-						usb_1_ss0_dwc3_ss: endpoint {
-							remote-endpoint = <&usb_1_ss0_qmpphy_usb_ss_in>;
-						};
+					usb_1_ss0_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_1_ss0_qmpphy_usb_ss_in>;
 					};
 				};
 			};
 		};
 
-		usb_1_ss1: usb@a8f8800 {
-			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
-			reg = <0 0x0a8f8800 0 0x400>;
+		usb_1_ss1: usb@a800000 {
+			compatible = "qcom,x1e80100-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
 				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
@@ -5303,11 +5270,13 @@ usb_1_ss1: usb@a8f8800 {
 			assigned-clock-rates = <19200000>,
 					       <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 60 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 11 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 47 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
 					  "ss_phy_irq";
@@ -5326,50 +5295,39 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			wakeup-source;
 
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			status = "disabled";
-
-			usb_1_ss1_dwc3: usb@a800000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a800000 0 0xcd00>;
-
-				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&apps_smmu 0x1460 0x0>;
 
-				iommus = <&apps_smmu 0x1460 0x0>;
+			phys = <&usb_1_ss1_hsphy>,
+			       <&usb_1_ss1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
 
-				phys = <&usb_1_ss1_hsphy>,
-				       <&usb_1_ss1_qmpphy QMP_USB43DP_USB3_PHY>;
-				phy-names = "usb2-phy",
-					    "usb3-phy";
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,usb3_lpm_capable;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
 
-				snps,dis_u2_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-				snps,usb3_lpm_capable;
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
+			dma-coherent;
 
-				dma-coherent;
+			status = "disabled";
 
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-					port@0 {
-						reg = <0>;
+				port@0 {
+					reg = <0>;
 
-						usb_1_ss1_dwc3_hs: endpoint {
-						};
+					usb_1_ss1_dwc3_hs: endpoint {
 					};
+				};
 
-					port@1 {
-						reg = <1>;
+				port@1 {
+					reg = <1>;
 
-						usb_1_ss1_dwc3_ss: endpoint {
-							remote-endpoint = <&usb_1_ss1_qmpphy_usb_ss_in>;
-						};
+					usb_1_ss1_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_1_ss1_qmpphy_usb_ss_in>;
 					};
 				};
 			};
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index fb90beb1096f..394e65518ac5 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -569,12 +569,10 @@ wake-n-pins {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+
+	status = "okay";
 };
 
 &usb_1_ss0_hsphy {
@@ -592,12 +590,10 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+
+	status = "okay";
 };
 
 &usb_1_ss1_hsphy {
@@ -615,12 +611,10 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss2 {
-	status = "okay";
-};
-
-&usb_1_ss2_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+
+	status = "okay";
 };
 
 &usb_1_ss2_hsphy {
@@ -638,11 +632,9 @@ &usb_1_ss2_qmpphy {
 };
 
 &usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_2_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
index bae6bb4f03d8..48c4ad648354 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
@@ -1233,11 +1233,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1265,11 +1263,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
@@ -1309,11 +1305,9 @@ usb_1_ss2_qmpphy_out_dp: endpoint@0 {
 };
 
 &usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_2_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index d441f860fbed..cd062f844b2d 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -1457,11 +1457,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1489,11 +1487,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index c0c7ddabd8fc..485dcd946757 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1735,11 +1735,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1767,11 +1765,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
@@ -1799,11 +1795,9 @@ &usb_1_ss2_qmpphy {
 };
 
 &usb_1_ss2 {
-	status = "okay";
-};
-
-&usb_1_ss2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss2_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index bf04a12b16bc..343844cc62f2 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -1552,11 +1552,9 @@ bluetooth {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1584,11 +1582,9 @@ &usb_1_ss0_qmpphy_out {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
@@ -1616,11 +1612,9 @@ &usb_1_ss1_qmpphy_out {
 };
 
 &usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_2_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
index a4075434162a..16437139d336 100644
--- a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
@@ -1471,11 +1471,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1503,11 +1501,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
@@ -1519,12 +1515,10 @@ &usb_1_ss1_qmpphy_out {
 };
 
 &usb_mp {
-	status = "okay";
-};
-
-&usb_mp_dwc3 {
 	phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>;
 	phy-names = "usb2-0", "usb3-0";
+
+	status = "okay";
 };
 
 &usb_mp_hsphy0 {
diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index d77be02848b5..6ab595b6ea30 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -1274,11 +1274,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1306,11 +1304,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index d5a60671a383..2e38402e2c14 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -1389,12 +1389,10 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1422,11 +1420,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
@@ -1454,11 +1450,9 @@ &usb_1_ss2_qmpphy {
 };
 
 &usb_1_ss2 {
-	status = "okay";
-};
-
-&usb_1_ss2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss2_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 4d7fd51f370b..5d49df41be02 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1608,11 +1608,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1640,11 +1638,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
@@ -1684,11 +1680,9 @@ usb_1_ss2_qmpphy_out_dp: endpoint@0 {
 };
 
 &usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_2_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 4c95b1af2c64..ce7b10ea89b6 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -1293,11 +1293,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1325,11 +1323,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index d6472e5a3f9f..bd0e3009fb41 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -1571,11 +1571,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1603,11 +1601,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
@@ -1635,11 +1631,9 @@ &usb_1_ss2_qmpphy {
 };
 
 &usb_1_ss2 {
-	status = "okay";
-};
-
-&usb_1_ss2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss2_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
index 20a33e6f27ee..763efb9e070d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
@@ -1413,11 +1413,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1458,11 +1456,9 @@ usb_1_ss2_qmpphy_out_dp: endpoint@0 {
 
 /* Camera */
 &usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_2_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 37539a09b76e..8d4ad80e75d8 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -1499,11 +1499,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1531,11 +1529,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 1d402ef86512..8afbac349cc9 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -1423,11 +1423,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1455,11 +1453,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
@@ -1487,11 +1483,9 @@ &usb_1_ss2_qmpphy {
 };
 
 &usb_1_ss2 {
-	status = "okay";
-};
-
-&usb_1_ss2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss2_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
index 1e5eb8c5dc98..ab309d547ed5 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
@@ -1566,11 +1566,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1598,11 +1596,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
@@ -1614,15 +1610,12 @@ &usb_1_ss1_qmpphy_out {
 };
 
 &usb_1_ss2 {
-	status = "okay";
-};
-
-&usb_1_ss2_dwc3 {
 	dr_mode = "host";
 	maximum-speed = "high-speed";
 	phys = <&usb_1_ss2_hsphy>;
 	phy-names = "usb2-phy";
 
+	status = "okay";
 	/delete-property/ port@1;
 };
 
@@ -1662,11 +1655,9 @@ usb_1_ss2_qmpphy_out_dp: endpoint@0 {
 };
 
 &usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_2_hsphy {
-- 
2.34.1


