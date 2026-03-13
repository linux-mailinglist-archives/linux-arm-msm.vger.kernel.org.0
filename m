Return-Path: <linux-arm-msm+bounces-97623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL8XJOtqtGn9ngAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 20:52:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9522A28972D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 20:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A415C300BE2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 19:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840FB3DA7E1;
	Fri, 13 Mar 2026 19:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pakiRFFu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cz3Xoiul"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF5035B63C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773431523; cv=none; b=ojKU5xBqhBHqzJe2g8/mX5DcjTWgsGGiyq6bXScQPpWo7ohatwVQzRwH4Hdj+v+ebx97WKsdw3CX6SzFPXxDXiBkyMpUiLsCyEnTze6EyFgStZ5flLPJ2GhMVs40PCYZpnGYhtO/d2snmAyyi/rGCWNT/e3VIUEQht/OnO8lJwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773431523; c=relaxed/simple;
	bh=YIJjSKOhZVX+K8FjsJ52plrTzbmi2ydtq+YD40MpNIA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HDDoWHFgHC0BE2h2JqCqcanqgCEuSP2o6baDBJq4EdW4dlSRJNz38YFBKPcIhLDapjbiUraHcb4Js5/3BJ+J50hOGaQ1jZA770yCEncFgGFbwBgZkXvnsrwFCpNa9+6/0ThRZojEBtVb5bw37KVbJyh46mk1H/ZfKFzABiiPBw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pakiRFFu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cz3Xoiul; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DDk4cE792882
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q+nWH8D2+fx
	5k6f9HMsm9mC82uN85/VXlNOrGfA9tvI=; b=pakiRFFu47tbKM4S5E33/IJGHJu
	uw0BxJN0PMuoHFusHrER4wAAmNRl5EPCOjHD32saey0tTUmPwe3wXEHHOMsQk6aq
	l3W+H0c1CIgHYj3Y8N6dH8NKGUv2gioc01jZRxNCQrJUNaLJMstfJIz/JOtBQxPc
	dZL3rj16cvC9mX1IzDxdbZytXQUMMjkOIJl3Vh3XFmjQvPBN/hWyF2L3AI0prngv
	vyYnsi4IOlzQHZeWrVCsFcyOTi3PasnlQUFAmRiSoUqiCeAtISq3JJJe3gt9QGX/
	4jd7BhMUpCqjMsds6a8EdbbfYoJK7pFjANaqESwzGPqwJR7QIFJKYaKx2NQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt2q2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:51:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50900e9803aso112351161cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773431518; x=1774036318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+nWH8D2+fx5k6f9HMsm9mC82uN85/VXlNOrGfA9tvI=;
        b=cz3XoiulR3kp9maUagaDY2gpWjmGiDiOmbf7mowNrdP7eHXFQ9xF71S+Ebvah9Va4I
         UBFRAMCCXmr73BbZnUDqmsf+IFPp/H0YlbFuMIQnywGAUs05nm3liWCAIsrJ+8lw9lfa
         lWvqB8iJJfhjp7fJiND6sgtTKAJix2abPly20Mfi87AQN8lqwi/wV5w/J1Dkbwcq7Dmf
         Q01jyt6MShgO+k7trvcrk1kbi4q+aLNpMlZxdMeqbHHVcPy0NL7JYVCdIP601llrF8Gx
         6zEo3fDeV9HdXhg3uG/h+2aSjMmBJuMB+NAidgKsL77Pr9Xjwe733CtYbcXXJqa+fQnq
         k2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773431518; x=1774036318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q+nWH8D2+fx5k6f9HMsm9mC82uN85/VXlNOrGfA9tvI=;
        b=eix6/0WbC/LPLwKY/fhevZ1MlYP2Wukkvm2RPQMzlS8sSTKotMnckYE3GEeK2+A/on
         EwItOIJTcZspvhEya6ph81X8z6QjTF/BasEwp8tYNY7EgrJb7Id2vTWfIzyqmInck2xZ
         Kj9k70U3LAT7UlqJPpU4WSTYkPNVAdufERh6Oa3B2BXx6HoVhlq62CgRKaDEb9XKlsjA
         i4fKjrwb1f1Yogrir9gGIopMbkPjPSr5iV4XqmEQDC2CX01v2jfzjPS5F8mylo7ZB3Q+
         uWssjjdkL7ZBR4mOCfFCUYW1OxlG9C/4zvkipUaePsGFS1KuBU431QPi66qc5uejwpQg
         DXxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG9/8Dw4qVg3PDLSx6dWqvup1YXz9k0bQDJINmXjSUwsAzSB5hRSxsNxjqwmhFRHgrg6SrHPOMH1J2GIaX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/x+MEtfCU0M1C5Y4Pl6jlsmDIgrtedsQ7t9m+Wh9jIvSIUqby
	aRitdHpYRPh66jThgXlrqpx35ODinYRxu6oT9FsUl63gO8V3446OCzrfUOk+uPUWi5+0D8GZaz+
	11ZwSXuclPgwW2APS8M5Niu/8g1Q5qdHV8aNx4y0QUyFe/rWDvcnZt7uHM1UWiBaj4hXhBJ8/ON
	td
X-Gm-Gg: ATEYQzzcYhelV3YI+oNqZGfuNonk1ktfqxcz8oDhugC62cS3yTuc0jLckvnD8sNII0P
	NnyB31DYp6DJ+tG9IPI4BkOBzOcofqekaC1yL/ugDJM3DQ1QFehIhzjTkTP8hoq6TkIUQPKCYJb
	lURmKhwqUjS0pUS16j08mMg5czKQws0dBxtecwhsMm7zbQeWnbBKQyH7p/iOHFfnb2bsi4sqxiB
	kusZWB7Xpp30gPYOl7ttNjCvwi4Z2Tb881vXgZc7u5nR7PzIQRHjGvbQLACyJd7/kFeN16i4ER0
	9QyPl2XX0XpF98okEFN6Hjc9XBxNFs3+t5gwrc+0C5i1FljDGLcUC4rHuR8JX53yCpCOr/dIV6p
	IhbNuPITyzpB+wFkcksTUXpVnlcwANhxs8ELKiuYnOFWNrEW2a9QtO2Jghhi2rLo6JPz9cQbcop
	yaJfEQOipk5wGi
X-Received: by 2002:a05:620a:4041:b0:8cd:b38e:9042 with SMTP id af79cd13be357-8cdb5a1c838mr617489085a.8.1773431518457;
        Fri, 13 Mar 2026 12:51:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:8cd:b38e:9042 with SMTP id af79cd13be357-8cdb5a1c838mr617486685a.8.1773431517956;
        Fri, 13 Mar 2026 12:51:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:146f:4491:fa7c:17d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1b22e7sm20112060f8f.16.2026.03.13.12.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 12:51:57 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 1/3] media: qcom: camss: Add per-format BPL alignment helper
Date: Fri, 13 Mar 2026 20:51:50 +0100
Message-Id: <20260313195152.275196-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313195152.275196-1-loic.poulain@oss.qualcomm.com>
References: <20260313195152.275196-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b46adf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=EmnR0zIBfwTrhgJCIOkA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 6idBqBJqQqChgXqU9dnVvyw9lBc9jQOp
X-Proofpoint-ORIG-GUID: 6idBqBJqQqChgXqU9dnVvyw9lBc9jQOp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE1NiBTYWx0ZWRfX5g9CdM0EIPRs
 qdsnW6P+t+aRgs4L9gBObcAh6lmcfM2TJ2sACpAUc5R/k+gdhQMyFAG7hFFointQoHVWuRR6mvR
 UlSIeE4yC5EFVyP+OcQo6dJFNP6sIJ5i3e16RxL204FbG6/bSd+uCIJA5JiJDMM7iAy+ddJSquf
 2EL3ZBFqnThmPLEn412/6iGG95BlwXDX+4toKuSgXZ1H96ilar+vBhREceBgMW+j8v4OOR6u109
 BYVS8VAOtRPTSMHcyJAh0hNd5dF37LV4wv9wtqljbzd2/0gzXkMpV1PTV1GDtQcE1Ho7vuTaJdQ
 efGV5Uj1Y8WJv0VPhzRvU1Ye6Rm+1u5bByQVzt6+ArIANv93t4EqUyjST1yXMabfyIz4vgM2vEt
 T1eK1wnoZqrySeC6mwbJfjGZdGtyirVlh1pbi1yo1njdWb4541DxUN5gWY/7sKBgpaSSVq+792Q
 yRAn3KNMGGmamMKAvpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130156
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97623-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9522A28972D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add camss_format_get_bpl_alignment(), a helper that returns the
bytes-per-line (BPL) alignment requirement for a given CAMSS format.

Different RAW Bayer packing schemes impose different BPL alignment
constraints (e.g. RAW10 requires multiples of 5 bytes, RAW12 multiples of
3 bytes, RAW14 multiples of 7 bytes, etc.). Centralizing this logic
makes the alignment rules explicit and avoids duplicating them across
the pipeline.

This will allow PIX paths and buffer preparation code to correctly
round up BPL values to hardware-required boundaries.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-format.c | 14 ++++++++++++++
 drivers/media/platform/qcom/camss/camss-format.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-format.c b/drivers/media/platform/qcom/camss/camss-format.c
index 4a3d5549615c..52cb01306ee0 100644
--- a/drivers/media/platform/qcom/camss/camss-format.c
+++ b/drivers/media/platform/qcom/camss/camss-format.c
@@ -7,8 +7,10 @@
  * Copyright (c) 2023, The Linux Foundation. All rights reserved.
  * Copyright (c) 2023 Qualcomm Technologies, Inc.
  */
+#include <linux/bits.h>
 #include <linux/bug.h>
 #include <linux/errno.h>
+#include <linux/lcm.h>
 
 #include "camss-format.h"
 
@@ -33,6 +35,18 @@ u8 camss_format_get_bpp(const struct camss_format_info *formats, unsigned int nf
 	return formats[0].mbus_bpp;
 }
 
+/*
+ * camss_format_get_bpl_alignment - Retrieve required BPL alignment for a given format.
+ * @format: a pointer to the format
+ *
+ * Return the required alignment, in bytes.
+ */
+unsigned int camss_format_get_bpl_alignment(const struct camss_format_info *format)
+{
+	/* Minimal number of bytes required to keep the line length an integer number of pixels */
+	return lcm_not_zero(format->mbus_bpp, BITS_PER_BYTE) / BITS_PER_BYTE;
+}
+
 /*
  * camss_format_find_code - Find a format code in an array
  * @code: a pointer to media bus format codes array
diff --git a/drivers/media/platform/qcom/camss/camss-format.h b/drivers/media/platform/qcom/camss/camss-format.h
index 923a48c9c3fb..4f87ac8c4975 100644
--- a/drivers/media/platform/qcom/camss/camss-format.h
+++ b/drivers/media/platform/qcom/camss/camss-format.h
@@ -55,6 +55,7 @@ struct camss_formats {
 };
 
 u8 camss_format_get_bpp(const struct camss_format_info *formats, unsigned int nformats, u32 code);
+unsigned int camss_format_get_bpl_alignment(const struct camss_format_info *f);
 u32 camss_format_find_code(u32 *code, unsigned int n_code, unsigned int index, u32 req_code);
 int camss_format_find_format(u32 code, u32 pixelformat, const struct camss_format_info *formats,
 			     unsigned int nformats);
-- 
2.34.1


