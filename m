Return-Path: <linux-arm-msm+bounces-92486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDYhJ0Qei2n7QAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:02:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AC411A813
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24A4C302A042
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 12:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098AC3242B1;
	Tue, 10 Feb 2026 12:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEtY8KqZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UxHCSo8u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AB8328247
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770724903; cv=none; b=ePbTAajKa35q86VPkLtZ3lvhm15nx4D0f+vHPAka7MG4cAJ37hLhdejtpbnME6y2/IlMsDVwxIka4rFLf0NMoIcN295/TAsm1txV6MiZwbCyTlVfRqsv88JKU45oqdYVlsM/mlsHZvjAjEy4wjPMCE0w+5N6poggC5vkFJownbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770724903; c=relaxed/simple;
	bh=IqjpYTWxrm4uyR3YSpzOagusXq5h1tnHrXNAMRPwlJo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qPUPuO7CIECYytsD2+sZYV9cAg0ful5ggkyUOPU6CjwSQW6zm392uSZXuHOkJl5hjkimqEjgWlnnA2QTgTAN09IShoX8NnRi50Lht13CQtgY7FZDjLnAs1Y4QrTXwzfiRpaoTPTx2ssw7KMeVh394m1XhCh8CPtfaK0YIA7YHWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEtY8KqZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UxHCSo8u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A70nQ7441567
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=l0lWt3RD/v0gUJzCHHWP/b5c44WkG12+TyK
	4wxyVsFM=; b=DEtY8KqZdFtfdvZ81g5M0IKjzh3lz1q9wK/nnp/TvK4mAMVFFIP
	3wKfy1ecAi9Py4df8iAK5y6h3LR4uTu59on86IwC06bnl2WTuXfJFHI511T238ph
	kIbuR8ccsmmh7546aq1EXKaGWglxuBjBhBGfWDxjQKkvnYldv6z02FVHMfHxwF52
	6guA706X9MpqloamT8/TS6SCzJZk3lOWbit/caX34HQ8O1IsHK7Ob7P94POL2fP7
	MvIF27++WH0dBIu4oWymfPhvYy5jrOeaRonxnYxoD/bz3HqdfUJ030RWPtCzXG9r
	6XEAD5q2Dl6d1w6PPiziOGiV4Agk2ONwbvQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7qp9jfjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:01:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354c65f69edso971863a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 04:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770724900; x=1771329700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l0lWt3RD/v0gUJzCHHWP/b5c44WkG12+TyK4wxyVsFM=;
        b=UxHCSo8ucKywi6Uf/iKCnExjUZYhSST+Bi890WolSW1N9ffkr5QHCCcjSYOZtKYNig
         BeE8mvXwhycDA8VhsDwz3n/90BRMbWGocrJRAJUrpTk2iv/xcjsJ9YSKObnsOGVB+Jko
         sKVfptNZk4nh3faa7TUo2xtHecu5kfGm8XTh0442nC7mXovbJVbmzBp7Sx6dgs74tRxQ
         cdxAn92Dvcm3vLDMlkr3HOiNjO6HYsR1zQzPB0zFyneNTw20YUQreaWVECE1QpxUBh6H
         yK/31qzuVSF5ygTzyu/UhDQNLEvySb/Omt4XzGZ3lyuw6amC+DZtJhfs82Sy1KQmUtYB
         NEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770724900; x=1771329700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0lWt3RD/v0gUJzCHHWP/b5c44WkG12+TyK4wxyVsFM=;
        b=BmUSWDiyDgo6rbT9vEk1Afnu94CyVzSpve4C6bSefki13fQa3wY13KU66M68jyz2yq
         NMRlR3vTLcazY6zxk0G8lUbujcw8MjcZhaDYemI4a95/zqt5ZGsKdGI+R2ke+6wTQEKE
         +ODmvTAcLu1Ayf4qWbZf0xKRVTP7rTizeK9zaEb+eAoInoVcTMqpvBttJ8bfhkoEcWQj
         ahw+wqfQKe+7Dfb0v4a65FbSDTsU+Wa5JJZWiKu9BE8rzM8ZVLmgtZ9dF2+ijCRs/j8r
         AtCw527C3IAqVnPPtVu/5P7+XdgMq7cAjoyMpNxq5InZnOvgpFxYjQKCIy7XO+XIgewZ
         GI2A==
X-Forwarded-Encrypted: i=1; AJvYcCV73hSK2A5MKUlVdPwVyzCo2g/hDHfGqL/GFfFq2fVUx6+SyN+A8YjS8npKa3d7snFlJGkIiH9+rZ5lZRTH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ROH/bNnP/nniy6w7Z/HQWk2pPFU4BBlz/n9FR8/pU8ePDwbI
	buFEXd8hCDBrD0rFS5bZ51o6HaU/FNyX/t80onioC8ZK76+g8S+Y6R+vqSjOctP7PBwTuS64mA5
	/Y5+oZS/k2ucRyIC4m4milC/JgxPYjTl/7l0rr7tezXtqBLfSyKyE/mGu0KhxgRaErNnw
X-Gm-Gg: AZuq6aLKOSRLzOlac38YoQZQBBvmshkelZvcTMgyezvD/IoKZwjlmD2dHBEEqHEXTRf
	UeCTnOPi2hxhdyt8D7ejyBtJA3wc1B8wGLrZHcMRfm2qZ4pSxL911/U12f+QnPs6C7gW3Q8S2Zh
	sqc9Lw0i/XictrXVZZXSuskcI8weiWQPWFzasBbppg+Ka+4UBiG7cRr4Xfs/zE/T2Y4oBYlhh9y
	KC+BgwSYNyZLW0fHKtUWF15g5RUaR2Dq9Eu+JQjs2zS39ZtTzdlYv46MlZvBNM7Iam2QcJvIJCk
	tt++mBxlgt3Djry3CS6as2m8qOse6ZibzU2ImbwjhHPcybvXCVgQKzvU8nC/ylqjZdSYtM8E6Fm
	P4ijRA+To+ISpUYXtIfRU97wW0z0Eyi4SOUXttIRqOt/FkgziIpA=
X-Received: by 2002:a17:90b:28cc:b0:356:282e:7eb5 with SMTP id 98e67ed59e1d1-356282e7f91mr6966829a91.24.1770724899896;
        Tue, 10 Feb 2026 04:01:39 -0800 (PST)
X-Received: by 2002:a17:90b:28cc:b0:356:282e:7eb5 with SMTP id 98e67ed59e1d1-356282e7f91mr6966789a91.24.1770724899316;
        Tue, 10 Feb 2026 04:01:39 -0800 (PST)
Received: from hu-vivesahu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662e8c819sm2796236a91.12.2026.02.10.04.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:01:38 -0800 (PST)
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Subject: [PATCH v1] Bluetooth: qca: Refactor code on the basis of chipset names
Date: Tue, 10 Feb 2026 17:31:01 +0530
Message-Id: <20260210120101.1046091-1-vivek.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7u9fn2k5CR5iNBskRT5vFMHXKD-9YYSd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEwMSBTYWx0ZWRfX3nYdVQVxzJte
 ZuJpQ3uD/TuGW8NfP3tVXNbvJ+u7+bhesaV5q/NS+BsytXDpnonCc3KqCs0yKTOk4RliS7GYMiI
 S3jlEPWH9bxNB9oxcTjAmc1YpoXIzUoM044CPok9J9LKvfjdetMF1E7rhcUS4NX/UJe9vGcTDh/
 J6nf3pOU/L6zIuIu+IUpCBGYTFgf6rfyfQ2KtnaKz8eNNH4khLPY+FHweXxsGRJ7dfVmZoiICem
 AituHglbzwoBU3gmIiu1SqzlLXW8D435GPPyFrZ9xqDEAvnDhi21eoDXUlwwOlzRGee+NcWbWi4
 /Jpvcn4avme1tjgaQBIXM8Vk+4c8cBO8mR4sLD96yJVOQPENFsT8mY029FioCZSvOWeO4KNwgjv
 /23fAAbvT7ygEYQq5XlMn5c8NfVgfSTGokcns8oKZepEeLDSqIsIPepEmWJJfb1NVtBNegJlHBQ
 Cf9QNGrxEWjf+R0gZUg==
X-Authority-Analysis: v=2.4 cv=dP2rWeZb c=1 sm=1 tr=0 ts=698b1e24 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=_Hwy5uYH7oNXmxhsLToA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 7u9fn2k5CR5iNBskRT5vFMHXKD-9YYSd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-92486-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.sahu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7AC411A813
X-Rspamd-Action: no action

Whenever new chipset support is added to the driver code,
we ended up adding chipset name to the last of the switch case
arising code readability issue because of improper sorting of
the chipset names in various places of the code.

Refactor code such a way that new chipset can be added easily
in the code without compromising code readability.

Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c   | 37 +++++++++++++++++++------------------
 drivers/bluetooth/hci_qca.c | 30 +++++++++++++++---------------
 2 files changed, 34 insertions(+), 33 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 74f820e89655..9f7e13fcb20e 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -799,6 +799,14 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
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
 		case QCA_WCN3950:
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/cmbtfw%02x.tlv", rom_ver);
@@ -813,14 +821,6 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
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
@@ -890,6 +890,16 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		}
 	} else {
 		switch (soc_type) {
+		case QCA_QCA2066:
+			qca_get_nvm_name_by_board(config.fwname,
+						  sizeof(config.fwname),
+						  "hpnv", soc_type, ver,
+						  rom_ver, boardid);
+			break;
+		case QCA_QCA6390:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/htnv%02x.bin", rom_ver);
+			break;
 		case QCA_WCN3950:
 			if (le32_to_cpu(ver.soc_id) == QCA_WCN3950_SOC_ID_T)
 				variant = "t";
@@ -912,15 +922,6 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
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
@@ -954,9 +955,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	}
 
 	switch (soc_type) {
-	case QCA_WCN3991:
 	case QCA_QCA2066:
 	case QCA_QCA6390:
+	case QCA_WCN3991:
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index c511546f793e..d8e5957a2edf 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1850,6 +1850,7 @@ static int qca_power_on(struct hci_dev *hdev)
 		return 0;
 
 	switch (soc_type) {
+	case QCA_QCA6390:
 	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
@@ -1858,7 +1859,6 @@ static int qca_power_on(struct hci_dev *hdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
-	case QCA_QCA6390:
 		ret = qca_regulator_init(hu);
 		break;
 
@@ -2092,6 +2092,18 @@ static const struct hci_uart_proto qca_proto = {
 	.dequeue	= qca_dequeue,
 };
 
+static const struct qca_device_data qca_soc_data_qca2066 __maybe_unused = {
+	.soc_type = QCA_QCA2066,
+	.num_vregs = 0,
+	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES |
+			QCA_CAP_HFP_HW_OFFLOAD,
+};
+
+static const struct qca_device_data qca_soc_data_qca6390 __maybe_unused = {
+	.soc_type = QCA_QCA6390,
+	.num_vregs = 0,
+};
+
 static const struct qca_device_data qca_soc_data_wcn3950 __maybe_unused = {
 	.soc_type = QCA_WCN3950,
 	.vregs = (struct qca_vreg []) {
@@ -2148,18 +2160,6 @@ static const struct qca_device_data qca_soc_data_wcn3998 __maybe_unused = {
 	.num_vregs = 4,
 };
 
-static const struct qca_device_data qca_soc_data_qca2066 __maybe_unused = {
-	.soc_type = QCA_QCA2066,
-	.num_vregs = 0,
-	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES |
-			QCA_CAP_HFP_HW_OFFLOAD,
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
@@ -2398,6 +2398,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		qcadev->btsoc_type = QCA_ROME;
 
 	switch (qcadev->btsoc_type) {
+	case QCA_QCA6390:
 	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
@@ -2406,7 +2407,6 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
-	case QCA_QCA6390:
 		qcadev->bt_power = devm_kzalloc(&serdev->dev,
 						sizeof(struct qca_power),
 						GFP_KERNEL);
@@ -2418,9 +2418,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	}
 
 	switch (qcadev->btsoc_type) {
+	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
-	case QCA_WCN6750:
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*
 			 * Backward compatibility with old DT sources. If the
-- 
2.34.1


