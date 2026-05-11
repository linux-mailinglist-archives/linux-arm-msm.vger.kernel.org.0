Return-Path: <linux-arm-msm+bounces-106949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEwbAFHiAWq1lwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:06:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9804D50FA45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0AF1F301DF6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0366D3FE35B;
	Mon, 11 May 2026 13:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIlmWjfd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CC53FCB03;
	Mon, 11 May 2026 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507966; cv=none; b=GvepRp0ayyeU7pf0E/rQl1OBQBhMamhiF6YnXEfMkDyxIQFCcmvcs8Pl8ZKiVdXogIYXnAdd5V9Zu3KaX5B1qzNd38X1akcan44cAvyErQ6GsL2vynl03Obt/TbS+1ug1QfB/UYZALjHOR17RTNLgp1kyLSQtJSF/6AYur/fdt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507966; c=relaxed/simple;
	bh=GxJylG5lOVTB/ixztFRmzwzVGtHfePl2rp5kNd9TTjc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nvDUaZrEDIsqGsf2a80qIM/1d0ik9EBEwjAJLbZQsxuR7UMDyQxqVmDYZ9vliRvYWXMoY22xP6InPtkZWJcjXCXt1i4D3VJdmap+K10215s+G4NTYOND4lN38USb+PuQpV/VaSPN6IYYuP6wVZ8+G98SzJ9sarC+vyhirKg9R28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIlmWjfd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BDHPVu1258415;
	Mon, 11 May 2026 13:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NDkR/w65DS253ceti+YfW4LrgkR4RO8h2d7
	atfEUTOk=; b=eIlmWjfdcUKJDt0HRIj4DFjd7kTp7DNTjAz2T+O1lYZqk63XoJT
	/Z2UBtege8dVhDAFWHBofqgiGpswxh7NQNBwEj7UTXtFR4HmgTfEkchRf/G2kO/E
	NADA4Awdbo7UAIHGbEh9As5LG3taxAXbpk/Kv/1NEgT5BdxdphI4NDxQZ33mQtt7
	n7rZShbqEdLub0gv05/5n6vpRv3ygRHtybBRTaixejApwwNRwxH/tHOQwT+eTpsK
	+3TpSh8xllTsCrzbP3yCVhmEyw+SCz8C/8urCPencK6OTT9VzPFOWx91r3zlOalM
	f7j2IUjtI2N1W5+c94Bj/M0Jeojml8H2Auw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag21e1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 13:58:59 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64BDwvcL025065;
	Mon, 11 May 2026 13:58:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4e1x0hx240-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 13:58:57 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64BDwvZD025059;
	Mon, 11 May 2026 13:58:57 GMT
Received: from shuaz-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 64BDwuUH025055
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 13:58:57 +0000 (GMT)
Received: by shuaz-gv.ap.qualcomm.com (Postfix, from userid 4467449)
	id C0E2B5EB; Mon, 11 May 2026 21:58:55 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, stable@vger.kernel.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v6] Bluetooth: hci_qca: Convert timeout from jiffies to ms
Date: Mon, 11 May 2026 21:58:37 +0800
Message-Id: <20260511135837.3967550-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: xNSjKJLpVvRvDCfc9sx-4d770aIsYqW7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NCBTYWx0ZWRfX1LdYHKOQyKrR
 re52YML+hwNLgOObgWWxbtDkOGzrGQ1q6M/vHyjM4wJbjhoZdCuM2g+i3PUqWAdyqMs8OO2Xfjf
 O5L2ZKAwcTUPuGZ0lBrmH7NSDOn6Od+J19WyQiR66GEH5GUP00HhjZSARycA1TDk3D9z2F/bD+d
 gY85HHnJGAcS5ffWYVmDDzG/ljEtyxfz/FLwOINtx1/I3LaJuXMGCKcIk6rC3CyBFhGfETVzpn8
 gUQEtPEmqG31hK6NdhJFDVaQ2zaT5h9CFThjJ351kO8AbfBabNjfgdj6jy00c6uIRtCv+NAENQn
 r/csJv3EgrDbLZvWFZVsh8IE8nOAA+ytEZ99fXNc0EglTcUWEpfpdIlaYSDlhwz59TD3Su7DgSp
 b0DqIZuy99/IhWbvWC9PgKEbjSxIqyggB/a9G4IwkMw+11VAyWIynb9+QGHK0FxqpMwKdhFHxlF
 ZWzgGh5kPXUP8DGnnHw==
X-Proofpoint-GUID: xNSjKJLpVvRvDCfc9sx-4d770aIsYqW7
X-Authority-Analysis: v=2.4 cv=NODlPU6g c=1 sm=1 tr=0 ts=6a01e0a3 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=HmGob9d6dpwOpU2T9dAA:9 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110154
X-Rspamd-Queue-Id: 9804D50FA45
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106949-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mpg.de:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.991];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Since the timer uses jiffies as its unit rather than ms, the timeout value
must be converted from ms to jiffies when configuring the timer. Otherwise,
the intended 8s timeout is incorrectly set to approximately 33s.

To improve readability, embed msecs_to_jiffies() directly in the macro
definitions and drop the _MS suffix from macros that now yield jiffies
values: MEMDUMP_TIMEOUT, FW_DOWNLOAD_TIMEOUT, IBS_DISABLE_SSR_TIMEOUT,
CMD_TRANS_TIMEOUT, and IBS_BTSOC_TX_IDLE_TIMEOUT.

IBS_WAKE_RETRANS_TIMEOUT_MS and IBS_HOST_TX_IDLE_TIMEOUT_MS are
intentionally left unchanged. Their values are stored in the struct fields
wake_retrans and tx_idle_delay, which hold ms values at runtime and can be
modified via debugfs. The msecs_to_jiffies() conversion happens at each
call site against the field value, so it cannot be embedded in the macro.

Wake timer depends on commit c347ca17d62a

Cc: stable@vger.kernel.org
Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory dump during SSR")
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
Changes v6:
- Move msecs_to_jiffies() into macro definitions instead of wrapping
  each call site
- Rename macros by dropping the _MS suffix to reflect that they now yield jiffies values.
- Change wait_timeout from u32 to unsigned long to properly hold jiffies values.
- Link to v5:
  https://lore.kernel.org/all/20260429123802.1310681-1-shuai.zhang@oss.qualcomm.com/

Changes v5:
- add depends on commit
- Link to v4
  https://lore.kernel.org/all/20260327082941.1396521-1-shuai.zhang@oss.qualcomm.com/

Changes v4:
- add review-by signoff
- Link to v3
  https://lore.kernel.org/all/20251107033924.3707495-1-quic_shuaz@quicinc.com/

Changes v3:
- add Fixes tag
- Link to v2
  https://lore.kernel.org/all/20251106140103.1406081-1-quic_shuaz@quicinc.com/

Changes v2:
- Split timeout conversion into a separate patch.
- Clarified commit messages and added test case description.
- Link to v1
  https://lore.kernel.org/all/20251104112601.2670019-1-quic_shuaz@quicinc.com/
---
 drivers/bluetooth/hci_qca.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index cd1834246..ed280399b 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -48,13 +48,12 @@
 #define HCI_MAX_IBS_SIZE	10
 
 #define IBS_WAKE_RETRANS_TIMEOUT_MS	100
-#define IBS_BTSOC_TX_IDLE_TIMEOUT_MS	200
+#define IBS_BTSOC_TX_IDLE_TIMEOUT	msecs_to_jiffies(200)
 #define IBS_HOST_TX_IDLE_TIMEOUT_MS	2000
-#define CMD_TRANS_TIMEOUT_MS		100
-#define MEMDUMP_TIMEOUT_MS		8000
-#define IBS_DISABLE_SSR_TIMEOUT_MS \
-	(MEMDUMP_TIMEOUT_MS + FW_DOWNLOAD_TIMEOUT_MS)
-#define FW_DOWNLOAD_TIMEOUT_MS		3000
+#define CMD_TRANS_TIMEOUT		msecs_to_jiffies(100)
+#define MEMDUMP_TIMEOUT			msecs_to_jiffies(8000)
+#define FW_DOWNLOAD_TIMEOUT		msecs_to_jiffies(3000)
+#define IBS_DISABLE_SSR_TIMEOUT		(MEMDUMP_TIMEOUT + FW_DOWNLOAD_TIMEOUT)
 
 /* susclk rate */
 #define SUSCLK_RATE_32KHZ	32768
@@ -1096,7 +1095,7 @@ static void qca_controller_memdump(struct work_struct *work)
 
 			queue_delayed_work(qca->workqueue,
 					   &qca->ctrl_memdump_timeout,
-					   msecs_to_jiffies(MEMDUMP_TIMEOUT_MS));
+					   MEMDUMP_TIMEOUT);
 			skb_pull(skb, sizeof(qca_memdump->ram_dump_size));
 			qca_memdump->current_seq_no = 0;
 			qca_memdump->received_dump = 0;
@@ -1369,7 +1368,7 @@ static int qca_set_baudrate(struct hci_dev *hdev, uint8_t baudrate)
 
 	if (hu->serdev)
 		serdev_device_wait_until_sent(hu->serdev,
-		      msecs_to_jiffies(CMD_TRANS_TIMEOUT_MS));
+		      CMD_TRANS_TIMEOUT);
 
 	/* Give the controller time to process the request */
 	switch (qca_soc_type(hu)) {
@@ -1401,8 +1400,8 @@ static inline void host_set_baudrate(struct hci_uart *hu, unsigned int speed)
 
 static int qca_send_power_pulse(struct hci_uart *hu, bool on)
 {
+	int timeout = CMD_TRANS_TIMEOUT;
 	int ret;
-	int timeout = msecs_to_jiffies(CMD_TRANS_TIMEOUT_MS);
 	u8 cmd = on ? QCA_WCN3990_POWERON_PULSE : QCA_WCN3990_POWEROFF_PULSE;
 
 	/* These power pulses are single byte command which are sent
@@ -1607,7 +1606,7 @@ static void qca_wait_for_dump_collection(struct hci_dev *hdev)
 	struct qca_data *qca = hu->priv;
 
 	wait_on_bit_timeout(&qca->flags, QCA_MEMDUMP_COLLECTION,
-			    TASK_UNINTERRUPTIBLE, MEMDUMP_TIMEOUT_MS);
+			    TASK_UNINTERRUPTIBLE, MEMDUMP_TIMEOUT);
 
 	clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
 }
@@ -2591,7 +2590,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 static void qca_serdev_shutdown(struct serdev_device *serdev)
 {
 	int ret;
-	int timeout = msecs_to_jiffies(CMD_TRANS_TIMEOUT_MS);
+	int timeout = CMD_TRANS_TIMEOUT;
 	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
 	struct hci_uart *hu = &qcadev->serdev_hu;
 	struct hci_dev *hdev = hu->hdev;
@@ -2648,7 +2647,7 @@ static int __maybe_unused qca_suspend(struct device *dev)
 	bool tx_pending = false;
 	int ret = 0;
 	u8 cmd;
-	u32 wait_timeout = 0;
+	unsigned long wait_timeout = 0;
 
 	set_bit(QCA_SUSPENDING, &qca->flags);
 
@@ -2669,15 +2668,15 @@ static int __maybe_unused qca_suspend(struct device *dev)
 	if (test_bit(QCA_IBS_DISABLED, &qca->flags) ||
 	    test_bit(QCA_SSR_TRIGGERED, &qca->flags)) {
 		wait_timeout = test_bit(QCA_SSR_TRIGGERED, &qca->flags) ?
-					IBS_DISABLE_SSR_TIMEOUT_MS :
-					FW_DOWNLOAD_TIMEOUT_MS;
+					IBS_DISABLE_SSR_TIMEOUT :
+					FW_DOWNLOAD_TIMEOUT;
 
 		/* QCA_IBS_DISABLED flag is set to true, During FW download
 		 * and during memory dump collection. It is reset to false,
 		 * After FW download complete.
 		 */
 		wait_on_bit_timeout(&qca->flags, QCA_IBS_DISABLED,
-			    TASK_UNINTERRUPTIBLE, msecs_to_jiffies(wait_timeout));
+			    TASK_UNINTERRUPTIBLE, wait_timeout);
 
 		if (test_bit(QCA_IBS_DISABLED, &qca->flags)) {
 			bt_dev_err(hu->hdev, "SSR or FW download time out");
@@ -2729,7 +2728,7 @@ static int __maybe_unused qca_suspend(struct device *dev)
 
 	if (tx_pending) {
 		serdev_device_wait_until_sent(hu->serdev,
-					      msecs_to_jiffies(CMD_TRANS_TIMEOUT_MS));
+					      CMD_TRANS_TIMEOUT);
 		serial_clock_vote(HCI_IBS_TX_VOTE_CLOCK_OFF, hu);
 	}
 
@@ -2738,7 +2737,7 @@ static int __maybe_unused qca_suspend(struct device *dev)
 	 */
 	ret = wait_event_interruptible_timeout(qca->suspend_wait_q,
 			qca->rx_ibs_state == HCI_IBS_RX_ASLEEP,
-			msecs_to_jiffies(IBS_BTSOC_TX_IDLE_TIMEOUT_MS));
+			IBS_BTSOC_TX_IDLE_TIMEOUT);
 	if (ret == 0) {
 		ret = -ETIMEDOUT;
 		goto error;
-- 
2.34.1


