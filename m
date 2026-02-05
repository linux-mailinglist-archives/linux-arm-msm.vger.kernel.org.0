Return-Path: <linux-arm-msm+bounces-91857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGi8LCk4hGn51AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 07:26:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16131EF042
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 07:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1207A3004F7F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 06:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374DC3385A1;
	Thu,  5 Feb 2026 06:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GP83USww"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81F22ECE8F;
	Thu,  5 Feb 2026 06:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770272775; cv=none; b=NQqUDzAouM2zwou9SBjcHsyRuu8cnxFfu9CuxcSyai3RJenfyCJqZmkTAs/x7ZoBTkQitw7ADTwAcZkFG3BovCIKo4XZ19AvAuzYTXfoolxDFUh7jY3wHUXw1PSd3JubYuV6cqorTaExUxcoFAp6X+coPZwfp+narfQv8It4W6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770272775; c=relaxed/simple;
	bh=sw7UpDS3y4iMGm5Bh6/0x10zFe1u8Ez46OUTDNTONt8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zlqiza5itK0IQAj1qP9rswKlP0ggR1cdk4JHx13bRjkXeLgAIY6UFAfKZgdgKEkiMVvzVJ8jqL8Ls+mVaXXLFSKBrspIzwG5VG08AgTfSztNhudNfd7ysuy+UILxDC1LVLauKh2osKZLcWnKmk/rjPYiBWbycj0R4B+l5JsvIac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GP83USww; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153dkEu2639660;
	Thu, 5 Feb 2026 06:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Hxerc0LyiMC92Vo1hPHrELEl8XJJrO5oER1
	iDKlAm5M=; b=GP83USwwMvC7k3YtumekhpLcHG7NeiNU4rSuDl5t/HsaQEi38k1
	FxZgz1/UYIV9eovOCmoJA836Bw5GiIhqFpQH0HY3NdHVxlmSJoaMAk5rrt/LPf2A
	+wX0B2JAjt+e68+LlrA3qM4d4LC6fpVmGHiLfcerpAkwKDwAzOWePAgzTlocXIuY
	7XycMDIDs78gg1qeVP7aoYoz0/L9t6TKBIlTbfEmbX1JiuOyWNdeoW/md60VYIoJ
	VVHtpVVvirpLMYEPVt74Fs2H+jcjaOyinxayAysL/cDrTrIY8QlaiqdOmNMbDNU6
	PkmlUjrNuCS7+xzgK369XHwNLWDF6S3+Mfg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47qvamwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Feb 2026 06:26:06 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 6156Q4CL032270;
	Thu, 5 Feb 2026 06:26:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4c1atnbej5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Feb 2026 06:26:04 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6156Q4lU032260;
	Thu, 5 Feb 2026 06:26:04 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 6156Q44N032255
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Feb 2026 06:26:04 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 868CD23A43; Thu,  5 Feb 2026 14:26:03 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, bartosz.golaszewski@oss.qualcomm.com
Subject: [PATCH v5] Bluetooth: hci_qca: Cleanup on all setup failures
Date: Thu,  5 Feb 2026 14:26:00 +0800
Message-Id: <20260205062600.590342-1-jinwang.li@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GaEaXAXL c=1 sm=1 tr=0 ts=698437fe cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=95DwVkJNuoUxX1E7SugA:9
X-Proofpoint-GUID: V2AyyrEv85kmd2e8t61B24Qg17ZDM0uu
X-Proofpoint-ORIG-GUID: V2AyyrEv85kmd2e8t61B24Qg17ZDM0uu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA0MyBTYWx0ZWRfX0xXLk59jhH0R
 Q8umgDBx7WiVVVcA/WpVcvu1d/FMCBTa80WPgr14NtZZ5Tcwz0oDJ9gi0k9O+FrVZirfgtTcwCd
 R0nBoFi5xOc6AeRDJzekIupK+VmGoOn9q7oaPG1QWsjwB8mJrIIXwilmONns2uxuER4ZQqZAyjB
 R7TI3Ra3mXULN+83sNYH0nqhH0wRg1extLp+fQ3fTMArzczGnBwDqzdfZZIE4P2g9aQzCz+vTlF
 sDSSeaGTlQSebXGSQOdnnMGtAWzz+Qa2w6ZWqr7OjlSSLOnY7dW+pPA1oJDUUtp/0fp+KkzuGc7
 8/ZtfX5gv18rViYVhRk1vJR2j0K8PJDQ+HLEMZxT5np/kwivY/TanN4kIeh4ejoi5VVzdikW87a
 IC+b6923ECD4YfzNTErfk+nm5c0nIv78gtzezq45NSZ+TFIaRqvis3C+eOtwxpp+iWWjP5Yme36
 BtT05Pz67SUKVdSDiRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_08,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050043
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,chromium.org,quicinc.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91857-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jinwang.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 16131EF042
X-Rspamd-Action: no action

The setup process previously combined error handling and retry gating
under one condition. As a result, the final failed attempt exited
without performing cleanup.

Update the failure path to always perform power and port cleanup on
setup failure, and reopen the port only when retrying.

Fixes: 9e80587aba4c ("Bluetooth: hci_qca: Enhance retry logic in qca_setup")
Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
V4 -> V5: 
- Close and reopen the serdev only on retry attempts.
- When the open fails, hci_dev_open_sync() will run its cleanup path.
- Link to v4
  https://lore.kernel.org/all/20260106094310.784564-1-jinwang.li@oss.qualcomm.com/

V3 -> V4: 
- Add 'Fixes:' tag.
- Link to v3
  https://lore.kernel.org/all/20260105141427.196411-1-jinwang.li@oss.qualcomm.com/

V2 -> V3:
- Update git name.
- Link to v2
  https://lore.kernel.org/all/20251226102707.3449789-1-jinwang.li@oss.qualcomm.com/

V1 -> V2:
- Only reopen the serdev port when retrying.
- Return on the final failure.
- Update commit.
- Link to v1
  https://lore.kernel.org/all/20251222123824.3000167-1-jinwang.li@oss.qualcomm.com/
 drivers/bluetooth/hci_qca.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index b54350317a43..ab6bfc1d7197 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2045,19 +2045,23 @@ static int qca_setup(struct hci_uart *hu)
 	}
 
 out:
-	if (ret && retries < MAX_INIT_RETRIES) {
-		bt_dev_warn(hdev, "Retry BT power ON:%d", retries);
+	if (ret) {
 		qca_power_shutdown(hu);
-		if (hu->serdev) {
-			serdev_device_close(hu->serdev);
-			ret = serdev_device_open(hu->serdev);
-			if (ret) {
-				bt_dev_err(hdev, "failed to open port");
-				return ret;
+
+		if (retries < MAX_INIT_RETRIES) {
+			bt_dev_warn(hdev, "Retry BT power ON:%d", retries);
+			if (hu->serdev) {
+				serdev_device_close(hu->serdev);
+				ret = serdev_device_open(hu->serdev);
+				if (ret) {
+					bt_dev_err(hdev, "failed to open port");
+					return ret;
+				}
 			}
+			retries++;
+			goto retry;
 		}
-		retries++;
-		goto retry;
+		return ret;
 	}
 
 	/* Setup bdaddr */
-- 
2.34.1


