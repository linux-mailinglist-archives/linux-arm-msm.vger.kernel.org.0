Return-Path: <linux-arm-msm+bounces-107843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEtRBnQKB2o6rAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:58:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDBD54EEEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A348030AEA3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A8C47D933;
	Fri, 15 May 2026 11:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZH6r/4P/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JLO9LLeP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4032047CC9B
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844221; cv=none; b=rxU7Wais0IYQ9NzV6NsjEuzGBh/OzOJG0rLIbf5jyoxcYR5Ss5u+tKW7KEM/T/zBH3pFwLCE7fNN38/AbvEZrS+yZRzpMa3MyAPo1YnCokhLtuUhkdXu/2LxzE5vb1X6dfGrbmI9u4m7llmXnfJKFrkEQpiE77FoV+7hpSmIYdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844221; c=relaxed/simple;
	bh=R4hyx2wkdaEzOFeos/VVceiifZ41pzNik6VeXo4D/4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fyIz7Vp9yA0IdiS59dq4LSbTsaGzJ9V6sh4uc4tRRWla2zokjYGsNe9kLfK5pCMy/peTmMGy+edr7oNrHcbjbVOImv1bbcLr389IZ/6IyQh0eX6Y0Kfpnh/DN0lq+Lk78JYdXhCEdkBE9agoU5TECTTvXyMV29y+gUOkhMvk2v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZH6r/4P/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JLO9LLeP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5fvED1847980
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KJAZYj78iKXwM75l/HDp+1jydtLEC0dNPj7aNSYgj0o=; b=ZH6r/4P/bjfihWKc
	MWvcPuD3B8tBa1R0q1RbSZQfNbO71WlEUb7+LlWA1NB4Uj+Ei3K0zu6B0SzNZ3RC
	XY6CCujcEv6Vk6gL6ThGZ1qK6ExE13ZKdD8ljdm2ElJ+okYoeEU3+JfFPj0LghC4
	Tk/J9EvkavnoiP21apqjS+VWijHKIQVy3494l46PzjaVB4N2+zduvI59FRCUVAZa
	PhByS9XHmVX1I3QWFtViIXYrdCppNIBXBaVUxpYl4yfk1dvJhRdqkD8msJRLmVnl
	J6dgdUCPfXlMUkf9F1agxNCJbCB3FM/RZbULEbv+ey/lpIoKxDkeJYPDiXYdIHE9
	C13O1g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t2yvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:23:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-367bb9caa54so8368016a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844218; x=1779449018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJAZYj78iKXwM75l/HDp+1jydtLEC0dNPj7aNSYgj0o=;
        b=JLO9LLePbC2H1wuFgU8p2bNoNtUe316v4P+HQZCgB8y6ScM9PlEqcpdX6w0fq2YzFK
         mrngxa27CxlgxCMRPuobxSDtfZie2iC7ze3L0daL/av2zqmWkzgqs7S/4C9A98kIivNU
         dbLJOcmwrqXik+++5vI3LJIHwSuEQ26928CfwTjMGK3Y7oJ9I4vUNTYnYBwa2k0LWmt8
         54qQFmuaR+kj3j59Z6xyZs4xExFssMpjEaI6P3k22oL6zT0/81lY9IQ74FMRpCPqtBmm
         IKSsT4eUnft70pUfvBtgTcxWx5YPJanuzSuIIJzHNbk6qKodgsqebU8bjRxRGjvlmKKv
         VFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844218; x=1779449018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KJAZYj78iKXwM75l/HDp+1jydtLEC0dNPj7aNSYgj0o=;
        b=EpLgkyfjIVO4fo/U6xaKL5XbGJcpdQ/SGx1oHs/nI2xsT1l3wagkNFJRrAw9QRqfyt
         8MqKRty7vNfGJtNi0unDXXUgUa6GDDTV2vxwlWN+NzRRwhNT94AxuZZ5F7pvFT87e7kO
         36IdqrGQ2kM3XBcsYW8o8LYR7V6yD4K/GdFVgSMFEsSfmcKi6ncaFJnBUgrJ4sVrPWzV
         6u/1vYZNo+ro9vQ8uW9ihAEF5fgzLsqwXt/zxF8lGAu1qKFC85XUwEK053jUVPqnANSk
         01kKAwWeRQ3LtZIsib/TC1rRQVvIC3znPkTLV8xMq7PBTeBGYfI8whVd/xSlZ2frKocY
         7fMg==
X-Forwarded-Encrypted: i=1; AFNElJ+qbtT9v1Qc5TArWVHe1pLHrcrdKldX2wsbtTiHrP6M0YgZSO4kkVCqxFcmBeou7miQPsG8Cihp7BFCoCud@vger.kernel.org
X-Gm-Message-State: AOJu0YwTW116XUXy68qdOwpZ/d9wTrdzBDwYbQ2cMHR0d5nx0HvkQDtc
	BZL8aTFgAZsJL29vlLsDrTMI+fnwJgdMNdl/bctqf/6aar/xhsy0rLfqf04+q2AnHeuQpXSAiXi
	Vm1zQ8aRMCQHqQXAnAyLLqexRN4HtCjs777cY6urUv1Def918PtEpmK+vewVMODHWxURV
X-Gm-Gg: Acq92OGXiXLiL4UEyqxR1vxOAATwtXABfVtPBDu2l+c3HcBgI2H/ncClmvXHyiWOUpd
	kh0BYj3SarlkFamDm7RxelusK93E0Dvp1q222BluCUuIkBVVBWr1jD2rXJqjNBU2gyF65WWNs5F
	5T7npXbKUIMtm2F2rzEfIk8tTBISusYdSMaPPLHJGwFQL2Jl//OYjYk1onJsitJCNMLqgdMPf6/
	QWoGPdgbbcwjeF+MwIs3ugmX9Dk/QmU0hQk3t7oReketz6L9xS2J4v7DgblAZrZbO+1SeH7MjAU
	dawC0bdp+cNiE1twcE1fGDiMernRflrHc5CRYW+hcPQCcZGEGFWMcF95YEACTXEZZ8eeEQqvwc2
	ccfF8XsvgC4qdVgpmnHOD+h24HwhKfNwMLVvmpGM9oMSK6mzlD3jcCbc=
X-Received: by 2002:a17:90b:5290:b0:35c:30a8:32a with SMTP id 98e67ed59e1d1-369519ffc97mr3758469a91.9.1778844218281;
        Fri, 15 May 2026 04:23:38 -0700 (PDT)
X-Received: by 2002:a17:90b:5290:b0:35c:30a8:32a with SMTP id 98e67ed59e1d1-369519ffc97mr3758423a91.9.1778844217830;
        Fri, 15 May 2026 04:23:37 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2476249a91.7.2026.05.15.04.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:23:37 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:17 +0530
Subject: [PATCH v6 02/14] iommu: Add iris-vpu-bus to iommu_buses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-glymur-v6-2-f6a99cb43a24@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844197; l=1090;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=nwLCkv3OjAFGS6jwKQhLZrEXe26RmaJcgKrBgwUePzE=;
 b=7o6m1C3GzJF7wYxJqXejGuZGgG9YRn2+c6vLHEyNya/et9avgtj9sj4z21cH9Kwy0U+ClNAwo
 nWMlX1NqLtBBKhO+bHZJ27Ti0SI3s3mRZ7sHQBp2smRB9uo90nuNlRu
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a07023b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ZGoT60Gb6PEvP4nDRaMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX7Rz7lp6KLHK0
 SXOKbeHgV/c7xDqqQtbrhJR6iABcTSChfK2T0x2EWXtY0aBdVbBnOWp+46jCmK+ymWTTEvJ6AFe
 dNWD2N2Hg5fAX+DXv4uFcdcCclGw41Hod28NVXxZack7xeYzgygzxEayW4IOYnoUqxJqTXhh6wr
 CWygMbv5EaUCEyRfIlVM6Q3mW4nympJ54h9FCXqkc+D43jhAAK99qpVs1/AflweN9O5ih5CGKtD
 JLq1PWHmJ+G/s8QLfXeVpgH0FaaRNkih2k7YiqHtklecxgc/Igo2kHOSmC69JnynI9FP3VMQrtK
 jA4t/fOO3U82jSoSL4GiPotJIxjYvJtpL08I7Axy/CtIAsujqISPPDXrajnuQ51hG69CdrmEcc/
 2Ff9au1euM12ELLCMBDhtG3FiOyPpPljUJx/JEzX+g7NQIPZ0v3x0/vm380mWKqAN8C+UAvySBR
 8TDu4u54MmR0SauJWeg==
X-Proofpoint-ORIG-GUID: FVdF9ogOd1eI1SXIWUfrN5TOxZTr5V4d
X-Proofpoint-GUID: FVdF9ogOd1eI1SXIWUfrN5TOxZTr5V4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150115
X-Rspamd-Queue-Id: 1CDBD54EEEE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107843-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add iris_vpu_bus_type to the iommu_buses array in the core IOMMU
subsystem so that the bus notifier callbacks are registered for
device addition and removal events.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 61c12ba78206..d2c67f0de13a 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -13,6 +13,7 @@
 #include <linux/bug.h>
 #include <linux/types.h>
 #include <linux/init.h>
+#include <linux/iris_vpu_bus.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
@@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#ifdef CONFIG_QCOM_IRIS_VPU_BUS
+	&iris_vpu_bus_type,
+#endif
 };
 
 /*

-- 
2.34.1


