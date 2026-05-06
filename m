Return-Path: <linux-arm-msm+bounces-106055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJNcIKXL+mlTSwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 07:03:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D49094D6396
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 07:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC5F6305D125
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 05:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C403002BD;
	Wed,  6 May 2026 05:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="biMxOZ/v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YsO+ZSvq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786FB2FDC38
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 05:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778043687; cv=none; b=NH2S2dUThoZKLxk+4GZXixTHKmaXQ7NkBUftb6HXB9ihCJTYWLsPGmpU5H3N4/zFWwvOf1duVVppIbM+9m5IV0Co55vVBiUcI8nufP3BImsf8Jedzvf8cXDCLgFIENvfQOfh/kgQvintmQ/Cqhztc/peF47Sxz89SAb0mDTOCAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778043687; c=relaxed/simple;
	bh=5zpQdSqV6VmTxNYAMSNsJhL31D8kbXtfkRuD/nTWxHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RK7RQrFiI44cOlHe6PGqEXXRWuzlFQetzP/FBpJKSUDS2A31GGGyaKzaKDdyM6lzOIeLLPAWDP6nnHM82QYYvLzJFAT6Q0InJ1WOKKw6yVFj4nypbU+1o24bsXh09TucV0jsfFDTotQFw/trh9kL56IlZU3AipLUc3nr32pvDj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=biMxOZ/v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YsO+ZSvq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645N1dew912453
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 05:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LKwytmYNAHb
	suFxFyJ0lrz9c5UpNtf6ZMxghB57imjM=; b=biMxOZ/vCko+giNiOW9Y1dhfePb
	3nxs7atEexqNgozB0WdXo1LNZMDv0q6Uc5nL98KEQ0XAp759O7AM7ZC+6F2Mryij
	Pn2sdbfQCwmxCRaC00pl1Tmr+0WB7vJmArDcBcVZI+Ue7Pfa812iwC4Sh6jOh+4H
	IC05yumKH8RJHWg6j7jGhNrq+n8WbNu6hLJnVxJjbnejw9WnEpSnbzZ71L8BDgBW
	90D+nRAh03rJaDzbzt9zN2zDmlEBhn9DSctCpQ40f7yJst9ceu8RIgDxBPWveMGr
	z/dVW/HiY7QTgGdg/nNAvMMMebdUku/8hiqzctBZUQ+9yDPWwYGttr5SltQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj7jjxkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 05:01:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so6112133b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 22:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778043684; x=1778648484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKwytmYNAHbsuFxFyJ0lrz9c5UpNtf6ZMxghB57imjM=;
        b=YsO+ZSvqW45LDkFWAUZ6RbY+228mgFJKgd5KA5VAJPyhqPrl4imclCCZqbukFQSRmh
         vYpe9Se1ZVV/LRqm9WbGG/F5fEO8wKAPPcCvHdWvhyKq1bmFALmutIjmO9x77WuFGDmy
         a00U72jPfgJrjruH5HpdhFc6/Bc2Rib5kYlzogrXtJI+4duYBbHtwG8KXLZdYKa64/o5
         gNuW9cZwuRTzW9zQkCONSipOhMXSVsqmOrTzl6TFVev5zR3eK+EQM7y15M3z9ho4QvXq
         FpjkROT0N9uJdZ06R79l2jYD8Nijmu89Ppely9MGOdArtCq26CKYsqegG4JZqf/1x2Ab
         DZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778043684; x=1778648484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LKwytmYNAHbsuFxFyJ0lrz9c5UpNtf6ZMxghB57imjM=;
        b=B8hchB1RabK5STgQRh1LnbNgON8x1y6yfI/er5BcPdwEhj3+cWgHm5GrsgMJzSGrsL
         VJh0cz/uTPX3QNn6HxUvsPoOpn+wT/qF6u3jjyQKGqQYP/Q7kUYpcfvJr3OPP39KwJE5
         DspFzyw5KjEviSKwHgFKe9vjz/ZN00hB1lNJHnxB73Z6Wx40835HAnTE4bMouxQN2uQO
         f43hKtH8z+97BAp0FzbAluMMX3o9D2uMyFKSN0aSHI8mjYim1dHnz6dh3TglSGfJWZ7b
         782VfUS6a+WlScADpUiCsqkXMTKWCR2CKjSPZKaNOJHpnd26cIBvWBaqNccdcMP0dz52
         j9MA==
X-Forwarded-Encrypted: i=1; AFNElJ+VAB/qXh3rQ76Wu3MErT7w8Uev9BPBJReUQmzkffkO3dE5mCV86XlpbKtd4H9v6Dx7ol77CMkQwu8varUA@vger.kernel.org
X-Gm-Message-State: AOJu0YwAU+NEqRpR0KSVHcGx3f7dhOiAEZXvKZd15ZM4a0knwRecl9nK
	HQWs8C1UAxYhVYRh4fcb6rvzfYo+VpLduuJ6h9QkIvOhhtRWrX+gZzH5ibq8wbLxdc/H3/Eh5BX
	2KBIvJxVbOGBGFR5jpycJdyk7A2sqWKYZT+C4Ce0jFSf4zORNC/m7TylDWHuCtAAtVutqXBhmdL
	j0
X-Gm-Gg: AeBDievuwaZDAxtatEAKgXSs/PP0nwTsQ9lQwAYYdTyDSw75CTij2E2J2tWr+GSMMcv
	mvHdQS8DyGm4OvTmftEijGh9BE51mQhM8d++7Q80vFkg+CFCtnU8k1zGWb+hO5H3fM8/t/TMSw2
	CFWfvLGg6vsS/IIwoaHq/cqFwmHQVwZ1Mrvc5hVnTtDFcjP+FjYRrnlfoeWDI1rnVVt4p22fKLu
	0MPhOK/xbrUbPA5TAXN1RC6zq2wJM3kLftrwahnbz7t2KLD24FeX377rb+eoL1/esweFSVBydB+
	+XWO3+KzMa/PVYNKr0q77iJkxKoRn7kX7CTx0gd+U3rmfMVGu6eCje8vj2pyMP6iwAHlg1DtgFg
	wGL1PuGdkSkkrqaMiCMnZtFQPVbyE1O5AmicCddmNoVemOSG6+csLps59C8OZglsdl2vfEQ==
X-Received: by 2002:a05:6a00:198c:b0:82c:b808:4c59 with SMTP id d2e1a72fcca58-83a5ea3fe9bmr1729947b3a.46.1778043683426;
        Tue, 05 May 2026 22:01:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:198c:b0:82c:b808:4c59 with SMTP id d2e1a72fcca58-83a5ea3fe9bmr1729889b3a.46.1778043682694;
        Tue, 05 May 2026 22:01:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcfc0sm4891620b3a.42.2026.05.05.22.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 22:01:22 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 3/5] soc: qcom: mdt_loader: add qcom_mdt_pas_map/unmap_devmem_rscs()
Date: Wed,  6 May 2026 10:31:05 +0530
Message-ID: <20260506050107.1985033-4-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA0NiBTYWx0ZWRfX2KltwpKqZGqL
 QCCBOJM7BL3i+Tk/Tz7ksL1Ovc/g/kxSpqYy7Hi/o0/RUdRdvyKMoQXKuKq70G/Dewjjos2yJ/p
 uPGr5AmaIR2hRiFhxvltVHvfnK5BZ+T9j5Mxltw0YqVcLmjgFXamc8y6WpXFAeSrtxZqQwSzjNp
 OjKOxBkCqrzXjH4N4+SdT1IP2DwHqnSalm00qt0GTbSuIHxJsVs6i33T98nI6tu/elZ4CaqgEGC
 6/q3jRH9fPRYLYZbQIFzliCFuz62nYxW/nEjJgbSmrYhFXyUpH0pfJ0q6Kh7VIZV9+379gX97Bt
 ojcjhIid08oeY0Q/SU1jUQF9kbgHmz6uoP6rfp1Y+d9NnGM9TMufSwvom7VkdNGGLxFrC2ENlcl
 kZUf+3f12TEBnrvzoVQGfC9rwuVJmROjsFpoj2uhahGBfUVXVrCuRvadKrrfSzi3XTU/O4VwUMw
 YcvqRE+W5U3gQa7F6xg==
X-Proofpoint-GUID: ZOxQ6sAhjjKDuOgES9T7gEfyu5K99ANq
X-Authority-Analysis: v=2.4 cv=FpA1OWrq c=1 sm=1 tr=0 ts=69facb24 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=N53UB9TyAAAA:8 a=kQh6dVwvXRLgiowIQNEA:9 a=2VI0MkxyNR6bbpdq8BZq:22
 a=DoZGhvB21A6Bz61VoUpf:22
X-Proofpoint-ORIG-GUID: ZOxQ6sAhjjKDuOgES9T7gEfyu5K99ANq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060046
X-Rspamd-Queue-Id: D49094D6396
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
	TAGGED_FROM(0.00)[bounces-106055-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[map_data.info:url,map_data.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

Add qcom_mdt_pas_map_devmem_rscs() and qcom_mdt_pas_unmap_devmem_rscs()
to IOMMU map/unmap RSC_DEVMEM resource table entries on SoCs where Linux
runs as hypervisor at EL2 and owns the IOMMU mappings for remote
processors.

The map function fetches the resource table via
qcom_scm_pas_get_rsc_table() and iterates over RSC_DEVMEM entries using
rsc_table_for_each_entry(), calling iommu_map() for each. Mapped entries
are tracked in a per-PAS linked list stored in a hash table keyed by
pas_id for later lookup by the unmap function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c       | 189 ++++++++++++++++++++++++++++
 include/linux/soc/qcom/mdt_loader.h |  22 ++++
 2 files changed, 211 insertions(+)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index ed882dd43587..dd84d0eba152 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -11,14 +11,34 @@
 #include <linux/device.h>
 #include <linux/elf.h>
 #include <linux/firmware.h>
+#include <linux/hashtable.h>
 #include <linux/io.h>
+#include <linux/iommu.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/rsc_table.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
 
+#define RSC_TABLE_HASH_BITS	5  /* 32 buckets */
+
+static DEFINE_HASHTABLE(qcom_pas_rsc_table_map, RSC_TABLE_HASH_BITS);
+
+struct qcom_pas_devmem_rsc {
+	struct fw_rsc_devmem *devmem;
+	struct list_head node;
+};
+
+struct qcom_pas_rsc_table_info {
+	struct resource_table *rsc_table;
+	struct list_head devmem_list;
+	struct hlist_node hnode;
+	int pas_id;
+};
+
 static bool mdt_header_valid(const struct firmware *fw)
 {
 	const struct elf32_hdr *ehdr;
@@ -507,5 +527,174 @@ int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *f
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
 
+static void __qcom_mdt_unmap_devmem_rscs(struct qcom_pas_rsc_table_info *info,
+					 struct iommu_domain *domain)
+{
+	struct qcom_pas_devmem_rsc *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, &info->devmem_list, node) {
+		iommu_unmap(domain, entry->devmem->da, entry->devmem->len);
+		list_del(&entry->node);
+		kfree(entry);
+	}
+}
+
+/**
+ * qcom_mdt_pas_unmap_devmem_rscs() - IOMMU unmap device memory resources
+ *					for a given Peripheral
+ * @ctx:	pas context data structure
+ * @domain:	IOMMU domain
+ *
+ * Looks up the resource table info previously stored by
+ * qcom_mdt_pas_map_devmem_rscs(), unmaps all RSC_DEVMEM entries from the
+ * IOMMU domain, and releases the associated memory.
+ */
+void qcom_mdt_pas_unmap_devmem_rscs(struct qcom_scm_pas_context *ctx,
+				    struct iommu_domain *domain)
+{
+	struct qcom_pas_rsc_table_info *info;
+	struct hlist_node *tmp;
+
+	if (!ctx || !domain)
+		return;
+
+	hash_for_each_possible_safe(qcom_pas_rsc_table_map, info, tmp, hnode, ctx->pas_id) {
+		if (info->pas_id != ctx->pas_id)
+			continue;
+
+		__qcom_mdt_unmap_devmem_rscs(info, domain);
+		hash_del(&info->hnode);
+		kfree(info->rsc_table);
+		kfree(info);
+		break;
+	}
+}
+EXPORT_SYMBOL_GPL(qcom_mdt_pas_unmap_devmem_rscs);
+
+static int __qcom_mdt_map_devmem_rscs(struct device *dev, void *ptr, int avail,
+				      struct iommu_domain *domain,
+				      struct qcom_pas_rsc_table_info *info)
+{
+	struct qcom_pas_devmem_rsc *devmem_info;
+	struct fw_rsc_devmem *rsc = ptr;
+	int ret;
+
+	if (sizeof(*rsc) > avail) {
+		dev_err(dev, "devmem rsc is truncated\n");
+		return -EINVAL;
+	}
+
+	if (rsc->reserved) {
+		dev_err(dev, "devmem rsc has non zero reserved bytes\n");
+		return -EINVAL;
+	}
+
+	devmem_info = kzalloc(sizeof(*devmem_info), GFP_KERNEL);
+	if (!devmem_info)
+		return -ENOMEM;
+
+	ret = iommu_map(domain, rsc->da, rsc->pa, rsc->len, rsc->flags, GFP_KERNEL);
+	if (ret) {
+		dev_err(dev, "failed to map devmem: %d\n", ret);
+		kfree(devmem_info);
+		return ret;
+	}
+
+	devmem_info->devmem = rsc;
+	list_add_tail(&devmem_info->node, &info->devmem_list);
+
+	dev_dbg(dev, "mapped devmem pa 0x%x, da 0x%x, len 0x%x\n",
+		rsc->pa, rsc->da, rsc->len);
+
+	return 0;
+}
+
+struct qcom_mdt_map_cb_data {
+	struct device *dev;
+	struct iommu_domain *domain;
+	struct qcom_pas_rsc_table_info *info;
+};
+
+static int qcom_mdt_map_devmem_cb(u32 type, void *rsc, int offset,
+				  int avail, void *data)
+{
+	struct qcom_mdt_map_cb_data *d = data;
+
+	if (type != RSC_DEVMEM)
+		return 0;
+
+	return __qcom_mdt_map_devmem_rscs(d->dev, rsc, avail, d->domain,
+					  d->info);
+}
+
+/**
+ * qcom_mdt_pas_map_devmem_rscs() - IOMMU map device memory resources for
+ *				     a given Peripheral
+ *
+ * This routine should be called when it is known that the SoC is running
+ * with Linux as hypervisor at EL2 where it is in control of the IOMMU map
+ * of the resources for the remote processors.
+ *
+ * @ctx:	    pas context data structure
+ * @domain:	    IOMMU domain
+ * @input_rt:	    input resource table buffer when resource table is part of
+ *		    firmware binary; pass NULL if not available
+ * @input_rt_size:  size of @input_rt; pass zero if @input_rt is NULL
+ *
+ * Returns 0 on success, negative errno otherwise.
+ */
+int qcom_mdt_pas_map_devmem_rscs(struct qcom_scm_pas_context *ctx,
+				 struct iommu_domain *domain,
+				 void *input_rt, size_t input_rt_size)
+{
+	struct qcom_mdt_map_cb_data map_data;
+	size_t output_rt_size = QCOM_MDT_MAX_RSCTABLE_SIZE;
+	struct qcom_pas_rsc_table_info *info;
+	struct resource_table *rsc_table;
+	int ret;
+
+	if (!ctx || !domain)
+		return -EINVAL;
+
+	rsc_table = qcom_scm_pas_get_rsc_table(ctx, input_rt, input_rt_size,
+					       &output_rt_size);
+	if (IS_ERR(rsc_table)) {
+		ret = PTR_ERR(rsc_table);
+		dev_err(ctx->dev, "error %d getting resource_table\n", ret);
+		return ret;
+	}
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info) {
+		ret = -ENOMEM;
+		goto free_rsc_table;
+	}
+
+	map_data.dev = ctx->dev;
+	map_data.domain = domain;
+	map_data.info = info;
+	info->pas_id = ctx->pas_id;
+	info->rsc_table = rsc_table;
+	INIT_LIST_HEAD(&info->devmem_list);
+
+	ret = rsc_table_for_each_entry(rsc_table, output_rt_size, ctx->dev,
+				       qcom_mdt_map_devmem_cb, &map_data);
+	if (ret)
+		goto undo_mapping;
+
+	hash_add(qcom_pas_rsc_table_map, &info->hnode, ctx->pas_id);
+
+	return 0;
+
+undo_mapping:
+	__qcom_mdt_unmap_devmem_rscs(info, domain);
+	kfree(info);
+free_rsc_table:
+	kfree(rsc_table);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_mdt_pas_map_devmem_rscs);
+
 MODULE_DESCRIPTION("Firmware parser for Qualcomm MDT format");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 7c551b98e182..304aebb2b9cd 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -8,8 +8,11 @@
 #define QCOM_MDT_TYPE_HASH	(2 << 24)
 #define QCOM_MDT_RELOCATABLE	BIT(27)
 
+#define QCOM_MDT_MAX_RSCTABLE_SIZE	SZ_16K
+
 struct device;
 struct firmware;
+struct iommu_domain;
 struct qcom_scm_pas_context;
 
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
@@ -23,6 +26,12 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
 		      const char *firmware, phys_addr_t *reloc_base);
 
+int qcom_mdt_pas_map_devmem_rscs(struct qcom_scm_pas_context *ctx,
+				 struct iommu_domain *domain,
+				 void *input_rt, size_t input_rt_size);
+void qcom_mdt_pas_unmap_devmem_rscs(struct qcom_scm_pas_context *ctx,
+				    struct iommu_domain *domain);
+
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  const char *fw_name, void *mem_region,
 			  phys_addr_t mem_phys, size_t mem_size,
@@ -52,6 +61,19 @@ static inline int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx,
 	return -ENODEV;
 }
 
+static inline int qcom_mdt_pas_map_devmem_rscs(struct qcom_scm_pas_context *ctx,
+					       struct iommu_domain *domain,
+					       void *input_rt,
+					       size_t input_rt_size)
+{
+	return -ENODEV;
+}
+
+static inline void qcom_mdt_pas_unmap_devmem_rscs(struct qcom_scm_pas_context *ctx,
+						  struct iommu_domain *domain)
+{
+}
+
 static inline int qcom_mdt_load_no_init(struct device *dev,
 					const struct firmware *fw,
 					const char *fw_name, void *mem_region,
-- 
2.53.0


