Return-Path: <linux-arm-msm+bounces-91615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAJgFwOugWn0IQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:12:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EA8D60E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78571305D6EA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 08:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3ADD392C55;
	Tue,  3 Feb 2026 08:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJdzSjKQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqnBjJXk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65615369964
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 08:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770106046; cv=none; b=u06elhq4ZnXn+PHK6TzWvg5SyGD+TNV7BgjVgwg+TIxRWXYGfBYtPcSZz8fILsYZ7KmzFpT7kN8Egp/R8T1sahGai9eoGB10+VKQdijVVYoUJDnUePO9KOrCsapxtlQk7dU+JTZvMrtWlGsTs2yuIMXRMjcmi6KV6VlTVhUyMak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770106046; c=relaxed/simple;
	bh=Qq04aMyR2RaVOIZIp8efbqCAIMKGNTY8acMbrQE2EXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kkvh+YDV4bRLGhNjQdWPZIxwMGtD1w8MAiX5Cn3Kpng2HfAVjoAkSVnGZnIUCN5qsVgJ+tSl1QdcPP09MXThC2X8vIGFEbfsR22Eb2ZNcva/2mMzjWDP1IHYtQCLgSCfHHTNg/lUp5lqq+x7rBporobXDQ4EAO0VDpige+3o11g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJdzSjKQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqnBjJXk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6137B98C2356976
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 08:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aj8+pAYTZe6c5Ex+saB41vaGVimbskW7CCO
	dDiVYdno=; b=cJdzSjKQbg/hlj20+hQ9vWMNDsyCeU2PnKUtX3bzEzILLXRjyRT
	8k4bvQ5upj/IXvBIeMo6u+QHIq+D3nJIwyyWjcB4lsSeHlKatLL6Q6frtMUTqJgU
	/a56LD70rVBYuk5HvVXtuhmTWixgdGWzhMl6hcvNPt0rZlqfQA5jEvHxRJNvRy9j
	53vNx5pIgZCX8cTbCYsz4zQxtHPUS//t2P69jab6eJ8KB5XIivGYeKPddAcBDS4B
	9G3jb7Fk6ZOy5ApRiusBkyMQLgVO2d9y2xqfTYqlAKvKs9vTnOgvSAJmVplhyDbN
	UlljN+baqzk85ixRlr20pm+E+UzLjJhHHVA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0mb7ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 08:07:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34cc8bf226cso4859574a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 00:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770106043; x=1770710843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aj8+pAYTZe6c5Ex+saB41vaGVimbskW7CCOdDiVYdno=;
        b=SqnBjJXkd8ACeYGevAyNdMpi+iAoehlOcx+DpIXnyjXE57THGKNU6h0UNpfYov13gX
         YstIxmbIooDy763rsoF1NtqERtK+hDRunQoJfKgc/wE776StfWbh69/VadweliGmiCVl
         7DRsAZinkRB5+AzIt9/ni2CR1fVdKZykRsa8r89BHtO36bGtdVEDHWTM/h9VMXJIKALY
         3od/1l6LyTD4dO00EVbflQSeZ8cY0Jl0SPqkM46rG09eZZckl/JdxRTn4cADr/2/cFbr
         Lyx1c1oJzYNYjACKokvdJaJmwxWhV6UimUkHJoXhxym8BQA5WFtNuwET7QBH0kEj+al1
         QaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770106043; x=1770710843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aj8+pAYTZe6c5Ex+saB41vaGVimbskW7CCOdDiVYdno=;
        b=WtwMwr/fcGnrcV1aRtC+q2XsOTpuLTx6pTDsdVuU/DAx4U3Ff1uwd9vcdKFUj0ZZkw
         YDvtU3b7N3R4mX+/eH0pviRn2Fa/scDQEwZnygNTTIL97pSqtToGU3fG9PAlCSVHi/lm
         SoO+fYNOkmWc6dwyYiLbhnBya8nlUmkMKOgdpMtw7rb2dG9qF9i3//Bq99zCezuYpoVH
         yvgmfNUdK2P8frrubDCHibYm2dq5aQnzSy2DPh+Z9AevxPnj+Jk/gaahIHZw9NvPd4hL
         d7HFl3NcMZyTbCyqxT3TLrUEKVvo8BFyGBwgR/YoTKF/EDsjgyQ4MdCbRcKfVwJLdmsp
         zusw==
X-Gm-Message-State: AOJu0Yz+bwnGswxnXJwn8/1ho44F4pq/8vP5k4w/qQDugReSWdrLpWdf
	P4BApCcmrZpXWoPOm5Pf09vVJMa6luU1ncHYcMOHf2DsVrxgIXgqL2oFng8/jwyty74+DLOz02+
	PD85jb5kDPQ7qBkO3QV4wXZei0Gd4qPxwLwwiFyUZ3VtFbfZjof4j6fp+4+Nv4Sc+7AaR
X-Gm-Gg: AZuq6aIIerghaKaRVcMO/+ucDT8dd1lcGHGMZXnjBIVCCgSoFhOlvWKrdt9FRUKU7pn
	gpsbyiJrDnY8TE4ZvpbstVJV4+CI2iWlNUjcS905dayl2M5d6GhwEfWN8/XBaRwvZmT0SieqpjF
	0nbCagFSSvrPOnbGKpKSPZnH1SixsO1R+tmskbAUcBsQFYQqf9cDxepXofdR9kN6ILRRRyy0SIr
	+IUxDOpKANAB0Z4R/W2afGrb/5OI19zZ2DkRM/foWeqVcsRua+afT/sUaqVzeMLhKvJlrvogaU3
	5zEj81Z3MicgkzEyESvZbEa2L4t/a2XMqnOxcoBbEsC6/j6g5CiNLbcG9J80ABMZv4xGJC5un2+
	E7tpvW2EgdKKj+2HG9wHKEAu1
X-Received: by 2002:a17:90a:e710:b0:353:5c16:aa7 with SMTP id 98e67ed59e1d1-3543b4007c8mr13225245a91.25.1770106043131;
        Tue, 03 Feb 2026 00:07:23 -0800 (PST)
X-Received: by 2002:a17:90a:e710:b0:353:5c16:aa7 with SMTP id 98e67ed59e1d1-3543b4007c8mr13225210a91.25.1770106042541;
        Tue, 03 Feb 2026 00:07:22 -0800 (PST)
Received: from work ([120.60.74.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c22672sm17865275b3a.51.2026.02.03.00.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 00:07:22 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        stable@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH] soc: qcom: ice: Remove platform_driver support and expose as a pure library
Date: Tue,  3 Feb 2026 13:37:12 +0530
Message-ID: <20260203080712.15480-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dceNHHXe c=1 sm=1 tr=0 ts=6981acbc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=A3/yxVAzUcVmDczBgoabkA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8UEKqKzBqzOYgcocWCkA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: BFi9_fahrDi_MW5VtZXs6OI343mrEeGD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA2NCBTYWx0ZWRfX7wUGnIwHEXJW
 dM9Nn2DX+Oiyjv2p8anTVIK85Mi0XIgbmvhtGNJ5Y07J2qTRCZvaMQLN5stf9m3rvySVd2KHR3v
 2lqoCeeX0hP3dl/wSvq9NPWhRkSZzbeW1T2sfdX21IEUUsy1SPWmtUTXWj+bMasuYL3Hi4DElY6
 C2L865843yADop6tVVr4eDR0dJLQYqHWx/GSd+fVHJIhOKq+a0vfcR6VdR6F9FHD6PHgxtEB3qP
 xmnboubLZILrz/nNm8ejZd7oT+xlRYsTx8KNG0jfU1fDKZPbJ5OdJQAw4DIoiehH8H6IvvPv1sy
 DCYFZcWA+x0FyG0hHL8E9+c/xEzNp1VeRlPawEAN1bgCEvemv61Nixd/nOap4YiEICIVfVL7WFW
 Qdu4jfWdXyBzO4GRQ9Z/pPVjw0+4m+8AYhg34CIXHzlPVkm8yaoxExmAbd4dIrqpAntOzIXpfrX
 ZjAdYjp+WVS8ghYIv1w==
X-Proofpoint-ORIG-GUID: BFi9_fahrDi_MW5VtZXs6OI343mrEeGD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91615-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F1EA8D60E6
X-Rspamd-Action: no action

The current platform driver design causes probe ordering races with clients
(UFS, eMMC) due to ICE's dependency on SCM firmware calls. If ICE probe
fails (missing ICE SCM or DT registers), devm_of_qcom_ice_get() loops with
-EPROBE_DEFER, leaving clients non-functional even when ICE should be
gracefully disabled. devm_of_qcom_ice_get() cannot know if the ICE driver
probe has failed due to above reasons or it is waiting for the SCM driver.

Moreover, there is no devlink dependency between ICE and client drivers
as 'qcom,ice' is not considered as a DT 'supplier'. So the client drivers
have no idea of when the ICE driver is going to probe.

To avoid all this hassle, remove the platform driver support altogether and
just expose the ICE driver as a pure library to client drivers. With this
design, when devm_of_qcom_ice_get() is called, it will check if the ICE
instance is available or not. If not, it will create one based on the ICE
DT node, increase the refcount and return the handle. When the next client
calls the API again, the ICE instance would be available. So this function
will just increment the refcount and return the instance.

Finally, when the client devices get destroyed, refcount will be
decremented and finally the cleanup will happen once all clients are
destroyed.

For the clients using the old DT binding of providing the separate 'ice'
register range in their node, this change has no impact.

Cc: stable@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 100 ++++++++++++++++-------------------------
 1 file changed, 39 insertions(+), 61 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index b203bc685cad..b5a9cf8de6e4 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -107,12 +107,16 @@ struct qcom_ice {
 	struct device *dev;
 	void __iomem *base;
 
+	struct kref refcount;
 	struct clk *core_clk;
 	bool use_hwkm;
 	bool hwkm_init_complete;
 	u8 hwkm_version;
 };
 
+static DEFINE_MUTEX(ice_mutex);
+struct qcom_ice *ice_handle;
+
 static bool qcom_ice_check_supported(struct qcom_ice *ice)
 {
 	u32 regval = qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);
@@ -599,8 +603,8 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
  * This function will provide an ICE instance either by creating one for the
  * consumer device if its DT node provides the 'ice' reg range and the 'ice'
  * clock (for legacy DT style). On the other hand, if consumer provides a
- * phandle via 'qcom,ice' property to an ICE DT, the ICE instance will already
- * be created and so this function will return that instead.
+ * phandle via 'qcom,ice' property to an ICE DT node, then the ICE instance will
+ * be created if not already done and will be returned.
  *
  * Return: ICE pointer on success, NULL if there is no ICE data provided by the
  * consumer or ERR_PTR() on error.
@@ -611,11 +615,12 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 	struct qcom_ice *ice;
 	struct resource *res;
 	void __iomem *base;
-	struct device_link *link;
 
 	if (!dev || !dev->of_node)
 		return ERR_PTR(-ENODEV);
 
+	guard(mutex)(&ice_mutex);
+
 	/*
 	 * In order to support legacy style devicetree bindings, we need
 	 * to create the ICE instance using the consumer device and the reg
@@ -631,6 +636,16 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 		return qcom_ice_create(&pdev->dev, base);
 	}
 
+	/*
+	 * If the ICE node has been initialized already, just increase the
+	 * refcount and return the handle.
+	 */
+	if (ice_handle) {
+		kref_get(&ice_handle->refcount);
+
+		return ice_handle;
+	}
+
 	/*
 	 * If the consumer node does not provider an 'ice' reg range
 	 * (legacy DT binding), then it must at least provide a phandle
@@ -643,41 +658,43 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 
 	pdev = of_find_device_by_node(node);
 	if (!pdev) {
-		dev_err(dev, "Cannot find device node %s\n", node->name);
+		dev_err(dev, "Cannot find ICE platform device\n");
+		platform_device_put(pdev);
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	ice = platform_get_drvdata(pdev);
-	if (!ice) {
-		dev_err(dev, "Cannot get ice instance from %s\n",
-			dev_name(&pdev->dev));
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
+		dev_warn(&pdev->dev, "ICE registers not found\n");
 		platform_device_put(pdev);
-		return ERR_PTR(-EPROBE_DEFER);
+		return base;
 	}
 
-	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
-	if (!link) {
-		dev_err(&pdev->dev,
-			"Failed to create device link to consumer %s\n",
-			dev_name(dev));
+	ice = qcom_ice_create(&pdev->dev, base);
+	if (IS_ERR(ice)) {
 		platform_device_put(pdev);
-		ice = ERR_PTR(-EINVAL);
+		return ice_handle;
 	}
 
-	return ice;
+	ice_handle = ice;
+	kref_init(&ice_handle->refcount);
+
+	return ice_handle;
 }
 
-static void qcom_ice_put(const struct qcom_ice *ice)
+static void qcom_ice_put(struct kref *kref)
 {
-	struct platform_device *pdev = to_platform_device(ice->dev);
-
-	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
-		platform_device_put(pdev);
+	platform_device_put(to_platform_device(ice_handle->dev));
+	ice_handle = NULL;
 }
 
 static void devm_of_qcom_ice_put(struct device *dev, void *res)
 {
-	qcom_ice_put(*(struct qcom_ice **)res);
+	const struct qcom_ice *ice = *(struct qcom_ice **)res;
+	struct platform_device *pdev = to_platform_device(ice->dev);
+
+	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
+		kref_put(&ice_handle->refcount, qcom_ice_put);
 }
 
 /**
@@ -713,42 +730,3 @@ struct qcom_ice *devm_of_qcom_ice_get(struct device *dev)
 	return ice;
 }
 EXPORT_SYMBOL_GPL(devm_of_qcom_ice_get);
-
-static int qcom_ice_probe(struct platform_device *pdev)
-{
-	struct qcom_ice *engine;
-	void __iomem *base;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base)) {
-		dev_warn(&pdev->dev, "ICE registers not found\n");
-		return PTR_ERR(base);
-	}
-
-	engine = qcom_ice_create(&pdev->dev, base);
-	if (IS_ERR(engine))
-		return PTR_ERR(engine);
-
-	platform_set_drvdata(pdev, engine);
-
-	return 0;
-}
-
-static const struct of_device_id qcom_ice_of_match_table[] = {
-	{ .compatible = "qcom,inline-crypto-engine" },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, qcom_ice_of_match_table);
-
-static struct platform_driver qcom_ice_driver = {
-	.probe	= qcom_ice_probe,
-	.driver = {
-		.name = "qcom-ice",
-		.of_match_table = qcom_ice_of_match_table,
-	},
-};
-
-module_platform_driver(qcom_ice_driver);
-
-MODULE_DESCRIPTION("Qualcomm Inline Crypto Engine driver");
-MODULE_LICENSE("GPL");
-- 
2.51.0


