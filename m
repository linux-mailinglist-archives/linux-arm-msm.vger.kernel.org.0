Return-Path: <linux-arm-msm+bounces-63189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C11CAAEF516
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 12:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 640C2189FAAA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942672701C5;
	Tue,  1 Jul 2025 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O/7Q/b9F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300EE1F239B;
	Tue,  1 Jul 2025 10:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365789; cv=none; b=hq8X7ttoSaCUIFajywO6oIiip9cBnXViWShqRHrFSHvqpve6Wj7K0rF2AXzBoNjrP+c8UAqAHpsnTpj7UmFN5LRiWQADfrDbxEmwA8G+62UQhsk2FH/Hu/Y9Fc5XLKRF1KvihN7hQZAFSysnTaIznrz+YaPH0z8Z8ucxVMhoSvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365789; c=relaxed/simple;
	bh=2mJk9Eum5t4pNGi6Q9QGdatWv/sDlgLSsfFdSWAZ4gg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HNKAFsFzDvSwAtjC56xc5DGBc/tTdrupFUo1dJLG//QU73qsnTSVM1AVPlT9pZgdqenCKNp3CnLzZXbLtVq+Gb/Kuv1Qp52Ed5vPDkJQ82bimCccoZwNGGyN9I7NtSwzRgeA/EkYMh727eRW1hFBvecRj8fAK4bJqRhgslmgVMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O/7Q/b9F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619tDXR032111;
	Tue, 1 Jul 2025 10:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xGjULuwgYbi
	U7HMpALt3KEVMuc/dt4WL9tlJT8Fcukk=; b=O/7Q/b9F4DiyWECrdABJXrLpkVI
	mpVOD5gLPB9V0+YPH4uRJgoYuMK4fh6CbIv33hIT/5UGJBOzHqO7MWzGmcG3Xu0X
	O9b/9ShSKfMQ8oZ+OO5Rg0w2BhiFRvj8zZXehYVGdPt1wYLfbfKrAtU1AFrZDU34
	mDCXOIzDSDDqXx8teKtzF4Eucsb5WtESfvkZ+zJxicXRP9LPgdyzEykHaXAzvEb9
	dcDBiJQxkVnX1+OXMne2B6QOVKotyN4paDxcPR0PZBriG0BfFc9UtRLzzpbV89MG
	qAdT/dpzf/7XBx7zYqHjVJxh2zltqxHrm8CEc4+AIR1JVxPsu43LAfr51qA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k8hyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:29:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 561ATWW8030926;
	Tue, 1 Jul 2025 10:29:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 47m1bxafd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:29:32 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 561ATWYq030910;
	Tue, 1 Jul 2025 10:29:32 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 561ATWcL030906
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:29:32 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 47ADB5C9; Tue,  1 Jul 2025 15:59:31 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
Subject: [PATCH v1 2/2] ASoC: qcom: sc8280xp: Add support for QCS8275
Date: Tue,  1 Jul 2025 15:59:15 +0530
Message-Id: <20250701102915.4016108-3-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701102915.4016108-1-quic_pkumpatl@quicinc.com>
References: <20250701102915.4016108-1-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6863b891 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=ZYxQib0Qg78sUwspPo0A:9 a=zgiPjhLxNE0A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2MyBTYWx0ZWRfX5cU3EceRnvYd
 kw13BoQ/U3S1itmPViUvGur8V1MdTfD3wtNx1/Tmv44z+L3yLdbMZOxIPpi92fUHoyF6Sn72+Uz
 aJoDrKKcpWNhkxSMnM4/wlyg1cs42qFjhX5d69uD20M+Jn6wyjGbKC3lcvMCQlGEiMn2eY/8vaQ
 Wtwse7DKj9jGTaj5zYfdtzjsE1W8ZR/sH+Mn8Lp03gSkYgaj0w7RkqCsM1H9Z+t8l+vtt0TVj3R
 hTEe6WbTxFGQgHjtGKxQ8hiaYZLhukKZAYRBqsI/Q2Z7p6PIj+13AhmFlKKcM0iOP8DpteEqQ/5
 fG/97FZRKo9TVB8RFUsq1tzSpJ2BCd8ZAd500VQqm2rnGZK3M7qF/3igJDbX6ZoPig1bMH3I15v
 Qo9iC1gk+Soi6XpGvbmIa/D5Mg5HYKDXpWkoLhzoVjG/kOo+hleEAsnA89Saq5F/CQpfO7tt
X-Proofpoint-ORIG-GUID: j9hdgsrQQFV0PXNzSXGMAGv8WTs2l1-j
X-Proofpoint-GUID: j9hdgsrQQFV0PXNzSXGMAGv8WTs2l1-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010063

Add compatible for sound card on Qualcomm QCS8275 boards.

Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 sound/soc/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 99fd34728e38..73f9f82c4e25 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -186,6 +186,7 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
 	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
+	{.compatible = "qcom,qcs8275-sndcard", "qcs8275"},
 	{.compatible = "qcom,qcs9075-sndcard", "qcs9075"},
 	{.compatible = "qcom,qcs9100-sndcard", "qcs9100"},
 	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
-- 
2.34.1


