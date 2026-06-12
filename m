Return-Path: <linux-arm-msm+bounces-112911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6SI8C97RK2q4FgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:31:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF9D6784DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:31:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="TtFz/sja";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FIoMUkGh;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112911-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112911-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58EE234B985F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE4F36AB4D;
	Fri, 12 Jun 2026 09:26:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536C7335555
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:25:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256365; cv=none; b=oYsF2Bp4lmxXOlxeB3Yio6DaiKPl9Cp7fkd1DvdFRLDVb1kTlw6NJIT/DRtPWNJhjZcsLpUV2eFr86FVN3lxcEzvdXpAk2ZLANwKcXytkHkru2eoyLzLU3C0QuB6JVVjxf3Rigsf69Gwb50bC4Vb4mjgEONdo3PND1byi+5edo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256365; c=relaxed/simple;
	bh=8QoTp3WESlHjz0HtjADLefp60LQ9X+szvJ8mIzieMHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tdmhDHHADM2ZevSnVFvLwdgIW7TaBmIBe+MlQN9tjvPjX5EmbDs0UPvjpoQEyBkbqqYH7/p3PZIHvCxQoEqttf891XpDittQ1VJKTk9H3jttjgN23N/Ir/MaSosmZALcxNj/d/enCIcrZCbGlgUHWJAd5JNjOGkRTixl7ASWp0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtFz/sja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FIoMUkGh; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3C3vZ2506361
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kHsj9KW0wACdSEHR+duy/C4FIe+uMWCS7zjU8xpxO8E=; b=TtFz/sjaRLim639B
	wxn1Xao0kJok9evbr2IrT6hWwQ8NDtY/korSWSGUZqFKpDHLVXD/55zcxWawqQ2B
	PhJqJ9u9vJM63pFq2mkfEkm+AuCaxDqvd8lzhmQhdg8aVWygIWKLbluuKrMo4t1t
	dm2frt0yWCgwtW+NCabHqEIvEhTlz6SPRmtg48FvrINS9Sf98Ol+WeeYS6+e5cRe
	PAhu4BG+P778/5knDIRdddIDboCV2JAmPXD7yEAVPL9Svy3VoGE+lE+KSKlNoDEK
	7LStQUzzprAFWe0S3Q6lMRapvEA9qOwMUa4ANEu8qp+ggugXl3pVI2mxVN+hBj50
	I7TriQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbjv5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:25:57 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6ee0bfb5681so804552137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 02:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256357; x=1781861157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHsj9KW0wACdSEHR+duy/C4FIe+uMWCS7zjU8xpxO8E=;
        b=FIoMUkGhXbV2f2kFuIP1jWiZWnETQvC99W5jjBp/fT/HBbilrG9KiUp7GIxi8WSbWY
         nyB/BAQO2ujnFWXXOAfevqel8dqiiVbylDtFjTBdt5x8S+0e09nhloEJuqJvSTb1NZwc
         7vzaii4zwlgKK7F6h4RKGXSU1SBN2/q8CoGWbMR/ThKb+/KhhQfRiJcbeCUk3Mcl1xR6
         OGC9y1sRrSoJHdwZFdl5YXFypRRka1hFulSFNi35QMbRvio8lcioDJzM/BxBGt5+pVQK
         3DAFfJRF4nXxAQjWx0E/kpGgXqACONOHx8N5OoURFRJGMjJAagt3HUTfXJ0Rgho2dri0
         ZHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256357; x=1781861157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kHsj9KW0wACdSEHR+duy/C4FIe+uMWCS7zjU8xpxO8E=;
        b=r3FdlHqOhbgFec34msNTXIfeiBe5q7d6Xuep1U1JNUiMk1+8qOZbBC5bMWtcc39gkC
         JhXOLBfpKXJGYLMSZ9QgWnMi4u3DCLw3MLUfczGeo1BFX7BKRbqca6tPYGC1yai/4tcP
         RRM4kKyjzrKJc5C4FNfFcpb6PJ9asBqz9O6gpCJ1xBrcYFNjVguR8S0gf5sMevQRP43x
         Cd5DVjSStgBN//ufid7x6mMQIj+7RC7AN98+T5JI2T0UfZd8V9QWRMrkoP3OuYYIydN2
         LLW5JirRLHeb+zz2P3J2M2DFg5ZGOuISlGjl3l3y1vVdtQipRoqf3p4+PBM7xE9MoyMR
         Fqaw==
X-Forwarded-Encrypted: i=1; AFNElJ8Kx2R6eKs8/1JzOfajRB/WYpkG0NbwN/Trd604bdAh5A8WR6C5A8yv6wtcgi5+B8dHAnFfipIWHjlWZKvO@vger.kernel.org
X-Gm-Message-State: AOJu0YzB5YwkGrf6qenr+arvy5zkrzlaatHyxDKe2WtdobslqNxT1QNN
	r09oI+69BumsHU2XN1mBvzSw8MyHvi6dhR8CKth23bO27/V7OCYkr2YglejDJUTo5UBo8GZilKG
	KOQkLMFfjwS0hMiFRvBONEUk/HjLsWVFUhQNY3rPQE3nQTOGjikPtHkkoCvU2dabcsHk6
X-Gm-Gg: Acq92OGrkgE3MUaDJSObv44XPHFO/OSY9CsYdPR/Zmm8/cKpAs0+y9NnJSnyUB1fZTL
	asOVFHgOJhin9WwaYedbsaXShnZIPDw8UNihrR2LF/Odt8dNPbv9dRhX0u0qfATfskc7lM6SMLd
	LCTMjw4JqNpf03r/966/gtwQObqY0qyFV6yF4cYuTdHW+TmJJrhK3zCIUR+++DVhPumbAFcexup
	KAz8gEELmqCvIq5I84Pndcc7GcqMivgcivpyUltGF9f299jYso6QVxElctJ6UbikEce42Jw+tXh
	15Y6v1+LfoJT3RPi1AAI/EtZ5xl5dURTketCr+WVq7aPZmVRKus2sSRYxa2okRP6GDMbTiYEbBK
	aZq+ZppeM/hIFoRn3aquJKvQv6KM3LNmYci1M849VnBuV2Aopqk26bAWDYOyUUl2tRn+bYKvCMq
	YzFWkGdiDEDPfY0k0VhWq4rFckHuJ0/cjr9rI=
X-Received: by 2002:a05:6102:3582:b0:62f:2d6f:cc11 with SMTP id ada2fe7eead31-71e88ad70f7mr1009439137.2.1781256356860;
        Fri, 12 Jun 2026 02:25:56 -0700 (PDT)
X-Received: by 2002:a05:6102:3582:b0:62f:2d6f:cc11 with SMTP id ada2fe7eead31-71e88ad70f7mr1009423137.2.1781256356431;
        Fri, 12 Jun 2026 02:25:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:38 +0300
Subject: [PATCH v4 06/16] media: iris: Add platform data field for watchdog
 interrupt mask
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-6-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6463;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HyLhNzDH8iJsyixGhN+Kz8MQMgeK/r9IohhV2Hc9QBQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CPdiJbGDuZkFtSOHtqO/38H8WydEO5oTzYT
 7dft4b/f4GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQjwAKCRCLPIo+Aiko
 1Q+DB/9jUdGAMVnY8RXQo31nk/YZKbOISV9ExV9pQXneN9ZIv5OU2dfK3NL08RW2orVz2KcWO3F
 xuqUCOSq5uX+JSa+12UBz48Vau69g6GnOIdGXahnxN+r3/1Mjc5ZWXX8zhTOp39IWV8zQZNSWjX
 s0bUQ7pX79TMEIbsml/Q3o7cSB7wapPqUSn8rd7i0i23ygKoagZH8VjePnM+gMGML1QGKgkm+8w
 13caPGXE0ustdF9kfJJk1GRo/Lwcu8r3p4jgYlJF6wC+sBmN6/9nRJJuCIqL20TxUnALi1ZtEhZ
 /3H1he4DOefV7DrkUo/P7WdGUxgz4pOOT08aBbE4owZJjjsm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: x_Eg_hG4ySYAdGQjpAXi_4qlxKLotdgR
X-Proofpoint-ORIG-GUID: x_Eg_hG4ySYAdGQjpAXi_4qlxKLotdgR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX7p0jPdA0/6w+
 z8P8cX7Hkyzg/k4Oq/k4WwVEFMiaMSh9crz7DKaiWdo/NShoRH6+EwcNodNMyOwPZ/T25+bb4Cc
 rVs5DKb1asRCvi4xC74AOgpq1vCZRt4=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2bd0a5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=kEHwHBA7O1j3tG1WbfwA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX5PUCV6kl7YF5
 Vi3iQ5pbd+xtqdZG4D3dCR+oXkRbO5rHkm/0yYsTR07pkZIkYCzb/uVEHii58UqcPJBFCqVv45V
 TTx45/i+FDNZatks/AU1TWefNIJNfS0PE80ZcV/AHyIfni0qQzh1NM3/fJJIPXjRcc7uQrX1zf3
 LSfa6gbLc47kWo4mILOJPj4JiODDOBP+njWhuMClfT0kC3XmrnSgjjjJybDfLQIUoh1SJGQKQY1
 upqatwS6RvCpz8b4RWBy/ssEZliKbqpR9RxlkhRtt7QvF9NKnzaWQWPEZffvbk2GVN24+MKb1KR
 FjDQvBan4MPWe76uwQ20UA6E38Iwuod2GrC0ldAEs6J+vzF2PVy2GOIhZUUpR1Xl7JxpzTQABiy
 AG+HT9BMa6hJXzHYIGstjNMYtzC4jim2i5NLveEImINk2J0lT52bRuP/MMs7LZT1cl33UC7qadD
 W5sTsklog9mmdgUcXng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112911-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DF9D6784DE

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

For AR50LT core, the value of WRAPPER_INTR_STATUS_A2HWD_BMASK differs
from the currently supported VPUs. In preparation for adding AR50LT
support in subsequent patches, introduce a platform data field,
wd_intr_mask, to capture the watchdog interrupt bitmask per platform.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h      | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c        | 4 ++++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c       | 6 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 8 +++++---
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 -
 5 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 55a4fa356985..81fcb2854772 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -315,6 +315,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	u32 wd_intr_mask;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 961dce2e6aa9..eeef453c583f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -16,6 +16,8 @@
 #include "iris_platform_sc7280.h"
 #include "iris_platform_sm8250.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -94,6 +96,7 @@ const struct iris_platform_data sc7280_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 1,
 	.no_aon = true,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -124,6 +127,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data = tz_cp_config_vpu2,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 74626b35d9cb..261db38a013b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -18,6 +18,8 @@
 #include "iris_platform_sm8750.h"
 #include "iris_platform_x1p42100.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -113,6 +115,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -142,6 +145,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -179,6 +183,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -208,6 +213,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 375bcd923476..41498f94480e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -109,11 +109,11 @@ void iris_vpu_raise_interrupt(struct iris_core *core)
 
 void iris_vpu_clear_interrupt(struct iris_core *core)
 {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
 	u32 intr_status, mask;
 
 	intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
-	mask = (WRAPPER_INTR_STATUS_A2H_BMSK |
-		WRAPPER_INTR_STATUS_A2HWD_BMSK |
+	mask = (WRAPPER_INTR_STATUS_A2H_BMSK | wd_intr_mask |
 		CTRL_INIT_IDLE_MSG_BMSK);
 
 	if (intr_status & mask)
@@ -124,7 +124,9 @@ void iris_vpu_clear_interrupt(struct iris_core *core)
 
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status)
 {
-	if (intr_status & WRAPPER_INTR_STATUS_A2HWD_BMSK) {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
+
+	if (intr_status & wd_intr_mask) {
 		dev_err(core->dev, "received watchdog interrupt\n");
 		return -ETIME;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 72168b9ffa73..4fffa094c52f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -41,7 +41,6 @@
 #define MSK_CORE_POWER_ON			BIT(1)
 
 #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
-#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
 #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
 
 #define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)

-- 
2.47.3


