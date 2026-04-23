Return-Path: <linux-arm-msm+bounces-104279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMbwB4fw6WnzogIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:12:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB3445064F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 91AA230055EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 09:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECF43BC666;
	Thu, 23 Apr 2026 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzWlWMto";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uz288S9F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C335D39B94F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776938225; cv=none; b=smVGZVUDKHwarKv6q/Ze/E+zftofmgOWUxsOx3DdALtv7n8i5jGBY4Rym7ggTeVmramfsCXLHIYiE04IjggXekTuloKaRZmb67MfJC/S5Ne65VqNgxnBju3D2Gd5k3vvgOi05xiUXUF9ExBDAydzLTZ2WvX7r4O/HtWRqrLZ2OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776938225; c=relaxed/simple;
	bh=0kKP6Dj9wE42gurqZT2AbsqWwAYD1wtRnreaMDLt0uA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qBhbDa959RAFSoX8rH2Y2gvcGYr7LtpSdoWvrlP+XmYbgqJhizTcsqOp4PDfL4VFjbKQE4xlFXJYAinRbSRXMVbfGEok2cwLncYs3wagh6DQP+i0+zofFAXLe2Y2Mz6E6moMtVm5GuFi5Zbrez+fqMkff13V9FPiUtknbWgRujc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzWlWMto; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uz288S9F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uJuj3413371
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2CXmq746DVzU+61iR+84gS
	zvzci3OloAb/uD7+epKWU=; b=YzWlWMtoOZRV2k7Yxhwv6r2uwvKM1535jTBC6J
	mhYb4cQQU4MPSnaGHaIV9g9aOMqz7mPoHHE5uKfgOgANWe/pmTAPaSfpeIm0UBBI
	TQN0FXbNBM0gcLvFMcAPEShfDMvpSF5fROCJdS5QjjWnvymKgEDJLOy05sxvpvsw
	KNNJyOuekH8Qvw45hqOSaZn2vcSzYnmENYoKwt9prhkLuTLyJ3ReUi0lU8VMUD1p
	QhonvsT6LahrLUD6MTdqIqgMchyEXVapU8Jed69sa2d8QG1Iv9pijXf9fiiY6SgS
	7vul7aqAUeDPjYJ7oBPu2kihvUpjxe10yYYser+IhxaEBTLw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h6bavu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:57:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24a00d12cso66849335ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 02:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776938222; x=1777543022; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2CXmq746DVzU+61iR+84gSzvzci3OloAb/uD7+epKWU=;
        b=Uz288S9F9Jb7hnxbXYEFbfsHbb7+uAVCna7qzqvYW9OkCZJ+qbUxLUyGQn7C0BbJjy
         03XDFF0lH6mhM/+NyOkzGhj/l0/P+F6QaQDI+osCtA1bYUkRi7Zw1yr3ojCaO/YP9b/8
         d95rJBZ1URuj2YRaI5wpg+I57WrFeKfNMYA70oRGDpM1KyPHCprZHjCAQyIL9ZnK076l
         s8gy7Yalp40I1jU+bgfID2EwMMGh4erZSycgg//Xe//JrCo++JWArZ3GXdlQsNMKVdYn
         amp945OtNN18o00TlEe7iCKjFmGn0soCIOutbljOAXYtXq/6158oTAl1XikuTQVmlJkZ
         PYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776938222; x=1777543022;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CXmq746DVzU+61iR+84gSzvzci3OloAb/uD7+epKWU=;
        b=M9gNG93PmdLVOx5w0mIPFjaCnx6vLzUVgDjc0elmT1l5SebewZMxGj0Y1VvMXULd1X
         yM8WyZ0T0VeFl9bO9ojIarH0tpDwAKd4qV1ysluLKI0XMnIo1Wgd3aKT+0f1LjFpakDU
         09co7nXp0ObMUWTT+qKlSzs6+v1B61kvenCLxVfxWN51scmMjIh+cDTs8/WfGQBEvP5t
         x8nHRmtRTpFKA5161/C3zwWW3G/tUGRqUwvugaD3k1OfFDPF1l1Ihipm/OLXNK+D8cQO
         DaFC+avzgdWe0mxm7a/4Nm5b9bWdXaIYl9t5HEJRyZYAml65PHRstWPoFVFqcUlw4lsW
         IWMg==
X-Gm-Message-State: AOJu0YxsvGswJlYDWtxTy0RFwGZwjOrA7J1zjP+3pCvpQx0oCeIkeYfq
	FovWoQ8kUMhiQXyg3r09KC4OpKbE1lmqda4Bq7iKm6vDaDDVbNZJgEiFvGSvpi0JAb5VxqJmYrZ
	aGgQcevo1XvGENsKhuz2xdyrnf+DqQWfpN8YYix8keA2WqugQzgm+8qzA9XMD+ufvQDOe
X-Gm-Gg: AeBDievWrZeb1qD/hT/Bc2X+jIDoijzl7JxbfF5niMRXJZStEkpWPW218uKStYrK7Il
	vAbjKvYx+d8olWRhvqtemk5qRi6rtvv2djflZF4hiBEv6r9D8FoK73pfsuMcDnSjZ75MqduJ9tT
	MJbdPmO+EcwY1VUEvDgEcQRPSxrAmVq6ztrRMmiGbFoGKRjRWT1PfvG1YCzvAdODnELcb7c87EC
	rEpaiIDO9EA6z/bvzp7Gh/vVV4Deu2shanD+tbmA67ePfPmb8oHkKGWmz/igfH5/ELzF+d1fR6G
	6gYZt/tiizLQzJ4TyG1VR5wFsNN6ef/0sqKqrtUvkDXraZTGF/4h+8jA52gXKv3YtaOPy9xXWXj
	FUSjb+FwWLdRqJQpajWphTGaz7CgRtF50YsjFXq/v9TvPMefxBqZLEoFHEIREzDWc9WSLdlg=
X-Received: by 2002:a17:902:cf12:b0:2b4:460e:6fa8 with SMTP id d9443c01a7336-2b5f9f61d45mr257079765ad.34.1776938222406;
        Thu, 23 Apr 2026 02:57:02 -0700 (PDT)
X-Received: by 2002:a17:902:cf12:b0:2b4:460e:6fa8 with SMTP id d9443c01a7336-2b5f9f61d45mr257079525ad.34.1776938221878;
        Thu, 23 Apr 2026 02:57:01 -0700 (PDT)
Received: from hu-pphansal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm193268955ad.54.2026.04.23.02.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 02:57:01 -0700 (PDT)
From: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 15:26:53 +0530
Subject: [PATCH v2] soc: qcom: smem: Switch partitions to xarray
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-smem-v2-1-44c1aed1ce12@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOTs6WkC/y3MQQ7CIBCF4as0s5aGQaTWlfcwXdA6WhIplVGia
 bi7WN1M8k9evgWYoiOGQ7VApOTYhamE2lQwjHa6knDn0qCkMlLLVrAnL7ZKakKyqmkslOkc6eJ
 eK3PqSo+OHyG+VzXh9/sHUP6AhALFnlrd9zuNxppjYK7vT3sbgvd1OdDlnD86Zvz0nwAAAA==
X-Change-ID: 20260409-smem-3204e1ea277a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com,
        Tony Truong <tony.truong@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776938219; l=6596;
 i=pranav.phansalkar@oss.qualcomm.com; s=20260220; h=from:subject:message-id;
 bh=NKHzcJgCiz5zkqrXN2JkWisgaIBQciKsbf+IQXP6OVQ=;
 b=IWhlLlT0XHAp6+pnJqJprBDaVmOs5CFmKdqIiki+anPnDNTWiuWAVPR5GlVHCNGUhBugteUmd
 5ngN/riLOOuAAgMyi6q2E00QLGPJrUPRAx9hzUxRGkEczBlxjZW5W2e
X-Developer-Key: i=pranav.phansalkar@oss.qualcomm.com; a=ed25519;
 pk=MI1mUPTtmeY/WO9GsLnjtoVy4wYL57rtVnRammLT8B8=
X-Authority-Analysis: v=2.4 cv=f4Z4wuyM c=1 sm=1 tr=0 ts=69e9ecef cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P3-4SwOkx1ZPlWZU1AYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5NyBTYWx0ZWRfXwlLVPKaQ0Jko
 eK22aLJdqHL0TOPG+JILvqzXV52Jdn37iE5Oo65HSbObndmIBAbeOcbgk1wQa8CQt+HLBaoZZva
 RWgEPO1tHVvUehbEqurIw+w7Mz0Lj8IQNtd4+MdOYyhDkpUnNxnaJyHJ2cC5yWo3Ky6+R8FEG/X
 pwGKhp+q5fz5mqVokV75jUoFH34fxav1tEjsa770ySBix9ER3VdV6FHu6LMDR/e0rkM9SJdwxRr
 Zmgh4TbtONyNxU9bmkBBgjHk9NggdFK0gb2yT4r4e4RCimd/JxvZKdbJx8UJrgqPHvE4yK6/rvT
 SmmQ6IXNdYl5sj5jar6tg2xOo6FdKMieY02lMYFXp9plxmnB6/QHdpPtAoMK9xaXDZNJgiPA3iX
 pr56DDFoM6bX0p9I7GzVKAzda5TTtiT6haVHh9IjlaTXLg8B8jl4+hL56qVnvs7pDfyu/+t75lO
 D2NnzZ0/COx8K15Ymyg==
X-Proofpoint-GUID: uQsOwH7h2Db7kzfuNZToi-UBPQKWpLKE
X-Proofpoint-ORIG-GUID: uQsOwH7h2Db7kzfuNZToi-UBPQKWpLKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230097
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104279-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[pranav.phansalkar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1AB3445064F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Tony Truong <tony.truong@oss.qualcomm.com>

The partitions array is currently statically sized and uses the remote
host ID as an index.

Future protocol improvements to allow for more than two hosts in a
partition will require hostIDs to be bitwise significant integers.
This will result in large, sparse host IDs that generally exceed the
current static limit.

Switch to using xarray to efficiently handle these sparse indices and
allow for dynamic growth.

Signed-off-by: Tony Truong <tony.truong@oss.qualcomm.com>
Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
---
Changes in v2:
- Drop "drivers:" from the subject prefix.
- Link to v1: https://lore.kernel.org/r/20260410-smem-v1-1-8e94bb5416a6@oss.qualcomm.com
---
 drivers/soc/qcom/smem.c | 56 ++++++++++++++++++++++++++-----------------------
 1 file changed, 30 insertions(+), 26 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index d5c94b47f431..afb21a778fe7 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -85,9 +85,6 @@
 /* Processor/host identifier for the global partition */
 #define SMEM_GLOBAL_HOST	0xfffe
 
-/* Max number of processors/hosts in a system */
-#define SMEM_HOST_COUNT		25
-
 /**
   * struct smem_proc_comm - proc_comm communication struct (legacy)
   * @command:	current command to be executed
@@ -282,7 +279,7 @@ struct qcom_smem {
 	struct platform_device *socinfo;
 	struct smem_ptable *ptable;
 	struct smem_partition global_partition;
-	struct smem_partition partitions[SMEM_HOST_COUNT];
+	struct xarray partitions;
 
 	unsigned num_regions;
 	struct smem_region regions[] __counted_by(num_regions);
@@ -382,7 +379,7 @@ static struct qcom_smem *__smem = INIT_ERR_PTR(-EPROBE_DEFER);
 int qcom_smem_bust_hwspin_lock_by_host(unsigned int host)
 {
 	/* This function is for remote procs, so ignore SMEM_HOST_APPS */
-	if (host == SMEM_HOST_APPS || host >= SMEM_HOST_COUNT)
+	if (host == SMEM_HOST_APPS || !xa_load(&__smem->partitions, host))
 		return -EINVAL;
 
 	return hwspin_lock_bust(__smem->hwlock, SMEM_HOST_ID_TO_HWSPINLOCK_ID(host));
@@ -530,8 +527,8 @@ int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
 	if (ret)
 		return ret;
 
-	if (host < SMEM_HOST_COUNT && __smem->partitions[host].virt_base) {
-		part = &__smem->partitions[host];
+	part = xa_load(&__smem->partitions, host);
+	if (part) {
 		ret = qcom_smem_alloc_private(__smem, part, item, size);
 	} else if (__smem->global_partition.virt_base) {
 		part = &__smem->global_partition;
@@ -697,8 +694,8 @@ void *qcom_smem_get(unsigned host, unsigned item, size_t *size)
 	if (item >= __smem->item_count)
 		return ERR_PTR(-EINVAL);
 
-	if (host < SMEM_HOST_COUNT && __smem->partitions[host].virt_base) {
-		part = &__smem->partitions[host];
+	part = xa_load(&__smem->partitions, host);
+	if (part) {
 		ptr = qcom_smem_get_private(__smem, part, item, size);
 	} else if (__smem->global_partition.virt_base) {
 		part = &__smem->global_partition;
@@ -730,8 +727,8 @@ int qcom_smem_get_free_space(unsigned host)
 	if (IS_ERR(__smem))
 		return PTR_ERR(__smem);
 
-	if (host < SMEM_HOST_COUNT && __smem->partitions[host].virt_base) {
-		part = &__smem->partitions[host];
+	part = xa_load(&__smem->partitions, host);
+	if (part) {
 		phdr = part->virt_base;
 		ret = le32_to_cpu(phdr->offset_free_cached) -
 		      le32_to_cpu(phdr->offset_free_uncached);
@@ -774,12 +771,11 @@ phys_addr_t qcom_smem_virt_to_phys(void *p)
 {
 	struct smem_partition *part;
 	struct smem_region *area;
+	unsigned long index;
 	u64 offset;
 	u32 i;
 
-	for (i = 0; i < SMEM_HOST_COUNT; i++) {
-		part = &__smem->partitions[i];
-
+	xa_for_each(&__smem->partitions, index, part) {
 		if (addr_in_range(part->virt_base, part->size, p)) {
 			offset = p - part->virt_base;
 
@@ -1016,16 +1012,20 @@ static int
 qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
 {
 	struct smem_partition_header *header;
+	struct smem_partition *part;
 	struct smem_ptable_entry *entry;
 	struct smem_ptable *ptable;
 	u16 remote_host;
 	u16 host0, host1;
+	int ret;
 	int i;
 
 	ptable = qcom_smem_get_ptable(smem);
 	if (IS_ERR(ptable))
 		return PTR_ERR(ptable);
 
+	xa_init(&smem->partitions);
+
 	for (i = 0; i < le32_to_cpu(ptable->num_entries); i++) {
 		entry = &ptable->entry[i];
 		if (!le32_to_cpu(entry->offset))
@@ -1042,12 +1042,7 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
 		else
 			continue;
 
-		if (remote_host >= SMEM_HOST_COUNT) {
-			dev_err(smem->dev, "bad host %u\n", remote_host);
-			return -EINVAL;
-		}
-
-		if (smem->partitions[remote_host].virt_base) {
+		if (xa_load(&smem->partitions, remote_host)) {
 			dev_err(smem->dev, "duplicate host %u\n", remote_host);
 			return -EINVAL;
 		}
@@ -1056,11 +1051,20 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
 		if (!header)
 			return -EINVAL;
 
-		smem->partitions[remote_host].virt_base = (void __iomem *)header;
-		smem->partitions[remote_host].phys_base = smem->regions[0].aux_base +
-										le32_to_cpu(entry->offset);
-		smem->partitions[remote_host].size = le32_to_cpu(entry->size);
-		smem->partitions[remote_host].cacheline = le32_to_cpu(entry->cacheline);
+		part = devm_kzalloc(smem->dev, sizeof(struct smem_partition), GFP_KERNEL);
+		if (!part)
+			return -ENOMEM;
+
+		part->virt_base = (void __iomem *)header;
+		part->phys_base = smem->regions[0].aux_base + le32_to_cpu(entry->offset);
+		part->size = le32_to_cpu(entry->size);
+		part->cacheline = le32_to_cpu(entry->cacheline);
+
+		ret = xa_insert(&smem->partitions, remote_host, part, GFP_KERNEL);
+		if (ret) {
+			dev_err(smem->dev, "fail to insert host %u\n", remote_host);
+			return ret;
+		}
 	}
 
 	return 0;
@@ -1229,7 +1233,6 @@ static int qcom_smem_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	BUILD_BUG_ON(SMEM_HOST_APPS >= SMEM_HOST_COUNT);
 	ret = qcom_smem_enumerate_partitions(smem, SMEM_HOST_APPS);
 	if (ret < 0 && ret != -ENOENT)
 		return ret;
@@ -1249,6 +1252,7 @@ static void qcom_smem_remove(struct platform_device *pdev)
 {
 	platform_device_unregister(__smem->socinfo);
 
+	xa_destroy(&__smem->partitions);
 	/* Set to -EPROBE_DEFER to signal unprobed state */
 	__smem = ERR_PTR(-EPROBE_DEFER);
 }

---
base-commit: 7f87a5ea75f011d2c9bc8ac0167e5e2d1adb1594
change-id: 20260409-smem-3204e1ea277a

Best regards,
-- 
Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>


