Return-Path: <linux-arm-msm+bounces-110322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ij+MiDVGWpmzQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 20:04:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CE42D60700C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 20:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98DA5305AB78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCCB39B944;
	Fri, 29 May 2026 17:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MPeDkk87";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A9/EVFiP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA5439B486
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 17:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780077522; cv=none; b=S7SK0okaIWZr9SttRahScJYAE25Q0J+HQ337T32Gr8LRL76WPsCbFOouXIxO+nu9sO0Gc+A6Cn/q1buLhI9/ZJl6B2S9k0nqni8NKhHgZnUriLb40pg9bEz+jMM0ML60RWv9PrHpg/rG/Kn+tRCcDooOD7S6w1/1E13mn88HwTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780077522; c=relaxed/simple;
	bh=oqF+0wKnSACN4Mk0/HilssKdEOq7Nb46uq6l5mdKFFc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jj5+YnvyBn8ubeju6AgGhPWurNYgkycf8eQzz1Di0FTrm3tdI4hNUK4EHACoqpIepdRh7J5FXwukoKJx2axA6ltKIX+fchl6FuucHMurPCA2E038dzkX+72Nz8T3h8NHDlweL5u9ysqkeSRL0CZSQzsLTSVHjhFYlCLGqITMWTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MPeDkk87; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A9/EVFiP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TH8sW24089831
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 17:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=l0KJ+Y6GrS7a/JzhAhCe6resqVsrmTE4dI9
	bPIpx9BI=; b=MPeDkk8725N/Now4+JgVaLAYnGPu1Y30LIyS/CIBDw6+C6fCbmH
	InXeLBJgyewc8qvnFZhoq7E3jpOf0UWC7j5mI3jz4EF73t0BNqLdZN+5C8bJYM1r
	gRN8k3DVLkkQF12E8eyJIDO5zCt8Ju27Ymw9mw8EwF95Yj3FYw/4UIQbCl4jMfyI
	dOc5gRKJRZZTmF1hKgIxpxL7m5N9V65v6kLDZSNHBzVTYS+SBqqBJH/vg4ph9mMx
	g3GE0JYsDtzymP3WejfUkM8iBNggP6geReYvZpGmsbUO3YXduFHmwDRTRWwmKbw/
	ze7vvXbugY/FyuXXgkdM6NAPMBu3/a+Ie7A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevumw54t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 17:58:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c82c477290bso8133292a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780077513; x=1780682313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l0KJ+Y6GrS7a/JzhAhCe6resqVsrmTE4dI9bPIpx9BI=;
        b=A9/EVFiP7XmHImwhc2Hkg6nj3fIzppNDjipYNzf5Fda6K6yZ6hZ++29lHSainTUHxM
         qHcIYtDWvmDPxd1JBvXP1YeBAODvam1YnJrVqTRUdLcDd5c3uGCrSDVcowBKrZHwG9hP
         HF20vyMwzIUceGbY5+lPpkMed7/AD6jY+BFH0tOGiDIN+bZTwXEZk/hBuKDKF4V45Pyr
         3DdoGj3/MafQxoEuiEemrNbrS8OQhLUr2s1FPi1Vad3uti/Foc/P0aSX0IKVTxkdHeWE
         zpM34vNK0+pE6Q6fSMEll5org0/2xE99xPg60H6aWYZFsM1kuvKlwDXUg0xzgAN3avNG
         stGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780077513; x=1780682313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0KJ+Y6GrS7a/JzhAhCe6resqVsrmTE4dI9bPIpx9BI=;
        b=Qlt+Th9cxO/zlPJM9oJcY3p7kBCZYjbh7e2PAK+L9S8bmy6MQ+/WSXUxKLWFqOb1EN
         1Gj2IBzuA/bdEn2UAM57oELwQOLmXRyDTFn91TLxF67u1tT7/6jKOFAs5Vsc7+ulGLxM
         L6A78fFs5xCIPtHJEi7lpCvuSzQ1hYAeBkPf+L9EgqfRrO5c5GwKDue9JvXQkiDPdsj5
         c4T8CCAjF6ME4rrTs/0mftOEvdSSfamL0oXYNZcxp6iRAptVMAONXVIsYIitQowH0DF8
         4+4DfuNJXsUxpbHEg0yrcqftv5aGxCwrELme3cT7BVRS3vKW/9wBchK+Yf8ecNOwkLdB
         IZHA==
X-Forwarded-Encrypted: i=1; AFNElJ87QOeN4QxUIsdJg02nN0g7KWwJIQpn5mYU7SaDidxX0yqMhBYUD80K/jzD8SrRCkCEgz/aHIZBIwypfs7y@vger.kernel.org
X-Gm-Message-State: AOJu0YzOsMeT97hrI/IVfZMloHKL+ptHhABuefoFR7qDIkVoAMf0J1QQ
	SF2C9wDXRe6m2N47iSJvyoccdmC9ZxUdH5uFot1eKjdEA8JjP+QbUZPjC3q8L1K3+TemAkitxjB
	M6LZWpz/FngYTcl5yRlc/R10kOnQQC/ad69CScsbBqyCWBgSRLTZcu1CA854Nofl4lGNj
X-Gm-Gg: Acq92OHm/PkzARXUgIuYmmiioa2VquFqa3yFGSNfY+juxE0SdaGuJqF9D2lxEziWkQR
	meAA1jz5/jlgfNrm6t3/T4SjDG5DdLQtdXBAaNx+fUYNRWo8K2Z4Q9e+qfjDmn8+Ab5QytGLf2Q
	TR1sYbY/eh5AunRZc/hH9HFxPPBxbiuOafGzNyfqXTqd+ew+ww02+qowVFHSRSNr4mn45TNocUE
	zs9xqGjpgxWOGgmKOeVe0kv+SHyzLOF1nUe8g/W3d6H602oBOyPl0aroim+KqtGv4domm+gWkKJ
	UgnmzxlORn0f2HQgS7Fl16uGN2bH19RazM34qP+4zix1bZo0yxIcGxV2sz/+G5OxeZ/ieWd5QeX
	8LNCrisT6rq/Lk/HVsKgFEqfAy+aTtPvSx8GbhoN5X07uZlHt4zWMp9hpV7Ue5Q==
X-Received: by 2002:a05:6a20:e20f:b0:39f:2dd0:65d5 with SMTP id adf61e73a8af0-3b427fb8a39mr291568637.39.1780077513489;
        Fri, 29 May 2026 10:58:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:e20f:b0:39f:2dd0:65d5 with SMTP id adf61e73a8af0-3b427fb8a39mr291538637.39.1780077513012;
        Fri, 29 May 2026 10:58:33 -0700 (PDT)
Received: from hu-ysiddu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772d7342sm2437320a12.26.2026.05.29.10.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 10:58:32 -0700 (PDT)
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        rahul.samana@oss.qualcomm.com, harshitha.reddy@oss.qualcomm.com,
        dishank.garg@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Subject: [PATCH 2/4] Bluetooth: qca: add QCC2072 support
Date: Fri, 29 May 2026 23:28:22 +0530
Message-Id: <20260529175822.3366535-1-yepuri.siddu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AFzn41WhDf0DtIFZ6tdG9VWhfLoa04_o
X-Proofpoint-ORIG-GUID: AFzn41WhDf0DtIFZ6tdG9VWhfLoa04_o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE3OCBTYWx0ZWRfXwXTkChGWKypI
 vm1PRU+PKZUNVBFUydQxTYCnEeRvtU1s+ww8haBoGh/6BIi0in6RkJrWCe2pv9Tu2AXqYb7DuYJ
 AFegh9fTLLf9Ojb9m2gGrM5SBYk7HU0FTcXV4i57h0TGBABHsxJcmK1Q2g1FMPz0M4ypJ5Pkq8s
 rWEhKta5yOl6gWmjkaJ3VpRNC8i8/iNkj/0Kg9+G2FjWThFqw8Y+fvIeneqwmI4tYt/VEEcGImj
 NF3LZ1mqRy4tQvDEy0r1WXaJnkvctyfukCMSNZchfzzeyZBykSMkaLT8/rIya//vYQ9anZLCHBd
 MncneTLg15tA3ghKoEc15+vRZpXFbHGBGDYBLMhp0xnWLaJ6P93FmYXn98TbXRjfprMTkFG5p7d
 yVkd3v4x0aQfbv1Nms6hsfvqO1Xa7+V1cS/9MRQFAzf97/+Ci3agSJTXuZ2jZcg8DE8ifXzggPT
 RkZXj/uMEqOK0QiVkng==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6a19d3ca cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ffrZGZ3HEtUVdBMj5k4A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290178
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-110322-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yepuri.siddu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE42D60700C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

QCC2072 is a BT/WiFi combo SoC that uses different firmware
filenames and requires no external voltage regulators, so add
it as a new SoC type.

The chip supports the wideband speech and valid LE states
capabilities. Its firmware is named using the "orn" prefix and
follows the standard rom-version-based scheme:
    - qca/ornbtfw<ver>.tlv
    - qca/ornnv<ver>.bin

These firmware files are already present in the linux-firmware
repository.

Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c   |  9 +++++++++
 drivers/bluetooth/btqca.h   |  1 +
 drivers/bluetooth/hci_qca.c | 24 ++++++++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index dda76365726f..0ef7546e7c7a 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -843,6 +843,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/hmtbtfw%02x.tlv", rom_ver);
 			break;
+		case QCA_QCC2072:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/ornbtfw%02x.tlv", rom_ver);
+			break;
 		default:
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/rampatch_%08x.bin", soc_ver);
@@ -937,6 +941,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
 				 "hmtnv", soc_type, ver, rom_ver, boardid);
 			break;
+		case QCA_QCC2072:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/ornnv%02x.bin", rom_ver);
+			break;
 		default:
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/nvm_%08x.bin", soc_ver);
@@ -999,6 +1007,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCC2072:
 		/* get fw build info */
 		err = qca_read_fw_build_info(hdev);
 		if (err < 0)
diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
index 8f3c1b1c77b3..a175ac31e7b2 100644
--- a/drivers/bluetooth/btqca.h
+++ b/drivers/bluetooth/btqca.h
@@ -158,6 +158,7 @@ enum qca_btsoc_type {
 	QCA_WCN6750,
 	QCA_WCN6855,
 	QCA_WCN7850,
+	QCA_QCC2072,
 };
 
 #if IS_ENABLED(CONFIG_BT_QCA)
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index ed280399bf47..fc67ba0e4984 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1372,6 +1372,7 @@ static int qca_set_baudrate(struct hci_dev *hdev, uint8_t baudrate)
 
 	/* Give the controller time to process the request */
 	switch (qca_soc_type(hu)) {
+	case QCA_QCC2072:
 	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
@@ -1459,6 +1460,7 @@ static unsigned int qca_get_speed(struct hci_uart *hu,
 static int qca_check_speeds(struct hci_uart *hu)
 {
 	switch (qca_soc_type(hu)) {
+	case QCA_QCC2072:
 	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
@@ -1510,6 +1512,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 		case QCA_WCN6750:
 		case QCA_WCN6855:
 		case QCA_WCN7850:
+		case QCA_QCC2072:
 			hci_uart_set_flow_control(hu, true);
 			break;
 
@@ -1545,6 +1548,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 		case QCA_WCN6750:
 		case QCA_WCN6855:
 		case QCA_WCN7850:
+		case QCA_QCC2072:
 			hci_uart_set_flow_control(hu, false);
 			break;
 
@@ -1861,6 +1865,7 @@ static int qca_power_on(struct hci_dev *hdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCC2072:
 		ret = qca_regulator_init(hu);
 		break;
 
@@ -1957,6 +1962,10 @@ static int qca_setup(struct hci_uart *hu)
 		soc_name = "wcn7850";
 		break;
 
+	case QCA_QCC2072:
+		soc_name = "qcc2072";
+		break;
+
 	default:
 		soc_name = "ROME/QCA6390";
 	}
@@ -1980,6 +1989,7 @@ static int qca_setup(struct hci_uart *hu)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCC2072:
 		if (qcadev->bdaddr_property_broken)
 			hci_set_quirk(hdev, HCI_QUIRK_BDADDR_PROPERTY_BROKEN);
 
@@ -2013,6 +2023,7 @@ static int qca_setup(struct hci_uart *hu)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCC2072:
 		break;
 
 	default:
@@ -2166,6 +2177,12 @@ static const struct qca_device_data qca_soc_data_wcn3998 __maybe_unused = {
 	.num_vregs = 4,
 };
 
+static const struct qca_device_data qca_soc_data_qcc2072 __maybe_unused = {
+	.soc_type = QCA_QCC2072,
+	.num_vregs = 0,
+	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
+};
+
 static const struct qca_device_data qca_soc_data_wcn6750 __maybe_unused = {
 	.soc_type = QCA_WCN6750,
 	.vregs = (struct qca_vreg []) {
@@ -2268,6 +2285,7 @@ static void qca_power_off(struct hci_uart *hu)
 
 	case QCA_WCN6750:
 	case QCA_WCN6855:
+	case QCA_QCC2072:
 		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 		msleep(100);
 		qca_regulator_disable(qcadev);
@@ -2414,6 +2432,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		qcadev->btsoc_type = QCA_ROME;
 
 	switch (qcadev->btsoc_type) {
+	case QCA_QCC2072:
 	case QCA_QCA6390:
 	case QCA_WCN3950:
 	case QCA_WCN3988:
@@ -2434,6 +2453,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	}
 
 	switch (qcadev->btsoc_type) {
+	case QCA_QCC2072:
 	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
@@ -2484,6 +2504,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		if (!qcadev->bt_en &&
 		    (data->soc_type == QCA_WCN6750 ||
 		     data->soc_type == QCA_WCN6855 ||
+		     data->soc_type == QCA_QCC2072 ||
 		     data->soc_type == QCA_WCN7850))
 			power_ctrl_enabled = false;
 
@@ -2492,6 +2513,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		if (IS_ERR(qcadev->sw_ctrl) &&
 		    (data->soc_type == QCA_WCN6750 ||
 		     data->soc_type == QCA_WCN6855 ||
+		     data->soc_type == QCA_QCC2072 ||
 		     data->soc_type == QCA_WCN7850)) {
 			dev_err(&serdev->dev, "failed to acquire SW_CTRL gpio\n");
 			return PTR_ERR(qcadev->sw_ctrl);
@@ -2570,6 +2592,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 	struct qca_power *power = qcadev->bt_power;
 
 	switch (qcadev->btsoc_type) {
+	case QCA_QCC2072:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
 	case QCA_WCN3991:
@@ -2779,6 +2802,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
 	{ .compatible = "qcom,wcn6750-bt", .data = &qca_soc_data_wcn6750},
 	{ .compatible = "qcom,wcn6855-bt", .data = &qca_soc_data_wcn6855},
 	{ .compatible = "qcom,wcn7850-bt", .data = &qca_soc_data_wcn7850},
+	{ .compatible = "qcom,qcc2072-bt", .data = &qca_soc_data_qcc2072},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, qca_bluetooth_of_match);
-- 
2.34.1


