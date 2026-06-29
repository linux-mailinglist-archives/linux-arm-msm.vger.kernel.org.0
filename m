Return-Path: <linux-arm-msm+bounces-114928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VvlTFTw6QmoX2QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:26:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F106D829E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:26:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ggN+jRcS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kPTlFCpt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114928-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114928-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A11C93012547
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D28D4014AB;
	Mon, 29 Jun 2026 09:16:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8ED3FBB6D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:16:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724618; cv=none; b=pA6Atvhzym4LaDWReCOPhHWWOUf0TKPcNLWdx/1fwf+v5MYE0hlypY7GbuNHyh39+tkvqLX/j+BnH3gK37gyhYvrIzpk/f2GNmBONoPVdny6FtMBylRmCP1lRJ+uNhOhmYyFd9cebynvh1IpSfXX+bL7aDaSTMQqm1vnGJ9A24I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724618; c=relaxed/simple;
	bh=neIRO5hRQLm2wv0OPnF2GzaSKUDpqoiH3VJg5+27lIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vmk6emWoDT37CGMv9BrJJLwObjU2Taj9QXwQvRJjAOFhn+RwfSiuqNIPwsVubq0yzJcQQt3TZN3Z1Z0wCFPf87Vux14x/wnv2dej8Vi+MPXZbFVH2NDytfnHFfbENSJBw7znlFPxRHLcPEt9OSAANUhl3tLmq/WudB1UVaF89/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggN+jRcS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPTlFCpt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6sImZ2143017
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q34XTfcl0Xz7H6NHGylvZ+
	cLajZSFs0L0NYtvFlwbYo=; b=ggN+jRcSuzLqTTabHt9XOoMoL6DxdNuGLRY5kk
	USGEzmiCBjPKmH4J6qYndfH2dwhbbhf62U+zWYAGXTqGI+mkzDzBtrwgpS5jd8F6
	VJBmlIur4v+QiSGW/PgwzqlY5lQ41yiTuWe/jv4TLMDzHHYw0QmZ5YtY5p9ZaEUK
	wR4A4kt3rUp6C4KGYwwmWia8hLYjIANJ0E/TgvaypBbad0ESs4gd5d6Dnw3fWk6r
	kJMqcQCG2DSyZ132bkcnYlb3jTUtLKYaaaxAZyvj+UBpPlE8ZzPAekCvaHCT7ySM
	hD+iNmgaCnkv68r5BPaX254yyInAkr3myX4R3o0BmT6/JfpA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8nrfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:16:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8478a1ec69fso539956b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724615; x=1783329415; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q34XTfcl0Xz7H6NHGylvZ+cLajZSFs0L0NYtvFlwbYo=;
        b=kPTlFCpt+NeZUeuQcusu2tlI+rE8TcddhQEOfx5Zyjsjqut2It+QQQTm1AGmEi4N61
         3L/5Ch0dN8zUyZ8mMq8yFVvVjVyb9VUc9Lrgew4au0zkeAj3jSw2w3ZymTIzrWX+kbgY
         0AejBRC0IxNxKt+zyJhWjRmWu9C3U9ajGk/s2/WtxJp/szwNJEF1322aOZ3VEZS2XA/1
         V7GO+UBuIWQdS1/nIV+BKqom2jacNEXvLJr7ahQb7KCn57x1zCeA++Vp1DfUi7A8eA0u
         DUhPlgZ1BYQjp41gDyc122YqAlyHc0oyI5vnbjtI2JSmPUUan7UqZIgmioMhxgrcY4op
         25tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724615; x=1783329415;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q34XTfcl0Xz7H6NHGylvZ+cLajZSFs0L0NYtvFlwbYo=;
        b=C77xEpSQmXW9jc17vkRzYmiXGfSNf5luDo+/g31ftDRUzSBc7UXU7WViUWi9yMkHLe
         AVgY9eiAKp/3bgAtBYlPYoRj0IqA42q5Qra4AMQSdz7Ld+Us+9dfUa/8/139lsX4K5A+
         c20C5jEN1qjan8uwkxmkqVFNo+GKOeneOsSuSVGcE2uTuAOqPdmycc9tC2u5UpIBhYnM
         h7PKKOCc8JTU3tzTWa7cEZ61tHekB4sVGv7xXRnRGJPqR6Dfg1+1FoSp8KKRWfjvCclM
         2UrlaCU9PaL4OTsLcuF7tYx1Riqr6WNCOByAhXGP4zueyI1x8sO++IR2II7ftcgDOYOO
         xNUQ==
X-Gm-Message-State: AOJu0YxGducH787wwbV4UHo0C5MkfYw9mp8XExRAPwX+wPslfXQ1rAW5
	U91HgJ/jCRjKS2Mu2iuVka9dZRfTZvE1PhZH2OWNUYIfSifHxvhfspi8kvojVBPAz6TE/6ndues
	EfOauGcwtrIohGclsKVULuMaC6fJRgn3gxPycVoiIIpqPfRum2BpjgtSislJk9Ng/a8PL
X-Gm-Gg: AfdE7ckbMClkZ6Gru+uqYovrFjO2FPxHJy5kwUnAaVenEvybmT0MJlOBSLBDMwQQtBT
	ieHR1v1UtiAjCsG/VOkorD8dRsx2oWxick9j7yyG8vEZtFqg35X6x51GsD/xrdRTE6RARqzhSa9
	XPVifO7dBlbsKFfpRTN9dqJ8gtJ+ObP7eFSubaEU3t6cwraoyC6rLjBbyzjHGMMq5omBlJvmahc
	RNoxuSOU+ZahDVrA44ggWzibALA5C20kzozBBXBqc/kUeXxzO90TjiJrLTykgpys0R9KCUnYmHE
	9nZCfMj3YNgXp+XTgY1t9b+CojBg+U21xdWg3ivsdDZgJi2YU9aUfEaIOiGZe3KuyF0rBXZvdKC
	lJwzHiE1D2Dhy6UkdU1cl+rLbML/lqCsiDb+ZEy7CeuoIoKf02OaBLEo8QK/sHQZeooD+xmLSR5
	RdsT2ZNP09fp6l8O/X9Xx3eeI=
X-Received: by 2002:a05:6a00:9086:b0:845:d274:bf92 with SMTP id d2e1a72fcca58-845d274e47emr8639772b3a.59.1782724614810;
        Mon, 29 Jun 2026 02:16:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:9086:b0:845:d274:bf92 with SMTP id d2e1a72fcca58-845d274e47emr8639750b3a.59.1782724614253;
        Mon, 29 Jun 2026 02:16:54 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fedaefsm12193848b3a.23.2026.06.29.02.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:16:53 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 14:46:19 +0530
Subject: [PATCH] platform: arm64: qcom-hamoa-ec: Register cooling devices
 with their name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-fix_cooling_device_register-v1-1-c6e518b0bbd4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOI3QmoC/x2MWwqEMAwAryL5tlDrA92riBSJaQ1Iu6TLIoh3N
 /g5MDMXFBKmAp/qAqE/F85JoakrwH1NkQxvyuCsG+zgJhP49JjzwSn6TQMkLxS5/EgM4mrbMYT
 eYgd6+Aqp/t7n5b4fsbZiP20AAAA=
X-Change-ID: 20260629-fix_cooling_device_register-cca038ff50c4
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782724610; l=1851;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=neIRO5hRQLm2wv0OPnF2GzaSKUDpqoiH3VJg5+27lIk=;
 b=CWmg8IL+xaXqYXuKti+46W4GxCsK/DpvjK/4V6jRda4Vpx4SmWGNRJxnbGXHBlspGUw1NMfTb
 oDfs7a66KF2DdNOiw29N6i5Uv5qYXznXboXqbS299khbWmq+cH+0fZG
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX2YrRHG7oFld9
 9bMsgJZLMm9bZH7WoJvmOIuqrjVCn6w9ywBqdjth6AQiAYGFDTH4u73jHg92ShzCrHd1oR8gshM
 MmYjlVNmHJAX9GbFAq/KunGQ+9CSUX8=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a423807 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WxJZI26rGmMZWz_SfakA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: MEPd_l4tjSG5iyig0LGdcNtY6aE4G9xo
X-Proofpoint-ORIG-GUID: MEPd_l4tjSG5iyig0LGdcNtY6aE4G9xo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX/Z9Q7QfF+22z
 fqy0VP2RflD6OFJfntR2VKWR8H7ut2RRljEKXkR019Opz1ImrQauovnTjAvFKJQnG1efQDzFQLw
 keUpX11VW4OC8sKvVKyrhscgKF9VxcKKcTEj92Yk0B4Suk7xFtAUe7w31j+2eBRnyoJHORQm6yv
 j7OK6nXThkeykQO77qomzNAW5/igNJqu725HbJf9/TVs1SmLscOIqMCce+q5mujJJU/qMTP/UsD
 DSiTtTIDMOKpSimKdDDN92aSet4jnj60jIYAd2buCWcZa7qxjZ1HU8a4TDykaL09NLi4U/8RKFb
 W315DBfspUtuZHgUv0yl0QvF0AmrKcTR5MDPDwTBEnWYDbH4Kb3feUNqQN5kBAieYmk+YYqf8zS
 D4dNK4L3FQ6EQp+QkuoS2xuOb3KsCcaoA7/KXAKFKtQmItkJv6dp8O21swmcYKa67qW6ZC3pSA4
 gNk7XZrrgCXGrKRRe2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114928-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sibi.sankar@oss.qualcomm.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:bryan.odonoghue@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:maccraft123mc@gmail.com,m:linux-arm-msm@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:anvesh.p@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.intel.com,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35F106D829E

Each fan is registered as a thermal cooling device using
devm_thermal_of_cooling_device_register(). When the thermal core gained
cooling device ID support, the helper's prototype changed: its second
argument became a 'u32 cdev_id' and its third a 'const char *type',
replacing the previous 'struct device_node *np'.

The resulting semantic conflict between the EC driver and the reworked
thermal helper was resolved while merging the drivers-x86 tree into
linux-next by passing NULL as the 'type' argument, dropping the per-fan
'name' string. As a result every fan is registered as a cooling device
with an empty name.

Pass 'name' as the 'type' argument so the cooling devices are registered
with their intended "qcom_ec_fan_<n>" names.

Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index 45829f2786b7..12196d56b60e 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -391,7 +391,7 @@ static int qcom_ec_probe(struct i2c_client *client)
 		ec_cdev->fan_id = i + 1;
 		ec_cdev->parent_dev = dev;
 
-		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, 0, NULL, ec_cdev,
+		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, 0, name, ec_cdev,
 									&qcom_ec_thermal_ops);
 		if (IS_ERR(ec_cdev->cdev)) {
 			return dev_err_probe(dev, PTR_ERR(ec_cdev->cdev),

---
base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
change-id: 20260629-fix_cooling_device_register-cca038ff50c4

Best regards,
-- 
Anvesh Jain P <anvesh.p@oss.qualcomm.com>


