Return-Path: <linux-arm-msm+bounces-29149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C58AB958F5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 22:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EA50B22E22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 20:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA0C1C463F;
	Tue, 20 Aug 2024 20:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jb92FbYl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4761C579D
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 20:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724187013; cv=none; b=ZiyH1JN83brzXaxTPApXlyVrgZ5o+JvQ16GBYHJ4EwJuuGSCRDMXaDQ7qiNpon7wLD7UJhPN8Tde97Blp6+YX0NLrZGdnfEvn5TqPDiLoUfG5+K8hkkFLLZAenmAuHZNds1yMpMdxmm3GV1f6Vb2Cgkc/XYNcZnFSj1fmU03a84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724187013; c=relaxed/simple;
	bh=moUYRmKoiklI27xXChgM7F3wRr4LTiF1FOPhO+EjaIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To; b=mKtzMqE55/hiwWwMbooGa4aNYOpt37Dkz4PS6XLBnMNtw7aP3xHNHRkxNvsMED4/y8pPpTNuQcfeWOgqYwZOOjq3ZsN9mECF1QyxGEM6kBWz1xA6+FaKLbnIDPUvnZ2VfOid/BDOYN54/mDD4f+86jaabogLERQzdPKd/cxp5W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jb92FbYl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KKflcw002183
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 20:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	STFgVJkvjFKc6FxMrNncc/kN9l+9alOK9mTNWuNXnAs=; b=jb92FbYl7xaPF0eC
	BmyW+K20LvqYi9zzXqHmqmI541ctaVdZzLEPlyMYPcKaN9TXNBTdZK9vdlTbvBbQ
	3OEt6Sk1lKOuP5xpWo+Ho8xznelJNT0puK0BSPodiDFCL0VTIZrHUet+516i8jEl
	Sai1y9zDDgTtWHNT1vLC+M6AhL4/SOS1NwhyKQ+uXCV1ph9uN4X8wxRKcck/tik9
	Eg7KLZ46BZW9wJtHRAv/SvxYfq0HBr68dPJ5F9LOKNF3lmCZbVBefx5oGJqZxUnm
	rZdwnhB/ft5duguCTlzGngKTteV71OdVmlzpekSMyNho0NzRD58sml7TqHy4nk3l
	w1waIw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412key8xgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 20:50:09 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47KKo8rU002019
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 20:50:08 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 Aug 2024 13:50:08 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
Date: Tue, 20 Aug 2024 13:29:32 -0700
Subject: [PATCH v3 3/3] soc: qcom: pmic_glink: Actually communicate when
 remote goes down
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240820-pmic-glink-v6-11-races-v3-3-eec53c750a04@quicinc.com>
References: <20240820-pmic-glink-v6-11-races-v3-0-eec53c750a04@quicinc.com>
In-Reply-To: <20240820-pmic-glink-v6-11-races-v3-0-eec53c750a04@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724187007; l=1619;
 i=quic_bjorande@quicinc.com; s=20230915; h=from:subject:message-id;
 bh=moUYRmKoiklI27xXChgM7F3wRr4LTiF1FOPhO+EjaIk=;
 b=to11t3arKv1hYRqlCMa7QoXl3uzxRDjACill1OOmQZBNQHY9Uo8nWdW2zaev3QqiDdpu7HFyV
 4ZrjG0/sxAsAqCDTqJWdJmujHZKGgdz46ZSISdCQIZttaqXXu3L5PMa
X-Developer-Key: i=quic_bjorande@quicinc.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SHhN_ZAt_vC8k3hSmIwFHheqVYcqTxki
X-Proofpoint-GUID: SHhN_ZAt_vC8k3hSmIwFHheqVYcqTxki
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408200152

When the pmic_glink state is UP and we either receive a protection-
domain (PD) notification indicating that the PD is going down, or that
the whole remoteproc is going down, it's expected that the pmic_glink
client instances are notified that their function has gone DOWN.

This is not what the code does, which results in the client state either
not updating, or being wrong in many cases. So let's fix the conditions.

Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
Cc: stable@vger.kernel.org
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Amit Pundir <amit.pundir@linaro.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/soc/qcom/pmic_glink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index b218460219b7..9606222993fd 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -191,7 +191,7 @@ static void pmic_glink_state_notify_clients(struct pmic_glink *pg)
 		if (pg->pdr_state == SERVREG_SERVICE_STATE_UP && pg->ept)
 			new_state = SERVREG_SERVICE_STATE_UP;
 	} else {
-		if (pg->pdr_state == SERVREG_SERVICE_STATE_UP && pg->ept)
+		if (pg->pdr_state == SERVREG_SERVICE_STATE_DOWN || !pg->ept)
 			new_state = SERVREG_SERVICE_STATE_DOWN;
 	}
 

-- 
2.34.1


