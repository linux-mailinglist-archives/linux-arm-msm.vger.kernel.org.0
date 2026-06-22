Return-Path: <linux-arm-msm+bounces-114031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v3AGFZ1MOWrnqAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:54:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B29306B082E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:54:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D9LEvdIY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HSW1BG6Q;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114031-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114031-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF1913039262
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026B731B803;
	Mon, 22 Jun 2026 14:52:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0701311C38
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139945; cv=none; b=KJ0FcbL2d2FEajiTXUAriLYNFcjSFB6sUbkkGuqDsMuYH6qLNPwFlnqojwsSqpKEIGhEFZUIG39mqhekEpZsFhRpiO25+TMknwLXvGeOPI3L2CPl8tn1VVwYcpVp5q8fL9rDFvW9uIiZl35RsTJxDFqpPymGnQKZA8sOQF76RTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139945; c=relaxed/simple;
	bh=p8F6QkLRVD5oUWLabKHDe/oJZxyvmx/Gd6VZzexn/jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WJ2pEDvdi27bGU/3IxaXNJlyyE96kgGI/L2Cn30KBLfvycGidfv2t1pmnO7695JGM1d0jjgh1ppvR1MV47Pj7oRW4o/9iETfrwnkCenBWktytjflVEf0G/BgSm+6DvxODskwMKrhS+vvSzFg263vY9lkR4fMC3RXBJDdB2fu2Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D9LEvdIY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSW1BG6Q; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGBRk776389
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	235gNcfFV3kkqtG19jSUUgPcN6QOmLAdx+z2l1LbSmQ=; b=D9LEvdIYxnmkt9ii
	ayvBSa4dw34JRptMP9+deN5McctdoeE2DkkcDMesWlM9EjmsmygX8UxNf2OxSpuu
	ylBysrUMB9kVuK9i0sJhCic8woanaKO6ZCbbRsU2w9QwJ3x6oL+t6jMwamjvWjIA
	zGSh0vvSO3JP7uN3PlMc/3Wv0wZ3HcfWyivlvSC+PP6wgQMCEgaf4SstQ+FMDxzj
	xID2J3+7Kgx0uDKPDRYxrZxAW00FjAAAprbZCnNOf4+SHQ/FY8oqLyDmsP5x9Oo0
	KTFogrYi4Atenx52TT111Lxf8kWTFu6oDJrropsWvmlMGm/fX/+mIbt+FFXzq6e0
	GAVudg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yj90db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30beba84d2bso2683eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782139941; x=1782744741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=235gNcfFV3kkqtG19jSUUgPcN6QOmLAdx+z2l1LbSmQ=;
        b=HSW1BG6QoEKpL69f8FH4OKY76hgFeFEB/hmwRocCrMTkyKyzAwU/PdaZmumdTFtP9j
         HfFxVh5qcSABVippZgv07RnviwichRf+S197pxqe3pZYhndR/4nNrv98Ae5hY1QNqsKV
         w/zqxdoCKyFQM2p7ndQamrWuvT8eGXm4OXW8Hsie7pYh79/tOBDYvB4nzqX5ctsnRaCN
         frYSFZR1oZDhnNJfh6zk4+9Jax9qtRrgU8EXygE84k7Gk3znn7gmG++JthnBf/kIjZaS
         Sp5lBwPFQ73bLpgjG55LtABpWfUnjnCSrMZwXrwct9r9cVf9NKlAaERs6gg0tp62yhY2
         3tOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139941; x=1782744741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=235gNcfFV3kkqtG19jSUUgPcN6QOmLAdx+z2l1LbSmQ=;
        b=QbXGu6YkEuF64Vw0nXz3eopMU8g2eojNWGEUP59nWRyeKu5M4lVpYFxMrySUbldorb
         74Dbc6ZukC0Aj3clmQzitgkzeJ2FqoyJc+jIsueCdGzlo0XPyOw+q4LBfxtaiJNED7Mp
         704Z9lmCkaiJgo39j9NqFKcgIsi+zSUrkg18SxCyzQuL0csAnlppuISfP/SrOMm5YkXd
         oYolOkYvF3dYKPrZD1Q8cz5e7bWjnVmpK5dTIv7+GurLmIAR5xx5bhh5FSSKnVO3lXGQ
         s3PH9OWSOIWPFrFADe8jn28xVYEPaEI3xacNVLp8kGbHWXGrCLX78SNCDx2VyVVXd7/k
         FpNg==
X-Forwarded-Encrypted: i=1; AHgh+RownFEGn7SeB8xurhb1WHfxjWRWenYeU5GRDgTkvkIaznIAg8xJTIf8z9OyBOuFaemWVfPHBq9OVWslQN/3@vger.kernel.org
X-Gm-Message-State: AOJu0YzT1mxqIjt+gY4QgsBK7pE63DQun+FM/QKMZwI8YBtDyQDwlAxB
	OB7vm0lEN3p1c7RYx3jhxrQtoZoq9R1JmWMrBnRv4COLvcWhad+QYFHxBHxYQ9jkDnC3kjAIlcc
	pVzCaX3xAjETRRovwUvdJ+uXDp3mvv7o7tZNdi8KVJwZ/V+HIUi0kV9IHlrIURU9FzQ4/
X-Gm-Gg: AfdE7cm7QoDbUfh6WLBh9lOiT78dI4Lg73f224ZpoTV2YiTjD0Ztj4va8KuCvparPIV
	kaU2VpNbesqq76zb3UYP3oLm9gtva2UE0ra/8IySSg4F6K4CHud3Fsq1cswpn6BAXhFe+PTJyaB
	pQfWfccJvglwOV52gDI+XtEZ2r3xA0+ovmav9lOQayiNKU/ZWz6IXGE+Cr9oDAN9vlyRCnmc3bw
	PDwQ7pBGdZ35jUOyWmclqu8X0QkL91x4KKDRD3sF1rIRxM6b4jtCRYrEXYDb4qLmU4Fm3A0FUG6
	/4CBMyX1a1dWDuFQkQ5wUJ4qnljM+fjBWPNKBZoUyvgF+QsRedmSJa6AzzWfk9LKOMzeBqQgkqd
	KtW2FGyNZw5/Icsf3FlLrqbDawvw/UuImynmba18aiB7QZm7SAnlcM1eRyQ==
X-Received: by 2002:a05:7301:10c1:b0:304:e327:aef8 with SMTP id 5a478bee46e88-30c17b68722mr3562185eec.2.1782139940802;
        Mon, 22 Jun 2026 07:52:20 -0700 (PDT)
X-Received: by 2002:a05:7301:10c1:b0:304:e327:aef8 with SMTP id 5a478bee46e88-30c17b68722mr3562168eec.2.1782139940087;
        Mon, 22 Jun 2026 07:52:20 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bddfe34sm12025561eec.20.2026.06.22.07.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:52:19 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 07:52:18 -0700
Subject: [PATCH 05/13] Bluetooth: btusb: QCA: move qca_dump out of struct
 btusb_data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-bt_bugfix-v1-5-11f936d84e72@oss.qualcomm.com>
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
In-Reply-To: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ben Young Tae Kim <ytkim@qca.qualcomm.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: tIje035TA_g4CJFUTV40RCXKjZJl4vB5
X-Proofpoint-GUID: tIje035TA_g4CJFUTV40RCXKjZJl4vB5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX84PkqaSOXNdG
 m6WZmMqiEi1qqxKK7SL3D2wps5ulQb2GbCC9pb2ALBtXVtaLrIgS9hqXTKBbcyjVR/46X03oLqQ
 vcRYkKEfBuTJq1ObMZ7X0/ClUvVt61w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX5+JGKHi8fkRJ
 OUThxGpbqHu4opqygwkIPx2qZaIVJSPFoJoEAYLDBW09t30EHcBmVy7/QJkQa0Jsj/s81oFkUrt
 O1VCt6Tu6Xnp7P5uYYqsHjsP54z2UWtBPN2KPsC5EX2jUDoEUsnXSAZiNH27MRtUwdQGWMWJdic
 3sKMGpb8KzF1vv1SuqDEnPbpwGY+pFKwWxZAjhSXJD691lVtwNoLIP9dvi89Qirpq6ScJoWRqNM
 ouDUd5ncMb7dbUkKIzjFb3hBC86kCDHgJYm5H3WrFCj+8XiQpfs2GBhFbre+xBYClr/2mCln2fZ
 0DkrUxGOtrpJGqOYV1zlaEF6xyFuZdQ+3Jbn9I/Vj978YFx/8Nall5WVIywy9I3Dwt9vfygpkY9
 nqX7G6BYeZG94zoXqME+vNWwIfn1G3TxzW/Ns2oekbI5L0h/36/L0k3irVT6ZguQxCtAuUivL2h
 jbIDWuVKWLGFlvyF9dA==
X-Authority-Analysis: v=2.4 cv=YLSvDxGx c=1 sm=1 tr=0 ts=6a394c25 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0qFWW5pOsv3iMAJ541kA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114031-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B29306B082E

'struct btusb_data' ideally should not include vendor specific
fields, but it currently includes the QCA devcoredump member
'struct qca_dump_info qca_dump'.

Fix by moving it into hci_dev private area accessed by hci_get_priv().

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 56 ++++++++++++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 184a87d1234c..6f965c313dff 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -939,6 +939,10 @@ struct qca_dump_info {
 	u16 ram_dump_seqno;
 };
 
+struct btqca_data {
+	struct qca_dump_info qca_dump;
+};
+
 #define BTUSB_MAX_ISOC_FRAMES	10
 
 #define BTUSB_INTR_RUNNING	0
@@ -1025,8 +1029,6 @@ struct btusb_data {
 	int (*disconnect)(struct hci_dev *hdev);
 
 	int oob_wake_irq;   /* irq for out-of-band wake-on-bt */
-
-	struct qca_dump_info qca_dump;
 };
 
 static void btusb_reset(struct hci_dev *hdev)
@@ -3116,14 +3118,15 @@ struct qca_dump_hdr {
 static void btusb_dump_hdr_qca(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	char buf[128];
-	struct btusb_data *btdata = hci_get_drvdata(hdev);
+	struct btqca_data *btqca_data = hci_get_priv(hdev);
+	struct qca_dump_info *qca_dump_ptr = &btqca_data->qca_dump;
 
 	snprintf(buf, sizeof(buf), "Controller Name: 0x%x\n",
-			btdata->qca_dump.controller_id);
+			qca_dump_ptr->controller_id);
 	skb_put_data(skb, buf, strlen(buf));
 
 	snprintf(buf, sizeof(buf), "Firmware Version: 0x%x\n",
-			btdata->qca_dump.fw_version);
+			qca_dump_ptr->fw_version);
 	skb_put_data(skb, buf, strlen(buf));
 
 	snprintf(buf, sizeof(buf), "Driver: %s\nVendor: qca\n",
@@ -3131,7 +3134,7 @@ static void btusb_dump_hdr_qca(struct hci_dev *hdev, struct sk_buff *skb)
 	skb_put_data(skb, buf, strlen(buf));
 
 	snprintf(buf, sizeof(buf), "VID: 0x%x\nPID:0x%x\n",
-			btdata->qca_dump.id_vendor, btdata->qca_dump.id_product);
+			qca_dump_ptr->id_vendor, qca_dump_ptr->id_product);
 	skb_put_data(skb, buf, strlen(buf));
 
 	snprintf(buf, sizeof(buf), "Lmp Subversion: 0x%x\n",
@@ -3160,6 +3163,8 @@ static int handle_dump_pkt_qca(struct hci_dev *hdev, struct sk_buff *skb)
 
 	struct qca_dump_hdr *dump_hdr;
 	struct btusb_data *btdata = hci_get_drvdata(hdev);
+	struct btqca_data *btqca_data = hci_get_priv(hdev);
+	struct qca_dump_info *qca_dump_ptr = &btqca_data->qca_dump;
 	struct usb_device *udev = btdata->udev;
 
 	pkt_type = hci_skb_pkt_type(skb);
@@ -3187,8 +3192,8 @@ static int handle_dump_pkt_qca(struct hci_dev *hdev, struct sk_buff *skb)
 			goto out;
 		}
 
-		btdata->qca_dump.ram_dump_size = dump_size;
-		btdata->qca_dump.ram_dump_seqno = 0;
+		qca_dump_ptr->ram_dump_size = dump_size;
+		qca_dump_ptr->ram_dump_seqno = 0;
 
 		skb_pull(skb, offsetof(struct qca_dump_hdr, data0));
 
@@ -3200,29 +3205,29 @@ static int handle_dump_pkt_qca(struct hci_dev *hdev, struct sk_buff *skb)
 		skb_pull(skb, offsetof(struct qca_dump_hdr, data));
 	}
 
-	if (!btdata->qca_dump.ram_dump_size) {
+	if (!qca_dump_ptr->ram_dump_size) {
 		ret = -EINVAL;
 		bt_dev_err(hdev, "memdump is not active");
 		goto out;
 	}
 
-	if ((seqno > btdata->qca_dump.ram_dump_seqno + 1) && (seqno != QCA_LAST_SEQUENCE_NUM)) {
-		dump_size = QCA_MEMDUMP_PKT_SIZE * (seqno - btdata->qca_dump.ram_dump_seqno - 1);
+	if ((seqno > qca_dump_ptr->ram_dump_seqno + 1) && seqno != QCA_LAST_SEQUENCE_NUM) {
+		dump_size = QCA_MEMDUMP_PKT_SIZE * (seqno - qca_dump_ptr->ram_dump_seqno - 1);
 		hci_devcd_append_pattern(hdev, 0x0, dump_size);
 		bt_dev_err(hdev,
 			   "expected memdump seqno(%u) is not received(%u)\n",
-			   btdata->qca_dump.ram_dump_seqno, seqno);
-		btdata->qca_dump.ram_dump_seqno = seqno;
+			   qca_dump_ptr->ram_dump_seqno, seqno);
+		qca_dump_ptr->ram_dump_seqno = seqno;
 		kfree_skb(skb);
 		return ret;
 	}
 
 	hci_devcd_append(hdev, skb);
-	btdata->qca_dump.ram_dump_seqno++;
+	qca_dump_ptr->ram_dump_seqno++;
 	if (seqno == QCA_LAST_SEQUENCE_NUM) {
 		bt_dev_info(hdev,
 				"memdump done: pkts(%u), total(%u)\n",
-				btdata->qca_dump.ram_dump_seqno, btdata->qca_dump.ram_dump_size);
+				qca_dump_ptr->ram_dump_seqno, qca_dump_ptr->ram_dump_size);
 
 		hci_devcd_complete(hdev);
 		goto out;
@@ -3230,10 +3235,10 @@ static int handle_dump_pkt_qca(struct hci_dev *hdev, struct sk_buff *skb)
 	return ret;
 
 out:
-	if (btdata->qca_dump.ram_dump_size)
+	if (qca_dump_ptr->ram_dump_size)
 		usb_enable_autosuspend(udev);
-	btdata->qca_dump.ram_dump_size = 0;
-	btdata->qca_dump.ram_dump_seqno = 0;
+	qca_dump_ptr->ram_dump_size = 0;
+	qca_dump_ptr->ram_dump_seqno = 0;
 	clear_bit(BTUSB_HW_SSR_ACTIVE, &btdata->flags);
 
 	if (ret < 0)
@@ -3709,8 +3714,10 @@ static int btusb_setup_qca(struct hci_dev *hdev)
 		return err;
 
 	if (btdata->match_id->driver_info & BTUSB_QCA_WCN6855) {
-		btdata->qca_dump.fw_version = le32_to_cpu(ver.patch_version);
-		btdata->qca_dump.controller_id = le32_to_cpu(ver.rom_version);
+		struct btqca_data *btqca_data = hci_get_priv(hdev);
+
+		btqca_data->qca_dump.fw_version = le32_to_cpu(ver.patch_version);
+		btqca_data->qca_dump.controller_id = le32_to_cpu(ver.rom_version);
 	}
 
 	if (!(status & QCA_SYSCFG_UPDATED)) {
@@ -4174,6 +4181,9 @@ static int btusb_probe(struct usb_interface *intf,
 	} else if (id->driver_info & BTUSB_MEDIATEK) {
 		/* Allocate extra space for Mediatek device */
 		priv_size += sizeof(struct btmtk_data);
+	} else if (id->driver_info & BTUSB_QCA_WCN6855) {
+		/* Allocate extra space for QCA WCN6855 device */
+		priv_size += sizeof(struct btqca_data);
 	}
 
 	data->recv_acl = hci_recv_frame;
@@ -4316,8 +4326,10 @@ static int btusb_probe(struct usb_interface *intf,
 	}
 
 	if (id->driver_info & BTUSB_QCA_WCN6855) {
-		data->qca_dump.id_vendor = id->idVendor;
-		data->qca_dump.id_product = id->idProduct;
+		struct btqca_data *btqca_data = hci_get_priv(hdev);
+
+		btqca_data->qca_dump.id_vendor = id->idVendor;
+		btqca_data->qca_dump.id_product = id->idProduct;
 		data->recv_event = btusb_recv_evt_qca;
 		data->recv_acl = btusb_recv_acl_qca;
 		hci_devcd_register(hdev, btusb_coredump_qca, btusb_dump_hdr_qca, NULL);

-- 
2.34.1


