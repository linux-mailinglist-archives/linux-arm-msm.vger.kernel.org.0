Return-Path: <linux-arm-msm+bounces-106056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MQzHcLL+mlTSwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 07:04:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 152C14D63AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 07:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C5EF30707DB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 05:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C652F8BC3;
	Wed,  6 May 2026 05:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GzHL6fEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZ4E1s6C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0003016F2
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 05:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778043689; cv=none; b=gFAkF/STEoyNLPA0zcQEm8G3J6fljebajfD33bnDJ8cSH9NESk4SuwJTQvKdVwiDm7zC6vEsfU9QVWDgGWPz84Fom0MAjvgo2c0j9GmsCEGoUy+sKIYJ1LW105uMyzfoZAcFZ8aMOrGq0Mk9H2zCp5b4UFkn0X750UppLWr7POM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778043689; c=relaxed/simple;
	bh=x3imywJXb9KQ30J+Y0NGkFn/oGofziH/knbByycGVA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tHjT9QU8wWZ9YRdESYGwI8Olmh2UxMemZWa9XepFNKO8H1x8wmRUMaeRys5ehdgGr72oAWsDGCCMBPmbQtqxywJrAOvR8IIZkgpn7iXb8lLqEr1jsQoF7x5uL0rMPb3NKyFONPvP+01CCdNprPcQfrwmCLoy1NgRccNCeMi6Rfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GzHL6fEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZ4E1s6C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645Ne8854028315
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 05:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qpfp4SaaU6j
	oBqSmIz9YG6OU2Zed5b0PfIlvN0JCuFg=; b=GzHL6fEmtJVoLeEfBOk7Mrj3KR3
	d/Kmdr/gygGdrpg46QfAMvIOIxyJTdWGjNpAEPNXxP5D4nfkyTz2o/QilMwJ1GBA
	o4+tcElfx8AtArqE1TqSdzqlsqVoIHHIVNXYu12cGt3EbBxtf7S8c4Z/yE+iFss3
	ETFDZCt678DV7vh65T5YjF3wysYLaH6XGEfSWMlpfzVIWjBuezAPusRq6dDnK45u
	AyGeASNCk3S8E6hhDkG3ux1y/v95EoqMFjUwvltVH/HIFmFWkJpvPMCi41sEAJcP
	kKWWsFaan9hxhRdNUyZnrZ5BFQdzZNFU/ZJBXsb5Mn/7i4Jq05BAUYysbqQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dydm6v5qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 05:01:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-835423c69ffso1668870b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 22:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778043686; x=1778648486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpfp4SaaU6joBqSmIz9YG6OU2Zed5b0PfIlvN0JCuFg=;
        b=OZ4E1s6CHKeYKJPS/BamgC/BpsljGKgafO3e8cePsM3ZfLtSbA5rjrO4i4yTE1yJEM
         dV0VkJH6DU+YXZZNDiLVTScoV5NVs2ldwpGOV+Yzz1lzi14MSdQvnSMNjJZg9jN1Pm11
         ffvXzENCLsvct1z7fExuYl16DM3xGNuDxpuXhuc7krntMsh6lZ6zN1i/f8cblnz8WW0j
         8qT2gOLeeJvj2LI8HB9QuUl3RPC9f0cy5hnq5Kktdv0ED2+L7Hk5MEjeK9cp1x150r8L
         xoUnF45grm0wXFoD4klbC9u4MPNl8CTrN3UkzecE3fghrjoKHwZNnTnoyCurbFGP1hNT
         QqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778043686; x=1778648486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qpfp4SaaU6joBqSmIz9YG6OU2Zed5b0PfIlvN0JCuFg=;
        b=CKnXjCtaMqSv+XdC8Z6l9CN/U80lx8KU7jChh7oyu7BXSV+UkYvPex0NBEnAINOJTZ
         PsIjBZmNVNtCNt6GiKTRMCZNRCKF3ZCSpXXiQI5JSGdkcdBhqa/NMN0M7g7Wpu5gknmV
         VinrlaEUyZRgJEHP8BdtNWt95HP2ysmyPLKvoH56J9noqt4o3DOakmD/S4nBMD1DLp8e
         2V6WyOZBKLssIDppu57dUKzpGmG0Lynq1FarK/qNlNIM30/aNhOkGPQLv07NOC4f+2Ml
         s4NIU6c2Ki0fNQA7hS6o3LR15rRHw4YljRHGDPAZPcgV4KHspcQa9esugFwFhhVri2Rw
         FCBA==
X-Forwarded-Encrypted: i=1; AFNElJ9f2DYjfdmKbpCEB8nfzuDZSRUAsR1nsrADN5Vs9FDoZwuuTj9lCOE6WS7Bgh3Z8o9XNYUc3jFIvQozCmVm@vger.kernel.org
X-Gm-Message-State: AOJu0YyDLV4wJ5VB8jcjT/JezRiyXrNH9PATlztAX/6mX22Mf/WVjU8v
	pK8GgqrVxvGJXfzu728wrSxn362kUd8DK3XKCaoF3+SkXdJdX+pIVVPzsqdpWEu6hiGGrLu4VKv
	rl4m1doMUd3/5xESHVPSskoc+1hsSxvJpABXmVtWja3Ob/L4iYqh0S07gbRHNMR/txA1K
X-Gm-Gg: AeBDiev8yI7qedpsRDEQtrUEKH/J0UyJDt7ZjeCAvHEwkpQmxI27wk2C8iEmpAH/x0M
	V/RMlLvnjqB/Fyxnc82m/Fc+mVD6ohp+TeVsxFAb+Z5WPEgVPOT2nwxTRAoCMUeoJehVpdo/0wb
	3VHB86MgfsMBj4RGDaRNfVqhLrejKdOzUi6kZ07ek4iWoOYznQ5uFFiU58lgr77225cQDmaTAVn
	+DVDPcSl4ih2ROVK+EV+lx/IBBPsngHPGJMHAY//BS6mUqGonedn/hIsnYAiCrFNOUM1YY8kq+T
	KSQY2/+3o2OhZSTvZcOvgzRk8b6t5/wt0625wNc2Vhgoyk99doNAg6y32RqXl4mQTKISh/YPh1Q
	QXf6LVYcYCKBzvMchyek20oyy0JAfyt4m3himALkFO12uRPvPfRNXyyt5ZEU=
X-Received: by 2002:a05:6a00:2d96:b0:837:acd7:a78 with SMTP id d2e1a72fcca58-83a5b9d8131mr1640500b3a.16.1778043686123;
        Tue, 05 May 2026 22:01:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d96:b0:837:acd7:a78 with SMTP id d2e1a72fcca58-83a5b9d8131mr1640455b3a.16.1778043685478;
        Tue, 05 May 2026 22:01:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcfc0sm4891620b3a.42.2026.05.05.22.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 22:01:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 4/5] firmware: qcom: scm: replace <linux/remoteproc.h> with <linux/rsc_table.h>
Date: Wed,  6 May 2026 10:31:06 +0530
Message-ID: <20260506050107.1985033-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
References: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA0NiBTYWx0ZWRfX0oto7ETBAXWS
 /WRfQf0pyKiK7YFc/xz1Y4uvb41AYbmyM1kEug+mNGX+KlryYFwDtBEg900HqvD3X/8ufyprMUm
 7ak+udUQKvT0aHlR0vP3vTvU12SGQf9wCEcjfqXUa2ec0oiEzpfO1P1Db1VHkhK1gwbFoS6YE96
 UXXRyUmhEgSQPAbhNb1unR9AWAMYOoCvK37HXu0veLLWFZ0NjbZMeb1QVBAli3PPHUHa5wqtKoZ
 Hp8fj18sJAF5ZqCR+WfVjXoL2VP+WQTiJ8cCKzU0UE/g9RudS/PeRQhKPpQADNhO5hYnZQNBJ6/
 jpPZGmmQatob/sTpwbIBxVyVT+r+j+8DpPnbPdwdrS7ykrMd9CZZMHKLLUZ9Gg3UmZwg0PoSJvN
 SllZTaFR7nUOEnXltvOd7MyJHbGLZg9T608J/Ta5J/IrlmBH7BQmdjfFM3LJR9WMLUTsKbncgPY
 OjJ20ke/kDGNaUtkTpw==
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69facb27 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=FwMnjOFOIPbINuAMt2AA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: n3OMzqm2jkirKEdGBCdPLZBJrKepzLcv
X-Proofpoint-ORIG-GUID: n3OMzqm2jkirKEdGBCdPLZBJrKepzLcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060046
X-Rspamd-Queue-Id: 152C14D63AE
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-106056-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

qcom_scm.c only uses struct resource_table, which was moved to
<linux/rsc_table.h> by "remoteproc: Move resource table data structure
to its own header". Drop the heavyweight <linux/remoteproc.h> dependency
and include only the header that provides what is actually needed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 2cae35e7c583..d9ee180388aa 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -27,7 +27,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
-#include <linux/remoteproc.h>
+#include <linux/rsc_table.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
 
@@ -871,7 +871,7 @@ static void *__qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt_tzm,
  * as zero respectively.
  *
  * More about documentation on resource table data structures can be found in
- * include/linux/remoteproc.h
+ * include/linux/rsc_table.h
  *
  * @ctx:	    PAS context
  * @pas_id:	    peripheral authentication service id
-- 
2.53.0


