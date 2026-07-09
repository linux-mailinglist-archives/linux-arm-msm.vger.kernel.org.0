Return-Path: <linux-arm-msm+bounces-118106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yBejHbb5T2qFrQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:42:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF22C7351CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:42:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=agaNMxdm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JOBJlKvJ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118106-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118106-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E563530DFD95
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 19:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3EB3CBE97;
	Thu,  9 Jul 2026 19:37:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23973D34B1
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 19:37:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625849; cv=none; b=JiIxIPzU67QUJDepQW9xGp4jgjQjpfH59EtxvvLXuys9pWu8IYiQZmnpbaniZCmCguwP6vAP+NA6eVvgQBHFZY94s7/IKCPZ8DsPY38MrfEsR+/RpCWEBhtBE4r3lW1N8wQfJ/7mDtVP/MQ4Q/vGVzSwPvyAJab/+GanahtgJQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625849; c=relaxed/simple;
	bh=mZusnoT2WUAfwc1lIqw4bcGLnT42XbUFodbSzhc24x8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A1ADP3mIGkOT+Z2WIPYCWXY3MiJ/sULpvAZwSI34nQ4VUGFIeE1LZUPdb4gVWsTo9JX4SOlpq6ydqyG0P53J2mk38kJia8zifglIREqhGQiPDXrJBegXUPkfAN1ncILcd2AO6QY/RJH/Zhn4iFOrYIb2b9qLtftzdokAsd3cvKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=agaNMxdm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOBJlKvJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HWtmc2514881
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 19:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF3jWljA9JWLIdXUfkTrXBIJfz/O13vMhJungOwkK2w=; b=agaNMxdmhE8d03V2
	3FaGGDFwwNtOgOdm0+CAEMaoU4NLz5OmhflVJMqSLuskWU6k3OFPYdfca74kXreP
	lsCELT1ffvCV5w6/7L7DtDUITu83vh9TmTJ3YXcO7aFCLAXdofKzGTh9Vv6F89k7
	kHV4OkGnww3r2mUE0Xl2SzAUwlmgYi+Dfe4RvCp/zkFjK4FBBLC6CwC+N4qL9TaQ
	q07ngGeV9dR4k9gH/Jc0fFN3O3s00O+LP5FPcoVSvRvwhbc9Q+GIMKdR8Qn/64wi
	ubaLeVn48nUOUcIfEco5g/fO8EGNyDcrFkI6EhLv1JeEKycEqzcmE3+Y+wpSt6hS
	76nTiA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418m6hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:37:25 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744e806f474so43332137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783625844; x=1784230644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OF3jWljA9JWLIdXUfkTrXBIJfz/O13vMhJungOwkK2w=;
        b=JOBJlKvJakMyerpSNkJaFgc5dFmXUzDcf1CmBLyxrYCT5ZqT730JNYjMAL1s15sdI7
         juzeyPmWHP7g3PQBZcOrcOycrhY7M/eGgUyVQDCO8J+4VEF//fIGQv0NfbWuGEbwtQfX
         z3FFo5Wo86Zj7Jf9KEsbO8HuzENzlIPugL2iQmUqeCNakCvM/DjCOtEio43M+KiMfdPR
         OzHdvFPGET7T36Ew2ZSeMz/e3LVEF2xu6snWYNJP1oyH8BoTNf8yIpz7q3+TyWKYDXVg
         IPENSMiSmobhzNUZN7+ChYsN/yaAhuweVJjRhHxBGRv1vOfVEqtdsIpFYb9Zq6yLc+aq
         HT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625844; x=1784230644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OF3jWljA9JWLIdXUfkTrXBIJfz/O13vMhJungOwkK2w=;
        b=na0BmmlxZW0YAO0pSz4ReMBw+B3Ig9D8ZOwgi++5EjTGk7N6hmnzjmsnzZ1j8xJGQ6
         pWQv3HTLYfZKjMaG/eMAlxURs3rT9s99NnGj9BQmqcAf13T/D8FUq1rzyIR+gjEpiZ2s
         rny20KcbG1UpnHOxPcng/MujNW00NCrgfKx+vjjJLo2g9fMkDuGp2hg4X+KVfJf8CxbB
         A7ZqbEaycTbK1k8PLaAcn/LGPJGWKXHlDpzLv57jl078BUhAm4u8QjAnW/mNlAd2x4gd
         8K6d6cMZ2An1T7FNt3rpE/uDPLTi/qgriaCnH9xcQO6F058Mv9y+k7H6CAM7O8iECun3
         m1rg==
X-Forwarded-Encrypted: i=1; AHgh+RqSoexQgiqeC2W8ujxrZDjWiL/vnSBAa8RImoKE4TTMtmEEzVavZaqX+hhrlFZQx+PSpQWv6HmDjOMGobRK@vger.kernel.org
X-Gm-Message-State: AOJu0YxBfiy8YUzt7RFSdDsJ6muInPM1AK3nF6KXvjraQbPnE1vCtsCw
	/RXkQZlIarLnvVdOHb59M3mYsn6FBlnLc0yQIAW0ElHdUGUNCXUvCpabwQCUMq4jk5FsE/0xfLk
	mK5/h6w9hRR1H0ylHjQOwibRpMtQCpedSCuQvAIfQDpcO04Zps0BmGsy27f074Yogn5t04gxqxO
	Tf
X-Gm-Gg: AfdE7ckl0Wq0RFxPywR2ErND8WJEHq2CbAohkmAXS5LrM5QXw2RZatmQtNJUUyXSoYf
	u1pf/boJZlHX0Yue1gYlPoKPsT6a37r2omMT/3JXhkYlwLErtTBBo9bw/mgnZpQGrl2XwSsMkAz
	MfsTZsVD9p9VrWwCAuIT5/Hc1A6VZJGj/c0Xp/PathY6QOyKNbZoNgUBlXoM95gyN6SjLIFWQxs
	RMPrsSHcq/fcOGmOkpNBApXBnBi8YdkhH/PJVxH3jiaVa8+wV3gQT/9QOnCjiOB9YKF11gGid77
	Ovgc45A0HDEE8irsDjpbOcP9pZ1vJbb1UM/h01oM7YKY3OPv5N4O86qYV3aRFfxd0kewI0VeR8y
	qT8wVX9CPt+D3utCr3ZExokQL79viXdvSgn5291/G7rD51Nw78f2za2Q1Txak2NgosP6Hgk+MFh
	GI4tZStJrFy0h5kMzKHIp3XAYY
X-Received: by 2002:a05:6102:4191:b0:720:7e04:b306 with SMTP id ada2fe7eead31-744dff0ad16mr5284184137.5.1783625844024;
        Thu, 09 Jul 2026 12:37:24 -0700 (PDT)
X-Received: by 2002:a05:6102:4191:b0:720:7e04:b306 with SMTP id ada2fe7eead31-744dff0ad16mr5284168137.5.1783625843498;
        Thu, 09 Jul 2026 12:37:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm46400e87.62.2026.07.09.12.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:37:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 22:37:06 +0300
Subject: [PATCH 9/9] media: iris: add VP8 encode support on Gen1 firmware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-vp8-v1-9-6af3ab578a7c@oss.qualcomm.com>
References: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
In-Reply-To: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5498;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mZusnoT2WUAfwc1lIqw4bcGLnT42XbUFodbSzhc24x8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT/heGUvkBzb7Bx1jxhNrQPpGgkbO9rTaWLnTx
 EgCZzKlhd+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak/4XgAKCRCLPIo+Aiko
 1bJjB/0XEZz1Q1Vns9CCt4Q4yGFGVaS0GCUtCxU0F0gHluwtpuf6PjCuYvoolULXxIom7l/1M08
 Lwar9mZlKbZDJO7m/LmDKMtioJy1Ojxk3vYTf7V4E7HCZEoChBzAOAAnS8Lv7RmibsLhTU6MkJ5
 EtcQCajtm+GgLXT4lp3PBdZJCjNfLsYvCdWOIhwJ3M1aJ/zOpdINVnvbgozu/vLQ5hAhjiem1Nx
 v90X5c8qnM1JYa9h00p5Xw3LYYayMfC8LIMuFyHsGfDV9gyc1WWngMbrxA1xzF4YfBBtBF9NxZA
 Y9nKkstzX/5XwFAGJwmf2AOVi/kKWdG+907B12USxvt9C+gz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4ff875 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=HONOBwlNRYcZTqebO68A:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE5MyBTYWx0ZWRfXxUwLIDoPoJ+f
 woFdAljJhmIs06gZXtNh4g+CkNycr5HYpq673DJBA2d438MyqWKTFpZX7C32co2C8MjzlTf+Ui1
 k0mMdUm7MYW1WfeH6lH+NAD2YH51MFJqaUhhWUW76cfHoU/XFhmBW5lDzdKy2oVabA8esOM8tRU
 Sv5cUdB2+/u9zsByGEKbGfjpizW36eMsJAcVarJ8MtIqiuZzb2m3Zj8VQmfLuEnOYbjHQlzn1w2
 5QLe35WcUe9a6q+146/zJyNfZUtcVvIw2eFowhU5+XbcFbHl3Hw1RB+kva2yZoHa7pNTc8n5zqa
 fW61oXESYuQiaG6Jsg9zP8Sqaug479rkcEJREOz42BonPnnV8jyv2b45FK09RmQcBeMFIsMFHAe
 JY/m4UJttvXK2I3kBVO9sS7OQinZK2zDCR1/DxRM02PiCC+/NrHtF1mwganARp6CTVpWf/xUK7p
 i0CH6oDBata1fH7kF0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE5MyBTYWx0ZWRfX/twOdUQAPtyk
 /rvsI5bHkglV6KNOdDEAIouVagbLO0Q2+K71dfbaYVShg5nTx8ocPYF68jZOdQLCjcqYtYqw/Yu
 zt7vWP4NCzeD5asOhp/s3BLKlBoOdzg=
X-Proofpoint-GUID: iDIlgITmzlFbtC56wtnFDK9cGJXlEhBB
X-Proofpoint-ORIG-GUID: iDIlgITmzlFbtC56wtnFDK9cGJXlEhBB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090193
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118106-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF22C7351CF

The Gen1 firmware supports encoding VP8, but the iris driver never
advertised or wired up the codec.

Advertise VP8 through the Gen1 encode format list and register the VP8
profile control, sending the profile to the firmware through the
profile/level property. VP8 has no level, so only the profile is set.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  3 +++
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 23 ++++++++++++++++++++--
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 12 +++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  5 +++++
 4 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 8f9347c1df2b..c065ebc24d7d 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -621,6 +621,9 @@ int iris_set_profile_level_gen1(struct iris_inst *inst, enum platform_inst_fw_ca
 	if (inst->codec == V4L2_PIX_FMT_H264) {
 		pl.profile = inst->fw_caps[PROFILE_H264].value;
 		pl.level = inst->fw_caps[LEVEL_H264].value;
+	} else if (inst->codec == V4L2_PIX_FMT_VP8) {
+		pl.profile = inst->fw_caps[PROFILE_VP8].value;
+		pl.level = 0;
 	} else {
 		pl.profile = inst->fw_caps[PROFILE_HEVC].value;
 		pl.level = inst->fw_caps[LEVEL_HEVC].value;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 0451ee321840..b3c567349a6b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -150,6 +150,19 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_profile_level_gen1,
 	},
+	{
+		.cap_id = PROFILE_VP8,
+		.min = V4L2_MPEG_VIDEO_VP8_PROFILE_0,
+		.max = V4L2_MPEG_VIDEO_VP8_PROFILE_3,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_0) |
+				BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_1) |
+				BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_2) |
+				BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_3),
+		.value = V4L2_MPEG_VIDEO_VP8_PROFILE_0,
+		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile_level_gen1,
+	},
 	{
 		.cap_id = HEADER_MODE,
 		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
@@ -470,6 +483,12 @@ static const u32 iris_hfi_gen1_ar50lt_dec_fmts[] = {
 static const u32 iris_hfi_gen1_enc_fmts[] = {
 	V4L2_PIX_FMT_H264,
 	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP8,
+};
+
+static const u32 iris_hfi_gen1_ar50lt_enc_fmts[] = {
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
 };
 
 const struct iris_firmware_data iris_hfi_gen1_data = {
@@ -728,8 +747,8 @@ const struct iris_firmware_data iris_hfi_gen1_ar50lt_data = {
 
 	.dec_fmts = iris_hfi_gen1_ar50lt_dec_fmts,
 	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen1_ar50lt_dec_fmts),
-	.enc_fmts = iris_hfi_gen1_enc_fmts,
-	.enc_fmts_size = ARRAY_SIZE(iris_hfi_gen1_enc_fmts),
+	.enc_fmts = iris_hfi_gen1_ar50lt_enc_fmts,
+	.enc_fmts_size = ARRAY_SIZE(iris_hfi_gen1_ar50lt_enc_fmts),
 
 	.dec_input_config_params_default =
 		sm8250_vdec_input_config_param_default,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 53ba48f88410..c652c61db19d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -542,6 +542,13 @@ static const struct iris_hfi_gen1_id_mapping iris_hfi_gen1_hevc_levels[] = {
 	{ HFI_HEVC_LEVEL_62, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2 },
 };
 
+static const struct iris_hfi_gen1_id_mapping iris_hfi_gen1_vp8_profiles[] = {
+	{ HFI_VPX_PROFILE_VERSION_0, V4L2_MPEG_VIDEO_VP8_PROFILE_0 },
+	{ HFI_VPX_PROFILE_VERSION_1, V4L2_MPEG_VIDEO_VP8_PROFILE_1 },
+	{ HFI_VPX_PROFILE_VERSION_2, V4L2_MPEG_VIDEO_VP8_PROFILE_2 },
+	{ HFI_VPX_PROFILE_VERSION_3, V4L2_MPEG_VIDEO_VP8_PROFILE_3 },
+};
+
 static u32 iris_hfi_gen1_find_hfi_id(u32 v4l2_id,
 				     const struct iris_hfi_gen1_id_mapping *array,
 				     unsigned int array_sz)
@@ -577,6 +584,11 @@ iris_hfi_gen1_profile_level(struct iris_inst *inst, u32 v4l2_pf, u32 v4l2_lvl,
 		pl->level = iris_hfi_gen1_find_hfi_id(v4l2_lvl, iris_hfi_gen1_hevc_levels,
 						      ARRAY_SIZE(iris_hfi_gen1_hevc_levels));
 		break;
+	case V4L2_PIX_FMT_VP8:
+		pl->profile = iris_hfi_gen1_find_hfi_id(v4l2_pf, iris_hfi_gen1_vp8_profiles,
+							ARRAY_SIZE(iris_hfi_gen1_vp8_profiles));
+		pl->level = 0;
+		break;
 	default:
 		pl->profile = 0;
 		pl->level = 0;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 3c8ae1c82540..2fe1cb7928b5 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -63,6 +63,11 @@
 #define HFI_HEVC_LEVEL_61				0x00000800
 #define HFI_HEVC_LEVEL_62				0x00001000
 
+#define HFI_VPX_PROFILE_VERSION_0			0x00000004
+#define HFI_VPX_PROFILE_VERSION_1			0x00000008
+#define HFI_VPX_PROFILE_VERSION_2			0x00000010
+#define HFI_VPX_PROFILE_VERSION_3			0x00000020
+
 #define HFI_ERR_NONE					0x0
 
 #define HFI_CMD_SYS_INIT				0x10001

-- 
2.47.3


