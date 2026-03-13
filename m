Return-Path: <linux-arm-msm+bounces-97304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHrMIjyFs2msXQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 04:32:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3858E27D230
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 04:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2F14317A92C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 03:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB8434C989;
	Fri, 13 Mar 2026 03:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWO+UtPg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXOW47Dz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2928133DEC8
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773372639; cv=none; b=BxhJDIPoLivK3qkKZ0x+UNlYh+TNuBjPEqpC6RWIRq0wuUTvheJ4Pg4IChiSrkv2eFfalKgjuazNXnE9Mc8rX+zS4v4vsoxWqNSHAG1fJdXHw/2f+dAng0ptvP+lncQPm1XfpHIi6cTRQGzuqcA9G54wx41K/2y/LWjvHHPdQpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773372639; c=relaxed/simple;
	bh=x2YTsex1Fv+Dc4RVscR+kAhkDi5JIRV/gMadA9jhh1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YL59Xd33EXcyzcCt0dYhl6hbZHMuLjoA3jmtiMRqDWcoPEKCRxslE/C3VoZiCmT6Sw3V5ujMS0smZdrQOuMVaQJTDcXdtz16U+xqKSfhfKVcOiDJYYo+jZGDeljBSJm4I/BdeApfNNkf3UsVb2vwWMKzmpapBaIwyJYAUsjCkNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWO+UtPg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXOW47Dz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D0l3mk1739727
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=; b=DWO+UtPgB7aptxi7
	IpWiRFy46Yyu5dlnvr2iOJMHgoM9/JBoHvgrDNNRiytAUxGgHOwLa4LDtxuvpJ65
	nAMzAKvGaLul3l3Tv0Ej1veqNjHLYC8a/icnTIdvP33kF0yDwnKSSNWogQPmeB44
	or1oSiyoh2SyeFy/UNCDC+SBX3XLo17GHNUCT3U6E5Z5+iQ1x0wqd5ne41/LowpE
	8M0Gb5hwBjpJKrXD/m9cb+wXUXwTqlAbzwHkgAiVdXgz9i/WmKbm4jdfN3W7NnPD
	j0vusQQW5Y2CU+vI9pbDzcGAMZ/KFTZLeizSjZMByDZu6iQi/8bpoR2MWr7/sCn7
	9JVltw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdkq72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:30:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd773dd409so276751585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 20:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773372636; x=1773977436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=;
        b=MXOW47DzHB0vzx7zjdcxJUBRi6V4WK2sEiRLeGjI/0Qn2YND17+4WBggyl8c8nd8js
         4XXE8GOsFk246jYHk3XLxLs1ZscqVE7rYvnXsb+3zuuB8N4WtmKCY+nMctlMFHl+ZeAd
         5vWP2IACMi99FGbGqaP522YT/VOOXysnqeAv+yEjZogqazwGK8vPOkwdv3rXTDPoiLd9
         AiZCOeACDndAlEuDTGfIbO5LfTOY4KghuD6nXUrgW6mWt5XxUUsJoOOpDGjw8O5l6kah
         fqJ4ORQz7XjNEqqc3nW6yCxqPD+RxOfiAesV8UtGV46nXU1zjdve0Me6sHoy6DYIV/KQ
         qnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773372636; x=1773977436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=;
        b=dI1/qwaFGubVdtNO2JWc8VIZhkoqw+kFvW6COTmAEsAGPgE8g68JAJbjNa5Z6x4kWX
         BtKPggpAO3ID7FDT/OXx2Q9/BJGW9mpD969HHwlC8QHqWQICRq3FnPuvfkvkKN2sr6U1
         TlBEQsWU5ZxQeMa1Vm+dZnTP3CknU2YHGFmbO13/89E2ZUvRm31meUoQPelvfDbQhASv
         Y5BlmAVyeRkQXdOEMCkbJ3lO/SQpy2VZF7TfLAszXwc3X5WxfhRUa7eWcMFAvQjkQ0h4
         wK5qoE8F73ldi7dV+z16MyMpmV1z73nhcOad2yOco4W5tQ/RZLW7I5xahZYfYEWo5LRA
         4aYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/SxOCjD46C+9RFp2AGGV7VSWKE5MqRucT3yk8mHzdHD7wpAgRLQPbGcyUAl6qPII2aIurYBMKsL4TL3Gg@vger.kernel.org
X-Gm-Message-State: AOJu0YxLYZJwjcjgrXiPeHW5/QtubFrholqjQCu7lQnzLBiSJuckclrg
	Z9zFGgFTTGTFdbyowf+I+79OaBO4uIrPxrixhZr+ssSyqGh0X7KtNdXwYmodiu+ZXmzDSGy6uJu
	Zm/j7X5ZR/FtH/2zAq2Oy5rYfnZPpCRKTC+nebwytD60iwyyz1uDU49m6CIciH2pLI1UgSXLqR7
	lK
X-Gm-Gg: ATEYQzwJmq1caXg8pOEpLUgpf10DnqMWzOoSDpa/dR6o7YJ9AKuoGg6mkqz3uYlQuHK
	eSAFJvP52QX6UpK5PepnfkO0WV0pP8t4hZI6qLL1cS9gAiNuyBRYDylsktQC/PYU2QgIaWkE5VA
	acLLfrVqMmZWYPjPa84yf5PKnjxIMQ01f8mD9EsuMxU/YxouKkltZn3sm1NgjVcnamGf38F7XVT
	zzIZb/liwbtP8NgqzB/byQ4NqXgx0BtghNEBbJkNPDjpwyT+HLXI9mFiz/Zs7VPj/pNLyi5ESPR
	V82n9CwHA4CLBIeLW+yhz1/dYtjJMnhuxqu83whDVpZy1pVBs732Cxfq5PbTTxY29UFlqPl3f7S
	1RjSs3lScyQMo9TWzfG+TWXZIek2GPEshnhNLMftCsLcBOGZT7XQuQiF8z5boXxDel3eQkN6VIV
	aNV0Vty5nehLcu+1kvx5svqJEhidOd0SmOVx8=
X-Received: by 2002:a05:620a:4589:b0:8c6:a70e:4c79 with SMTP id af79cd13be357-8cdb5ba8083mr290616485a.80.1773372636018;
        Thu, 12 Mar 2026 20:30:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4589:b0:8c6:a70e:4c79 with SMTP id af79cd13be357-8cdb5ba8083mr290614985a.80.1773372635539;
        Thu, 12 Mar 2026 20:30:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d93576sm11254901fa.11.2026.03.12.20.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 20:30:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 05:30:20 +0200
Subject: [PATCH v4 3/8] media: qcom: iris: don't use function indirection
 in gen2-specific code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-platform-data-v4-3-14927df4906d@oss.qualcomm.com>
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2169;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=x2YTsex1Fv+Dc4RVscR+kAhkDi5JIRV/gMadA9jhh1I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBps4TMTRzfcsEsZy5IeJo7L2BBe8xgRKPhVMs+J
 55uXhHYT8yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabOEzAAKCRCLPIo+Aiko
 1UPwCACmHuSMTDuKpdb9PpcYhT/QUHJze0v8N06kQoJZrjCXj3hjzWJu6PI1qqKSJRc3XswclS6
 41y2pW+6ZZGtnOeunap5Wo6+6W/uqLo4Y0Eua+Eb/fQezFv0TAIbYX9jfZ40owTE3rmrne5e0+7
 7p1OMYkQFTGsjXj7TwNaIpWIbHC/mHzTQMCfiXsA4GOYnWwpW5ELPgOTwqd+bJrUjeGf9D+bT/S
 6tsLD2GTMdzfLRvFCCc9xOd8Uj51ELiVrULuEp0p8jhHyzy5pNrvO8S5B3YuiLQzhUEGJSq4+ui
 0ydO0mX9H2dqWqBh7iqnhYq13k7NDRYKK7HCf/9UUNPu39B+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAyNiBTYWx0ZWRfX60WCmEOJv6o2
 kTO8+bQyhGl2lY/Kf8WEYyw7JmXaAkt305Fis7JAiOMYO2lF0MjrIWmCiPz0EBEJth9Ei98TNq5
 szpHHnYmiSh4DzGX+UH0kAo90bzulSIJspI12lSk+YCEtQSd7Ud2XcSlO8g3HW40ZzPojDAbMvl
 PmZTI2pexL8auMJKF/jqu59xP10YxgztkhbLjQFy9p4m76Qn7QjKABakSWbINeOlZtNp+oOmLSi
 3zdW33MKDarDbMobvIFrNPz5a7uVv45fTPwefTon7SzM6gFUxkicQDONZjJS09b3sC6MIbEY1fw
 A0HnoErS/vzkuXcd7Ar8KZlvSdAp7J8+aJt1AxKUzmMnhrdeF0MNowOD4usjE+6r8JaatW3B2iV
 4peY8exlJ+6M4q4bQWPlCYSvv5voO9Q70cNlADXDLZkznpUxiVDP+FHsdSTirf4hApPF90aEimT
 lqQ0VWMKX5sgnXX51VA==
X-Proofpoint-GUID: YkIi10DCw-cgKcuD5fW7xe7gGYA3PfJK
X-Proofpoint-ORIG-GUID: YkIi10DCw-cgKcuD5fW7xe7gGYA3PfJK
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b384dd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=yEfzmaBkz_6XQGMMuZMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130026
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97304-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 3858E27D230
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To note that iris_set_num_comv() is gen2-internal, rename it to
iris_hfi_gen2_set_num_comv() and then stop using hfi_ops indirection to
set session property (like other functions in this file do).

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423b..e4f25b7f5d04 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1205,7 +1205,7 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
 	}
 }
 
-static int iris_set_num_comv(struct iris_inst *inst)
+static int iris_hfi_gen2_set_num_comv(struct iris_inst *inst)
 {
 	struct platform_inst_caps *caps;
 	struct iris_core *core = inst->core;
@@ -1220,12 +1220,12 @@ static int iris_set_num_comv(struct iris_inst *inst)
 	num_comv = (inst->codec == V4L2_PIX_FMT_AV1) ?
 				NUM_COMV_AV1 : caps->num_comv;
 
-	return core->hfi_ops->session_set_property(inst,
-						   HFI_PROP_COMV_BUFFER_COUNT,
-						   HFI_HOST_FLAGS_NONE,
-						   HFI_PORT_BITSTREAM,
-						   HFI_PAYLOAD_U32,
-						   &num_comv, sizeof(u32));
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_COMV_BUFFER_COUNT,
+						  HFI_HOST_FLAGS_NONE,
+						  HFI_PORT_BITSTREAM,
+						  HFI_PAYLOAD_U32,
+						  &num_comv, sizeof(u32));
 }
 
 static void iris_hfi_gen2_get_buffer(u32 domain, struct iris_buffer *buffer,
@@ -1257,7 +1257,7 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
 
 	iris_hfi_gen2_get_buffer(inst->domain, buffer, &hfi_buffer);
 	if (buffer->type == BUF_COMV) {
-		ret = iris_set_num_comv(inst);
+		ret = iris_hfi_gen2_set_num_comv(inst);
 		if (ret)
 			return ret;
 	}

-- 
2.47.3


