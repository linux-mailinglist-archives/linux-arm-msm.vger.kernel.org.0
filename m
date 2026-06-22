Return-Path: <linux-arm-msm+bounces-114033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZyJ6KLlMOWrwqAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:54:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF4F6B0848
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:54:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cplIyn8q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="idhXG/JN";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114033-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114033-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49424303E8F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED1F31E835;
	Mon, 22 Jun 2026 14:52:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B127B3161A4
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139946; cv=none; b=rh19ytsEliNDlwwBrB3qOx1IVxXXdvpPWzLmp+hFyanl1duudKWKUXxACqw8T3m2tIUeZyan22RGNc2NsZCfsY9knCYlUkxr2ABRE/4P5Ic32VallfyigVrAHtl+fBAVo+ABcwaMtrlm7l5w9TbAxLeav1JC6DgfKOb8wvmfVlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139946; c=relaxed/simple;
	bh=rpKRFG9vcFaBSu9zoOeEBfEtigbSiyCzqTWFue6VjDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bPnFKbuKUcrVjU5aE7YW6yAAmkJ+4J6+3t2jnWPLn8oaP7imKMrhzObJ8dllzvM2UkLKlmZTPp40utA40n2xCuthK+2AiMF3F62piLxQ9tYfrHRPnu+Z7XcVRr84f5MRQAynCPpHY2FsHRYBMUL+Z4Z8l6J+MYGs1mphS3P79WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cplIyn8q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=idhXG/JN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MEQYjt1521050
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMS5GUEo/xk0l+pec2AyN8MKYe8ZJ2e2xb+mNv5VHUU=; b=cplIyn8qn+byYUjW
	uJ2zU+K0ZN+HaXoTgRw1+8tdA2prnVs9CMuRscoga2tJmGfyVN6VdjJwD/vQhc7R
	GxjiKkT6q3ob1BJK5IRCTd5dhFl0O2HyKNvsyRdM0U5b0RNF55ygSY8sIk6zvHza
	y7Gsqe6GhiIFTAQwJO7qp9njbp9h8COko0wsAX8spWAnsiSMpHotk7hDxl4gI59e
	2OAC6Xj9ZMUO8hMc5s8hzCnyM+HMpM+RpeUN2z0EzGhPl9Jh9D6zTd/rx5n/nOA3
	uDXh7cm8TWm7b4MDol60h4CrFVVi9dizeRN72x9kovz5KsPtLKkQQacuu6pZsknG
	Wj4qdg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey6tmr3mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:22 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137daa666a6so828326c88.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782139942; x=1782744742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMS5GUEo/xk0l+pec2AyN8MKYe8ZJ2e2xb+mNv5VHUU=;
        b=idhXG/JNvKKdHtuX0+vERnf3ZTAGs4BnZ3IQro2lYokg9qZk2p4s4cPksvOYjQHiMU
         V8iwTQaN05sYUz4AL0oCZ4jQufHDZ27OksW6NTek1h2ZZ4D6fLzQfmYUS4MtcFtX0HTZ
         Q8BhACVYcpdbyib2qIYai2mmYs8+jIOkUPhDK8dhtL6OCgLGIhmxN4C/Kz/y/2lDxZwW
         6Q89NUgsNCPaaFwOayAONPyUViNXfJA+E/S72eTftakJXBIRokte6jjjr5dgGsKy9Am5
         lQdCP06Xln5mt5j71rPQwTRLb3/r2856UCSe4W+A8aK9nymesGMbCh/AyrFFvVKduOKU
         pC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139942; x=1782744742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jMS5GUEo/xk0l+pec2AyN8MKYe8ZJ2e2xb+mNv5VHUU=;
        b=iJWb7pfzJqFkwMscCN0IAgRKY898g6em/Vm5tJOD6ZPShUw5qNSin9ODKbhhmAC86F
         GkiYXjcuhcfhlpFZ/urQZ/UPCbXq/mRuGYODKaI46KLG9Z19Hex3Q1KNUV+dVuw8Ye8d
         DzEWG13X2CO10SVMITGZa1dWq3YJYy9+ORRj3t1SW0PXoNbxc7CSVMOUBi76taNN3uIv
         1XR26GvIi9d1wZjQXdsbqehi9TZiSoDVLPka0G85j5Lvi3Ow1RVfcWzsqNeUCz62f2Fk
         tBsP5eoDxC0R1sMQwkyk4BcGN3pbIQgt0fBh/CMxyATtV22585VRFI8pVlBV+6KJJrLw
         Ti7A==
X-Forwarded-Encrypted: i=1; AHgh+Ro5IB7sWIKGGtNQZJG8cPLlN8GSemqpA7kb5DTQXlZzJECDGMCRYz+vVTlxXCH33iCf1eHpNIIoE4YxrRG2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+P25shSCz2XPXiXvuS8JJ+/21BbAdPHMWJOeRAR0++6B5dXyA
	1NnW5bFiRCGmGXHi3ZpiD5+PdnCUMQu22b5bvJBR+3uG1hyYJH6nDj9RN30n5KJo93AMpfCKPN+
	KNUyu7S/Pn+Sop9VcbKKRz3na45hOlPKeQQz06BwPz3iiDOj1842jJ21WRiBkKK4WUMoD
X-Gm-Gg: AfdE7ckwCWCreNiNFMbelN2BrjgZGk777Mce9yOgoyeJMf727Ii0kDdwThL9PcbnzHn
	ICAStzI8mXrzhXqTKfVj1W8x+Zdabk3NbVbGQ7Nx/8ktk2Ek5UM/N0TqsmjTicgIgz+ITtyq6EY
	grZy4Juc65nZmWSe8MXxwvtAaCNEfo2XUAgIx5Be2JkkWQ14XfPntQWxxWNrdeRiWawagwA9fsL
	ioXANLzlpKldev/w07B1MG2ezx8AhrbopG111TbxNqDe9moAEq7T0tTQtDQ0TFSfS0Um7m9mbP8
	07KJIEofCP+Dsou5gz+ZOTOYhFP4wKz3Mzfn+Wa5ZRBND9kV0/uyr6CDfM/02Bt7Xfv1MjfEN4S
	DbLOmKDnBTYaF3jneFKFvFYOdoiI9kXt3nvCuQ5RnleRhIG8lAJIr7Rc8qQ==
X-Received: by 2002:a05:7300:1910:b0:304:c73b:79ea with SMTP id 5a478bee46e88-30c522fdc9fmr235823eec.3.1782139941412;
        Mon, 22 Jun 2026 07:52:21 -0700 (PDT)
X-Received: by 2002:a05:7300:1910:b0:304:c73b:79ea with SMTP id 5a478bee46e88-30c522fdc9fmr235804eec.3.1782139940913;
        Mon, 22 Jun 2026 07:52:20 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bddfe34sm12025561eec.20.2026.06.22.07.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:52:20 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 07:52:19 -0700
Subject: [PATCH 06/13] Bluetooth: btusb: Fix BD_ADDR byte order in
 btusb_set_bdaddr_wcn6855()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-bt_bugfix-v1-6-11f936d84e72@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX1APhhh4VjjsP
 wkkk8Rwci1j6UFPum7/59dUuj9hnKtYX6xhrYOJsCDX6fmcgcuOxWvCWPzVv7rO/4m9qXmthrzB
 mBq/RxgCydRI8Hu/1H5DyJ2Mx4e8qlc=
X-Proofpoint-GUID: ztMq-iQn3_hcbLzQ_wmi3RMYRBY3OMR7
X-Proofpoint-ORIG-GUID: ztMq-iQn3_hcbLzQ_wmi3RMYRBY3OMR7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX87Y+46tgW2+r
 XvFGRlMUV1M5E0pdy2R5bwXbGbP5FInKVALFdy+WJQW0TpQfcfTGDTcjQSxAL0Fb6htwp/tGqMR
 tNB8PiDk4DvR0v86+qF7P9IEj0CVdFLY2HhVC0Ppwgm7lYqSQ+iHn29k6FxrkEFMUptoVM60mkH
 1+gQnB334A7oA+RL+mL54d1f759FKeyaR5mFPNba41IeWTQmrw/YgjmzIBMLvojO7SxPUsl3+LL
 3/oyCGXf1un1zmQ/Spk49HBrioBP9ucnLHdM8UdsMhjYrxdsxKaUyrpo7zpRNJkbRve8ofLIyVf
 E1T70P7XLJCd0jUh9RNV3uOmpMiNMtYTBBCvr3flr7caayWigB1wzDMdm8l44eiyH6RxftiuGSM
 iqdSwS0DNLs0Rh7RKYbhoPn2V37Y0Osj5++cC7z+U8kduv++IWie4BVCZPZR398F20h7acL93BV
 Z1mB0Xbd2QhEVvkwvjQ==
X-Authority-Analysis: v=2.4 cv=H4HrBeYi c=1 sm=1 tr=0 ts=6a394c26 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ItwU2R1ETwvooMAJNeQA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1011 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220147
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
	TAGGED_FROM(0.00)[bounces-114033-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4EF4F6B0848

For VSC 0xfc14 to set BD_ADDR, the endianness of the BDA parameter is
opposite to other HCI commands like HCI_Create_Connection, but
btusb_set_bdaddr_wcn6855() sends the address without swapping byte
order, resulting in a wrong BD_ADDR being set.

Fix by swapping the input address before issuing the command.

Fixes: b40f58b97386 ("Bluetooth: btusb: Add Qualcomm Bluetooth SoC WCN6855 support")
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 6f965c313dff..e78277e24cd8 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3075,14 +3075,15 @@ static int btusb_set_bdaddr_ath3012(struct hci_dev *hdev,
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


