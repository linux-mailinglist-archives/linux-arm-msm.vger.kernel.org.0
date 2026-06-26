Return-Path: <linux-arm-msm+bounces-114594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pr12KHIMPmqQ/AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:21:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6286CA4C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:21:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QFRNUpKe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="h/rPEl8K";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114594-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114594-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0750E30628DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A42399358;
	Fri, 26 Jun 2026 05:19:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168743A1E7B
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782451198; cv=none; b=aAHoMbAThuiRLkRsyQbviqef8EcuQVSZwOyQPJnZWhTgCqcrwDCZmQXFJxJ+8BLvVp3T6zK9YlhsA7C9Mq2WPXDr1Q+tJOMVXfeODOA+/2HUDNywulLXLZNer7HIFCMJF+uuynA7TL9QOs2RqVMRzY7iV+Ddri+DOPT3pFTmleI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782451198; c=relaxed/simple;
	bh=G57PRvnCTVv1g7AkoeoncnFch1CLOD6NcEmypvuIrwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FNc/q6OZpV2GND0jE5AQnqjbOtif98Uc7PaCqDIRZ8lQJxJDpvMflycRnvAUSuiyL9nd+ps6Ih5OZG1/Mu2EGUay23laBnKWNnLOUF4PSnSzFaAEEJNXw/aUUuYdx1DQI78/kzAhFpEN/UpmCfwxPspwdbJjjm9MBtQvo51tBUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QFRNUpKe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/rPEl8K; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2iaXJ3680264
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2llfy6r0JTyF6TECv8bZCD+XrXgW/KnGKods9XqPCP0=; b=QFRNUpKenuaaWDo8
	3bdVWhwHCCyGUzW1QywuK30CeCkQUa1WlVauou+ItFMGDeJoWXPYZ4cVdcPbCOhD
	5Ly5CjBbNDCCpK0ZepL7KGGkBk7ALEtPhDvoOYZb1+QlzZ7HRedyLbaWWLSe0zfO
	96nTzR3jiAPyFiFPFOqJzyoiDWgl0V6sIfdH6C1Jpwdssgtc0YX0qUnxAhm+GwiQ
	LnO0pT81yulwrr6rS4DigD0cROaLCm9WO0fibKBTWjf9kIFpBlD1dyR0dDquM+qz
	eyUqVmSyP6ielnTdTfkFX/pfWWSJxInxf8yGWLBtQgbl+K3L42V1TirLCLB4U/q5
	5ur9Aw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgdrtj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bd0d5f5a4so61879eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782451196; x=1783055996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2llfy6r0JTyF6TECv8bZCD+XrXgW/KnGKods9XqPCP0=;
        b=h/rPEl8KeWWafiTLm+TShT6flOkMggXz7asGKFyD7La6ACm4KDa6RQZdaIBLtEfDsS
         A/o3IsojSlBuWKdjaZLFUuNVvo6/w3Fq4JBferihhGe8ttazrclY+bDyvqoTw7rG7iMh
         KfgGhcSX2xUYZ4rTtrEnKq5bRWFhQqp75vIdKLTJ4HxU+/qoowUT9lFnhFM6Ws5c4J1N
         0apRVwTgbuRjvFwWGrYE0eZJY72F6du2KckD/CBO/9w7EaGgfE0AoQ+Hm5aJqXOEvNP+
         t9lMfo1glRk7WqRUKX3Yqib4KKtGAORE59D7YhIiSSkH+DIG8TMSwha7gH0uNPLK6GyQ
         +pEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782451196; x=1783055996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2llfy6r0JTyF6TECv8bZCD+XrXgW/KnGKods9XqPCP0=;
        b=SDQ4fMvUL3/77Z8wD7LZdlnVD2TKpUqnoWZHREFlOJxdouTYDEGliuYRRy50rE780O
         +Zs+5FT3PezDjbr6E/FqcNcBm0lJwK1+ztUppJcBUhbzJcx9797cTihIoTI6F3xCaUZX
         xG6D/KjHJuOSuhNFbeD+VcU3R+2k3AR8umNCEka8na4W+IaoM+XMJUAeRoJT9dPqhnIx
         vDRhCdqtEfbItMoHOGlr2Uhy3Vn6DEVc+sBM2mJLW+DRndB/renHatPthgPaeVrii9R7
         +zKY5CbsVNyzX4Yq2RZHpR5mfg5JSYGw3VTXrREvbKI1droURVACcKwzdd5wL4AUpqXq
         tMyA==
X-Forwarded-Encrypted: i=1; AHgh+RolxiwJAvN/gTMnHZYxCCYhevS/qRxsKogMwTVtLMLkWyV5cxFvgccCTCCantu9XDr/Ai6Vb6YSrnFFrxJH@vger.kernel.org
X-Gm-Message-State: AOJu0YzGFnaetxZ30eu+uPfHDCyw0K8spcCcW0JM6M234oKDmOM3ajOF
	4oaySe7yY2qeHqPVrkpKTsHTtfr6S5K12yHSe8y1CrEESN718Kgv0HmpUPR4rL8NE/C7HhWeG2S
	CrSXlEnHHjVkUqWXAbOrD+8DH0tUFJYzp+sN8zz4v4DngUCZiJxdsEeYfFup5qvmPmsf/
X-Gm-Gg: AfdE7cnrBsgLFEeAhXmQNM9N7BPzG+qnVtxdXt0EcKIPm410a77H3N0tOtWxgW5ZxRp
	9z00n59U8g3WpZQ54CjYYqNiM4bQfgdUS3O5BBWkUKRCooKMSQ745rz4kczYLX9M4IXvTwBQmap
	onbXKJbFqU49sd8dJxOJG+ew4BfB+cmCG7LmU+l689aQAJT5uaOJL219qAUnsojZ5yerA/G9grD
	652J9mtOTd0CBsgPgDejGqrXvtPd8a5PqJp6z+TqGpIgKY7aOzRlqBIBhUxlt41zXc0Q0YxGBts
	m5J9V1L+dKUVhEGh51ysan26wKLV21SWjTmayWkVfKQYLgCY6HzFKOO3gh3Bz/8jDLb1z7Tw4ts
	N558UkFT326dd1we3REu4urEqGTPqzPhMjj3JeIrqA3LmD7lG11gzM22tlg==
X-Received: by 2002:a05:7300:6144:b0:30b:c021:5045 with SMTP id 5a478bee46e88-30c84ce60f7mr2112494eec.5.1782451195549;
        Thu, 25 Jun 2026 22:19:55 -0700 (PDT)
X-Received: by 2002:a05:7300:6144:b0:30b:c021:5045 with SMTP id 5a478bee46e88-30c84ce60f7mr2112487eec.5.1782451194969;
        Thu, 25 Jun 2026 22:19:54 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm14345291eec.4.2026.06.25.22.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:19:54 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 22:19:50 -0700
Subject: [PATCH v2 05/12] Bluetooth: btusb: QCA: move qca_dump out of
 struct btusb_data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-bt_bugfix-v2-5-93396a6f7d5e@oss.qualcomm.com>
References: <20260625-bt_bugfix-v2-0-93396a6f7d5e@oss.qualcomm.com>
In-Reply-To: <20260625-bt_bugfix-v2-0-93396a6f7d5e@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ben Young Tae Kim <ytkim@qca.qualcomm.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Tim Jiang <quic_tjiang@quicinc.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=API5kwXb c=1 sm=1 tr=0 ts=6a3e0bfc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0qFWW5pOsv3iMAJ541kA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfX7V3zHbAe3tsz
 B8+qhSC4Pdpxx6F5rUikpIK+SDDimJcmrVdyFsvjY3nYqTUY+OxChnsQiFLnYmk5joAT7P3u7HF
 V192uvPn8v0NchwzfVTueSo5rf2M+RLEMqPbihkHisv/dEM5aDeunqspcOpkihmjvtTmaHXvJSJ
 HlA8kBykGCki+ucJgOvmVZU1OWVbpFnwf49MIFDb+5cZEPmSmMXSVx+3D1aYRHTl90ael+9V88H
 0Nh6c+J8mXKQTBNidTBb8tYE7te8gzF6Eh192hlgqeGFQoRTG+D/UdNVtunaTvlrIOTe8s8x03L
 Qs3qv8Cx6I08HVXw/ZRsQXXGS2Qc15weVSfGlF6LmiJHKYlDsjN1KlMLb4f9iX2Br/WEkZesA7W
 Cagt5hvdBl2Z9EvCDriERdjWYQmu8FwF/9aQEC/xbYUHLvUezFkmFVdQjrAJNLKnr5VmrYTGxlg
 rvmaM5s2WTESyA3I4iA==
X-Proofpoint-ORIG-GUID: Pl_-j8Y0B7SoP9rl7nv3A4lYiBVyuue6
X-Proofpoint-GUID: Pl_-j8Y0B7SoP9rl7nv3A4lYiBVyuue6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfX7/BPenQHAPG+
 ZH3tOOuBOjSVYqC86xfMC4V/yWg9Q45awITLeuI54o4JBAJ0HP85/P1Advb0lysxyeRceb4cwQc
 TrfB/Ty60Y6IEvKSujVWiSqnt/lCpIM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260040
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114594-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:quic_tjiang@quicinc.com,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F6286CA4C7

'struct btusb_data' ideally should not include vendor specific
fields, but it currently includes the QCA devcoredump member
'struct qca_dump_info qca_dump'.

Fix by moving it into hci_dev private area accessed by hci_get_priv().

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 56 ++++++++++++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 0bc7d7b61b25..a5ff4af90675 100644
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
@@ -3117,14 +3119,15 @@ struct qca_dump_hdr {
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
@@ -3132,7 +3135,7 @@ static void btusb_dump_hdr_qca(struct hci_dev *hdev, struct sk_buff *skb)
 	skb_put_data(skb, buf, strlen(buf));
 
 	snprintf(buf, sizeof(buf), "VID: 0x%x\nPID:0x%x\n",
-			btdata->qca_dump.id_vendor, btdata->qca_dump.id_product);
+			qca_dump_ptr->id_vendor, qca_dump_ptr->id_product);
 	skb_put_data(skb, buf, strlen(buf));
 
 	snprintf(buf, sizeof(buf), "Lmp Subversion: 0x%x\n",
@@ -3161,6 +3164,8 @@ static int handle_dump_pkt_qca(struct hci_dev *hdev, struct sk_buff *skb)
 
 	struct qca_dump_hdr *dump_hdr;
 	struct btusb_data *btdata = hci_get_drvdata(hdev);
+	struct btqca_data *btqca_data = hci_get_priv(hdev);
+	struct qca_dump_info *qca_dump_ptr = &btqca_data->qca_dump;
 	struct usb_device *udev = btdata->udev;
 
 	pkt_type = hci_skb_pkt_type(skb);
@@ -3188,8 +3193,8 @@ static int handle_dump_pkt_qca(struct hci_dev *hdev, struct sk_buff *skb)
 			goto out;
 		}
 
-		btdata->qca_dump.ram_dump_size = dump_size;
-		btdata->qca_dump.ram_dump_seqno = 0;
+		qca_dump_ptr->ram_dump_size = dump_size;
+		qca_dump_ptr->ram_dump_seqno = 0;
 
 		skb_pull(skb, offsetof(struct qca_dump_hdr, data0));
 
@@ -3201,29 +3206,29 @@ static int handle_dump_pkt_qca(struct hci_dev *hdev, struct sk_buff *skb)
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
@@ -3231,10 +3236,10 @@ static int handle_dump_pkt_qca(struct hci_dev *hdev, struct sk_buff *skb)
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
@@ -3710,8 +3715,10 @@ static int btusb_setup_qca(struct hci_dev *hdev)
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
@@ -4177,6 +4184,9 @@ static int btusb_probe(struct usb_interface *intf,
 	} else if (id->driver_info & BTUSB_MEDIATEK) {
 		/* Allocate extra space for Mediatek device */
 		priv_size += sizeof(struct btmtk_data);
+	} else if (id->driver_info & BTUSB_QCA_WCN6855) {
+		/* Allocate extra space for QCA WCN6855 device */
+		priv_size += sizeof(struct btqca_data);
 	}
 
 	data->recv_acl = hci_recv_frame;
@@ -4319,8 +4329,10 @@ static int btusb_probe(struct usb_interface *intf,
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


