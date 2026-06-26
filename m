Return-Path: <linux-arm-msm+bounces-114592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2ESjGOMMPmqo/AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:23:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C97FF6CA4FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:23:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Oi0nzPWe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A1zTSzIV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114592-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114592-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E203C30DCE3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641653A2540;
	Fri, 26 Jun 2026 05:19:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B81539DBCB
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782451196; cv=none; b=b/kJvVggZAt2muiSKtmlDoE2kVI/cYUXJw4xOPhDa1OpheLiYzdT1vueY1voVmwip2ji6fChOy8jy20UIUk9dvy5GjdhFtTGyTvoeTzNVxZW0lC+BlcnrMnQufsUhXyUfO64bt1aGxTyel1cLRGrH+RRUg4UzTkoaN95CrfqLtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782451196; c=relaxed/simple;
	bh=FTWDWGLYNfpZ6m1IV/lColI/su3Eco1XDbbh6AubtTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aUDxP4VQVjP2JiAKsMYsKpH9S8QulxKeCuh+rIeGNngPrW7m2iJ3vhXXMfVmp8RcxVvOo5HcjaUEyR2d3EUayXK+uSClU37BuMOZMRi48xffVy0LnjViHR27cRFDYihjvdluuYynCB7mcNgYTkteIckiIZNxZEM0BpM8TQ9Xefk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oi0nzPWe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A1zTSzIV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2ilao120167
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tgz3T8c2eN5f8WUpPXHXO8Bhb0KkzZfElUTxAI9Xku4=; b=Oi0nzPWeWHploVOR
	C4akz+amS33M6fjfJy+ABkMnmrEJbxf9+c6r56whS/zfHlUl8Sdu7wi0YROOgtDf
	sHhKgRyyuR6+or2UzjBD7vvuWU68B7BWnVRay5Ajkt3CFPkSRM1AYIPa357WB7kW
	sr6MNgx4R1brNXM5e3roIoULfs7BouMsorKrsQn/vgMTXHHvzaJtXNZC34QIMyyl
	sWW8pMg+/PmsyV9YXhvWJBnADzaAFTRKo4LTv6JjuYSocfRS5WCLzhXn/gkBrGkF
	cQRz4PW5qQL0pvLy6yNyYhXNrXqCkC3GseEJ9936OkcNpMyXKIZh+siKd6cnOmxF
	n0RPmA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1asksww8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30becaf4a44so50439eec.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782451193; x=1783055993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tgz3T8c2eN5f8WUpPXHXO8Bhb0KkzZfElUTxAI9Xku4=;
        b=A1zTSzIVFGAfG7Gd5zkfC5EgFakgsEjHzBjHCfbpqAeyPf7BBIqkr76x3xCbEiHEK+
         rbVPWNNVTFZHQ9baFbUz8efnjtQzpKeDDX3HkvoIcDQ+EhyeEbRPOPmLsFCX8EVOjS7J
         wIUzhggempG1Teu9dF2aWhDfXdJbKV4dcpF5tBdo6WDFCpzbk0yaS/YIPi1GVWfQMGvb
         h2ST/UrEFc158bUj6e9flBHhBXyemegA0qDHFN+ahLu+jVLr2qn276ki1xQLb/ElxyFP
         cGgjCPHdiT1bKIwwbwjcktDDHj8shEBiwglEFs4Waz2IKloBiY9Ht+MhzQfw91H0kne6
         +Tbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782451193; x=1783055993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tgz3T8c2eN5f8WUpPXHXO8Bhb0KkzZfElUTxAI9Xku4=;
        b=Oqr+rhNcH7/52E0nycw0Q6wetmCYhjO9of+g6tTluIJUzK1yzg3GP38BkXpizxTr7t
         xtlRIob/wMONec05LUL5VAVmglk2Dal7JD5H2wvm9++3P0DRWNH8ZhlcunzBExPVXuO6
         4ByTUSDeZCtYFjo9RIjOa/HUK6eo8UAQQugRn/h7um1cVOJ+re0pgKsl1jINOlu5Xge0
         muG8+tHbzxihKaw4Bh4gMWhAPWn2eEKL6tS3R85sWPbZDE7OUBOVI1WuOad2Ya4ruW3/
         sDCakiMmtraBzWy1z9hPIBZEmd8KzDPsO54MuTq22l79uWn5Z99T9xG14d7UPFR6N2R9
         LSIA==
X-Forwarded-Encrypted: i=1; AHgh+Rqx19YB1GeWQA55WY0xVsnCYpx/lyRH96zRKlJTgt5tYbIKoYTSNUV3qC6R2xVZqHacq0Otux+0vcbNmM9U@vger.kernel.org
X-Gm-Message-State: AOJu0YzCB0FdtmFB6TMcfPav+hrKJhSpsbCVrhGuGQbcGiIroAfly8V4
	ilYGljK/hGi2jwerzARaakvX/7vMcySUe7ziVSjWhqIZoYsZmw4HqbuyQSB3O4hMq7ZzyRvxsem
	MMPzwZPiOQf63U4cMwWjOLNkoGXZ8kMnZv5GBGWver3pLE/39DFltzhI94HR6mIAjm7nS
X-Gm-Gg: AfdE7ckuApkWNq8L9Ar9R/zZaYsqD4mdHGXtylQ4Qxr/ZXO8Kfk8oGB8pOfHdH2d3TX
	KJUqwHp3TnvznbOY44SKbaNnKDfXi4LSXdGe72Z+QaFnMsJTerv/zhN5p/tDGsbmxqEpr8f/yQ4
	i4W5PnffTwlEvtNyecVFVBj+9WXzVpZm7yZZpYBL6DS7sgUCcBz8AHxsSLEIkvLocNvNNBpPXB8
	4TTopjca19tbYnUWXE9mWYWU984vzrlEAFWQNd2pEmDEJ0oMbLgq6a3iGpqypdniNFtBrR5yaQI
	HHl/5QD0ry1rcLiFXT7zUj2tjnDCY2PoipCo6xY619fTnjoqLBXtOwx3LgFg8Gd1d/dGUlimslo
	16LadmeAHA0ebc8lU/pzE4qS1VMZC5XwEOTMF7eQh063HCE9fS5pKM/gGKw==
X-Received: by 2002:a05:7301:4e8a:b0:30c:8119:f36a with SMTP id 5a478bee46e88-30c84c77ec0mr2434638eec.4.1782451193083;
        Thu, 25 Jun 2026 22:19:53 -0700 (PDT)
X-Received: by 2002:a05:7301:4e8a:b0:30c:8119:f36a with SMTP id 5a478bee46e88-30c84c77ec0mr2434623eec.4.1782451192540;
        Thu, 25 Jun 2026 22:19:52 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm14345291eec.4.2026.06.25.22.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:19:49 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 22:19:48 -0700
Subject: [PATCH v2 03/12] Bluetooth: btusb: Record matched usb_device_id
 into btusb_data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-bt_bugfix-v2-3-93396a6f7d5e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfX6TsiTmTLyP7T
 eQ43sNDeYoK1II3zCquFEdq2kgpO7XZUBDxgwmUN8+iJ9B/WzqmHtopokCVylyIO9S/H+8FFKYx
 FLauxHgv8Uy3h+zjv2riT6FB7gt6PEY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfXyg0JLODY6ghT
 Kj2DaeuOhSBUCNqa6lE/uH9f8S0mI/L8qTnJxByixWgxoyoVY1p9c1QqynQ4hGrtJfIZaIkTIAO
 RoVpthZ7z4JtWy9/4w0zMUOFK2FOIj3Y+dXJA9yRSDNHe5EbTXY49HYDzoPdHE2Nr4UolZ128ll
 XSmxkAVuCWLZCx3HF9+/Iorq9z/26NXZTiSl5Lg9nZQ9lx+abB3AqMZubgE+laKCyqQsIiBlZ27
 Q4Xv/3h4XHfcqPG+72AT7AObUIcEhmHRn7SOo0JXChDhowO5IW70pIE+S5ItFBN/DwQkh4GT4Dy
 vagRGpK+R40ioSOlS5xCsxVP2EDhZcWh4a2o6e/ub9bUgn/x9se3FC0r+8VONTYp8Xbl0VFdDKs
 phTXutfGBuh54T2jkfaUgdYmt9Ol/Mx3q4t48F5F6dfJqceb6AKHTswJDh1ygaKpFOhjdtDz/Lc
 43D0IVpTVki+XpdH/yA==
X-Proofpoint-GUID: uoCC-7mnQ9cSUujKMW4BGx5iq03S7BRp
X-Proofpoint-ORIG-GUID: uoCC-7mnQ9cSUujKMW4BGx5iq03S7BRp
X-Authority-Analysis: v=2.4 cv=AMxnnMPh c=1 sm=1 tr=0 ts=6a3e0bfa cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=kCdYwly7LSaV7O0ZGUsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260040
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114592-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[oss.qualcomm.com:server fail,vger.kernel.org:server fail,qualcomm.com:server fail,tor.lore.kernel.org:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C97FF6CA4FF

Add @match_id to btusb_data to record the matched usb_device_id
which will be used later.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 17573749adda..31cbe075edc9 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -1012,6 +1012,7 @@ struct btusb_data {
 	bool usb_alt6_packet_flow;
 	int isoc_altsetting;
 	int suspend_count;
+	const struct usb_device_id *match_id;
 
 	int (*recv_event)(struct hci_dev *hdev, struct sk_buff *skb);
 	int (*recv_acl)(struct hci_dev *hdev, struct sk_buff *skb);
@@ -4120,6 +4121,7 @@ static int btusb_probe(struct usb_interface *intf,
 	if (!data)
 		return -ENOMEM;
 
+	data->match_id = id;
 	err = usb_find_common_endpoints(intf->cur_altsetting, &data->bulk_rx_ep,
 					&data->bulk_tx_ep, &data->intr_ep, NULL);
 	if (err)

-- 
2.34.1


