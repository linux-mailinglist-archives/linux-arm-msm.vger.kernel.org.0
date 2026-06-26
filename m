Return-Path: <linux-arm-msm+bounces-114591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RN+bEU8MPmqC/AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:21:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5236CA4A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:21:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AkLrSqeU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DWWDYUpA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114591-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114591-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C9D0306351C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3F8739E6F1;
	Fri, 26 Jun 2026 05:19:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159E4391E7A
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782451194; cv=none; b=nIYCAqURhUDcrxwI/lsu09jbpTSa3kpzxnhmqKlrD2YCZlTmnrBAcFGSPfaOCrZOx7yn4syqvMZP/TlnrI/s+Tlr+c1Uq/ALQsY/dvAHp8xGl+7B2aZoWEqZJUujvU83e02cZlD3nKOimRJ+lOpVqVsLfVJQugOXooEn2F/m6RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782451194; c=relaxed/simple;
	bh=vn6n+zJuAbBPGl6SW5Y7JbXdnr66MjSLvFQV0xhONcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=owQL+ujJmQ8yJJBmy/ZHTPFkan2TBF7t15Ww9Ak3cqqaJRuTGAcWNKcKBSdPGt17sEzezE8NL9VNSmuUVqIs2srF9uu0OsWnxOZcRTajQNqZZ4YHytyF6w/tDp6IUhJof0UFzv20eoDBoQ2X9BsuG6CWGWVpGz884k3kvieaolY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AkLrSqeU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWWDYUpA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2iwE43982853
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G2finj0/L2eL2pJlI5BwyNIlltaVM52H9u3UOxZ/TJ0=; b=AkLrSqeUo6jjMtaM
	fQX2aQ4s/x+5tBKAXO+TF6qhLYpVhaKId06+pv+YI/NIlj2eUwYqr2EqLYFn+jjk
	YAhOAucULUnX4Mu+spcme+2+Tuk+AuUgJJFWD8HkvIguzAai2SjPRh+zbRxTbx33
	jZO3c/Zqe+apODjveKcvcwTTBHNGOVgpWcRQcyT9kL0pwDw9+HZ7bfbWkxc7pcPY
	Cj6xrlex3/h1M7mjXTAtjuQSyZe+94JtDpnXKRuXNLgmVo5awyqTdgWCL5lBPS7R
	z5lvFOlT5vNsHpCfkdRRvV6eRzH80XOD7wlNR9t60P0VarREcEidrTIiLXgQfTsF
	GYeB4Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f16jgb879-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:50 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c58d35c0aso150248eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782451190; x=1783055990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2finj0/L2eL2pJlI5BwyNIlltaVM52H9u3UOxZ/TJ0=;
        b=DWWDYUpAC+/CCatl4xKDLaTbjd5Ma+0QYoM1JyvzRWC98gP6IOfVYNysFniemtJLla
         Av0MRfuV+4+PLQcnmOBa4E3d3xrS9npJsp+8CaLAo3J+5yot3rY/cK1pMJLafplkVWc8
         K2u1a1EgaL/3COqBrXVqS82ahJ2Y8N3dFtb7DG6E46iTvA2XjbmXfK2AQckwI80ExGmq
         1WpdG8Qla3pqaf+oidyYv0rjNy1YDIceS3Um2TThI4SIN6vMkkrQ1KqVpd8RPGagJ1CH
         dF8frbNPbsp8Deny8EZDbqPP3t9/VPzro1OPCMG6iy0R3tdP1eyD6auuNHLwpbl+PvSn
         RnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782451190; x=1783055990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G2finj0/L2eL2pJlI5BwyNIlltaVM52H9u3UOxZ/TJ0=;
        b=LhlsIsSo5DQ90SU8Fh0kyAwuM3eByFtEeFviVhIP9yJJzqI9yB/pMIkqheM/Q5IomQ
         zag08YdmGh21Nejoz9JxIT+jYPil3xo5Zy76eqbvzcchfw119nvV+YgfTcvJ9Ae9+wka
         975BJqcmSjnAB2vdjjrFsBLecajbioX03Bl0p6npeMFOsRgdBHJHzNCqLpvJ4AjNtrZ6
         aWLOIwPbkH+paRreyebOmq0NTtgy/PKTj4e8yGDOZ9ctdzUhwQemCrtz6GBkGm1xfV07
         xX8hZVcKpeUtWiHo4p4vke5w8K17BUSbsJdKt6QN34vXp4KIgAdHHAR0bZJi/quhx831
         T7RQ==
X-Forwarded-Encrypted: i=1; AHgh+RrgRFKjX2Rx7dZA3OgMKIJdqiY+lDzDbdQBmnXOQaAox8YrH6TfIcPX/jwLhDAw9xAYdFvQKikbOy8/A03X@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8BZQzMBcq+YdwKEOD1+3WdcsJczvLBGaC3UV+O/b11rofIAmY
	hiauzH0/a4jE9AkPBHs4Fj9hWdSqNHFH6LiLX78//l7wUhJajnJZKHDu0/neakkWLtgANsrvJFh
	OymHxNoJxLMzI6gSoZU371VTVmlFkXZDHinIgYxR4T98hxreCa63uTbc1LkaxJLpKQNIl
X-Gm-Gg: AfdE7ckOcxUK1DusjPiiEL6M8GMeq+YpgDk2HfTqZ8F45Ng8ZMMres0Ov3h6LitHHLN
	3xmdKdQTUJS1279iFpTTQvMKt7m2FZ7rVxoRYw1XgTbk9HIA7BP0rMDiRa8H+BWlnHOoPn0g31S
	KEOkmCbDWvFcHe4Z8BVs4bM/B3HeF4Y1wWqjzssedfgXQJcFEhDc4YtjLUoeI51V6NRx3pPKIxv
	Ds69ttErj5FwFbIAyb46PRcLqRR7zKFYpV+7+HD8HmpaYvX96MPzcbDsUfFtIEJJSz5KSW6Yg3c
	VoOgrMABdnO46FGhLbRfivu994tuGx3zgBUrCa6xrhdX1hBDQWfBz1K2zuX/Y1H5StgLRTfMkbC
	t5vBQhEm8gxSTzl+7pLobN9lldlR3ww6OwN17zRTt8drrqF/WXsf9jbrlKg==
X-Received: by 2002:a05:7301:5f02:b0:304:4f23:4823 with SMTP id 5a478bee46e88-30c84e49c6fmr2464336eec.7.1782451189980;
        Thu, 25 Jun 2026 22:19:49 -0700 (PDT)
X-Received: by 2002:a05:7301:5f02:b0:304:4f23:4823 with SMTP id 5a478bee46e88-30c84e49c6fmr2464316eec.7.1782451189467;
        Thu, 25 Jun 2026 22:19:49 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm14345291eec.4.2026.06.25.22.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:19:48 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 22:19:47 -0700
Subject: [PATCH v2 02/12] Bluetooth: btusb: Fix BD_ADDR byte order in
 btusb_set_bdaddr_wcn6855()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-bt_bugfix-v2-2-93396a6f7d5e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfX3xujglHmnGr2
 pU4y6OZu536ou5YxqvK2Jd8beKq2o7Bn3gw7vihZ+atrISyI3q+0MvceIbk/Yo0TCLL5Vo68EyX
 IlehuuHmj2JFx/qrIF+d1tpqe/vyiOp//92bA3JnxpWzLnHTfwaOIF2d930CCZgbvxCt1mO97Zx
 CkD9IKZa028NqrSSR6bI/DzdIxahNuZCUVOW0Ff4mX6yh9g0xjOaboB+N9EzCfX8S8ZEotuIAgC
 1f4bzFQI/BK49lY5LVwHPC1nQB9YKLX7WJzj2LNnHYMd3QGMpzTksP6mIX1ID4opQvGkhCYQQEt
 tKmKBIPrQFEAnJkYjwIzsV3600QKD2WxlUsUHO8EMWqJ9+uNt7O4yZmF8bFvnGTvQwqmBXRnSvH
 hOT7IHQCBb2S4VfKjCYvA1dGXUKw+w0qRArAfxF7MFWi/w9V4CYwmNg65U+Pd5PwM7QmzSz8vZ2
 /VQo5o3iSCbqd+2VJ5w==
X-Proofpoint-ORIG-GUID: WtWfSM1GwLxyhQqKh2IAJCyrLqzM5jro
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfX9eweBSu8254a
 2mqcNl3o3z3/qaW3YkXd202yBMCwjOt8k5ywCvv9pqhLn88JT6w5tkx+/mlc5A+XO3mvT9FSri8
 ZW4ab0eXTrDWZiZUkJkj8DXKwIUh1KQ=
X-Authority-Analysis: v=2.4 cv=daqwG3Xe c=1 sm=1 tr=0 ts=6a3e0bf6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TYDuexqLZnRZS9vKGCYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: WtWfSM1GwLxyhQqKh2IAJCyrLqzM5jro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
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
	TAGGED_FROM(0.00)[bounces-114591-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: DA5236CA4A6

btusb_set_bdaddr_wcn6855() sends the address without swapping byte
order for VSC 0xFC14, but the command expects the address in reversed
byte order compared to other HCI commands like HCI_Create_Connection,
resulting in a wrong BD_ADDR being set.

btmon log on WCN6855 shows VSC 0xFC14 is sent with swapped bytes
11 22 33 44 55 66, and Read BD ADDR returns the expected address
11:22:33:44:55:66:

  < HCI Command: Vendor (0x3f|0x0014) plen 6                  #3 [hci0]
          11 22 33 44 55 66
  > HCI Event: Command Complete (0x0e) plen 4                  #4 [hci0]
        Vendor (0x3f|0x0014) ncmd 1
          Status: Success (0x00)
  < HCI Command: Read BD ADDR (0x04|0x0009) plen 0            #11 [hci0]
  > HCI Event: Command Complete (0x0e) plen 10                #12 [hci0]
        Read BD ADDR (0x04|0x0009) ncmd 1
          Status: Success (0x00)
          Address: 11:22:33:44:55:66 (OUI 11-22-33)

Fix by swapping the input address before issuing the command.

Fixes: b40f58b97386 ("Bluetooth: btusb: Add Qualcomm Bluetooth SoC WCN6855 support")
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 7f14ce96319b..17573749adda 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3072,14 +3072,15 @@ static int btusb_set_bdaddr_ath3012(struct hci_dev *hdev,
 static int btusb_set_bdaddr_wcn6855(struct hci_dev *hdev,
 				const bdaddr_t *bdaddr)
 {
+	bdaddr_t bdaddr_swapped;
 	struct sk_buff *skb;
-	u8 buf[6];
 	long ret;
 
-	memcpy(buf, bdaddr, sizeof(bdaddr_t));
+	baswap(&bdaddr_swapped, bdaddr);
 
-	skb = __hci_cmd_sync_ev(hdev, 0xfc14, sizeof(buf), buf,
-				HCI_EV_CMD_COMPLETE, HCI_INIT_TIMEOUT);
+	skb = __hci_cmd_sync_ev(hdev, 0xfc14, sizeof(bdaddr_swapped),
+				&bdaddr_swapped, HCI_EV_CMD_COMPLETE,
+				HCI_INIT_TIMEOUT);
 	if (IS_ERR(skb)) {
 		ret = PTR_ERR(skb);
 		bt_dev_err(hdev, "Change address command failed (%ld)", ret);

-- 
2.34.1


