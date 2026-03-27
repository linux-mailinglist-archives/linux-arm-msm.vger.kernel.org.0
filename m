Return-Path: <linux-arm-msm+bounces-100497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MoAHLUSx2ntSQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:28:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0155534C486
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3EB45303F994
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C9F388E67;
	Fri, 27 Mar 2026 23:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+ErroJm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGd39soN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5474437A4BE
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654131; cv=none; b=Z15QjfM9OVB93rPYpR5vuK3MAxR7doAzfz/FuDwz5W+iK4OplzVCWaURW/G+4MXEbS1apN1O4Ut6nx+ETjjhsDXdeU4Sa9RdgGToBd0bX3lsFfZLpmx36xdb/a7mq16b5hMmMtz+pNZpHNGfAx3qsXeFJ6rRIYfpMqrcQQTYDPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654131; c=relaxed/simple;
	bh=R9G5DrWK7ZdreBHQ/NvwOHQkAkxN8nydMv+XrJUDCnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ucs6yYZyifZCN2Yzt29rFYl1YnR3SSorLJR55K6/dErrX/fIzZfj6Rx15asGnGVrXf70V/JH2VNm78SSWtcL9wC6/+jpYHLXDKeRzOpVCXQEorRX7ofSE3Tc4D1Mh2w8+5VBB/yyMwzLz/0nnrlQVPxVuH4IiGAoHc1RelxgWQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K+ErroJm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGd39soN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN45xS2860711
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yu4Ju/BNMWhFePsUEYj76VBRHr5svFe8Za8zkvDfGq4=; b=K+ErroJmZN/PtmZm
	5t5n34u4jSMg6IputzjXuqP7m3uRcthXbq0JsABVNMdYqP60Hxji0gn9aqFtw8jX
	mN0j/Jt8nmWJPiH8N0jTUAtaOgX0w+4FMLqOhmZvyyHFy2RY2HSt3lnZasrGlDu7
	Fir7FxhlMVb614+8SlFCgk6ec3lzhq/uT+6DDMrC2fen2RDLhfEcolpmXB+W7KGG
	Sdea292aLyJ9WacfMJNimeN0cbXdMhB+BuYxtnP2I4euf/eyEXz0xExq8M6PXT4g
	p3KASCBEWqOH2jmEq9uV+F2NKOYpECVEOTAOoogXXiglrDdVQ5qvpmcXW/QKidCo
	RB4b7w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5w30s8e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:28:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a0258c5e5so29021886d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774654128; x=1775258928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yu4Ju/BNMWhFePsUEYj76VBRHr5svFe8Za8zkvDfGq4=;
        b=eGd39soNkRDxaJeUZ1pUrwnyuiUQWN2+UxpA0Uja5MBRZfL77MY14TvieBs31SyFog
         phM4tQciGka2ZyM4QNjLzlyG/za50b03orAKhnyyKobnvmq+WwDOKUXiFWb9oqeOWMeB
         /aFKispH9bphPGblEUnB9sL6cvMiogcDQBoSQ2bLbkIq5M8AGGOEKQ3qphvHry2RVHq/
         3qzHzsN1Y324L0I808j98lGAqjlpAnFyAF8q1ICpiM5gA94DiVcxVLBFAAiooGsJLZ53
         nCxPyyYX+3Oen3BYJdYAMAjXdOuk57/FfgDMpqSaDpsZ1soYsn3hd57zfiI5EF/xlFr9
         b+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654128; x=1775258928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yu4Ju/BNMWhFePsUEYj76VBRHr5svFe8Za8zkvDfGq4=;
        b=nWAKgALOD3mTXXgfkEIKQOaeZ6ttLawc03NuuMH4yNMCusUXMuoZYwn6LG+1E1t8Xy
         BJny2k2fatKPBqIKhOTcBtf3mO/ynuggkdcClPOsDmhu+p27q7RXHP7LpewzdbPVzDmD
         cE9oMN0Ko12AGiJkuSGDDT2BHqFPtUO5yuKrXAQGLH00bXlAEohPekMlanA9qSg/HaFz
         c+D6EzcxZUJxWpa15J0eweOczQ9SJrFJaBQME+SS4IZLfn1Qt4GmkRcTwoDY61HHNeYN
         6Afz/RtpXdMAT+IRFyygMMJRBPT4W/hY4iXck3BRyDqlSD1YpUtSqBRomq8LHn49vQrs
         vYcg==
X-Forwarded-Encrypted: i=1; AJvYcCXaf6UJeXQbzPubrrMv345r7rBEv44y1VDhcdG3gqcZvBIsQfdY0RBR3PfAIvcivxugURGPHYsNpONgsaVp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0IV04RZ4UgmkthoLfqRMI0Vwl0ggSPvlinjR+uUcKY0s58TQc
	HS5pTIu8n22CxGlMmWtYiBj8AGuJrI2X2IzD5ipwbsfkrxmOdhyuq/mm3LkqKhDwIH1600AOle+
	T3ZPnaoz0w9OKy9kYeNZnZD9SYNEVeRYgdErtU1/u9kWLzYd37lQUjV/tnIbSGejbtzzM
X-Gm-Gg: ATEYQzyULYrLI/d47RDtQDB5uB6lkc7MpppJ66iwhq55WWWPlRMr9JbIaYZ0ghYnsYv
	HlQhEDWyMEGTtVhRheLtIiuGapds4R5yY0XYegqZxRNFvi+qGtX46zlSzOf792Dz6lq+D0AIiIB
	oNaQRlGFZgXQl8EwtgZxeZrPMPejEY0dx5hekMSD7udxMacn+xF6OISid/bsFP2YglAEPrbzG5k
	txVdM7BKxazJUC/1TxlMYNyVntTF4Eeu5FXGeb+DOdGSQjQ0yw/KOGPzBS0H1sDU7fPT064+2NB
	hTGCxeIn8oo3hxe7pw5ZP/b25J0h5lIKVcjEUzwjRPvRUbPU5JqziOnH52yreQouhZqAL7Q/iw+
	wGTBLM3SXdkwIva8z1XID/cbX5Gs1Q1+HvtdW2RvRSosDCynAm0UyYfc9vK/Vc0zx2f5Pe9T5P1
	35ivr/GpuZ41uQCJHvKNp/25wW01Xf+Wcbq/8=
X-Received: by 2002:a05:6214:6018:b0:89c:d4c5:452b with SMTP id 6a1803df08f44-89ce8ecd0aamr61287616d6.38.1774654128537;
        Fri, 27 Mar 2026 16:28:48 -0700 (PDT)
X-Received: by 2002:a05:6214:6018:b0:89c:d4c5:452b with SMTP id 6a1803df08f44-89ce8ecd0aamr61287406d6.38.1774654128060;
        Fri, 27 Mar 2026 16:28:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83729522sm1177991fa.14.2026.03.27.16.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:28:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 01:28:36 +0200
Subject: [PATCH v10 01/11] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-iris-platform-data-v10-1-46b92bfe7b52@oss.qualcomm.com>
References: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
In-Reply-To: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6224;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=R9G5DrWK7ZdreBHQ/NvwOHQkAkxN8nydMv+XrJUDCnI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpxxKnGzFzLWO/Mi2GmBFgvtEPZnhh5129inEBi
 1vgr3eRpSiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaccSpwAKCRCLPIo+Aiko
 1WsiCAComoaAZ/Vpey1OTEqQAJ9lXi4tS8f+bzCYfowGHN/DSrhUlJCGb06jFf9gtf/FkY4Qs4o
 QeRfJZyjNU2YVWbiT+26AS9gePPKCqNRz9Cs1B/f/krHspR2ZRfHIzl8LHb7LLLq42/JCdmT1Sl
 6/LnRv+T02jspPRxJS43Y3THaahoq972okgViMqK/XnGTy67wCEjtPdaW7uKNG18XU5tzX6QJ5e
 D7dcXOlZbPJF/vuhLzX6Nn0Y4byPzkbx/wjBSlg9VDBKdMYWlPONfo/EM9zCG0d+AHWboVFErXE
 JAKzsJxZm4R/4l0N0tARC7E6bc4Az7Am94lWHtZQgFFGFfvS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 4Ht0T4nVVq1dbvu2wGkJm9s6_P_3cDKr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2NSBTYWx0ZWRfX96CLNZmjkdR9
 lxabXP5aT+q7ITwlPNiyyUB66RyQ5fKpnmDXG1pgqe2RV7KW0WXSZAQP+oLazsM8Sx9lhBTpkRn
 x6790dtlB9+1oa48YIS1cNHwQWZN+B/uVlYvGAGFzDJ+uJXhWzlGwkDBZY2ObDM5Bm+Ww/qqEc9
 Cr7Ovd5syWvbyzqfc88pxOCE+X7mrlnW7dYWMsq8mNDt/z8DAR58u0GP/OP+DsrQHoSvqPg33ro
 EWRLSLvLoPe561g4EMTWnL8+poFvRdGXiVkWHNad7NTRahDwZe3p9XtoE+vCExSLY+rgfm2gFN3
 9ZKnBk9OOvyv55kY+Fhik+ImBd0IDHrJmEZqUt0j6NCMDLsIjsMu3Q6p6l9h0B2/kDCiyVF4Qb2
 a7cI4Hg0RnmVGoOp0tFNUU3hUaVNgo4/kPkOM4zvx1Rn8UmhB6sHAySBvT86T1Sz8USuUsUmm9T
 3u/JSHvdQPgFAfEw0pQ==
X-Proofpoint-GUID: 4Ht0T4nVVq1dbvu2wGkJm9s6_P_3cDKr
X-Authority-Analysis: v=2.4 cv=F9dat6hN c=1 sm=1 tr=0 ts=69c712b1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=hYMYe-gnznq9qBW6PAEA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270165
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100497-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0155534C486
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PAS ID, the authentication service ID, used by the Iris is a
constant and it is not expected to change anytime. Drop it from the
platform data and use the constant instead.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c        | 11 ++++++-----
 drivers/media/platform/qcom/iris/iris_platform_common.h |  2 --
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   |  2 --
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   |  4 ----
 4 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 5f408024e967..bc6c5c3e00c3 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -12,11 +12,12 @@
 #include "iris_core.h"
 #include "iris_firmware.h"
 
+#define IRIS_PAS_ID				9
+
 #define MAX_FIRMWARE_NAME_SIZE	128
 
 static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
-	u32 pas_id = core->iris_platform_data->pas_id;
 	const struct firmware *firmware = NULL;
 	struct device *dev = core->dev;
 	struct resource res;
@@ -53,7 +54,7 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	}
 
 	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    pas_id, mem_virt, mem_phys, res_size, NULL);
+			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
 
 	memunmap(mem_virt);
 err_release_fw:
@@ -79,7 +80,7 @@ int iris_fw_load(struct iris_core *core)
 		return -ENOMEM;
 	}
 
-	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
+	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
 		return ret;
@@ -93,7 +94,7 @@ int iris_fw_load(struct iris_core *core)
 						     cp_config->cp_nonpixel_size);
 		if (ret) {
 			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
-			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+			qcom_scm_pas_shutdown(IRIS_PAS_ID);
 			return ret;
 		}
 	}
@@ -103,7 +104,7 @@ int iris_fw_load(struct iris_core *core)
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+	return qcom_scm_pas_shutdown(IRIS_PAS_ID);
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f42e1798747c..e4eefc646c7f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -12,7 +12,6 @@
 struct iris_core;
 struct iris_inst;
 
-#define IRIS_PAS_ID				9
 #define HW_RESPONSE_TIMEOUT_VALUE               (1000) /* milliseconds */
 #define AUTOSUSPEND_DELAY_VALUE			(HW_RESPONSE_TIMEOUT_VALUE + 500) /* milliseconds */
 
@@ -226,7 +225,6 @@ struct iris_platform_data {
 	unsigned int controller_rst_tbl_size;
 	u64 dma_mask;
 	const char *fwname;
-	u32 pas_id;
 	struct iris_fmt *inst_iris_fmts;
 	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index aa71f7f53ee3..07ed572e895b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -360,7 +360,6 @@ const struct iris_platform_data sm8250_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8250_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
@@ -413,7 +412,6 @@ const struct iris_platform_data sc7280_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8250_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index a526b50a1cd3..1f23ddb972f0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -934,7 +934,6 @@ const struct iris_platform_data sm8550_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1038,7 +1037,6 @@ const struct iris_platform_data sm8650_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu33_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1133,7 +1131,6 @@ const struct iris_platform_data sm8750_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1232,7 +1229,6 @@ const struct iris_platform_data qcs8300_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_qcs8300,

-- 
2.47.3


