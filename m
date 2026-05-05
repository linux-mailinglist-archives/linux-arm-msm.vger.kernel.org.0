Return-Path: <linux-arm-msm+bounces-105967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KrvL7Dy+WmcFQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:37:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAFB4CEA0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBB253054333
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 13:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE68C47DD50;
	Tue,  5 May 2026 13:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8JKRsyH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GumAYdUk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9B547D938
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777988263; cv=none; b=rrbzdFAni88G6o2ptNdTONvOZMtEWloadFvLx6nv37dgiWv5P2IIlRkuBHW4tzDNN2TFz60gPWtj2/LS5LFtnryOgsPzB3pWN8JLoH3qY4SfPD0blTPT/6o1ZIwbmVa83Z+d0L5umw3zyvHTUUCQv0EUq/ExYLpaKQ4b8Bong7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777988263; c=relaxed/simple;
	bh=IrPaTuvjt8nW2l9MfjWwXPL02cR35Ez++6pWKmhCiOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BLN8I6xZ1JPsmdlOZzQOgJpjgbwRz8g84peru4vmmW+wJgNo3A3uRZabRyQR0Ox58sa6fGZex10elq0zuYHQXXxmLBoBG/jksKfXeTnnkrw4QUjaF2EJcMTVTJQgPMW8KzTQxqzObTle3Q3FfMy9+ZgGyqnlzKPWg/deuJVZsrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8JKRsyH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GumAYdUk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645CDnaV2187243
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 13:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WJTrQj+8kovi55EycvL8ft
	qurdIO//d5VuUMdqn1BAE=; b=L8JKRsyHOqOGlrMYfuDY+Wcv1XAVnCLYLnMm/f
	M/4mbA6UkxoImvKTnOCFhM/aHp7Zbq8cbz8A5Q3bdw7P2a8wC6b3hTngj6Uy9lLv
	uIXSwqjhYvR7NVLPzvjdS1d9GSNTWJw3TDQvBNKgUraJQ85E2PjXzQbIEOaPmqTN
	xRRh3ZLeFop3cMFYmM82IJzsFwtHdELJy1cD0+0xCGJyqgJgVcS8y83gfOQ1NMwx
	+1gOdPrdW2w46zR+zoC/5w/fUKy5WyumfLVi1goVBHcKsGJOAuYoCa+2f1W5GfYR
	tLrziMQCLHlSDIu+leibiWR/XGTnC4SQYmlhv4h4wPJWe81Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dygce09x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 13:37:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba224c3ffdso36623465ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 06:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777988261; x=1778593061; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WJTrQj+8kovi55EycvL8ftqurdIO//d5VuUMdqn1BAE=;
        b=GumAYdUkbAZF2RHUluo601q6N5VZ5wVQGMDgQF+62Wf/lJgN/Rj1Ak48MdcHyB45KX
         Bnw9Sv8d2FQuR+3PKQuMrq8IiewB/sY+ka9FL/0HxP1XzkQGz5nGoURhwRIzOtpTKFo9
         H/xITiQDX9SpBIjQ7cuOGVFYEl/+O5l58qIRPEEPqGA+g01iW9gIij6WFjqXOEi2XiR/
         tyjuZ746MwXbZ94LuhULsARbWkXpxz9a8+lCBqoQ5HYQBTeFKzVBlpo6Ov+gnKvHalOC
         gOE6sL5w1D1GUGyUyzI5sUx7vjZmqmIlqyZz8Rwn4GBeKmk1grMmw29y+qwWEGGXKkir
         1K4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777988261; x=1778593061;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJTrQj+8kovi55EycvL8ftqurdIO//d5VuUMdqn1BAE=;
        b=o+fk7qI3QT7hV5SOutTpQR88pSwZdnyqWB4SGSwWt6hYPwpLmBVyH8uTkIKzSzdMWh
         x/5+uM255KhklXKrKXkaRM6dMDsIIN+534rhf71OmtSOHzonIoqClWK7lqQeZKFoerB7
         oLvnW/RxQZK0L/YK2sD8uWkU5bZWCjKmnFCPwtgL8GaoKZDCjN8a0aoqUSCU1QoRx8re
         HxDgE38KIUzrPSyh0ZhiXZFlI6n6sT4OoPwuiNxHEVW/Oqyf6+U3JQnDl3CAzEFnI9rU
         EzKDE57N3Kupu+LSX6ASIGZvWFnJS09JuiACrm4JuW1oxwQfPC8VHeebLOJSyqM+DLB1
         QtJA==
X-Gm-Message-State: AOJu0Ywq3qdIsy8MuKKTclecxHlrdzuWGin+XjBRwLZp4Gmdxxu9EXLN
	1tuKSeiyNdTnLxPEgaQ3AR935W9GSD9DK+ycY92NBxA7yFM4nuf+7yxRgDGVkbTVL1dVZivQYl8
	jTu0pnzwxyouZVYDV5+C8JcbUJnWAdNOWNc80/1M6Qd1hlHk4Q6T+V8ok28ONGb4UT6aQ
X-Gm-Gg: AeBDieuAV4uMaIVhBbJQWfCH1bf+PNAtwEe/eFmxSxR0mqwMR0syMMcQrU2qBsdGpYQ
	53jLDVXRQIctixH42mfzEZY/3mXlV2deqhUTUKT1t9tFHOUDJqW5EnPwN/xi8gUPig2xT6XeRVI
	3m9Ap+qLCs7PGMdwRqTXa3hp4mFVWr1tLr0Nin4UNuC+HlzfOqp2j1/31P74ejw15uCm3IngAyI
	Wx8FAJHBZCJQcWjUqaC1DFv2eCic/lYULBrOtLzehoTZeQX5IPCSo3xTAbUi8kqyVYl14ex30kR
	/EdV3cxgDc93pSfL0kqVUzG9SRBltJtLhaSyLCQi06jVwyqnj6jySxLzxR+6RcgDxllIdUB5uEK
	lXNySzIYFc6K4Bx8D7K31itjjy/awm2t6fOnyw0aGrk7NOINZqjJQf+R8PLRhMJhf/Q3XAoUm7Z
	kG26079r/6T7UTcp7gwBVDqai+C9sVPI4OAWYJVDHsef0y9n50Vu7W
X-Received: by 2002:a05:6a20:918f:b0:3a2:e089:ae56 with SMTP id adf61e73a8af0-3aa3b7f2b0amr3448189637.52.1777988261195;
        Tue, 05 May 2026 06:37:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:918f:b0:3a2:e089:ae56 with SMTP id adf61e73a8af0-3aa3b7f2b0amr3448155637.52.1777988260709;
        Tue, 05 May 2026 06:37:40 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c823e0d8d81sm742810a12.16.2026.05.05.06.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:37:40 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Tue, 05 May 2026 19:07:27 +0530
Subject: [PATCH] arm64: dts: qcom: glymur: Add psci reboot-mode edl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur_reboot_mode-v1-1-59fe3e9a6868@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJjy+WkC/yWOUQrCMBBEr1Ly7Uqaxq4WEe8hIjFZNdA0mk2LI
 t7daH8W3sC82bdgSp5YdNVbJJo8+zgUqBeVsDczXAm8KyyUVK3UEuHav8KYTonOMeZTiI5Aa10
 jSmrN2ohSvCe6+OdfejjOnOgxFneeQxGI2fzdXbWd1QrBpAB3th74xZlC2WDKCiYaXEwwLzJMq
 gYJzl42DSKuCJt9ZF4+RtPbGMKynN3vi7Nhgl/ic1dtnHS6RdusUInj5/MF87JOGvgAAAA=
X-Change-ID: 20260407-glymur_reboot_mode-4441770e6a8a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777988257; l=2504;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=IrPaTuvjt8nW2l9MfjWwXPL02cR35Ez++6pWKmhCiOA=;
 b=DCWJYl5zxDIL82rFpecsAQkgkLPMI8OWqPU/ItEWU/n4hGCpyfSTtJaFOCtTRxuBM6nZlyKpP
 FH++s7i7FGECWTPUEQrWQqRCfuScZ6U5HnAihabx6KJlzDOg8tec3vN
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEyOSBTYWx0ZWRfX6je1c8O8OYdI
 WsNRDVKf4Dk/qRt3cEnRk8CIYUKoj157KnXVz6vXQ6+zwq7E6pCUWayiJUVtzW2yH8+UE73rFgR
 sJ0bHc1s83KffCl0JYQbqPSsNBfbJHaRPAfQRtzy1lKJ615GJ9fI1Oq59nlFAP09CYLygrysQiy
 RYJI9QIfhSqbC3Hh6SCgxWvv3YnSjHr118BsAgnfOxEpb96vxrMJzwWGIvTLTqw5e66RQDzMMJt
 6x2HT2ANPDepJ5S1oz1IMCqBk48n7nPTp8zVRjNkmndwYZuVPnMbbwl19Ga9oGFw5Oo9V6wqhtD
 MymOfIPMQMnXipoBd1Xw1HvY6wY90adlUSywWGvI2jqNrW8471LvrCWPPEgU+C4LXSE3i+NyCC8
 viK4779xjZsyDhcj91QYkNra9goBc8FBi27GDXa/aeSuM/RyZjeLTDiq40yTEHnFmPCR5a2cHWe
 UtHABxUEG10uyAJfDpg==
X-Proofpoint-GUID: WV1xYuyEDAxcDzssX59wkJPbXi8ORXO5
X-Proofpoint-ORIG-GUID: WV1xYuyEDAxcDzssX59wkJPbXi8ORXO5
X-Authority-Analysis: v=2.4 cv=b6KCJNGx c=1 sm=1 tr=0 ts=69f9f2a5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1QBFgJbEpWYLLEr26TcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050129
X-Rspamd-Queue-Id: 4BAFB4CEA0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105967-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

Add PSCI SYSTEM_RESET2 reboot-modes for glymur to be invoked by the psci
reboot-mode driver.

The following modes are defined:
- edl: reboot into emergency download mode for image loading via
the Firehose protocol.

Support for these modes is dependent on the psci firmware

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 6 ++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 2852d257ac8c..397519e95ca1 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -560,6 +560,12 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..7f426efe40ab 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -382,7 +382,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

---
base-commit: 9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
change-id: 20260407-glymur_reboot_mode-4441770e6a8a
prerequisite-message-id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
prerequisite-patch-id: 70829f19896a982ef4ac19fa82bf571b9eb6defa
prerequisite-patch-id: 600337ba5717c51204c4f426acb28bd6287e56ec
prerequisite-patch-id: e7a6e85c94e35b71c9813c322e811a270233c854
prerequisite-patch-id: 7bb3e4b151f32129e8ce5d3c1015150cbd741d13
prerequisite-patch-id: a61561c5070b9485399a840ff48252842393f01a
prerequisite-patch-id: c7f5c86cf5f88c6d5dd576565bcce25ee3848b19
prerequisite-patch-id: e4d851cd0a6dfb96d62e4c9d3ebfa1422b9571a6
prerequisite-patch-id: e6ffbbec586e6c4b508bd366615e33928a910190
prerequisite-patch-id: 8ae267aee51f48992d2232f18dc5795b08fd8e54
prerequisite-patch-id: 10b585e49a96767c3324c9e3c623a4716a641fda
prerequisite-patch-id: 5abbfae8b6577899e0423b36b4690adf1046cac2
prerequisite-patch-id: edb89ac23b7a3d5ade9b9cc1e1a77ee4d1a663cf
prerequisite-patch-id: 555f1b64be3631d6286f2f1e140dc38c6935d646

Best regards,
-- 
Pankaj Patil <pankaj.patil@oss.qualcomm.com>


