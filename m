Return-Path: <linux-arm-msm+bounces-98634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OC3SBO+Ru2mYlgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:04:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5BF2C67FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADFE531F8356
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C97305057;
	Thu, 19 Mar 2026 06:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N+Srr/BT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XaYBp1HN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3648E35CB98
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773900011; cv=none; b=rOjTaJ35DqhgucS70fiVIZHtiHUno8og00MawejZMl4KrOVId60i453MezA5Y8C2pavsm5kQAMgSvyc4irK9RDkz7Uy8sLPx5XcgJYkSgsCmfkyTqaZrRNnXSkNUXt6urdadpdfDWdhK7qeA1movVmyaFb9j8Erq7NdsSL1N0Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773900011; c=relaxed/simple;
	bh=VauW/RGRyUgiLiorJMeqipoBRAxqClErnJ8ONalNeAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uz+MCF4E9ULABpVug/rNfyUHIawbA0TDP+zcQESK/fZ46uDmXLRXopUD5Bwp0o/yd929A3PnFQV8PsQpseceuEYnDgCAmJ0rmFAKgbrjRtUgzX07XMsWB5DR/QjnLnlkqmPqNUTsJ2818q+IxIeCnz8BfcGXr27zk0qBXkwU8+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N+Srr/BT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XaYBp1HN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XtPd1802729
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F6bNVB+vN1tv/9CQnymCkv9yAHBuvvR2gmbWq/1Knkk=; b=N+Srr/BT/E2usFCH
	q9e3m13R+cJyk9SNml8EO5tR8tSFALdMQPca3BvslWYMvwR6/OneYAZqE3gUWuxM
	DnGfvMQsl+9GK6K+kMzo8sduUDREWKaRGREe1AfIsZxU//twiGtloPH8N5k1XcLc
	VJfDfaIdeJ0swO5b/6VuBUvQu99LCkH3sSFkgTsC82T/rkZqurJ6A/xXGcSbBpbc
	UJTk65k9RXaB1rqB8WKb/e2CN7UUfoQJ0VlnwkPJWoYlkYovAbaPjDT+rkHhzOdu
	cdm8ZIJvIoMW6ftkOx5nb3fT1W84H1wA4wBn2R4xvAntwrXv8bNThmFg/uz7mDB6
	HN9n3Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb3te9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:00:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091782ab06so88594671cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 23:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773900008; x=1774504808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6bNVB+vN1tv/9CQnymCkv9yAHBuvvR2gmbWq/1Knkk=;
        b=XaYBp1HNc6Nui/Sc7aEHQC5bgxE7nrFi/OEG2/1mGPpVZGWv9dWlaLcWhT3FTKh4pA
         zvwu4sxm8BEM2vh+v0WXyCbson9WgN+XMRR6zXT7JW+3TvU2SafQ74ouSiL0R0A4cDQg
         9mEof26ZtsXqJ4F35t65eB2dBzLRgBYAdCqjIa0Wj31HJgSC6LdbWeRtgjYwvUdTpZ8g
         gpM2G0XNVGSL4RTNuEJWQ/RbUPkbSIugXcbrh7pcdhVbJD1m1v3PNA7wHPgIg3ephh7u
         a2548ZNOMseO6fM56MN00vzxWds46BL0i4DO9CQsMXsXLVgiLcQeOjtRe+s71yDNXBzl
         wc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773900008; x=1774504808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F6bNVB+vN1tv/9CQnymCkv9yAHBuvvR2gmbWq/1Knkk=;
        b=D2B9WqJkReKOJC0cVN9JZptJcXqItZQmHB8QKwt8aFMTCdvoKw4CeZw43/7YzhE378
         1EWeU7S9fKbEnPN92LMj0PU2niTkJ8VnFbfTwqcTcHHtvUT0rywkf3JmvpGZUm6KiVSJ
         5DRhQgAffV3HcPnJnssWnkySD48Sb3eg2hijzQh08pFeoIAyOyWJRkESEDddQDadEbi8
         Wrs6yvxvdEQpIJNeiXj5ROKR6Zy92U+ra3+Ix0r35E8l7dy1hey8ewop2Hq8VewvS9fY
         Dq81FkxI4+x5ONiX97JLfUkYVRsKNpehcwsodiJ5z1j8aEmFmZiJwwpKFpOEZexHDx4s
         2a0A==
X-Forwarded-Encrypted: i=1; AJvYcCUzmMBKIoMNT6PAtpuqwzsUY4hPKGijjoEi6OFtSWipAOb6aWFRbRsATvA3LoYOVXDdYFVUiwU1nXWRahnd@vger.kernel.org
X-Gm-Message-State: AOJu0YwqV3vF6u7gwRwfMJpzL6AVkYA/voU5m0QnOKm4YkNEGxwQKsre
	7rS+/9VzsZeqmkHmaCZ28UnSaeQ6pu8yXfiX6Unv9uUlXxkamcXtKkR9bas2l6NsnzTum3HoA9M
	ASegche8e9sd7IguZpJJF21+OATotWVzPJh5vPRAUmVLp/yyeKq16paE6Ddnl2E5+8G7m
X-Gm-Gg: ATEYQzzRtR1ojLyIAVUQpCoVd+tzjKGi8G95oV6BkO2/hDtNoLK1ofRTAtKaTNGBYaY
	UOhXMhshl4UoPYKWDWSQ5FdX+M2tZnKMtRCPBpLj9SUQ6wv/6N8ZP9t/WKsMo0imOz7SrKsXDwy
	AbEaemeWwfRI+m4wbj6nFIQPaJBCuJeByC+QTGKmCbmMPZnoJd1dkcND9VuoXWXONuQp0UwMMCV
	yUrxI+vikvhvBElg4GZ//o/p2IelQaxDKOlS/m9z20h4nsxXa7d7rAtI9zifx02naQBzIfGlPz4
	PFaD8tu7Q+UpxONYpW08Ps59cPNCMbs4Iwk7bJyzSMHPqsf2xcU3nSGgsKDyAVWubSYjtfUGrHw
	4h5rZ7xeZtMC5Yqrq2gGXEzulYzpLZhR2QIs4n3TnvKRvxX5+EK0oION3PT4ca3YM0OZ4V/DH8j
	Dejvj09ObEq5Sz9gUcavnE5MEqCuQEhscqBmE=
X-Received: by 2002:a05:622a:4306:b0:50b:2d93:97bd with SMTP id d75a77b69052e-50b2d93a1bemr2601811cf.24.1773900007996;
        Wed, 18 Mar 2026 23:00:07 -0700 (PDT)
X-Received: by 2002:a05:622a:4306:b0:50b:2d93:97bd with SMTP id d75a77b69052e-50b2d93a1bemr2601521cf.24.1773900007531;
        Wed, 18 Mar 2026 23:00:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c7415asm993174e87.56.2026.03.18.23.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:00:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 07:59:51 +0200
Subject: [PATCH v8 07/11] media: qcom: iris: drop hw_response_timeout_val
 from platform data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-iris-platform-data-v8-7-55a9566ebf60@oss.qualcomm.com>
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5689;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VauW/RGRyUgiLiorJMeqipoBRAxqClErnJ8ONalNeAg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpu5DWexDGF3TQ0yvchu3rsdKJrc4FkYPMz4gc/
 9/u9g5fGfaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabuQ1gAKCRCLPIo+Aiko
 1SpoB/42v5xUuOHaWhU3uqepnfUQeqbclso/iH76PzyM8bxFa5qpP3pUvVPm+/V5kPolzHY5mMv
 ES3DZA0jHE7lUGwvvz6bb9hqyyZ8MQyGhGnzucS88yC7V2ejh6fZVwSn1OshoAa1zQgzVvWNbbR
 IPPqnVsUxzreqStaNZre7wH++xPdQP1tVV6bBElFS1SLs7GsTmxc/Jb9WOMepOBpf6eCpzN6BP2
 1NILEi8CORezvSanUiC0lzPtB8MBW6g9m3WNP+FGDSThZiGDW524lCyW89NU0339S6vtUs8Pve7
 HWThcr2QqbADimWiZvC4P6i3+O5ZTqx92HPg9r/TRe7KSeFP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Ej5L7IC-EyZ54sl2OrMWrkhTe-940W0m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0NCBTYWx0ZWRfX0pr/Y7f6G61s
 J3c13NA2sPleRG9pfLc979h7GPiSCne9ht+b+Cz6EXyMDeghYg9LS2T7ONuBDjnitmv74b5yopR
 28j7aiFfMVMpceCVRCh54Qxa7T2Ya6g8vPU1Lfl3SHW7Y8iWALpWwSR0+bXiAug7onCVgNvyYY3
 bOGcbDeLxCV1VJWjcrME+tFuqMFEdc3SP8R7mHCxOqSHfN8/heW8i7tzBh/W+1Qp11r0pR34/FZ
 Ia63rtlVqXIMUbSX0joytAA3KKHxqIkbHSH4dOQkVPIxMutfDk/79Y0wsMFdOQu49JQDQs8Halc
 FCPAVkv7sC8HDKuQ775gxEXV6rgm0bkYG9TmrjXH6amn1fsvKKkZzTmRbWZUB3ZF+vxMlgDrAmr
 TEpk9FCZKQhwsvYaM4en8lZcrgGyM8Vqj1v0DX8cXAGpwzrmSAfpo/EeNr02z3QpH30f0VTs1n2
 Yg89KlVGvfBXMjQkeNg==
X-Proofpoint-GUID: Ej5L7IC-EyZ54sl2OrMWrkhTe-940W0m
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69bb90e8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=qqQcAvOoDgVuqrtd-OoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190044
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98634-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6D5BF2C67FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The HW response time is a constant between platforms. Remove it from the
iris_platform_data structure and use it directly.

Suggested-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c            | 3 +--
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   | 2 --
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 4 ----
 drivers/media/platform/qcom/iris/iris_utils.c           | 5 +----
 5 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 8406c48d635b..e6141012cd3d 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -28,14 +28,13 @@ void iris_core_deinit(struct iris_core *core)
 
 static int iris_wait_for_system_response(struct iris_core *core)
 {
-	u32 hw_response_timeout_val = core->iris_platform_data->hw_response_timeout;
 	int ret;
 
 	if (core->state == IRIS_CORE_ERROR)
 		return -EIO;
 
 	ret = wait_for_completion_timeout(&core->core_init_done,
-					  msecs_to_jiffies(hw_response_timeout_val));
+					  msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
 	if (!ret) {
 		core->state = IRIS_CORE_ERROR;
 		return -ETIMEDOUT;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index d1daef2d874b..e8a219023aaa 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -232,7 +232,6 @@ struct iris_platform_data {
 	const struct tz_cp_config *tz_cp_config_data;
 	u32 tz_cp_config_data_size;
 	u32 core_arch;
-	u32 hw_response_timeout;
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 9925a893b404..6ed4c4ae4056 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -361,7 +361,6 @@ const struct iris_platform_data sm8250_data = {
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
 	.tz_cp_config_data = tz_cp_config_sm8250,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
@@ -410,7 +409,6 @@ const struct iris_platform_data sc7280_data = {
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
 	.tz_cp_config_data = tz_cp_config_sm8250,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 1,
 	.no_aon = true,
 	.max_session_count = 16,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 10a972f96cbe..abe523db45c2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -936,7 +936,6 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1036,7 +1035,6 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1127,7 +1125,6 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1222,7 +1219,6 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 2,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index cfc5b576ec56..29b07d88507e 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -55,16 +55,13 @@ void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
 
 int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush)
 {
-	struct iris_core *core = inst->core;
-	u32 hw_response_timeout_val;
 	struct completion *done;
 	int ret;
 
-	hw_response_timeout_val = core->iris_platform_data->hw_response_timeout;
 	done = is_flush ? &inst->flush_completion : &inst->completion;
 
 	mutex_unlock(&inst->lock);
-	ret = wait_for_completion_timeout(done, msecs_to_jiffies(hw_response_timeout_val));
+	ret = wait_for_completion_timeout(done, msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
 	mutex_lock(&inst->lock);
 	if (!ret) {
 		iris_inst_change_state(inst, IRIS_INST_ERROR);

-- 
2.47.3


