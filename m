Return-Path: <linux-arm-msm+bounces-118201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MVi3BJW2UGqA3wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:08:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B8D738D95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:08:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MMYkQD6+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="UVnoE0W/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118201-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118201-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9677305F06B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF1D3EFFDB;
	Fri, 10 Jul 2026 09:05:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BDD3E0092
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:05:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674307; cv=none; b=pwZa/hARWlA717yGaVmUGKIWML91fNtc0f9k5oJP1dpKO8Cctxq1V80qevlMdHQ7NRHXtekL1C7mRwCzLBPdMkEpnTJ4zI6W6JNZ4FkWycVtpfiUjxWuTyKO59d80xuYXYpGBs/YGKZaJbFWlB1BnxtghL+br1N6WDFevAYDmGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674307; c=relaxed/simple;
	bh=VmSVbvVuTt4AN5C8oiuT9E98mX8DRT9XHfPGxKvhc/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K3DcLYG9WWiENSaDnHcN9fE5DosA2jK6ghFwIi8RmvzXC+grCfQO3HgCi+X+Mat9jOrhecORKgoTQ8YAa3JCfbTf7LS6/526m68hF/AC9MCYGrT1M1VL6C/yAXnbyiAlXUoW8dmsqN+KdmWknefxaAWWIiM/c77d7UgQunm7kg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMYkQD6+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UVnoE0W/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7eFaL190679
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rzlf2ZtK9nuTY0MJJWVDEnSEIyJ35HZ7vs1BndCygtQ=; b=MMYkQD6+kI8HwVus
	v+lIuYYzSiya2DyC+iLQXcxhHHHM3KItB/1J6Ce391tk0SPnlpDVwFRr2+Br/rTB
	h6q6MX6ocPwBnqc/JCOZpsnjvmOUgM8awpXqpOeuEuPtbf/y/4ipDRMtFvgW+Bhz
	G8tRID+oL22dAYzIRw/XKe8bmpGfs/C4YHx6z4YOrmUivZIMj24fo8ELPv89hxHf
	Biwmd5xzLMwW4t9mopGddztqe2KBwIJ0RoBYvWvCHl2uER30pNlq/UbGAyO+GDFZ
	2jPOrX2DPYBao1DdTvQKRnzu80FgbnIaVuAjpgTnrYONTCDqojJr6x9tL6cyMx0q
	tDdToQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n14bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:05:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c12e43b98so8195961cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783674304; x=1784279104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzlf2ZtK9nuTY0MJJWVDEnSEIyJ35HZ7vs1BndCygtQ=;
        b=UVnoE0W/7Dw4Allld+YSFVQKmwQvyFhgiF8dl6Xs0tOWpObNUOlQ37CcS5ePu2VjKO
         IC14PeKD6LdKWuU2fbI5qYOIjxv8SIbyh+PNP1vQSxSVpZCLDoY7UZSwnwX9NwVFr0Jb
         G4xAHKCoVnoLhJ2qRI3UMxdt80dJU5j0jnJwZfETMG0jtbaHSZMk9CUc+057p9jTk+Ot
         EE+xUgvnAI2diZ8RiT3v/S74MARadEZcvXb6qjfK412I+KOTm/BDOBPbvSBA7NS7epQM
         dsjtghc7SHJshtSmfbcfFqx2yK1nKjQq2zUNLVbAlPDoIhmKZV9+Gr0Skvowi1oQ1OzG
         VkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783674304; x=1784279104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rzlf2ZtK9nuTY0MJJWVDEnSEIyJ35HZ7vs1BndCygtQ=;
        b=ink5WP27dLxTZhfmSRgW2PusVMbfYEKVri28qlZVjj1dZBy4Jicgav0Vf+WPsd2f5k
         dmheV9qcb5HXlKp3vtxm6y8IugxgPvIYhECZvyQlB+stUuITJ7tLIT+1VhGfHu0TLtR5
         ozr9Ti98Ns0HI/QMAUhj+PvXKUF9D7BfChZydZdBBeYQOvsolC8OpobOBAZ/ek7WUFBC
         IksQlZ3UwKeyxtlar7vftrKnELzHX21fHaWxVXVHIEfoVsWSmt1ELRQfv1sbqrr0dUGk
         PNwf2+iP0WSAzvqVD5NMY8yfIFyFbxH9Vpc9LcACkt6gxXQCcgqGACET/4hNTXNVNtOM
         j10g==
X-Forwarded-Encrypted: i=1; AHgh+RrJ6GkeCKJOHL3rKjBvedI+hFtVxWK5BQ07c+xu8xxyOuxrMbzOHOi+Y2uvU34zne874eOUtJBbTtLN0U2n@vger.kernel.org
X-Gm-Message-State: AOJu0YwLJcBinCa/JBOIny4jGMhNLdl9RQtR+ul8UgAzEQYzsiWbeKDI
	FrdDE+8A+WI/ul0HUsUuFr/4uAJEpBiUhCzrlLVgxKlR+UXlI8UrbpJQDwlr1vkcMxoU1oDMmi/
	3JykrW0srGBGCYj9YAN65NIHrJtW683y20rMMSkmpJVuwMguvGl9coSLUBxYalx6h9twO
X-Gm-Gg: AfdE7cl1ysrWJ1g5v20bK1RMPU/y5imu0dToZ8FuntPntH5aVzrgao6jiqrFcytMGc/
	RzXtQjHdAJYSM87PuTvO+H9z9tlA4FTL9dWvx2cp0Hko/x0gHrYvvBKyMxObNn3PxL2aJPFcnBZ
	lqI0k1V19qeW2JxYt//qrw97OM56WLj6TQws6PKY5hrlmNSrlm8h0TBhRoIHEdrznVCyUm2As3l
	ZwX5gpVOocFAwIjHNFUtDNi88fbNVJYLBH33P1r/dYa36KiWKerJzHPS4dsPV/hH8jCV1Ql4skl
	f1oMDFf7QgonSUK32c+3qEVLTRooXRLPzIXuz7XPamvbPO8rtOsT8ICwSJGOEhPY/pK7vUcNW2o
	FzWgKmNXeE5+W7E4Yqej41x8NrxAuLQL6SM4+kxBvOSOLlZC55qGQbqe1mpYT1TLEifYhAMsTOL
	PqdIIb628H8SAa+5g1Ls7iqLp8lOy9CtRRqpzl4h4Kgek5wex08uO8Dig1NtFJQw==
X-Received: by 2002:a05:622a:1819:b0:51c:1a4c:3c91 with SMTP id d75a77b69052e-51c8b2adf76mr112432961cf.1.1783674303261;
        Fri, 10 Jul 2026 02:05:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1819:b0:51c:1a4c:3c91 with SMTP id d75a77b69052e-51c8b2adf76mr112432391cf.1.1783674302574;
        Fri, 10 Jul 2026 02:05:02 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm259932266b.36.2026.07.10.02.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:05:01 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:04:51 +0200
Subject: [PATCH v4 5/7] media: uapi: Add CAMSS ISP configuration definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260710-camss-isp-ope-v4-5-51207a0319d8@oss.qualcomm.com>
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
In-Reply-To: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX8N+UjXiq0fd6
 zJPrYnT8oOYxIE0gUR8xabu3Tsn+1I2JnuBRur9N8ouH3HjzgVbKd42seFwJWizi7ZyFg1J+Eew
 C8I6AGunEkRbEtbw66nuvhWp48QT+3o=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a50b5c0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kFo2aqxNIXtk6PDOeyQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: xNra-aQMV0FcyNY8by5IQaXR0HmKoRNg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX4DpZ+fJcan9I
 SQVkYo2CeFLj8X7Iqxw4MZTA1Z/AYIhTV3hiVwYHsbloQjFIUgjYKQppKcxBNHyC7TW0sb52g9+
 APCKmCokEs85KiKgOV8rD+wjcGiZm5p8G9VBj0RNfDHtg4v3JVgqwPHl6eJvjuhT5ad2BXeSI72
 mDpn5JuqEAb05EAP0KwstuAJicDWtgVFl0fZv1AkkB4meRKhgr0eEroxkGMR1d2XDL217rM4BwX
 ZzMwgxgw8wEoQjFZ61YiUsvAxCIzb2Iu86XT9cxau97XTfe23r54Bz1WdHui4s3Yh1C1JBcUGin
 nQoXpo5pYG4lEBlEX4id1DYHJhI2DcUDeQz7G/O8PK1sQq7YrKJEgJYY4r+UHLDut8G/CShLKoS
 1wWuGs29cF7hwZR72zdJUZTPBX/Ewrqs3TnFf+GcQRcwOTH+nwR61eVs8K6SYi2lx6hmm3RNUmB
 wkBYLab8vMxaZ+dpHjQ==
X-Proofpoint-GUID: xNra-aQMV0FcyNY8by5IQaXR0HmKoRNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118201-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90B8D738D95

Add the uapi header camss-config.h defining the ISP parameter
structures used by the CAMSS Offline Processing Engine (OPE) driver.
This includes structures for white balance, chroma enhancement and
color correction configuration.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/uapi/linux/camss-config.h | 161 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 161 insertions(+)

diff --git a/include/uapi/linux/camss-config.h b/include/uapi/linux/camss-config.h
new file mode 100644
index 0000000000000000000000000000000000000000..d0d087eea08337fea14211d356195cacea2fb050
--- /dev/null
+++ b/include/uapi/linux/camss-config.h
@@ -0,0 +1,161 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Qualcomm CAMSS ISP parameters UAPI
+ *
+ * Uses the generic V4L2 extensible ISP parameters buffer format defined in
+ * <uapi/linux/media/v4l2-isp.h>.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _UAPI_LINUX_CAMSS_CONFIG_H
+#define _UAPI_LINUX_CAMSS_CONFIG_H
+
+#include <linux/types.h>
+#include <linux/media/v4l2-isp.h>
+
+/**
+ * enum camss_params_block_type - CAMSS ISP parameter block identifiers
+ *
+ * Each value identifies one ISP processing block.  The value is placed in
+ * the @type field of &struct v4l2_isp_params_block_header.
+ */
+enum camss_params_block_type {
+	CAMSS_PARAMS_WB_GAIN = 1,
+	CAMSS_PARAMS_CHROMA_ENHAN = 2,
+	CAMSS_PARAMS_COLOR_CORRECT = 3,
+	CAMSS_PARAMS_MAX,
+};
+
+/**
+ * struct camss_params_wb_gain - White Balance gains
+ *
+ * Implements the CLC_WB pipeline module.  The pipeline applies three
+ * sequential operations per channel:
+ *   1. Subtract sub-offset (black-level substraction)
+ *   2. Multiply by gain    (colour balance)
+ *   3. Add add-offset      (output pedestal)
+ *
+ * Gains are 15uQ10 (15-bit unsigned, 10 fractional bits). Offsets
+ * are 16-bit unsigned, normalised to full input scale (65535 = 1.0)
+ *
+ * @header:   block header; @header.type = CAMSS_PARAMS_WB_GAIN
+ * @g_gain:   green channel gain (15uQ10, 1024 = 1.0)
+ * @b_gain:   blue  channel gain (15uQ10, 1024 = 1.0)
+ * @r_gain:   red   channel gain (15uQ10, 1024 = 1.0)
+ * @g_sub:    green sub-offset, subtracted before gain (16u)
+ * @b_sub:    blue  sub-offset, subtracted before gain (16u)
+ * @r_sub:    red   sub-offset, subtracted before gain (16u)
+ * @g_add:    green add-offset, added after gain (16u)
+ * @b_add:    blue  add-offset, added after gain (16u)
+ * @r_add:    red   add-offset, added after gain (16u)
+ */
+struct camss_params_wb_gain {
+	struct v4l2_isp_params_block_header header;
+	__u16 g_gain;
+	__u16 b_gain;
+	__u16 r_gain;
+	__u16 g_sub;
+	__u16 b_sub;
+	__u16 r_sub;
+	__u16 g_add;
+	__u16 b_add;
+	__u16 r_add;
+	__u16 _pad[3];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_chroma_enhan - RGB to YUV colour transfer matrix
+ *
+ * Implements the CLC_CHROMA_ENHAN pipeline module. All coefficients are
+ * signed 12-bit fixed-point Q3.8 (range roughly -8.0 to +7.996).
+ *
+ * RGB2Y - Luma (Y) ceofficients
+ * Y = v0 * R + v1 * G + v2 * B
+ *
+ * @luma_v0:  R-to-Y coefficient (12sQ8)
+ * @luma_v1:  G-to-Y coefficient (12sQ8)
+ * @luma_v2:  B-to-Y coefficient (12sQ8)
+ * @luma_k:   Y output offset    (9s,  0 = no offset)
+ *
+ * RGB2Cb - Chroma (Cb) coefficients
+ * Cb = a x ((B - G) + b(R - G)) + KCb
+ * with:
+ *   a = ap, when (B-G) + b(R-G) > 0; a = am, when (B-G) + b(R-G) ≤ 0;
+ *   b = bp when (R-G) > 0; b = bm when (R-G) ≤ 0
+ *
+ * @coeff_ap: Cb positive coefficient (12sQ8)
+ * @coeff_am: Cb negative coefficient (12sQ8)
+ * @coeff_bp: Cb positive coefficient (12sQ8)
+ * @coeff_bm: Cb negative coefficient (12sQ8)
+ * @kcb:      Cb output offset        (11s)
+ *
+ * RGB2Cr - Chroma (Cr) coefficients:
+ * Cr = c x ((R - G) + d(B - G)) + KCr
+ * with:
+ *   c = cp, when (R-G) + d(B-G) > 0; c = cm, when (R-G) + d(B-G) ≤ 0
+ *   d = dp when (B-G) > 0; d = dm when (B-G) ≤ 0
+ *
+ * @coeff_cp: Cr positive coefficient (12sQ8)
+ * @coeff_cm: Cr negative coefficient (12sQ8)
+ * @coeff_dp: Cr positive coefficient (12sQ8)
+ * @coeff_dm: Cr negative coefficient (12sQ8)
+ * @kcr:      Cr output offset        (11s)
+ *
+ * @header: generic block header; @header.type = CAMSS_PARAMS_CHROMA_ENHAN
+ */
+struct camss_params_chroma_enhan {
+	struct v4l2_isp_params_block_header header;
+	__u16 luma_v0;
+	__u16 luma_v1;
+	__u16 luma_v2;
+	__u16 luma_k;
+	__u16 coeff_ap;
+	__u16 coeff_am;
+	__u16 coeff_bp;
+	__u16 coeff_bm;
+	__u16 coeff_cp;
+	__u16 coeff_cm;
+	__u16 coeff_dp;
+	__u16 coeff_dm;
+	__u16 kcb;
+	__u16 kcr;
+	__u16 _pad[2];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_color_correct - colour correction matrix
+ *
+ * Implements the CLC_CC pipeline module.  The matrix computes:
+ *   Out_ch0 (G) = a0*G + b0*B + c0*R + k0
+ *   Out_ch1 (B) = a1*G + b1*B + c1*R + k1
+ *   Out_ch2 (R) = a2*G + b2*B + c2*R + k2
+ *
+ * @header:  block header; @header.type = CAMSS_PARAMS_COLOR_CORRECT
+ * @a:       G-input coefficients per output channel (12s;
+ *           a[0]=Out_G, a[1]=Out_B, a[2]=Out_R)
+ * @b:       B-input coefficients (12s)
+ * @c:       R-input coefficients (12s)
+ * @k:       per-output-channel offsets (typically 9s effective)
+ * @qfactor: Q-format selector (2u):
+ *           0 = 12sQ7  (range ~-256.0 .. +255.992)
+ *           1 = 12sQ8  (range ~-128.0 .. +127.996)
+ *           2 = 12sQ9  (range ~-64.0  .. +63.998)
+ *           3 = 12sQ10 (range ~-32.0  .. +31.999)
+ */
+struct camss_params_color_correct {
+	struct v4l2_isp_params_block_header header;
+	__u16 a[3];
+	__u16 b[3];
+	__u16 c[3];
+	__u16 k[3];
+	__u16 qfactor;
+	__u16 _pad[3];
+} __attribute__((aligned(8)));
+
+#define CAMSS_PARAMS_MAX_PAYLOAD		\
+	(sizeof(struct camss_params_wb_gain)	+\
+	 sizeof(struct camss_params_chroma_enhan)	+\
+	 sizeof(struct camss_params_color_correct))
+
+#endif /* _UAPI_LINUX_CAMSS_CONFIG_H */

-- 
2.34.1


