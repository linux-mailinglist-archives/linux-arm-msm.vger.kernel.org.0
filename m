Return-Path: <linux-arm-msm+bounces-92207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IwFkHfiGiWlG+gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 08:04:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAC410C4FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 08:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E68CB30073D0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 07:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1DA2F5472;
	Mon,  9 Feb 2026 07:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMgtvyeQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kLmSSQYZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B318239E7E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 07:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770620659; cv=none; b=Oed9r6vXd8S3dwmSbexAWUcsWZcO5k9IOgPlP8Kpvymwzc5UQh4blvtEFZTuimxN1NYqFX0TAXlhLlYqoLYVjzl05yaJT87HQYbTZFNc3pRSYl23Mn3qf+9w4jvrCb8MZndM4g5dBohw/zJWYdfHAfotg6I5e4J5uMcWDk4H/O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770620659; c=relaxed/simple;
	bh=xb8QQiurBcnfRoBFty2cXeFBdhv91+YucQIMzbX790c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rVbgUq6ud/svgOjlZ0NYs+QRyg5qGN4+pNsc6hd+4k29P1udGO91otO8HRdLEMyXwXYwK9Y9wUanGAqts0BaaE9Ynp/nNeDnBoQig1dF3Fg68BzuWm4y61C4OWOi+DecsnBlfXxnN86ctOJOJu2JwE+GfhswFOR0VNcCPBEK33s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMgtvyeQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kLmSSQYZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6195RwcJ3252098
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 07:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kZonQ/Hf4RM
	TFJqi7V7NAZlLyxjmciWWHd+w04kBxtw=; b=EMgtvyeQPgtUa1/Oxlf4kELuWk3
	5rUcATVeNAx+WowTtrOMHU6YvH+ayX+pdBxOPZ0ZcYdzU6X6oiTTlh9QqQBhdy/V
	7yUVCKFZ1jBxXPRC9GwGzXPJNbY7UsHnheDh2W5gyMq0qVWFE43ppUmmgQ4wGL5Z
	pJgZhE+U2WaYjfgdwMv0ctyib6v17UAAB/mssnFr4mUg3QIRFXT8BXW8lJL7hTzj
	VHsBUjE71PlMGMnsygN8Cquw/DHPldkaG9Ty6sAruvt914RmU2UY7N0aIJSEA/05
	ysuq2VIkVXdyfR93gqN/tucdX6IY/TyZZIeH5OrpqD5y/09Ar+gIHcx7TUw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79f68agy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 07:04:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81ea3358dd3so2136778b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 23:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770620658; x=1771225458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZonQ/Hf4RMTFJqi7V7NAZlLyxjmciWWHd+w04kBxtw=;
        b=kLmSSQYZWPPtGmGmAcmJDkHc6kePm4Au7z5SAaorln3ixo5A7omCXz4oXX1T6N/ERs
         gOCTDHcY7DemcyVlaNCKCrM8JqftajDJfzSQ5oJnezck5Z+rv7QH/PM9+CJMeNc3NrWu
         UIWL42GSzLdDrrcAuljxi9J8JkYb7iSA4iVsLKtED8jV+mOveM846r7731492tbbV3l0
         3Q9NxCI4cVQlQH9BrpmvPwZNSe84ZJwTYh5qONK/0Gd+3mLKXhvG8/peCfmcK4LY8MV3
         9JBPuo8y0I/cZdQo1s2lKH5+pt3f16+TIgdDrPghMhY0Ne2N7oJMSKh2Y9JOi3jvfxR+
         Uk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770620658; x=1771225458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZonQ/Hf4RMTFJqi7V7NAZlLyxjmciWWHd+w04kBxtw=;
        b=YLq8eGYCHdvPHtzQXsOS1bJmsuNv6fZCdlF08UeLzNWXW4tuEcN99GP3WjT9FVaEDr
         nkeR02UKGcJegsYiuqIvLE9jQbtCjgEW6a5Qr4TF500wepGz0XgXsnMLKTLxS9MyhJaw
         PcHHV1OO7OGmH5okaLVkIJPKNBpnDL35SydaVdUXZNwIwZolOV5bLDUmXPwqj4udt6GL
         BJ2ONdJnTZicIUCvCPXSTTaDKbxdVbNt5qslRwCjOAr4GylJ4ZkYdxDPwxycPs4heVSH
         mliqf84gebrof+Up9RKc50vB01nwuFYfItXJBsbxEjMAGbuc2FcDa2JZxfqoRG1YfGlo
         NNhQ==
X-Forwarded-Encrypted: i=1; AJvYcCValRxI2SMMqvMIkYJae9RzzbMju92MCxNoIfnbOu4LMpBHeR/qE+7qryK6eGgx/yWJLvTv3CwVSguS+4Cy@vger.kernel.org
X-Gm-Message-State: AOJu0YzeAZnxy0QbnGOFG4T8tdK1Zn6CaOfT84++LOe8tnyf+VuoP8zU
	uCKGwq4yd0ekDcHBLDMfpMZq19g+Ao8OE/D2CBDLDCt349VgS9mM7gL0L/Lyp6rryNPDddgnywm
	d4epW5ndUc1LGoFjESFoTIb5nnEO7kWm3Qi5nWdY8xpVKnHFIXjTg28MTPIc2vYN0sE6K
X-Gm-Gg: AZuq6aLyxDvINI+/LyjfPEVychnH76sB+qOfTeXE5GnEvPPgPRW79iyXAWeh1gQGxFW
	Z2bLS6X7Ws1YKxZXtvN7Tb6j0IEUJuCEtvN0eI1GGvNaiMmTzPGspIF0IxOy3uXnPHkijiVC6Sm
	L5QfxAZUXkteegi9uR8wNBVT3WWMaCwOVca03l5izaaCG1peMqX0bJPqZBjhteuhDxoxkMSt94E
	lCNXpyUQOR/6g6iJwcA6dg0e9VrADoAnM8zk8vbX+9xxP1095GpBNlAD6zDOMClbi2pMarPI6I0
	1yebeLMvTlZQHwwPmXaWEPyLXavcXxdtgtpH+0At5BEyaGK226bAmpLgdqP3PlYApzBLZWGVAiY
	dLJFn+96bzlsnRn0OqfMbFTJsQMPWjzIbPe4S/9s=
X-Received: by 2002:a05:6a00:464e:b0:824:3eb9:11e2 with SMTP id d2e1a72fcca58-82441720e68mr8641237b3a.46.1770620657568;
        Sun, 08 Feb 2026 23:04:17 -0800 (PST)
X-Received: by 2002:a05:6a00:464e:b0:824:3eb9:11e2 with SMTP id d2e1a72fcca58-82441720e68mr8641212b3a.46.1770620657097;
        Sun, 08 Feb 2026 23:04:17 -0800 (PST)
Received: from hu-vivesahu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8244169804bsm9176950b3a.27.2026.02.08.23.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 23:04:16 -0800 (PST)
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
Subject: [PATCH v2 2/2] Bluetooth: qca: add QCC2072 support
Date: Mon,  9 Feb 2026 12:33:56 +0530
Message-Id: <20260209070356.187301-2-vivek.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209070356.187301-1-vivek.sahu@oss.qualcomm.com>
References: <20260209070356.187301-1-vivek.sahu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZPDWbJoO9pXcImpc8rLI9WX9dsgXV09T
X-Proofpoint-ORIG-GUID: ZPDWbJoO9pXcImpc8rLI9WX9dsgXV09T
X-Authority-Analysis: v=2.4 cv=W581lBWk c=1 sm=1 tr=0 ts=698986f2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=74lwPKb8uR0TJS9oFJ4A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA1NyBTYWx0ZWRfXx1ZN7TV3GfIH
 5LQmWjLaxx2GrQ3/InOktmFYqyNPlsmizKke1HuJnWqLNIWqHErg1rWkRvvknN38cJjduEkB/hC
 gYsatskRwzA2qZ81FFvSSVCDvMwsdy9sU3rSAl2T4vFdkl/QqMciOrCISFMS6w3LGMvaaWgeSCR
 hDDNrFg6w2Vn2ociSahvNVR6676nkIPceh/zclunOCBAyqVOeBu8E1tlGtvK182mVwuj2XdSj7k
 EBIJv2+HkVvpzVZ1GB5w/RvyM3weyBRsRWjwzNknfZyir8GtdO1FFiY28eMw2TmVkPW76KkGfrE
 +CEGCu1witbRKD45H8BuLRFn3fVM082XhjCQr+DFRfZSPRm2vjQbPC800wePexYkPFjK5+4YhSK
 NPjtvKOG6Z0ViDWG8J1XKwBMGpaPL5SgFMaHwqGB42K7BECtYd58DvuiNQblzgTnzblJhf23ztK
 LNPPia02YyREHv5PW3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090057
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,kernel.org,quicinc.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92207-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.sahu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.990];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DAC410C4FB
X-Rspamd-Action: no action

QCC2072 is a WiFi/BT connectivity chip.
It requires different firmware files and has different
configurations , so add it as a separate SoC type.

Correct the sorting of other chipsets for better readability.

Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c   | 41 ++++++++++++++++++++++---------------
 drivers/bluetooth/btqca.h   |  1 +
 drivers/bluetooth/hci_qca.c | 40 ++++++++++++++++++++++++++----------
 3 files changed, 54 insertions(+), 28 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 7c958d6065be..7b85634ee3a1 100644
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
+				sizeof(config.fwname), "hpnv", soc_type, ver,
+				rom_ver, boardid);
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


