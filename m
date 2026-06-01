Return-Path: <linux-arm-msm+bounces-110572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eI1wFklvHWrlagkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:38:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE6861E6CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FBC8303581D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 11:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28C734750D;
	Mon,  1 Jun 2026 11:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gm8e0jxQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5Gep4Xu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9101318EC1
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 11:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313555; cv=none; b=r0QGpixZTqqm/i3KFoRBLk7FahLqjmgYZnnd5QXfupAg9ieAggJ/w6F4/89ScZfi4RzSs72QS2rHTXBRqfv494YgiIHGE9jz3EL50ocbeKBRW0JJo7ygrVOXaWNu7UYivPgNtDpFB389xUGp/rqcMs5MuMmMhhHsZi7BworntKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313555; c=relaxed/simple;
	bh=7uPIu3zxNjDZhzrxQXN/k/lySRwSmLe4eW4Ajr8rF3I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fxkf1YKxwileLPoXIlIyfIAxYsHcnA7fulmbG4t3ICikdjFY1qYNRxiImudFhB/O58QrUlr8pBwI0a/QBLzuZxYh07v0Qo7jMz3lVuN/0kkHdNgg61EkqtdRGIkUsD9MZIcX6Shr2p4UeKDyyiGbjUuHNQxVzEaZSfU7R7TRFw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gm8e0jxQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5Gep4Xu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518eBRr1214129
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 11:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xid0X+0MWRKmVl/wV1IjeE
	IVaqibNbl5MedpkU6x94k=; b=gm8e0jxQTCmwjPxTX9kMSfCfML6dUmRzikaydP
	GRiUGWIn0iC5xobcbwazNvChWGhaxBJS/QdwmlofpL7eAONuH5isDVldnjYQbCUZ
	GlQTmTzBSWYlGa6vb84tRVX3/Uh26uxDN4bGmz17MEQlhRxInrqpg6Y4Rdu7wP4B
	9MXoFSdXv3PEOSKrR1Z9kbojEF5Jb01eIqnmhW8o6gRIY72Vgl3/Ev8NH14AL6ze
	eUMf1QfCNtm/FmP8D2C782h6MzEgjfgSmDOXkmbvjPr5GLcAy/XkXc6Xn/Gw6kBz
	hQCrDAMn5W60oZj4M4JjwBMd/zXIqMhak/hT/J4KWtLiWsFg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s98phx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:32:33 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137daa666a6so182701c88.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 04:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313553; x=1780918353; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xid0X+0MWRKmVl/wV1IjeEIVaqibNbl5MedpkU6x94k=;
        b=P5Gep4Xu0PKOs6Ohz3UZzr0Ne2S5HiF4ZfTZ2eKdPVwXyAwVj6XxIHjteyRaI1jEDH
         z/Pk5OBIFv3c5kfOQ7m46wS8jiLh+sI+FeS82STC2t/mxp9TfwjOD+71e62vvfR7+QfE
         1G7rPLeOJEWE/kV16cjesboEbOEvYCHKApT/ZadhtQFBm8BsT7RoGuOr3uLienYoTSHU
         IRk6k2GuiZD6y7XnnxRU7fgRN7ScovJx4OBJ5GlyvzgvaQKEQaLrAQYyFAAnWXhnIVgs
         JKjme4JA5oSNxwpK4HR/5165VYDX93un0tJxZZJaqO4QmDIY3nM/NdnOIP2GBYPtcGo6
         JGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313553; x=1780918353;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xid0X+0MWRKmVl/wV1IjeEIVaqibNbl5MedpkU6x94k=;
        b=JpLhCYmORcS9NphgE+LofY2BKx2rS4Xn0LQVK3dXqqAOhZ8ECHcoWOtl5zZgTqRMSi
         ZgQJlIM12npxg3BhVEFqjLizve0vHWiI3Y5XaFQUeol0ss5CPujbl5q5DHSvzteRmpvh
         p5v9amWLT9Oed8OkJgYezZeuTYNivwnBoLxLbvUmC3dGIT+imqT/Ge+eJCvwlpiR1jqQ
         xUOov1I4ESpvL3xnwQEtOrDGZ5dpU+HOTcWQoxiYJ9L8NRqsdO2rcNSeYnjfKPRMHIur
         W6Id4eKP+wqQKtp6+KWxsz1iFWvdyp9FYd/9z1lWTCKkWpNcTpRRiO2QOZBTdh1fAmxH
         9afQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Fr5MnAPdEieLyjWARijWz8lORkT7ANbd7rC/NJxMDLKta3CqYMyRyGe92PGlODh9rlBX0CM1CRSClq46c@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8KJwOGpmmhcO44+c7qqFRo1PLs3u+zm2PEJwOBomoKuX386rK
	bMkghcTxsEdIJSJakd7MzlGuKXWUfagyMsGQ+ZvRGh0f7VfGwDA37MagLjMhfvwZtCu9S9NEzYt
	wsqSn/KOR78NXpb4VHvJEx9AJYqUYktzIBPTu4savZR/ltE9IipoiWedaADYVHP6BMBvy
X-Gm-Gg: Acq92OG8vwn/JlKLVJt6YqvrJjhuUNDsknzi9/g4F/8c2DPmJqCpxlZBC7V5msPA5ah
	VwfqPUxgDCdJOyHNjazNgbp7jzWFKN/51EvTedjz6P4uFxSkqqspD35/Iat6heGzMgh9lsTqEDO
	8Hk/vAZpvGT+1RTr4T3y0wMSM+HXumF2Jn5dQWirvyj+zUORziG5HJXCBW05reyQnBaFhO5YneY
	4Oo/Y0ozS046qp9JwMUwVgu+lBmoNisN3zVBMCFzUYVnGbE5Pe73SpHY+szKawcFV35H1p40nsT
	/cuvaMngYrg6HIW7SqfnPqpmo14ASmzxgP1b+xEU3gAPdt+OY7q6izdGhyLK5ys1gXhMpoh253h
	cEGpGZJlVlZ0zuKtVwN2tKb2EvSt0aPpyKc9XNsSnt/jV5nTBuIrUdIHCCmqAOvriyMXwVvQVuq
	1K3Q4=
X-Received: by 2002:a05:7301:688a:b0:2d1:9b35:4f03 with SMTP id 5a478bee46e88-304fa6a2df3mr2157960eec.5.1780313553173;
        Mon, 01 Jun 2026 04:32:33 -0700 (PDT)
X-Received: by 2002:a05:7301:688a:b0:2d1:9b35:4f03 with SMTP id 5a478bee46e88-304fa6a2df3mr2157935eec.5.1780313552597;
        Mon, 01 Jun 2026 04:32:32 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2f2904sm8667431eec.9.2026.06.01.04.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:32:32 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: [PATCH 0/2] Bluetooth: hci_qca: fix NULL pointer dereferences for
 non-serdev devices
Date: Mon, 01 Jun 2026 04:30:54 -0700
Message-Id: <20260601-fix_none_serdev-v1-0-8d0497ba83b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG5tHWoC/x2MQQqAIBAAvyJ7TlBDib4SIaFr7UVDIQLx7y0dB
 2amQ8NK2GAVHSo+1KhkBj0JCNeRT5QUmcEo45RTWiZ6fS4ZPYcRH2mTcrMNRrtFA1d3RVb+47a
 P8QGX1bDgYQAAAA==
X-Change-ID: 20260601-fix_none_serdev-5f0635c21681
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Mengshi Wu <mengshi.wu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sai Teja Aluvala <quic_saluvala@quicinc.com>
Cc: Zijun Hu <zijun_hu@icloud.com>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: ACE2XMgUsE0x0l8mBQK94uajUHkH8FG-
X-Proofpoint-GUID: ACE2XMgUsE0x0l8mBQK94uajUHkH8FG-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNiBTYWx0ZWRfXyJhbuPZb0Hh3
 amUbFrTQtoR4aKnGacBaFa1pPnwKNFl1Ss/5nipL6HG+os8HEqrnosw+cCuOOuexLY/B9zZO9Oi
 9HRcX2/bo26B6olP+uLi8WF/xMoSmI7PQ6ZcYj80xtOlO1aLjwPtbDin4vaJgMLUJnPUD8RrJH3
 I8mac2ZOxLDypRd19QgATHPdte4xwwdEn+aOq7xAyN2/yVOQIHZWXdX8Oo3yQ4HT/xoArO3QvgL
 cp6fDI0QZf8lETdfd+d/DBRZPru46kMc68QIf1+1zT3XBDR2535my17wbEhaoK+l98hUF6FxM3N
 hqNtNZRj4tnA6iBIP+3X9QA+vwUi7F705sklGV1w2ohjgw7j4ZO4EPllSElLbEOS26cZwSeRKLY
 JrVne9eJorDsPqTpAXfYfCc2nViUG/+7Na2fny1lSv3B6kPSyOOx0khd4knmDGa/YhGRlHqluCh
 Glk8EpKZ7oWGcyblm0w==
X-Authority-Analysis: v=2.4 cv=Zo7d7d7G c=1 sm=1 tr=0 ts=6a1d6dd2 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_MtBovt6BdkQ8AjZJCQA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010116
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110572-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[icloud.com,intel.com,oss.qualcomm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AAE6861E6CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When a QCA controller is attached via a non-serdev path (e.g. hci_uart
line discipline), hu->serdev is NULL. A couple of code paths dereference
it unconditionally, leading to NULL pointer dereferences.

This series fixes two such cases:

 - qca_setup() dereferences the result of
   serdev_device_get_drvdata(hu->serdev).
 - qca_dmp_hdr() dereferences hu->serdev->dev.driver->name.

Both are fixed by guarding the dereference with a NULL check.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
Zijun Hu (2):
      Bluetooth: hci_qca: fix NULL pointer dereference in qca_setup() for non-serdev device
      Bluetooth: hci_qca: fix NULL pointer dereference in qca_dmp_hdr() for non-serdev device

 drivers/bluetooth/hci_qca.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
---
base-commit: 379b101059b44f64f6c5c022724f880a68fed15b
change-id: 20260601-fix_none_serdev-5f0635c21681

Best regards,
-- 
Zijun Hu <zijun.hu@oss.qualcomm.com>


