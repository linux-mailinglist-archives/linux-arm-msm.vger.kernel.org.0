Return-Path: <linux-arm-msm+bounces-85012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E31CB54E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 10:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8452430213E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 09:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC05F2F618C;
	Thu, 11 Dec 2025 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PITZM+fb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T6YQ/r8/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F86A2F6183
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765443782; cv=none; b=B7G9qB9nY+0hjnECAJvkURl78TpNC2b24wkIRgYD8d6mvLh6BOpErp7RyfMH7MA/xF8L3qiBCwh971Hiv22ewMxtq+FeQ8S8vFxIyQg8D9bX8kNLmJimOUKMsUdYw1R0RAwxODa2iom7AVi3E+SkTQyO6I3URk69efuBz297nDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765443782; c=relaxed/simple;
	bh=LC6+YJ+r4Oa4PWxB06n5WJfG0upbybA1CX3fP7BHWJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=unuktjY08XWQxbR7/1Bgd3kxzxEI9Ck0lq8J02xjabTeJmLfqXYoJQZPIVSlcGzUyKuuI/a1s+t0de3lbwEkjp3CRBGaCCsa28v4OKuk0XcwZiE6wf0MPwh63sSyt49mFyb6CKUiYhVxxbViHExzFJSAhVxj6608wtdf0xrNkRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PITZM+fb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T6YQ/r8/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB8gZbF685377
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 09:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+NgoTJmSdoAfs6QQOK57IwUDwNIJjJ23MvoLDcN9wIM=; b=PITZM+fbzzYAgRQV
	gMkpjWAjnJrz9vo3jNp9vuqZqeNzbBuYx8aDainS3XlwRWMMW4t/FPLanC0/HMjJ
	UrBmYBeM5O7ShRtEjBY/vrdYxI4k7aZonixL0mx7xszzLrHxmWzRWbkSu/eSOIFW
	HJzKevQdY+WwfJK2LVldE5C5t7O84qokiDOnR0ZtuD3doXX784X3yAIRXG166rdd
	46cWbnf6Bh4lkPWKrp7TtGW7uJAkU03npFSJViZDntyJktV2fG2qd/3++RnyiOS9
	eOfU+irKSK7R+1XVEcor6Vl2X0yH0RmGmnBtwFTnUKH8jNZb6GxIwW3ZNCmZFd4R
	RRizFw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aym5817mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 09:02:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so830012a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765443778; x=1766048578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NgoTJmSdoAfs6QQOK57IwUDwNIJjJ23MvoLDcN9wIM=;
        b=T6YQ/r8/KqXeH9UwI8NuZPDCczSbwV2MJpsdrfxJUOs24l3xbhl2uf6x/+yUYw6mw0
         J/j6CHUwj633tM+VQKWNCpzAOoVrkfPwxGruAOTInCP0oKzZvVrYC26QgJYGcjNbzv3C
         VXHRhnKa65OZZhH4KErgYMyzOYy3ct1JwMIBqSwqNjsTmCPFhTalRAvQqlTaUjdanqNG
         Nm0J6/0rdZVh2IdhsV3hPBk3tkxRLt1DJrR6JHCPiBVoiXIkbYwI3sNPUZMw0VON5067
         oiJesinGdfLVZ9fcBLTRN/k8YrM9tOtloqkyfYjiWq5cK07mdSBeNgyY/fYdTKf8QB8b
         Hmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765443778; x=1766048578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+NgoTJmSdoAfs6QQOK57IwUDwNIJjJ23MvoLDcN9wIM=;
        b=apzkYdXzp+rf5XBi+r141I9zBd4xX22aclZvQiP9QnvofW4OeQBtz0lmUUi71cD0Pc
         2B2f1kefhNTSaGBXndFZ2CnLnqx52Y3/F/2SpjX6ak0iWEFhIoqs98E9213VC2oQXtz2
         SIuysv7nN78rI5nuiP6lQbLL+ufOx+mhDD+9x1ofAfGV74xloR2CyCsxif85MK9bjG8l
         8zgM9bGyTmiJsXqvdBTmRZud4l2ONsZIJHdT/xEMtpKVKjSJnBcg8RB/tMJA6sB7OVvB
         AMUuZlXrzM/ff+9sD0MBY/odB3EzuyxMuA9CpyJMIyqL1l2tapizV/GF9Mt78E20WX6r
         RT2A==
X-Gm-Message-State: AOJu0YzxtHZmiS/zMfOtVgBsqctyc7mYJXVSCR6umkjOxVUSFljgf1cU
	XRaV7U+WNqDfC+IxhVh4XpqHZ314fWZe2GeMKSft8ycUVDmde6tZz/rBWaiETAb0UEtAKA3wnw3
	aXIfhapC+igC4ZpU3otNprxoH8GPHYHkEWvyPam8JxL9qUJKpuFTleGZRZqw7i8pk2cGp
X-Gm-Gg: AY/fxX4s+RL0zMZm4XFAsiHO4DyRz5GHeDXPvvqx8rjhZwBsJtRDymVi3FK+h5gQBiK
	0P9u8LG/Ag4dmPqoFnDQkegHNsmZ9QZg4hQRQOf+l/U+c7wEs+HZUe0YH3mkZb/fAFMnL3c6YZ3
	RtIRa9g3iCqbBhFyVwnlIbFKmj0TrgG2qK3HVk9nOWOvvdoe1MHvnOMLAoUef0bmZSyhGdtPmma
	5NxopLsi8BX8UcnZ7fwgybzNVtM80x+ywEK4xLm72VGhar1LfKokSEoTcWcXBEaFE8LA8znxJPU
	TQVAtgiuhHBbaQmxiglp0OCA8r8/wEmmCYlWSqomg7AkZrqXUb13NuspzRN3p6LqB+Tyl2kPpT2
	KpxjMcvFBx4m6M0xXgxlIaQuhMBhjws5czzdNYYPzBspjzN5MoYEPo5jw4f3+GCaiORmrJYLoRG
	UsgqQrrfi482/83vfv25s3cyN9gz36QQ==
X-Received: by 2002:a05:6a20:a110:b0:366:14b0:4b0f with SMTP id adf61e73a8af0-366e3de7b04mr5898664637.75.1765443777605;
        Thu, 11 Dec 2025 01:02:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRRruCQfp9AbvMcWtmH5QzkjuM7BYpunQ0FdzkcV1+6D7ZrkkUw39KCB1GqEam4QQI5pVAEw==
X-Received: by 2002:a05:6a20:a110:b0:366:14b0:4b0f with SMTP id adf61e73a8af0-366e3de7b04mr5898628637.75.1765443777102;
        Thu, 11 Dec 2025 01:02:57 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a92860032sm1273780a91.11.2025.12.11.01.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 01:02:56 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 14:32:36 +0530
Subject: [PATCH v3 2/2] soc: qcom: llcc-qcom: Add support for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-glymur_llcc_enablement-v3-2-43457b354b0d@oss.qualcomm.com>
References: <20251211-glymur_llcc_enablement-v3-0-43457b354b0d@oss.qualcomm.com>
In-Reply-To: <20251211-glymur_llcc_enablement-v3-0-43457b354b0d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        rajendra.nayak@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765443765; l=6824;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=LC6+YJ+r4Oa4PWxB06n5WJfG0upbybA1CX3fP7BHWJs=;
 b=ExiET/4JVUY5qyR5XcDjzS6gIT7OM0fOTglFMc0os4WkCZ/J2HSLLZbIJ4gU3HcQkq0M+WHXz
 zE26cZskaVRCmetsjrIcavKL4rfa1G/+YkkUeqsTXiYWsXIwnHczCpB
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-GUID: -nu7ddXlpF8rGCvQdyWKDRFZSLn4StdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA2NyBTYWx0ZWRfX0coqfX+L8m0T
 fVVsC3X7cm/4xp4jpWKeJsCC0xwO7Es1g0X8am3DWR3gxgJ43psjnVFzWcqBURSXHnpSgm7mVXk
 Ry2QGinrViK4FJcuxiVYheFQxVu99Ns8SykrVfebapgM1LEnXhnIgrxnDjLyRYXvEbOmGDYe8Uc
 2dJlcIFutrJG5SlNKZRprYAbfx7uvFiFpvbLj14Jr1XLP5TWTWXWJ2x6u7mreGwZdknVQO6wxML
 5BGYLvJq04/L37ibG895PFx1QqaEk+9JP/NwipC2/zysjq1lImhfjtcMPEJYDDsSxKVb+mVcBul
 qpT7zSqwaPOYKotfowGBWQkqjKT45++SipJyIzZE9yMBKAy/9ODqSs/qwgvB8bWGkl+7HJcIN6g
 C7KfRzrUVTXjUFu0nEmL/nKRrVHSbg==
X-Authority-Analysis: v=2.4 cv=FYU6BZ+6 c=1 sm=1 tr=0 ts=693a88c2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7DQyclDd9yYmhgmT4UAA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: -nu7ddXlpF8rGCvQdyWKDRFZSLn4StdS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110067

Add system cache table(SCT) and configs for Glymur SoC
Updated the list of usecase id's to enable additional clients for Glymur

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c       | 207 +++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h |   4 +
 2 files changed, 211 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 13e174267294..1abfda7a58f2 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -182,6 +182,197 @@ enum llcc_reg_offset {
 	LLCC_TRP_WRS_CACHEABLE_EN,
 };
 
+static const struct llcc_slice_config glymur_data[] = {
+	{
+		.usecase_id = LLCC_CPUSS,
+		.slice_id = 1,
+		.max_cap = 7680,
+		.priority = 1,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_VIDSC0,
+		.slice_id = 2,
+		.max_cap = 512,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_AUDIO,
+		.slice_id = 6,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_VIDSC1,
+		.slice_id = 4,
+		.max_cap = 512,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_CMPT,
+		.slice_id = 10,
+		.max_cap = 7680,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_GPUHTW,
+		.slice_id = 11,
+		.max_cap = 512,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_GPU,
+		.slice_id = 9,
+		.max_cap = 7680,
+		.priority = 1,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.write_scid_en = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_MMUHWT,
+		.slice_id = 18,
+		.max_cap = 768,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_AUDHW,
+		.slice_id = 22,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_CVP,
+		.slice_id = 8,
+		.max_cap = 64,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_WRCACHE,
+		.slice_id = 31,
+		.max_cap = 1536,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_CMPTHCP,
+		.slice_id = 17,
+		.max_cap = 256,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_LCPDARE,
+		.slice_id = 30,
+		.max_cap = 768,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.alloc_oneway_en = true,
+		.vict_prio = true,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_AENPU,
+		.slice_id = 3,
+		.max_cap = 3072,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.cache_mode = 2,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_ISLAND1,
+		.slice_id = 12,
+		.max_cap = 5632,
+		.priority = 7,
+		.fixed_size = true,
+		.bonus_ways = 0x0,
+		.res_ways = 0x7FF,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_VIDVSP,
+		.slice_id = 28,
+		.max_cap = 256,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_OOBM_NS,
+		.slice_id = 5,
+		.max_cap = 512,
+		.priority = 1,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_CPUSS_OPP,
+		.slice_id = 32,
+		.max_cap = 0,
+		.fixed_size = true,
+		.bonus_ways = 0x0,
+		.res_ways = 0x0,
+		.vict_prio = true,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_PCIE_TCU,
+		.slice_id = 19,
+		.max_cap = 256,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_VIDSC_VSP1,
+		.slice_id = 29,
+		.max_cap = 256,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}
+};
+
 static const struct llcc_slice_config ipq5424_data[] =  {
 	{
 		.usecase_id = LLCC_CPUSS,
@@ -3872,6 +4063,16 @@ static const struct qcom_llcc_config kaanapali_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config glymur_cfg[] = {
+	{
+		.sct_data	= glymur_data,
+		.size		= ARRAY_SIZE(glymur_data),
+		.reg_offset	= llcc_v6_reg_offset,
+		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+		.no_edac	= true,
+	},
+};
+
 static const struct qcom_llcc_config qcs615_cfg[] = {
 	{
 		.sct_data	= qcs615_data,
@@ -4103,6 +4304,11 @@ static const struct qcom_sct_config kaanapali_cfgs = {
 	.num_config	= ARRAY_SIZE(kaanapali_cfg),
 };
 
+static const struct qcom_sct_config glymur_cfgs = {
+	.llcc_config	= glymur_cfg,
+	.num_config	= ARRAY_SIZE(glymur_cfg),
+};
+
 static const struct qcom_sct_config qcs615_cfgs = {
 	.llcc_config	= qcs615_cfg,
 	.num_config	= ARRAY_SIZE(qcs615_cfg),
@@ -4941,6 +5147,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_llcc_of_match[] = {
+	{ .compatible = "qcom,glymur-llcc", .data = &glymur_cfgs },
 	{ .compatible = "qcom,ipq5424-llcc", .data = &ipq5424_cfgs},
 	{ .compatible = "qcom,kaanapali-llcc", .data = &kaanapali_cfgs},
 	{ .compatible = "qcom,qcs615-llcc", .data = &qcs615_cfgs},
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 0287f9182c4d..8243ab3a12a8 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -74,13 +74,17 @@
 #define LLCC_CAMSRTIP	 73
 #define LLCC_CAMRTRF	 74
 #define LLCC_CAMSRTRF	 75
+#define LLCC_OOBM_NS	 81
+#define LLCC_OOBM_S	 82
 #define LLCC_VIDEO_APV	 83
 #define LLCC_COMPUTE1	 87
 #define LLCC_CPUSS_OPP	 88
 #define LLCC_CPUSSMPAM	 89
+#define LLCC_VIDSC_VSP1	 91
 #define LLCC_CAM_IPE_STROV	 92
 #define LLCC_CAM_OFE_STROV	 93
 #define LLCC_CPUSS_HEU	 94
+#define LLCC_PCIE_TCU	 97
 #define LLCC_MDM_PNG_FIXED	 100
 
 /**

-- 
2.34.1


