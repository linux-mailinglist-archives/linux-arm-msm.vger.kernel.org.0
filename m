Return-Path: <linux-arm-msm+bounces-105420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN+aNN6p82kF5wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 21:13:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 762DB4A74C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 21:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 995FA300F4D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 19:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F89A47DD58;
	Thu, 30 Apr 2026 19:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aAHkrXW8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NI6VduDo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E6E47DD50
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777576409; cv=none; b=CyuK6ebdt/Lx94f1I7F56tWjZ2680bYyWP/LyWzYk4YosR7vF1tjRXm8vncda2okjcGgqBevts/1n6lNHQf1GSIYGsi9OvXQ2rO/7AJHrrvhHfNgpP5wT+7WODdACZiUBV6um68Dc8Tj6I9vAOozDk65SCqR/pQvrj4ce2curIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777576409; c=relaxed/simple;
	bh=eLZPPWBv7NLMx7LIGFjCzSTWf/lVoUk4bi+hIEigfWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p0YO37PAeNdb/niSo6D9caQ23k6xx4o0hFKJPRoIvWVAxgzUnrykc3QaGGTb/+EoPJ5P+aQAu4SIHfZzTqvaosfvOTNdJZaBZVaTF93aum/BAz1EsrYM9hGtXeRolFU6VyTA2+rvjbe9z41+Hl22XnXGTHMtLkIFoi9SO9AmSGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aAHkrXW8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NI6VduDo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UHfGdD440707
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/uuZUqN58mn
	BcEF3QT5HgBeQvhVlZUW+LLbfOlfhT3g=; b=aAHkrXW8vhvWqNhMOmlJp5+igy+
	vXJp7t4HmcEIJcAgofxXSUeCMKgc82unXaaDcFU0/YcfJrAAobCXNvzF0glA+aWb
	FficgF6XxPbp5UvwCvShrbnAWwg/wTIKWSXEWN9MajFA53yvvDxKopQP19GrK40P
	y+eBbbFw89IEJyZSVqwiLHaKEyHs75NlVUUTff8zRfA60JYMilAvI/HdCpbSScuJ
	Nl/5TxVBmcJPuy1rjdHlznrvRreB8RqL8EeKVf3sgtldw2kGndL/ZPn+f3yFJBfc
	39d51aOHTo1UcveVBrsP1em4zZ2E254kh3OAzM8bT7FseZQF94MzQ5RX/cA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvbpw8hd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f7bec24fdso849070b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 12:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777576406; x=1778181206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uuZUqN58mnBcEF3QT5HgBeQvhVlZUW+LLbfOlfhT3g=;
        b=NI6VduDo5Pi8AI6b97sVbe0JsE4dz5KBMKgsgQc6OmpiOzaiqk1gAa3EVDg7v5TBJN
         CzAOcxdCZr58hxWCPicVHeUaUmtdK3qafKmmTvilwacl1SQg1Waz9t1Ob0mZK1KbOadt
         1ZqB7ldOW8IY0frpW4pYpKvEQnrhG71I9J/vI3mJkaw8bUIlB6uJG4OFx9Nb6iLYlCds
         rLeUrfAzJV3PtacWSsHmCPZpetsF1fM525tQdH7X4LXVwiHsjU8nN6Wez3xxMhqQ1m70
         PsBqhz+zySBeCrn9sJSkAr82N8ore4Os/0EpnM7iiKP/c+0RExO/UVtPKaQ5QEW2HC5h
         3oIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777576406; x=1778181206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/uuZUqN58mnBcEF3QT5HgBeQvhVlZUW+LLbfOlfhT3g=;
        b=glUBpGmVJZ7xoYGQCol05rihiSc+TlscMBEcg0hmM3xSS7JEbBOV4gy2t1qFNpUYAU
         2BKRRDAWZMegc7t1DPGGZRaschJWUViKN3c0vVbl6naLmrRRdQsCEWNh9qJGHUw7ndYq
         xBrxEwnS+/g6QUlBjUCEqHH97UYrHKmSWGduMQ1fYC3aTh91Y5GbEkGNAXKs3EI4DgVH
         /jbLCIMniIoQeQQLyfudaDvuR0FUaSOy5oK+l+Zf9idF/rbDx8gCB2Ae+r9VIi/p46HO
         iEE7678iqlP53Gysw5f85UDo5Yy1fE0N0fvL9wMIpBAiEURTyCCVYG2PO4aLLCwz6Rwu
         oKNA==
X-Gm-Message-State: AOJu0YwQJ43/q6HiLCRFPu7ftrxHuoWq71RIH/z/my98ba1V6sAXQ5jS
	rIuQVlg2KioqSBPF/8c1ylAshlyDbRYN71qKPHX42m+sxrtCfy2I33xVibjxXCs6Gh1LpmHZKoi
	EXP6Hx+gLNXC1ouj9m/motqX6WFnWJMRtrHcRjeQIAGDWs1TQb6BrnrgxpycpVPjxlLEg
X-Gm-Gg: AeBDietUzZxSmrDA6aSjxYsXPCOnUEjBa4JZMYlv82+oljSv7fIH/XjvA6yX6bEQdFk
	mc4GBnZT4FEFQrLguWhHv8bmpVV21ZsJQlXv7MyOPxp3lbirwQRG43Zzo23o3SWTGbc+ULwvM3v
	2baw70+AmDcV8+MPG27p5rHMYCMfDY4DTVSfaBxnRgasfhGYCw3Qt2iLTmIk6+cAu96FCM7Jz0i
	OBLNM9Zjty6TYkh60Bz3qpsafDn0ya000UnZybKX0fFVr29j9JrbfW8m9MMge4EH1LEi3OA2FPi
	sLBsh0Fclryi4arSH/K97m6X28kOvNQC+FK7hJgHl7K5cbAlTdNyolGUuI0VvMCZMbmkM6knDue
	P/vYaBRgchaacqkpbPwQCEPLh5+D41IBMwUGl6BIFS5uz2YdWNEYcbkMX2Kk=
X-Received: by 2002:a05:6a00:3d4a:b0:82f:7252:38cf with SMTP id d2e1a72fcca58-834fdb84e79mr5073967b3a.16.1777576406130;
        Thu, 30 Apr 2026 12:13:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d4a:b0:82f:7252:38cf with SMTP id d2e1a72fcca58-834fdb84e79mr5073931b3a.16.1777576405495;
        Thu, 30 Apr 2026 12:13:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b485eesm373640b3a.48.2026.04.30.12.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:13:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 1/6] remoteproc: qcom: fix sparse warnings for __iomem annotated mem_region
Date: Fri,  1 May 2026 00:42:48 +0530
Message-ID: <20260430191253.4052025-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dozrzVg4 c=1 sm=1 tr=0 ts=69f3a9d6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ctNy7iMIxOgxZ4Gl-TwA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE5OSBTYWx0ZWRfX+rCIe/kUo8n8
 7Y6j4rthPAT1LK9L4PkQ6LwnxG+iD4MrFEObFcHD9mxAgwRzO5Qdhobi2aG8iQmYXFy++Z+bMl/
 ccebugCaBxCBs4MQFtW1GXUzZnGXq+0W6RwYArGXQ5pr/7fuoUpzss6hOdtrxcQ1p3fG9hKup1x
 xRUBgbYZE9UWc74GtgfhlKXsknEWDNckTpMfuvb0gXkYICw9OUJ/MlUEmZLZrOK7TnEA/7w8B9N
 McvAiotrIx+Oq32MpIfllbofZYVoJ4rFBYJlL1Ncbo7Z2nXwd7LLZHtHmjsme99cTOLh5Z5vXIE
 Ib/0tB3FQJcwDgHt4Lj1uWSmD9dp43GQ8Ct0KaiCU6/mkxt0mKgCNz6I0hNvYPoDZ2yX9FAjoHD
 gPGBuwIH9X5rE3+etQ3UR8BNAF10yHtCgc4rYuCn6qrUXmx6m6GGp0+fcBhzmzSgr166oRKSdYE
 ZjUNyKLhM+P4zTHLXWg==
X-Proofpoint-ORIG-GUID: xoVRQ1CkOXcGEcBvLlnvZIZM1lLb3zp5
X-Proofpoint-GUID: xoVRQ1CkOXcGEcBvLlnvZIZM1lLb3zp5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300199
X-Rspamd-Queue-Id: 762DB4A74C7
X-Rspamd-Action: no action
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105420-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

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
index da27d1d3c9da..45be8c5049e1 100644
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


