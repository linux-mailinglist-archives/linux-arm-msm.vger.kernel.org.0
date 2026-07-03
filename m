Return-Path: <linux-arm-msm+bounces-116151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FUN1C3BDR2ruUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:06:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB63C6FE908
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:06:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Kz9PX4ou;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=D7jqo7Y8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116151-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116151-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 80BCB3034812
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 05:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06938357CE0;
	Fri,  3 Jul 2026 05:03:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C0C34D91F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 05:03:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055038; cv=none; b=kLE+WG2pGpKeYdguONgskAn5XBAnGyuZsxzxqfncgth+VEW+OScSv4W2NrGPR8kHQG6/eSJoa0bjQVKQ1W8LQ+3uWzS4dbQMtcnt/QGV7O5pCCtZyTptuxK7S3rzATp6sN1mKQgsVKrSD/I6AG2kQ42U73fnmBOW7kAUZH9aV9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055038; c=relaxed/simple;
	bh=rVXcKV7+kz5ldKBXO/tHbbJCCqeIj4iVBlRaSUOippg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kaETwcRzOsPqjfg57ZvO7f+U2c/qlapaQ3LGqq931uoZrbP1NiOre4Zxc3LsC4C5Ejj68gsoc/nl3YvIFwG0/rNI5EH6dpfIDjoQb/vJ7aUgCTBBk+DRydc4MvBTtSSiJ8cucNAKUE6MYHVxC3OfNi95LdJ/+iapVv1aGUN6NDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kz9PX4ou; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7jqo7Y8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342YAG2686987
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 05:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NRBgE59QoTQV38VfgncqRJ
	YraRggkHBcu/Lnxj9AfME=; b=Kz9PX4ou0E2rzYJfU2YnTUQ9yhZCPBQNqiPR9p
	CEFvDPQWZjHGBADxTGLxRQqpJ0xB4605ahj3MquNKlSEoIwfn9qSQYiEM+G7JvH4
	ejAU3XxaBOVO0OhkPDQRMLKZJ5yyUZJlSyVZDopfFRao5i1BYVqOR4R9Zxt0SH3p
	rtN/n2J+N1PgsV0Kj5AxPnGAwhLc0MYB1TdeaODbQF+OU96HilRFmC0dg/PY2Zpg
	udjrrHUeXr69qolFQApg6uVlrvU826UNzdT3yUgozsVxmAc1+HzKSYXZzWd8PAhu
	hXwjqv7JeCyQlCRz0wdGOfuVoro8fyFJD8Qvx6a1kr9CqdGA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n0hph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:03:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-380a638fb5bso273473a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 22:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055023; x=1783659823; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NRBgE59QoTQV38VfgncqRJYraRggkHBcu/Lnxj9AfME=;
        b=D7jqo7Y8b6FRz9ZPg9+iDqieoYuvmbG68XKkCUkwzlXth4Mi/deGtFmSiYvaDWOswk
         x/QPqGy+2cTgFIcGfqpKPWj3yT1HUAy4EaRUg4dIA5kR7KUOmXhRx1j0n8dldwMW46dM
         FV1vcXjjbR/BZgVsLUfCXJhJ17LETb10vHAkPsTRclB6J90aeTUW7i8uv9hM8yQ3gPmA
         FvoyFBQgYJAAqNlrN1eLeScGFwb5iU42147NbkmVw6XXg3hMQ/M/sTmJq+cN/AYJWmhA
         m3slKeVS938WdR8n9G5mQjq1B9HiX5L3hPs74hkpvF9d7x5tnFJe6L3eAChTwj5lGGud
         WpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055023; x=1783659823;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NRBgE59QoTQV38VfgncqRJYraRggkHBcu/Lnxj9AfME=;
        b=Y9q+gYxvkNOrAxyZRIqqNyNoIqp3Ho56v6lPoBbJaaoagOxlbfNpie4B1k7016l7uh
         6WXqDPUSnKzC7RGN3OnqwHGEM2VcKqkqm2l1DP2K6pcyFvBMiBjaGv4gAjl2s9I3VvDb
         lzJSBfG+aRq4xCwl370OSfZvkt7YGqgQpZp8OjErMlbT9c9I6DlReY9K9xyA0Z7lcCs9
         OU4v2veBqIZ7mQr3f8PIfuUqzIhPKH3bSJllUiCuCSUofNChzZZStc2pE23VruRgbB2j
         2A7N571MvkteEcInSr608wi32dlgJETF6IjXUlgEopWjY7BbyTEwSgXKhy83sFclcfd+
         6wdA==
X-Gm-Message-State: AOJu0YyqXzsTkbEN/zpE47nc16UXogFjLz5532Dskz1m68s2E5X1hSeb
	CPwFE7kOqzz/0eHGQZuvWczUE/Z9yASu0t5EqDJin5AmHgnWb4f2VkAJ+w+Gf9aCej5YbEXpMRD
	UNrYBZ+yriFrdyOElymvvhRhLOWmGCgK8W/mGEri1AwmtyERQO454pNLsiHuSgGVC00zo
X-Gm-Gg: AfdE7ckaorZ9OkyGu7CQd6hqhsr7rVMa4h6UGQPNihRiURlDF1514qB2lBqnBJMLiuq
	i4wwzYo5+wy7PQ7UFWee2a8NI3GVH9fRSDQcFuWTfO5ReyFwgcJQ38zLHE2dhazjbJoEShWd8gN
	1NKdTUJF+PAVlN2ZCg4niVXFHJrn7lsSNP5w5rhTvPnq11ivS+iwDxdLDr8iNnwK64TabKoFdVJ
	yi+z/WXMV4OoGZQKwDqvssn434xhggSHonWo6ZSOEjGObctyFH7QCzlogdiOZyODwl/HD2261Kp
	Rm98sBcSbZLJBw1es9fmxu6a0x9BoE5ZarW1Exefn4yIMnJVKZnuEiwva0DdQNjLcGpzRRjI7UM
	glI2BQuaWW2yS2DVP3v0ypOo6gJNuxvtqZy+EX76H
X-Received: by 2002:a17:90a:e7cd:b0:37f:464d:ea38 with SMTP id 98e67ed59e1d1-380ba70e00cmr8071256a91.0.1783055022920;
        Thu, 02 Jul 2026 22:03:42 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cd:b0:37f:464d:ea38 with SMTP id 98e67ed59e1d1-380ba70e00cmr8071215a91.0.1783055022356;
        Thu, 02 Jul 2026 22:03:42 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd2362sm16771941eec.20.2026.07.02.22.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:03:41 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: [PATCH v4 00/10] Add support for Qualcomm remoteproc subsystem
 cooling
Date: Fri, 03 Jul 2026 10:33:03 +0530
Message-Id: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIdCR2oC/22Oyw6CMBBFf4V07TR9QAuu/A/jooECjZRKC42G8
 O8WXOjCzSTn5t6TWVHQ3uiAztmKvI4mGDcmyE8Zqns1dhpMkxgxwgQRpILJGphtA7zkDSeaKkE
 USu2H1615HqbrLXFvwuz86xBHuqcfB2WSFoVkDDNZSVlyoNCpxauI764fzMWFgKdFDbWzFqeDd
 lvkX8PvF5EDAVZRxdo2rwXP/8y3bXsDcQqP+ucAAAA=
X-Change-ID: 20260609-qmi-tmd-383d30e1a60a
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783055015; l=5096;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=rVXcKV7+kz5ldKBXO/tHbbJCCqeIj4iVBlRaSUOippg=;
 b=R2N3EEztkFyImqucagAgpKp8NzRoJaFo2Sly8zMCuJ5DzVuyF7baMMSOJEkNjXzA4AoxyDzI0
 fvQigP25c7XALoF87dIZF4/9xQBqzwSOoTuPeWkBpRKZn6kC7pLZ0/f
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX8Y9WHRF5bzF3
 JeftZ9IJDMeLI28+ymz2HDgLgCU8CTU29cTrZFm1KjigNfwbctHZERCwHIfPnHZJI6tyOkniUTq
 N7e3tT2v11uLzbfLuLLTNLfrnJELasA=
X-Proofpoint-ORIG-GUID: SSyk_MdwyAVav0dqfRdDHJyIuc_fTqB6
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a4742b0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=elwFi30hILXyiLWNHsYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: SSyk_MdwyAVav0dqfRdDHJyIuc_fTqB6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX5Idv3UJkGo9E
 vfzg2bD7WC8NWVQ/oOfvjT3njzNMnTL7RRaUVJg75+YbI3G38yRoxZaclOnDCn4p0b0wiLPgZIk
 fJ1lQPrEfL6oCav9MjqDMRzVJoK2Eg3i49+UG4aG7ZSiSCiCy1uHcnJuWGATdM+wXVzPEwJOb6/
 uKKMx8JWQQclxc/pxl/IDFsiOOr+1IraGetHSqrR0cuK2GQ7yTw7o5tRsxcw4UKbU9BiXFAqu51
 KtDb6j0+kabu8N79lJqfmA84PjLEEDXpUe9KzpuZetk4hGzSM9ejsQJaHQ3aj0/cEXkO0ugBgYg
 daq0h9FTAFedMJ+rhRhmJmWdK2yF0ayGt4zCN+uzUpmR2RNblCt1aqz4RpBRVkWcOkrIk4L4mOZ
 JUB5OIyaexJf7UMmSRnd3dXctbEE6gKK6eUOHAfwvbYHjPPjAcNlFmESMjK96pGfLFSxUbcUY9c
 XI8lcosYNoaqUD3R//A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116151-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:casey.connolly@linaro.org,m:dipa.mantre@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB63C6FE908

This series introduces Qualcomm Messaging Interface based Thermal
Mitigation Device (QMI TMD) support to control thermal mitigation
on remote subsystems such as the Modem and CDSP.

The QMI TMD is an interface that instructs a remote subsystem to adjust
the performance level of the devices it manages, reducing power consumption
in response to critically low battery charge, overcurrent alerts, or
overheating conditions.

The series is organized as follows:

 - Add a shared dt-bindings header mapping TMD device indices for use
   in DT cooling-maps, ensuring a consistent binding between the thermal
   zone and the QMI TMD driver.

 - Extend the remoteproc PAS binding with the optional #cooling-cells
   property to allow remoteproc nodes to be referenced as cooling devices.

 - Add QMI TMD support in the remoteproc PAS framework, hooking into
   the probe/unregister lifecycle to register and unregister cooling
   devices with the thermal framework.

 - Enable CDSP and Modem cooling on kodiak, lemans, talos, monaco and
   hamoa platforms using the new binding.

This work revives the earlier QMI cooling series by Casey Connolly [1],
with the following key differences:
 - Uses an id based API for cooling-device binding
 - Integrates QMI TMD directly into the remoteproc PAS framework and
   hooks into the probe/unregister lifecycle.
 - Removes unused code and cleans up macro names

This series depends on cooling device id support from Daniel Lezcano [2].

 [1] https://lore.kernel.org/linux-devicetree/20230905-caleb-qmi_cooling-v1-0-5aa39d4164a7@linaro.org/
 [2] https://lore.kernel.org/all/20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com/

---
Changes in v4:
- Drop the tmd-names DT property.
- Move TMD instance id and tmd device name into PAS platform data.
- Add a shared dt-bindings header to define numeric constant for TMD id. 
- Add mutex documentation comments for get/set state callbacks.
- Link to v3: https://lore.kernel.org/r/20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com

Changes in v3:
- Removed the remoteproc-cooling abstraction approach.
- Integerated QMI TMD with remoteproc core framework.
- Cleaned the macro names and removed unused code.
- Switched to index-based thermal_of_cooling_device_register() api.
- Link to v2: https://lore.kernel.org/linux-devicetree/20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com/

Changes in v2:
- Update Remoreproc thermal config to tristate and removed unnecessary NULL checks.
- Fixed dt binding file format and added generic name support for cdsp.
- Fixed memory leak and cleaned up qmi-cooling driver file.
- Corrected DT formatting errors and commit descriptions for all targets.
- Link to v1: https://lore.kernel.org/linux-devicetree/20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com/
---

---
Casey Connolly (1):
      soc: qcom: Add QMI TMD support for remote thermal mitigation

Dipa Ramesh Mantre (1):
      arm64: dts: qcom: hamoa: Enable CDSP cooling

Gaurav Kohli (8):
      dt-bindings: firmware: qcom: tmd: add TMD device type constants
      dt-bindings: remoteproc: qcom,pas: add #cooling-cells property
      remoteproc: qcom: pas: add support for TMD thermal cooling devices
      remoteproc: qcom_q6v5_pas: enable QMI TMD cooling support
      arm64: dts: qcom: kodiak: Enable CDSP & Modem cooling
      arm64: dts: qcom: lemans: Enable CDSP cooling
      arm64: dts: qcom: talos: Enable CDSP cooling
      arm64: dts: qcom: monaco: Enable CDSP cooling

 .../bindings/remoteproc/qcom,pas-common.yaml       |  39 ++
 MAINTAINERS                                        |   7 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  63 +++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               | 134 ++++-
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 125 ++++-
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  99 ++++
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  17 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  17 +
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |  17 +
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  17 +
 .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  17 +
 .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |  16 +
 arch/arm64/boot/dts/qcom/talos.dtsi                |  19 +
 drivers/remoteproc/Kconfig                         |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c                 | 120 ++++-
 drivers/soc/qcom/Kconfig                           |  10 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/qmi_tmd.c                         | 581 +++++++++++++++++++++
 include/dt-bindings/firmware/qcom,qmi-tmd.h        |  20 +
 include/linux/soc/qcom/qmi.h                       |   1 +
 include/linux/soc/qcom/qmi_tmd.h                   |  23 +
 21 files changed, 1327 insertions(+), 17 deletions(-)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-qmi-tmd-383d30e1a60a

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>


