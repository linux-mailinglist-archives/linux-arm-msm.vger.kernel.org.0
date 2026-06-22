Return-Path: <linux-arm-msm+bounces-114034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bFADMVRMOWrOqAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:53:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC316B07ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:53:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="LnQjEZ/l";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PNuZKjJ6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114034-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114034-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F0BE3015C13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82EA31F98B;
	Mon, 22 Jun 2026 14:52:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEC7318121
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139946; cv=none; b=HfaYayK38K9Vrdv24JNV+VxnblwCSkpFKVGLFN0tDOnfX7Txv1UaAgBeMFIV225lN/odo9v5o90guCnDzTRcQx84kz6hr8dwtfKMH9XwGQBKSzO3rvMdYlpzYN6BZhHWHYKbEJVBcsLlcmi9Ie7qDQHWTfT+7lgWS4TD2MNFtm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139946; c=relaxed/simple;
	bh=rPB74OEdCgFCMQEcleo1XL4y2FFq94baHvsqW1Qqs9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fFw8oUGjW4tmL/5VIwm4Zm2VmqAHGzbY3hwtmpgYjiP/TtDgqYB4GjMWfYnilQ1L140zqFj5M1rNTqAf3PCkzuuLmWG0giRi3K0iYgDW+PTRfkPrgDMCs2h/1eXh+NYOwQnXeYqQjfl0iPRxN9lZi/qM3krxb07e7ZmLThZXoBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LnQjEZ/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PNuZKjJ6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGILc3536797
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HD2h4qGjOicG5v8r0EDgKpiZXF9glw/H2ZBt0fVKZZ8=; b=LnQjEZ/l/JCW8E1o
	SawWAC1X7UCUDRcEyMhz2yU9bcNcSqo6Tyy9zeR2R0r0RZ5bIWg/Z2sXDJrgxgH/
	kSx1sajBbpaZwXwCpC5gZF7gO6lQ6h4B9Hm24d4XsB+iUn8TbpZxueNDCKnKelCN
	YxlfUdKsedIVQRnpYMham/9VS4eST+5kPm62m7BRG62INT1GmdEXqhJCGQ4BnqYa
	We9JBww7nPc8pZrHCtkYgkTt1eNSqlKk8EaG4gW6iFqSa9sHTYHxEfP1ddDe7P+c
	uH9mmV1yR/eExapcC7Kc6irxX1awSd/i/M9ZeHJ8Ws7Wm0XqX2YAoX8KdVJCi3ka
	W82CQw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yhryku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:23 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-137daa666a6so828333c88.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782139943; x=1782744743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HD2h4qGjOicG5v8r0EDgKpiZXF9glw/H2ZBt0fVKZZ8=;
        b=PNuZKjJ6ffeZ0YMiQnsz3M3iA4Zqpa2K4SCL1k2l9p5f/n1OuLKNkPq99QHpb7zYYI
         Adg/idQxnA3zE87MhfqEdxm1sBbXDv4MXd4cYMBqLhkDU4I5ATLA90q+h5DMddfO+xzy
         Yjyc+6PpaW/ThSBugeDXFljFNp1LsDVm0bY8F9+rr5jNpemZNAQ2aN3czm2Urr5P5Vla
         mL1FNiKXsRjWaujJnNM/7qpKMrGnb4M58b4jNR9vylRfYAhknLvi2N+vnPKb5j5RsI3v
         l8xkVTRM5AtCB4JQnHAXdUA2fg0AhVK0ggtSVpdoXYX4RVdS5FANL2Iq5Dwxm4HRRc0K
         sIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139943; x=1782744743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HD2h4qGjOicG5v8r0EDgKpiZXF9glw/H2ZBt0fVKZZ8=;
        b=S2N7AninTbaYYOoB2muKUCR+p7VOrdpocclwqeCwabvVX3OXdEb5W3s2vaTb9fZ+pX
         5b8iRL+wXCuQ5ZVhaewIYYosRShu73EWoFCKff2V3Zr+xhIEw5yJTYQyHeOGxxdDC/i3
         a0aF87n3LXArgC3cYtcr48yhZG7XxovoEiYdS+cuQE8vrzGbxc7D4M1mrWF6gZfk3B5/
         FeO82OYkrgR0lBxo98PXPpeWLTqVKe2vQnJjn9xgMF8uUupeMMD+OwF0ojtvJiK4UIaG
         d+LvuVH830lMzpAq0SM1npD/DnjI+l9rHhn+59jMX+RO5Eil3UsBwJVtRD5vxFIsumTP
         YY+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqxYsyGeppkI9VExh9AmNZ9AdtdlEWtnUt1YlC+I6jhjV9035BpJlrbj3KUGa2mZEYaL41r6fFEwIFqkPEG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Bo+SgDI2gEmSAMY2xSarKhltwDoC5zGJCod1D8uL8yx2AgaX
	T734DkaMhW+HfvxMReX14btJUwXH2/5BT8u5qbuBg9P3k/JMhQ2xxVkq/9ZRpBOpMBTZmLVDCcn
	5I7Wb/D3mkZNLVPEnloCDrzzLANiDajEiCBKGtXoxKOzEZggs+zFzGfTi/H3opUEJCQLT
X-Gm-Gg: AfdE7clxqg7iPtwCrJuqTixP3i1JuG1S73xeiZeB5WZA5W7q28fc0FiVwzHStnMBk3T
	f2pz0aeEy97e7PFec//b7H/I/xLiSaOG2Kkfkec6hUHnbap54bjwSiS+17IVBEf7pfctt13AETX
	Ld+QV0HigCo9sS9x9dU193/xIv5TRkaOHRJtddwOgdkmlEY1/ED83Z5nyMvMXluNx01e2DY8cWF
	LW4N1x1pgJNzGpPjnrnZ9DV2Qy4+atz/DJsDCrgtJtFELw1RkveXwBs9qJWYi08ub/Vh3flNeRT
	XGxuPXyLBF61zM4syd84j2oSRCS8BDLLWybixwYGKWO8Jg7JB2CGTU4XLx2okPSQtQjQXiAjoa3
	5jR1S87tIztW376Wd4Eb8HEiwEfSkMF6lLfh6SpKV8ae5/kVbhlmr+oi90A==
X-Received: by 2002:a05:7300:ec0a:b0:30b:d2f5:d503 with SMTP id 5a478bee46e88-30c52370473mr232869eec.7.1782139943196;
        Mon, 22 Jun 2026 07:52:23 -0700 (PDT)
X-Received: by 2002:a05:7300:ec0a:b0:30b:d2f5:d503 with SMTP id 5a478bee46e88-30c52370473mr232852eec.7.1782139942673;
        Mon, 22 Jun 2026 07:52:22 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bddfe34sm12025561eec.20.2026.06.22.07.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:52:22 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 07:52:21 -0700
Subject: [PATCH 08/13] Bluetooth: hci_sync: Fix return value of
 hci_reset_sync()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-bt_bugfix-v1-8-11f936d84e72@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfXxTwYnlYLyCT0
 UEGiG+1RIa6jX11ZkXdCX6hLbPHYLb4ObTxaEfC48RHc7/ekKepvP30Kh8ST/xvEEu+TiNn6AXD
 3LzHmfmhII8XkLRFNwdKAmkWfW1+3fg=
X-Proofpoint-ORIG-GUID: R2XqNu9p-5LHSEaRwwXKw3cQC6we1zKn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX20wjgp5k8+Za
 9yd+YU3s8fskNSyHtzWkWey4Rrj6ZalKg/1MhRVKlURg3QXNO0qf9stlqKrfkz9CbA8yyNeoY6k
 VyUVI8LMTnWT82StvQfh88lpfN+QwQEHgxXQtkNfrOb2Z7c+jzGfCVSivNXYqdm37xcg1L05hx1
 6vKTYLrzGoDRdnaWebkBaAcdjdbLGRvVbkfB/XckhA6CYKKsFR0mfsKtrC8vDEJ6b+MdW9hwwyv
 NkHk3uJ4BEGSYt/bUOaaYMnIaHGnddl3oo7ZXMJ1NlKQNC3XOkganMDw1Ru4uzVrZ4gFKWbuKvd
 Dx+K1sV4eFLOmZMG9zGc0eZJhslZmTmFpBGh8f2OPI1uOtcnUH9VS+YLwUPFzxCLBt6fgwhw+SZ
 XFNBC0l9t/yzdRfU656U4HASZjMIOFTb1sRD8ReP7/8EeBtDoRAd3GId4u+SneBTNreQVr56158
 mUPEMDYz0/BwTeIUbuA==
X-Proofpoint-GUID: R2XqNu9p-5LHSEaRwwXKw3cQC6we1zKn
X-Authority-Analysis: v=2.4 cv=cKbQdFeN c=1 sm=1 tr=0 ts=6a394c27 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Uqdqqp8oKja_hPjkJiUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114034-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CAC316B07ED

hci_reset_sync() may return positive HCI status byte as-is, but callers
in the chain hci_reset_sync() -> hci_init0_sync() -> hci_unconf_init_sync()
check errors with < 0, so a positive status is silently ignored.

Fix by converting positive HCI status to a negative errno using
bt_to_errno().

Fixes: d0b137062b2d ("Bluetooth: hci_sync: Rework init stages")
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 net/bluetooth/hci_sync.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index fce9f9526cb5..601d44ef975f 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -3678,8 +3678,10 @@ int hci_reset_sync(struct hci_dev *hdev)
 
 	err = __hci_cmd_sync_status(hdev, HCI_OP_RESET, 0, NULL,
 				    HCI_CMD_TIMEOUT);
+	if (err < 0)
+		return err;
 
-	return err;
+	return -bt_to_errno(err);
 }
 
 static int hci_init0_sync(struct hci_dev *hdev)

-- 
2.34.1


