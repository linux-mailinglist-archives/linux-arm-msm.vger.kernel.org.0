Return-Path: <linux-arm-msm+bounces-96698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOrUJ+wqsGlHgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:30:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 180A1251FD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40F313462534
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA0B39935A;
	Tue, 10 Mar 2026 14:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fNnRvrKL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGoXee2n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD0526F288
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773151390; cv=none; b=nj27+Ak9U4snRdBFfLNoYzaJTYOfVEi7VgMvj+KibA6YJbmo5yJMF6xkcsNw3du4pd4OMYvYfOIFOEeyziv6hNex8RWBXiQp726jYUZcVngKp92FlFFLV9ZfkolyxUwe6M0bryjRWuDrwMgUnasgveVaq9VwDWoX+iBTUM5wo0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773151390; c=relaxed/simple;
	bh=nwr5ml5CE4M+1UH0vgoHA3nXLez21CLHhtAg9ftsIUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nb+6llJjjbtMrRoj9zQLmfqvPzPYp9yebeXrXiEiKdakmN5uwepzc+OTICMT+8DdwlRn/1eoEaR8iTdtLZBX0u+cGTmbrl0Krh1ZF+O6ZzS0opOMOlZ/ZbvK7ECCoQpiuazeErIb2T7V7/jXYtTlIR9K+2J7/QPtOYIxM5MOqqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fNnRvrKL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGoXee2n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACnomT3893457
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nge0xHhij69kZq/ALOiFa/phvpJAnKoPueP
	mPswcDik=; b=fNnRvrKLIo1tbj0YTeoThyN+XMPI1HLElCs1aOzOhLX7s+wKSip
	UeNTWKf5tY3NIpQQ31vN+4v8WA7WK5qQLcsUlo59G5yvCzOG+teUtmn2C3uP7OJF
	OK0YBOAImGLDCiFCJ5nYyyI5C4p9M4jMmRWpWLQtcGL2MeReS3BAh7RWGYPsdTHf
	pK3c6U/vXRm9VE6xEEgJiV/D6/LBsaAq4ntWpEPnPjLArB4oJNSeAN+5E/19nJRC
	iNFyh5ETCKZoFkG+jbifmMVuQ3fno816VcJqdoxUqNijPqbFuJbUzEO5yyf4tqnu
	JZndFqeY32U00c7+zl6EwYa5pUyNUWntQvw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmyr8yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:03:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so15045932a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773151388; x=1773756188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nge0xHhij69kZq/ALOiFa/phvpJAnKoPuePmPswcDik=;
        b=dGoXee2n1UZnirWUEPKe1SUGaJGMvhtx/mIvRLaUarK9tiDU0t5b3wCT/pCWD6qxdg
         RisuvliTyjZZl4+jirw8bSm7bOVe+7SaEygnxhhcelU/jjJTEmTccZ+YIDMJFEXyTg+8
         hVLXmQ5EUAjWc3I6Mck+hVrFaDIn+IFKlpe1Qi/xzfrNh3nwtwf1XmYhZwKeg3lgnG9Y
         sjHJMsoCsiqEWq9coZ9pJSBR4X8Mh/GP1LViIP2LfpcJc5D+jrAlPc12Z86rJTS6dbRo
         oG8bc69FxsvST6rJG6Tllyswpi4bc1jF/HM8EC2wUU+bwYKzGOHv1MivnVkobEqo5JIF
         IgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773151388; x=1773756188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nge0xHhij69kZq/ALOiFa/phvpJAnKoPuePmPswcDik=;
        b=TEP/i5e7GeJAguBHsKek1Tg3rJwQ+lk+SGxbqp8EGeVuHSo+zoYqlmDI0d+FqKiMMU
         mWUQM3X99KBLieMajn5psk7ZlDIebFXDlmn+BDuCZEuIXIXVkx7GSAtDZPnvMv/t2hHL
         Jh8OTPm8yxuSUO/2lLRjM4P3iVGawETyVWfRhSRHbq0jprHeunRQlpzGB7DfECvoz71Z
         zvort3gOSUTOq4ZUwWKc2nbmdZsdYhfqBSUb7DtbelIMm37pMItqUiBhrufXYhmFUa8c
         4prcUL5RK1IEUzioTm3apinaqt9Q8vCd70HMpRG83W4lF35M9Z/LY6gM+YQtkfbi5FsZ
         MRuw==
X-Gm-Message-State: AOJu0YyXAPrlcA/UHglaHFt2WKbikAq/d8iTyN+dagGOH9QNaXqEowBX
	U/OmZcrQEhp4Js7TPTARzeJ2zzIIcBWsCf4AhIVsQf0URZXHlq5taqmug+dm9zfbfIldtDle19V
	liQCJvVnxbjUZBN4XE8TmJqoRltwUjgPYDupz/DKmBdkTcSi1BsSCjL2+nxtsAwcI+5n5
X-Gm-Gg: ATEYQzzt/ej8yecoc7mYBi11TsOXtGX7+kJnnAPg2ODjgtRP9W2jkqpx9D6H3H5ZMFu
	rwh/RCUBL1D5mKDX83IjCQByiRzATynd/PP83gGWpZRnhrGLoclkz3R7qsGSc1ZzZOmyGlRYt/P
	RszpBNyATydXehYeEBqLngvv2dCKxI3NHTOVjlzh8pnPcHLZ/qFBef5//MRJRr4+rr2f89yjT/8
	8VLX4jPq47T5u1USs1cWxV8JzRqXprUXXKv3hHv+5aXYkwwvVJyxFMwhH/1KuBXeMORoaZVXJhS
	wKvJqJsakIvbGthHRhgnMFH9KEXvoksA+lBJiZB56jYeo+8x7E1Tx7AIncMQfbTYShZfclq4UDj
	8/fsiyilrm0eKrRQPGk9bBRt8bztS6JSutsM8Stm1slJebPkV
X-Received: by 2002:a17:90b:3e50:b0:356:7025:56c7 with SMTP id 98e67ed59e1d1-359f012c6c8mr2710019a91.5.1773151387766;
        Tue, 10 Mar 2026 07:03:07 -0700 (PDT)
X-Received: by 2002:a17:90b:3e50:b0:356:7025:56c7 with SMTP id 98e67ed59e1d1-359f012c6c8mr2709853a91.5.1773151385210;
        Tue, 10 Mar 2026 07:03:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f06f7993sm3234829a91.5.2026.03.10.07.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 07:03:04 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2] firmware: qcom_scm: don't opencode kmemdup
Date: Tue, 10 Mar 2026 19:32:55 +0530
Message-ID: <20260310140255.2520230-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b0249c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=aXEhxY1WVmm7jXUXl7YA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: zPSXL_FDj8zgjJJ6eYy6rXgjLjiaaTa4
X-Proofpoint-ORIG-GUID: zPSXL_FDj8zgjJJ6eYy6rXgjLjiaaTa4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyMiBTYWx0ZWRfX1uxSauqzlOdn
 rS/avI5EiLJCsZFC+pGNIWzIubBWq14+WIIVLb0Onk55JL7F1xqe4BcZGLc6yPHtm+kaL/WP/Um
 Oqt2izJPAodge3ImamdBW3faqRF6XXUmpEjBAgafK9n5a+gNEBP/yrqW+4ZhgP823U7phm8ZMF2
 CZqwBJ5OolDgrAk3MvonvqBL8jAw5qahHtwrGJNHCaZncqlJWEhDAF//Zl2FpAT0Ol+6V4VcS8Q
 gSyeG+taMnObOjALWqcZq9U5aWYuwuiVEUBdG8pnc8kD1zJXF6bi87D59KMGWz6J1ECYLqy0QR/
 hOKJfCmEqMy2nyC0oQ2ucSzdCfmz4cvWdzt2sSRGMpmy48rz8Q093U31rpZTqbP58hLfTSqtWPL
 ONmBgrBo3MwkTzlQ/CfMTSZHmtWT1z7wf9ZYzwv9Z/hq04y5+J+zOcUAn8CEntHt1I1/+BM3d0G
 gcB+zqKAKmi/+j/bdSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100122
X-Rspamd-Queue-Id: 180A1251FD3
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-96698-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Lets not opencode kmemdup which is reported by coccinelle tool.
Fix it using kmemdup.

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/qcom/qcom_scm.c:916:11-18: WARNING opportunity for kmemdup

Fixes: 8b9d2050cfa0 ("firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601142144.HvSlBSI9-lkp@intel.com/
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
changes in v2: https://lore.kernel.org/lkml/3153e8dc-f43e-42fe-b2a3-9cc4806634e1@oss.qualcomm.com/
 - Added fixes tag.
 - Removed coccinelle from the Subject.

 drivers/firmware/qcom/qcom_scm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 2fe1632f06e9..dda6b0bc1cbd 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -923,14 +923,13 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
 		goto free_input_rt;
 	}
 
-	tbl_ptr = kzalloc(size, GFP_KERNEL);
+	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
 	if (!tbl_ptr) {
 		qcom_tzmem_free(output_rt_tzm);
 		ret = -ENOMEM;
 		goto free_input_rt;
 	}
 
-	memcpy(tbl_ptr, output_rt_tzm, size);
 	*output_rt_size = size;
 	qcom_tzmem_free(output_rt_tzm);
 
-- 
2.50.1


