Return-Path: <linux-arm-msm+bounces-114597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wEzzC/8MPmqy/AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:24:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 239B06CA513
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:24:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Z76CyBwa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FZbgePQm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114597-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114597-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 070E43050897
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D32B3A7194;
	Fri, 26 Jun 2026 05:20:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA43A3A6405
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:20:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782451203; cv=none; b=WDzj4QeyyNKWRTFaMgJBFnvzTAEbdUunJ4wEygLG/Vk8fgkR2S7mtMa+/n7fjMuZQJBz7Yd0zHVfhqN85TVyFSoSeXk5XNgvmhxPnP/YTOhFn5tuWWmonGes3I7pZoOFz2EnZNovOdtTtQc5CIHlQHa9MqyrSi6+RkFphzdBB2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782451203; c=relaxed/simple;
	bh=KWx38/xJXKbCXSINMl1h2M2Tk1vfAwS9Zfx7QDwxYs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DpNjv4L/mTTbczYlqQPFrQDHiNXuFgkwW4bUj2lY5VTK5ic8cIcfsSdpEpqBAl+7txlOFXu5mJkVy/mFfaORFUc6GyeSfx9JuHe6Y8dEySCZCzGeQaYZZU+0BBDsRE/1zfrv757p5URAopsfbm6mAqa5IFDm4CLDREQIaKcSQRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z76CyBwa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZbgePQm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2idUR3728691
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b8GZIo2sF/vM2X+nhHIIADINd2tPzCjU10t5o94yGWA=; b=Z76CyBwagH5HEfPo
	Si9vvlAxoLPCMxE9I/gtDOuPwj2bFS9MoNFIZSPQyNF4GZsNnF+Doj7ItspzQ6e2
	V7v7Fk+PhVPKpXF6vwUnL5S3Xo0kiYdOzlSZ97NP88kgzdnYRaCYMjSRPbRGgTRb
	COJBxaJA2Xg8FVRwf3O0YiJdFHzhoSnmH2oeEt/kgIsLKTee8E9ydNx4yaepu8b0
	Ev3X2cV3GqOEQhuKurbNWobKHvfb42YcRmDRpsMHEZbhzu/z85oT1ZyQPg/Ictml
	+XZke7SaDiN9RWZpPE+NI02qla8qoLCxoMyXg5L61BisAAHLMWrzTMqR3vsXyrBC
	GRBu/w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1asj9vgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:20:00 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-137f9301fd6so8904c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782451200; x=1783056000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b8GZIo2sF/vM2X+nhHIIADINd2tPzCjU10t5o94yGWA=;
        b=FZbgePQmTFulH+kMrY/Ou1WZb6oNgNFEYFNDhfQJcVIyNX9aX+FiwUKuzYs9UaeNvK
         8zEeSiREtkssyq204Bo6OxQzlxN0trgP/2L8Dwfd34+p7hxSs4cz+dQky0wLpJKteia3
         ZlaLAsG3dLL8NkiVx1ruDB1nOfC1p7OhJrhBqVZd98JDLmUmy4aFFM91556bSDCxFAbC
         gGsklgr1ieUewwKRCp0ekMLB55apxajbJlX2hIMuxgckggn0zfd53Mr6pP6s3hgrZ7fi
         niCRDSKN85dtPSR0x+i+SUF3yBLM8OvtUDPKleDhvH7Ni/ovI7GTqxR95GFxLlkyd+lQ
         IDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782451200; x=1783056000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b8GZIo2sF/vM2X+nhHIIADINd2tPzCjU10t5o94yGWA=;
        b=m41JXBO1HT7GMmYqFtx6vGu+06HLbRle7XubbrTlLyMO1zMc8teCAOVV4Q1/pQAV+6
         bqQ5W2KM16xEpgprhM+D6JTwc+ET6RCyFRdv3D4VUqlsBop/3eszJE5RO/HfFcvoRzkU
         LVmWixb2WEibD8F1yMfEHGw+vYtxwwFtGv5socggmF1ebYasHdY2E+o8cycTX65/m+nb
         mGOZHouHiSOonKBJuoGjxu6tjLoJ6EcHKii1fzelRuaKXNl2Y0QwaDYCEl1rnBnsKw3m
         faWVTbBuI3JYXp+/2bgz0PuTyQiNZlYFV7CTv50g5V4LFRu22SpjQFOnxp436DwxbIGd
         NF3A==
X-Forwarded-Encrypted: i=1; AHgh+RpxyZq7bqW45eZOWKyuFJ8sgbwWdcnhawArF06UD3BLhhV8Eh6N7pJMWe0Oi5brzNBYZEKLVd44rMEloheO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+CvWitVkC8La8uPmpWt0hy3cm/0HiXjxutpQD6ZmJsgZD0ZDe
	p/YY4DU/1tJL6mbiFMumWCkOhn1w6L7yNnvsaMuHeRxDjXXPmLA2pBF8igFwRp+PCdRRt/7uMOE
	GlTN6sgGo50hkWIXXKW9Ryw7PeP1i6l8xcttOdLzD5Tbc+c5dFhpuBH1KIV8cyitlIrf3
X-Gm-Gg: AfdE7clMvlC2zlc6Y6SHwbhzUR/h782K6HPb5TCx5Eb5oOY7D6S09dWoo0jnS5mu+KR
	jP9zOt9NikcGuUqseyTlTqKnNNEBsoFumIVHv/5XzpnZCLGFH+pS0YBSoCB9YCprL1r1NgJpQNe
	OpYRkPlk3DSTewkA9BT5YVqQC/HblX/mlO6vjOy8RR6A+KmUCRb3Mh6fB7gVJtqm4KtqfOCVbkO
	cYpHVUyMiqctIbkasj2Vw+0ItiSMvdRQHE2wo0uTKj0uJUc+kFwOS5iRuLy0eKPmTc92eMbZMbP
	E2q2knMDfZww09bapEPTA8CD0+muPsJ3pe05oO6bSCF7L9GMnbSUfQO5wjDx8EQATOyXxhcBK1P
	96nALZskco/oNwMnFQKnN8TmJqDOWUlRLqizZ7huexbfZTDhCqndBrRVj+w==
X-Received: by 2002:a05:7300:4312:b0:30c:1275:94ee with SMTP id 5a478bee46e88-30c84daf23amr2300250eec.7.1782451200179;
        Thu, 25 Jun 2026 22:20:00 -0700 (PDT)
X-Received: by 2002:a05:7300:4312:b0:30c:1275:94ee with SMTP id 5a478bee46e88-30c84daf23amr2300233eec.7.1782451199617;
        Thu, 25 Jun 2026 22:19:59 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm14345291eec.4.2026.06.25.22.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:19:57 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 22:19:53 -0700
Subject: [PATCH v2 08/12] Bluetooth: btusb: Simplify btusb_shutdown_qca()
 by using __hci_reset_sync()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-bt_bugfix-v2-8-93396a6f7d5e@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a3e0c00 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=twxtTYS7d_BC4swYIWIA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: 7WQYYAfAcndbzwPGr2gmIUVLP5avSsxB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfXwIHBng2ZlR64
 MvezSkJOogr/C97InxwSueH+Z0YvrI0Wu/R8T466kK3jPD08l7iGE4P8pRU/76EvLbpSdJBqTLd
 TWgeC3ZVEa+65evjMEFp8+2M6+mrepk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfXzlGQ7uwdxBk1
 BSW43qXLFjjqSK+COtyTr751gH1sPcj1TJiHT6CEo8ShzWuh8WpQ7FZ9y7B6dtgf4aMDyEwehvI
 ilmb7FzDaIu7bvmNvJVwvO4i3yws4s4LVFwLZm0lTNRphw+Y1tDgvxTd+lsYNAps/btSOBavxvQ
 VfHiJXPCj24OkXe8u2Gyjs1GTRpfWOVtbGTUtuBCNtPclcFBAmlxs9VJVDdN0s/r7A1CcCfX5Px
 V5L+xgxziH+0XcGFMAvf0BETob0gYhmhG8hKsyCuQ7BseMFUxH/QSJywNoYRAKQDtMljoDvGAvz
 YZ7gfgxx84LRdPeJqR3QmzF94W1oHC6VlaA26apJ5Q4rHjzJcW1DzlPhA3lLhL7I6smN5KGdEWC
 Ub4fpvV+8xgY2ZU3uOjNEpSz0sWQPjGS+bCBArRcSsPB1XWq7LW/1OOc1HfJ9TzrlpQeGOchucB
 LKYJ2/NgIWj1WUyTHWA==
X-Proofpoint-GUID: 7WQYYAfAcndbzwPGr2gmIUVLP5avSsxB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260040
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114597-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:quic_tjiang@quicinc.com,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
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
X-Rspamd-Queue-Id: 239B06CA513

btusb_shutdown_qca() open-codes a synchronous raw HCI reset that is
functionally equivalent to the newly added __hci_reset_sync().

Replace it with __hci_reset_sync() and return its result directly.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index a5ff4af90675..25bbee8f5d93 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3900,16 +3900,13 @@ static bool btusb_wakeup(struct hci_dev *hdev)
 
 static int btusb_shutdown_qca(struct hci_dev *hdev)
 {
-	struct sk_buff *skb;
+	int err;
 
-	skb = __hci_cmd_sync(hdev, HCI_OP_RESET, 0, NULL, HCI_INIT_TIMEOUT);
-	if (IS_ERR(skb)) {
+	err = __hci_reset_sync(hdev);
+	if (err)
 		bt_dev_err(hdev, "HCI reset during shutdown failed");
-		return PTR_ERR(skb);
-	}
-	kfree_skb(skb);
 
-	return 0;
+	return err;
 }
 
 static ssize_t force_poll_sync_read(struct file *file, char __user *user_buf,

-- 
2.34.1


