Return-Path: <linux-arm-msm+bounces-101120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEC1EJcVzGnfOAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:42:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F8F370205
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB415303FFE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871D238F634;
	Tue, 31 Mar 2026 18:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALDFIw3f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7z9my0O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76180378D87
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774982408; cv=none; b=b6SFfEC81oLhrsy54B1jBOe2Xz+YhZ93mTRSHmeiUqGUMdhqv4BOZbux/5JpdVd8OKt25YEe6CWq91mV5DQPNsksf0Th7K4voNJIR5qIRSBMhr+3o2FmTjpWRLZA/uD018I0ZlL+Q0VXDQzJmJHgRMP7B6kqUM0viDR7BgJ5cB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774982408; c=relaxed/simple;
	bh=kQh4ERDhvewAzvV4JUrura1u3cYcd+i7wmebA/4KCmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QDzcypGNRta5hNyEIPk9u0F37hcrb2bR8Gubb8Q6TGciBgEUQClvWpRb8nqyDJDdYv2OaryPX7zFTfOGsOX1J4dWBV7KBbsMTX/hJo2g94L+Mg1kboPZigDVyiyYuQSLdNLn1VA7RLdlMUMvfNM/1TaBmZTtY6bB0NW9cvHWn9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALDFIw3f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7z9my0O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdlqL3663889
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TqrmT8vtxOr+1cGP7GmVeC+z+eOJ5SDsSF+
	jxrUDhoA=; b=ALDFIw3fB++pHtva+y/b/UnOL0kpEXPDJJj/7tvYLA/Nmp+AoW0
	54ibeFRuaTjDD8i7c+03SGtZ48lu3KeEfYrUY4W+FkOkyCdNkwwxpifViU3EC5PB
	LuM/RZ2JCQxSerx2DtLjMhtjUCyhL1qaFlEv0K6maky6HvyM48GuS2wGV8XKa3Sn
	Ip59658PzzZRX1NNHxEwcdYxB96Z55q7mzYvESHRt48TVzvuqYpaDPuwjIlEbh/Y
	clKSNgf99jelDT+vylXmEodQCbExj67eCuBgDvb7b5hYKKTscXiQe6unlCeQzpoG
	p3nfQ/cVLIiWOkltGWam2poBPA52VXu2jmQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ga379h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:40:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da86144daso2739497a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774982405; x=1775587205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TqrmT8vtxOr+1cGP7GmVeC+z+eOJ5SDsSF+jxrUDhoA=;
        b=E7z9my0OpRDZ8NRpgxWowKRirFDM0K+IDHmPHKdh93Mk/6oTeV0SoNpLl6FpyCxKp2
         /gTNbgcoRmMockIUPSetWz1Y4tdIhl4Tyslj9O+jkLCFyjKN9YLdnpjAco80lvu87pCQ
         mcjNk7xJom8XxkdYFOfQtkH0sm3zAsBj7/TMpCAmkSGBkm8GqDUJN2lHyByGprS8evtP
         BUtBz4UEeUggtNRwUH9+FCGGqFz/rmzlbJKJ6a+Fmk0JnZRUypIoEGqI3OxO79MPFyD8
         17jzzrLbD4F27IYaZvDuP2ZcqLUMHzl7a1crZtAnoh/yD8bZnrEUsPQi9DkV+KTefUkg
         11dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774982405; x=1775587205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqrmT8vtxOr+1cGP7GmVeC+z+eOJ5SDsSF+jxrUDhoA=;
        b=OugepRWpONToPo3bDnDIrsoB41NuHRaYCs2qebJgqBdNQHU6Fy+Owb1oeKoPEECWDR
         ndyEBzxW+PduwjWp33sXYKm4KdvuCrJJ+Nm8VniMpmN0IeOsB802HqXcJS5GtLD8Lost
         EwKYkmhQwFseVJEGobRnO8csbuYg8Gz91BzppJthjFj4e8EqUqs8y0F5iw2vt26x8dUb
         pqcc6IsZY+aRuljQMqE27dSaqm2x9o9EiBxkU9PRhsBLVMbsz08eUA0TuHFDoK5pMPw0
         9OLsy3kz4WWvV8eA3lMeB0shWd1MrObc9aC1l8pYntRMvJAQ/NsrRY/sy6XM3ji/92Vw
         GqsA==
X-Gm-Message-State: AOJu0Ywyu8u8kD2KRRaEExG/JJiNVYnL8uXaoerjheYLEzfBUoSTp451
	VZJG2lxtQjeQUZrYFeTy4cKS5DJKwdZ3o00H1i8iU0ih30bbipWVX9qlQ333bP0jYz2ns//O2Vq
	2BhJiFZGYK2QQwX3uSkczCKnwud195hgSXn3uNJ5Offs3B6u+1A02qM6iT/laSQwhr018
X-Gm-Gg: ATEYQzyqWEwZw8pWsr9GoAmokuvanJo6dX6p6FVp5CN4SDtgIDbkijqqpDZ7myZcdFt
	ghvqMVdDczykxz6CZYqIrwZt8swJ2n4EXqxF6bE5K4WBjvomYvjWpWDitPfnkzzV0EEtmmb0IaB
	t3tE1SVMI5KYNHwSmLcNvGdUeZZkG5qGOlt8xzowA2ayB/K2sS2rz8zFpnRT49ltnDskL3AaLK0
	oXONrJNBiV03qETHTnYcU//KyFW6uK8SM/+oCGJZuyySPOQ8+ZMIVPwCcuiEXKiAm+ffgqK2uxk
	BeWTOJh/vgjhhf2/j5KA/KWwjjg1bD7lodo4tKktlcjJvU8YVHc7BUzaKTJ/rZ5tVAXqHNl+8MV
	aCzQitGVe2FJwycjnCa9VGSZO84NZq0s5X7PNFb3AN/Lz0vii
X-Received: by 2002:a17:90a:d406:b0:35d:972c:b3d6 with SMTP id 98e67ed59e1d1-35dc6e9dbc3mr350265a91.9.1774982405031;
        Tue, 31 Mar 2026 11:40:05 -0700 (PDT)
X-Received: by 2002:a17:90a:d406:b0:35d:972c:b3d6 with SMTP id 98e67ed59e1d1-35dc6e9dbc3mr350238a91.9.1774982404456;
        Tue, 31 Mar 2026 11:40:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe607c3esm3149693a91.4.2026.03.31.11.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:40:04 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 1/5] remoteproc: qcom: fix sparse warnings for __iomem annotated mem_region
Date: Wed,  1 Apr 2026 00:09:53 +0530
Message-ID: <20260331183957.2015440-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KJpXzVFo c=1 sm=1 tr=0 ts=69cc1505 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ctNy7iMIxOgxZ4Gl-TwA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: VcYJe51dMr1vS8Q5JgzaoR2puZg4obkK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3OSBTYWx0ZWRfX8HaJAESMOHrX
 QWDvx31d5Yp1PqiHD/06WL+/BVviQX+JrmuN/5I7P8hvH4oDn+NIERMnFwMxk0VXRoduWcr5OuO
 0doeLPY75RV9RR2iyrI9vqFa1yM1mqFL96BDsUMFFYdb9dWtybScOAbpDZr/Djs6ovc7pgZNzay
 CyQqisQLEgsqF7oSIqLWHBVVVNxP+U9tAPB9hW+DfIkoKsWtqD0I8E+XKpn7jFEBg65h5OXMchj
 eO6VbWv33E/V8dENqi1fb2OOjyygX6n/RPX28z1/eWpNGtGyMBsT0BPQIbB+xfpNO74mAA2Qr7Y
 7H57ilOaDp8fgxxBp1s/CeTfRBiGsQ4uRgooHY9OXuYxKMZvUUbWLYIVYJsdI6SQ+xu6jqkEoWS
 VXf36X+FLUtHXvx/C1epX05Zz53Y/SjKTVSUFYQOIWMyNMK2yE5z3cg9D6gUvsUXS80KhgApzUH
 D1Tk/UvgbDF1kMQfnbw==
X-Proofpoint-ORIG-GUID: VcYJe51dMr1vS8Q5JgzaoR2puZg4obkK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310179
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101120-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 92F8F370205
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The firmware memory regions in qcom_adsp, qcom_pas and qcom_wcnss are
mapped using devm_ioremap_wc() / devm_ioremap_resource_wc(), which
return void __iomem *. However, the mem_region (and dtb_mem_region)
fields in the respective driver structs were declared as plain void *,
causing sparse to flag address space mismatches:

qcom_q6v5_adsp.c:639:26: warning: incorrect type in assignment (different address spaces)
qcom_q6v5_adsp.c:639:26:    expected void *mem_region
qcom_q6v5_adsp.c:639:26:    got void [noderef] __iomem *
qcom_q6v5_pas.c:141:45: warning: incorrect type in argument 2 (different address spaces)
qcom_q6v5_pas.c:141:45:    expected void const volatile [noderef] __iomem *src
qcom_q6v5_pas.c:141:45:    got void *
qcom_q6v5_pas.c:637:25: warning: incorrect type in assignment (different address spaces)
qcom_q6v5_pas.c:637:25:    expected void *mem_region
qcom_q6v5_pas.c:637:25:    got void [noderef] __iomem *
qcom_q6v5_pas.c:654:29: warning: incorrect type in assignment (different address spaces)
qcom_q6v5_pas.c:654:29:    expected void *dtb_mem_region
qcom_q6v5_pas.c:654:29:    got void [noderef] __iomem *
qcom_wcnss.c:540:27: warning: incorrect type in assignment (different address spaces)
qcom_wcnss.c:540:27:    expected void *mem_region
qcom_wcnss.c:540:27:    got void [noderef] __iomem *

Fix this by annotating the struct fields with __iomem to correctly
reflect the address space of the underlying mapping.

These regions are subsequently passed to qcom_mdt_load(),
qcom_mdt_load_no_init() and qcom_mdt_pas_load(), all of which take
void * and use plain memcpy()/memset() internally to write firmware
segments into the region. This is intentional and safe: the mappings
are write-combining (WC), which on arm64 permits bulk CPU stores
without requiring the memcpy_toio()/memset_io() accessors. Changing
the MDT loader API to accept void __iomem * would be a more invasive
change and would affect callers.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3:
 - New change to fix the sparse issue reported on v2.

 drivers/remoteproc/qcom_q6v5_adsp.c |  6 +++---
 drivers/remoteproc/qcom_q6v5_pas.c  | 10 +++++-----
 drivers/remoteproc/qcom_wcnss.c     |  6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index b5c8d6d38c9c..d2b50af6d748 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -105,7 +105,7 @@ struct qcom_adsp {
 
 	phys_addr_t mem_phys;
 	phys_addr_t mem_reloc;
-	void *mem_region;
+	void __iomem *mem_region;
 	size_t mem_size;
 	bool has_iommu;
 
@@ -318,7 +318,7 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	int ret;
 
 	ret = qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware,
-				    adsp->mem_region, adsp->mem_phys,
+				    (__force void *)adsp->mem_region, adsp->mem_phys,
 				    adsp->mem_size, &adsp->mem_reloc);
 	if (ret)
 		return ret;
@@ -491,7 +491,7 @@ static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iom
 	if (offset < 0 || offset + len > adsp->mem_size)
 		return NULL;
 
-	return adsp->mem_region + offset;
+	return (__force void *)adsp->mem_region + offset;
 }
 
 static int adsp_parse_firmware(struct rproc *rproc, const struct firmware *fw)
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 46204da046fa..fb22f699c571 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -100,8 +100,8 @@ struct qcom_pas {
 	phys_addr_t mem_reloc;
 	phys_addr_t dtb_mem_reloc;
 	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
-	void *mem_region;
-	void *dtb_mem_region;
+	void __iomem *mem_region;
+	void __iomem *dtb_mem_region;
 	size_t mem_size;
 	size_t dtb_mem_size;
 	size_t region_assign_size[MAX_ASSIGN_COUNT];
@@ -241,7 +241,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 		}
 
 		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
-					pas->dtb_firmware_name, pas->dtb_mem_region,
+					pas->dtb_firmware_name, (__force void *)pas->dtb_mem_region,
 					&pas->dtb_mem_reloc);
 		if (ret)
 			goto release_dtb_metadata;
@@ -319,7 +319,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	}
 
 	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
-				pas->mem_region, &pas->mem_reloc);
+				(__force void *)pas->mem_region, &pas->mem_reloc);
 	if (ret)
 		goto release_pas_metadata;
 
@@ -445,7 +445,7 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
 	if (is_iomem)
 		*is_iomem = true;
 
-	return pas->mem_region + offset;
+	return (__force void *)pas->mem_region + offset;
 }
 
 static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 4add9037dbd5..da68bc1903be 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -94,7 +94,7 @@ struct qcom_wcnss {
 
 	phys_addr_t mem_phys;
 	phys_addr_t mem_reloc;
-	void *mem_region;
+	void __iomem *mem_region;
 	size_t mem_size;
 
 	struct qcom_rproc_subdev smd_subdev;
@@ -158,7 +158,7 @@ static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
 	int ret;
 
 	ret = qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
-			    wcnss->mem_region, wcnss->mem_phys,
+			    (__force void *)wcnss->mem_region, wcnss->mem_phys,
 			    wcnss->mem_size, &wcnss->mem_reloc);
 	if (ret)
 		return ret;
@@ -327,7 +327,7 @@ static void *wcnss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_io
 	if (offset < 0 || offset + len > wcnss->mem_size)
 		return NULL;
 
-	return wcnss->mem_region + offset;
+	return (__force void *)wcnss->mem_region + offset;
 }
 
 static const struct rproc_ops wcnss_ops = {
-- 
2.53.0


