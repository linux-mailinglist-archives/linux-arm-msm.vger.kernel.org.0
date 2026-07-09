Return-Path: <linux-arm-msm+bounces-117973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5lNeLZyWT2o5kQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:39:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 747FA731154
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:39:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=M6Lpo7fh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="LbS/ZlYh";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117973-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117973-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 272983050261
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 12:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90FC426423;
	Thu,  9 Jul 2026 12:36:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C677F42CB0B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 12:36:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600603; cv=none; b=eMmm1l5iRB78mNFnsQfoCpvRwNZ3M5Ste4UMHA814KA0CgDDtrnyt/HokgS7UXyWBggG8x7iUOlwuXDxn0pdGdhybIYOwFuaxlOQmdOBJ0N3Nc9S6G57GhNN+3uhyqExqhoxS6KAkVoQIlNBw01lA5GrOHEyARliMJcmQTZYMAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600603; c=relaxed/simple;
	bh=bjemJptZcEnstSo0pp590/SA6Z/0mPTGwSJBOVPEdY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qy0JiT61IRjRCwFT666wtMC2eiS8xlZP8D71y+dKJN+Np7vpNhpsLV2mnQSrft5XctzAqov4JoI7wA+7/vbEa8TG0R3nzWStvjgZ+4heDdf8/CeuL5m3EjZyg7bBlNgjooHjStSRGnuJZLlFdEhJBSbVKIrE/hA6Po5MejTOvVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6Lpo7fh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LbS/ZlYh; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNE4t1537348
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 12:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILosYqx6FKZjf8+14exhzeOaCpHPIZxCE7LstY3E8PQ=; b=M6Lpo7fhcH91/Koa
	7YDpTU5Mv+lW4WsJ8SZD0yUlsePY92ILIjBwPBsF6I/jItybQmxZ50GzuNN+DDH3
	b6smDPueKNdCrDIlr0G/iEA3wtRu1EqSzz8ftL/U9eEyQPiqfZEstFkg+dvbSMnR
	KLoOR5VGj2GrC0kKhBXcLe1PXQWtgd4p0v3JN4bR4uygClmmn26UeE5qbUQtIB6q
	DXBCdefdorPaTyZbN+d3vf66Nzk9MRki+SOm+mMNnatp9gt5NIAHlpFs9VWdXIT/
	p9YtSqB5ZAUeUK8uVS5n8jAGka+whToxAGGG8I8p5Iuqndj6cy5lgkb5K7pa3fYL
	8wQ++g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydtpjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:36:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c892143db7fso1633596a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 05:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600600; x=1784205400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILosYqx6FKZjf8+14exhzeOaCpHPIZxCE7LstY3E8PQ=;
        b=LbS/ZlYhg1CTLmVVT5OdqG7Ep47NXP20UaE4ewebv80E3mbq4c5GlIQXiZZ7Opyq6z
         MDrfCoJAfATm+pmBIegpL8882ANttxrNfwI2eV9b+nptJfSmGAv49AQNjW4FW2icLdUm
         /TmQcrr/6soktjV4Uy3DOuu8abasThCt8kXZJtlDG6ribDOQLAM/gUYyZ5D3ukqpGMDh
         WtpOq6RIQL/X4YIkWE9UBz+6MuuKvZU4wL+LgKgkd5zULh4vPg9QluUZrwqMzlpym0ub
         fxBfsFnnd2i0V5J2qAJYMKCf8SZ2bMxAMKLDj+wTg889AkY5xquJAQQpVLnMIWddRwG5
         oSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600600; x=1784205400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ILosYqx6FKZjf8+14exhzeOaCpHPIZxCE7LstY3E8PQ=;
        b=f39BwXBSbv7bAVU1byLfL3Uq+0FseHjj/Fmalf0Cw8lyzxQaTr2ktHCaf+S/3lnYrv
         XHUOXTTYMQXaXDj+MKvp8W8CMhNLrkaZeMtpt9+sry0ku6wqy2QWqCjII9naEfGBNanI
         S98blwI9rFwdSi6rZLd741jLdfGo907NoYLZIRRufmEr2BSfAoARlkRVVqYekXdyCQYF
         V26Nw2y2QULv2uWDcqiPWqsMf4MuZTaNNsbqJuuVH6yFV5PdX3zkYvPm2u6M+s8xirba
         /MzIxAUrAxVQzvvgdShllXC7T4EA+CK7x8C2EuF73caLt0F5Hh92P76JZdj1CKcCibtn
         bOXw==
X-Forwarded-Encrypted: i=1; AHgh+RousO7yB/rd48lpTHsD3/Ndih70Ng8fHyctbEJbfhI22YYWWjKj+ZJq21gYBGcvB0rG3trpqYWnUfkDklCK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy47LV3h/lV3ku79NVEeebqBhzWf9zgATrP5812TNJr+wW7izBw
	Gisjbhss/hELeOlGPPWe5WJ92Pyc/KVo6fqTcCyp/mS9FlXPAaiFvM2Ri3u4/MWQE9GsadnbsLz
	/P5siJBD32jG0JmrPl3F5/bddvz5jDycoKvKJPvQaYgZK++fOcrEYw+QC5hCIqVJ0pl5d
X-Gm-Gg: AfdE7cmTjsasVV4iYUSxxuYDjr7Ui3w6wsJ0WCsPzJo3WLu/KT+C+VBhyz5yl5fvSpt
	CFk32qyn73Gj+OGRR2OC+qTefkuaLKvy+hpw/azmW04dXRGF8j4da38H0VZSfwmQoAoFPw8ArYa
	R9fb7w7ArgsbW/C/dt7V+SRaC+D0Q6Le+N+ARLZpD7Go+zo4jwl+cM/jlmwNxSrdLogjApJW7Dn
	diKTWW7rV8L7bU+l7MC+GuJjsf2u6SXdGR8AMAOsAVzKtYLwcKrTpDqMqt9GGB2c3tvLtt3Ki6Y
	kqQ+XeAkHjRfFdDokExPpufqsm07YVcgBPrt0Yc6rnPcjwt2sNTuEdzuH2DT7TLYhNvo6EsJPGB
	eRiu2E/VWzqwRynibTW2MSrkMR4l2MflXdLre0OkQ18I3cA==
X-Received: by 2002:a05:6a20:7d9f:b0:3bf:a624:decb with SMTP id adf61e73a8af0-3c0bcfc6ffcmr10152889637.27.1783600600601;
        Thu, 09 Jul 2026 05:36:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d9f:b0:3bf:a624:decb with SMTP id adf61e73a8af0-3c0bcfc6ffcmr10152843637.27.1783600600155;
        Thu, 09 Jul 2026 05:36:40 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:36:39 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:51 +0530
Subject: [RFC PATCH 05/11] media: iris: Skip DMA mask setting to core
 device when IOMMU is not mapped
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-5-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=1530;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=bjemJptZcEnstSo0pp590/SA6Z/0mPTGwSJBOVPEdY0=;
 b=LHIv19TaajptnO3jVbU2+fzacNw0Ub1a9cBhEIk6d3BIqMNbVmcDpqgb9xLMkpd1LRV/B6HSk
 eQJ4iOCYAXVDFm4GShgxco/PiXZbXPll5PpBwGK3X2q3MCjWB8Ryyqa
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX9XGiUvmh50/1
 zKpj85M1573gUhr25GzaELcfrvHRkID/AuxnpJ6Xb2APicKOEc2ONKv6gp0gOo/hnU5eBgleBoG
 yHarn/uzxMq6s4kVfmOgcKx2YaH8X5U=
X-Proofpoint-ORIG-GUID: bkzYST-R9ucNoILFYUtXGDzBEmhkrKXP
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f95d9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2w7d1ukKp82XeiQ8bL8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: bkzYST-R9ucNoILFYUtXGDzBEmhkrKXP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX+57KuOsAESKy
 +kpxVcW9gzjtIQlu2F1gGKDGeQnJYeWwPk0pHg5Miy9oweW/Xs3Q1MswreH9JrK96ndHFNd4ZSH
 ragVUQ2oQ9Y13EBmxZNK6VNRCyUdO6V9MUNWBp4uBpsNAuwOPEwbFHlhWKOe5xg4cOlwU7drzH+
 rDhYQhCZYM2tyR2/AsnVNZX7PPVKA63L0W6Q02zwuAXUrHmiCVaaSHNZQif2mHiDceNJIuz/wo3
 y/Q5FHWXIp9jNyXpg1jBWB7CYYzSgfbq6kt0nym5n451bRNqEjWj1AH6txbc3NDNwrxfgfFgiIL
 0HNFb5X4h4/eV2VQhOGl/YQp0IRBSPNO3w3jbeQIvqS+64NIhV0SIER4ilfa6iy8m20dME/I9Is
 GOKz9ekvQtoppmWIokNrSG3SXFrIa1rWs7ml9FOFZ8YqSHulL21/aDPJSIU2cUz9MgSiGpDbuCk
 KoIK1v62i3+DhVy3OZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117973-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 747FA731154

The non-pixel and pixel subnodes move the IOMMU streams away from the
iris parent device. As a result, the core device may not have an IOMMU
mapping, and setting its DMA mask is unnecessary.
Legacy platforms that have not migrated to subnodes still associate the
streams with the parent device and still need the DMA mask setup. Call
dma_set_mask_and_coherent() only when an IOMMU is mapped to the iris
core device.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 0bce4fb1786bc9371074cb72e082219ded4840e5..828e020fc79a7f9c4e8e11c118996f61bcb7715d 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -309,9 +309,11 @@ static int iris_probe(struct platform_device *pdev)
 
 	dma_mask = core->iris_platform_data->dma_mask;
 
-	ret = dma_set_mask_and_coherent(dev, dma_mask);
-	if (ret)
-		goto err_vdev_unreg_enc;
+	if (device_iommu_mapped(dev)) {
+		ret = dma_set_mask_and_coherent(dev, dma_mask);
+		if (ret)
+			goto err_vdev_unreg_enc;
+	}
 
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));

-- 
2.34.1


