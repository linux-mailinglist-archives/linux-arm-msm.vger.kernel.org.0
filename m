Return-Path: <linux-arm-msm+bounces-91538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBVCHJbogGleCAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:10:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB0ECFF33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 60D2230080B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 18:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF9E38BF84;
	Mon,  2 Feb 2026 18:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cdj1Q6fD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="htB4Gip2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F543612F4
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 18:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770055795; cv=none; b=S+EdkWDtW+Swisc0dWwM1TEiUkhwMXDDqE9SL3qQwAUyCfpc7pWs7FoN1cwrvMQSXPMJnVjvlbfcDO1BX1HamXdEIrLhNXdU+x6x75Kx+FhTtbDgLQuOAorB91dGJvXvh8znmDlJAkncqKh+ic4DPC0cqkFgIiM+hfm8XpfZ0Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770055795; c=relaxed/simple;
	bh=85mnIBih5TefJNp/bHk7qTk7tspz31Q1DwJ4d0ufNMs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KB8hIc3TtDxkwbeagsJvOe6nTc5o+pGTvcsG9cqCFiX3Gi/sI13akGKeFkXczYLHIjuWWHKz43/jSbEX3vmmo1RzKWra7p/LgXicC7wPQtN+Q59KBuIYLdCs932itr3OPhnIpPmoc5NGy7xUdi3GbCncuj8/qb0svHcBcF6kDpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cdj1Q6fD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=htB4Gip2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612FlDFq3388084
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 18:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GkgK+E57psN
	HC9wkY83ywNIDVuH2SOJteZ2XuiMuHCw=; b=Cdj1Q6fDwfbIA7S8o3QrPI6EXwK
	r61AdGiJkwPjx86OAXq4z/EP/0otQHvMhXG85d4DcdX6G+q82wzhjFZ5g5Ez1a0j
	EP4E6/54G9eg+4LBXcSCtgqlm2RciIxtMUkNLXFljaGtgeuNc4cxaXOibwAw4Cjr
	xsqBhoH6vqXiNvWEonCPC/iwy/VZIFHgCY8exoLRNkioOyNo4T+JNIqtuTz9yV67
	Empjhkj0mdOfh9P8AbGCpSrMthecPGo8iUtzpUb9Xaleos2ckuZg9kk+ejsg9ucv
	IPh16qNTm0LHGGMerF6ToX8olLrSqs6fJ4dXlE1QU0W+M74Nw9VW7XlxgVQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2xvbrfx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 18:09:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81d9b88caf2so4232599b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770055791; x=1770660591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkgK+E57psNHC9wkY83ywNIDVuH2SOJteZ2XuiMuHCw=;
        b=htB4Gip25l4Wh3IErK3RG+2tAAOeICaaYd7ZWZRi5Wpr5xwFz3b1tg3K/t8FElm1Ef
         2DHjTO03Uq4EbvFPJxXK6JYiE6quWQ9gCFFbV91gHvuV4baS/o6sSBIUlDHeDxXHXDgz
         wC6veiPK5Kq3e3TZriAttJQINkG70pwQQxHqZ2ohurqul1P/gIMvt6ZGikA/Taroo2MW
         X6pw0Bjv2fKYTHdAx28JJE2ezS0RDa6WpnnoRhun7bUD3lL+e/IA3h+4nL6SVXkIS6PQ
         4/lSLvH1SlrHHGZnDJUt/nDP74MaAqHqXqZUPnMSQEqyZJPE0vsb/qv+PteF4YAG9BYB
         No/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770055791; x=1770660591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GkgK+E57psNHC9wkY83ywNIDVuH2SOJteZ2XuiMuHCw=;
        b=ByIjZEUehxpFVCO6WXoBPky815tow8ytaHzdWddj6mcDlNxN/ZDa+Z8AEpX0cT/s/Q
         M2U94KnbYZF9bgUKV3GiVorkHRvVGqDyB6GM+HilaKockn5d4KiqIt2/BwzDNASVMV6t
         m5sZtBeKldD3FT9hAkkQgu2Ar2gCVwsTLEHvRUk3mDjCG0zuqLSrTL5AuRiYwDWyIkU/
         ISmZWp8Mgcb+jNWpKeRodhLHJhVD8KmMHsNw9OcRN+PP91YLsEFOYqpMnt8fsCc7n283
         yMNpX8k4gT9EvH1mCupbPXxCAsxoIsqZCgpil7Koj3AsL+Z+IIRQPgx8rAZFG6j7ws9d
         BRjA==
X-Forwarded-Encrypted: i=1; AJvYcCVnSOb2nvGLRDRxVQ21Fai/nzTqQ3KN87iyfQd4Xw4QgZO0Fvm9t12+3/11fmOrq9nTnmN+ZRsvo/f4QSyY@vger.kernel.org
X-Gm-Message-State: AOJu0YwQMGqVSa9yHjCalw6DQM4o5xbyFQZEBUSyDWtgo9dk7X6gCnDq
	yHDfG8xjI+CGlRFicf7i2/oYwKqmITXkvUditPGS54OySSODh9pf9Rcla1ChOyPbXB/mPPB5W9n
	cIhEpsvtwSXq+gjZY2Ctj85gpmx9a4FTkXzLd7DuBtFq/GwAkRSpV8M6soPUB4OhujIy0
X-Gm-Gg: AZuq6aJYZsKnzJY09zZ4cgj/d+VcjnosZ9QAJKfu6Fx/6lUIc4kAwA9DF18h5zM/2fD
	jJNO3Gnw9kvVV8qcqE9WZaq9MF0hyrTHYTe2yGwqx5+kjdZrz0sekRDnO+pc5jQYQYW40z7c05j
	a6zwaP+jIxXjldGBLB3M4xq+GsDYGzjd0yUCw/ql8oJx+DGaWOWeKIKy3adcDdcIgc9I4auyyUb
	P0zS6j1hr/GepDLqk2xN2EN9SoYQvymQvLvXD74ItTP+eyJcfsbL5EhKPFzUQhwMHBi3BwN9mUC
	vfUrsor+0qW4iux8MA/sxwusnHIGqgyt2/QIPSsbkGU9b+3dqUM4B2ro4iutzRb6wbWQb0tIf29
	GOL0ClX9pNvCiiRPMMxiBdHWDjwvnCuiSGU+bLd3Gbh0=
X-Received: by 2002:a05:6a00:a512:20b0:81f:40e5:34c3 with SMTP id d2e1a72fcca58-823aad8e0c0mr7459908b3a.65.1770055791399;
        Mon, 02 Feb 2026 10:09:51 -0800 (PST)
X-Received: by 2002:a05:6a00:a512:20b0:81f:40e5:34c3 with SMTP id d2e1a72fcca58-823aad8e0c0mr7459882b3a.65.1770055790631;
        Mon, 02 Feb 2026 10:09:50 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm17476780b3a.40.2026.02.02.10.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 10:09:50 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
Subject: [PATCH v4 02/13] soc: qcom: geni-se: Add geni_icc_set_bw_ab() function
Date: Mon,  2 Feb 2026 23:39:11 +0530
Message-Id: <20260202180922.1692428-3-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 08JXp0O96tIw5h0Qkr63e9r7G5sVYjrG
X-Proofpoint-ORIG-GUID: 08JXp0O96tIw5h0Qkr63e9r7G5sVYjrG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE0MiBTYWx0ZWRfX/N7k9eDL4v19
 Mxp6QKMgVzMhASa9PZ25Mpg3M2vx9chpTmcXEqGixt9Ie+9EK/MbBnWeCZvrq0xxzXgaypvZ4ub
 nbTVynHsnSaS0bC5kxq/rcOY5jc3kIixkPv09CAkleb6PfM/Y0wCQQaRFoS8SkvrtQ3d87qOWQg
 Fnaxhje2y3pyPe6mPyawZh4Y3m6lugdfQTkRcvqsvL0gHtYEVSxbgae3fBNC6fGpuRKAp+239nU
 mR7Ye/vQ/elOUDyOD7jssxWIWG8M+0yt/jLv3sOgpqSBxLYL50BkbJjS6G8T72ffK0zbsfNUcnQ
 IuPdUnk1QgW6G1ZmsXtTBpJ3xuQC8fn7bkYDL2Tll4Mh8gklwOfkmjBMuuiOP+EmeCjhn5fUXL/
 p4kubaGdEF+6EbetuxznA1Iewqv/3Qx6eVnZD/RbU0njL+9PLnoqzd/lwGflnXJ9q6cxsKZhpFP
 gd4Gp3GZZkJ3Vt2qGPQ==
X-Authority-Analysis: v=2.4 cv=AurjHe9P c=1 sm=1 tr=0 ts=6980e870 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=BVB3BO4C9w_THQaB-9MA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020142
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-91538-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CCB0ECFF33
X-Rspamd-Action: no action

Add a new function geni_icc_set_bw_ab() that allows callers to set
average bandwidth values for all ICC (Interconnect) paths in a single
call. This function takes separate parameters for core, config, and DDR
average bandwidth values and applies them to the respective ICC paths.

This provides a more convenient API for drivers that need to configure
specific average bandwidth values.

Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 22 ++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index b6167b968ef6..b0542f836453 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -946,6 +946,28 @@ int geni_icc_set_bw(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_icc_set_bw);
 
+/**
+ * geni_icc_set_bw_ab() - Set average bandwidth for all ICC paths and apply
+ * @se:		Pointer to the concerned serial engine.
+ * @core_ab:	Average bandwidth in kBps for GENI_TO_CORE path.
+ * @cfg_ab:	Average bandwidth in kBps for CPU_TO_GENI path.
+ * @ddr_ab:	Average bandwidth in kBps for GENI_TO_DDR path.
+ *
+ * Sets bandwidth values for all ICC paths and applies them. DDR path is
+ * optional and only set if it exists.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int geni_icc_set_bw_ab(struct geni_se *se, u32 core_ab, u32 cfg_ab, u32 ddr_ab)
+{
+	se->icc_paths[GENI_TO_CORE].avg_bw = core_ab;
+	se->icc_paths[CPU_TO_GENI].avg_bw = cfg_ab;
+	se->icc_paths[GENI_TO_DDR].avg_bw = ddr_ab;
+
+	return geni_icc_set_bw(se);
+}
+EXPORT_SYMBOL_GPL(geni_icc_set_bw_ab);
+
 void geni_icc_set_tag(struct geni_se *se, u32 tag)
 {
 	int i;
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 0a984e2579fe..980aabea2157 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -528,6 +528,7 @@ void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len);
 int geni_icc_get(struct geni_se *se, const char *icc_ddr);
 
 int geni_icc_set_bw(struct geni_se *se);
+int geni_icc_set_bw_ab(struct geni_se *se, u32 core_ab, u32 cfg_ab, u32 ddr_ab);
 void geni_icc_set_tag(struct geni_se *se, u32 tag);
 
 int geni_icc_enable(struct geni_se *se);
-- 
2.34.1


