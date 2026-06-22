Return-Path: <linux-arm-msm+bounces-114026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rJMPDCtMOWqyqAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:52:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A578E6B07BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:52:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EfitfEpL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kreqyUsv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114026-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114026-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1EDDB301474C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56B4314D1F;
	Mon, 22 Jun 2026 14:52:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A7A310784
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139942; cv=none; b=TNA9KqznWZTaMY8u3900MkF9BTu2XVnZJ+3BDNpgkOQyE+Jz3HW/1uyO1sgNQkCGWMwJOv76HA02pNKvEkts7NU7ls2GHCFqL67XzYTxlP8KYmqFRI+4INihkSiqoCLZ7mh13ZjdyPkU2MxQVoQBns8EFcGRY3dYq27QMkw/h4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139942; c=relaxed/simple;
	bh=KlQAV2tDciJBHz066Lqbt/JQnFkB38ZiAvjkY7Pa/04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NUb4g0pXSomQSEIpyifDLPV761658g37+8x8je+pZt9bVClTNVLtfoyRWJCE1CKGhbaiQyouioHnjxxwGci2/vV0muGhu+WMpiHF6vEctmYQfZUJxcceR5R3qIHUoZZB3CsylpFaHTV0mBl44063/J0KWnSNsGEnCgEPhZc71MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EfitfEpL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kreqyUsv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDG3WW1062158
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	14Obbvd4z6NdWA1t1SKXJ5JFfXqzhEWCNw4XBeZhqg0=; b=EfitfEpL6hP4X6cO
	doBXFjvzTXMdqwECZ3qoSqGWR9srDnHGG0/kgBqjMTlTmDD1c8TFjy8OCKy2YIpr
	kFqFs0lCR7ZsKqQDYVsG0GUJWduz/bzTHw0GELnqdsDrDOnFrkVbEghIBq5QBlwp
	tLs/FYiQqWZwDz3NmYvMCG3iQsBECvUuWBSQI/3qw6Pfl9lskTsl7JIDd01peaQe
	wsIG/rQ4w8XanJXI3IGqub86JnJn88PINGxJZfxzshf3ewOsM9Ijn+0b/r0VavO7
	Gr9lAzMYfu0igSMHF14vrl4ufduuhnbA0QCu7cAbS0gPdrm6wgKE6m3Sp+6B7lgJ
	JdJCpQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1t0st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:17 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-137eced000dso291587c88.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782139937; x=1782744737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=14Obbvd4z6NdWA1t1SKXJ5JFfXqzhEWCNw4XBeZhqg0=;
        b=kreqyUsvjG8i8urZeCvHpdHWwf3tLUt11wLQESqX5hLgTOscROuBq49LogRJoIaStI
         2F7EWDKJ92kK1O0+xZ+JhbeN82F+f7F+2caq8s8exN9WrP4YY60vp62Y5EtKCfZVcnjf
         bv2TI05jEXvmi4hYvc6dDspbbDcxmnUiiEPC4BZEbYDJ1UaJnANgV0OVnO4AVuSY7hSd
         SyXtTo0s8CrE04p1qLOb1UlwL6Xx9vudFAn7jwFrX6LZew9gRg6PtV5Jazn88VoSw7Z+
         7Nz+t9hJ67UOtZ9esAgSz4esPO5v5nQVny3YkCmAa8WjKgzs+Iv3hWVQLCXXPJyfiKO0
         npZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139937; x=1782744737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=14Obbvd4z6NdWA1t1SKXJ5JFfXqzhEWCNw4XBeZhqg0=;
        b=eqctSePXXxpHwprXBTYw6GdN/VyMk47f6xMfKdvkeaEFALEiPDbvNaDqWLxTPXZ1o5
         nADi4/86gMRQa7OyCVS6vkUVffzjFLM7/v/M5JAvpZibD4xHFQDcR1B5aWfNDISfBi6U
         kc675v3HCuSonXOpHbARtb2BWAz9WFbR6pbDKdDRjPgOKfKDtpRRTgzS5OZSgRjI43dK
         gTKhHh5GHO71f8sJ8z4AtK8iMIvIifZ2bLtBzQ1NGftDnhjshjiZu+DZdqxApoTlkMa3
         Bm+jTo7k4J/Lb8OKPfO6OtjMUJpD66lOg4Un/85kLXeQfAzpkVX+VBHxwWQtvH/Fbr7d
         1qaw==
X-Forwarded-Encrypted: i=1; AHgh+RqkJf2YeIalTp/eBGj5avn5s+nx74AhcjN3g0zOtRDEdMBjEwPylRLW6beumeoI3K3t1za6HUu3k6QGQyne@vger.kernel.org
X-Gm-Message-State: AOJu0YycePH5k2DMwVpIRUN6Ng2G2O64AVIJU0T2qH73AcVulR+4JoXu
	1XtYh4xs2Pb82gpCOP9TqJK5et4fcYKn6A0OsqkWtrff6WvCMRrobjfwCoLQF+kJ+1xGoPESIH4
	1Wwad1C4h7kJLPEFpt67ZHzKB8Ui1VAkNzHLXMIWqTxJbhTzltF4IfzefTrk5EsW23XvO
X-Gm-Gg: AfdE7ckHuQrZTs6uTOcA81dW6wDUHHS/YA29+rxWxAXwYWIl7srmcsWdk43XtdmKBf+
	nyVD5KX3RUJ/AKA9GJ0/oT5zgx14tRommhOvny6FB0EjNYXyNP30R/l0oI4iita/+unRSUlTOAO
	mqx79JxIrnE0LXrLqxaTll9a4qTkRu3T/QbSAK65NCmwtEXGQxg0uOm4q4jm1kLbsgPbIMMljJ/
	AZQnU5HP2QHSQdJ1L3s3Kpu1f+s+my154RaOjQKY4V9IqBZ2rkMivrCbr/ueyeyIusC3WF0Grgb
	WDp+VX93GWaDem9S+6UDqKIQu7TMVA47t8+dHnxJwGUIsLdGMPkRkRKd8bUebjLW6Qfxmxz1tnz
	9IDHDa8NQZg9hmreUlgQG5TFRtRdeS3XLN6ef5rHDFabkZK7anZeczNKuXg==
X-Received: by 2002:a05:7300:730c:b0:2d5:9438:2a02 with SMTP id 5a478bee46e88-30c52186229mr317961eec.1.1782139936922;
        Mon, 22 Jun 2026 07:52:16 -0700 (PDT)
X-Received: by 2002:a05:7300:730c:b0:2d5:9438:2a02 with SMTP id 5a478bee46e88-30c52186229mr317933eec.1.1782139936391;
        Mon, 22 Jun 2026 07:52:16 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bddfe34sm12025561eec.20.2026.06.22.07.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:52:15 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 07:52:14 -0700
Subject: [PATCH 01/13] Bluetooth: btusb: Initialize @priv_size at
 declaration in btusb_probe()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-bt_bugfix-v1-1-11f936d84e72@oss.qualcomm.com>
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
X-Proofpoint-GUID: MpxboDBsIrFWt9ymhY2c90STMjMGyOha
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a394c21 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7HHrRZN38_5rRL6TGbMA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfXw7G9Mf9c8F1k
 2tzhZ8fLsN/35f4claA/Hvg7MfdJaWLv/ixARoNYflDmy4Q9mPxhrsMzU+p4Gjy4WoNDDcFrMYr
 Z0e5qeGDd2uxF5ETNNQO+6/t+f+Xzbs=
X-Proofpoint-ORIG-GUID: MpxboDBsIrFWt9ymhY2c90STMjMGyOha
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX6aEFSw700Al2
 nzUXJpF4ENy1mlOFsGnCGfVGU83MnGUJfGQQ513Ik1wY7UzIGlA9zxHd2StQ8jCa8w+gS9OnVxr
 qDpYpCkxPCL4qm8BbS211izlhQE8vakVMLkGR9CCnycVj/phPdJ1KWK1WW4LQdBWU7SstLW4ZU7
 s2/oz02SMII7HQzqNtiLai3aIiYPBc3eZXzRDXq9dR8gPdw1ouQfvQ/x+SV1GHOusxjaMMWErkT
 TO7qlH2fw3eWj/wU2bDsZBiKf10V2zNjfJGn7s9gOWasE5OKrPdcV9Q56Yir5NDats7e993dTQZ
 aeVGLw4B/szUt5/Jnj8kV2kXOZNSdAEgD06BGmm/kSsTW5/cyRqERPTDJQAcUcWt2H9ype/mkhv
 gVYX572qBI5BsYG5ISQw9kGBh3nY/MunT+Wb12qltXTx4y14Gd6rKz7g8W0OvNTIpSiPuiGHMa/
 zjbduxFpVyysJ+NNCCg==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114026-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: A578E6B07BC

Initialize @priv_size at declaration to reduce a redundant assignment.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 7f14ce96319b..5209e2418493 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -4082,7 +4082,7 @@ static int btusb_probe(struct usb_interface *intf,
 	struct btusb_data *data;
 	struct hci_dev *hdev;
 	unsigned ifnum_base;
-	int err, priv_size;
+	int err, priv_size = 0;
 
 	BT_DBG("intf %p id %p", intf, id);
 
@@ -4152,8 +4152,6 @@ static int btusb_probe(struct usb_interface *intf,
 	init_usb_anchor(&data->ctrl_anchor);
 	spin_lock_init(&data->rxlock);
 
-	priv_size = 0;
-
 	data->recv_event = hci_recv_frame;
 	data->recv_bulk = btusb_recv_bulk;
 

-- 
2.34.1


