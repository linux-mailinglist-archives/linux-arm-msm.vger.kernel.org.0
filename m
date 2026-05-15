Return-Path: <linux-arm-msm+bounces-107875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPyGIxQNB2p0rAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:09:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5C154F2ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26C7730E6F65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1763C48A2CB;
	Fri, 15 May 2026 11:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfHhh1Jj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QRwv7811"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C79E47ECE3
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845707; cv=none; b=se+vaYiS3c2THJuK3y5xVmnEvZLGvukG5L2CFMjH/P+lhvtvOq3t/yb+H1HOXWwZVJTF3mF9FOhh73oRwaZSWlheXfV5sH25IKTv26lZDEGL+uHirpg3ysJ7Qu09eJq+dpXFCKojIu1H/+dqlms3KaACzGSL/IBineEGSf5/K3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845707; c=relaxed/simple;
	bh=H5gjTCkahlz2x03Clh/PysKqV1bvgbU9MHDzqSGjKm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QOfaUlcdDL57UTDEYrgSAcKeWnTrtaaAXzh87/Gpto8Tq2eOZuPnJoAB7xSQ+2yaCPPSpUM685aAutmilELge0OLRlARBUvIAEvO2hrSD1+CLgtQFuVVF/Jf6kJ1PrOu1+ZEydUmxoz0YAMDcZtTyOJBs+KOudBA9pxTV0YPqMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfHhh1Jj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRwv7811; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAt0Ec1847947
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=; b=kfHhh1JjbyhqqyxE
	J3y8s8hxF/o3wnr1p++SDbYzh+/yaK5OOpOXjxzjKXuuanffTPNAl1NUvlErNyx5
	z4SBZodGXgR/CoV+GxSWn7A2R1rVdBk8Oq/f8Q0cw9LWRVONx2KjSr6AkM9kaqP9
	KVxtkWIkHqGUCdEmtsWTdF2mIlyUQauD9VbS7apr/NdlvLQM3eijgpTAUaNUytSw
	fZoA4bYd6/2dKzlopkD+hUqfzFhxwHw4Xcx4k7jffefhtpOJAOTRMlQTs1h5NQz6
	5C6I9bv8UGCW3ULrx9YK61OodJ+c0hEnDQBoe1CgQRX1vDclRaM8I12SxJ9Kt/ua
	zFLQdw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t32dj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:48:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fbc70cfbdso219427621cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845698; x=1779450498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=QRwv7811J5Ce2gWxqwj++K8tNKVFm0J+CB+zYeLR4kajSsXtmIkaTt8fV8Dc0eZtMB
         tCP84k+24Y51N72L/y3HR3X0dWUgCS8SOkm21G0kK3BlEnZ/BJWIywyIOrnd1h82MEGd
         Ucnyc+Me54xHcGmrmVncGkYCtwy41hYIwbzgozcFbI7rdJ0Kmg+NkohnCnRYWWwpFjCa
         HwDZ64v4TU/goLpTG1SqY/vevKDZDcaxn4I5uvmClOSwNFL/HlmovljJR00TgLGJPsTI
         K9hCwXWN9vSJRMEjKXYXHhcTi42c1OMUpNDkOw6uWANO8Zn1j1VlDZN7QTAHAh83TvcL
         WTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845698; x=1779450498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=S9iFl5X//x54Mt+o7MESc0Vl2HrShapi42p4yBH8ARhHZ35TNGdLlkx9PO7EowVs1I
         yGEpi/F9bN0Jeis18GRp1Vhu3Ba2eN3FazXj5DHt5JjGZW2upLsJpmLm0oY5aftPs88c
         zKd6j6k7KhOPlBNUABoJkzoL8Oyi5tAAxnjvtsvOhPTG8yaAWZhuCXAVMYVGzDcyBrux
         b/fTKjAuowQqggLJO76Bn63JJhwqzMBnOTt13uYhaEvyfk5MrG44xjRYB7XZhimkUSje
         uKhGwWrsmF13MOOvVeXlDHHyg72W3OmMfxrNWCjo9er7wmcMm3JPoh7pC/ITvx6n5uEW
         42Ag==
X-Forwarded-Encrypted: i=1; AFNElJ8RyueXHnCD/JOy9ITeiTr4WO9sYaqZAOiK94yeJe5zq16kPWdriHAZLrNUGyDQ8X5YBcaALmDgIFA3VeVB@vger.kernel.org
X-Gm-Message-State: AOJu0YzujUcLqTrbhVuFnkZ4HfUWUdzNLNGM+FYaPYujCz12k7xs/3ay
	YCxUTQ5BDVf4/RO+YqAFSR87L0Kaqa6YQboygStj2if7Csx6KV33q2Ki2kWnmvh+bh+vComHD9H
	M4zH8TA4Au7NIULIzZZ0G2zKsgBWBg4G1QbcLTvcHIRF39gk4ZHXYaQpeI0/xeJpmEkdY
X-Gm-Gg: Acq92OHYamXe3Hlp7FypP8kjCAHJrrIGrxI0cajPZjBa5W1JNPadxX76eo26OtvLc+o
	Ko3VMjDBYscx/ovn3fB7vOhIsQx+C0S4ffK9tfUPuV5mMCVmLQC9M/vWMG5veo6pjuyOfQidr0H
	gBOFs6bZzRhSaDkUUaaxjT8AghvJF2dVrFqCK+Ic7mL3I7CxjB5JOwXoCd1EwDdQV8rNGC1MZIY
	G9FK9s+vV8Rubrto4Ncrl7Um3YUyy6+FDMWWzyD0MR9wHfKLsacz1de5waOL6jyCnD5NTvH01L+
	ibKwQKwxjVjZ4tuVPcV8RCR1m21CHVGhYGu2hiTYUgQn/OvxmFuwd6czlK7At1ioM/dUNC4Y9aN
	FGUtJkjRXYJl5V9v+VI5i5xlg9fxEPJicWNigOC0HB9fU2MKGkJVILQe3xVdoTgCrhv5vBMUvBE
	+qsJ8hnyxRtRTC1bHRvQHa0C9a7C+tZHGQ8mE=
X-Received: by 2002:ac8:7d0c:0:b0:50d:7cd4:4a6d with SMTP id d75a77b69052e-5165a22c1aemr44326471cf.49.1778845698440;
        Fri, 15 May 2026 04:48:18 -0700 (PDT)
X-Received: by 2002:ac8:7d0c:0:b0:50d:7cd4:4a6d with SMTP id d75a77b69052e-5165a22c1aemr44325911cf.49.1778845697887;
        Fri, 15 May 2026 04:48:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:04 +0300
Subject: [PATCH v3 05/16] media: iris: add vpu op hook to disable ARP
 buffer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-5-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3064;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1XoxNMQkIKQIwreQUtjXXBpaKx8sVaEKHYTsCNEF0Ak=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf0vjk6YO4TwvjY68+1/w5EBPeAI2SLFzuAc
 iDZmqPYb+eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9AAKCRCLPIo+Aiko
 1TyWCAClFlyaXfpWYPebKJ+saiHVwdfm+m5VggAzFLAPMm9f2svECaINvdl2p514KGKrBkuQnAW
 LNLdwZc4BVzdvYZMfKpq5HWfFlkZfI9okrDokyxpCHq0tRr9NrkZFxRu+xkD3jdKcTQs+NvmH1n
 CPilCxTqj0ABQcRLFxnwq5JdArGQIhyzN6vU3gNhQA/+xX6XbGCJunZAG+VO12KiO8uIBBj63EW
 SArvuTdKokFU/Q3cJEz/hDhu5omwmw28qOmlSOoNZMXREUTqQ1GrWNgXMKaMHH5+LEG1GQOjwyG
 4yWcYOSr082e/sCycyMEEJ0MR5+anHuTZLKnzFa1VKpE6nZz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a070803 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=vdBeo_PM3xCM7oyOFJQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfXw2LaloBGgVAO
 F4BR4viigFfpZL+qFTeh9vN/kJTarLcduXo211pa3+8bEC2gqMA4U3gFw16WZ2F/lMwfamIjL0X
 rSAVZNRTme1L4FNoQbg++YQfO7q5wh2KRDH+Ex0JXF92oCWAg3IjO3pJyBOOAc5Wj+TFuzjk/+5
 TKfxzJziY38MgpHh2r7FTHpDoSFlhAen9mZQ9d1l31wOZGOS/FfgIgm4EmAPiP1Imx0ZEfEVnii
 8ajzLoi4/+PGeH5TmSO/e8nOWUB/UwIOl9Nmb/PX+McCTQYgAjLNBGG6L4rYHNBEyggyIIYND3s
 7YRqtc+tDxWr7weA9TLS3XM1lxW7z1mNhNMjIE0HIOEdF3OJnlhJ2HrXt0473y8an0HtKWGMndt
 mWkpe5uSM5nFOCHddEvicJvQEz7jp6q+kBCUsigK6lMBFuc0IoOOHeuTN1NM+Fx2rdKFVANSFUC
 u3amY4l5xVAoCp7AW9A==
X-Proofpoint-ORIG-GUID: 7B3dDAUHltSO88MvMpRyZ5bCJSgImN4o
X-Proofpoint-GUID: 7B3dDAUHltSO88MvMpRyZ5bCJSgImN4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150119
X-Rspamd-Queue-Id: 2F5C154F2ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107875-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

On AR50LT platforms AbsolutelyPerfectRouting (ARP) needs to be disabled
so firmware can configure the ARP internal buffer as non-secure for
encoder usage. In preparation of adding support for AR50LT platforms,
add an optional disable_arp callback to the VPU ops and invoke it from
core init and resume paths.

No functional change for existing platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       | 4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 4 ++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 52bf56e517f9..bd22076f3557 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -45,6 +45,7 @@ static int iris_wait_for_system_response(struct iris_core *core)
 
 int iris_core_init(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	int ret;
 
 	mutex_lock(&core->lock);
@@ -78,6 +79,9 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	core->iris_firmware_data->init_hfi_ops(core);
 
 	ret = iris_hfi_core_init(core);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 8769ec61f117..8f04f3793d9a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -144,6 +144,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
 
 int iris_hfi_pm_resume(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	const struct iris_hfi_sys_ops *ops = core->hfi_sys_ops;
 	int ret;
 
@@ -163,6 +164,9 @@ int iris_hfi_pm_resume(struct iris_core *core)
 	if (ret)
 		goto err_suspend_hw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	ret = ops->sys_interframe_powercollapse(core);
 	if (ret)
 		goto err_suspend_hw;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 9151545065cd..71d96921ed37 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -24,6 +24,7 @@ struct vpu_ops {
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
 	void (*interrupt_init)(struct iris_core *core);
+	void (*disable_arp)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3


