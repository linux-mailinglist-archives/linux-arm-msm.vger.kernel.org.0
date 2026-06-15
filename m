Return-Path: <linux-arm-msm+bounces-113225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1qOZLKUoMGriPAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:30:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C1E688643
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:30:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jQ1ndk1g;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113225-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113225-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9BBBD300CB1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0D940B393;
	Mon, 15 Jun 2026 16:27:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CB140963E;
	Mon, 15 Jun 2026 16:27:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781540865; cv=none; b=U5b4BStoThmZvrSosg3AzxbDvKIRu0eUM5ja8O8aiww1nJX/GvVQjXqWPXRcjd1zx6JTk7sRIk+OWqR1YeIhgS+hruEG7ZdB0izvHXHoYhISPQeBOVfI3kISkKqtN4MiG7TskmYxwqobh/X1xU/cQD+ioFpHcY5soCihAQQdYuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781540865; c=relaxed/simple;
	bh=yg6oqGGWrbG2ZeRA1liGGIyjIzdiu5/xoaeETs4C35A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNXvNSTuXym1wIlVzSA5LAN2yaxen1AnTOcEl8SJYdXHNvjx+O65T4AqfBhEirHx0PppKtEReg+2BaM8xou+wj1ci1xOuU8lbjUFnt27qNYh66IrSOSRY4fJZITtD51co6yX6dfqEyzFD6siyf+rAfNvhvxVwhv9b02BNWVtQ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQ1ndk1g; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFi6F6806481;
	Mon, 15 Jun 2026 16:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yg6oqGGWrbG
	2ZeRA1liGGIyjIzdiu5/xoaeETs4C35A=; b=jQ1ndk1g89mqv5TYg0ePBIotTgf
	ph2YYAOZ5FVwYHDBa7VPjZimHLmqNqvbgE+dnuUvIP13XMt79BV47wk0oSRLaYk4
	w3wlzQ46tDMe8KawhWSTjQBhmf3ItYj1hDmagZKJroN0+z+XJM/ZDsRVMluGjj+O
	9g9g4Rmjt/6ewGSmMO2ljqGSzVXa5Cep/nVti2PVNZJEAYZXKjVfSMjnV3vKiDna
	tf2AjS3G8bPIUn+aVxRMEgPsIEU85Yhi18hj+LKwuvd/1YChbSFnZX13sooSjnie
	Utoj0aa4Q3fgAQxt/kZUmM08NMbwXdk3BwHAj7yoCma6byloj8ZxboW919g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf1qs7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 16:27:41 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65FGRe7h022980;
	Mon, 15 Jun 2026 16:27:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 4et5v70003-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 16:27:40 +0000 (GMT)
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65FGRdO3022975;
	Mon, 15 Jun 2026 16:27:39 GMT
Received: from las-colo41-d19-19.qualcomm.com (las-colo41-d19-19.qualcomm.com [10.37.19.116])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 65FGRdsB022974
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 16:27:39 +0000 (GMT)
Received: by las-colo41-d19-19.qualcomm.com (Postfix, from userid 3978420)
	id 6546B5EA; Mon, 15 Jun 2026 09:27:39 -0700 (PDT)
From: Vishwas Udupa <vishwas.udupa@oss.qualcomm.com>
To: krzk@kernel.org
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        kbajaj@qti.qualcomm.com, konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, robh@kernel.org, snb@qti.qualcomm.com,
        vudupa@qti.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: install DT overlays via dtbs_install
Date: Mon, 15 Jun 2026 09:27:39 -0700
Message-ID: <20260615162739.787779-1-vishwas.udupa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0f045b88-94fc-46b5-8a49-8a53235fc8fc@kernel.org>
References: <0f045b88-94fc-46b5-8a49-8a53235fc8fc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a3027fd cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=cSziVDP4AAAA:20 a=mE5DYVGZ89DRRyPe-KwA:9
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: XYYZs52t91JKW3NmvXB1HXT1FgEQoFcb
X-Proofpoint-ORIG-GUID: XYYZs52t91JKW3NmvXB1HXT1FgEQoFcb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE3MyBTYWx0ZWRfX/7Tr5JvKzln8
 PR3ZRcSfWhRdNiyRjYkONXjBmI5UrhBluHM7FJ/cgWr/Fk68dJeTI8FtGW42BMHPlpgHoPEr8pY
 ZZNtCkYkQIIlMMUWGoDzE/a9XStKiQM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE3MyBTYWx0ZWRfXwKjIgG7fbDIh
 1Rh0hgzhkul9kLDcFygxsQB4GUTa/x08CqOyad1xgcPjcu05LEBzIA5EBBzTRIg1Ih3g7G63blB
 C77YBAllIBRfbiQ1+Ea4MU7phIfV10ELZUKvb8Ix3T+97w1E8i5UAd/+iDvfEYMICvxqNlbdrzE
 XiFd6K8k4F9O9gs8nuh2PZlDbaK2uiQlumCmCcc/Mms7LS5zqpUx7DAAfz4MnZ5AZrR82QQjgwS
 ibkoezZdL51uC6oZUPGePMt8M0qyaJz8uR57QBD8y8A4bK/V1QMQ3Bgzzal7YHk3f/nmBgs7mjV
 jaUdj/U0JTyLhxYCR7dKyuedmh3ZiQS+nGZ/sy1U8V8p+JRHiiDEZ34j8eEQnLU3tFWynNA62G4
 GMZ9i0Irk2VNGTymd6xt84rJ5rnBegHkyXwkbIluhSXF7+f6vkpmX30/lnkBq7hIwO7diJyB/3j
 laX/fB3WxzBPDPx0Hfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150173
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113225-lists,linux-arm-msm=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[vishwas.udupa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:kbajaj@qti.qualcomm.com,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:robh@kernel.org,m:snb@qti.qualcomm.com,m:vudupa@qti.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vishwas.udupa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95C1E688643

EL2 DTBOs are used at build time to construct DTBs corresponding to
an EL2 (hypervisor-enabled) boot configuration. These DTBs are included in
distributions [1] as complete boot configurations (e.g. EL1 and EL2).

The EL2 configuration is not enabled by default and is typically selected
after the initial boot by updating a UEFI runtime variable from userspace.
Once set, firmware selects the prebuilt EL2 DTB on subsequent boots.

Although EL2 DTBOs are not used directly at runtime during initial boot,
they are required to generate and package the EL2 DTBs in the image so that
firmware can switch to EL2 when the configuration variable is enabled. Hence, el2 dtbo's
need to be retained.

1: https://github.com/qualcomm-linux/qcom-dtb-metadata/blob/main/qcom-next-fitimage.its#L273

