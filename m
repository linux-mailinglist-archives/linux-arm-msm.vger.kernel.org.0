Return-Path: <linux-arm-msm+bounces-102951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFgzJR7g3GnrXgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:22:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF093EBDA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 89B463001463
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 12:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C78E3A75AC;
	Mon, 13 Apr 2026 12:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bmsNJqHi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJ33NCZc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661933C3BF1
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082971; cv=none; b=bhO4mIO2++X6gU4L39n4RPZwFjZICnVHq9IPjEA0AoXQh8ovsBgaG6hEQrIGwGthFjq/oi68lfzb2fVo/rvvdLVP5Czlz6OhV6lJpa+YCQMdg9cSKK+IRrh3dji+mv2AJdDrk2YZS/GtaSlLGgnkv68r4AeDAUDC/pAMAXLHbDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082971; c=relaxed/simple;
	bh=3UqR7swdMvCcPHTT39/aAXx6UV8Z4Xgc3WBV8HE31ig=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eYTn7khOT+juM5XEdYRwvODrQA196A4qQQC28QdqD1OWlX+HwmFiqlK53t00cjD+ssSIKhGckTbN0fxg4t0/tlbnx+IsyUFieM8SOXLfaYoChJFWo/ShgSdBQbFovzRypItlsUVds4+o4FQTzTLNedFdPep72OraoAJ0FmpB7E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bmsNJqHi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJ33NCZc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7QGLx3709159
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XTAror31TtggiM0Bv1Rl5s0N8dZaL64hH/7
	kH3+cR98=; b=bmsNJqHiDZP6bcBr9mh43mnco/kvVy56lj7nQxz/Z3EoGZXeCBR
	HoCF2tEtu4I31yHUnOQ4gBKeRpW8ZDcF+QY17MUQM6OiAm16YcTPQfEO2WzCE5Ya
	B0j6hjbSRUmT9v75jMw5L4uF99r6KUGeZiFrpBX0ddwp38f80MfIHwD7flf3JDGC
	UU8DsUh7AEBrlsgPgs+VKgwvITJLAQC15ebt1HJIP/UBDS/pwBEvIfDtrH3LcDYD
	lPbz7KAdANECn9SDMoPASUr9KX6busTBjcXLC2WvOcYTyeWI545fvc4TqeWz3ESM
	LXWYOdsNojkivhCjeAF7ldKZyz4np5HNSOg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbpcwmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:22:49 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7985951fa83so103067947b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 05:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776082969; x=1776687769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XTAror31TtggiM0Bv1Rl5s0N8dZaL64hH/7kH3+cR98=;
        b=cJ33NCZcCnkTrtR46e+e+cEdhiID+yrs6YckXBpySsv7Eio9KUZKJ5k8laCVQsGnKY
         Q1o2KkwALwdEDaF3yGy3xNTIS1YF/LXkZn2npXG4dtFsaIQ1WQXMEggRGOSEi/GREsju
         13Rx9vDfeqpEN1FcLZdGkPezCOT7sB0oT3hM41/iR3cc0LY1O9PvwEiGzx67sJgCpIcN
         r5ppyNcARu4+BX4no9jcWZD2yaX3Y3PiKgz5+hYGEMGrvJTPl23WiX9kdeolVn8qX3To
         AhcbxTK5n79NO2lvLR436z2Q5tNLenqRCC2+x0PEmOhDBQ39mFOlY1PJNVY4pODJh7ZA
         3nHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776082969; x=1776687769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTAror31TtggiM0Bv1Rl5s0N8dZaL64hH/7kH3+cR98=;
        b=O2v417zqU9PgwuQCpyV9oeYKYQNfo3qcRmL0AfRoNBrZz3aB3EmquP+hx9FdRHP55H
         3t9SlPnVNwU4NMDPwy5esBytMMjRC+iB1epQQMJisXuR0EdgJwGyN1jUGizmXUzGHKU8
         I0agFUdI4Yib4VxuFhhNRYNR7HYRg81YDKMjo1bukvruHyqGkJUGUgd4lNwPjnXATI0u
         RtFt0vLsBi8tQRZm43zBm0E0taUGqkk6SwybD3wvHqN+fYF8jqOjI0m1X1Fr8Yt2afPq
         cCuSPpmE+0avgCL9ktAmot8zsl0EOyNXFIHv8f+qqDw++FeY/MpRMe32HSCoUhgKuxRU
         sJow==
X-Gm-Message-State: AOJu0YwFNJLU5lHb+ixPO5nVv9fxsddJHvZbLA8x4JLWoo6g8r+VKfrK
	00AHkNs63/2XqZNZfySQhPLQsn6hcV0ELZ7hGNVXv2nLBqXpLf1qpxWvHFwwYVXpYcNNsO+IajS
	E8IfSsWKzJbwhcYjGaj4NVxV19gCt5mvmSgvHnPe343op93lnccvbb482wP52XJ4Dh9mp
X-Gm-Gg: AeBDievwJI+NJqHTMqPvul9s9vtTQOBAa42GgG2Cqm+/Kh6o/DBspuoubi/CYgazihu
	O00qnI7RLX/9Y/tZn0xlg5TEloQtCsNRJyGPezmpynmUR2mMHLLjphxq6ma7u+WzEOfo9wDhtqR
	mfQZS1Ee1yyLl8dVaiUXWC7l3QprSwWRfZB5U2fZYzQ1fze3Jcxtt4ZQy5V/xmGfx5vuOvcd0I2
	lXqJyDsKtWbQIbu7AM1Af82kgf4rvVCQK/3SBYL9ayf3mfLQTM7DD5i3AUcKs3kQSItyULeAyhE
	uYl3Vh60Z5V2/pvcnqngmiI/ejApTg9rrx8cnxUnYBM87AQbQLF595hOf6J4p8UVLPdU+Ns8HQl
	vRBNzFLsYTpFiiw73JLRyJMMjIC5NFz7iyN0QC1ZzYW8diGYNTw==
X-Received: by 2002:a05:690c:6e0e:b0:7a1:6dd9:14dc with SMTP id 00721157ae682-7af6fde9b40mr143042417b3.17.1776082968589;
        Mon, 13 Apr 2026 05:22:48 -0700 (PDT)
X-Received: by 2002:a05:690c:6e0e:b0:7a1:6dd9:14dc with SMTP id 00721157ae682-7af6fde9b40mr143042057b3.17.1776082968053;
        Mon, 13 Apr 2026 05:22:48 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7af400eb1fasm50781657b3.44.2026.04.13.05.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:22:47 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: [PATCH v1 0/3] pinctrl: qcom: lpass-lpi: PM clock framework cleanup and fixes
Date: Mon, 13 Apr 2026 17:52:30 +0530
Message-Id: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dce019 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=UNhQibLAgM_7-mQvFMwA:9
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: ZwfjquJ6d14BRTQ0dIORwtTUpZtLqxY6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyMiBTYWx0ZWRfXy+5Z6I2Z8ghk
 wARYxd9dDOZrBljlvVWoSw8qVNO3QELHSPzNjNSGUArii9zyLg+16aL76uClNn0VChdG9+Vs0pR
 Jksqyegz++93iKLMkA6H46tfb1IdFHY4AlBiSyR84Gts+KbDV0GBlOY64981akeEyXDEuGPDOs+
 SlwjUlWLRdcq1FCtFeSqd/J+IuTGQMCyKRCPvpymi+xw2l/b8bt/Qa0KwR/eQPR5TFSVvzzPtT7
 RNVot2c2GVQk1c3oi54LvBDLHkh7kjCAO4XtzVpDQ+X/a+CIFppL9NjdXiCCDYVF52qlaA1vRVA
 pffGmTKlMSbmnrIH5kdpeA/toxrW5Wwx86QnsQH3gsDSTnr3bX+duQ+RphHL53rh8pVLqHLs6fz
 LDhLuqgGc0VaODr2o43W3qkQQJ1n3OAdPnXwgLknlrXe6Yqq555WcFcNyDvEDL4SmABVFMTr1ZP
 /zzYS7Xa0UyHKVwH8DQ==
X-Proofpoint-GUID: ZwfjquJ6d14BRTQ0dIORwtTUpZtLqxY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130122
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102951-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2BF093EBDA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series updates the Qualcomm LPASS LPI pinctrl driver to use the
generic PM clock framework and fixes clock handling around GPIO register
access.

The changes ensure clocks are resumed before register access and
properly suspended afterward, avoiding unsafe register reads when the
device is runtime suspended.

Ajay Kumar Nandam (3):
  pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM
  pinctrl: qcom: lpass-lpi: Fix GPIO register access helper return types
  pinctrl: qcom: lpass-lpi: Resume clocks for GPIO access

 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 120 +++++++++++++-----
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h      |   2 +
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |   5 +
 3 files changed, 97 insertions(+), 30 deletions(-)


base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
-- 
2.34.1


