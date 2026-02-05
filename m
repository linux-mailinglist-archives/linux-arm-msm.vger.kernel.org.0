Return-Path: <linux-arm-msm+bounces-91941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJfxBdDAhGnG4wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 17:09:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6267BF4FF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 17:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0B4F304F37B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 16:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A693A428841;
	Thu,  5 Feb 2026 16:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NfrnOwJA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewFtOWtn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CF042EED3
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 16:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770307376; cv=none; b=dpHq2CKPNcb+Hqt78ZJpjED/xRgr7UdEAAcqjzVaSODAxyDZVzE4AoOpq2Ag9FPbLr6+aP7LT8AGM3g1LlB89O8BCh1EHQjGcqOkYSK9oPLKAXkx4fYqiamSL4OezMJPxAl0wJ/Zip1PJT6t71sM4MYAgP/6wYrAuTylC5YBtH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770307376; c=relaxed/simple;
	bh=RourRfeB9wVJEdBGaxjFCTn3682Cg/goM5yd2hMRqnk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qNaHzP8W70UHirLR24p279gFb60gCfQW+8vyUdOAGVaSQxhukjnpFf3fq9g7Ux4Z4i4uX0Luv1bt4hNQufoHoWOl09FgBbMgkoKJCVGl/+kfCZytZtuOp9+CeZk37ivE+WqmkDqItSAEV34whZj6AXhHVtn7HHiiDkNlGads2+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NfrnOwJA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewFtOWtn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615EBQb2890582
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 16:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/f3BuWs2Trk
	IzcVgpd5kLu/+y3eG6mU2IZQHNt/J4D4=; b=NfrnOwJAG0zVTR7UEupJTQrcZTe
	4+Bs/y0fZkwHTHg2sbs+iJik99din/rF+8KzPivLvKLAwF1vsYvEYvDOIwiS/4Su
	AfbdLjFacOs+8FyURjVE9IebcgtvIB7m2gnSqptzgOCHjKFwbCcnFp0Bh71kS9h0
	OwlSrMSdvetsQGvJJ/pCswBP4wrATTiPz8+i0Tgzahv+S/xqxckkqo3T71G++bRP
	WD4Rp2Bf/3bfKkmP4V4r/skppQ4ZPL59jc7k5wldEXnoQXKd80t6sjwLGqincbhZ
	uxFaGo+5KKvqezrXZG6/UAYvmQZ0tedW2e5/aIfeWB5LRSnfy6viNdlmEJg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4prx9me4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 16:02:55 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7cfd9a9c1beso2893958a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 08:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770307375; x=1770912175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/f3BuWs2TrkIzcVgpd5kLu/+y3eG6mU2IZQHNt/J4D4=;
        b=ewFtOWtnv6XnW507SpQnEiPStoJEcXkk0L4M3Qp6/Tt48g/XAYom32vV7o5yd1QFE6
         Nhswl7uZQMPHmQSw42j1fGMAzxjlKqOHTr6EQYeWA5BJjHZXCNxKdiRCPRVBzo4Sh6QD
         isWVE2fDxE3llYSGGOSupibsYhv3EOJvy06JLJNZo+QTjXlWrgHBhNMvB8Fdv4po391i
         CcyroDv5svvAql1JR3zNjX18+KCKu5EO5IXogzZdGHh+pa/aM9ze1Gf9QEj4/TeRQJVg
         2ffnDkPz0ZGa5Yh9glJhPo4EWwtO87U2k+ObgUF2mqZssUnjItQdWHrPSVNRaYm8bwdK
         qR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770307375; x=1770912175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/f3BuWs2TrkIzcVgpd5kLu/+y3eG6mU2IZQHNt/J4D4=;
        b=MDm5ePfXCQCkyraX5GcxCSR4CgVfmjD5aCsNMwgDxQlbljGAcA6MZHRW8jXwFgQuj9
         FNcMZ4VU+oL1r9r1Cye6cOuoHlGlm0xAQoO/21qbg9mrjVz/nYyidYWz3tHTsDJPmkEd
         bW0hU1z4/vhreRuFASguuRwqaJRdzxWEaSCpsvnvDraooQ5RAtyBpAZIaW2vxVmsXE6N
         qTHpP7q/E+9ZO2WzYpZztehODTUWuHMB65UBoAdbBB7cJ3OKU0MdnbIRxkpzEPt2g/y4
         qBzBVqHo4Rcbzd4rz2sYxLhMn5VXlh9NI9HNj0fJSxWIlyrYpN+l9YMr+QdncoVch9qw
         RQ1w==
X-Gm-Message-State: AOJu0Yx39zhUcEC7p7zGLcmWG/3o+cBwYu6HYIFLnUxFAeqXffj9ooB1
	XjqvM0t1y7i4bwHyoncss6jMO33xj4k7mZV+IKnvV5ywCA7FxQquhZ2QzsrwAncrREo+IevJ7pE
	IE7j1U7FfMxUnKH2OX2Xq++bnI988jNuP23DdIF/Iyff66LbLY1XcmKOMlFZDfSCDUunZ
X-Gm-Gg: AZuq6aJYvYvuxdsrqnzbTK6BOCuC0RrEph5zBPxn3Ejqwj6LTk09RG0EtYyB+3MURym
	IXxwBV5pXFa10viS3o2DxMuiFi8X+XoiGzeN5J27jFCNg7aIe3u1J4DI4bM1X95XgU06DrWq3R8
	wWO1vBuRejQpeDmSCqBDVRKEY1Gcfnk2sR7dsGyUf1zQsuj0qXAKUvOsRK1L/1GyXcI2jnX1XrZ
	KKPvxuT2gDZGN7uTqby6LgO/1eT2jSqpxJpmLTw4X9HRJcBAk/3YYEDzxWiz4ktzXsQcdfEHia6
	OH+wmrbwkcI2MnweBHtS2/+WzuAlFaU9icUP5owNtVB3bU6S239yGbQuFxolGsR9ehJu1nuHRjx
	5h+f4u04dsr0fKNhUfgdDQEfWuCTD59ag4pSG10995sabEreIrbu1Kzeg9Agx/b9rFbCMuSpWln
	Dd
X-Received: by 2002:a05:6830:d0a:b0:7d1:94d0:e8f1 with SMTP id 46e09a7af769-7d4489f3a63mr3831356a34.15.1770307374780;
        Thu, 05 Feb 2026 08:02:54 -0800 (PST)
X-Received: by 2002:a05:6830:d0a:b0:7d1:94d0:e8f1 with SMTP id 46e09a7af769-7d4489f3a63mr3831266a34.15.1770307374194;
        Thu, 05 Feb 2026 08:02:54 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:103a:9c65:ad2d:82fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180640e5sm13770002f8f.40.2026.02.05.08.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 08:02:52 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 2/5] phy: qcom: qmp-usbc: Prevent unnecessary PM runtime suspend at boot
Date: Thu,  5 Feb 2026 17:02:37 +0100
Message-Id: <20260205160240.748371-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
References: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MAvX2Zkks8KwYcy0P1r5YVuZmKA4RFpb
X-Proofpoint-ORIG-GUID: MAvX2Zkks8KwYcy0P1r5YVuZmKA4RFpb
X-Authority-Analysis: v=2.4 cv=eLkeTXp1 c=1 sm=1 tr=0 ts=6984bf2f cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=FmOiMsbJW-36OGxlXE4A:9 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEyMCBTYWx0ZWRfX0VxCkY5lwB5v
 V3hQaGHOfRktNApkxo6zRxTqHMgZbzBxwVKlx4QBbYksLUh7MPSUcpVg1ieSNYtpRCuMa6I7Vqo
 7dQEtM4vVR7mxYELuPgaln9FgkbmnztsMWY0CJNe1KZIuePePQLeA81nyGEZ5ja2NDWP8Ik2aNw
 DSrjDfvVLPNIPzIvp75mvKFTGkatDZOgJfIS6eSKuWbQ4zsUSkiLyN8ipv1KjRZV/qj/mK3FfNI
 dW6L5CN4/Wc0F+nGcvESMwckMzGO4n+XcxSSAoPuSMU2F4Vi4HSjnTTr8Cym2WD3Qi1y0WJUlJl
 i7NNRe2M03S0zYWAoJTupgq+2ae8ZHUi6cwjMweknStq0RZpxCdL8jZlXU0V1KXOT+9baKVUISE
 KQ29TMaQcCOd2zU9JY3/6P2sdOYIBe40DiDic1Js7l00s337KNlRl3oCWzllDGsE4qjZ6ZjdIFB
 KncwQBEPncq6NLchwVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050120
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91941-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6267BF4FF2
X-Rspamd-Action: no action

There is a small window where the device can suspend after
pm_runtime_enable() and before pm_runtime_forbid(), causing an
unnecessary suspend/resume cycle while the PHY is not yet registered.

Move pm_runtime_forbid() before pm_runtime_enable() to eliminate
this race.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 14feb77789b3..90ea6ca64026 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -1959,15 +1959,15 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
+	/*
+	 * Enable runtime PM support, but forbid it by default.
+	 * Users can allow it again via the power/control attribute in sysfs.
+	 */
 	pm_runtime_set_active(dev);
+	pm_runtime_forbid(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		goto err_node_put;
-	/*
-	 * Prevent runtime pm from being ON by default. Users can enable
-	 * it using power/control in sysfs.
-	 */
-	pm_runtime_forbid(dev);
 
 	ret = qmp_usbc_register_clocks(qmp, np);
 	if (ret)
-- 
2.34.1


