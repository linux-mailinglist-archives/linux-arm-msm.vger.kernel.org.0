Return-Path: <linux-arm-msm+bounces-107296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KD3zOKh1BGqdJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:59:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E55533789
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68EA03118650
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0162C4779B2;
	Wed, 13 May 2026 12:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Okaa+Tw/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JpDoYT7o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E136423147
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676576; cv=none; b=SV9bj3g4+ywBzQQwt3rRhvrxdba5bR0/TRi9oz+XHoHQwyuZswSA/Ln3VK6qbKNzdLm3KHVHTGX55l0EZD9qzVek2PgQTSy6ZtCzF2ptuTURMeI/hfKduaSMEbzsOEG3pkNiFGQoXfWUs06TccB1LK0igxjPF/JU4bpEpQYp5Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676576; c=relaxed/simple;
	bh=kRKs4Ld/R5wPud9lDZEt6GV0QZ16SIkZn9USZSX7X/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nwk9kZaPhB1VsYy+poVXHNGSbYp5r0gOZLXNXAfDO0zisa6lDvkAzJH4UDl9Mbqdiye8MdmYQZRtIjJBLejyuscOiEmqIGtf54EE32jQJiLlF6/HRs/tW+W8+f9rTwNV+2nJM2u8cVKRpfkiX4KwfWBueC+CViU6mwAUzH5ecwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Okaa+Tw/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JpDoYT7o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8nT6v2888500
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ereORPv71dmyzxkJLNhe5MuVEc7N5EYW40Eup96NbL4=; b=Okaa+Tw/2GXSDxo4
	YHKVe0v8flVGIb4fugtqmWVMoD+1R4beBRdVWgai6oHFkJfCb3Z6dVtEOWMcMIdD
	x2WtLZsJDlPNxlkZRJpaDgEuxdmebjsqD0tZCq6JDYTnVq9S9oVl9woEf/YqPjzh
	zLT9xzY0bRCCkc1/3a3yKFkoRMMLMHLrmqjMaFerYlzwGHNelcEn7ydQf7Rh2GSm
	GDDp4WJnlMDo3z5Zsx/wsTuAlR0VDTkLVd0bKk4DHzTp2QWvRbH7P5WCTI3OW7QG
	FHaole0h7GxoBvO4WqnceX12qQ3+7uAofEQL5mKDKTY2XoXfa418sAi81XzSUKAW
	vlLAmg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4ggv6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514a182b90dso51502071cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676567; x=1779281367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ereORPv71dmyzxkJLNhe5MuVEc7N5EYW40Eup96NbL4=;
        b=JpDoYT7oXlkupkfHaCmWtDmH9wuK6bEhoZfpS2jbE8twqCQ/wRWtVBMkxy4VFHFisE
         4NfRZDVxFW/Bbc3ADd9gws9PTjcgt41MeAvJxjHvSo5SKWMUEigWGsplgK3dDRfvDnP4
         TenU+BqkPuiAdsQDpi6RT4OuK7OPCOf43ElQJfgKbHSvhJjKgveHILb+js1q48IQB5bY
         UjwFz2fXShItkHYJNQysSadhKrtezohdJJahfyjtFAg7AaK+iq7iJvM3THT7LspbRlQj
         IkIyqCVHQc+311p+CVPgOi/U3D08BI6L2zjLUvHZHlXgOn5xu1PwZJWJFjmv8SuxyYbL
         CURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676567; x=1779281367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ereORPv71dmyzxkJLNhe5MuVEc7N5EYW40Eup96NbL4=;
        b=DkhCdLASGlBLw5uSxnuUpoqnGRmmuhBL0pnHHwUM3YAtvFmfedZXOrYMwPDHgeJAhi
         F5K9ZYIcCeS1YJQT2g9oUYsK+iVtof4aBNCHf2HsTnYwhl9BUBBslm9VOK/XY8i2Imfa
         5qISUbMf/qByCbYBGoorA1n6SL7DYPWbLfzXPe+NgU9etGhJcFNchjaY8ghhl9SedP7n
         /BYm1FZEiCD17jrAstDSa+hs7xq1WNBmj3ncFwvu2fTg96WWbP8p+PYKXDaObuO3Tgis
         CCoBjEFBGZKQY4ILAUm1dEk11lkmDVfWvAIcfBYNb3zLFew2ZezMo9SnH5IbogOrchLe
         x/pQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9VrWM5bWZiTB8N9EpSNwZhVHPVG0nkOT9HLz+jibdg4V+Figv7SKlkn2SeiJ2MPDgepeDOGFtXd6DcG5r@vger.kernel.org
X-Gm-Message-State: AOJu0YzB87TqyygqDoj3VQ+PiSNPTDeRub82e6xrzK1C75RNzrfYBla9
	d35ozHJKOLBupTkezTWKGPEKltyTrDMfz0SxpJyujW9GoYt14Seg9o/+Awb7//piepSR+kFYDFA
	UCoSCRBR0Wbm82OEztORwlUAFAdCEQ/VwZOzEkwh1knj+nIIJVxdUAGSv7dzbQ+QTm+Eh
X-Gm-Gg: Acq92OGPDY+INS6qrgpkYbvwyCXMeb68LZn0aKskjTQJ39gtIjLUQuyUEiMBPe1iQ0P
	dck9kfn/9VzfAUQ0s3xjgkCBXpeZA5PAjmTH6t9ZbXDWkoqgF9vFHLFRC5HdLVlCXi18s70GfxF
	Gu5sSdgLdQkxEoAiTBtcSDlQGOtZDrgeJMiVe5MLwvTOC/Cdi5sJfk+ncAujNKs7gpgwScF7hoo
	R7leNLxT+w5rWckbWDME1+b7I1MvJm+vZNMauaU41d4hss0XacK2fYuEBdPOq+o2Q4z8Q/5H6we
	SdjeOj9f03QPXuCvk1AWb7Nk0K/Z8V59q0cN3mX+XKS6PYh+IHAUOX7DKrcQeLHMPCsByHScbi7
	nbZJjkBPonoPiyJINw9ENpPYOgtHQ6Po+CUiG6K4XZHan3IbL2FVfUcHqlFo7+24Wik9LP2feF9
	Aa60AqfoKQJFXuwr/uHPkFFlYLayccTXbTt5I=
X-Received: by 2002:a05:622a:11ce:b0:50f:f0be:dc7b with SMTP id d75a77b69052e-5162ff46f46mr34071741cf.39.1778676567105;
        Wed, 13 May 2026 05:49:27 -0700 (PDT)
X-Received: by 2002:a05:622a:11ce:b0:50f:f0be:dc7b with SMTP id d75a77b69052e-5162ff46f46mr34071311cf.39.1778676566598;
        Wed, 13 May 2026 05:49:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:42 +0300
Subject: [PATCH v2 08/16] media: iris: skip PIPE if it is not supported by
 the platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-8-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kRKs4Ld/R5wPud9lDZEt6GV0QZ16SIkZn9USZSX7X/s=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxZLsYOSp/Ly/CtHctk9U0r7Ig65/7ljGHbxayhDgnuCe
 LhVrWsnozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACbCncf+T6Ggb3HS+dyKjDq+
 3pbY1in/Tq3ZdklGRLvk3LQ1N2ZnBbgcim2/oN45z+Xel3Lj+R1bOiVuH5mYs7EwlFlI27PnlOK
 sipDclZEeHy8yrtvYbmz+Xe6bSrCXG2/zi3nbFr+7PG1bPtOG3QEl5nFnLvdxiyT80eZ4x5z5uM
 Ux2rDYzOnXmziLiY4d2w6HJiQrs85oXlL0W8voXetT+w8Cx40lvffMuxXyL/Evo3npv5q6ZSvnx
 F0L/KexqJLtzI46gcmXwr7++Gri8GR1pFjUk56Euf61G68a7nrsx8u6f0vxvKvOhYdzV296HbCs
 yGKmrsJi2+SZH3Ot/x2bVmeXxrJIwz/a7+J1qxhm/nxBAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 9C620GYNLVd3pCDy6qVz3YrqZ3Kwcljh
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a047358 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 9C620GYNLVd3pCDy6qVz3YrqZ3Kwcljh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX9zMi6YFYSZsE
 2wppVBlt5WmEj7e7fuF9ZQUvod4G7tqrlZIp80DD8C4jXrAF494thKtEbVG+yj1ADDrjgUAGKOf
 qjO09nV3ZSGsaU3lwpw9G0t+kIEJp+Yf7wkWqRhcQN8o/ACKrtxiWeP8IXYw39GFvzL3e4HD5Kd
 kQXMWJtscU2PjVKoM25qghmXnOdnEQL9C3QiuqZJJRJ1NryC2LzfTcuJa91z+ooKbqNT76L0VAH
 gILNlmReT17mmirm/VokMVcjqAuyqZzxubns1KtUHfXnhJxO9DDsAjqbImNLhZ7KWV2vXEMiZNB
 HF60TM258uLHZKHfO9gOPKW4iF6ZM3NOQ0nr65LUnUkB3sqDE1eK+jKxon1XoIBULRF0qTm7Cow
 ZczZRcDvG0FpnI67cS1P7CQA8KfYEJAnXwd2asfLh8ak98i/JEGJsGzvcGzdoS/77ZDzyJ1hhV2
 OIrWm9c+WzWydiJ9+eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132
X-Rspamd-Queue-Id: A6E55533789
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-107296-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
won't have corresponding entry in the capability tables. Let
iris_set_pipe() silently skip propgramming the property if there is no
corresponding capability.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index ef7adac3764d..f438dddc19ba 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -450,6 +450,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 	u32 work_route = inst->fw_caps[PIPE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
+	if (!hfi_id)
+		return 0;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.47.3


