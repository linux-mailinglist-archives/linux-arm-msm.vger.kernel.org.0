Return-Path: <linux-arm-msm+bounces-117924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FTH+EsZlT2rUfwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:11:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9257A72EBD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:11:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D0H7Rg+A;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Cf2rfvG9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117924-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117924-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC6303197DC3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CA6407CEA;
	Thu,  9 Jul 2026 08:53:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F15940759D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:53:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587183; cv=none; b=qafcxDU1+21W/tFwuxwSvjm+o/jkFq5OSpcovyoLjcjvW5r7wvsQw5s3hshjyy4gnF0+zKeuBqG+fE4AI1+1uJZTpWhPHj+vOBLroaFJWF6mB3ZSMiB8xiQBwzQg15/cLgQlnuKyXxpX07W9TqNfI9JCuuVlXIDU+V1adQCORH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587183; c=relaxed/simple;
	bh=2LC4TKuvDL/8ibezYhZ5/e526GGw+mDJkG60Rt+VgOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJKol0Vh6ed7ZAPmCbrLdIAwR9sNtUORn3zr2nKyByIh+ChcGdWGhRixNDXFnSxP/LodjH/lwcxB+3xRuTW1cxuBxgHW/B879/05WEiPPpu9mjUUOdX/fFiebxQmVchuXm53GC5nMOGh3QYv2uB83Uqd2tovI2Yh38DLOpnLs1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0H7Rg+A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cf2rfvG9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960H9V887969
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8x1vSQ0yLHsjUQfaDpuXr3VOOZai+I3ARqOIth0tqys=; b=D0H7Rg+A1yirMptP
	lw2c+lmUBJodhyxOfeST13/J7lC0huNKHf/DWxEt8Gp893yQYSdGVMzxeYf0/TkU
	u5nGkybLvVefQo0Ei5kF0bPGKiZBdcmcGiDCL99XkNlyDj1o4/NmpBCLcbDAmo9R
	8PxiyZHnLQWIdPlvD0wAuphABae+9grlpJikQkf2ZPLoCmktImCJPwAPPgNvOZcV
	rYe82gYF0hzlR7hpdH4vAbHMvzi/cttnUKdzSEDhEPk+SOFMfuq/FYYvYcX8f2lS
	TLmMd0nCJ71aMI3GrrX8q/KtQ8n//rDpk7QppVsZ95xTOkwImfdnrjpchMmGA30t
	/Z40ng==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq33nj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:52:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-380fe2a3fc7so1727238a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587179; x=1784191979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8x1vSQ0yLHsjUQfaDpuXr3VOOZai+I3ARqOIth0tqys=;
        b=Cf2rfvG9w84wFlABTvTn8zwFru+la7gRvZJaK0eon6aKn+IKTkz0R6t0AGoMlcuJ+U
         ICAxTEVt6uDYAMa1bUuauxu+8MZ5K8e/8v0tTCiFPYaZUcpYsUxVwy093AAXGYKFC0Cg
         ps4rbVkmmziWd6cjklSMgU1Nco5yNtNIw/wfslqPJWynzz5Blk4c1HaCsPH5j64MhDIL
         nC29q5EdSWKmzk8ehSmWnFZrM0pOdMvZLP5dJqS4LjaFK72PM666GB/Ag4JM3/eUJgsU
         zvQbkqPBswl5PFmuNjCmGsXWfaMFmHFPIeUi+97aDyBVXZZ6K6vFlYWO1Gxb8eK1zTUD
         +XXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587179; x=1784191979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8x1vSQ0yLHsjUQfaDpuXr3VOOZai+I3ARqOIth0tqys=;
        b=Bwi0yRUyzMTKIDzDN+qPFlL8MJfGBTdOYjACLkm8X8QqkKUulod6wI9oV5lRZmuBvM
         EGHlttu86KGU+0cXaAB2w2g4xLXaZYVuH0hLYAdxR5GXRg+KSuT/00AYJR2AeVKwohQv
         2SrO3n2Opmy1j8DzdlNwO/twhdfx5Z4qsdB/jwW3o4d8l7I/o/DHuE4/IGh+6YmW5hNT
         9nUKUe5+V8mSPxcoBLjiwHONEogDY7vpd/vu4NnfzsxBdxxgNVwEhul4FTDtt5kMUqyK
         hdIHU8QoblCh28wbz2eTzMtw45/t67iqxogD4OIvLZsxMY8cWhqGmfzGRyJRkgBfzY6C
         lkbA==
X-Gm-Message-State: AOJu0Yx6/ERxlRH3ks8Wq4z9nGJyGxcA4B9RCDLr5Z+bJFvgaPJShCxM
	cXo1+fG+6GBnP1GtxMUshkAkLJDFmYZUe/X9iNxUijJ1MI7QbdErDwu84JwU3dPqn68SWPhXxyc
	FyyPzkm6l5cAHFPfCw3y/qP+MkOLX43nTtrtB5S+p5UODB7OoIGtNDTKqjfXSlBC5LOI3
X-Gm-Gg: AfdE7cn8xeMDM5zIeHe4G5PuIeMt8AT2C3pjj5mlI/QdJRS/9NRh53iL68P6SuQb7kF
	5Rx812DCd7feIGGcndHExkk/VB3FuUXAHloYOCPE3NKDXSDuWGaCYaF/zvLOBexytsF51ilmo3Q
	lKccSTRjablSVir6z8XfDxO2Vc0DdYx3N8NU5fzr0syzReJtw+38gPxRxoCMURR7cF+Z72tG7mp
	IlQgfrWsk7RnyOPZB9HNk9q89SSGdLc4uAxtCPeectXl3QUbNJ36mqKJFplHfkGPB8DNfJOTc7c
	52+bHEzeQUWxcEzIadNSjRSjiwNJwTDVgFr+1f0cz53VqeRfQh4k7ToIoE1kgQaP/1CMDe8Zak/
	PDoJR7IiwLk7vIoNKIfNqFVKxujkyPk4YIjoCJZlLLGDc/j8qRsx4pmGvaNsMnKJzXwSTSnE2hn
	HWXuUb
X-Received: by 2002:a17:90b:350c:b0:36d:7b62:4767 with SMTP id 98e67ed59e1d1-3893fe5b986mr6638409a91.5.1783587178781;
        Thu, 09 Jul 2026 01:52:58 -0700 (PDT)
X-Received: by 2002:a17:90b:350c:b0:36d:7b62:4767 with SMTP id 98e67ed59e1d1-3893fe5b986mr6638372a91.5.1783587178287;
        Thu, 09 Jul 2026 01:52:58 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5574c36dsm822771a91.6.2026.07.09.01.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:52:57 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 14:22:37 +0530
Subject: [PATCH v4 2/2] usb: dwc3: qcom: Modify interrupt handling for
 eUSB2 Phy targets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-eusb2-interrupt-handling-v5-v4-2-d4f993925608@oss.qualcomm.com>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
In-Reply-To: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783587165; l=4842;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=2LC4TKuvDL/8ibezYhZ5/e526GGw+mDJkG60Rt+VgOM=;
 b=smNUIwlTXF/VpOZSNou22Hl0IXiuqTmfsm8JOd7qf2CBOhKfQHY0upcIuUMmu5suS0QkV93jh
 AFkfq+WV+vvAW0BChuC0x4K6Oy/seub67vv5oaBdnb4UtTJjHiU4ZyU
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: 9kauck4TfelXCvU8o_zGkSAM78Xv2K30
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX/MYNFvi0awRR
 A4RO8jaguh3in+WlPewd7W0WXs504DQHZo9sNjicxOZRsHCGDSJl8b9QU9E12SVIOJmRH20nIbU
 FztNjUkDrhh6Md1dtj25qj0VsQUXuu+de6lDmSh/07lo9BLBj/Z/x62gH8WPVOK92Prw9HN/ZwT
 bex51jRiU+E98JhgB7mJp+KZracnJhVbvXd70XzGSXBppvWduUoK0rb44aLiZR7nw9Exjb2eaNJ
 rKpzcq+s+LGvOux4uaHsPqyIgT9Sy+n676bMbLkZnosJcdbAGD+HlyxjdNLe4vUySBjPBMco+A7
 qvEbyHr0i6+n9cQ7sq5JRtK3fnyPRBELFV445PLRTkzPiaH7T0mBC8hBAnaqfyI+3p/TAWJitI6
 xyQf6YlnPTVIPEpmXhWEQhwVPnJBuWKc4+XzkrBMU03004/QDfeHMjetG6yCUniU+pNata5bB/a
 mX8Z8WngDrCP0eicv4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfXzb7XbQUXOnTc
 /7i0osUu6GyrfpBijXs08LyzsG0hnlti8fcq1o162Blb/EUIg1FSTNIPCuBOEEz0iEOvuN38oxC
 9PVGoGsYPUKHDrlDqAKWcZs4h2D9Mbg=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f616b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tc1UND2VpooZlN5jxTkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 9kauck4TfelXCvU8o_zGkSAM78Xv2K30
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117924-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:Thinh.Nguyen@synopsys.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9257A72EBD3

eUSB2 targets handle wakeup interrupts differently depending on device
speed when operating in host mode.

According to the eUSB2 specification, remote wakeup signaling in host
mode is detected via different data-line assertions based on the
connected device speed.

When a low-speed device is connected, the host repeater drives eD+ to
logic '1' upon detecting a K-state on the USB lines during remote wakeup
(eUSB2 specification, Section 5.5.14).

When a full-speed or high-speed device is connected, the host repeater
drives eD- to logic '1' upon detecting a K-state on the USB line during
remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).

Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
eD- line states, configure the wakeup interrupts accordingly

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index f43f73ac36ff..65996d47da1f 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -85,6 +85,7 @@ struct dwc3_qcom {
 	struct icc_path		*icc_path_apps;
 
 	enum usb_role		current_role;
+	bool			has_eusb2_phy;
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
@@ -272,15 +273,23 @@ static void dwc3_qcom_disable_wakeup_irq(int irq)
 	disable_irq_nosync(irq);
 }
 
-static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
+static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom *qcom, int port_index)
 {
+	struct dwc3_qcom_port *port = &qcom->ports[port_index];
+
 	dwc3_qcom_disable_wakeup_irq(port->qusb2_phy_irq);
 
 	if (port->usb2_speed == USB_SPEED_LOW) {
-		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
+		if (qcom->has_eusb2_phy)
+			dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
+		else
+			dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
 	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
 			(port->usb2_speed == USB_SPEED_FULL)) {
-		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
+		if (qcom->has_eusb2_phy)
+			dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
+		else
+			dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
 	} else {
 		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
 		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
@@ -289,8 +298,10 @@ static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
 	dwc3_qcom_disable_wakeup_irq(port->ss_phy_irq);
 }
 
-static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
+static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom *qcom, int port_index)
 {
+	struct dwc3_qcom_port *port = &qcom->ports[port_index];
+
 	dwc3_qcom_enable_wakeup_irq(port->qusb2_phy_irq, 0);
 
 	/*
@@ -303,12 +314,20 @@ static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
 	 */
 
 	if (port->usb2_speed == USB_SPEED_LOW) {
-		dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
-					    IRQ_TYPE_EDGE_FALLING);
+		if (qcom->has_eusb2_phy)
+			dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
+						    IRQ_TYPE_EDGE_RISING);
+		else
+			dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
+						    IRQ_TYPE_EDGE_FALLING);
 	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
 			(port->usb2_speed == USB_SPEED_FULL)) {
-		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
-					    IRQ_TYPE_EDGE_FALLING);
+		if (qcom->has_eusb2_phy)
+			dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
+						    IRQ_TYPE_EDGE_RISING);
+		else
+			dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
+						    IRQ_TYPE_EDGE_FALLING);
 	} else {
 		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
 					    IRQ_TYPE_EDGE_RISING);
@@ -324,7 +343,7 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_disable_port_interrupts(qcom, i);
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
@@ -332,7 +351,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_enable_port_interrupts(qcom, i);
 }
 
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
@@ -683,6 +702,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
+	qcom->has_eusb2_phy = device_property_read_bool(dev, "qcom,has-eusb2-phy");
 	qcom->mode = usb_get_dr_mode(dev);
 
 	if (qcom->mode == USB_DR_MODE_HOST) {

-- 
2.34.1


