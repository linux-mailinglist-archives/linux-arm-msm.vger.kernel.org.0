Return-Path: <linux-arm-msm+bounces-99519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKvlMEj3wWkmYgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:30:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D90430129B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CD3E3301BDEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAE3185B48;
	Tue, 24 Mar 2026 02:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FisRoSoc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D9114F9FB;
	Tue, 24 Mar 2026 02:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774319430; cv=none; b=sFdsd45ktzacHkCJCvXlEiu1H9O4q0/7+sRup9yAT8u8i2zXAGgGfwY446+oHvJA7qER8XKp7OI1MZMFoSW1AkLkvOiuE7Xr2fVtSQbzpnyaOUqd0zbPw7z7K/UO3r110jcfFxR4xi8YkoI0LiExi/VW9+Wdw8ancLmmkKe3iTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774319430; c=relaxed/simple;
	bh=IIYuxEPx3zyTAp/M4ZwjGghMDdGK+bSQSfVkIBTV7SE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nKCM4vgbLdgMsH00EWF7kO1QAFScfC0qpQqia4iwuQtmzGwPfQczOpHJeym9wzN7peOf498WTb84kybGxB5uFQyqVbSiOBaBvUZapu+UGU3FqCwBYZEsLHOPUfB2rkIcHBAoSSs02Elos+IpEHVy79mRhQGT4MaJZxvjqoViztk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FisRoSoc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqYkW3170681;
	Tue, 24 Mar 2026 02:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=o+0LCs9dOQ4rMG2qFls3tT2O/bZZDDzcE4P
	wntoxJB0=; b=FisRoSocWbfYAj+mvl5RSOCyxggTXeYQjyFeX2IdXmSNx8k7xnw
	y++9TX3aJODpqf5ZlssrLv4dfJrL5By+k76N0bMc411dha/GQwX8EdXwZPuDzhFt
	o6uT4ink1Fg8hRi7QLWn/mFhkThwgOJJ9wNsQDMPQ4tJ5rC45n25bzhRtQ87Ub2J
	dqxfQJt25vHO0VBw/0jNANfy6Rk0N6zexG9VaocJ4QE6avgSTDMzbQfO8XAERY+l
	/yfxENbWYv9alaswyVL/ICACRdh4Gd6pFy83mZ1uDoLOm4VM09Jz+Orp/SVkbGy4
	SXqTlRO/+XrG/5daW8W7jQu2x6OjyAA3Ufw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r22m8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 02:30:22 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62O2UJHF002515;
	Tue, 24 Mar 2026 02:30:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4d1mdm9hgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 02:30:19 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62O2UJ9A002509;
	Tue, 24 Mar 2026 02:30:19 GMT
Received: from shuaz-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 62O2UI9U002507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 02:30:19 +0000
Received: by shuaz-gv.ap.qualcomm.com (Postfix, from userid 4467449)
	id C18E35E8; Tue, 24 Mar 2026 10:30:17 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v3] Bluetooth: hci_qca: disable power control for WCN7850 when bt_en is not defined
Date: Tue, 24 Mar 2026 10:30:16 +0800
Message-Id: <20260324023016.3889062-1-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c1f73e cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=98nF6S5uk-b2QhZ6SZYA:9
X-Proofpoint-GUID: oXlFQ0FRFJVdMSCHShRqkHgqpAFr7lp-
X-Proofpoint-ORIG-GUID: oXlFQ0FRFJVdMSCHShRqkHgqpAFr7lp-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAxOSBTYWx0ZWRfXwPqdJzNd/Yvd
 bwlEitbPScFgMvMiWyFaxlupotktzkuiA5AD44cWpdYW2/rb13pnBDjhZnfaWAVeiJAmcIAM6h5
 3ZojF4Jk1ybwaHqqHQKtr67GQvJ+2N7rQeO69I2KH3Fcqte766rwRDDpjG0HUaCTdm2Jj+mFz9P
 T92wqftwpKU0UtY+55dWzssZ44UItQNnlIN9b7oMNj7rqNBHTTMPWjbSeKOo25xnKlWw9HmbQ2+
 EN+NCAqr5ptrfLKCqbBeYarAS13MXaseC7TJ+L7nXDg/Tfk2/tHSUMX3m63YAW/1EXipQLnJAAQ
 NH5dTmzHBXdgxEgA4How/nqAKgKM1GKz8jYcLOn4ehmvBixw6iTY0YU33MnvOcyC9GqB4PnvxBd
 bSu6dhyHqL1W1GDngV+/E+nt2q/PghaKgDpOkxMGCXRTkpOq7uIlh7wJKEewJgVnTC7vBPEAtXo
 EWSnIV/K0KtrutWYIjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240019
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99519-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6D90430129B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On platforms using an M.2 slot with both UART and USB support, bt_en is
pulled high by hardware. In this case, software-based power control
should be disabled. The current platforms are Lemans-EVK and Monaco-EVK.

Add QCA_WCN7850 to the existing condition so that power_ctrl_enabled is
cleared when bt_en is not software-controlled (or absent), aligning its
behavior with WCN6750 and WCN6855

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
Changes for v3
- Add change history.
- Link to v2: https://lore.kernel.org/all/20260319075125.76539-1-shuai.zhang@oss.qualcomm.com/

Changes for v2
- Expand the commit description to include the affected platforms.
- Link to v1: https://lore.kernel.org/all/20260319031040.4096297-1-shuai.zhang@oss.qualcomm.com/
---
 drivers/bluetooth/hci_qca.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index c17a462aef55..4512ff7cd0c0 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2484,7 +2484,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 		if (!qcadev->bt_en &&
 		    (data->soc_type == QCA_WCN6750 ||
-		     data->soc_type == QCA_WCN6855))
+		     data->soc_type == QCA_WCN6855 ||
+		     data->soc_type == QCA_WCN7850))
 			power_ctrl_enabled = false;
 
 		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
-- 
2.34.1


