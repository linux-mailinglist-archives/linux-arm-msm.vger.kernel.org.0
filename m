Return-Path: <linux-arm-msm+bounces-113611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YMf+GBiAMmrR0wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:08:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2022B698D25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:08:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VWBTAR3O;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="QFtEGaV/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113611-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113611-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5263B30400D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D623911D2;
	Wed, 17 Jun 2026 11:07:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3988E384CDA
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:07:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694446; cv=none; b=YnzumDLkg0zdOm4LsvDFFDNqJ9Gj6q+AJ/ZTyXVx1vOombgTwyeq9Kh77QThPCfab8ytxFGd60UZaJu30b+3Ix3Mv4wOqIRBEHc1EgVDjOZ7zSdVFM2cEY926Dj/3Jp4apARENBqn3Dp7XTuoCuexRR+gNPxy3vVkpcgY7eDLc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694446; c=relaxed/simple;
	bh=II+dTbwufhbfpgEni9YnBXDjz7wUC3yKUbJoATs2Sy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8f6Rv9sNFWVoFn0Oyc058nXBqsNtSmd0NX6fDJDG3vZa8ECCvl5AvmbbaIhtZDQej5i3O+gDrQMDvc15A2GJVmb5JOf31edrhplieFXDjfxocWBTj1DTq6bA8+jx5pV06osJRsdrPTNJE+YEA1nnIsnKHtPDk0GjFJT2/eS9wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VWBTAR3O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QFtEGaV/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8Vo292191977
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EkTMhAJDZTyo/Hxe/349UftCygvvSv8znBEfDCpHsOs=; b=VWBTAR3ObfAm8tKN
	i+Zpl/qWYocio5hWiHZECF9oyUHfbW+UmxNVWIx3UMSgm/UokWJeFj7Fm+4JvzzS
	kI4J4Zs02N7Glh/429A8RNGzgGYGld8iJ8CwelysbKNOzzkAs90KD9wFatnew+Pe
	IUsgr2Rop6Pk8ZoHgYk2qPsDw8DM2Sptl9APHysSK99Fh3ZweZ5Lrxio6Gm8jBEE
	oh6lQ7LppVHj7gw44wac7qzigV81ShCob5aWndWAEwUm8x5RJJnsisZqvTNTFwPc
	0f8wu68NHyW8UDGRRFEeDSWf7hckR5//rmyF3yNHS8//VmaGVAKiu/DCsI1F3Nb8
	GdUN7Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesjtsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:07:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37c9d82cd57so901537a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694443; x=1782299243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EkTMhAJDZTyo/Hxe/349UftCygvvSv8znBEfDCpHsOs=;
        b=QFtEGaV/m6LsyzZVOOkmeYRR1ONNlLtpRwcZwM2zACRuVlrg85VUY8xc7U78iG2WsI
         NeZfWjYY8SCf+EENUZn7LZRwByt/3i0nPa5AwBIZddXFoGP0IDeja6nGALdH7yQz7SnV
         iirJgU0QyioPubCT0xlMtp3rYhIBBMKqYqvcaSzzr888vfB4icEMBa4IZeXFJYpyP4iG
         0knfLqcMB83P/cMY3NRqHyGLNnbyBOWbLVj1HqWW8+bVPYrYdYUmYLD5pldxZEGPMg3D
         vrYyK13US6klp3NcrXoNJPe5XiKmBxZdNJsZTxhtj6+bM0koY2L++LCH4Ob2vpsajRlQ
         1p4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694443; x=1782299243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EkTMhAJDZTyo/Hxe/349UftCygvvSv8znBEfDCpHsOs=;
        b=B5aVoHLIfEgJZD4YTMLP7dAtvkZmh/10ZdcnxbHuYSVpcIsk0mZqXbbOOUq5sTLCh/
         IywTYLC8WWiIsXOk4LQyuKqIeHMueimNp5UOC/2FuhdypoyEx83CtBNbLYht5Md7yKNa
         qlZJ5JIcsq/jQn+HkZ5s5TMDv2FbsOZVRIeoJGBcJX/0/2Q5DfWCUo5pkRR5XnLkwejG
         66YjNSl9Tz3kC/1QJpipsDw4Ijw7xDNxfh8VBudpSCFRYFSZHguHV7HaWveCzbPnamdc
         PZsEYhIrAxyIsPy/jc8A187E77+xhkPRIoQvdRwCTt9dEdDUPQMl5sZrUzDcU6UZdBZi
         ynmA==
X-Gm-Message-State: AOJu0Yz1LjK0he7/AolY5lvHxNk7onqw2aZ+tpUJ5hfdtlWbn32UZKFd
	HnquHTfYfHcwq76ZnqzJZ7lePM4dnPEeFkDPvSKXMJget+h1Ess2IAG+jeKS1CHYw7ksg7ykwJh
	cIS4GbpFAJVJl20PSnQbBJPAhzTXNPqUQqKNODVfUWespZOQJIMXd+hmOQ6bn3VK2khWw
X-Gm-Gg: AfdE7cnXZzhZ5pmfw+vt/ll5FoiZC9ZkZQ8gJXribpla/uTg+X7kf6olwu4jDftrhYW
	WH+efnC+qmD+Uf/8SYlzDdjh91J9G8E++9O0HyYthwF0FF5PEJFSMXuyHVfRTIdFNgpKYrWNDda
	iicw2V84SRV4du3SS783h1RD7iSK6uZcQ/TRw9Dt2DUjUQ7iMnz2TRTd5f6L0FzwfLyYDSLWiUA
	iZlGk6Vwi/YkF/g/ZxLRI0o5HEpdJGjFigHRIJo1Ytxvehi1e2LiIybr/nhmxuF3WSBizNtEv6j
	f/pPY6fxfnvx2xS/wyKOEGz5WIyYhCvAoxf14fMpUsuZoHj1jMN3e9bWSw6qqm2nuHHLodvDcLP
	VPZAeqUWzHf45Oagbx1YJ+G4oGk9Ek+qGR/46Mf6kPHGB3lnwcWLLXsLk6tBCroEnfSwkj+mXuU
	gAmstBsA==
X-Received: by 2002:a17:90b:2886:b0:36d:bbe0:de7c with SMTP id 98e67ed59e1d1-37c936bb828mr2899371a91.12.1781694443305;
        Wed, 17 Jun 2026 04:07:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2886:b0:36d:bbe0:de7c with SMTP id 98e67ed59e1d1-37c936bb828mr2899345a91.12.1781694442852;
        Wed, 17 Jun 2026 04:07:22 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c5228eb5bsm5577639a91.12.2026.06.17.04.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:07:22 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 19:07:13 +0800
Subject: [PATCH v2 1/2] rpmsg: glink: smem: Use device name as IRQ name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rpmsg-improvements-v2-1-477d4eb569dc@oss.qualcomm.com>
References: <20260617-rpmsg-improvements-v2-0-477d4eb569dc@oss.qualcomm.com>
In-Reply-To: <20260617-rpmsg-improvements-v2-0-477d4eb569dc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781694436; l=1360;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=II+dTbwufhbfpgEni9YnBXDjz7wUC3yKUbJoATs2Sy0=;
 b=upEzPzUCiDVcQ8F0Qj9AFitMPP9spr72ixwHiSANg8FAQ8tjheyCny2Ys9waTjPwvmho8rkXO
 LuzrIB4eEX3ADdVai320r4vuYWxB8CT0YfICcFCBnCX/waTSqV20JBk
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfX1ucN/4TRLO3E
 llnY0MwJVq0IYH64jfKmBgqaqpyuJyn+7DiCgl7ZlxvTny73GSpbbEI6ZfUWvEzaGQvVL1QGwM6
 DXyyEbj8HwqCFN2eGIkwxPPYf9YAruEOJmXOQhzSBku9mW89qJek8mdYsTToll6pebvLzMQcpJW
 LOmpSbVGVeaA81qdgAOyd19R0quYHha0NhlmagWpZJdb2pRNlNq5YlVVAr9Leaa8Qu0Sneie8xu
 ab/B6EVutrvkgaH61pMSuI9QQ1iwgzKB0H3r+cWGcdfHSNDqoX20jlvQavqQK9YyXSbgSJuBEZN
 +KpAlEuVN5WVc8wtxa+Oqw44boS36Ydn0vfC/NIIvnT+cx7NlCRlCk4Fs/II9IH+yU+Om1yr/2b
 Pf5mhVuuYzGXtSWnz97W1BTHUTTrLhZZ9Wm7Al1wNyyNoa3qXiOHD7ySCJatcyty60z9G69urEO
 f12iidc53x09e0CT1CQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfX4b1y/GsuIGGC
 OCwUfi0o3ch5NWgMTqfY+9i9AyNQi/ICnN45SAFUWepK0aSfwHAeG9Wc+lniy/k/b5mpjMOwc81
 T4vYPvxB2SL71QHDIsnt+bZj4rO/tfc=
X-Proofpoint-ORIG-GUID: XIj6j_lcX9f-919QBo1GAylDZ8fqrHZR
X-Proofpoint-GUID: XIj6j_lcX9f-919QBo1GAylDZ8fqrHZR
X-Authority-Analysis: v=2.4 cv=ePojSnp1 c=1 sm=1 tr=0 ts=6a327fec cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Nqvb9vKcIXZEg_ORUGMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113611-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chris.lew@oss.qualcomm.com,m:tony.truong@oss.qualcomm.com,m:chunkai.deng@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2022B698D25

A SoC typically has multiple remoteprocs (ADSP, MPSS, CDSP, etc.), each
registering its own SMEM GLINK instance. With the static name "glink-smem"
all instances appear identically in /proc/interrupts, making it impossible
to associate an IRQ with a specific remote processor.

Pass dev_name(&smem->dev) to devm_request_irq() instead. The device name
is already set to "<parent>:<edge-node>" which uniquely identifies each
instance without requiring an additional field in the driver struct.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 62adc4db2317..edab912557ac 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -307,7 +307,7 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 	smem->irq = of_irq_get(smem->dev.of_node, 0);
 	ret = devm_request_irq(&smem->dev, smem->irq, qcom_glink_smem_intr,
 			       IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
-			       "glink-smem", smem);
+			       dev_name(&smem->dev), smem);
 	if (ret) {
 		dev_err(&smem->dev, "failed to request IRQ\n");
 		goto err_put_dev;

-- 
2.34.1


