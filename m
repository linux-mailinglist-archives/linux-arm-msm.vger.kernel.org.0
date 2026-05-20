Return-Path: <linux-arm-msm+bounces-108712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKw3GR2VDWoMzwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:03:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6B358C13A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79418306445D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5613DA5D3;
	Wed, 20 May 2026 11:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZCEqkdp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OMOh5Fkt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EB83DA7E0
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779274917; cv=none; b=iIIFaWPb3EXrpnSotbAS+RKCg7VMG7C6KRoAEJaWiUD8bLNMwsN9e6u42QkJvHKTNLpnkVpO9/j7QqCNbWlVGO9v9CAAn2QYVsPnFQjsq8ZNRIofJmdOf6YHuT+iGI/p4UNYRG4l1b8pAygh1pGYO1qi+/snNZvPLt0WK2fdZaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779274917; c=relaxed/simple;
	bh=IwOf3bKBO2x+9q5gt71IHZnJfjB3imuDUZjTiln6iJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TLWanT+7Zond6rptYKgXMbGBeD7GjlKHnA8396XCgQrMALxGIDDE2EK2xjlUxTWK71NCvkBWcWdKXs35oSuM8hPZHCCkp+oSvgrUh4xes6jlyMCmmQ3GoYMsfB3n6SU5nFCseRj5J+DNhANrkuB0jAJ3FB+04hPHFxXV/i/rj8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZCEqkdp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMOh5Fkt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K76Fsc2063911
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GI2hbxpBYvrJsq1N33WhlyERapASJ5myJdAz+CdIXHg=; b=IZCEqkdpOmuOTAfo
	FFowHjttUxAGEL6dabmLFG5uG6JmVQGx+XH/JDks/TMnGdpG5sjS9jPt135PwXvh
	kM5fFIOafts3NfhPGblJstja8QPnvh+kV5dLlYv1ptiGnNrb4+a/JMdGJY0dCbeu
	QUhV50m0qOAgJPty5vTS9P0oL5xiCdoiEW9eA55XCXBBsMEsGcY1kVZEQBITBS5N
	25PCZ2uPQBMNUpMgaGZMbh0yy7uEhwpfEAJii60KgznRKtjH6CLVZd3E1xwvhyKQ
	bCUP7Gngp6u63mFxaXTSFzu4kq9FN8//0qECmODT7ITvORD1Bh+1wcQcjMlJh5tB
	hxBTGw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t4ayd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:01:55 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-69d4ecb1620so1762321eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 04:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779274914; x=1779879714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GI2hbxpBYvrJsq1N33WhlyERapASJ5myJdAz+CdIXHg=;
        b=OMOh5Fkt3jOFs0GGVa5+j+6D25HQSqP/WEokwMhyHCRrrrCnQoY5S2mC4CGTOPwU1b
         Cz8zWmZuEYoj837m3TLk5n3IwE7ogclSl5G+o7WxpnZw9+ToIchFnh9Evn1r+Nplp0cG
         TTtlCqHKTY9ovhMHoIFbARxVswAmfgs94Agr3H9o/7KrtMe5zRev9F7M+CBb2jz5bSeE
         WFsWng9FnTaV/liEmnZsNIKnOGJ2PhwHoZJbnrWz4ZbJRBdC1y0rrtK2TJxnS2/z6cCo
         NL18G2SLHdks/H09+e+z236XJYDvZShgvCJn8SA0tGr7HTUWmgr1PsC95IJa/xvtLddx
         O2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779274914; x=1779879714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GI2hbxpBYvrJsq1N33WhlyERapASJ5myJdAz+CdIXHg=;
        b=f8xo/8f3yeQtnAofp6v9Ne3sz2AbsY3tuQ6XyvIi2k2fhaQZeP7euHp0hZMjEWze19
         G3uwyWTDiDxZZzvp20SuPI5h/tGLiAxpcVxK/lYZ/pfyVgDHJPH8AZwQ30TbruYu5eox
         PFaC2H0+mAhVv2nmEuDhD2PJ7hcepQaM1viUH8MldTTJ9YFieSdBLt6uE9nHezYuyHnR
         6AIUyjtS9a0YjU/tTD1QtaNrE5/kBr4bKq0qHZXb0xZu3KHYchIzfJ9zTBb/JeKNohi5
         Cr1MtqRsieskwhAb9DZF3+CZwqNcCHo2nONEGG+6A+9XQtAWqIPVGTDYP7ZqIeJN94+q
         QzDg==
X-Forwarded-Encrypted: i=1; AFNElJ9yBHQQ3VdnHoyzwGfwllp8tCQwoTQNZ6nRmkLHMNkNclgj7NNJBbkWiunu5Qly9uiOemMTkfwVi/nTqe00@vger.kernel.org
X-Gm-Message-State: AOJu0YykLuvTZl+/Ww/jq/f4nLMnpOPgAkswLh8cuhnlfaaSVLOJ2xyn
	SVh7dwRVyf22tiQm33eVf6fXnf0/L61nmvxqNLlceGHmEXpQZkZT2QX2BWfhi8nbUh2y73jXLTo
	WofMlP7izKk3PyDScQQyGmqm8vrn1g4wyw6jGq1CGedHUwwusD75synEKzCuy5uKJBn+Y
X-Gm-Gg: Acq92OH0Qg7OGCFnW3R2MSH1FflqnFxtyZodNtqIQlf2p2NX0HwmifCE4KdSQ67xwo6
	H0NDJQRxAgJjbfhHnmrxuLHS+Pz1W+zqXLaPd7sIU4l4g74U8t2/HfhT2skx7PRLEAlIjwsWyyV
	QaLqlcdxaUeNnyB0TafnpSG6H0u041odY5BnaHioMNdsUbRDRWqEZDUCCvOWXxBO/bSvLfgP5t9
	B0ovw3T7NQuFc/+XDmrWxL1+4K6/+TMwaj5rO47kEfHpfkVrvEbQ1J6VJ40Xl7SWitkaGP6GerP
	9EMiZqpAGIEy85VD7HoZ6MIYVyb7Ny87KbULX2xX9/7cVRuPk9YCjaeZcXbQ/3aQKxP443iWb9H
	R+sxwmn1Q2UlcYbdfUGr3j/9z+dDogz+nX8AVT09jcBn0NMNBY671cWTKjweNFQuCSWabUVtzoX
	pneXKRjUpwmzBU4iYg
X-Received: by 2002:a05:6820:858f:10b0:69d:50a5:5c48 with SMTP id 006d021491bc7-69d50a56172mr2610039eaf.21.1779274914423;
        Wed, 20 May 2026 04:01:54 -0700 (PDT)
X-Received: by 2002:a05:6820:858f:10b0:69d:50a5:5c48 with SMTP id 006d021491bc7-69d50a56172mr2609995eaf.21.1779274913931;
        Wed, 20 May 2026 04:01:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:9d48:e1ec:d837:6344])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4eb6320sm840310266b.59.2026.05.20.04.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:01:53 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 20 May 2026 13:01:43 +0200
Subject: [PATCH 2/3] Bluetooth: hci_qca: Support QCA2066 on M.2 connector
 via pwrseq
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-monza-wireless-v1-2-9f6942310653@oss.qualcomm.com>
References: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
In-Reply-To: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: MRJKcP9jUGISHi9j3KFosaqERXolL7Hr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEwNiBTYWx0ZWRfX4dg8Aedfqtm7
 SQEB6sxRoXZWECA6VBFVR5JL5CRUBsfmNNfhhpp/5Arj2DsZDdzCZ14mzjEXIek/j65CdK6XqJt
 UO3s4EYXg5/PMF9bht5QyqE2cgp6BB+sj2JwAwR58FgROPE9f1o7i5z17KO/X1STTuUzyRdf7n9
 pRbQm8CI//wU0knsPsOYfBxbuQ6hzPqEkRpJ8pvyojjBnHlI/zBlB0mBxvt+Tt49xZCQnMP4mVB
 uz7licNjXf60g/E60/amDc9QCT3T/nVKTXT+LlXfSmgxERj7mK/3cZdThbtsstdGJDXELbsQgoc
 dNHVqclhgiTozB6Cdn0S7mbCfZhdln1ifhU0dXn8QIrXhGHDx05P/HTziAWeHvfnk6lujHSs1zB
 rzR6b/31+QS/XW5SMviP56/A3aQhhpKYvmq8acjscQJfxRSWnsj8M40vOf+TCgIwBVpDZTDzWOa
 kCGSDWhLqg+2tAeW3rA==
X-Proofpoint-ORIG-GUID: MRJKcP9jUGISHi9j3KFosaqERXolL7Hr
X-Authority-Analysis: v=2.4 cv=C4LZDwP+ c=1 sm=1 tr=0 ts=6a0d94a3 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=CW3gqymaXyTMcD2nhgsA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108712-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA6B358C13A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable
is controlled by the W_DISABLE2# signal managed by the pcie-m2 power
sequencer rather than a dedicated BT enable GPIO.

When the serdev controller has an OF graph (indicating it is connected
to an M.2 connector), acquire the 'uart' pwrseq target from the
connector's power sequencer and use it to control BT power instead of
the bt-enable GPIO.

Also allocate bt_power unconditionally for all SOC types since the
pwrseq path is independent of the SOC type switch.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index b5439b9956cfb0497e6ba6ccd9ed61224d23a9dd..de5cba7b7f44e280a48dad5d670fa2758d3268d0 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1873,6 +1873,9 @@ static int qca_power_on(struct hci_dev *hdev)
 			/* Controller needs time to bootup. */
 			msleep(150);
 		}
+
+		if (qcadev->bt_power && qcadev->bt_power->pwrseq)
+			pwrseq_power_on(qcadev->bt_power->pwrseq);
 	}
 
 	clear_bit(QCA_BT_OFF, &qca->flags);
@@ -2415,25 +2418,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	else
 		qcadev->btsoc_type = QCA_ROME;
 
-	switch (qcadev->btsoc_type) {
-	case QCA_QCA6390:
-	case QCA_WCN3950:
-	case QCA_WCN3988:
-	case QCA_WCN3990:
-	case QCA_WCN3991:
-	case QCA_WCN3998:
-	case QCA_WCN6750:
-	case QCA_WCN6855:
-	case QCA_WCN7850:
-		qcadev->bt_power = devm_kzalloc(&serdev->dev,
-						sizeof(struct qca_power),
-						GFP_KERNEL);
-		if (!qcadev->bt_power)
-			return -ENOMEM;
-		break;
-	default:
-		break;
-	}
+	qcadev->bt_power = devm_kzalloc(&serdev->dev, sizeof(struct qca_power), GFP_KERNEL);
+	if (!qcadev->bt_power)
+		return -ENOMEM;
 
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3950:
@@ -2543,7 +2530,13 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			return PTR_ERR(qcadev->bt_en);
 		}
 
-		if (!qcadev->bt_en)
+		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
+			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev, "uart");
+			if (IS_ERR(qcadev->bt_power->pwrseq))
+				return PTR_ERR(qcadev->bt_power->pwrseq);
+		}
+
+		if (!qcadev->bt_en && !qcadev->bt_power->pwrseq)
 			bt_en_available = false;
 
 		qcadev->susclk = devm_clk_get_optional_enabled_with_rate(

-- 
2.34.1


