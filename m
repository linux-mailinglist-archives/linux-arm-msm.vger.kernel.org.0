Return-Path: <linux-arm-msm+bounces-114590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eQnHK20MPmqP/AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:21:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7ED6CA4C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:21:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eENWCJGO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KsWr5hPe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114590-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114590-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 69DFD3040655
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A57397347;
	Fri, 26 Jun 2026 05:19:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E31337C936
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782451192; cv=none; b=FJD/prmtBCP8xUjT5TgCPfyDatCQu36mkA8rFbsttqVoh09aTy5yJDmE12h63Sl18Ky0puKQpHeNXvMDXNvV15vUbtfZTZK0FYqSVXiMKCxqir23nnbXmvydLw7Bf9xvenPk5uQjIWamUJFEa1axCQjk9z/4X+nWoWzZn5eJD3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782451192; c=relaxed/simple;
	bh=jTg9E1ynP2Qq1NFZ+ziPA7X/SBa1iI8s+zldG2gCtgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CeepJCUXvDgw1bP1pFoXtGF1Xc6Ky3Ae3oq4Eh5TUAH+OuhJjnac9tQAjSozoWV2bmpi/tLlYTQ9qFviPYRNtQ0XBbA9aC6lrf44QFUOGbvSyAdImlV0i7wGxqaTj+wAi18yejKm4/EBDcxfrAUFERUjNgzp1u4TdfG7UNQCl9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eENWCJGO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KsWr5hPe; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2ir3S4004285
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DfD9IhxO3rTPNCWLoLKKynmSB/NaD1BEuSysuzreQxg=; b=eENWCJGOFIiqkLHX
	Vn9X5WbU8WVNsb3Zrr5vrewSSYosfBPNapL3xgaJQ3CA8hzBI2Ue5GfV2VxM955a
	QsZHiwqd1FFA20bnBQlyc2iZwKVOJJHxt265xAIBuJHmMI0jMw6v2i67qPC4ljto
	yUTiqTXVS+XI3V6yWhvb+QN61/heicaty7FXciTwPYuDINtHEX8Jvb7fVug6h9vg
	Ss6inTB/R7DsZXdhz6iUSytb+ZnH6b2g5JSQClv+PbCq0AE/adbjwqOtANQ2HQ9S
	rCbi8XWjthaJz33ZxCb0tZaTUNH4Sp+uwRpr6L6rG8lRXEU0S8B1TrtERrrdY0y0
	O8VQaQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1eeq93as-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c58d35c0aso150243eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782451189; x=1783055989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfD9IhxO3rTPNCWLoLKKynmSB/NaD1BEuSysuzreQxg=;
        b=KsWr5hPebuelStGGV75zNQ3UugS2fJdAQL8D5eYdot05JDIQLpJpVngrzEwsuwP91W
         NwxefgolUcCYaIZUZOq43aFEYC7DTynsDNFSNS3Z9Om02TUY7w/6vxglNnM3eCbl1TPZ
         wCA4/pf/xZb8DhxPpnehjmG6BvLYrK34yqSARWaIXukFkl3ecIifWq/YPBX/ukTZsdkT
         PePVKPazqfxQTYOLSNEquX5PceDT5mMFh27gFXpCZZAKXTTwpRVYHjk+qwTlOAE99Jg4
         HBqbainYACU56TzD4f/+PChWbgOFI1NZuMHHKiHk2nx6PaQN+mpWxcPZSfP/qZUd3KzI
         mIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782451189; x=1783055989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfD9IhxO3rTPNCWLoLKKynmSB/NaD1BEuSysuzreQxg=;
        b=rdsA4Zy31JgQnTRSdqQdNF3lclXrnBx0SK/k4325PdjLwSe0fRfP4DIV4lxX9TXk0s
         lVfxzRvH0Dr0DHh7L2oJBGeZX/Gjy3k7WfnETJrK3Ra7ciqdSylskCaS5sTq0PLe3jK3
         DifyQyfZ4IGCmfmgQEnUygXkgrIbvUFyY7qcP0X0ZLAZeIMoQ8KsbPDWP/zsheSZ6jQh
         48cXfk4PBNpnuW7PMgiJ31gkXcGM04JWEDjTq3arBECxSS0PwXfalqXc42NaTjI/Bb1k
         vLCNusZoMHYmzemJVVAUIb5Cm3lyaCja+tOy3yN8nijre/oQ7qKFS+cItR+ycmQ7Upgp
         7BeA==
X-Forwarded-Encrypted: i=1; AHgh+RpBZ1lJ52BWnTL8j7+O7g9iKz4k7D49pcrohWzQ5a+LwivMxRtUP0VTbil35dcAexde3FH+3kWe+5m1Op9S@vger.kernel.org
X-Gm-Message-State: AOJu0YyZZvi81TRuYZik7SISgsdEKuiyCP0xcUU/VCn6LpHaVgG3pwJR
	e7uvZMt+PmyaWTUxLtNy6RRWZtnfchAb0MyUaz3DEfLYTHVwmVhKtZi4M4P0/gbgiP+rYHUCtKm
	OwE1CPf2aibOL/h5dbGoeDurs02HrTzgU6QHBzA9Ov/UOhO/UZhNEOElHU7WQD8WHzm5+
X-Gm-Gg: AfdE7cmF29g59ETQsI3sOo3a975UdnQJDllDE3HwTS4d2sL9XOkYp+q+PjiiI70S7Rg
	rTEzrdWdbsocCYeZ6chiH7EippbLwTArJYusTYh72bCIRifyPAoyzIDnmP/9c8TGshuQJWMNHRR
	gmtGr4chlp/xrI1WQMxvD3370dM/NyKaIgSEdnJVZyu2SNIS1DeU8Yv5vX4IEGXb3VIYTBSHTup
	P8g+TPbbMa2yLhPWNLCrpFTM29rWcP/qqHqNJdgwZvX31rbmUwOkMA7qU1fpOrOcNO4aYjdxJxY
	6Cwg058GUZWYKXrNOzelaCdanW92DenlpEMCAn9wFyHyd47q3zm0iY4VA7w4cTUk8lJC55/gsVb
	XCpaM3CwQ7EePZxa2rEJbThrr86DtOL6hIDSlBzw5lrlnieK4+1LRZTO2Gw==
X-Received: by 2002:a05:7300:7c21:b0:30c:52ab:806 with SMTP id 5a478bee46e88-30c84c92cd1mr2773124eec.4.1782451189096;
        Thu, 25 Jun 2026 22:19:49 -0700 (PDT)
X-Received: by 2002:a05:7300:7c21:b0:30c:52ab:806 with SMTP id 5a478bee46e88-30c84c92cd1mr2773100eec.4.1782451188541;
        Thu, 25 Jun 2026 22:19:48 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm14345291eec.4.2026.06.25.22.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:19:48 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 22:19:46 -0700
Subject: [PATCH v2 01/12] Bluetooth: btqca: Fix qca_set_bdaddr() waiting
 for wrong HCI event
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-bt_bugfix-v2-1-93396a6f7d5e@oss.qualcomm.com>
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
        linux-arm-msm@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfXwIwe4VHHRnag
 0LdXJVBIaaSnL+GiaMEwIrKznsM6Uum5LzMu9SpLthQBd+BzidALAv9qMI0rw1KNhBHtL9Tsqza
 vFLjgq4K5GUHrW5IU/zPYpR3qxgRZsFFA3KM0ifGdrTBPOjGRM+MDn+puB/JEwzijWS6ys3HxS4
 HsIJPaabnaFAsraNmWGclw2cMrvSdjg8Ad2NX21jCsBVpkegSV5IyOTs3RTF7UaTFkSW2IZRdqp
 qGHzmbzf4xuadbEWbtm/pZ9h3FiOwWFozkwtHrUI0zS7g9I021ZPQd2wDW4KX9Lvp2k5oZwvfpI
 9sqQ9xen9yQLHWjHnAuqE2NmxM+fEZbo1X47gOZvHGZwgREEkn9S2GjAGNRRXHIhxDvrR1lqWxY
 Y9lzveQl9tIK1Hk9Q4bxX4vq8gNS+Cz72lgl0I/REYU5B9W4+d373muFCccfDo8+qq1oI0C0FbE
 xVR+Fui84BFO4i/dYJA==
X-Proofpoint-ORIG-GUID: MkWh58eU8IHncOyM-uBEvnDvuz0Mt7ce
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfX0uPO2gPYozeh
 CWaTshUTvGmbW3zkdHi6fz0OrnU0gLBB28YHRNUo4jRkZBnI7auAUcR2PAjWMox+Ztq5z01OhFU
 ilEE3NvC6wg1JGm2+S/1Pzxmr5Lo1U4=
X-Proofpoint-GUID: MkWh58eU8IHncOyM-uBEvnDvuz0Mt7ce
X-Authority-Analysis: v=2.4 cv=MLpQXsZl c=1 sm=1 tr=0 ts=6a3e0bf6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ErUVIrnS-jkk5iPv-M8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260040
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
	TAGGED_FROM(0.00)[bounces-114590-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:quic_tjiang@quicinc.com,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: BE7ED6CA4C4

qca_set_bdaddr() waits for HCI_EV_VENDOR when sending
EDL_WRITE_BD_ADDR_OPCODE (0xFC14), but the controller responds with
Command Complete event as confirmed by btmon on WCN7850:

  < HCI Command: Vendor (0x3f|0x0014) plen 6                    #3 [hci0]
          11 22 33 44 55 66
  > HCI Event: Command Complete (0x0e) plen 4                    #4 [hci0]
        Vendor (0x3f|0x0014) ncmd 1
          Status: Success (0x00)

Fix by passing 0 as the event parameter to __hci_cmd_sync_ev() to
wait for the command complete event instead.

Fixes: 5c0a1001c8be ("Bluetooth: hci_qca: Add helper to set device address")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 04ebe290bc78..27f03690af54 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -1029,8 +1029,7 @@ int qca_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr)
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


