Return-Path: <linux-arm-msm+bounces-101628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kL7cBnCez2kTyAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 13:03:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA983937A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 13:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C472301D311
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 10:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA723AB29C;
	Fri,  3 Apr 2026 10:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="io0DNUhA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cLAyeFwK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB65399357
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 10:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775213996; cv=none; b=OvtOMrvUJEjSbOk8IwcBkpgMpaTwVQ2WfdBpOYGHV58ggqnxZ2TJaP4jx4Vl6eVgjhJP7RwO8noMXJNYUPEcbXHOZc02eOfHjvT8ns62bvfSNIjSL0+0+hzi3NS7Sy2WMJZ3+sTGXZ5q+GZCJgoI5gQmaupkux1Wd2hEb5LwsLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775213996; c=relaxed/simple;
	bh=SzXbUyLGlJXV2xRhynFBu0lZGEKyuQADxPDLqdtRktw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DDKb6g79LuMNGPe5OpB43hePm4oYvGTudt3nSDHN7hbVDKusze/bwACGE384NnTnoXmtucZFag3ui46IXObJ/hhohKlZOFOW/CXj9jKS7QMXTw3zFIf10cDbZmLCau/gLpo+VmS9yCfEfXMUmpQVFlY3aSc7mt9v+Pf9k9LJxw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=io0DNUhA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cLAyeFwK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633AgXqK1562171
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 10:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jp3UsrPfBUdChQOLHTMkYPwGOmIvwsw4GdO
	3IsGCFXM=; b=io0DNUhAuVZfWA8/HJRuwezjyyAhDQ1SWq/rJfd8ehl4X42HpQ9
	7dHPArE2l0ccZrtlpGQCJWmqCgWtmRaSjp7Uhh78ERUTyyL1gClFJ6rLt5VMV+9k
	A+zvEVtodCpoSmZJDaQonqPLszaaZ23t19VilmyNdeJxA2xiOnBJGd2RAl+Rmsqg
	g6KsXSI0K75cKfBdsUWvRdvtDRj7YN3OS+OxWhl4KtySdHMoYR2FYefRcA8TmNKr
	Ku9dy0zLrvBVQnZI1M0SMFXadiLklOQ7dhC/3KFoXeZCHWxDXBjRAQ72wxBiZqrT
	LiNWHVC9TsJEq4fLfQ1KcZXJtk7EHC9ku8A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9um735p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 10:59:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24e45271cso16945635ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 03:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775213994; x=1775818794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jp3UsrPfBUdChQOLHTMkYPwGOmIvwsw4GdO3IsGCFXM=;
        b=cLAyeFwKtjHJF7wSBpedCkKECaA7/sg3tuHpPvdFoshIiuMfAd9yFrrELqfd77K7Rt
         Fyh8iMyC9G5U1WgD+0mR0RR8wbY1xN6B2/EP5bPvImpV82M8RDfalk4oXfNVhN9ZLaeg
         CGOPnGmDgGfBYCkx8WU1z7dYsCvSC15mSAUlYIWuqPZ3RXODo0E9HdI4DikB6BOZTJRX
         jaEAM0lZUt3vSw/DawgzUXfk5tMRnFGPqe1w2rYPCBz3tyjeV14tsCBJM4+T6WzFQzGU
         goR6uQWs8T4wnGgO65KvUfidiE6PoWqvfMoSWehfNjuK/jR1EteMubVDxYzBAi9Ht+zt
         1QkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775213994; x=1775818794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jp3UsrPfBUdChQOLHTMkYPwGOmIvwsw4GdO3IsGCFXM=;
        b=D4ziORH8QdXoL0mtBCbpFKl/vsRF+nPGzgDBdEszeo5kAy0qx/5PepeEUzFvk+n61n
         XLViYHPwkRkvQ9dEbeA6Ra2VBzTM213PLX5DKoveoQmsZ9ByrMiAGrYXS0IUjXkkSlRh
         CuuP3eHEkrOjltpHMuOz+5S5hNqiaAvvgtg8BOHCN5ol6HSDLAQltsp4JOH9IwBGQ0X4
         H/xwR83sTsd3mXFynHfVccdWSvd+7GCCmlZEG40f6OfwiNfKzS0DvM2t5WiyzHUlai23
         H491NQ6xgcxsQ9welp+j9HC3OHOdHnK6DcQ1qD3MPLkwNH97TJX7gr2rdlgb3Mkw3YHf
         jwKg==
X-Forwarded-Encrypted: i=1; AJvYcCV3kU3NxD8ACURMvoG+Vxk+Ua4KDAhhlo5VMYj8DRvDUtWI0V4jzo6Zc4Z7WYjygV5s7da4k8SINgl+XBUl@vger.kernel.org
X-Gm-Message-State: AOJu0YzpXjaF3JDFZMyioFPu7rK+drAvOZ00OXXlHuBcpzg49V+JC3Wl
	rQ4QzUtxtCe3h9ocXf895OB3hwWTwRrNujmuah/hDXOF7eD/lmc1QfInKzZ3oJEP3xgFiOsntWB
	sGTO6Ta3UTOXqUVJZaN2iBFisdmrrvzQiRsn+KgR5q5JUkBgDvyZMs4mXgzSvOcWBWeH5
X-Gm-Gg: AeBDietWemXjBBD7ZhXOKyxZHdT2GuBVBHCrCQJh9AohY0Wx1p7S5aSeyFetti+hKeE
	5WiSTxKnMmobis8tROljRPnJtZFhPwW83hbb9ZeTGgtn+NXfGHq183MjLQbXCQkFNg5ZvCq/fq1
	Uubj4sssip7eum0C3/Hbo4eaeWWbSdbFhqk1U6sfsf/Wb6p4COmV+ZupaVc3UDglxyyhzCNyGXf
	Za+khoB1YCaQvvJmsydBkOZU8+Ffkhcy2HYQCp8wRF+7K0607R3X2P+0F8HNpUI1B1CY7LNCC0d
	VkaJ9BG9BIv4bCc0PmW3djmeKyialcyTL1znTJ31wPPbI1NLOgjJhB8wTlep0b2kYmJskXXu6Em
	U4kkeQPXrvooyZAl21ZysuHrKJvljXwxo2iXqJ+pd49bDYzXKyqKh
X-Received: by 2002:a17:903:4b2d:b0:2b2:4e5c:69a9 with SMTP id d9443c01a7336-2b281715f1amr27999895ad.5.1775213993962;
        Fri, 03 Apr 2026 03:59:53 -0700 (PDT)
X-Received: by 2002:a17:903:4b2d:b0:2b2:4e5c:69a9 with SMTP id d9443c01a7336-2b281715f1amr27999765ad.5.1775213993507;
        Fri, 03 Apr 2026 03:59:53 -0700 (PDT)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478945asm75543575ad.28.2026.04.03.03.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 03:59:53 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: adrian.hunter@intel.com, ebiggers@kernel.org, abel.vesa@linaro.org,
        ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neeraj.soni@oss.qualcomm.com
Subject: [PATCH] mmc: host: sdhci-msm: Fix the wrapped key handling
Date: Fri,  3 Apr 2026 16:29:49 +0530
Message-Id: <20260403105949.1007447-1-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U/WfzOru c=1 sm=1 tr=0 ts=69cf9daa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=syXCSX0lvsCGUfyF93UA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: doh9tfGKNCycO8IZHtqfIMcOHrLgCYJn
X-Proofpoint-ORIG-GUID: doh9tfGKNCycO8IZHtqfIMcOHrLgCYJn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA5NyBTYWx0ZWRfX9vwO/PHr68XH
 MvXQxrJZWXIqXCefp14OcnFFUkRRl6uSsddfztQv1xpj48JOgnfOZFh2ZzTXXy5oPsJHWsDcABe
 cac+jDqH8DyKktYyzevrwmhPcMZTZ/ypGOLcPZYoQn3llF475UryJPM8GArop8yt0DCYIaUvk2p
 TfkYK3O6JTD8+HkbhY/gI02IhB9vAkVlYjWqLpbYaVJjlBbqweWgwflSR7pLaSKfQUq8b8a1v6r
 UD0hxN2Z8/1LaKnBqfCrwmSh4syFNirUiKjqphFD7+x65dmIChMXtjUWklrGiGMqecF+9ujG1sV
 k4v9SIWDZqx/Sn2UtcQY7WBiW12xKPV3npiB5tl4m57sOVoc1szEIsWs+rCKbaBzr+Ym5Ha94RV
 0oecM9kz1fM6pg959T1mRNtvw955H62643Jhp48a91D9fuiq8kk2HpNU8uuz5w2cAPEVbhQD8As
 6GKDAdXKOTMhJZEV95A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030097
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101628-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neeraj.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6EA983937A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This change was originally intended to land with the patch series:
"mmc: host: sdhci-msm: Add support for wrapped keys". The fix was present
till v4 but was accidentally dropped in v5 while rebasing.

Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

---
The patch serirs "mmc: host: sdhci-msm: Add support for wrapped keys"
was originally discussed here: https://lore.kernel.org/all/CAPDyKFqRG1_1aYavfrA0Ss85B0kcTnjVBeqLgq8PUJUcSx5LUg@mail.gmail.com/
---
 drivers/mmc/host/sdhci-msm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index da356627d9de..df0a038269d4 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1926,11 +1926,6 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	if (IS_ERR_OR_NULL(ice))
 		return PTR_ERR_OR_ZERO(ice);
 
-	if (qcom_ice_get_supported_key_type(ice) != BLK_CRYPTO_KEY_TYPE_RAW) {
-		dev_warn(dev, "Wrapped keys not supported. Disabling inline encryption support.\n");
-		return 0;
-	}
-
 	msm_host->ice = ice;
 
 	/* Initialize the blk_crypto_profile */
-- 
2.34.1


