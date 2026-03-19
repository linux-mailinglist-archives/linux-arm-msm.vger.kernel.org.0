Return-Path: <linux-arm-msm+bounces-98629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHQfAyeRu2lmlgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:01:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 819332C6768
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EA5B3143BE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D85A359A76;
	Thu, 19 Mar 2026 06:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cAOMVGTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQNk7fd3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7B9399353
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 05:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773900002; cv=none; b=TlLvlkXQJCgFNoRwmEJnbiOvQX/NjiiN6JGzOnpJvI6akkN8TVL/wDbx7sYHa+W0dzdCuUQNFfmEGHRNH7NuNI+F4gewdAO7Yqy74ybYYXyCIN+GetkQx+OCqAqTS4FoQ3UQ/KYXa/zDdjwkIzxsD12X5wWcAcOXsKUaQVeSShk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773900002; c=relaxed/simple;
	bh=phlz7lNAhvXN0hEIT6ClaBZaJ7P5qlMteCFYP4WlGM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rUIDZrYnRxwa6MlZFORj0+chvFwMO3+5rL1T0C5xpSE+iGl0QI4VQvh3hH2gLNlzgLc7dT+EB2kFumItImXGRbTNzDiBfEpVl6/2eMnP8M9fTW7Si03HRlIjkr/B1lmrA4+8bWagAchlEQ0x0UWVn4YJSm8hoYL1Tdd0kLb7z3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cAOMVGTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQNk7fd3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5Xn6P2470005
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 05:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OflPgbJUeB9MU802D7Qb7B2sM8brxEZYSrbm3iiUBSI=; b=cAOMVGTPIR4NqfhR
	FV6kHFAd5YS7Pg3Q7vlDM9HvJrnNj08R/OjinKdmsUbFk4h66wSY3QL3KE2DDazw
	nBSwUA51LVGI9ltdFvlbMAwuB90uJ5JvB3mPSUazT5Y3+M5BYWg7DHtouiNsWApC
	e2nO+8z8P6PAKf1jEGMtuZFIakgRwmqp0yxPHCEFfjy9LdSWCOEEHizfgBzrEjd6
	x8y9/km89Ims92ViaQ4LU0gD2KaGyiqgn25ywTzQUznNwzNVvG47ahIdOM98oiLc
	n1EnlvKK8bM8ddYXsP7Aevj3X2Oy96HAfOJQ5zzl43juYV+Cuu71dqxU1itRwnhq
	bo7Xdw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj53hna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 05:59:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093a985e21so28064841cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 22:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773899998; x=1774504798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OflPgbJUeB9MU802D7Qb7B2sM8brxEZYSrbm3iiUBSI=;
        b=VQNk7fd3wS0E3iTP7EyfMGeEkVs75KpixXq4mNnJ9VDHMJyviduWB5HZnnzcjcXUTA
         tDZv/eIOa3ZAZncJB8DlezMtsMo11YhfyTT0wOidW9HNgZavIKTg/eC2g70qPN6T8F5G
         DocQZ5lxY5JMlFEfoJJc9wDbRebUjOT7L82LO+6wXePQIaUG6ti9W5JMqDXojp7B31Kz
         KE5IRKjNDreDBF5y6HFNvaLg0y0B/hBsglr6fnu33svZMcRDKe/f/m8YpZKPhzxCnuEb
         5vfPsAUrEBc6Kq0s6jqfCrtsyQn4FqsLwI9bUnBhaFCHqswOtm7rOD2Fvom87mUWREMD
         lrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773899998; x=1774504798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OflPgbJUeB9MU802D7Qb7B2sM8brxEZYSrbm3iiUBSI=;
        b=LPqBfXyxuZB5yEnl0QbuwixxZcJD8qZReY4ZHPk8SZAP4xNZA2a0SXnXKgaaN+EVmr
         /dS1Xvme8UoLEw85iPtv4SC+5LCB6tFt4KDqYz5QHWk2Urjbg8OXuR/Az/tR/6H5osKD
         9/bFMgUmboQY94BIGtuVOwV6xgHsRcTNYgO7Sny7aC1lV3pSDHPPimTI+5rg5nuRFwyf
         vPEOqW3BwlEwagorxTxIzkYOiJPkn7jNzSku2GeIxgZD21ntfyvejYGp2ne0qJWS7UiI
         fEI64p+Bt75Ek2g+wEn7SwhBCciijq1f82IDsU7k7agQyROGwSNKEFNx5q1C2ObAEM2I
         TwsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr2Si81r3XQXTFLknyave2rTemate9uOy/syJpcf+H96222oaSRml5Jf82h6mntDc7w9adkh2pVIHXRjiS@vger.kernel.org
X-Gm-Message-State: AOJu0YyevYkcsQYTGXThC/KUVmVITYiG5gUkAl1YOXPoXu++nUNccJml
	vD8UlwSNsTbLwfCzA+xoCWl4WhnvBZKZpP9od6y72qJYtZDsUxLRHrUGrjOQQaIZ1MtKnvPR8Ck
	7fcBVXgPIdH8jE65dY9hwf93SQw59/IZZ/J6CtigcuwxwErbMMBoLFIHK3jl30gRqtyNZ
X-Gm-Gg: ATEYQzyDpe4iurpucoKQEbsYBe4g4+t6iY4lz1+uokjeEr1YHQ93/pZoVBVrTiZ3C4W
	qmgnK9D1XJPUFjfU2ixgZ6SgQFlcemmrMfibdj0oksLcc1eG7A5/Uv9v2W0uqoHh/Bmvy1XTlJi
	yX6NtPHgfpb+eEFLxETHr1mjfU7FhcPKdVG5fvabOkhF/axJDjbjvCdC+DxCw2X6mR/kROu494E
	2nIhKiB1rHTfM2JQxgRB2O9lXBLsL0r3n9JP6TKPYt93ZfOuPZ/51KuTbR/buhm4TxfpkjWQW83
	OkjCzzgq2CcG5gktlliTGrA1UBZ9BuYnWZH0oe3KRNdfurFeriL6ZQkYl5k8QirSnN7/fK5/kLq
	2gdPpxe3CB+IwJ555wJGgpjtT+hj9x142loPwohtkQxYmOKc15XRUJ+oeBSLeHG+W9I+yavYaSJ
	vuHJn3D57H0yzQ19LBXyws334edPB0qeex/n4=
X-Received: by 2002:ac8:5910:0:b0:509:23ee:b9a5 with SMTP id d75a77b69052e-50b147634e3mr82832671cf.5.1773899998255;
        Wed, 18 Mar 2026 22:59:58 -0700 (PDT)
X-Received: by 2002:ac8:5910:0:b0:509:23ee:b9a5 with SMTP id d75a77b69052e-50b147634e3mr82832451cf.5.1773899997747;
        Wed, 18 Mar 2026 22:59:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c7415asm993174e87.56.2026.03.18.22.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 22:59:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 07:59:46 +0200
Subject: [PATCH v8 02/11] media: qcom: iris: use common
 set_preset_registers function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-iris-platform-data-v8-2-55a9566ebf60@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6499;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=phlz7lNAhvXN0hEIT6ClaBZaJ7P5qlMteCFYP4WlGM8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpu5DUtSw5t2hTXdCFOOdNBu7SxipEMDYH+JdXZ
 1pL4rqwZGeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabuQ1AAKCRCLPIo+Aiko
 1RnpB/9YuRCSk32hAC3u51ngdzdH8UJUy3yHJ4tUcXYyu2rgQhpZexpAEHZ9+HdPFD1MTySzIqS
 x5Jx0x80KgMRlh9anAsqbVD8W2EXexJuPUogialQoLeaEYNIgAp5GHNkTlPlLofnq+YdOlOR5IG
 XfpsK42pCh+3ommPLT6tra/6+GNv/tJOeJMCem0NQWBGm18UENyVXe5gt4BviPTeCWDgce7QiKZ
 bzc7n6AAFnma3sQDPbOZweZOOWxddapWGJKjBAyg+JzixJpZ+5NQcnXNP6bdnJfbaaMaHqKIUFA
 cKTK0VN2y6Wh1UoScIhT/gTjscYHJnV81+QZq9bS2xwIJS5w
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0NCBTYWx0ZWRfX0CRnb0R38EIA
 M7TQuU2R2Q8nmdKPcgH/VhYgalsaFiHGZK+bM54GV1O63oRjkT5zXw522+vIgt6Kp0q+n/VxBma
 99nSYV3gNwAgNDwCtOevLgPx7IeLkkIN0yHkmpxR63aD3lwEmNR3+9r3bwU389RUi4Fi1lpywq0
 d4+HbC5jVDhVx/nu2sRSYFiXHE15z/7K/xN/qWNWMicFxBRTt6Y3gNedZwq3lxFMIXVUl77q6ox
 fcYHTGZCdqoguuT89YFx0JkjH2BETK9mmcZH3/RLUk5qv40XY2nnCTS6okfodJ3roLJC3ZO8BEw
 QLYKU9yppipddUPCTRuK6or1QQSfTD2s2PEWfA1rMaiq/oJKo/v7yGZ2Ts2gFw9HXHLATGzwHd9
 cKWibpeqBUlX4PMEvizmNfXXgAnXpzCNyDZLkDaVXfv6V/qPm9HLunlquMwWuVp1jAe8BOYWbkf
 zl/9pcpZsNi7bREdRIg==
X-Proofpoint-ORIG-GUID: wVapqaJRQ0q29WuGVpbIfZM06JlSu3d0
X-Proofpoint-GUID: wVapqaJRQ0q29WuGVpbIfZM06JlSu3d0
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bb90de cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=LmgrmXmU8fDMlo1BKrQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190044
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98629-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 819332C6768
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The set_preset_registers is (currently) common to all supported devices.
Extract it to a iris_vpu_common.c and call it directly from
iris_vpu_power_on(). Later, if any of the devices requires special
handling, it can be sorted out separately.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   | 7 -------
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 9 ---------
 drivers/media/platform/qcom/iris/iris_vpu_common.c      | 7 ++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h      | 2 ++
 5 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e4eefc646c7f..d7106902698c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -207,7 +207,6 @@ struct iris_platform_data {
 	struct iris_inst *(*get_instance)(void);
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
-	void (*set_preset_registers)(struct iris_core *core);
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
 	const struct bw_info *bw_tbl_dec;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 07ed572e895b..ed07d1b00e43 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -260,11 +260,6 @@ static struct platform_inst_caps platform_inst_cap_sm8250 = {
 	.max_operating_rate = MAXIMUM_FPS,
 };
 
-static void iris_set_sm8250_preset_registers(struct iris_core *core)
-{
-	writel(0x0, core->reg_base + 0xB0088);
-}
-
 static const struct icc_info sm8250_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -343,7 +338,6 @@ const struct iris_platform_data sm8250_data = {
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_set_sm8250_preset_registers,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.clk_rst_tbl = sm8250_clk_reset_table,
@@ -397,7 +391,6 @@ const struct iris_platform_data sc7280_data = {
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_set_sm8250_preset_registers,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.bw_tbl_dec = sc7280_bw_table_dec,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 1f23ddb972f0..c84d4399f84d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -756,11 +756,6 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
 	.max_operating_rate = MAXIMUM_FPS,
 };
 
-static void iris_set_sm8550_preset_registers(struct iris_core *core)
-{
-	writel(0x0, core->reg_base + 0xB0088);
-}
-
 static const struct icc_info sm8550_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -917,7 +912,6 @@ const struct iris_platform_data sm8550_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
@@ -1018,7 +1012,6 @@ const struct iris_platform_data sm8650_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8650_clk_reset_table,
@@ -1114,7 +1107,6 @@ const struct iris_platform_data sm8750_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8750_clk_reset_table,
@@ -1212,7 +1204,6 @@ const struct iris_platform_data qcs8300_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..faabf53126f3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -468,7 +468,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	iris_opp_set_rate(core->dev, freq);
 
-	core->iris_platform_data->set_preset_registers(core);
+	iris_vpu_set_preset_registers(core);
 
 	iris_vpu_interrupt_init(core);
 	core->intr_status = 0;
@@ -485,3 +485,8 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	return ret;
 }
+
+void iris_vpu_set_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + 0xb0088);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index f6dffc613b82..07728c4c72b6 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -39,4 +39,6 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
 void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
+void iris_vpu_set_preset_registers(struct iris_core *core);
+
 #endif

-- 
2.47.3


