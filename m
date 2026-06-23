Return-Path: <linux-arm-msm+bounces-114203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id woVENkF6OmqZ9wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:21:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0FB6B7079
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:21:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EQTbTof3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZMA6CV5j;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114203-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114203-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB4CF3074B2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977E6250BEC;
	Tue, 23 Jun 2026 12:21:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAD43D566D
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217269; cv=none; b=SyL3GJJU+ckh9pTGNSId6VEkkCj1H96hhooh1MZpJm3nQ0uZ8fFUmYenQ9i8IXwbL62aD8CNO0bMAlqKrqaATzlHKg8rCHCTJmenYibzV/aYaevQpqB7QQpHqQ+kDKJA5r/auwt5/mOS/5WoYNW+X2nFy5/gpJJExRyCTJHMsaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217269; c=relaxed/simple;
	bh=loQz1tJcYMIGFw11KS+gtAGNdvAMNzaMxWhHX4ioyWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ueZM/2H+5+Tqd89ft7OuS1Yk272xEpSGW7Gszm6yRu4FKZEMMrvRihjNGnMgVaygIy4tmiuIVM2DYIm0KnPlincbx+maqa3jfJdtEJkaZVdetNZBSmdfMSKIDAjTTlbbdyPfdSUJ/MCXKvWJTHjz4GYqp0aaHdr61fgTFlUHFOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQTbTof3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZMA6CV5j; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NC6fcx3744622
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MfokqFYIIsc
	fSWuyK7hBpD3TjL2GPJaI85B2LM0b6Mg=; b=EQTbTof3FJoBbonQtk7mKD/la1P
	r9xxtDLeOePXM6R+o/pWuJkCB1CUiQIHKtd/LpabVN27DFNcrpCneq5IycM3U+4w
	j3J0N1Pv5ik1v0GY3rj0VvVDXxyzgrObgrlURkughRqd+6n2eX1+p8blA78w68++
	Hry+AOfqPFgN1m6HRAloAAHLO19LM9e0Z0WQgpZumFZLdqyjyWahWWecPjXqOQSJ
	GdJupjb4SXNBG0eI8b7HszdRbbsh1VQP5ZT2gCcFEXnuNr03tsE6RRTFZ6Nu1GxL
	sbvlawWtv/BZr8tZxn4aOQUBqKDW0Oe/7y1M2znNn3cqZxmYhlvGON7CiiA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eysv3g1g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8421ffff8a3so6386531b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 05:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217267; x=1782822067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfokqFYIIscfSWuyK7hBpD3TjL2GPJaI85B2LM0b6Mg=;
        b=ZMA6CV5jFDJd5wpZ5ep7E88fuxygEfLrlilIQf6S2moXx5rAZ6Ko4eT7ZmT4OYmlDX
         1Q0XfUBLI7Y36WEiEmdOfJ1t3nMn4AbIOMn3urOQOVGI9TMRrqw1zAgrb2acaL693Uow
         TqxXcuMEbj0I2kz+gLkGhl+cMCpEQZl9BKgC0gLwq2YMLs+X3DcncG6qrTringfwrBDm
         Al6A8v4+53RpebXWYS8hbtbwBKFjloMsONMSdpiHysQHgPReAC+Su1LX0VWnLPIQ2HiW
         tzSO5ANfX7uqDqAtTLRnRkLxl2y1N7u9gNkeby7D90bTFqLXLTcmfLE23HcdE7JCjAsc
         ekeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217267; x=1782822067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MfokqFYIIscfSWuyK7hBpD3TjL2GPJaI85B2LM0b6Mg=;
        b=rhXBky8cqt/KAknddkCG6u8PMPzuBNEz9L8DLo+PxYxIyEu4zDBxmDHholc2I1W70r
         PTAtjKvDBKbosSs/4Lb8GMiRyZb1SB342S3wyL4uu8XJYs4RQKMvdYIor6Pm3kpSkkTw
         X6aEeraihAoCwNEro8gw43DSUv2sPjS1bugua+1vQM+M57Wt1CzvTGcqraYLbHY4Qk7j
         xHsKU1UbmcSUvk0FgoV8vA8GnGIdyMzgqfJFL1MoJmDxoZ7kohw98uOGqf7oN2YdyMgA
         YDSBKFI8d2DWiA49sAYMcFfS17HFTlxvb6IzKLv7t4WXPe4QnGRcUkuCQdyfGt/j9M8I
         ZjMA==
X-Forwarded-Encrypted: i=1; AFNElJ8mfIjN+3+MaQAkA8ycHqqNBqx3QRh8VPuRbJ+l+0RObbCpVhBdGS4O/5ATgOsebmVOCS1m9VO5JX1YP858@vger.kernel.org
X-Gm-Message-State: AOJu0YzGoWbmSvD5tSSNp6UZeftIcdJ7YsyiQxqZB5T3Y2mrKIcPo7Ij
	i57gaLPEa/SeIRKQ4/i4iZ/uu1F1YTLH6FnItWNr8MZSmWmEzZY8CfDM3aoIdTeqLWwLB4BOUX9
	SBf99g8fYH9/P+HqxQLbFNT5UaZIkNtx9WzIr1jh+kr7M+4kEuZPCBV0ba8w2PyfUIZJF
X-Gm-Gg: AfdE7ckvo21kGgZyHYsiY26oR6cXs2idSI5txuZooI+G4qs8Y4jznnwhAyXxdANCf1k
	11vd0fE1VIbo8cdBIIVmzH9pCXHU+lnbGIwotamxi8kmLUg1ajp0mOrvSIDj0PJDiObgU0qzjmc
	uzuFUI3KCbHQfPvYqH3OjzCtW7tAGykAOc8oROTm2YNsty2hzAQeXFbH9EwnE9jNDFSX6OBpXw9
	cts+Wfz7c7S7mx4NpW9Sh/1VDFcHIfGFBCAL0FiUJ6BJTkOfslDyBDoMkJ6oG5txd4l7ygcBvl2
	5DV4Pa2+mN3ELnZ0uhGVvH0Zu1N4ZdIJMjv144STRAiZ6rN9Z1bMyytxtrs5rBQjRzYJrmTsdTZ
	h42FsDY4tFhBSWuimoDvE7UuBZk9Jk5zLvC8YPA==
X-Received: by 2002:a05:6a00:2e22:b0:842:6c02:2fa4 with SMTP id d2e1a72fcca58-845952354fdmr3159960b3a.14.1782217266745;
        Tue, 23 Jun 2026 05:21:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e22:b0:842:6c02:2fa4 with SMTP id d2e1a72fcca58-845952354fdmr3159923b3a.14.1782217266179;
        Tue, 23 Jun 2026 05:21:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74646sm10171856b3a.29.2026.06.23.05.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:21:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/8] iommu/qcom: Fix missing pm_runtime_disable() in qcom_iommu_device_remove()
Date: Tue, 23 Jun 2026 17:50:28 +0530
Message-ID: <20260623122034.1166295-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX62Pa/BucLmvg
 2k57cA4HPgF0u4v3FdpujDOl0DGDHy8K5Bcnxf9nlkqMy6o4ELtbHlMjotnrQZYGfSmvs1tLJJ6
 zbf81RkgLua23KbNSopQ7gDezp/8nyg=
X-Authority-Analysis: v=2.4 cv=WtAb99fv c=1 sm=1 tr=0 ts=6a3a7a33 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=NButBYuML4y5tsQ1waEA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 4v4D2xCylcp1KWmMad-AtE49fdOD2Kve
X-Proofpoint-GUID: 4v4D2xCylcp1KWmMad-AtE49fdOD2Kve
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfXzURL3aBWGjj2
 VUGB2pQ7AQPNEalHeHfy4aoqxl0YAB4KZqrLQNMQozwo9wAxB1N87dfBzvs6r4VK2wZ5qltoXdp
 b8xJkbIlsO1txGRfrb8A//pLYRPsddfSDCFGJoj5lp+JYpWbvTROq4OHJAmvdrzFpRREIqvL0bO
 2hNK0B0rFbU6qFQfCLRVddf0vl/c/aqBGLrOfXSd8M2ODo0wEux+gqDebHzlCk5LUsgDhLvrqMD
 jLTLhA7p2bi5VL/rosWCaq1k0bANDLIiwVyX3auTDzD96Xx/ewfSB1kK02h7LVopaKjVxVNsXR+
 0W/Pa6CaB5FTrmlYBdH5iziujzRkS4RBk93/phxJ7Yw+virq6iuPVcmxM9+JXe/R8dKIwxA/tlm
 Ah7N09QVDPyzDmU6mzHoHfTMVC102fN3vW95tkvrc6RYMtUW9Yrwla0d9qkaKzOhGYTm1wu8Bid
 KlRigj26jxl6A+peSiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114203-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:joro@8bytes.org,m:robin.murphy@arm.com,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D0FB6B7079

qcom_iommu_device_probe() calls pm_runtime_enable() but
qcom_iommu_device_remove() only calls pm_runtime_force_suspend() without
a matching pm_runtime_disable(). This leaves runtime PM enabled after the
driver unbinds, which can cause issues on rebind or if any code races to
resume the device after removal.

Add pm_runtime_disable() in the remove path to balance the enable in probe.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 09f2ee6be988..cb43276f4a39 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -878,6 +878,7 @@ static void qcom_iommu_device_remove(struct platform_device *pdev)
 	struct qcom_iommu_dev *qcom_iommu = platform_get_drvdata(pdev);
 
 	pm_runtime_force_suspend(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 	platform_set_drvdata(pdev, NULL);
 	iommu_device_sysfs_remove(&qcom_iommu->iommu);
 	iommu_device_unregister(&qcom_iommu->iommu);
-- 
2.53.0


