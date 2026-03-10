Return-Path: <linux-arm-msm+bounces-96689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIQfLP0nsGnYgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:17:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5610D251AAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5A76E30D1454
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6941E385528;
	Tue, 10 Mar 2026 13:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NEKuwLaC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cd8pZbnd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E2838B13C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773150741; cv=none; b=oZdcuGVZTqE1y7Ip1A9boK4qhaspd8x6f2hhNtlO9uH5ZUozv0rQY5pedkLGSgt+hDTI086PHYGkLqfTJJk6ysUOlhi3Btx2X0tzxAK/KIFfh4bny6K5qstkDJocClObeMEIaJXx8KB9V2evAkVVE8QsYaFGB7TSfDk+tW20gdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773150741; c=relaxed/simple;
	bh=cmUO7eLo3YfN1R+TeCkHuV+UYuymQZWbHZ/FgYZVwRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YwaKcP7E9RptPiIPUR6N2nB9UDMN/je2x24SZR7S3GhJQyC2dvUl2/mf3T1LEEioG6lfE7q8wNu1vW1EWEXpEL/8zMwPmeU13iEtY7EQZiyFW2Xx8N5A27w2w6sCemjyEeB4c1mi0kvDRJfy5LBnzEwzWd05yvBJ+g3gxyZvBL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEKuwLaC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cd8pZbnd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaYZn789294
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E0X5Yam2Y/K
	A0Hu2oSOl/+Yjcj2TbDdAlIdpUoAMbcc=; b=NEKuwLaCFFyhxPbtY8/CY5Wxngn
	lCpWvwMlOjXjNf/k0giwW2jhpi8HYjpAgZQ/BkbJ5/viAOuKFsaETGPjWo+2xZOD
	XVmJhVl0NLgNLc1g62kKn62nbzxC6urFERB1sxC7j+AdjRImMnuWwjeau8LXizvD
	x4ZDo+pS+HXUTgA851wsdZPWHUguC6XTjlin9DQU/KhvH79THlvZK2MknwkuItSE
	0OzCVOYzLHKFy377sLVetrfWX8dbmDFv/Yf4IN+AWyYyerGh59DuCXURImk9EVPF
	edQEAmnXZlX1d5acJ0Ns65bnOC4AA+JWHBxIlAGi7CcCNCtywBcqqeWR8Ew==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekv4d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:52:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35641c14663so13513591a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773150738; x=1773755538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0X5Yam2Y/KA0Hu2oSOl/+Yjcj2TbDdAlIdpUoAMbcc=;
        b=Cd8pZbnddvfC9dzP/0H0SN+iKAgANdEYXHqMYy9z5hjI01ivQ5jT17gFKOMpXc9cTm
         u4WpGA3iYRb+s40nT8bZpVUL0veXbLg4ecb/RCUGPJec131kqqYuQuCsREnIFLwfCJqA
         sUIFS1ZXwG2zZwDMo2OEOvPCyX+zgO3ewJjB7T9LG6FTjh2bO+FI5HERcJaX8Cj+IzM3
         ovqBPLenm7VtpPqLawSIfvRySseWDutm3x50wtMb/FuPxDgrHADJsBybUpkoay5NrlNH
         RWydLC8EFEbO3wRBeAaevvkd41gjP+sFGUMSD0dxaNXeFr4jSAGuzpo7bted1i5KqGFy
         JH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773150738; x=1773755538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E0X5Yam2Y/KA0Hu2oSOl/+Yjcj2TbDdAlIdpUoAMbcc=;
        b=dpVUnng73t2C7BWHY/jph8gpE/iasRCGyCv3S3DEIq7k2v9zFTyogtZaR6VqJE5sDM
         CufKAFsSmKO0tAyySRMGkIBCpMb7z84opoPNnTqCbqPDtGeBy3EyN3YWRm9JLtZFOonD
         i+QDsqKPBWbK5WbFz7ZqNgTj0RNGMKIRue/131DSXjjyYyzPVPlQE/CePqOfo7XjE50L
         1qEl1osbNdrklMuwQYt9a3mzMiLSlDtO2aqBLenqTYntGsfBIvhfHjTvRXJJhE7ImcqV
         mwfw7Wniiu0PCbm5AUXKf9XGE0RKF0oCM/Icjw+ZMnzZujxdMRSP7d2FYHoGUXJgg4+f
         wsxQ==
X-Gm-Message-State: AOJu0Yyuifssrrcxd7NaS5Wiu+BLRdh7M8XCQF+gsr2gQmfJmo7SjXWP
	QMZghCoxecQn7Rd67SeXzEZRf+t1fjDBVM0fcDMbNJfiqMuISvYW5eswBsf7NOXXV/0V6yKTnkE
	57oyucQ6T9soq23AIPTj5WUEZBp4be236UPyE5SebEJbAar4bcuj5s6Sqd6Rnfs0W/T/cDg3xKA
	4r
X-Gm-Gg: ATEYQzw1CVkUUYCWxrQwbVBxIVlN7auOd0BfTeWJfO9RZA4HwNg3WMdEoF2yq0VmVjF
	0tUCelHZO3QIATp9/2T8A2sJzHis+NdWKIdK/7SXzMisbfQt1hPXd65qiVX+r6Iv/O41K9d4/Fd
	HRTXBoOJG8KBaJefsdHvel7g+62Ea/Q8oMelciWORKGXJtSVHRKgjJsBNR741XIh3psqQSQPENw
	0H+Agrsy4lgK723O3qLKrGiBcMvqu/3eYXA9qExKPuLNvJTQ9TLPHGdh3MTyDHAcy9/Eu59XlVZ
	E1dumRoQNIVb8IQXHz7Eat/IKGU8HS8W5nGgHBTLpjUs1QKmbMKkJhsLm6uaBt0pAWanfbrak88
	R/grIAOcYXNu6+/Fs/cgs/QSWRS9lDiKO/7x9GxsYUzlCHg6z
X-Received: by 2002:a17:90b:1d44:b0:359:f825:5700 with SMTP id 98e67ed59e1d1-359f82559d6mr1598618a91.10.1773150738277;
        Tue, 10 Mar 2026 06:52:18 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:359:f825:5700 with SMTP id 98e67ed59e1d1-359f82559d6mr1598583a91.10.1773150737703;
        Tue, 10 Mar 2026 06:52:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f088e4bbsm3333149a91.9.2026.03.10.06.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:52:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] remoteproc: qcom: pas: Map/unmap subsystem region before auth_and_reset
Date: Tue, 10 Mar 2026 19:22:05 +0530
Message-ID: <20260310135205.2497789-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260310135205.2497789-1-mukesh.ojha@oss.qualcomm.com>
References: <20260310135205.2497789-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Py8wpshuVTlP5sOEpA0bKmdNqq7Kj5ny
X-Proofpoint-ORIG-GUID: Py8wpshuVTlP5sOEpA0bKmdNqq7Kj5ny
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyMCBTYWx0ZWRfX+wXCRfMu3IWE
 tTFo8aYOzA2YVyWhMTK0S2QjhWmIEeDvDJvUlujtg1NBc5+cuKb8oo2H4W8MSGg5kl+zmG/pZsC
 MkC1aqaAxaBF0bbEM/EosxBunWOaAF86wlVsSBWwB7vdJqxNWzVvTVcuxuzfirSqacv1ED+QgYI
 cDqY5IbPplEJWqOBMhCM4xraG2PGNL8IC2v+eBNDbimVcz+jDEJwFXFjKBMA56tv3+IigLEZSum
 F8fk9TMeCT/p4DsrYKo55HC9bOABs6yN+Z1rcONpixnheLqKePrAALZlusmYgQAWcydPO1ePwMe
 +RbTOElNG6GPs2EVeRzxLJXz4Fq/1cQfachZPm6LGsMj5Dp4CA+eH+cfdBdbPgVWw047b9n+Zjo
 raJw8+6hDPjb3W6pozvVQtFu3BFmtnHJWG80woZEF85ypa8MXdKn36SkR56ZjMm1UYhIls+p9s+
 GA97QFpxPyEutDt/YPg==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69b02213 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=g0QXFxIELhCdF1mkvcsA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100120
X-Rspamd-Queue-Id: 5610D251AAD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96689-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Qualcomm remoteproc drivers such as qcom_q6v5_mss, which do not use the
Peripheral Authentication Service (PAS), always map the MBA region before
use and unmap it once the usage is complete. This behavior was introduced
to avoid issues seen in the past where speculative accesses from the
application processor to the MBA region after it was assigned to the remote
Q6 led to an XPU violation. The issue was mitigated by unmapping the region
before handing control to the remote Q6.

Currently, most Qualcomm SoCs using the PAS driver run either with a
standalone QHEE or the Gunyah hypervisor. In these environments, the
hypervisor unmaps the Q6 memory from HLOS Stage-2 and remaps it into the
Q6 Stage-2 page table. As a result, speculative accesses from HLOS cannot
reach the region even if it remains mapped in HLOS Stage-1; therefore, XPU
violations cannot occur.

However, when the same SoC runs Linux at EL2, Linux itself must perform the
unmapping to avoid such issues. It is still correct to apply this mapping/
unmapping sequence even for SoCs that run under Gunyah, so this behavior
should not be conditional.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 48 +++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 3bde37ac510c..033d618ccba9 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -138,6 +138,13 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
 		return;
 	}
 
+	pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
+	if (!pas->mem_region) {
+		dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
+			&pas->mem_phys, pas->mem_size);
+		return;
+	}
+
 	memcpy_fromio(dest, pas->mem_region + total_offset, size);
 }
 
@@ -240,9 +247,18 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 			return ret;
 		}
 
+		pas->dtb_mem_region = ioremap_wc(pas->dtb_mem_phys, pas->dtb_mem_size);
+		if (!pas->dtb_mem_region) {
+			dev_err(pas->dev, "unable to map dtb memory region: %pa+%zx\n",
+				&pas->dtb_mem_phys, pas->dtb_mem_size);
+			goto release_dtb_metadata;
+		}
+
 		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
 					pas->dtb_firmware_name, pas->dtb_mem_region,
 					&pas->dtb_mem_reloc);
+		iounmap(pas->dtb_mem_region);
+		pas->dtb_mem_region = NULL;
 		if (ret)
 			goto release_dtb_metadata;
 	}
@@ -320,8 +336,23 @@ static int qcom_pas_start(struct rproc *rproc)
 		}
 	}
 
+	/*
+	 * During subsystem restart, when coredump is enabled, region is mapped but
+	 * not unmapped there, NULL check to reuse the mapping if its already mapped.
+	 */
+	if (!pas->mem_region) {
+		pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
+		if (!pas->mem_region) {
+			dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
+				&pas->mem_phys, pas->mem_size);
+			goto release_pas_metadata;
+		}
+	}
+
 	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
 				pas->mem_region, &pas->mem_reloc);
+	iounmap(pas->mem_region);
+	pas->mem_region = NULL;
 	if (ret)
 		goto release_pas_metadata;
 
@@ -447,6 +478,13 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
 	if (is_iomem)
 		*is_iomem = true;
 
+	pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
+	if (!pas->mem_region) {
+		dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
+			&pas->mem_phys, pas->mem_size);
+		return NULL;
+	}
+
 	return pas->mem_region + offset;
 }
 
@@ -637,11 +675,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 
 	pas->mem_phys = pas->mem_reloc = res.start;
 	pas->mem_size = resource_size(&res);
-	pas->mem_region = devm_ioremap_resource_wc(pas->dev, &res);
-	if (IS_ERR(pas->mem_region)) {
-		dev_err(pas->dev, "unable to map memory region: %pR\n", &res);
-		return PTR_ERR(pas->mem_region);
-	}
 
 	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
 						       pas->mem_phys, pas->mem_size);
@@ -660,11 +693,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 
 	pas->dtb_mem_phys = pas->dtb_mem_reloc = res.start;
 	pas->dtb_mem_size = resource_size(&res);
-	pas->dtb_mem_region = devm_ioremap_resource_wc(pas->dev, &res);
-	if (IS_ERR(pas->dtb_mem_region)) {
-		dev_err(pas->dev, "unable to map dtb memory region: %pR\n", &res);
-		return PTR_ERR(pas->dtb_mem_region);
-	}
 
 	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
 							   pas->dtb_mem_phys,
-- 
2.50.1


