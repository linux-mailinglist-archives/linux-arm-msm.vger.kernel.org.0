Return-Path: <linux-arm-msm+bounces-105195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LaqKo7x8WkOlwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:54:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A862493C63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A27330815FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567DD3EDAB6;
	Wed, 29 Apr 2026 11:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K45NT7ig";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aCemSyCo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75D63F23AB
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 11:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777463587; cv=none; b=U1WVmkEmqLAyJU8iAoRxIXrnjhvsvwUOI7+9A7CqXPDLAbhZe2067tJd+RwG96UumrmN7FpW5HSL0513jcOucSi+C4Qbp1WtImjwHcNYybDG9YLfpm54x4tupuozIm9c5ZKls9HZvd2U3/Pbn4jkBEPeznlrpPhAR2KrdQaRPDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777463587; c=relaxed/simple;
	bh=IWtPBk8jDZ1GMHDmWtmGcdbIoOSKKImn/DbFr8V8PjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdTQ0jur7i8s0U96/XKFZUyaBF15oYCYoUpyqxRmNW1fY0mpYJa9VyA3O/CdAquNVNddOIOhmQLpCv9FRXbv9EqC3nZIWxif7yVvBKnlwdGA59D7dwwVSHbaVPr5ooYUQPrYgVJ26+iQXINrPhAN5ArqHVM7Xb4yKJpQ4LrDOVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K45NT7ig; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCemSyCo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qWGB2889830
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 11:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UfSVd6I1ofJ
	dLR+Z7vqE2KTeY5Dk1hiSkZhAPZG021I=; b=K45NT7igs5L1GwEuRfqlPeBMZ25
	6UOpNhFZlMz340qJbk+RbAyKH+VCdtPqHDZO2H+RM865SXv19glLJueC7QZQs751
	dNGtsp/3p2H7+eCK7zZhncyL6E5pjFuprLRES6Uo81GTd2NHsH6x9SjTL2oZCmXS
	ROJkgkrVqyIVQz2uO5ckbrtlnku0bPRocqGQypAim/F17yoe2+qoV0GasWQyvZB9
	sGyJqWGly/nnsutfLy95G3Gr9mmaKZ/jg00EsTIz0uAzCyWd4jTSvGQyxk+fuIkG
	NwvSZ3I6I6zZhQA/QXonit7Y63VabQUXjnYzzkSqDx+KQHN2KYytpWE/uCA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqbrwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 11:53:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdd327d970so539865eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777463584; x=1778068384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfSVd6I1ofJdLR+Z7vqE2KTeY5Dk1hiSkZhAPZG021I=;
        b=aCemSyCoWstqulCs3Yi9Agc/M5zClbA3a4sncDAW3p7p+R3QUXpxVi6mTXYe5UlxcH
         8oSk0+TjKBVHsrs9ofKufTBG2OiD4RLDtuZbO0qdreBIwSEKOhZQGN3Fwimiz2Qln5BD
         4dsxo6P4Nnocwb9a7CMvkLv6svS6zB0KHggyrmchw4Ri5k+8VZXZ3FjrKrECmoq/Cuw3
         qiF/P4o0u0eiM3kD9Tl5JVeUcQUJbHmq8C2/fM13citB7lt8OzUftuZOCTVJR/GAMoQo
         LwunNTiYElQbEIasby2HtlUalZvtqcwQ6HII9ii5Kd6UnXuRvG1s/YviDr6L4mH8kXEL
         nt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777463584; x=1778068384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UfSVd6I1ofJdLR+Z7vqE2KTeY5Dk1hiSkZhAPZG021I=;
        b=U9yONLgzkc8uAi6o7yyGKl6WOfE/l+9UdKUtDrxU8i5W2EnpcfBFgmIoAt1q0F96Bb
         EWMJuZ9/G0EqXVnyA0ILk5rKbKdRkmCklbarzN62+kyuaARkt+Emun6nCz7p44ZjuvON
         Yi5dyJ47zyr15j6jtza8gFTtY0NP8XAq6goVj5oOX5GX7NGFe8SUvQPck7hqqa0e3Zpz
         GRwU/HtvojuK5G3tNIP/qQ0QYBB2Q0hYjDl8IIUUt2FT1CF2FLqyRs+4m8nXKfY5Dqv6
         YwBU1bGvpoNBnqahN2Jkp5PakXXrbY40TvW8rWG6IRqSuLXcbnDAaW9+ma/Mq8Bkce9z
         vVPg==
X-Forwarded-Encrypted: i=1; AFNElJ9ymX5uBIyF/oc2b5oEvpsmX6VipC1wtZ0x0xNTkdAx9nAAb+u2QK8PqU7o5OeQDAkW0Le3weATfeJb8UPm@vger.kernel.org
X-Gm-Message-State: AOJu0YzvXmzZl6rcinfp3Bjv7CiEVU+78gyBSy4O4+11bjMEYBxKvma5
	CpJ/1TT/R4BKIPMtRWNJSn8wRioBT9Yv3/xKUA+2Bma/J0i25HehQ0+1Sk1ZzLrVxlKEgB89KIP
	+TJXxb8JVxZ63wgRGCmDV/23292F5A8uZ15Lo/5jfGUYOy8S8jSxba7mWIgYyTxjozOc7
X-Gm-Gg: AeBDies3GJChrnbJlVZZSNFb9XJGwHTJOll55hD2JkYux9TzFwZTgmpFeYheZADiVvO
	RnJ3VrcP0gHy0+aW3RVduC/7RR5Ay3tEv3ekiMwOf+vC8gBmpvhqg5uwhCY3vQCD9EzY3EaZYdN
	d6PTyxZcGqlJL2GpBHq3U0cJY/I2zA6AYD+mPRkhRh6SCPMI7ycV4/BDABUiGXaUq+LGzrLySkb
	9cwwGJzQ/+RRMWn2OrVcjc7bKXl5tyEUcH3a2N8NJZvBAGvfJYNIUApgx7zYFZvfCuqr+KAgCVj
	JlDT7h46LRsXXhNpkBW6BczWjNvBlWmqh2nAYyYwcP5sLdYAaq5Xkcec136MTvghTDADVN7OZ4X
	8E8iRf9x76Os69efsjWBgtQwJDzZHQKnH8yYkONyi4UiNzpEyrdsz0g7/KHZK6Fl6IPHMkuh58m
	md35hlFJvlrBLx2AD/
X-Received: by 2002:a05:693c:3742:b0:2e7:190:41d6 with SMTP id 5a478bee46e88-2ed1b3c68bfmr1173080eec.2.1777463584176;
        Wed, 29 Apr 2026 04:53:04 -0700 (PDT)
X-Received: by 2002:a05:693c:3742:b0:2e7:190:41d6 with SMTP id 5a478bee46e88-2ed1b3c68bfmr1173068eec.2.1777463583682;
        Wed, 29 Apr 2026 04:53:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1c09b911sm2425932eec.23.2026.04.29.04.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 04:53:03 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] soc: qcom: mdt_loader: Fix qcom_mdt_pas_load() kerneldoc
Date: Wed, 29 Apr 2026 19:52:08 +0800
Message-ID: <20260429115209.283331-3-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: VD3SAuKo7h4WpV5sq1Fgu-Yk5hxVwijj
X-Proofpoint-ORIG-GUID: VD3SAuKo7h4WpV5sq1Fgu-Yk5hxVwijj
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f1f120 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=qFRlmp5J0iHcv6_7fSoA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEyMCBTYWx0ZWRfXx5edAz5p/EdS
 7+wSNE9nOwwToyWNXtl2rUqZk16Zm+Zhm9magLWVy/Zf2ay+VHLLYvU8HbJMF9z0z563YRKWkpQ
 DAyWuWpRUm8azPsQ7usZbkp4XWAVTdPmQwcTBNjooTqNlpbai2ZEtR2hMEW8uCFLNcmsEcnDKVJ
 jDIaFG6/z4FMVIvyVXRDj4EjGk2ukBxP4qdMohGIFxenlgSI2Xrm58UOJvXOW1tsx8QxHgZUvXB
 2QvpVzbq3QIZ6ZllMhvmpLccrOIduJg7KUo3e/MKpHTzfNjmgnfMnxHSY1M7dKFkyJfPyw0CaSP
 86VPDwL3tQWEnBkHgJWIkspJYIr5YNJHpp3yAuOeRQ9mwuR3txbFWR4GxBjxSINpwUnOMsv7kwJ
 vJ7W3R3AAtDgySEbgJP1UVCeyZTblfcMsDpLEFmrM+eosyHuThivjRSWr73adzr6GzqtW0jsb5Q
 mVgyuBdtQP98LT6BT2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290120
X-Rspamd-Queue-Id: 3A862493C63
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
	TAGGED_FROM(0.00)[bounces-105195-lists,linux-arm-msm=lfdr.de];
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

Fixes: 8a4fcffde6c8 ("soc: qcom: mdtloader: Add PAS context aware qcom_mdt_pas_load() function")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index c004d444d698..75c1d472d930 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -472,7 +472,7 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
  * firmware segments (e.g., .bXX files). Authentication of the segments done
  * by a separate call.
  *
- * The PAS context must be initialized using qcom_scm_pas_context_init()
+ * The PAS context must be initialized using devm_qcom_scm_pas_context_alloc()
  * prior to invoking this function.
  *
  * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
-- 
2.43.0


