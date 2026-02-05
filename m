Return-Path: <linux-arm-msm+bounces-91923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICpfBk6OhGkO3gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 13:34:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD7CF293A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 13:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CEB353004D0B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 12:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6913A7F51;
	Thu,  5 Feb 2026 12:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOp7JVSZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i3KPWxGs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D781DB551
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 12:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770294858; cv=none; b=BKzXIr2PCb5MzZSn9x9yCAoO7Lj2op0WIpLih+O+GBJh0NcRGj4cpNBdEG88wgtahpXmXqUsr8Td+66025bI4myfEfo9fIgtAJJayIX1jFm4E5JPy30m0Jsd5z/9QnTHV3m/5okBbqpIaBdjjbGBkLt8+Af6ttMRgrt3Oqk9PlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770294858; c=relaxed/simple;
	bh=GukVpeq2XORNv2nmKbxnkfw6XZzIGovSXniEaGtr3nY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TQl0w2/jRjIxmhgAeJIHQmkaEdk/VVT/ALjqKXMxmYg2hYOTa5Cx3I8eyankOg5LPifnZzXXjh6Ded+3Ou0V/EuDZAtJJQEVzlUTnHRcuEgDmidk8fvN+tIfsd0Qcub1rVSCGoVp+nHhGEZhJyKOVYV0irxBWiPyIKhne2wgL9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOp7JVSZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i3KPWxGs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615B0Iq32712978
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 12:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lCIkIyIVQgCjzCaP74H8XCjUPg5PtHpNeyP
	GInl8cyg=; b=MOp7JVSZY/ALykkCyYWDZz/ODXdG1ET69MWHRNxZhJeXQEEKPIz
	V24qCaEps6qOBJOuKMNUITGUAYCKbuHtBrkHac+0BaaW+pDqFL8NNCIgS7pIxYav
	VrKFV7uK8dUoim52hYQaLWd7WGoZkIKOQWhTSyiZpDZgQljjtVxXUmpvknP96c2z
	jJt8s2T+/tWlq10vcUUT/x2/gV8V8wB9OC8DvwdHUGP84vn/Shr8/7xgUcBqB0tQ
	bhrJEWP+5z6lotXkUQuSH87g6V+ewjkxkG6kKtXfuhOC9rbfik04LXIDNbVWGhjk
	SjFy2SnO2szd93aUTMf2x2CIGRem//g1vDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47ja3stm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 12:34:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70b6a5821so218166185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 04:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770294856; x=1770899656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lCIkIyIVQgCjzCaP74H8XCjUPg5PtHpNeyPGInl8cyg=;
        b=i3KPWxGsl1gKxByLmBuI9HBbRClIkHVwa1M6KtbanlHfBOH9CCSp4p+t+AVREE5biA
         Y5FP4NfPhMUvhTU6IsztoN8vktK64OFD4r1A4tAGGuuNHncDsdn57RqK4B1TydV0ghJc
         ymEQ5TR48D82aw0hEiUZ8XS0tm4//QaQ3fmgZa5CUUT9CQgbGILZp9ocep0CypEVzYxW
         +isrVlRsK8n1dy9EWt7oKU3KQyGGv8OtCIlikBiKCPhM5O6l914QEGFVrZVOKLR+LmyK
         nQIHar++vUXLrhTiwOjMmJm4tNq3JPRTVWUV85vZlhKaQZFDQX3I561qZPJFeRougy7S
         L44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770294856; x=1770899656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCIkIyIVQgCjzCaP74H8XCjUPg5PtHpNeyPGInl8cyg=;
        b=dMWNOcuIVTcyZ73HK61E0ek2AVm2QpYwd16ptix2bL0TUUe8lqJ385Uh7JX98izkZu
         3NK13LuWg7/cLrUj4YQAQ7cmDk8aPUr0MV0HCGTRBfb85OyeyXfRk12o2eytAUtBbuZR
         G0XIHAmdJJut0gQYKpj4vHxM4MQkzmOOqUYJCaDMIbDMc5wQvGlT9HXlvmQ1OCsJZdJr
         BpTibLN0Voii2QFTFov1wXS6kI9ocQjfUDSq5UR4gw+3P4b7C8Vs1rbIZUxomYiycDE3
         r1vMdDmimlrXHG5YzAJoJeQjVwFaE8CJ95z/MLjZcZQtyyKINuBTxYAwVidD54JhOk3N
         IHHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpX2BiOLGnKA7HK1W4cQEz1UQDUs9umx6Tzt5IStvHDFJwSQo/COJ+/t1mWcsJsqoBe6fi/cUVVQJLdJD5@vger.kernel.org
X-Gm-Message-State: AOJu0YyiZev+ZZiI8eq4Q0vobwiGv+tS4w0kj/ezVQ2b2hKbMd2QtYsx
	+1EVyAHbSPI3THMZRW0o2toGhLaOfV457axVwQNMMFh+PCunvn7s53rwylNcMWqn+UYI+tEWppa
	VVKV4YnLU8gpPmBsiwuTAXCein/GFs0byuemrTQBLJyi6prWOZfwZbvTLtbBB5YgcKeip
X-Gm-Gg: AZuq6aLIzCyXwQfptcHp8yN3uBwimKWEn1yxIcP0Aq+7SvY5lmWFpJnRRaCpJ/O+lkl
	l9MYWEL0Lf2pO3FMdTFzSuDPVMHaRERyjRzokguGGagjv8v6cAtZK44Ylc1/dzEWH1gw269V35w
	n6yLK73RUnQ61QPdm+Dp661VBxDfJ0ke5Jjq5+pjFN1T9uWmXz3yf9uusrWg4NQuJ+ZadDKxMNO
	Ybq+BQ6gI+4g/ttbO5Qkz2SMqOiU4EEWF2EswJjZjnvqX4IjHszcd12b57+PQGjFelS58G6q1kY
	yMqPPR5kgL2mZQPQCOA1eSnrbYITsdSJZ9iUQ7QKTpHDyGGFR4s8MCklWPwgI6rR7qjhj+XmcbP
	xLbNVa2ZsHOwxr5vMvZzJk3rFVWDmmr/HY/bc+KuGUBPe+AVtow==
X-Received: by 2002:a05:620a:6ccc:b0:8c6:ec8f:c8a1 with SMTP id af79cd13be357-8ca2f9b7089mr803567685a.44.1770294856527;
        Thu, 05 Feb 2026 04:34:16 -0800 (PST)
X-Received: by 2002:a05:620a:6ccc:b0:8c6:ec8f:c8a1 with SMTP id af79cd13be357-8ca2f9b7089mr803564885a.44.1770294856085;
        Thu, 05 Feb 2026 04:34:16 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d8e8d4sm52190035e9.15.2026.02.05.04.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 04:34:15 -0800 (PST)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3] accel/qaic: Handle DBC deactivation if the owner went away
Date: Thu,  5 Feb 2026 13:34:14 +0100
Message-ID: <20260205123415.3870898-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KQznYWe_8osIO4UgdkfC8ICD26HnTeb3
X-Proofpoint-GUID: KQznYWe_8osIO4UgdkfC8ICD26HnTeb3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA5MyBTYWx0ZWRfX1/KaSy3TgjZ4
 3vKTkNLvHkq2JAcbYp59OIFvSco5mrJkC+jS4X/+ZWpt980YO86leG8kwrH7QcjyMKgfi4Vf4jF
 yiJ6AqDwHzFLdESNmMd2phxBBJ2YCsALXEzqKm39zp92Jy67kDG4s7i5/SP8FmKwDwSUmyzxm7l
 loyhOvQk1tOonj157WzCaZtQba5bCBo5zAyOm2S+N4Sp5oo8QxJi0N9KO+TqPnWKhlo1fNYutWp
 hUlNdBebJgT8DhutaTJAK4ypnYV/xT22EdnV8ZWGzNuSDkdQ4NTJ7vGBQsfmcLNJzOO56zwVO/J
 61nNihJeY8Osg83cEydlkpVpqImD6pN4GLePFhdzMYbU6imiQ2DQZyPGHwSxPo4Vcr3fikbhdC8
 8CVT0aR7x4bBf9ghX+8Fv9SWAmCVuxgtbipCJ6ZAUPj8RMe9H0rTNiGipab0d4+30gE6XUxTV4p
 XNMp+ZRnxnBTz7XJD9g==
X-Authority-Analysis: v=2.4 cv=a8E9NESF c=1 sm=1 tr=0 ts=69848e49 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-VEhWQ6g2OJpjJ3o7oYA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91923-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[youssef.abdulrahman@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ACD7CF293A
X-Rspamd-Action: no action

When a DBC is released, the device sends a QAIC_TRANS_DEACTIVATE_FROM_DEV
transaction to the host over the QAIC_CONTROL MHI channel. QAIC handles
this by calling decode_deactivate() to release the resources allocated for
that DBC. Since that handling is done in the qaic_manage_ioctl() context,
if the user goes away before receiving and handling the deactivation, the
host will be out-of-sync with the DBCs available for use, and the DBC
resources will not be freed unless the device is removed. If another user
loads and requests to activate a network, then the device assigns the same
DBC to that network, QAIC will "indefinitely" wait for dbc->in_use = false,
leading the user process to hang.

As a solution to this, handle QAIC_TRANS_DEACTIVATE_FROM_DEV transactions
that are received after the user has gone away.

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
Changes in V3:
- Remove unnecessary list_empty() check
- Link to V2: https://lore.kernel.org/all/20251224143009.2769836-1-youssef.abdulrahman@oss.qualcomm.com

Changes in V2:
- Add missing closing bracket in resp_worker()
- Link to V1: https://lore.kernel.org/all/20251223153151.2232297-1-youssef.abdulrahman@oss.qualcomm.com
---
 drivers/accel/qaic/qaic_control.c | 47 +++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 428d8f65bff3..3842e59291b9 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -913,7 +913,7 @@ static int decode_deactivate(struct qaic_device *qdev, void *trans, u32 *msg_len
 		 */
 		return -ENODEV;
 
-	if (status) {
+	if (usr && status) {
 		/*
 		 * Releasing resources failed on the device side, which puts
 		 * us in a bind since they may still be in use, so enable the
@@ -1108,6 +1108,9 @@ static void *msg_xfer(struct qaic_device *qdev, struct wrapper_list *wrappers, u
 	mutex_lock(&qdev->cntl_mutex);
 	if (!list_empty(&elem.list))
 		list_del(&elem.list);
+	/* resp_worker() processed the response but the wait was interrupted */
+	else if (ret == -ERESTARTSYS)
+		ret = 0;
 	if (!ret && !elem.buf)
 		ret = -ETIMEDOUT;
 	else if (ret > 0 && !elem.buf)
@@ -1418,9 +1421,49 @@ static void resp_worker(struct work_struct *work)
 	}
 	mutex_unlock(&qdev->cntl_mutex);
 
-	if (!found)
+	if (!found) {
+		/*
+		 * The user might have gone away at this point without waiting
+		 * for QAIC_TRANS_DEACTIVATE_FROM_DEV transaction coming from
+		 * the device. If this is not handled correctly, the host will
+		 * not know that the DBC[n] has been freed on the device.
+		 * Due to this failure in synchronization between the device and
+		 * the host, if another user requests to activate a network, and
+		 * the device assigns DBC[n] again, save_dbc_buf() will hang,
+		 * waiting for dbc[n]->in_use to be set to false, which will not
+		 * happen unless the qaic_dev_reset_clean_local_state() gets
+		 * called by resetting the device (or re-inserting the module).
+		 *
+		 * As a solution, we look for QAIC_TRANS_DEACTIVATE_FROM_DEV
+		 * transactions in the message before disposing of it, then
+		 * handle releasing the DBC resources.
+		 *
+		 * Since the user has gone away, if the device could not
+		 * deactivate the network (status != 0), there is no way to
+		 * enable and reassign the DBC to the user. We can put trust in
+		 * the device that it will release all the active DBCs in
+		 * response to the QAIC_TRANS_TERMINATE_TO_DEV transaction,
+		 * otherwise, the user can issue an soc_reset to the device.
+		 */
+		u32 msg_count = le32_to_cpu(msg->hdr.count);
+		u32 msg_len = le32_to_cpu(msg->hdr.len);
+		u32 len = 0;
+		int j;
+
+		for (j = 0; j < msg_count && len < msg_len; ++j) {
+			struct wire_trans_hdr *trans_hdr;
+
+			trans_hdr = (struct wire_trans_hdr *)(msg->data + len);
+			if (le32_to_cpu(trans_hdr->type) == QAIC_TRANS_DEACTIVATE_FROM_DEV) {
+				if (decode_deactivate(qdev, trans_hdr, &len, NULL))
+					len += le32_to_cpu(trans_hdr->len);
+			} else {
+				len += le32_to_cpu(trans_hdr->len);
+			}
+		}
 		/* request must have timed out, drop packet */
 		kfree(msg);
+	}
 
 	kfree(resp);
 }
-- 
2.43.0


