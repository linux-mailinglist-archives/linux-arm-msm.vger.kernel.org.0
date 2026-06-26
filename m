Return-Path: <linux-arm-msm+bounces-114596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RgfVCCQNPmq+/AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:24:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3D86CA52B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:24:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HfYr8p7g;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C1zGym7W;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114596-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114596-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E4E430F061B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36ED239A06C;
	Fri, 26 Jun 2026 05:20:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947013A451B
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782451201; cv=none; b=O43JOWH88lBDt1gV4BBb/VcFDZJOYOtpQIU4bbYkbkY5E/qO10Epc2wLpp20kHL8uIgIzrcAGdhLoKJGBtFBemlq80xnw2YQglkBiOV6rIghE7kAcBcMStcInVvfKOZdCVZ9+yLw2Si+AUItQonot50bSAY1Ls7pTiQfTtwFcQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782451201; c=relaxed/simple;
	bh=H9xhOkSw0q915KQA/XbyIqH1eRVoPvc4hsItfmz+MOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hw/fG4ZMv3SJKbgThIBOEvX1I2TZahiwX03QUqEq+eg83R0awwJSynO6QawM8wMioDcIKIZlp/9PkhWT84laJKpfINBdKU+v2WX5dkHPNUWkMdPvOGMl4esczAOmXgr5iUvNYALy+X+zLmIn/88KnVwsKHfhcGSY+tpsf6tZo7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfYr8p7g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1zGym7W; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2ie8n003341
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nrFnW2VIL6P+SFxCd0cI09S9qQx3uOqE3N+j5OJXsQs=; b=HfYr8p7gkM03/A2t
	3QhNdAsiUg83/tP5e/Fq8ru/gampEgFosHDjT9EgBNIMJUkxUMnSvQlRFmU8onwp
	1zsQT8UpqX9jVsNcdPejqyIrqGXZzMhIn3JU0EiiThnHjB2joiE/5lCqaKgc1Rn7
	FLdq/sDbNiEHuOgbF328mDbYglHvQq1phKgseSW9dzE0yL2r5y/dzA4Qa18n+wCW
	aZt74HJRcNctfv3wNs4CLmGrbO+5NWKl/QuViazDOX/SBp/Z9FVXlFJNAQDdzhSg
	bO7VCx0EU7W9fRLArVDlhjw5HPmTzMMTMHkeklf6aeFbkrIJfWhArLN8Gl90SLqA
	5yjuGw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fct8t31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c01418329so44868eec.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782451198; x=1783055998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nrFnW2VIL6P+SFxCd0cI09S9qQx3uOqE3N+j5OJXsQs=;
        b=C1zGym7WfvsShOPFEbWfQ4b4/v+SYerDQNQpbqJamtoGh2tvzbFCvmBMvsXfjtuDib
         EaEJr9QVC2jlKu9+SAQEMcktQg0sMvwwrHAg2WGLuOEHcVm1FYE0UGTVTpe9P9Sl2zRJ
         3SvukszcijmC14HZFdGu/D9Tn4gOfVJpqOU/bsK+8Eb+MCCcxHpBPt9eSJ7wSbfJszr5
         tVQpbTwgINVUB2wvrVBmJv0t9sbGSO6OzoBqACkSpaC5kptTabN+JGBb22q4vujebvDX
         UZ98nSvF73x9ulFFBeiYddrpiyrXqqbZAjpIy1SHlPLAgdrkPBDwNxItDKfipvhDP2US
         N/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782451198; x=1783055998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nrFnW2VIL6P+SFxCd0cI09S9qQx3uOqE3N+j5OJXsQs=;
        b=Qz+yt+AIMsgyzDRlo2gBUxT4vrKtTIGhCCOomelRLBOgSVa7708H80vQccLRJwxwSW
         fcAbdwDwOiteP/UH0vWXh4Gnw18JcgmXymtZlgBCaXnTa4nki1jDwA0tQN7GT9cOlVic
         WorG9IO0vZwxIquRz2y+pNdqpCznjDytSwVRYJ/Ippt5lwqW4cunTrdSo5dKr+iax2wy
         FI6zA9Bw/r97ztZhsFCv86Ymwfvh2ZFfEA5hc9MZYSFqEoMZqkER6/BYrTlCPrBLx5a2
         PH25ksYtlv/042dsSeR+8pukZg3PaDu8r8BlICn6PVVPNYhks8KUG1CzbsSasEB04O34
         Nn2A==
X-Forwarded-Encrypted: i=1; AHgh+RqdqAUOHZsBoT5DquEuEzWJaucmZQt0JOz+0CbYTBbxdFkdhYbbhR3WZucmzgvQYASvPouirM2Kw5echuhs@vger.kernel.org
X-Gm-Message-State: AOJu0YxCClDEloMgrZms3WAX/cLCvcqUmVpUvLrr2Ogw15MsamrXv9ut
	W5uLiDhpq5Apw2O7zaMmterU2IYZFZFmOKzFgP+p1DDjACS/XpfYSU8dJY+NYa5C+NpMe+unA2n
	pXD2C3z8o0qKPIsSG8I8aMUvuGaw2FXQryI4joZEBFv1OPRJYQV41myMpvKvyE0OOGPQ8
X-Gm-Gg: AfdE7cmUockAmqWwswHTcb1xKKEQqnyuJ0k5Vi7/VGJhW+4gmzTasrR2Ngpj4paeAy5
	wX89TyTtZMyTQBcBfBV5qdQfKEPTfVw8S7D/vivHf789RnKEEEvSpHC/snBXs4op2ekGQzGWg/b
	AvfPHURHG/+Rxf+ZuQfc0EfMVZcPKV6wYz/98w00d8dk6GWT9BVd/9N+PwLPovkKGYOMEMOBu0Y
	2Kkk90W8dKxdZFVMswKmOLuE4SGtAUfzQZWvTw8VPHF01pIRt7FH+wH+ayZ5kNsyrw4fPHaiIgk
	e48JS4LqM6IEbDvdkjbwEBpRFAy7Gf67rgBquRtvkzBEODbXDVOEZunWVrGw9XdrsakATx3R0yZ
	evwqIvhxsgDeDhB6Bi7u0LXap+VjjHIpsdRpIcTrtwJNor795jOhRrPnqvQ==
X-Received: by 2002:a05:7300:6406:b0:30c:6a54:3fe6 with SMTP id 5a478bee46e88-30c84d60744mr3009999eec.8.1782451197563;
        Thu, 25 Jun 2026 22:19:57 -0700 (PDT)
X-Received: by 2002:a05:7300:6406:b0:30c:6a54:3fe6 with SMTP id 5a478bee46e88-30c84d60744mr3009983eec.8.1782451197021;
        Thu, 25 Jun 2026 22:19:57 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm14345291eec.4.2026.06.25.22.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:19:56 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 22:19:52 -0700
Subject: [PATCH v2 07/12] Bluetooth: btqca: Simplify qca_send_reset() by
 using __hci_reset_sync()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-bt_bugfix-v2-7-93396a6f7d5e@oss.qualcomm.com>
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
X-Proofpoint-GUID: ZbyBV7KbcsifBIk_3vrG8TWRPguQIMdR
X-Proofpoint-ORIG-GUID: ZbyBV7KbcsifBIk_3vrG8TWRPguQIMdR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfXzhoTe6eHgliF
 KKzhvMelrml+LQfbhTU28BLXlg927QlK4aSDVCkmBHTUKCuXyH6J0UXdxcMG0lqQmjHSUILyK2Z
 rSvTcZJaREtFyuh7NpyfNOEzrt8Ikm7zGEhdqz13w0xKN0qB3v68h0+qhdcjQYgumaJE0xqkoPY
 4wImkn32v+YXZx5n6SYPwuli2okhmebCIJbS7GisfkfGgOpMwuErjg3NmscKiQYqEpurXZA8Z72
 +Km0Q47ALa4TZrtrfPx6wbaiy5k0Q2AuY3Ss80iFPdZjFdGKodT9IIQMa8YNJHzoS8CRYWS9/lJ
 wFSRtGkJ7ai29CvuIvOlWOsQsVllvSuGlaqiFRnAD2B7b0KajWLS4kE7RGUyEj6q6neaZcUBfEm
 Zsz78CTUr5JPK1pX8/mTjRzRR+xJmRPKoW7U+eL1GeekSlp3L5NvKJQ9Qjv9PB3Jt1gZk8ZcS/8
 65EAY9LzY7JTu8UmbXg==
X-Authority-Analysis: v=2.4 cv=FPkrAeos c=1 sm=1 tr=0 ts=6a3e0bfe cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6o5SJCVUQus6q_qBAWEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfX9uhOENMnwl8v
 qnI4tmECsOhRxgv22d6HFY4GPSu1ELO4+bOgpsGNpfQBYFRuzWLH1ijU+ABz4Sggi7qWZWWLde5
 nT0U8ZiqRHtZ2Se1jIE7xfkw9/YwjH0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260040
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114596-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:quic_tjiang@quicinc.com,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE3D86CA52B

qca_send_reset() is functionally equivalent to the newly added
__hci_reset_sync().

Drop qca_send_reset() and call __hci_reset_sync() directly.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 27f03690af54..a940fa48179b 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -190,25 +190,6 @@ static int qca_send_patch_config_cmd(struct hci_dev *hdev)
 	return err;
 }
 
-static int qca_send_reset(struct hci_dev *hdev)
-{
-	struct sk_buff *skb;
-	int err;
-
-	bt_dev_dbg(hdev, "QCA HCI_RESET");
-
-	skb = __hci_cmd_sync(hdev, HCI_OP_RESET, 0, NULL, HCI_INIT_TIMEOUT);
-	if (IS_ERR(skb)) {
-		err = PTR_ERR(skb);
-		bt_dev_err(hdev, "QCA Reset failed (%d)", err);
-		return err;
-	}
-
-	kfree_skb(skb);
-
-	return 0;
-}
-
 static int qca_read_fw_board_id(struct hci_dev *hdev, u16 *bid)
 {
 	u8 cmd;
@@ -990,11 +971,12 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	}
 
 	/* Perform HCI reset */
-	err = qca_send_reset(hdev);
+	err = __hci_reset_sync(hdev);
 	if (err < 0) {
 		bt_dev_err(hdev, "QCA Failed to run HCI_RESET (%d)", err);
 		return err;
 	}
+	bt_dev_dbg(hdev, "QCA HCI_RESET succeed");
 
 	switch (soc_type) {
 	case QCA_WCN3991:

-- 
2.34.1


