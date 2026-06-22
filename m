Return-Path: <linux-arm-msm+bounces-114038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4rpQEeFMOWr6qAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:55:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C546B0854
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:55:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=G6RTs88E;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FCuP6h7H;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114038-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114038-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 906AC3016C60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82D5330315;
	Mon, 22 Jun 2026 14:52:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0FA32A3E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139950; cv=none; b=MLQbZpVJxK4YMueCz/AW3ggAET4Z/HByDENQNVfFRlwbohhHT1JTRVkxm5eR3ydSJadVRLRCZduptB71ZANXUlLPhsqamuJPa1ql0Gd/0M6zFHp2M/HJ7x2Q73qhp7L665fgoZ8hM/9HMeJgJZd9yXlVwxXxZ2b15bI05iqGE7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139950; c=relaxed/simple;
	bh=NLLKBnu6lqSK3tKr0zf8Ol0FHau/ZsBEgltC9ss3I24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gq3oYeDl1x1dSBZ56B3rjosm1Hd5PwaY+kuU1Y9obCebVh0BAn7+Kd4PTOpTyb5oScF7hhs6mO++m9T7KNrxM4wKtOB2iD+VfCgWahO0aINWVT5F8puSqYyFINpD6Ul1d7lg4plkcC/Aqr55V9MLorLjyR1o5Ip2sFyag7XxTGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6RTs88E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FCuP6h7H; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGCkU2387025
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8oQmHlpKAP6CN522kTwBxFXdDgRU5YMpmBBrLHJmkk=; b=G6RTs88EJTSwo3Du
	8ECKPNc55uT0zcnwwBTIGpQ9UqG+RFrOWM9agJnxliUG5hS466kIZg1dlS/5z4X0
	8zQgracSCqadof8EoyOIpgxTJlNiNFKysjR2ATyAIdqE8XutEP4m/lIcEIfQzD8x
	Kcsd+oXhqdx7k+zAg2Oh0fRzPzBtgGaR1BNFKvz6QUoDU6/hd1XSIkRmd1dTcctF
	r4QgaZ//WFyIUIdIpNZgFcG4ybHpienip2gtKpVbgbbIJSj330L2k1gZbyKQsqJV
	n9EsDHq7HsCHI1XqIwcPlRJ73gFUWfW24HRN8YIR1Ndc2qg9A47h9Fsa8/x2Gfn2
	qbNE3g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5sn0bkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:28 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1399e7a6d05so584512c88.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782139948; x=1782744748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8oQmHlpKAP6CN522kTwBxFXdDgRU5YMpmBBrLHJmkk=;
        b=FCuP6h7Hf29J0HBiEgqAqks69ncOQ2KxNaxh0NwOEYYqfMqcf67UY6vsJkaTHcvXOo
         4cGTe1ye1B/zEicRPPxOxezqVAzhduGDAJW485L1fwyZhSFL/E9idyTWYrdo7Z0McJ5w
         oTfpGDT7c4tDVcqWwn/RvLiBMFlB+L/QWdM8Vvo67evew6NXeiq7LOYsL0zLJJNyvKAG
         ZOhJpPJPO9Mgxixs1u/ggbvM3VJIN0cAFHkNydijwW/6o0C3C+3hdI2/b76th9SE14tg
         /QLmA1XcaoGB3UcAuJ7tz58TEhQMpnHEFkt853go3c8O1sTiD9/6i2y51zxNcrvi+tKe
         Qx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139948; x=1782744748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m8oQmHlpKAP6CN522kTwBxFXdDgRU5YMpmBBrLHJmkk=;
        b=UeF5pXRWI1W2kXqo/pCFpVId8owMVsRJnF/0g5bTvcQedrJ0YquWsNb1XIl+JfAwjz
         qjELMouDDAntoD0AOHxhha21ffIgRZj3xP8Ui4Iy2tJUPsorFfJux830ZY9yaHFhoP0K
         ST+BxoF3IkPl2iJVJnikVDw/8Akfc4TEJ0ykWSoXu2x6cRbNArNx/eWw4Xe6f0IcCUyW
         qQwWZMMUslKL1mDTyhjm1jXDD6E0hGFJKfOB3IC9QVJrA/WQt7nLFuDSbewa9pznQ4Il
         YbcoR0UjnsHSQzjIECSUmsFYKu0zW/G78/OYe5LBqHFrJRFRv5wR6YRcG4KA5N+S2ICc
         IAzw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5bMsbz6yOjuoBvl9fc7lI6yAfsIDeTAnF2xPZPKuGWSGekif9IQ9QbB0vO6YnPCUnuXxmBZgTC1XWwXDh@vger.kernel.org
X-Gm-Message-State: AOJu0YyKptgEETBAo3zUeOdZx8yYBN2P1eA11MuaF+bmR0qqAW33drpU
	KYbCR/IP0LvZeC0uqho034ThdzAtiZ4J5RUq52DRuBW/opZMH4ZnTAIQjynhRqxYUPpa8+H/nt5
	BgIpd9AWlwW1HGi++y1T0nS6nbpOC/skKPgr6VVtVp74ob9rF06xW5wtCOstOeqCC0+XK
X-Gm-Gg: AfdE7clvW3SrlJQ8NBOSjC2z2jU2fpx7rFlTL/sfhFK0th0R6u8sfRMSDSvN6BtISKP
	/pCGKguqCUHKDsBWkxk/TRRdV2w6DnDpChJv4OYx12vPtYaxcAT9d9W7ci3DC0svOPEc/5hUGKY
	+NNsaE9dE0cKGTn4QCH8uhiFJmlRcAtkOlDOx6V7ENMtKJ3RqgmiIyiB6Jp5ULx1XSU2H5ktTu+
	P2Zv44n+EDNfZMkUk/LWgN1X7fMDYNW+7c4JkKJlDahyeegfdQol6Dqa4yADQ1qshg/F7TB4e1+
	kUzL7rNugRi/wBIur5AOMIYHCiToQGNiKhvAJsEWtija6cki69mIHLCMkutkIeZ+9fmSheA3wle
	E2qoh0d9x7xxuFKtqSb0B3Qt42h14h4gaHF0GIogiQRpK7j3f+Ev9wi5DlQ==
X-Received: by 2002:a05:7300:3b03:b0:2d4:62f0:b2e1 with SMTP id 5a478bee46e88-30c51fc533fmr234942eec.0.1782139947661;
        Mon, 22 Jun 2026 07:52:27 -0700 (PDT)
X-Received: by 2002:a05:7300:3b03:b0:2d4:62f0:b2e1 with SMTP id 5a478bee46e88-30c51fc533fmr234925eec.0.1782139947125;
        Mon, 22 Jun 2026 07:52:27 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bddfe34sm12025561eec.20.2026.06.22.07.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:52:26 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 07:52:25 -0700
Subject: [PATCH 12/13] Bluetooth: btqca: Fix undetected error HCI status in
 qca_send_reset()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-bt_bugfix-v1-12-11f936d84e72@oss.qualcomm.com>
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
X-Proofpoint-GUID: TKHT_GGOHxpyXs0hAnyWwaw7zi8eg9Fm
X-Proofpoint-ORIG-GUID: TKHT_GGOHxpyXs0hAnyWwaw7zi8eg9Fm
X-Authority-Analysis: v=2.4 cv=PuKjqQM3 c=1 sm=1 tr=0 ts=6a394c2c cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6o5SJCVUQus6q_qBAWEA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfXyVvz8ZNywgnN
 75eRyGkUKPTeEF12Hb/oa+bYTgX10qjHZUYAwYyRAlWtbDB31mcWVr15WDrGmV5G+vSNMMEA342
 HApBln1s2OSfdfeSs2xtuxBMSkyca+4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX9zsPRVvMFUVo
 MsMvLNyBKjxd4od9oKRNYUZumtIvEu2uBy7hsQdV/ryZt+e0ATi6zMYwrw45yKqAb+7w7Z71X+G
 wT+BuUT0vaxFXU++NC02pdOjuIjKgsr0vXYh0y0rqDGzY9RS0aKwyun6sF+Um4GVg8tBsbSqV/1
 4nYwo8oT0YS3yi6v/1NnxmBa7Fzwd77KtX8BjCluqy3tJTi40dkq0pYSfWybhr9HYzob56fqYAe
 aYjpPCRa21WVtZj0bz7+Fb0k2qYL06phWFY/SvllFUv7lSNliNlNcufKrfbO+hqqYtX/Ep2MAp3
 dwHC3VwP4ZBnua7JPugUWbumXv8fwN84b8M8cV5lWPjztL8dOZnceToPImDLBrrjJyzSWGXpM1l
 f6MhKomXEtVkeDQ1wAoUUtcLWb3gFLeSefOqpztYteNGgEVvvEGIi9GgbDjeK+6+GjH2OA9kZev
 QWp+1LOyhIOzMye9ECg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114038-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38C546B0854

qca_send_reset() uses __hci_cmd_sync() which returns an skb but never
reads the HCI status byte from skb->data[0], so a non-zero error status
returned by the controller is silently ignored.

Fix by replacing qca_send_reset() with __hci_reset_sync() which
properly extracts and converts the HCI status byte to a negative errno.

Fixes: 83e81961ff7e ("Bluetooth: btqca: Introduce generic QCA ROME support")
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 04ebe290bc78..875216e15603 100644
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
@@ -990,7 +971,8 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	}
 
 	/* Perform HCI reset */
-	err = qca_send_reset(hdev);
+	bt_dev_dbg(hdev, "QCA HCI_RESET");
+	err = __hci_reset_sync(hdev);
 	if (err < 0) {
 		bt_dev_err(hdev, "QCA Failed to run HCI_RESET (%d)", err);
 		return err;

-- 
2.34.1


