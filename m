Return-Path: <linux-arm-msm+bounces-114036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C64IGFpNOWohqQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:57:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8646B0899
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:57:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D+v6M3bS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IzVZ+TXY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114036-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114036-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F49130566AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E0232720C;
	Mon, 22 Jun 2026 14:52:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F0F31E85E
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139948; cv=none; b=mCJBo1bb/y6K2ZYp+wc3tLRS53cNcErDOMMt57HifSPINVwvnP+NjnZqDdFHhm6QyHyby2aERCZq7fifpzqAoxUroyI3Mj2a/Dpbk52Dfoi3VEMNUqRqNL6VjMNx+whZZ/IaCYbcqdQx/q3dtnrky9ESa6ZgUDw0g5Rcx4nFXKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139948; c=relaxed/simple;
	bh=ATHWApfpwZCeYYiok9ycJb1WRbFGd0dV0zYH+vPpucY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DtU6JrYmdLFRUB4H+dqhfRmjovx7MAvroL65qu/8pqh63gTHl9zZlEXB4OBJXo7zResS9p+4VmjjKupRgmTC+Z+dxxRZjlB+PNlcWK3zBFZ04U3t92bDAKJfMOcaHDz7hU1tv9VlXihk96iPYGjSaMtavKEm49cIYhe7+ek/TFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+v6M3bS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IzVZ+TXY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MEgvAq910227
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W0eZObuBMTQTXtWrtbsU40IRWbQBqKip0ll3JZfK0lk=; b=D+v6M3bSS/tXjx6A
	MCOKgG7oxVSlGF/ZyeXdUd/KmcbhBf23B035oe4C5CMy0yoLyEDlmhczK90H/ebU
	iR5JOMgoCUcDv1QLcZV1KiaIcOWyD9g9HlNHHamQtWYZzbzGRhLc2RFzxLdVKPcc
	6cll87GD6D1p8CuBHel9sLZmwJxuk6ApU/c9xEl5VEM0k7LpFOCEAwUN738R0yNI
	eUBF7DpQgow27vqJhjm5gl7Z1/ZFehs9cGmtwZOCd0eBWWj7eVCKfUzPJp/wHWUu
	kmMOgCj480yebx3jPHCh2tE7+1EDeHZFzgMyY9w053iei7SQjO6M2rzcIPkVqMtU
	z+tayQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey729r1dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30b7fe4d3f8so709123eec.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782139945; x=1782744745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W0eZObuBMTQTXtWrtbsU40IRWbQBqKip0ll3JZfK0lk=;
        b=IzVZ+TXYfNDTmjGNFjOfFkGfkuTj7rCQKcXUCwpGUATtUe1OYjqbAgEQvtS0Zdhse7
         bofFvCYuZK0mDaaUDOYxQyMz27kCH6pv38UpqC5MeG9U4Wm5iNkUEUYZgG31Qs53bzR2
         JHFm/Jp8zSzGKAAm98xbOhtU69lVoh3Wyx8lRkZ4q0057cupUft4q02xunlyld3/D/Gs
         2OJATkdKo6cvWw6I8iy21pW1NMTaNPD//ojcR+DLWd+zAopbs0cg2edRI6fsxN3ZpWdc
         VnFB0hdn7FbOHjwpuHh8tKNPkdBBLfTghXSEqOusDm8i19/GvGbxG6vQ5KgjdozZ0W7i
         T96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139945; x=1782744745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W0eZObuBMTQTXtWrtbsU40IRWbQBqKip0ll3JZfK0lk=;
        b=dEAJ8Efv4XvCsE/tOl8XmnanE+pIgGHvlY1nqWTCO02lzA7zuo4SHg6yj8d2TXvM5F
         b5fdNQwI05U/ZjkiyYev5v+Oi2i3FE6hNWO7z9IwWsl0v+eTFRooCI4NMuduX4qMrsR9
         U9VxNvyS+lDWCr941b0qMPUHo8hnxnaDLzzklT6SWOITTs0OvCYuu1Fj5gh40vnAvL7o
         MCE+p+GSJYpnFQ+817ZgAuoy2M7OtrMLYs8u4oXbATPqyFHFmTTDFc0q4rO/9d6ludYt
         yrp7T9brpzylCzqo1hTCDoTEf341B/lj/f1FztcqDk6gjWCLsG+Gifkw/K6ojxQ8ae8P
         QhvA==
X-Forwarded-Encrypted: i=1; AHgh+RqiK0JU5/jNu5niOY6f21E53bcJWDdusm5Vvy0ZqoHABy+UVu5pFUNiR9+57EdOH7ZQ92rjHRnYEGAhVJ1e@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg2aTiG1CLX/jFYTmN7swfHiGxXKa3bIM/edGK0xigH8JMgV0C
	V3RkCJQUz/jKUr71ZZGBFcgcRS6rNQz97gF82dZ/fepZIjgd69cAuJT3OtNOaUqHTQf8Ch4Ey2N
	wVuYDpgLNr/u607rPRZJ/jJcXLV8+ZfTeSSNXyZQYO6az4X2Q2SZWBXdNJn7RoxqyUIso
X-Gm-Gg: AfdE7cklOeD3iUWIbWJZskIwT6AtJkqYNA9aYQ/b3Qxc5bFlZJx3cLYOfzJe7pL8til
	Ws1vRsHweNQtLxgcEPM+7iqLGUTZ3s7XB+NW8uy6lAO//mqWD/xXx+6yON3edE62U6ViD1iOTn2
	obHRN+KBdcZQQQrDtxRy/hSFJuDCQ8V21HF9gaUJ+wJlZq1Gp+JT+LIqafJXepiOmRx6fqF7W7r
	mPntGPRcFNtsskQrkw2G7v+8Fu66J8ocB58X2H5hzs+/kP1aKwGZM8Ny70MHYuozNJVxNY20sbJ
	MtH46+4P94fKsVx6JM5V/fm5VbynOLjOAOvkIy9aj0MUReKewhhgceB9T7CjJNdK34jP9qD1dg8
	VaEFKbfyvNhkHX4v6ESw1C0SkCMnUuJsRFPCz6iECwq2m48sgh2DrrzIiHw==
X-Received: by 2002:a05:7301:2f88:b0:304:d700:1e90 with SMTP id 5a478bee46e88-30c17e7be6cmr3654208eec.3.1782139945302;
        Mon, 22 Jun 2026 07:52:25 -0700 (PDT)
X-Received: by 2002:a05:7301:2f88:b0:304:d700:1e90 with SMTP id 5a478bee46e88-30c17e7be6cmr3654187eec.3.1782139944784;
        Mon, 22 Jun 2026 07:52:24 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bddfe34sm12025561eec.20.2026.06.22.07.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:52:24 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 07:52:23 -0700
Subject: [PATCH 10/13] Bluetooth: btusb: Simplify btusb_shutdown_qca() by
 using __hci_reset_sync()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-bt_bugfix-v1-10-11f936d84e72@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX/lCMHbbsNQk0
 QmLap9UU2qxrgo1R5JY2MZxRya8DMFkyclStSn1sXhSmd9G2KwlHQKC+dsnCBpMLY92CxV6HOml
 B5/DlXzpR1EfHWAyP6YJd306l4zw4aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfXzpllbECNlt+/
 TUK2B7PEJwvScMU238+gunZNdMxMuuBfEWpIWVOgEs1m39X+c/Jh+x6a42DNRhesns7hNCTlR4p
 IRUKGMt5fr4UNAj9ZCJrfxktdo3e24rmh8pCGkO211yU7RuNPfBomKi9HxNQTluQ+XJw4QJXkkM
 j0hduz33+VUJqc8C3BJEW2CT3xTzPljOsy6LykDvGXozIgDa5E1L0DYAh7UfT4DhuM5OUk6UVsM
 gtV7HvUcanVR/CJ9X81TKlJ6TV6DSGFuc5ujq0jmz6g6zO45v4LA1gVDZvZPyXxEsdxHclcrgVl
 7sWhJcpF1Zyx81nfEyjaOQ7vh/o2IRkLdyI2csrD2RHxO/YJnbKCvUTU4MvpoalRCTZjJGoDIiD
 XnjB69tr/e2dQGoLCALGHxdAHyGlKmMYCTgCbIFTqe4FyDAwK4HLvrdSr05fY7RyxDD2CYWaTLO
 z6oNeNlv1fk6A2h878g==
X-Proofpoint-ORIG-GUID: NCUih778UxxujHv8I2e11Qq7ogAH3uym
X-Proofpoint-GUID: NCUih778UxxujHv8I2e11Qq7ogAH3uym
X-Authority-Analysis: v=2.4 cv=eN0jSnp1 c=1 sm=1 tr=0 ts=6a394c29 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=v96isoq9qFqoqtIwOPsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
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
	TAGGED_FROM(0.00)[bounces-114036-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: BB8646B0899

Use the new __hci_reset_sync() API instead of open-coding the HCI reset.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index e78277e24cd8..21e125db1b1f 100644
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


