Return-Path: <linux-arm-msm+bounces-114204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DVEzGPR6Omrh9wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:24:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9CF6B70D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:24:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=h6Dplp4l;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O5JMXYie;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114204-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114204-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E87E30EE148
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA4C3D5673;
	Tue, 23 Jun 2026 12:21:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B053D566D
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217273; cv=none; b=ldUPqKBSRG97u9DzqxrCXPR6VwOVs+R7H+WvLvUsEm3GWzhn/Y80bZ4HicgsHTnwsLE3XhMYwQ02qpYmkEHvSbIkUDwFO1mYXX4gvf5GCtPqsiyGbNU2/Gh5V4xYdrFgdPytSSv2+9ZfFbvWWRIsBzTBEfgWqAyX9OEvyQfyfWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217273; c=relaxed/simple;
	bh=Uisy2K09oTgbBqztVQlxgX7d4yg7HllsKs/lCKvqdFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R5t0X7DoyPoc3oyocLBlH1EcJD3x+FCS7VrLSOz2zHlsTdEQM6F1EeMPiFSENVDCknqgDXE2lU9/NeNEkSkI39TaQveqDvTXcLiatCnNGcUAh8GWYsYpsQ5PMs0Vi165XgS/il/XIyHjlJCf17M0dtvQ3wCl9EIOo8AceRWOCm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6Dplp4l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O5JMXYie; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXoA23668842
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0RnWoMIES/C
	zkhCcSsrHFJ9LX/JyT5AxMedV2CmbIQA=; b=h6Dplp4ljdptQgfUK5V2C5mLp4x
	af2n8dcAiyqdVAfwqqGG3GuI6/2JL1DygKH0XWGHK5khXCzA+EyhUV0g8GNKdz9O
	FBCfxiKNc9l/wubjXek2MK6sUq2P/H93HITVkwqAn3H9mPMAbxBWH4tUSpuFWfPV
	7R9K2ijtYtqgBuLURQdWyOaLEZpAs82NRZaiqP8LXdLhOPDB9BP75tR/aVJ3IlW5
	xr4eMMPBzxOcrrL4UouSQ6KCVHvCnt1pL4G71F0hm/HzYOK85o6W0T2KmZ3o7/2y
	ICYCviZ94Vk5vX92F1SV0UKY8dsJMTutI+r0NF4pjDB138rlixUMfZbMQrw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppygwwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84534f17866so4624819b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 05:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217270; x=1782822070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RnWoMIES/CzkhCcSsrHFJ9LX/JyT5AxMedV2CmbIQA=;
        b=O5JMXYieW99OR0/glNSGfEVvoE3XIlGkHOli8ThoCeKn/vk22GNvLQjUT0zRlx4IMc
         XuekdTJtt9vbpuUxPjkZE0gDn8Gsz4cyuk5WifoF4U/YEW5qKHcYZRMu4y3nAJJWsdcH
         GT3lj5My77H8Oy3sDBUTB1AQMucO/Y1uL0chUTNCFRSINf57u4J53VCS8H6XuI4sT3cE
         JaQNsSe5rJjb3obUS9tHangwsRwNDaNF9UFvBhc4vtbbgjVNNCp2BbAv+7T6uEaQspiz
         ysxQtgIcptOJviU0/Ko/RwFUkQOtseWmIEVQDH9yVQaLUW9kbjvQZPsY3riduHVGghLx
         8GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217270; x=1782822070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0RnWoMIES/CzkhCcSsrHFJ9LX/JyT5AxMedV2CmbIQA=;
        b=XIXxywJ0sScSZ8unU5VRev3O3wTl7q2BC1zsHu4LoczWkVuWyoODC5jXOVUnw9Odu3
         9yZ7eNUbyRQKqrbFyDg1PgtFUe79oAvLQz/ZzM6Bg0iMCMDi+mBYmGIwaSh1GlcMKEDa
         LiD0zKJVkACBcCfI5R6hvMigtzii5hxzZ8js8JhVQSe03uWaJH0Ri6qWq+VpCtRjS49O
         Eh52Vy03TsddkaSm6nWuLYA6q1xtwA8+/URI7z57GbkwWpiGZmRu9LFHBpT/t2r6PYuE
         dDjWM7hBAGt3MqsxvdtS7cNgqFZlTPHk2Rv5kEQ81Do9dZMFAUAL06NFseOaDQMomJaL
         HRvA==
X-Forwarded-Encrypted: i=1; AFNElJ8oP7CMaAGg6A544l4abYZ4lUpPQcG/KBQBvZw3fDuQpuGBETnFG/W1r3oQJdItIhVKjLsyamlBszSvlBNJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwoHkJ0FXrmuTtGQsS7yXxKUK5Vb3HZUrK0NXW+MxlGbHdfNj5w
	O/xhMKIsTuifj0WRaSf5ZDYUw5yormS967ffhqqHnjYJmViIpBCwq//zSaMdKbuQ3pDiQKJzRFW
	8KXS58pJmRSlTe4fKP/P9jGLG+PyJ6R35weGPGgWUzTPcPjmTt2JL7Gp3Z/OwUFVH3d5k
X-Gm-Gg: AfdE7cm5n6RKbCuEPJiKPUQNuoKf/gJsRl/VAzL/wL+ZuobhNhkm7i/JMV34YU64/va
	KZ9oJU/Geh2brn8lkd3LaXUtEL14HBRWIQJ6DnuJM1DakVicX28yGKJhEF15mKrv30FcVFHUDDl
	s9D6cZyYOgMYLb9JZh6ZzVWAcdvvdomZlXL29McFgVv9KPckCWSwdds3oxphirJOVWjQeEcWDuP
	23RuaeVEZzX86Fsc3FenerJCTKgaBOyGtZacVx20fhPgukHXWEzGNJRVdUfbJChKaOKHIzRDTGX
	rcVzmW7ZZk8B938et9Qgw6QKG5TQAASyb1OV2iylMxnMcvYfZQ93m7VJRoNvdRy4IVmuRGkKO1v
	YC9uZFmTCBxO7v8/v/ekYqkiDGW34McTsPze95g==
X-Received: by 2002:a05:6a00:1408:b0:842:5b1e:5908 with SMTP id d2e1a72fcca58-84562535544mr19225474b3a.25.1782217270031;
        Tue, 23 Jun 2026 05:21:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:1408:b0:842:5b1e:5908 with SMTP id d2e1a72fcca58-84562535544mr19225423b3a.25.1782217269487;
        Tue, 23 Jun 2026 05:21:09 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74646sm10171856b3a.29.2026.06.23.05.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:21:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 3/8] iommu/qcom: Check pm_runtime_resume_and_get() return in probe
Date: Tue, 23 Jun 2026 17:50:29 +0530
Message-ID: <20260623122034.1166295-4-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX6F++lbcM22aM
 1qnEKFxjEdC1zFp4v5b69GuqDfpYDnuFqsRkgHMLEfAfJZg/4AH9AdzlDRAPSED6GRaTNTfR7LM
 jpimC3j38kUkQdr0X+O/Lb4D6ZLfx70rXEBtnri0dYTpj6lMvmlI8ZzaRyyw72n2wCJE7kJKdWk
 u7ucb0IysdmQ86B4HZJQ1aN52J5idZY4trKpepcsrXBJFtgCmEKqOGuha9XtdcExWWnh0Lxk1hH
 UFG1Q03fqIQSUWJkoUZlukSWXm/qCU122p6R+6zk8gPkVJpmzorN/OaN6ZI/bvq13MHEYmPvR47
 V+DbyNsDCZHjBgqs6QngIoAFf2LYBc+BBeNW7TrVGe/CTziAgWomZjdClq9EJ929gXt8uLFDJ4U
 hKToqzs9pBBowKB4ew3vPed1WUr+q7BORqpf3vLJ+8GCX3QZD5kwra0qbc2/VGBOHVipGR6Gtbk
 dCrWy8KEKPMoYr6gc6g==
X-Proofpoint-GUID: FvqIfuLLKl7ZQRvYJ1PhkMTIlr4DJHuO
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a7a37 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=uh9JkKNIBQsmCcNjqRkA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX06qyg1/UPTpk
 GUd40GzZQBRa7UgQw73ATSa7V6MrMfjBi38oFUawByk7Wg0UDvaJd1B/rQ9L5oA75vV1J3kAbQ7
 8o/XmMd7UKXjn7nPTIC+/7qVTwGRwzU=
X-Proofpoint-ORIG-GUID: FvqIfuLLKl7ZQRvYJ1PhkMTIlr4DJHuO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114204-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE9CF6B70D2

The SMMU_INTR_SEL_NS register write in qcom_iommu_device_probe() uses
pm_runtime_get_sync() without checking the return value. If runtime
resume fails the subsequent writel_relaxed() would access hardware with
clocks potentially disabled.

Switch to pm_runtime_resume_and_get() which handles the usage-count
cleanup on failure, check the return value, and unwind the already
registered iommu device on error.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index cb43276f4a39..4e714a8e1fac 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -859,13 +859,17 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	}
 
 	if (qcom_iommu->local_base) {
-		pm_runtime_get_sync(dev);
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			goto err_iommu_unregister;
 		writel_relaxed(0xffffffff, qcom_iommu->local_base + SMMU_INTR_SEL_NS);
 		pm_runtime_put_sync(dev);
 	}
 
 	return 0;
 
+err_iommu_unregister:
+	iommu_device_unregister(&qcom_iommu->iommu);
 err_sysfs_remove:
 	iommu_device_sysfs_remove(&qcom_iommu->iommu);
 err_pm_disable:
-- 
2.53.0


