Return-Path: <linux-arm-msm+bounces-114039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9iYyHmVOOWpiqQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:01:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BF96B0908
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:01:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kAUEWgoS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C2WMeSPu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114039-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114039-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D75E530A5F43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839AF331EA2;
	Mon, 22 Jun 2026 14:52:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69C132ED4E
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139952; cv=none; b=AnI3u8lRaS4CNY9eKNzbSNZPjwo054pvAAkvK+IQj+RUF9czUPCBDiQs9JzjMZOI2IpIPLcnoqDd7uywmjyAbzPWH8MEfLRv12KotKBBvsMgzEloD0Xjhzs+cHnYy7J0i+DJ8/9AnuNTcBVy6g/VuA5YntM0pESJgFITWEO48io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139952; c=relaxed/simple;
	bh=x3KGAx3NUoCYAm+qOqWa1FsPjEcAIKu8HQXo1YsgeAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E+jZEWyT/EMXA9fJSJSFWcajbFxyvwXQckGFPSWoQ1PaqgFiqtE+Qk8uAVNWPRiy8XGS3FR+9HEzR5N9tDpBVDUVIFiftn7+G6An4hAB/py6tbRSJSAsXylubXrz7ZBdAbMkOo/Qvk/qP1pwf9vp43UAV3DtpEaw4JVA5P53W9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kAUEWgoS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2WMeSPu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDFvCB1061110
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQBfOU67eUUkLSC8Z5n20WscF+NgznuYOZ1C8BX2+2o=; b=kAUEWgoSKeOqukS4
	DN8m5jTJT1jD+bn6QNpJcz8V3bJSVKg6s6ejo4zWSGl43YNZB9H6sQhglRJeHORH
	Gn3Bl06hmbYZdLdQI0iTCYljZL6jv1c7dKsPcWPUi490dzoB8FMDhJ5DqczVoXoh
	H5i009f2DXqLmzRu9pNHmwofT+Cyx1LXHbfDPAPm6E3ec65BaCqg9APSYR55cVzq
	xuxv//IVFkDOLoBRvXNoO0PXGDHlPMgZIu4H7w+xCPSNWPTU/cW8dNBae7kHqgAD
	UmfTtzJ+XK9gWu5fsFb8DxgSnl1ZXhs1RzgK1EDzYj+1vsMRBfxQeHem+4Gl1re/
	HIwP4g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1t0tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bd87994e8so647eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782139949; x=1782744749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQBfOU67eUUkLSC8Z5n20WscF+NgznuYOZ1C8BX2+2o=;
        b=C2WMeSPusIwSW9RV3LMAXehMjhkM/bXRv+mXhDKqdGjzWLuM9+h1JqTvHyqaAG+sc1
         TRitwpURfEQYXay2X3fo1t+hfWqagTvz9002om1gV4lOsWQ061aN1ifDZcGZj0RU2Big
         wdqjaKxJXZkpV/bIheg6p4wOCZ/q0cY6ZghmY84aQR0mEcoqThmdWoEKnE/Q3iRUHpBN
         189fNYyf8Y+8oSkpNEVy8UbEy1229j1fTWcbYRcKfUxOJCuPsL6NFT9S40GDLFVG/V4t
         xu3VNJYgB8RqUU6k9ChkaxGQO25gjSPg9j0stSMUxL/KDST7Lq8EGOYREo0P0KhuGgLv
         pwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139949; x=1782744749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mQBfOU67eUUkLSC8Z5n20WscF+NgznuYOZ1C8BX2+2o=;
        b=E+8PK8zAlCD+/mvEyNCtdQAQd6LS8e6G0V1QPn1QBiJx8ltAN5k6Yo2ONh9MOf1QFy
         TrIWarQERoAmxroqZZ2c8eOTBQPOZErxpxcIHNhG+cFSDRSs4F5ZIoSJ5T+lpXrq5n0c
         EkplQQYwPMaKo6+/gij9/8rQRYAI8sBSp1TeUtTH5k3cyck/xqWqKcSoE3g58/0kX67n
         2fE+18m4aAzCs1Cl9X+sFOTw+5HVuMJ1qTKsbOSm9Qsa8aXe0o3VUzqjhvilXGp3YLrt
         0tzEX0TCKFwMncySKhCXDbrl/iJzz1yU+dwEA+fTgBiwZ/Tzd4aEISdzUhOiTTVtdpjq
         MZ9Q==
X-Forwarded-Encrypted: i=1; AHgh+RqXhPhCoZaFSx0HzKOv2ciquIFIqpwHp1a3ETzBOakVbH1sloOjTDYA8Os9nAOEWqi73mpX547LggGWTqSf@vger.kernel.org
X-Gm-Message-State: AOJu0YzoGm5Gkq0j/TKg1SIY3SMz0AEGqtUjLYw77mprESYLw81OFxz9
	2roKkG6g4XgACKpPwtKZkXkhO+jU4VUXhl6JFsdjHmB2QZSv17XGSM0v7nBeUEWzOvJWCQnQp6I
	99oi7hxcJK5ignxwKkpLoHngQwxFRap7RSJs3fIo825R0a3r9cO1vy7TvPWpXxrgCTcm3
X-Gm-Gg: AfdE7cm8kMY51QmURuzGUMgZxN5FhaAowKbU0ZbEAp0ZCBLb+wU4SRHrK+tDAX9LzhM
	d5OOHl19C3tlzb2tNFDFpZH5spd2usovlFNiRzTrV6PKQcJEvVUmP3He0sfl6QH/bU4FcIrhSen
	Slf6AeTNbM0cluC1kfQsT5xsU5BEsu7jhLBC551zLtk0lPY1AO0ZUEflcEGtx1VplLHFHL1aCOM
	si58RUmc/tFeSJNHn0zjHuBAu9jKqaJzGhxVAQsoODWixT1bAHodSR4sE2b8xtb2ZJzlW2t33ne
	CNeu1axQQz0jeTfjMtmM+WD8vXONei4bdTkrR2LESWc00i6CRvc9CW+lPW1ZNZ3AupbW/SexQI9
	whdmMezu/3gtfzo3lei8lKw7egDHWT+srrwS+TEMasCapJskQ9RBo/HyMRg==
X-Received: by 2002:a05:7300:e7af:b0:2e6:b55a:76c9 with SMTP id 5a478bee46e88-30c177c788fmr3746244eec.0.1782139948918;
        Mon, 22 Jun 2026 07:52:28 -0700 (PDT)
X-Received: by 2002:a05:7300:e7af:b0:2e6:b55a:76c9 with SMTP id 5a478bee46e88-30c177c788fmr3746219eec.0.1782139948238;
        Mon, 22 Jun 2026 07:52:28 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bddfe34sm12025561eec.20.2026.06.22.07.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:52:27 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 07:52:26 -0700
Subject: [PATCH 13/13] Bluetooth: btqca: Fix qca_set_bdaddr() using wrong
 HCI event type
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-bt_bugfix-v1-13-11f936d84e72@oss.qualcomm.com>
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
X-Proofpoint-GUID: mRHDgQykZbF7azhwDamv4aqbBUswTgf_
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a394c2d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ErUVIrnS-jkk5iPv-M8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX+AadNk7U/Pbd
 jNId6+SdXbeRMyu5wacUPDFNKwbwvS6o1gFR0I+U4JKPeaSMVvOTf0pSAXzLPJ5vMaN2Wvv4G5Y
 wrKoXh37QMg7qAIm1YnKnC4QW7LGDU4=
X-Proofpoint-ORIG-GUID: mRHDgQykZbF7azhwDamv4aqbBUswTgf_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX5gBQQFp0fnXq
 BXW4tQNSCSnx7ONe1ztyiooWHY7bwga0FAobRwLan873feYZc7QMnw/3QmHDMxFuz5PInxy2dV5
 hNt4StaOnCocOhS3vvdNoTkBH4FyrrXHS/EXFbH3mxhIRJ3Nmk1E/aeu50oaD47dnzREzCiR1ax
 KxxwjCrWxx+//mdpUSPzjAgQKO/hejTwDBuVur3ofoKTB1WaHv4y4WsvOlww+pmDZC77sTtP/v8
 RRqoRqx06lOiGeLJVmHMIThkO5TfWLEC4SXnmurViJFox251Sr4TtZtcqPaG7FdBy9F0ZX7zFCX
 7M4yeuoMlJnS+O2vz3MGLhZGZAXgw5h8v7ipE38yKng/TluQfVQWls+onWRUYz2CF5EFFnHU0O6
 wueTvRBlA+4BVih1QxKcPum9dmyPkiv7FfboFEHtC8jj2zEZylJ2BWxUzj3YCPDiovZd/xzWteg
 hGJ9ZKMAHWxIxtKTFYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220147
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
	TAGGED_FROM(0.00)[bounces-114039-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: F0BF96B0908

EDL_WRITE_BD_ADDR_OPCODE (0xFC14) returns a command complete event,
not a VSE, but qca_set_bdaddr() waits for HCI_EV_VENDOR.

Fix by passing 0 as the event parameter to __hci_cmd_sync_ev() to
wait for the command complete event instead.

Fixes: 5c0a1001c8be ("Bluetooth: hci_qca: Add helper to set device address")
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 875216e15603..f3487de813c2 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -1011,8 +1011,7 @@ int qca_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr)
 	baswap(&bdaddr_swapped, bdaddr);
 
 	skb = __hci_cmd_sync_ev(hdev, EDL_WRITE_BD_ADDR_OPCODE, 6,
-				&bdaddr_swapped, HCI_EV_VENDOR,
-				HCI_INIT_TIMEOUT);
+				&bdaddr_swapped, 0, HCI_INIT_TIMEOUT);
 	if (IS_ERR(skb)) {
 		err = PTR_ERR(skb);
 		bt_dev_err(hdev, "QCA Change address cmd failed (%d)", err);

-- 
2.34.1


