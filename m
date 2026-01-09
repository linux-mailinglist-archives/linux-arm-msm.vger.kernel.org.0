Return-Path: <linux-arm-msm+bounces-88325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA32D0C34A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 21:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F4743016DEF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 20:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF94227CB35;
	Fri,  9 Jan 2026 20:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gO+Zu767";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iUaWWTaV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8A319F48D
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 20:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767991564; cv=none; b=jqN6xwEWRe5eTBza4ZUnmxvL7Yg9DHF7aNjZubjjbBtclAbg6SOcp/gYtydmBA/+oQUUSK/FP4usJ9h4q8QRSulIKtiXjV/72GzfdfpcHTpNs13yf1P5uyux30bYd8WEHKR2P2Bj8jX+hQpltZGJZAZPydvNldTiHpSUAo28V5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767991564; c=relaxed/simple;
	bh=mJMBo+OyY3l+Gom2loMeyZ4DUTc1rvxg1Ev64Cw9OyE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c73orjdFkEboSjfPFIBaamToKMEb1C7FCJ0sipppZhqTAvYRqTgROt4pmGGynrmOMdQjmKmbfGMS7M79g6gWrS5ae88MOT95ZIvzV3fjkkkW7e7hjCzZyYMWapntgUNO4haiX3+51olooQs9x9QgovPTcMK5U77nsGwAjXvGPfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gO+Zu767; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iUaWWTaV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609CUCju3542137
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 20:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e648/KtOd0+
	RWrEfcZlx4oczML3wOVmr8Cexl05A+BQ=; b=gO+Zu767jwDZ3VsfCcLLL2d50tU
	hQM/uMVpQYH9iqo+ymM6vtQvfBkwMU1flEUBgA1+GgwnWFA7c4DW1AGPShZmuEcL
	aAkLHgFmGJFudwCRJDXvf2Un3FNugrgNBFQQIIBzWIeEbkZDvmPB6VC2mwjY7nUr
	d6l8wdsrQ+4gp7E3Lve30fs5DN1Gi1Wje/gmDyntyTs32OqYrMnTNBj3hInmdno7
	T+e4wq0oUPLmvBcaLwQ74jZqxYmCmi5CyueU+pgqSD/UsQAQxrzM31BCYWhrATDw
	C1UC8xUj9iyJr3TgGhtSw6RJnIULwYahG0xY3c4sUzelTBoP+o9odBBTkZA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bju6b2mg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 20:46:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso4309926b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 12:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767991561; x=1768596361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e648/KtOd0+RWrEfcZlx4oczML3wOVmr8Cexl05A+BQ=;
        b=iUaWWTaVmVZd75rD212YxHks736K+UMih/DEGNYPK1AqPG1SI590+t4ZuYR0Nrb3/w
         kpOgB1jhV/3U+ZrwT+YhD4adljT/FakPzdR+RNx0QrWt6l18kbo0colg+BcXLSmFL3D9
         SAtZmYDzn85nuOuhB2X634lvYOGbrqQGtYaVhadXp8rxbSnoQ1ze3vVJeCMM9oboU9JN
         LAve4MoT++yDT8O0m9ykWy4oFBu23tuTRgTT9+kkkUE0tl/KjzVB0p2fKoxxL/vLD9Jn
         2s4BkpFaQgAe2zLZljUtwvvBfypDCTPVA1xXxUmIed9g4tHd+N7K4wdH7Zuit8MdCf6s
         wOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767991561; x=1768596361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e648/KtOd0+RWrEfcZlx4oczML3wOVmr8Cexl05A+BQ=;
        b=tYhRkXqGpS+4G3gIt23GnuKn2QbhHdjebs1eG4UhTU7kGsI76bX3+lYMXEtn/gqbQ0
         enz/rxfyN4SQRqczs7TVfJZ85UT5kbi22KPb+RhnnTDz3mrYtPd9OUIPrX6AxCWAUAso
         1aALTjHeRAfScy7XYTt5Zi2kU63dziJHOiCzla1sXZldafAN7UoZl6GNNqFEdW2Lnukr
         m7jCoskKUHdBrf9tvX/sHtHr0QtY1HR9/9eYC3UduCM0APkIG+uDVnOR12GB7mOnzHGh
         QpZywFRUIZc6YHDr9d4fyA8aheYzZ+UcJAcez87dNWRsqhzwoFQCX2RRUzxEw1vA444l
         mDpA==
X-Forwarded-Encrypted: i=1; AJvYcCUJJwY1kiObcz07nDzPKFk2r/FZxjp22NzHvjyaOI3WzIh/mcrRIn03VpKtL+BzwIplWfl5+o86BJ4Uivb7@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ5T9jiIRLpXSeE4mSCMHCqr366pz6P8yobinJFpR7L7AsY4Xh
	DzGGwCd1PVWcqtYr1dG+3skjgcN5I+LYhy2UeVPfleFvk/JGO60SE8AD8cbFpcjlK/HcrODUiXN
	sg/viVtmQqKnN1q0RaNa77zKwKfBD5Jj0kmA5Somx+wyiJSep+EBDLO6v9g3frbRgX/Ej
X-Gm-Gg: AY/fxX4X/Yi6mbJJmLn5d07A6xmzDEUqTvvummSWFAq5sclcaUdShRk6D0/BXOo20ta
	nEBTIhnOqNGsmQTnZ+M8bzgylzX/+xNriW/4bKP5goBbXq8ijdNyQSRsVNCN6I8bmncJBkY4wOo
	EMvQwHbaJ0ZYSj0FPmhy8mf1WbKozyHQ4dn8tPoKQmofbm25nxPJQ6PcqAMQMLgkN3WG4qS2HwT
	GuaWhHGQCePo2rYW7dq83HnlqRDAnBjZdDxFoH1mItA11wOT/ea11ndmisRSW1B1rrGole8iGTa
	Vt2Mz9Db/XNnXAuoahVi/wSPGDa+riky1cLm+aHJXW3vIS/17IETUe9B36KEuruavLH2FJfDC86
	KGd4XAElSRHYE0WJKr+EbhvcOGEYkDpyno68f8reJ
X-Received: by 2002:a05:6a00:3003:b0:7b9:4e34:621b with SMTP id d2e1a72fcca58-81b7eb27c78mr10510815b3a.12.1767991561286;
        Fri, 09 Jan 2026 12:46:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqjv0b7lCDCbINP4r0dTLyev/FwhW0Ax5Z9VTaH/LlqyuxmnOU3MdXKx8Xj1jiP03kXOMtcA==
X-Received: by 2002:a05:6a00:3003:b0:7b9:4e34:621b with SMTP id d2e1a72fcca58-81b7eb27c78mr10510795b3a.12.1767991560769;
        Fri, 09 Jan 2026 12:46:00 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e6772688asm2485752b3a.45.2026.01.09.12.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 12:46:00 -0800 (PST)
From: bibek.patro@oss.qualcomm.com
To: will@kernel.org
Cc: bibek.patro@oss.qualcomm.com, catalin.marinas@arm.com,
        charan.kalla@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        iommu@lists.linux.dev, joro@8bytes.org, kernel-team@android.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robin.clark@oss.qualcomm.com, robin.murphy@arm.com
Subject: [PATCH] iommu/arm-smmu-qcom: Restore ACTLR settings for MDSS on sa8775p
Date: Sat, 10 Jan 2026 02:15:51 +0530
Message-Id: <20260109204551.845959-1-bibek.patro@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aWDsFoEe7PHQaL9F@willie-the-truck>
References: <aWDsFoEe7PHQaL9F@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDE2MiBTYWx0ZWRfX0Q64NpwaOVAl
 d+VLmqJcc0tK+y3nZlKyUfIYcRhgdaldlOENRQtQEC1VPc1Vmsuldln+F7GzJyhZfVcRhymS18p
 7ef0+h3zRH4SCzjaX1l+F76BIwpeWD+STrnQBpKTLU4nqmAH8QJ3BOInsXPfuo/WvNgQYqTDiRc
 QpWEtp4wHQOF3n9r/0OTZlE7Dgp1zw4DiQk6IavhI4bmQ8K/ADV98sK68yVu3XrbIKUTZNH/Ixz
 qQ4oTFl6ZL5ZXrvMGf3ZQNBBzWZ1HtCRL9PHBngNAhJYnimWPi8iPUqV2TFm0ubRiWOHSgbnOGW
 QEBVf59+PXUlj1zGwlM3SHnhvCPCQ21K9L0z3HEngpRzU+4iuSGpwgZCmsjLHgQvke6xfGSm2Jv
 TAo9kyzVij8JJEt8Fiz3BOnlr4pIPKtrCVseOPf2iAJOkkZAyj+dRLDJppPc4dtr1G4BkBgyoRH
 5N3X5oGPKguLsUTD3aw==
X-Proofpoint-ORIG-GUID: snIiFtSssisGCom3MPTOcYogJI_964DV
X-Authority-Analysis: v=2.4 cv=V+5wEOni c=1 sm=1 tr=0 ts=6961690a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=X4sqO_BnIXgP0qhT90oA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: snIiFtSssisGCom3MPTOcYogJI_964DV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090162

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

The ACTLR configuration for the sa8775p MDSS client was inadvertently
dropped while reworking the commit f91879fdf70b ("iommu/arm-smmu-qcom:
Add actlr settings for mdss on Qualcomm platforms"). Without this
entry, the sa8775p MDSS block does not receive the intended default
ACTLR configuration.

Restore the missing compatible entry so that the platform receives the
expected behavior.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 456d5146831e..718d102356d9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -43,6 +43,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,qcm2290-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sa8775p-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ .compatible = "qcom,sc7280-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
 	{ .compatible = "qcom,sc7280-venus",
--
2.34.1


