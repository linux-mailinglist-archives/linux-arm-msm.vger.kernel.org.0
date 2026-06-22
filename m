Return-Path: <linux-arm-msm+bounces-114030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v0kFFEdMOWrKqAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:52:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 713E86B07E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:52:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MbrStZnO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DwjQGsOY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114030-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114030-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CB8203012C5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD9730EF86;
	Mon, 22 Jun 2026 14:52:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9F131159C
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139944; cv=none; b=DhbfJFp7ZOEFQfZyMX/Ll1GFn7v0xtDnAVJVIuobodHbFE2pYiZjtWQ22B75LZ5KXdFW6sauXNatA00IokM/FduEVoStl9AtEB2pAzOCbriK2Rz/snMRLG5uGf0lZ+i3c+GhIpEIlNDClc/2bXGADLUtf9Czy6s3tux496WNshk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139944; c=relaxed/simple;
	bh=hI1Adll8Xtg9zeRoObXfZt9rtarX5UDkjpGAevFItDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rp3vtWf79t/oYOML4U2m0/Uu13fcbU9ng8Ix4Gc2yWSaCq247mvCUOz8AyP3H/6GXsKInF6ANW90nkC3g7VVlpLxwjGRPgcqRQOyomBCfHyF+FCGy76JHtcW+yjBRWsNmJifOm8QZc2jKKF7C67gpFFgotwlPJgobIczwtJNuPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MbrStZnO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DwjQGsOY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDSU7F1120803
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9qTpsJW4i6FZVN7IQaAntzbiIZCTVZkxFeHhaQuF08k=; b=MbrStZnO4MIE2uqX
	fl4aUs3n5L5zPtAwPPadkTaPjqElNxq4hgsPFm3IUUtC+dkYki2m2gDItOqebx/o
	cOnveLprcnrMKO2o6km6gllvVZj7MK/Mkjq/TXPdWy/EeM9GRu3NSmLppnzMv4Tv
	/Jp4XWcNhRlLaZFFiHPExVcKdt9ONBS4jx0Jq+nbsSQXM5DhiRJD3gV6KQEmehWR
	sAwI38aL2uU2Pfgjb0lpVinzvM/lympPuZisoOkV3/nMXra330f+eurgoclZnQeV
	NRbX74ATuH1QihyPChy2FZD4VO6Rn1LbD7rrK2TyoL6Re6dMF530RxlAcPNrrlhF
	KW07eA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5ye8ab3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30b7fe4d3f8so709106eec.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782139939; x=1782744739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qTpsJW4i6FZVN7IQaAntzbiIZCTVZkxFeHhaQuF08k=;
        b=DwjQGsOYdwt8T1KvyxqWdl38YLVw0wLoLdnNe1ZBd3s803RDxvf7KCKMcUVWuAfq2Y
         4L9fyejJTauuMnuMe9TT5rRysX2F+QBLxYoum76ybvAhZyZtQ74nAqjmxEL+57I4mn0l
         WTmHlhwWN0YirEX06SbIsqXVlq1YonKPRQ5THeQWDyhDuN6R8f6mLe2gks7n6PjX9RYd
         YEi+/VuSbiU+xVJI7Q5tJsrS5PKzKbYzN7V7oeXN/GJvVsEhSuvU4+CxLcyiLHxYV4ge
         BDix/iGme8GbwqXmXcMengJ/E2kwwQbnPDWODCp4Jy1ZvAQe9l0fqtqgqJbAYaCuHZZs
         f6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139939; x=1782744739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9qTpsJW4i6FZVN7IQaAntzbiIZCTVZkxFeHhaQuF08k=;
        b=T6QFjlLirt38yBQK1RD1HHRuys5GU0rOmCnQQraN3QWbWpK/St2O0m8KyQ/yZyOukT
         /LNE+1FWg1sCOm87O9oj29J9pJSuVsryenyQRe4OfEZK1Jm9yrDr2Y6JDmsZTXG9crDu
         wA3l558AgAORdtBhyIc55JsWdmt1U9CRGqjfviq9akwPr5PPl7gbmYMeFed7Z3mw7S/c
         qTfAq21LkJCaKOdfU1VJ49V1sZopIXhLognDk0mURmjuNkkfJNSB0E6wf6+Xp+0sDd3M
         ooc7K16OXEfJbQZ5Q3ACHAXkwCNByuxr155JtmElkx+K1sygsRtKQYW/MtU1VLyISqaR
         EyxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rratu7Pj5iaxdLSsESmNREpaSZ8+C2QtxjAg3DJ1KMMt57KR+z/PVeeo9uDEXHwMQeGZAr6RHScXasnPkAm@vger.kernel.org
X-Gm-Message-State: AOJu0YxSZJCNyxQw89uvWMb5VGwgpzUEyDa/79DM7WHesALEGQaUtmhK
	5B1KdUfguAjMlxdT9ewFRU+BM4e1swGgCk8asBpjc5wfgjhdTHUxAXv+SIgQEE6d9tPI92avptl
	8x4WNtZKg589Tay9j7mrGUtZCdwjy8V5vgaOwSkN0QlOgBn0VH5t6XEWCObZKxQrP/nJl
X-Gm-Gg: AfdE7cmdXRRFumQ4+6HZ+wLHPwitb2jX6VcoYyyh1QaoUZyDFPegdy1tt9vMjCziEDr
	snxapAFaiIOW9m2SV9eO0Xobb5EyDqXOHugDnR+uvEsPKxn7IMRXW9R+cm9kMODUnNSPKRy6fAo
	DK9iNif1cQHXdYHdgAh2A1r5IZzMpzDqkFnPkO/bdz6YfFYfAacHI4JPsWqg/VETNqSagIDzhjr
	G4QeEKfe0gedoSytvy/GpFQwm+VdApW55AnnqDXQs4ci0jH8GDzgXyNmRYk9eanTnGipxE/5VMM
	0cBu0++JCdsXAbzP2lqOqCOkLQyOw/SxKrxt1Nh5kmq6v4vH0Wlc6r9Ep0vDxu2F5Svrqt54RGB
	QrMiFhN7RHoYSyLShl1i7VllYEuFF3UpyCu97s3U1W2r/Q8eOvEojdbJRng==
X-Received: by 2002:a05:7300:e7af:b0:2e6:b55a:76c9 with SMTP id 5a478bee46e88-30c177c788fmr3746041eec.0.1782139939063;
        Mon, 22 Jun 2026 07:52:19 -0700 (PDT)
X-Received: by 2002:a05:7300:e7af:b0:2e6:b55a:76c9 with SMTP id 5a478bee46e88-30c177c788fmr3746025eec.0.1782139938537;
        Mon, 22 Jun 2026 07:52:18 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bddfe34sm12025561eec.20.2026.06.22.07.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:52:17 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 07:52:16 -0700
Subject: [PATCH 03/13] Bluetooth: btusb: Record matched usb_device_id into
 btusb_data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-bt_bugfix-v1-3-11f936d84e72@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ugkuWhAS6PgrURDlFXiRGJ0XhyWqeB3w
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX/p1sETAOqzPx
 9eQpzaUMnaJlOWE6PvF5cMTpuSVXoFkB/0bcKv9OlVx3+tA5VPFujS8GoMDXX3YXakROME170d6
 mUyrvU74pcNmEdObX/sJFSFrdmEBWXw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX77qVjH3c9cIu
 ku+KiHzQS9fUSQN9lz46oAOb1W80Dj2GFXz9eqFkGMwi+7dJI4wpBbCCqCnkJ8dCTxD2waJSxUd
 v1dAFI5KimAB7YUPGqDFa1xS7QX98cUFEB75kJAoUPeNdG8vItavCyXcTyaBWadndJ44VdrqfNV
 aKnsj6zM5DSaJt9qJrfHkV3o85zfFaYH2DBeZEilG3dL9P9cZ7QVr6xwNThPiuEA/i7MbH7ZPTi
 r9g8Yur5jBvFpZXjAAffbf/ShmzGDWPt5UKie2F80YS9ijbCtp4zyn4FDVeZeLB/mEQxoOhDfJM
 RB4coPEHNu6FX0L25HYQk1HMCkZ9+bF5bdXo3b02oo3UX44j8W0EuvfA0LvKaaEmoJB9HhQcYlU
 gUgKOTJ5Y6KABIqcto48QmSts6dhKR9xkmSfT14S+mTr04OlU93uYvbrsd4yIkcWKOn+vIFuVD+
 oI1sfHsd+X+r/w7KcQA==
X-Proofpoint-GUID: ugkuWhAS6PgrURDlFXiRGJ0XhyWqeB3w
X-Authority-Analysis: v=2.4 cv=YpI/gYYX c=1 sm=1 tr=0 ts=6a394c24 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kCdYwly7LSaV7O0ZGUsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114030-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 713E86B07E4

Add @match_id to btusb_data to record the matched usb_device_id
which will be used later.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index fa6a223d472d..6a90f012b226 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -1012,6 +1012,7 @@ struct btusb_data {
 	bool usb_alt6_packet_flow;
 	int isoc_altsetting;
 	int suspend_count;
+	const struct usb_device_id *match_id;
 
 	int (*recv_event)(struct hci_dev *hdev, struct sk_buff *skb);
 	int (*recv_acl)(struct hci_dev *hdev, struct sk_buff *skb);
@@ -4119,6 +4120,7 @@ static int btusb_probe(struct usb_interface *intf,
 	if (!data)
 		return -ENOMEM;
 
+	data->match_id = id;
 	err = usb_find_common_endpoints(intf->cur_altsetting, &data->bulk_rx_ep,
 					&data->bulk_tx_ep, &data->intr_ep, NULL);
 	if (err)

-- 
2.34.1


