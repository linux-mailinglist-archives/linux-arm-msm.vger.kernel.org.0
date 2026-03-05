Return-Path: <linux-arm-msm+bounces-95639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGenDhyFqWkd9gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 14:29:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8E2212988
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 14:28:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36E38301CF81
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 13:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3285E3A4F29;
	Thu,  5 Mar 2026 13:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nen8fdgN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BpGvxyPh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206543A1A43
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 13:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772717334; cv=none; b=H2ogJq7nMneQSv7dP9ArNSyF/pUsNW8kt1fqsb5E6f/htlBSlKD310hoPidrRWpjGXZ8XWgEYSj+mD9QCizDGx/Ry+jolKNU0pYxuZgpO99q55ph615oSBUlLHnMOK6iGtXqGD60T1NFEx3hD67jjDxnWtUIGs63D0eLRgvhKkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772717334; c=relaxed/simple;
	bh=l15mSyjuck4U9FDRKOGPmVbWICnvQJSekqWWPer8y/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VRYlzEY00VT/ZLeoaSBH8yBKWX0GteVU0mxfO5PnXJOauknkCeM2vDC67mLnjha1/K9+d4JzvPoT19KPwkckM5brATRArbPbmB7nbE06eaSgYvbq7bfQ1NwMAAo6g9fV8Xi7l7s4Cd+jwBIZtmgzK949ylW8NS+TmZfa3yWrIq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nen8fdgN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BpGvxyPh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625CN5Ue720112
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 13:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BQeIcd/nOZ7ZX1VNZs/yyO
	p0K92hK4/8vWea26Lu1JM=; b=Nen8fdgNESsiOUQyVLcz3OVIbih3z75sEgReVI
	lD5Vbuy0tzGFgHPLXvB6BgmN6e7bQ+63+vrPAyFQtOAqyh0k7zr3UpNliIL2CJ69
	cJ7U8fj22Xqagyv4wXLQGSsULSuXLKSvYNujcgTwNUaWJOFe1+RwRO5fcIbe4kho
	0Mz3m+gU4KxiaU7d+yuFWysfV2yMHjGPn2o1GUPiu9MvcRMCkJQ/XpQL9lEHjlP3
	aoUYCMgzgNQovm5RxKbFaXpmz8pvGmIwfbUtv3kxg4oL5jAkvbwWr44tj8L9pvUN
	70W2SJcZ5AbeQVIKigS4K4J+JkKkpOlu7l6+1CbqIVtKHh7Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq9srg5yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 13:28:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae61939fa5so71404745ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 05:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772717329; x=1773322129; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BQeIcd/nOZ7ZX1VNZs/yyOp0K92hK4/8vWea26Lu1JM=;
        b=BpGvxyPhDKqWQGXBWFHdeehqtYX76tfk3X8xKarLhk0VyJidbzxV3iUL/JsEcocT6n
         pA78pDM8HZZJUhlCHaCbojEK9gIjjPh2fPbUb6LrQjsfRLZRMmwS6PqReM5izWK64KOF
         8lWT0mjGDT5Cm27G6Kg6QDmPRRNK2AuY5UKvWZpkcmsGqjpGu449bALAWySZ3qnQnGjK
         LsMap34JnrN8hgCMUKTlBjWFDg4ZkFukPDb/d+Q20LIqgRhFvts/yR7tijkCdaRwhIHI
         LesBKEtT0UYetZj0RWR4/MrwR010p8CcD1yDeWLxqtADL8skbUIWSrSmebyX2ckJN6g8
         vHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772717329; x=1773322129;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQeIcd/nOZ7ZX1VNZs/yyOp0K92hK4/8vWea26Lu1JM=;
        b=czVfUqSjRASnb92pHyw4bBaL4Gb4cZDicibPFtqWF7j6tAg1QnffzpWhT1M4RhgMas
         6awkbNmfnGEu/V5Of9+EBfQpO5mYYJ7gRfSFCa6iUqsFn8tFqM5B5iQsRMc5WPxxvmDV
         8R0txarUgs3zR0lQ/Ek7meimCVtlszlOB9tjRX9iujeH/cMFghCo36AoOHpx/+Y13WzS
         QUSQKzJtY7TwuMUolgOu2hVqiClBgrIbrsW7kOrR02irRCqBBnQ5Dz+5ljnS4yMm3jv5
         5mERuXKLomR5hdt9JEbmYuYBf9BGDFzXMivd2d+gZp0GkhSz9YfW1RAFA39aPuADMRaT
         dZ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNzzyvpL9RhTey86n5PmRc8eWRHRygyp9IvhpDvngmNWcVEhePfeXUynRGA2qCkQwURCVPEd80Zs5aohHo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8UM7l0xHK0Vi6lnmP2Rfz9Lq1wpcpNbsX5hGo0IJcbIG8ZKmX
	ZE2vmFI3fe9yAnkCiNeYGtZPMI+ajNZIO9Qk/2346Nmdtd/1ItMzwL/QnQiRum/iQx/q7uyZb49
	VEN2Rwh+qQu1+L8H7HZAA2ONOA8XgATSfTK3ytkXXslSdr+7lgdvWiFaIG2lJnEs0z007
X-Gm-Gg: ATEYQzzAdBzgz0wMqIO3vTgh8xswScb4MzcQmM2sn0eCjRmDOxxMUtKGmu/fYiXypQt
	SIy71IvTU/29UnU+NQa/dpXpqw0B8+d/+mAFFQHmKiJzyIpt8CwdLgTA962/TZ5Rt2pDhGl3BQn
	/ZetMvoxnMsoCYjSJGJFA0W1zpn5EsiKBdn/LfJh82sqeY8cWDUPVygVhpPI+DQLZEdsiW1hCOi
	C4Q8/InoY6lZsG8sUvYNA0wgE7HscHHg3Dw4rPKtjtcLl7mIPeM09YSrrTXD3UCL6A62X0Qc4xu
	5/OFOKTj2U/JyzRQn62qadLY97Sbk5YLn5gV3oLgsetg73gFDq2v7VsTz47RyW6ykSNHzBmil7D
	3hv4WnnQgtZ+ak2P4AfIfJJnbtoHj9WCIqA5ztu7cty7ZHkz2j/x8/Uo=
X-Received: by 2002:a17:903:15c3:b0:2ae:5a21:f7ee with SMTP id d9443c01a7336-2ae6a8bfe34mr59082095ad.0.1772717328561;
        Thu, 05 Mar 2026 05:28:48 -0800 (PST)
X-Received: by 2002:a17:903:15c3:b0:2ae:5a21:f7ee with SMTP id d9443c01a7336-2ae6a8bfe34mr59081865ad.0.1772717327994;
        Thu, 05 Mar 2026 05:28:47 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c0f2fsm330533105ad.20.2026.03.05.05.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:28:47 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 18:58:31 +0530
Subject: [PATCH v3] media: iris: fix use-after-free of fmt_src during MBPF
 check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-fix-use-after-free-of-fmt_src-during-mbpf-v3-1-20cd61ca488b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP6EqWkC/5WPy2rDMBBFf8Vo3Qny2LLcrPIfpQQ9ZhJBbSWSb
 VKC/72KU+imm2wG7sCcc+cuMqVAWeyru0i0hBziWELzVgl3NuOJIPiSBUrsJGIHHG4wZwLDEyX
 gRASRgYfpmJMDP6cwnmCwFwZjHWpWummlFIV3SVSON9fH5zMnus5FOT2XwpoCdnEYwrSvOk/Yc
 F8bRbK31LNlRb3X9M5knUajrOIiEA/WOeQppu/tjaXeYL+N9QuNlxpqaKR23jCzQXOIOe+us/l
 6lNqVsckW/BM0sn1FgEVgW6d7X1vWXfuPYF3XH7fDxMeWAQAA
X-Change-ID: 20260226-fix-use-after-free-of-fmt_src-during-mbpf-abc27f573400
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772717323; l=5820;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=l15mSyjuck4U9FDRKOGPmVbWICnvQJSekqWWPer8y/8=;
 b=bX+vvijA0pCBxWAyG7KXMzC2RGq1j5Vi587NVFVDveniogeJm+LZJh0mQ7u6+QC/JIYms4Soe
 jDzBNXJing6BxM7CrijmrObvtj7DUmFg7GHuoDRNHpWVPvUqyl6auLY
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=a/I9NESF c=1 sm=1 tr=0 ts=69a98511 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vOiXTFtDm48uhe5vJ3sA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: oA8vYX4fy7rhxusmvKopzUlCqyVOlJsS
X-Proofpoint-ORIG-GUID: oA8vYX4fy7rhxusmvKopzUlCqyVOlJsS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEwNiBTYWx0ZWRfX7/YrZR4UWKEm
 iC45RYaovunAQo0RvKLt9y+M90n51eFFhPdODGFaqWakhcqWrAL3nivHHJKWfMtzHd6LYK9z89C
 3/UmDSZsi5GSVZhk8EeePT64CpFGmCiB03wGYNzrMe049zCJ6Ae6fNMzgsoKSij5iqofKjMDlVD
 bGkXt6AoM5JU7/Mh/gOrpbxsdzU40l1qrS3D+DwcOcTNzRrkjMPsN6egr4bc++11dsd6p5XM+be
 GFRYCEtVlu5p8OLUfLFQcrkc8930OmHEvzmpa5mxfomr+gWp7nVyPfpA9PDo2SUW3rocpL3CbRi
 Gzi7H9TI1NjrOSDhTQab8+poaaTjx85eYlqzZkGBocLSaKDqx2f9Td4szQXaL1zwCpNj81kWhIc
 ZdluymQIbCjLTVUM/ioyKAMLWE5HiIQu27amhjP+C33UYG4zBLHvICLYzJBy3q5M2qRSWuR/kuy
 5gGTz72qwJ4EUSusGIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050106
X-Rspamd-Queue-Id: 8C8E2212988
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95639-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

During concurrency testing, multiple instances can run in parallel, and
each instance uses its own inst->lock while the core->lock protects the
list of active instances. The race happens because these locks cover
different scopes, inst->lock protects only the internals of a single
instance, while the Macro Blocks Per Frame (MBPF) checker walks the
core list under core->lock and reads fields like fmt_src->width and
fmt_src->height. At the same time, iris_close() may free fmt_src and
fmt_dst under inst->lock while the instance is still present in the core
list. This allows a situation where the MBPF checker, still iterating
through the core list, reaches an instance whose fmt_src was already
freed by another thread and ends up dereferencing a dangling pointer,
resulting in a use-after-free. This happens because the MBPF checker
assumes that any instance in the core list is fully valid, but the
freeing of fmt_src and fmt_dst without removing the instance from the
core list is not correct.

The correct ordering is to defer freeing fmt_src and fmt_dst until after
the instance has been removed from the core list and all teardown under
the core lock has completed, ensuring that no dangling pointers are ever
exposed during MBPF checks.

Fixes: 5ad964ad5656 ("media: iris: Initialize and deinitialize encoder instance structure")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v3:
- Removed global word from the commit description
- Added MBPF full form in the commit description
- Link to v2: https://lore.kernel.org/r/20260304-fix-use-after-free-of-fmt_src-during-mbpf-v2-1-b4c78d1bf764@oss.qualcomm.com

Changes in v2:
- Updated the commit description
- Added Fixes tag and Cc stable
- Link to v1: https://lore.kernel.org/r/20260227-fix-use-after-free-of-fmt_src-during-mbpf-v1-1-307cdafffa2a@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 6 ------
 drivers/media/platform/qcom/iris/iris_vdec.h | 1 -
 drivers/media/platform/qcom/iris/iris_venc.c | 6 ------
 drivers/media/platform/qcom/iris/iris_venc.h | 1 -
 drivers/media/platform/qcom/iris/iris_vidc.c | 6 ++----
 5 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..99d544e2af4f 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -61,12 +61,6 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	return iris_ctrls_init(inst);
 }
 
-void iris_vdec_inst_deinit(struct iris_inst *inst)
-{
-	kfree(inst->fmt_dst);
-	kfree(inst->fmt_src);
-}
-
 static const struct iris_fmt iris_vdec_formats_cap[] = {
 	[IRIS_FMT_NV12] = {
 		.pixfmt = V4L2_PIX_FMT_NV12,
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index ec1ce55d1375..5123d2a340e1 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -9,7 +9,6 @@
 struct iris_inst;
 
 int iris_vdec_inst_init(struct iris_inst *inst);
-void iris_vdec_inst_deinit(struct iris_inst *inst);
 int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
 int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index aa27b22704eb..4d886769d958 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -79,12 +79,6 @@ int iris_venc_inst_init(struct iris_inst *inst)
 	return iris_ctrls_init(inst);
 }
 
-void iris_venc_inst_deinit(struct iris_inst *inst)
-{
-	kfree(inst->fmt_dst);
-	kfree(inst->fmt_src);
-}
-
 static const struct iris_fmt iris_venc_formats_cap[] = {
 	[IRIS_FMT_H264] = {
 		.pixfmt = V4L2_PIX_FMT_H264,
diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
index c4db7433da53..00c1716b2747 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.h
+++ b/drivers/media/platform/qcom/iris/iris_venc.h
@@ -9,7 +9,6 @@
 struct iris_inst;
 
 int iris_venc_inst_init(struct iris_inst *inst);
-void iris_venc_inst_deinit(struct iris_inst *inst);
 int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
 int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index bd38d84c9cc7..5eb1786b0737 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -289,10 +289,6 @@ int iris_close(struct file *filp)
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
 	mutex_lock(&inst->lock);
-	if (inst->domain == DECODER)
-		iris_vdec_inst_deinit(inst);
-	else if (inst->domain == ENCODER)
-		iris_venc_inst_deinit(inst);
 	iris_session_close(inst);
 	iris_inst_change_state(inst, IRIS_INST_DEINIT);
 	iris_v4l2_fh_deinit(inst, filp);
@@ -304,6 +300,8 @@ int iris_close(struct file *filp)
 	mutex_unlock(&inst->lock);
 	mutex_destroy(&inst->ctx_q_lock);
 	mutex_destroy(&inst->lock);
+	kfree(inst->fmt_src);
+	kfree(inst->fmt_dst);
 	kfree(inst);
 
 	return 0;

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260226-fix-use-after-free-of-fmt_src-during-mbpf-abc27f573400

Best regards,
-- 
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


