Return-Path: <linux-arm-msm+bounces-105137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJUYKbG38WngjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:48:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B835490B7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9B5430B6632
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 07:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053BF3A75AF;
	Wed, 29 Apr 2026 07:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pEOTYkVm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQN/kdoW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2BB3A758E
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448664; cv=none; b=D2V31d60ErMXxKGFcg5TTNhgdIUIRoW9PDzGOUlG0p6ocuXOOCjmz0+CHKDlv9NXFddxgy35fcV+4EOeUCdCmvrDCvGvDL4qut2rQAce2MZvoClNWPptCrhy0yXuyAdJcmDplrUkQA2MTWqaMN8b2aojH5GgNzWwzIDHC5TutUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448664; c=relaxed/simple;
	bh=IVMOjjeOvVzA34ONEIzI9yOomKhrFD3snmXGZuN/fhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ACI9uRdEW/BoSFE3xd/pGpFWa7F6lht8U1oQ+S2My/j6y9stOA1rRNUq7/1VIT9seAroM3RGDqTLSzUp2uBVPcPSpuaYtzmXz9V5r+B5WRkpE1acAUIMhyakPXtIikxFg6cY10VgdfjtI0l2GkUXaU7+DQ+3BDxuTQ5Xd8MA92w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pEOTYkVm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQN/kdoW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T6F6911283684
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrwpLPifDsLwhC1CYMFolsR2RenoGcmSmM2DcBjyNLY=; b=pEOTYkVmR2g2pAaw
	cjTo3V6SwYGLFgDHfByQN/PDUH46QdePidNAvx8X6Ad5q10ywnIEZfDbztLp2hCb
	P7gm7Y/NPv9OSva/dCBSLcsLa6I35igZxHoF9bK1jcgT/GsoqY/zfl2nNeA+HpCA
	YHFN0aS6b0Uo7N9+6J5wbv1F6bQZyiVZDGOxkETvzSTYPABTaX2JFm8E3prNWyyz
	lP9V9YwfGZJJBZ0pl5NLoTgUfeW7cvl+v5mLWh7gHrrffTiWFV069nzqrquweNUe
	SKbbVmkjmQv9lIig2qosSHIt1mJjawpENzfu3/cX980uxMHLx+GWD61rpx2nFMcg
	26cj/w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj80bxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:44:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c798ace3e03so5234109a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 00:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777448656; x=1778053456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jrwpLPifDsLwhC1CYMFolsR2RenoGcmSmM2DcBjyNLY=;
        b=DQN/kdoWxHkfJseHYcRmG2g7JslqgdpDheyRI1nrypGqwMOhOsSEChtjb0Y3L2Cv8n
         Ud2quXmfI/80aDgFCXUf2wk3dpilNofAe7dWnLtYsvTvNpeYYQQE6a0i3sPYlv9OD4HN
         Y5exZv/M6aZZHTPx/57KnRUZIDS2FbSQaAkTMcwc1ECSBgCNcCV1pbHYzHTni6hmNAGq
         SCRSx9cLzZFZBM7NLmgvjxuv8PIkzlVkaFZLxdWejsebsK27NxhKG7IUkgRMVBvwI+gT
         8tbvpE2xheYx9SSgNn3Xp7qq2zZiA21civnliOpCOuBX/kPAOmf94dMXtajN/TT0WtI5
         KybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448656; x=1778053456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jrwpLPifDsLwhC1CYMFolsR2RenoGcmSmM2DcBjyNLY=;
        b=qGq0IB3JkKI7bx6Ulo3qHV2cmmp0uatECMtnQrIQEu6vKc1Opttg3QPHbiABW1/LmE
         BoI2qRbsOsj/oWtZw13RFq/Kb1+JDdBa+863LLDL+BZ0P41OgdtdKN2zo5yHKKatkruG
         br4F48lfHaaoysfYNMH2/dLI0nVXSdvZp2pkyY54T9Ti3UzSEQGPkX92LCxqYugMg4UC
         n9w8gLTTnNxpNIWzZsyCd2jDYDZ/7oIcTy9AQta5OEokVubEvkecoVbeyt7QHLzeWGbM
         NaeLTRxRQh/1x4+eKZgTIBNf8/nXs5jnPmv4GsBlSdCpCiwKWWgVjQETRP9TMHuBjTBU
         tWGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sxifJ1P6msznRWy4gEMD4p1cVWxuNm1G4eG4Fp9T82IS5+ab8AW1FHDVIgdbQKIiFGfEbBCaxfJ3dMMtD@vger.kernel.org
X-Gm-Message-State: AOJu0YzZbFPOJe6HNCA1gkl6n3a1r8b7jdZ6F5xVk4OhKf6M+GBoOf1l
	BmlpIL+8HrP6JAh5n7auiroGO4c5UgEHuEPoFI/aOQ0qd2kFlDMqEtdnEU7/Cqk/3wYOAlgojre
	D4kp0PY29LryBQCzD00K8Fb07/0TGWXC66iTdIkKe3dAE3pD5dIZTWXyBYBCne2b8oVjC
X-Gm-Gg: AeBDievGiJYl9WRZbOizMv4afGTMwNjisbiAk5Uazcz1/5MOr1fbNj8nBzYmrFweKEK
	vBJdGGfb+Q01gWhUncDnR2BOMjGQfVN5W0gpynjxGzbcmdHzngyL4Q9b7sDiMHrZNNFYK/yUUyF
	jN36tO8dpY/5SO5lpFBx0Se4xVDkrmihcLDzp11EzieUNSliaaYqruab7ZdLZnGH/jdRgvbWcnR
	yJ5JPTob7neVUee1USpPlv+a8z5+5+x5RC3n0WV3AgcJYq7Fi0N7xsSPgg75i2LNqGsdIH8wY6P
	e4oYb8tSIuKqHIqF+wBwS+1iiFraawLlTLnRDCj1dKWturWuZtIAPG3o3exj3tiiouRMKJN/+Ep
	K0K1SqS60fYduWZdfuZk9HZpZUhu0Ru4uLXv5Kgwkle/4pWBlqyaNS3VtMn8qhvs=
X-Received: by 2002:a05:6a21:e081:b0:39b:edcd:d92f with SMTP id adf61e73a8af0-3a3af47153emr2915973637.11.1777448656226;
        Wed, 29 Apr 2026 00:44:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:e081:b0:39b:edcd:d92f with SMTP id adf61e73a8af0-3a3af47153emr2915934637.11.1777448655598;
        Wed, 29 Apr 2026 00:44:15 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6506858sm1155848a12.24.2026.04.29.00.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:44:15 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:43:53 +0800
Subject: [PATCH v5 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-enable_iris_on_purwa-v5-2-438fa96da248@oss.qualcomm.com>
References: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
In-Reply-To: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777448637; l=2003;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=IVMOjjeOvVzA34ONEIzI9yOomKhrFD3snmXGZuN/fhk=;
 b=zHRn+CRPe9RYKsWCqWea9qvi1Hh0/u/crDyXYzYHHS0vj8BXGWWOOKzL4euhyYWrPDmk6SmJP
 9K9zF3qCSupBhfuQrueqcc4UVxs34XCKSm82gA9+5YkVaLRO7KDKbJH
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: t-D4uGk8XwapYlsU5ilZKIWi8LlzvOQq
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f1b6d1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=KtZWPW8jcQ_ObEEXPWgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: t-D4uGk8XwapYlsU5ilZKIWi8LlzvOQq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3NSBTYWx0ZWRfX8/QHTraB69Sy
 y1jUNqMpsmliSNe8zJ7+yoMGw7Q7v+NsYLteur83XdKZbULSAxp2CkpVhJiWQL17bHxT07Zi+x1
 Pjh1TezcCkqeATGKJOWe2suQSR+HX2HNtpB8MoZEqYVbBbp1zm+64TK7L/qknJIjJRjsQD3yKwi
 NHyLbP4qpEK15+sSHGHAZqih/RDVp1RFK09zeUE4gb+bEjKIY1gVBxG1+iFk85K6bZAr0a1j26l
 Oo705FCFBDRKc5o881qpOUZWtWBx8MkI7fYoGntoPP6typahJ60XbUFHJm3hbXs4z6MRCUklFmK
 JuKMvFvHuD62KUs9JsbRBFsjgIOUXhrBLJT5RaLiULCvUD5vWuk7U3ilwqphd/GrHBgQGWaDUoL
 fOFj+1o9Wi8RTHIAJZ5vrEcUXiHQw9FPq6iSW9U1y/qaprdL5NFamVkpmXua3h78bvZo5NbhMIZ
 OmVPylaBbNMgQypbhug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290075
X-Rspamd-Queue-Id: 0B835490B7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105137-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
the power on/off sequence.

The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
of the video codec hardware responsible for bitstream-level processing. It
is required to be enabled separately from the core clock to ensure proper
codec operation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fdb7543f76a1871f17257fa2360733..281b1f54cb962dedbfb0ec96ed3a5aab99b50eb8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -224,6 +224,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
 {
 	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 }
@@ -292,12 +293,18 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	if (ret && ret != -ENOENT)
 		goto err_disable_hw_clock;
 
+	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_hw_ahb_clock;
+
 	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
 	if (ret)
-		goto err_disable_hw_ahb_clock;
+		goto err_disable_bse_hw_clock;
 
 	return 0;
 
+err_disable_bse_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 err_disable_hw_ahb_clock:
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 err_disable_hw_clock:

-- 
2.43.0


