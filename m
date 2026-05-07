Return-Path: <linux-arm-msm+bounces-106262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4B4NIcQ0/Gk2MwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:44:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA1A4E3A03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43246303DAD3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C3D2BE026;
	Thu,  7 May 2026 06:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NyvzPLMi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dUX6Hakf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDEC33F5B5
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136142; cv=none; b=AOUul5266lQjKSHzyQ5dFM6HWH4/1DLsPsHIXQHMotp4TUxMhydF9jAjuSY3IupdrHlBgEDVPLUW7kCTKLzB33oHrHpTEzqZCz0jVe4sNcRGmYLhn61ANyVZmCKxetqh2PWIY/cpppp3XBYT+HtaBl7fUQGu20Oz4oKtOQXg0LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136142; c=relaxed/simple;
	bh=coVjg88BpVVzIxncaZzLG0g/mxYBRVsGnjNNsfMl5I8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fwZPFG6UKgK3DfxVfEEzLqVI19YKMSmHab+M5J9jO27poIjAh4GM1TZ7lELtZG2b51ghWmUIMLRXkn48ym49pZmLfbl++CnKa1U/wY9K7qCSrCy6rcDpdOOy1bbvHjg06YzZ11bRUdKtxD72i9t+HV5aqB8dAQWOyDJPax2B/tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NyvzPLMi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dUX6Hakf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64744A5f151147
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	72FCffrovM5qoqfYzfgTQu0WKk0ryn3kQM9UYoEJSWo=; b=NyvzPLMiznBco5Qv
	edkJmlgk4mBJeXA7qmdf/cqIW2pzJ0J2OWAenUzrlPsm/gvdn/1Syj9rABs0jsAK
	FKtfeD4iJSDGDGYXe8YuswpQHoFRz9B4WNLWuizKbtHs7LrX9K1IddHv0kEqqcGy
	X8SsMcEyCfme6rhCFCjJprWYHuLHtUa5lecxFF9buWRKVL9sXKpKlz0L2HPmqadg
	SGDFASu4XyfUc2LsfvVLmouYTnxuH+eSSktG803HLPXKM8E6q8mo6205zNFkEMyg
	he6MygZPQmFprMd69lYB7+G3YLetFiCPl116k2yJwJoFyYB6F3+Uj/rzNnvACNSF
	RlFgYA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctrgdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:42:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51306c1076dso13271651cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136138; x=1778740938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72FCffrovM5qoqfYzfgTQu0WKk0ryn3kQM9UYoEJSWo=;
        b=dUX6HakfNm82lwfOUADGpiMO6xTuZa55WC/wZ3VwI13zJO+upQAXu0A4WREiB7Yqjz
         cpKUW/8aVIdsPhHhntdJQhpmoRXHfS6MNzin+E6Gx4AMVh7oljZ0Y6D04KqqxEJOXEWu
         e0aKEVvyuhF5c1DAmYyb4ce+Rs9uO7jmIHvZ/t2dCuF7K2LcASe7g/556R6OyQPm9QlB
         LmQ/N2rKfhoJdrpg7tNuO/r1OlJrkhWGkEYuALtCyDHK9lLBNWcIq+lXMO0JKDGp2Bsj
         XJEjXsJOyi0xFtSqeXVX2icmAgZdB9fj0D3s2Jc3s9fxUrgq/RdTCBBuQWni3JGNJYtK
         szGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136138; x=1778740938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=72FCffrovM5qoqfYzfgTQu0WKk0ryn3kQM9UYoEJSWo=;
        b=QZ28k52VswyHY3UMz2UjHn6zDhME8AJhPiZD8OteBS5z9cybE7/EKDgEd1K1K3X6B/
         EtdMOpmGjmEZ/rnkschhUPwkgac2KyE3VynVp7xoXfx6JZ4vrq4xu5dvfeQs6vwQ6pxV
         8SJZmZUJ0vv9TaNQCC2D7iui2atL+NW8or/fQBS3MSy18wWV8OJ4brwI2ej7gManjgJo
         FKU7z4EiNCrGU9Wc2THRrw+F8YhCLe7rNMClWxzT/yBDHUycOsmhZPQCXX2/jzMaIjBQ
         d5Bems4U94C7MjAe4fONX3zwsE3ilpF/ENJ1uNYotCJCQsw/ScH1+FpXqgdLqQ5SDB+b
         fHXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KhL4rFc+syhPlQLWtHm4pyJ0NxNiogTLkowDKed66t+O9JfvVfEd0RaPthk14kYkjCof8yVfDGWnBnVsh@vger.kernel.org
X-Gm-Message-State: AOJu0YxhP7djnBO5qxkbdR9/La675RH3iFBx7xaZpJUdE6LOwUZYfPiT
	W51GbQLUEuy4eSTAzkbmOax2Hg9L2x22fxIQJEzWy7ReJyCtoVmFYRGnNVGNVrhBv+cPvnVMCoQ
	DwxvoRcuylTQymVuCqZLNhXH8JdfK5L73c1niFtXYAU8t2M7T1DX82qDzyOtFVcGsqHRSPEG95Q
	2+
X-Gm-Gg: AeBDiesPrEAJ4pE7Sq+ZD0fusBIoXHV5uoSVkdkreOxKyeWGZmG0iF30a0IBc4VRq/c
	Ey/ew9JLCe7QmzH520Td/L7CWpI5fwYzZHjnHXj2CYO8GaPxcmZ3mG8TJr1rCJNTHCqi4xz2XPm
	V1gqfF/rtQCYsisBBLhUkHs1yGaWi8cI/aOHqpYmOaAZg+y99PqGcyvDOmZNNw5ZtnQUnGxQ+YY
	2dOBIZLHBCKVmEK+rnZbmvH4t9eJgDoR7w02SN1L0YCh/uWWnPCmIG1Y58zMAI/wTmzqfl18Np1
	pRXuhjP4B6T8sJwkZbJOMoM9UA726gp3uw25jPXPxcSQcs+JKVEGIAb4RtpBKLH30VpWo7FZpfi
	pdrxHxQjsTf43ASq9WV1yMIb9B+FiKzo+9U0RUpfEHOizRk9gDwkshvWdip7WJ7naPXC5nNCKVm
	Khalad8EnlTyD1bXv89S3AqSKkUWF4vjSaVM4TkqEctcmEqA==
X-Received: by 2002:a05:622a:647:b0:50d:71aa:6b67 with SMTP id d75a77b69052e-514621d15e1mr92134481cf.53.1778136137929;
        Wed, 06 May 2026 23:42:17 -0700 (PDT)
X-Received: by 2002:a05:622a:647:b0:50d:71aa:6b67 with SMTP id d75a77b69052e-514621d15e1mr92134091cf.53.1778136137385;
        Wed, 06 May 2026 23:42:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:02 +0300
Subject: [PATCH 02/16] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-2-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4413;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=l7we/4v2r0lTXTULk2MQKkzGpBMGA2OLuGGhvYxgzOM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ936Wpyvsdx9AspG9AitCcbV0Q35E2ar46J
 YsRzVNM5i6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PQAKCRCLPIo+Aiko
 1TDyB/9DDOhRfzzww4R1R8G1YkrfeOYlqHS9zNDuMF3FCIAfwjqxvPV67DRibXuFaPeLdbzIJ7+
 Brom/ZxpQZ1lJ7FTieK+eV5BGsD2ecxh/1UqcQh8xCeAn8+shg6cu1jsrbk3qzzs40wICeVeme0
 que/ZpLrBxUAv81KNq5U2XwqNu2Ewlfc+GGUpVeRKTv2qFXO++GbPv7lL1nNXkKBnpZ8/cR8R5m
 OaKjQC25ksbPdGjeMnyF/vnGDPu7M+H6a4CVwqZmWxNBXOCrQmz4Sxsy97qyPOcfXO6YlU0gDVQ
 AS252WkO8qIvR9vregYlDHfqOTBDEVGnQ1eqDK8d48XtEzXU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc344b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=HWmRtQhKy1KQUjwlQEkA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 5gxQJT4n047hkKCaZGbT1NWBq9i_mvug
X-Proofpoint-ORIG-GUID: 5gxQJT4n047hkKCaZGbT1NWBq9i_mvug
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX1H/FCA4IVuwk
 4R9RKlW0KeGLyEzGhaZTk+YySO1JOmfQHrgq5GOcaSkgfYIClgq1nL3yiaVWrmceoHTbvB3Ol0x
 uN7xqBs7+GxKNElsBRr0a8t5OnyVQ7JPt2WykbjXifQFinNDS9ktQsrusSIWzx3g4mJZXu+oiNC
 bm/hdIoHkvRaXs2zpW/GrdZVcFlLQzgZXdjtADpTVhkt9gBrCcmlMCUcMIukHqdXtG4oTCK43+8
 hffBC9B2I+p47iJssLydctdlMj06m/zSNL6fFPCRA4QxVF7H1P5ASG9Q7LRWC4oXD5oQxmo0IhH
 rqRdpIqL64SMhGpCtbgPdtMY5dyD7o7mKE5BwOQXdYnsgvivnrW7izWVWBBi+DvuMQ4E2qBXGiW
 Vdn4wtwfrlbLb5Rg5QD1Uu4RPhf7EKSt0I9i0FjocJwG0l8BktesU58lcpUzUmsEJTJI9NDY3Fw
 r8p5+eqUOcE61tRiZRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070063
X-Rspamd-Queue-Id: DFA1A4E3A03
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-106262-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The raw formats supported by Iris were previously advertised
unconditionally, assuming UBWC support on all platforms. However, some
platforms do not support UBWC which results in incorrect format
capability exposure.

Use the UBWC configuration provided by the platform to dynamically
filter raw formats at runtime. If UBWC is not supported, UBWC-based
formats are omitted from the advertised capability list, while linear
formats remain available.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 9 +++++++++
 drivers/media/platform/qcom/iris/iris_venc.c | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index ff8d664558af..bd44e6437480 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -74,6 +75,7 @@ static const u32 iris_vdec_formats_cap[] = {
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -85,6 +87,9 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_vdec_formats_cap;
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	default:
 		return false;
@@ -100,6 +105,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -111,6 +117,9 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_vdec_formats_cap;
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	default:
 		return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 2398992d0596..c41f4103ccc3 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -97,6 +98,7 @@ static const u32 iris_venc_formats_out[] = {
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -104,6 +106,9 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
 		size = ARRAY_SIZE(iris_venc_formats_out);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;
@@ -123,6 +128,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -130,6 +136,9 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
 		size = ARRAY_SIZE(iris_venc_formats_out);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;

-- 
2.47.3


