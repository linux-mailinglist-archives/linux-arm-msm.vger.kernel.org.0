Return-Path: <linux-arm-msm+bounces-114593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RQmJAPIMPmqv/AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:24:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8BE6CA50C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:24:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oJ0dYeJZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WmPSC5zn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114593-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114593-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A642D30E1218
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8AF3A3815;
	Fri, 26 Jun 2026 05:19:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFFC3A1E7E
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782451197; cv=none; b=qjOKYwzFdubkik22JlJYa4O5ZX8hvDvmLgQzVnLfc0IiT5PSV0pLITRONcV7ZxX94ejKV7NpJzlRF6vFKFTiZUcqOjNdcq4YMZdFO/ubSZQDhxx4xwk9DjXhksMcMyjKl3+afLLTaGvaD4zkm2GMfwVlUi+K3CdQWXxTbtFL9qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782451197; c=relaxed/simple;
	bh=jFcZSODU4EEYbu7XM8Ar7+jFvTy2vGw1OopoZBkWQ5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SUDqlX4nMozkmISho6yacl7wjfLzTkPc52Ln3t8RczTnGSIXa0XKc9gTY3zYe9xTCPEBmrUXrWdHZff0yUoslhQQL5hgSG4kixWxgZDP/5LITuWHSOPNwcfGObFW/1fA8n26W8XHOzaFF45HLNXl3g5oIX5BpbRcSL4z4zAQesc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJ0dYeJZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WmPSC5zn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2iiqn4181582
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KTul3dgdpD7qagMI1GRAj/SE9fsLTKfErHkSL7MpL5k=; b=oJ0dYeJZP/XIFhbN
	jZEzUM7+uKGQe9WIEZdARcZc5VGsExepCNamcMxIiTffw0x6PCw+H9xj4GNZx6jb
	3297t5qSjl0NpEWAnEXoKlrBrSesd4a71RdEAkSABrC0C9LNSnB9QWqPoil0ZkNT
	rVxwCeSXlb2M7AFcIcdPo9zIdpaKqvJ+Gxl2PAkxtEHizXJui0LOUHJrZvBqtD/U
	V4TFyydGnqYqxjX3sXHLQXeNFd/lqscyv8cYAuOQqxtEm+/zfNNEeOR5Zpey0g7U
	2O5U8RWOZTVMPxft0LQUQ5JMLgo8o+/Yiisy828x6b5/NC4QtcKvKYCrQQX47c3Y
	eNP/0w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f17s8jvsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:19:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c58d35c0aso150263eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782451194; x=1783055994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTul3dgdpD7qagMI1GRAj/SE9fsLTKfErHkSL7MpL5k=;
        b=WmPSC5zn+VAUQMK2IZlfSyL7eDegzScG00Dlu9NqZxrCcxqt5AaUEqflKBp1eOLaxo
         IjwRpaCBOFRkwG6vz8IkMJ14YxgDpLv44Lvf7JZz6x7G1iKPEr2Vu/nxCgjNQBo4Kg6L
         G+7sjUB0vVm+zJkxa/8pRGy6VgmoeDe0zZAkXj0d7RpOnzcHLMnLdAQ8y/JyoUobUW1P
         ndw+mDXxj4DYhN2nzkYaZVb7a/YMy1kfkjlwhELipzjTxcA3iH+NXZ80mIfbroJy8s+W
         RQPXMWjs1bOjP2DbRfZ82kCc1n/34iguOfx/K+ECMlOpbOuI6jL0nDewjQhwaRUqZZvR
         qFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782451194; x=1783055994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTul3dgdpD7qagMI1GRAj/SE9fsLTKfErHkSL7MpL5k=;
        b=bK4hCH/CbLRy9gDa0NFjtH7QYYx3o1En4fRR2bqdzmVq/FYSGtatTGP2Ho37IChTX8
         kFI4r15Ko7HnZP0K8GHut4SF7z+ymLfKmIPVusNFh5e84+hFFZklKUbx7VaAXaaP9y0K
         tlt+uVFfJGcnbUc5PV7XbQtnfyCp0BpanUfTYpJgz87ufPWg54FXsLQVLbpzvZ0XJE0A
         g2KJpfolVG4/J/DsjnVB3BpVUMRByak2fmMwS9F54aAnnflFL5FSq9nSGduiHXZ9faCT
         /N8fGMjhaR8wzD3X8RGsy3PSexTtEu1Odz0N6IRnEPkDq8MHeNT4AxF4p/wXaF8yHVr0
         2zYA==
X-Forwarded-Encrypted: i=1; AHgh+RoWmzTAeeozpnU3Neizw993x1K0fEf6IgPMpYcBjPJpGFTfIPN9hqTRIEwdHXl1Gje8pCV3tf1oWdsmpPyB@vger.kernel.org
X-Gm-Message-State: AOJu0YxwBlum82C3m6ppTI12WLGFuFhY+iXPu6edDcEdCz8HJ653KEBc
	yuVkz1hpWf+xKMJaUGI0u7k4muRYwHTYx0tBwsncCJServ7QtzO8696dGyU2AFME1uE3D1/SP0n
	mpHROXfSc7znZpABtsqcVwKd/xoedS10+mB1IFvtH2Kra+n0szAz1edHwrU21ebEF0pUsjvmnQM
	ko++w=
X-Gm-Gg: AfdE7ckVPur8R5Pw5t9tm7VrxTFX+r+LQYfb/0AE6XPYpAjB3mKJe/BpIPAMFkAtOoo
	Pm9ah7KNRRtz9FrnddfKKAu621ndeHq4mNmSjWEwh30L4XwjnUx7EMvzEHmkktV2tklwtHKNpTn
	nvBsDMqaPQ3ihNjT+5MPqNLkv4aInQw49dWDGL9AWg9YkpCdcn+F7I5T2YlzXMSLyGIb+lv2gYc
	IzXHcP49lFasTtU0OOPN+xwUVFHnHeCbbmQpnAjILOTlSeJyeMWVN77ptGKhCZvRG8hPAT/PkYL
	TvozgbOItQFSBanw7GuU9NJssXuAoSJPmbOXKrSFouXm4GiTh2Z07McTR7xTDrrP8AeaOQyh7EK
	Z6gigoq/3A3vA9oNMIcI5s/D27Ict/ZEIrQQgpVLrlH5nnauwng4cB4vcGw==
X-Received: by 2002:a05:7300:f68d:b0:30c:4384:95ee with SMTP id 5a478bee46e88-30c84db28cdmr2946962eec.5.1782451194339;
        Thu, 25 Jun 2026 22:19:54 -0700 (PDT)
X-Received: by 2002:a05:7300:f68d:b0:30c:4384:95ee with SMTP id 5a478bee46e88-30c84db28cdmr2946941eec.5.1782451193728;
        Thu, 25 Jun 2026 22:19:53 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm14345291eec.4.2026.06.25.22.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:19:52 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 22:19:49 -0700
Subject: [PATCH v2 04/12] Bluetooth: btusb: QCA: Fix populating devcoredump
 fields on unenabled devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-bt_bugfix-v2-4-93396a6f7d5e@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: MClrdStFwV750Bt5lEJLSavjfx174RwB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfX2/Vk372SY6oi
 54WRRjUW1C82+lfldkTluxPI6beN8HFUx2FjH5jqRi8+9Uv7u7qeNQm6NHNAstNrKA7ivyFyik5
 4ReNeIWtPskqabSJh19Bi+Y2GTwrAi8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfX10NItfgpHHjS
 KIXAXMZvgPRQer7+1i+30H88ckKg2RzB8OsC/7nm9gZ8dVMoIKSqrkjtL7XQhOCnHt4goc/HWul
 SgsLBRnpoC15k7518LcdFLJxsPsRT2U2OcDFk1rSc+AuUxW0wePQW5We2nEdQ26a+Hxpe0eMNCQ
 oMvvfqcnRoygcEy6200d+Q52jIzney2ZX/Z8vZ6Xcf2p1Zowbult8FghTcLqdVQkbwod6lZ/aMb
 0GHWj+nIbSkuchVkDp4wkMVT7H6paE3OWMQAAvbL6vzj6vak9TymnIiGpJQMr4jgoAlfOcZexMn
 R4c/0iTX2hzEVVVjSK8jxEvSMzrzx08V5BJoASkNVkWfIzeWVuK2Lc7deP/P86nCmZLcxtBTedd
 mO7CJmnJp8k8IQWLkc+AOGjyiDaHcifIItmMsEamQ+MMnM5Jy4yfUWqgLlboLtSTkjTEC2/Vu4d
 mc6ReEfLKC8TRU5lHMQ==
X-Authority-Analysis: v=2.4 cv=GKo41ONK c=1 sm=1 tr=0 ts=6a3e0bfb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=j0w3eOB3VtzsIZiBwfcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: MClrdStFwV750Bt5lEJLSavjfx174RwB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260040
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114593-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail,qualcomm.com:server fail,vger.kernel.org:server fail,oss.qualcomm.com:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B8BE6CA50C

Devcoredump is not enabled for ATH3012 or QCA_ROME, but they
unconditionally populate devcoredump fields in btusb_setup_qca().

Fix by populating devcoredump fields only when BTUSB_QCA_WCN6855 is
set, which marks the first generation of QCA BT SoCs for which
devcoredump is enabled.

Fixes: 20981ce2d5a5 ("Bluetooth: btusb: Add WCN6855 devcoredump support")
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 31cbe075edc9..0bc7d7b61b25 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3709,8 +3709,10 @@ static int btusb_setup_qca(struct hci_dev *hdev)
 	if (err < 0)
 		return err;
 
-	btdata->qca_dump.fw_version = le32_to_cpu(ver.patch_version);
-	btdata->qca_dump.controller_id = le32_to_cpu(ver.rom_version);
+	if (btdata->match_id->driver_info & BTUSB_QCA_WCN6855) {
+		btdata->qca_dump.fw_version = le32_to_cpu(ver.patch_version);
+		btdata->qca_dump.controller_id = le32_to_cpu(ver.rom_version);
+	}
 
 	if (!(status & QCA_SYSCFG_UPDATED)) {
 		err = btusb_setup_qca_load_nvm(hdev, &ver, info);

-- 
2.34.1


