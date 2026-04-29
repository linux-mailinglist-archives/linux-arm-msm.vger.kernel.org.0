Return-Path: <linux-arm-msm+bounces-105194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2I0IGXbx8WkOlwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:54:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E67FA493C54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 584793066BF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3781F3F23A6;
	Wed, 29 Apr 2026 11:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ywzbqcvi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ncz7o91S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28D23F2107
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 11:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777463585; cv=none; b=Tj3/7cj2KyX92ju5vcfCFi+in25QdrQ8qZE5OttzIczidxxLeOiFj3AlmnUhqx1OtmYgmqEnbgfkU9wmTL/dm7XLwgAjBLDwkiwpqttzFuC+Na6tFPRCur6fQ0lScRHBgpt+mm6g03Hc4/nmumG0DY1+8Bz7ylMLJ/BMNmuSUxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777463585; c=relaxed/simple;
	bh=gsyF2PW/H+ORD8YYvDzNXk6jj6WeSv382lMJ5hD0A88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVhx9ZZbfn5QaeiQsf4NJUBHEbXF+fisxac/P6sznqPr5TKQaHNTDulJMdZSe9vsJhyDLis00qWn2lOl1ojZB6PZ1VqJ8p3h86Rj6Lmq/hzxrX/U6jnpsABRBwz66sErOpvXP16+ItsJgDY7EVjaABlHiEWgPVqvKBUtmUVbJB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ywzbqcvi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ncz7o91S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8ptgA1641654
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 11:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bxhR3SkO9vY
	ADfLVr/ouc8VSgYJXfEP1UY/fHhdgPyE=; b=YwzbqcviVlm52cl/DxZLi/f5gpL
	+ozKUchELeL0r0+fwj6UaLbRv6iY18d7IfIV0OHumCOJjIDfFHnQSo4I0M9JLFMO
	dF7fEGGCn+hWZ4t4v8EmlDFiW6T7C1wMWBlJNsnNf9ZpSb0GST/mA7o1oPs51HpD
	44eTK9trA+WnzPOs8fZJBkXNGUYF3SqJntfzXG+jS67M80OH/5tapzXoYKwzNd1k
	Df5g+tnOybsIUIyluzbOdxb2x/L5i4t+axSxcVzHtybCodLhnM/bXDowD8VR1ltR
	naEi9u6HL1xdVr/Fy8jXxaN7BQCZtZriLhKcWnIU4M15HHPJ0j/bOpYF7BA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj81cdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 11:53:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so20105048eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777463582; x=1778068382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxhR3SkO9vYADfLVr/ouc8VSgYJXfEP1UY/fHhdgPyE=;
        b=Ncz7o91SapT/sVJP56yw/9LZUFchjbO+rO7ux7fO7On1cZcFjK0ewKJRgU7Uommq7v
         y0c1H7FapsBfDP/uGaPYJH29Jdhnx//G1PB3ubF2naXeqziYzgweXlXbOaPQu+5VUsqL
         A7zRBdEtWuk1R4meMKph7VHo345XLA5dUz7fngfv/xb2xIdFMzk7guTCZbKVInqREumB
         fFpkCWHl1g3/WOvE8CVlPNl+7XTIDRmFNolBRex63U7LrfE4tPRIGu0+d6Iy/F6f2C06
         38Mejeb0xhdWwEAvTONzN/+dfQNm7BifIHhbI6wh7dGeWKF8ORlCEinxPbKQqEjH/LEj
         6uvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777463582; x=1778068382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bxhR3SkO9vYADfLVr/ouc8VSgYJXfEP1UY/fHhdgPyE=;
        b=bQ+GXnNZlr2OQ0RUxUwgnAGhKwfTomz+IMCLP6d2c8wY12lWaRnIir1uA7PJdgHUdo
         5R7awos/dYW4b7clDSa89wCgucfEiWFl57L9xDd98Z3r+jWmT3sXcIqthdc78feWiEqT
         +U1/nTAjKkbrnp8VconVNaSdCGaCQZKQ3FxfSNDhCA/gkq/ehHuXKW1jY7OS1fusSSxe
         BmzT/mUFOZ5suf5IXo2onp10vKh6oCTDbtR8NMJFoS+vkzVI//YOc4cTPEue6sC5tlov
         AuzdPhi4JNtQwTIqbhE4Iu0kjYtFbrlZyUxrXFUMgaS1NQHaqh8mjqpt15bhflY9SGLc
         eJVA==
X-Forwarded-Encrypted: i=1; AFNElJ8ovmR01Mp4xAQS2X8FZa7G8qAeuSbwVQEpv9+cexRdh7D20HNu7MpFi5dNsxuCiFiyEvtJBVJPYQ2E63Ry@vger.kernel.org
X-Gm-Message-State: AOJu0YxuHiZ+qOwTPBLujS89Ajb6a3URvLNRrdnyE8XstwKQvZBH2BRk
	ocA0VzNR9q3P+wtYRMPk5M45AfywAsFz1EgUAcZf/50Hw9WUpAV/nrfmXuZTodzjUFCJOKIUcXD
	tcMulVOHnwIWnCTvk7pPb5kx7xd+id94zMMqyHPkREhV2jSoKrXdPkL+q3j3pyR5gmV0jtuSHYx
	2B
X-Gm-Gg: AeBDietvm2O8J6v8TqWU7w3gdkx4T8yrskBPPuMAzl2pRvGl2brCg062KQblykzTAeB
	Q64W+zxlCAyZeiMVcZRjAQrGonlqKL/DVSYuGrAR5QmU3Q8F2mUggPidCkLgQais/u7Szog4KYO
	7XQzb+PFQiRNk1/96dn5MppjSnhmcNpz7GsY3MwpHug1D9q6b6DD3/QaxsmxfIQrF4wW7J8T1GF
	ZFGx6x3/mBLNX7R91Rbw2Aa48VbELqlZ4XlnbxJ7VSyjF8m0cBdJQL+yK47DhtbwYMFSihn3Te8
	1LXK/OTD0GdJVhsOqw5G0aa/DXuMAQjgfLTsziYiwlJbgdeAPcLsSv7RPCOoP4JOaa0TQe6sh83
	80URQxgwKO8vylh8KjE/u5Lzoe31J8lAD0qn9xCX5Cr/Okubd0ldoaac3CG+GTjYekHH5M9Gi/e
	/YcgufaJ+R/x2ja7ff
X-Received: by 2002:a05:7300:d50b:b0:2c1:558c:16e1 with SMTP id 5a478bee46e88-2ed1971975amr1465684eec.4.1777463581733;
        Wed, 29 Apr 2026 04:53:01 -0700 (PDT)
X-Received: by 2002:a05:7300:d50b:b0:2c1:558c:16e1 with SMTP id 5a478bee46e88-2ed1971975amr1465673eec.4.1777463581187;
        Wed, 29 Apr 2026 04:53:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1c09b911sm2425932eec.23.2026.04.29.04.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 04:53:00 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] firmware: qcom_scm: Fix qcom_scm_pas_prepare_and_auth_reset() kerneldoc
Date: Wed, 29 Apr 2026 19:52:07 +0800
Message-ID: <20260429115209.283331-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429115209.283331-1-shengchao.guo@oss.qualcomm.com>
References: <20260429115209.283331-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xeWHNXVR1hcB8LwMDKJ2Y1aEAjQR6st8
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f1f11e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=qFRlmp5J0iHcv6_7fSoA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: xeWHNXVR1hcB8LwMDKJ2Y1aEAjQR6st8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEyMCBTYWx0ZWRfX5eQNAsdSWROw
 mcg+j5MExM7Fvgm3yZx4wOsCgqPI+YaJmGOhHr/3nPyfZvhxNs9CZ1nHiq8rMrryq1V4UVPaFz4
 kKbsgTdFt+1Mzc9eQDX2dJqE3vYUlZQUpz4lAaXMjDoFXXm3c9mvN7mvFJ1arxrWW/wOSM+dWGr
 3nibTfRmo80z6qQmwI4oWXyysKdvlk763achZqQGZmMP+jUv3tLDvGZhCJmPBuG3PSSSqbwJTld
 W9cq7Zm5cHzZQILgNtgIVY5hV/qELwxmcN+t3XXpD9WkGH2BNJUdnuvAq5hV/hxbTxZb5AHetfk
 npBdstJWA7M/ShaMwE0VDGgNSH6lswvsm1IGJHKxxVfT9f1MudqLYzKd/AVcq1ALVe314gcF7bd
 l8fF78u43zVS2YLgs/2+3U2/5pPXKIhrWUFs4rsyKCIqxiMhe7EXRKLBaJK+hoNwWBOJaCVwbYB
 AE8rkMdcEDvTODjePtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290120
X-Rspamd-Queue-Id: E67FA493C54
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105194-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]

The PAS context helper function added by commit ccb7bde5f7cc ("firmware:
qcom_scm: Introduce PAS context allocator helper function") is
devm_qcom_scm_pas_context_alloc() rather than qcom_scm_pas_context_init().

Fixes: 4a7d6a78fbc6 ("firmware: qcom_scm: Add a prep version of auth_and_reset function")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..3b762059616a 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -986,7 +986,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
  * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
  *					   remote processor
  *
- * @ctx:	Context saved during call to qcom_scm_pas_context_init()
+ * @ctx:	Context saved during call to devm_qcom_scm_pas_context_alloc()
  *
  * This function performs the necessary steps to prepare a PAS subsystem,
  * authenticate it using the provided metadata, and initiate a reset sequence.
-- 
2.43.0


