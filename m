Return-Path: <linux-arm-msm+bounces-92221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IrqM5GViWlj/AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 09:06:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 707E110CC03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 09:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27C6B3003356
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 08:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E23C15539A;
	Mon,  9 Feb 2026 08:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QcTTOzAE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cBb1JEpH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41F2338F4A
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 08:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770624395; cv=none; b=mWuUjMBQp8erA3BqvUU7Ii/54ViKUUdra5P6IFgB9HRuJKU6AYlxlAOAPDK26PO3Mby0uB2aAvnFMDW0pImazQL5qsVUhqWJiaZATH3aHkeFeNFQCyEfOb0EJyJlT5US88HKlz+lfLzOcnPhmUBz3GDVe+a6tcsC7oELOylWOBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770624395; c=relaxed/simple;
	bh=U5lMaOoZdvqp/rHwv4eXh+WPA2R1p9wSN37z76hWeew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dkz6U9JG1iWwo3rx8duRrl8DuQfbmzbENmxy8QIJBjHR7Rd0WMzO6Lr9M+Fg0LaYYhWbj8w2Xsf+VvFCx9I2QMa2NUOYq+w1p5e0rHrOn8IzKGIeJiwywetg49LaSpBbdHRZCeJ46oqFbSqi4bc0NgJqpjGlZbgaTZhP2YgSq7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QcTTOzAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cBb1JEpH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6195NdUV2031733
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 08:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/8xGVV6TEm2
	SRGgr+FOFMkPrOMpyCAVXyrEME5gPzxA=; b=QcTTOzAEPS86My9qXGZJk82u78q
	DwPCvTHQKvdSR13ApdW9oQ8ll0HlwcVh8rZfZVfGGsp/U3fJJf2UtBvFZa3pcR3Y
	IZD9P7Z6NRrdvjxq01tyOfVzioscd8S+RB45eVQgFz9wvgPxP+cftK3G1mq2oG3k
	q97EBvjngc6tUp6At964zvHRvQ+jYa6X2bTz/qmEwGOb7+jAI7rlqLD/GRVMzhw6
	I1BgSQ5WehE7mwsfPng50c0/iDuMMM4D0oL42qGfxOaGUHyGqDQbmaWpr7boLu9D
	R64RxFbU6xPjN5VLJVQEv/1OL9EtzYgw+KZyi11s+Cpxv8iwIf65jHc7AEg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79d30hdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 08:06:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6dded42ec4so1235676a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 00:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770624393; x=1771229193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8xGVV6TEm2SRGgr+FOFMkPrOMpyCAVXyrEME5gPzxA=;
        b=cBb1JEpHUqhXIU4Wo/OqWZOpVUuEb9nMta2TEYFcLqvndQy3v9V8/rqgEDUtnjQo9w
         sNLR+vdUNDC4sS2bMvKjvkoNAVZcNFCsbzDxfBvKevXmW9Ny+nDuye99kb+J8byWGgJa
         CzQhA3YzR6Dmxu0F03BxhLLJxGV/SgFSsJNhHXU8Hwp/xPQUoZpvD9xDzBLd9FcPLrZo
         hN1Cfi5oPy4EKcGelzDJQRj+3//eCMa9XvszFh5lldzZ1wBrjzfjAqlCCMmqBENCKX7u
         YhH5YqY0MN0EdTB7Uw06kt4zfcgHEFoGMA+tVCa7oHCA57hYNj4/EsNbF4fm4zhLIufq
         sNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770624393; x=1771229193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/8xGVV6TEm2SRGgr+FOFMkPrOMpyCAVXyrEME5gPzxA=;
        b=Q+PD1yDZf24OLV2D21KN//TcIOW1POUKBJwL52SNlFYU4rKbIpW2rfynB0DaHsJIIK
         YeV2TTeACOjyPLcjSQsMDFaG7l8yrugmWISAfJ0wm76j9XoKcVqT/VojYNgI/Mo9n76b
         zoY6NySRsq2R9kK8opYtNHE5sDlsGY2/ApZI1ZSmXeL8MzM6hVL/Y5PVlaqkEUuCZYaj
         dozl0CScxmCSeM5CertHGAkdRg/KzbH9Eoq91neS/GYI21wo39bBU7Ob04XDr9bWIdgw
         oc8/iuSHNQaJVPZsZiuZT+6LH7igDgQYOjIH7Yrl/onY2XWPy5Pyh1FzFg8uYBHBfMVN
         u65Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7aqbmYjgh/5475Iu6qO37CRadGy5IfrCQQCJjHOcceYG+6UGlZ7NCbO2ZEOua0O9XgpHl/9WMilp+sOUF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa9Kkat2RMq8QBEsNzQC2KUY/8OLfjUsJII9xVP19kJ4g5dvmh
	gIiHEMVrvrcGmx55J3gNkGmFwAzKYYVj9upw8Gb5HfV4vOvopWrlnvyQgursZugGxjcqRwjHn2u
	jfUTnTNAzPR7iK+7QebbbG9iC4iAvMEe8q6pUcId0N1ncq477sdRmxnzpc8yElw6YM1CE
X-Gm-Gg: AZuq6aKLnrMOpEYCR1I2eXpu6XxRQQ7/gSN2rCWvcYA8Fjzmk8IW2Jw3QL+SOlPgdnH
	aQTKg0qvjoThDVCPV9wGjWAIB34ymsqZyQeiHER4Mki5fnyeuQDZeIgU18XlA6uT92EVzKZeE1k
	uHzecBkcb+gCXBqHegVn8FTBJqtnsHvGg2bjdXWncq9HqNtPssYRlniFrj0yN7tPJwzFtwFl2Uy
	kGQpSsU6DiXoE2HjUZQ65LB1CE8chzAKSVDMCsxRGHYsOjhaufbfdRtFdeQFZ428FOjnG5Ohg7j
	iLfUe0db8vduNMuxYFHvvMMb9DVOCiWnOFUHr+h4NUotnDr9NOaOu1u76jKZZGcP23eTYP4cUVJ
	JwiSyGHLioQOMGUJb7irxmZvmErHHgCNyJ9V4/PA=
X-Received: by 2002:a05:6a21:1193:b0:35d:d477:a7f3 with SMTP id adf61e73a8af0-393acffd2b0mr9910950637.20.1770624392577;
        Mon, 09 Feb 2026 00:06:32 -0800 (PST)
X-Received: by 2002:a05:6a21:1193:b0:35d:d477:a7f3 with SMTP id adf61e73a8af0-393acffd2b0mr9910907637.20.1770624392016;
        Mon, 09 Feb 2026 00:06:32 -0800 (PST)
Received: from hu-vivesahu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb4fb713sm9202221a12.3.2026.02.09.00.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 00:06:31 -0800 (PST)
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Subject: [PATCH v3 2/2] Bluetooth: qca: add QCC2072 support
Date: Mon,  9 Feb 2026 13:36:13 +0530
Message-Id: <20260209080613.217578-3-vivek.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209080613.217578-1-vivek.sahu@oss.qualcomm.com>
References: <20260209080613.217578-1-vivek.sahu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA2NSBTYWx0ZWRfX0YquzAit0Tvx
 YtQx7egXtL9b7hNTfBx7YbhAeILJeqBEv8J06VyRD5GIXclqL2os9Nw/Xs5jVCSHwYxFhhGRyvL
 Fnm/cTjDiqj1sEOCOfEqpDVJEQiOz8VHJyPI7bMInIW3iG36KPEAiREZ5YhQw2S9BLapjFgPWUi
 JMsrrmVMYg5RyP6AIYnvkSt/MaBMCD+Jxy0FuGUP7gEWNSvddNJRFapeOxxTSkv4KJ61QEAx0xr
 mWVjwGeoWssk+T3fvGePZS+iB+jmL2LtKVQzxWiSae/aRtO6RdlqO45Ae8y4lKIihCqgk1aLmLM
 TJT1fWW/FBXLb/WickTy94vX0akzfaw9ma52lYFzj5ilEnZixMflPP3gBi4/ibN4v2ntKfFLrQg
 tEZ296nzOBC7kgdyOsUCUSChju3G3EkfVNP6QTObQIBW2dkDCHNwPNqoPSDRPJIuzBHHRS6S1QM
 JSSMkUpuI+TopmNhxAQ==
X-Proofpoint-ORIG-GUID: r6yqiChFMCgLca3xeUYjFbDRB3m7S7f_
X-Authority-Analysis: v=2.4 cv=GJAF0+NK c=1 sm=1 tr=0 ts=69899589 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=74lwPKb8uR0TJS9oFJ4A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: r6yqiChFMCgLca3xeUYjFbDRB3m7S7f_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,kernel.org,quicinc.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92221-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.sahu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.989];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 707E110CC03
X-Rspamd-Action: no action

QCC2072 is a family of WiFi/BT connectivity chip.
It requires different firmware files and has different
configurations , so add it as a separate SoC type.

Correct the sorting of other chipsets for better readability.

The firmware for these chips has been recently added to the
    linux-firmware repository and will be a part of the upcoming
    release.

Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c   | 41 ++++++++++++++++++++++---------------
 drivers/bluetooth/btqca.h   |  1 +
 drivers/bluetooth/hci_qca.c | 40 ++++++++++++++++++++++++++----------
 3 files changed, 54 insertions(+), 28 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 7c958d6065be..9b9f4b435032 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -816,6 +816,17 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		snprintf(config.fwname, sizeof(config.fwname), "qca/%s", rampatch_name);
 	} else {
 		switch (soc_type) {
+		case QCA_QCA2066:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/hpbtfw%02x.tlv", rom_ver);
+			break;
+		case QCA_QCA6390:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/htbtfw%02x.tlv", rom_ver);
+			break;
+		case QCA_QCC2072:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/ornbtfw%02x.tlv", rom_ver);
 		case QCA_WCN3950:
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/cmbtfw%02x.tlv", rom_ver);
@@ -830,14 +841,6 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/apbtfw%02x.tlv", rom_ver);
 			break;
-		case QCA_QCA2066:
-			snprintf(config.fwname, sizeof(config.fwname),
-				 "qca/hpbtfw%02x.tlv", rom_ver);
-			break;
-		case QCA_QCA6390:
-			snprintf(config.fwname, sizeof(config.fwname),
-				 "qca/htbtfw%02x.tlv", rom_ver);
-			break;
 		case QCA_WCN6750:
 			/* Choose mbn file by default.If mbn file is not found
 			 * then choose tlv file
@@ -885,6 +888,19 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		}
 	} else {
 		switch (soc_type) {
+		case QCA_QCA2066:
+			qca_get_nvm_name_by_board(config.fwname,
+						  sizeof(config.fwname), "hpnv", soc_type, ver,
+						  rom_ver, boardid);
+			break;
+		case QCA_QCA6390:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/htnv%02x.bin", rom_ver);
+			break;
+		case QCA_QCC2072:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/ornnv%02x.bin", rom_ver);
+			break;
 		case QCA_WCN3950:
 			if (le32_to_cpu(ver.soc_id) == QCA_WCN3950_SOC_ID_T)
 				variant = "t";
@@ -907,15 +923,6 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/apnv%02x.bin", rom_ver);
 			break;
-		case QCA_QCA2066:
-			qca_get_nvm_name_by_board(config.fwname,
-				sizeof(config.fwname), "hpnv", soc_type, ver,
-				rom_ver, boardid);
-			break;
-		case QCA_QCA6390:
-			snprintf(config.fwname, sizeof(config.fwname),
-				 "qca/htnv%02x.bin", rom_ver);
-			break;
 		case QCA_WCN6750:
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/msnv%02x.bin", rom_ver);
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
index 888176b0faa9..2ce6e19e5b86 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -623,6 +623,7 @@ static int qca_open(struct hci_uart *hu)
 		qcadev = serdev_device_get_drvdata(hu->serdev);
 
 		switch (qcadev->btsoc_type) {
+		case QCA_QCC2072:
 		case QCA_WCN3950:
 		case QCA_WCN3988:
 		case QCA_WCN3990:
@@ -1498,6 +1499,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 		 * changing the baudrate of chip and host.
 		 */
 		switch (soc_type) {
+		case QCA_QCC2072:
 		case QCA_WCN3950:
 		case QCA_WCN3988:
 		case QCA_WCN3990:
@@ -1514,6 +1516,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 		}
 
 		switch (soc_type) {
+		case QCA_QCC2072:
 		case QCA_WCN3990:
 			reinit_completion(&qca->drop_ev_comp);
 			set_bit(QCA_DROP_VENDOR_EVENT, &qca->flags);
@@ -1533,6 +1536,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 
 error:
 		switch (soc_type) {
+		case QCA_QCC2072:
 		case QCA_WCN3950:
 		case QCA_WCN3988:
 		case QCA_WCN3990:
@@ -1549,6 +1553,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 		}
 
 		switch (soc_type) {
+		case QCA_QCC2072:
 		case QCA_WCN3990:
 			/* Wait for the controller to send the vendor event
 			 * for the baudrate change command.
@@ -1900,6 +1905,10 @@ static int qca_setup(struct hci_uart *hu)
 		soc_name = "qca2066";
 		break;
 
+	case QCA_QCC2072:
+		soc_name = "qcc2072";
+		break;
+
 	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
@@ -1935,6 +1944,7 @@ static int qca_setup(struct hci_uart *hu)
 	clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
 
 	switch (soc_type) {
+	case QCA_QCC2072:
 	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
@@ -1969,6 +1979,7 @@ static int qca_setup(struct hci_uart *hu)
 	}
 
 	switch (soc_type) {
+	case QCA_QCC2072:
 	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
@@ -2058,6 +2069,23 @@ static const struct hci_uart_proto qca_proto = {
 	.dequeue	= qca_dequeue,
 };
 
+static const struct qca_device_data qca_soc_data_qca2066 __maybe_unused = {
+	.soc_type = QCA_QCA2066,
+	.num_vregs = 0,
+};
+
+static const struct qca_device_data qca_soc_data_qca6390 __maybe_unused = {
+	.soc_type = QCA_QCA6390,
+	.num_vregs = 0,
+	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
+};
+
+static const struct qca_device_data qca_soc_data_qcc2072 __maybe_unused = {
+	.soc_type = QCA_QCC2072,
+	.num_vregs = 0,
+	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
+};
+
 static const struct qca_device_data qca_soc_data_wcn3950 __maybe_unused = {
 	.soc_type = QCA_WCN3950,
 	.vregs = (struct qca_vreg []) {
@@ -2114,17 +2142,6 @@ static const struct qca_device_data qca_soc_data_wcn3998 __maybe_unused = {
 	.num_vregs = 4,
 };
 
-static const struct qca_device_data qca_soc_data_qca2066 __maybe_unused = {
-	.soc_type = QCA_QCA2066,
-	.num_vregs = 0,
-	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
-};
-
-static const struct qca_device_data qca_soc_data_qca6390 __maybe_unused = {
-	.soc_type = QCA_QCA6390,
-	.num_vregs = 0,
-};
-
 static const struct qca_device_data qca_soc_data_wcn6750 __maybe_unused = {
 	.soc_type = QCA_WCN6750,
 	.vregs = (struct qca_vreg []) {
@@ -2715,6 +2732,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
 	{ .compatible = "qcom,qca6174-bt" },
 	{ .compatible = "qcom,qca6390-bt", .data = &qca_soc_data_qca6390},
 	{ .compatible = "qcom,qca9377-bt" },
+	{ .compatible = "qcom,qcc2072-bt", .data = &qca_soc_data_qcc2072},
 	{ .compatible = "qcom,wcn3950-bt", .data = &qca_soc_data_wcn3950},
 	{ .compatible = "qcom,wcn3988-bt", .data = &qca_soc_data_wcn3988},
 	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990},
-- 
2.34.1


