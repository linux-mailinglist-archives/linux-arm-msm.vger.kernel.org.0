Return-Path: <linux-arm-msm+bounces-114595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JxlcKAMNPmq3/AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:24:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D28B6CA51B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:24:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="L7V6Ql/Q";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZM0QsKlF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114595-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114595-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82AE030E5B3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CBB53A3E96;
	Fri, 26 Jun 2026 05:19:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C002192F9
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782451199; cv=none; b=QrWTfoRzLIlF6h3XKsVsRnRX6EzlAXDI8K2rtrcRiSNSvasrTN3Qq7wMrp8L5C/q0G9uAJWsBNtfCwIMOsyt6fWOuqq3o8I1STg44XK80LF9F3pVTG6Cttej7qjpf/+PmXxYH/IBerdtQ3+WS0ewA1MCJBhvI0YkmBQUH0444c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782451199; c=relaxed/simple;
	bh=mIcQxAdD2qd9jSn8ioOMwlU0Fa0HTZu03S4klJZgTaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bXX5k0mw+uR1BahBOgGkObxjjGTd3FtUXvlYZIp/CicGzv+X34ZxLQaKb+e42hycpihoUWBBnW+22yu8LVDakoE3IuGMGQdbmm3KjadUywSwdjMO8ibOPNxo/G0KPbo4TMvHRYbZi2mh5N5GqW7MrfRJPqz/z3iDBRbg9oaw9ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7V6Ql/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZM0QsKlF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2ir4N2313141
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v4UjU91Umg3OK4JXPlgbYWEXaYIjR75Eo5tLKocjdtU=; b=L7V6Ql/QtRprGJN4
	mTsDjos0sb4qWsFXOihT9PCJvHSTry6zTfopFQ5lAPXPa4yL5hZqkFwQGpBvCGuD
	QQdynoH9hZHLPVxI94E6EpW9efR5OcAIwsW8PX26VJonY/eUFFHWRR3EuVurmzWr
	zr3+p/2feZgvLMBrGGS85FhrfF4TkdYNp6pd4BlkyswkIOXwLCDoKTMzzsVzgoCz
	w3f2uhRAdk9CPhaDYN2rze2vo887rTDhXNytRZlZLtl8WsIoHsdQGuMufXRcMMch
	KvzWos0P3SzZZsSCOO275Utx/vpwRsPe9AK9voNeeu0VOUj2d2FC/+TxXqSpd4vn
	zpT+OQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f19m3t4b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:57 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c982fbc4dso43269eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782451197; x=1783055997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v4UjU91Umg3OK4JXPlgbYWEXaYIjR75Eo5tLKocjdtU=;
        b=ZM0QsKlFcZNXEkCGQeJish3aMc5JvNYjU22mp4BY72RB1mk/4Tm0v5EbpaN1LawUZJ
         dKIaIMHavwK7W66d268KFBKBwO5ASTsdPccM5mvkir3F4MioDYI42ULZS2ygb3GYA65i
         B1QejghdfieS72W8YgxBOAd7k6TFrMkfo839IycZJmKGh9jhuymeA2lJsdZegnXWZ1NH
         kAACn46w3BOTSZmcc30cHf/WcNObitkmdQs4l7ed/4YqEb4Sm6ARKQuDTxo9wqC5d+mz
         yoNcufxbXs7CjHkf7177unzhvkC1s87IMcSB32RNdlT4Oy9JKv6nTpy6Yx/DMyzv234h
         hfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782451197; x=1783055997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4UjU91Umg3OK4JXPlgbYWEXaYIjR75Eo5tLKocjdtU=;
        b=ESKPMPdF7Dg747V759LQMEpRnLH/bsExZAfwMu0uqURA3AXxf4FuqQJfeBBbzrBsXE
         eqZ5lXcLCMiovK2Noh4eRgfwDORTjLXW6XVtelDHNl7meVqWmamzXw0dBrDFROFK4w1E
         alGEBvx/MY6jp4bDvGVQuEskGGlJUv1xBXaPdPSo/P8r6p+RLgkgFSMLYretXA5y03Sb
         Ivj+HXKyISnP0lmDS20zMDQY3wKSPM3ckXPW4zTy+Xo4c5mxiH89L/A8ZnXPdjN2mb3+
         d4kQINQ0F5pxGaawCa8W7YlJ+xc0/KNcVU1vd403TjQgAWgWuLI6ZReqA+pC4EkUxQzw
         oisw==
X-Forwarded-Encrypted: i=1; AHgh+RrysKw3N9OrvRm5Gfpnfu6XyJ3DLwiKopWtbrctlk7SVmbF3EAXJ8XVmkpxEOn66eWgfHf+IlfKtP7+iiE6@vger.kernel.org
X-Gm-Message-State: AOJu0YyLBvH+rI99mtBIgObj2TTbnlOR/DsPW0Ponxh/r/evUng1XBK2
	v45uRnvz8YJJhxPoG9plA9+YKEGyHp3RUYPl/V0mrFZuX/VbWK9WfnjTfjb52KlLNaHUvJYqLq6
	p49fcTiRqquyrLv6pC/+xCwIyfCIxCybv0j2uOFhZZoSnpKyqRZu3CHy7xogyJfx7ppWU
X-Gm-Gg: AfdE7clhJQTrrTK4LEobXRHMcelkIPIaOaZveDTEEl+BuvbORy/L/OlZB6eEao26yIK
	sEY1tOxWJ2F5Ne0ivikWgWkUBLzr3tfdvnl34V4jAIEKvmQGT7C9Yq2v8+Mp+QrleMqFv1dLrJN
	yZEAUkyKi6j4TmAGvUesAk2ju61wI1HOnZqhCoDiieBV76iezeARUFUK8r3LZvxenCyjfolvuG2
	a5GUNN2t4sCSHey0U4KkRFJPSzX2YG5yODAzdpCVYpBv7hk4D5nmsR8g84YFKfI6CFXnL4nzDgF
	doZvVJbB7R88a8bFIFULl2biA061YAcVGOa5KcJGiEta52zYUsdR/iBlqPPO7JO6N5jhFORrXIv
	5nRyxu5d3MONR4TfnltXfyIRhFt8QdELU4kd4YaEozXdLDJbdCKDAJx7ypQ==
X-Received: by 2002:a05:7301:6502:b0:304:3c33:7afd with SMTP id 5a478bee46e88-30c84a75c4fmr2279641eec.1.1782451196599;
        Thu, 25 Jun 2026 22:19:56 -0700 (PDT)
X-Received: by 2002:a05:7301:6502:b0:304:3c33:7afd with SMTP id 5a478bee46e88-30c84a75c4fmr2279620eec.1.1782451196092;
        Thu, 25 Jun 2026 22:19:56 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm14345291eec.4.2026.06.25.22.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:19:55 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 22:19:51 -0700
Subject: [PATCH v2 06/12] Bluetooth: hci_sync: Introduce __hci_reset_sync()
 for device drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-bt_bugfix-v2-6-93396a6f7d5e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfX9/emZ0ImlZw6
 fNMaYs23HKMO7A8IGmP3SQG2KkpZ1bsfbRAHPoW72aFYz9V9Mn1SFssbxHHb6aoNXb//+LYuDvX
 hPv592xcfCVO65zF2VkT+PPq1cmxDgI=
X-Proofpoint-GUID: tA54foZiQV-tvUiBbQ6oW2EM5gGUQiNF
X-Proofpoint-ORIG-GUID: tA54foZiQV-tvUiBbQ6oW2EM5gGUQiNF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfXxpUddW0MqWh8
 2KMmMz8IHut4z17f1ttFAMFcqVRwx8CIPgJLJwljAmvaX6n1U036SMmavFMfXtq/j5CFHyx06cp
 aG4V+yTl9LsYUynhkAxnBGTW1Wqwf3ykoyPjW5G/XIa67xEFI2oWcm5LuN12cTbAhrCXVGFl9/2
 H3+ZXKGHX1xkY1EiMu3FpsCC2KQrarVqdQoXHFyBMCw4Qh1QYTI/G25kzpPaQg4gTPgHVouE4jN
 fpdXveBhb8AuTPgK0OSG9IK0zPlZsMlXHqqxt+E7iUJq+XPQ2iGds19nrhXppGSC0Tn06Ra2WDh
 3jYNvDByPL4/N13l3JBEEyqlWDm9gODZU3D9xJPCSl6y1gxf2oNnwtCyOjZIFTpVXM0CLc12n49
 hzG5vRgtcXE6DGyKiqUCXZssXOKrStoosybLTnGul1h5Gy5NZOmC+oZb7kXltfGqCK0nDE9rsh/
 rvWlAP4AtLSqxXOKekw==
X-Authority-Analysis: v=2.4 cv=Vv0Txe2n c=1 sm=1 tr=0 ts=6a3e0bfd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=kQ_UBjYZPz6FNnKCBYIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260040
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
	TAGGED_FROM(0.00)[bounces-114595-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:quic_tjiang@quicinc.com,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 1D28B6CA51B

Several vendor drivers have a requirement to send a synchronous raw HCI
reset with HCI_INIT_TIMEOUT.

Add a dedicated __hci_reset_sync() for them to use.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 include/net/bluetooth/hci_sync.h | 1 +
 net/bluetooth/hci_sync.c         | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/net/bluetooth/hci_sync.h b/include/net/bluetooth/hci_sync.h
index 73e494b2591d..7005fc9f257a 100644
--- a/include/net/bluetooth/hci_sync.h
+++ b/include/net/bluetooth/hci_sync.h
@@ -59,6 +59,7 @@ int __hci_cmd_sync_status(struct hci_dev *hdev, u16 opcode, u32 plen,
 int __hci_cmd_sync_status_sk(struct hci_dev *hdev, u16 opcode, u32 plen,
 			     const void *param, u8 event, u32 timeout,
 			     struct sock *sk);
+int __hci_reset_sync(struct hci_dev *hdev);
 int hci_cmd_sync_status(struct hci_dev *hdev, u16 opcode, u32 plen,
 			const void *param, u32 timeout);
 
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 3be8c3581c6c..ca1ee6c89739 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -3684,6 +3684,14 @@ int hci_reset_sync(struct hci_dev *hdev)
 	return 0;
 }
 
+/* Send a raw HCI reset for use by vendor drivers */
+int __hci_reset_sync(struct hci_dev *hdev)
+{
+	return __hci_cmd_sync_status(hdev, HCI_OP_RESET, 0, NULL,
+				     HCI_INIT_TIMEOUT);
+}
+EXPORT_SYMBOL(__hci_reset_sync);
+
 static int hci_init0_sync(struct hci_dev *hdev)
 {
 	int err;

-- 
2.34.1


