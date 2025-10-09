Return-Path: <linux-arm-msm+bounces-76523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F31BC734A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 04:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46C9E3B9885
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 02:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6A31DDC3F;
	Thu,  9 Oct 2025 02:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dV9DuCmQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C10313A3ED;
	Thu,  9 Oct 2025 02:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759977254; cv=none; b=kj26QwjlrPjrTxTGk8pLRlpRxBPG/CHVJiEgD0T/czkjlv9GbgBoIrSezwTFaCeFz4ryOcG1tDRHSze4PxIKQ5UutyXP4fVo15KcTsjdoOzk6L/t02nz6Mwbm/S/ZCW1++99OhFT6BoSSsUZvefQ5YzzeBKG8z7ZycLOYrAkRVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759977254; c=relaxed/simple;
	bh=7PEAQBmnKj25IlJvXNk3GINoiDaI8YnUnTmrbcbQZlY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eP8E8tScnkQssYo/FT2YgcOFCEukfevS/c87QRzKIm9uRTuvG410W+7OMDrlaVepMqGNSzWOp38ebFFofruZmILmWZww5x8e5b68WeNfyMaCE6Nc9gSZE+/BsbKU2bovJ+R3JDYnED21zBAIPpmIVKV45niZW4Ovt4pwQSE+3po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dV9DuCmQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5G1g006718;
	Thu, 9 Oct 2025 02:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TWszQfwC/h/
	G0xAXZ467TGRkMAjVYFIzx5CBKtwBV6Y=; b=dV9DuCmQP3UOUVmBHO/V84dMb+g
	zRXq6WhyCszIYT+8LEgJnNxAKRna4PB+n3UmuKIBAvxsJl/iLDDZT/qdu7Giakdj
	YLycvEceYRruoWr2Jxy53K84MuEuz1wSt/lav6z5gGlGu0ghE4evDLoJ/ldkuq5a
	nBAvKGbcRALXwErhDZrLXIb6xfdx5hrLtgmDp6vim/Bs1X/rnfhxQtElYShl6hMl
	PdQZeEQlHJ0Gns59xXKu2xQkCw3Hhp31rVQhByFOLYaYjS0EKZ3H4+bTB+LvTmZY
	ymNigAB2HPILN6zv+8mp43E23KLq0GBpFWRQuPvB8mcwSdX7KRoYBslWpEw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nh6rn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 02:34:02 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5992Y0Wa026744;
	Thu, 9 Oct 2025 02:34:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 49jvnmwgsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 02:34:00 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5992Y0Mo026734;
	Thu, 9 Oct 2025 02:34:00 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (cse-cd01-lnx.qualcomm.com [10.64.75.209])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5992Xx4k026724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 02:34:00 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 95CE32185E; Thu,  9 Oct 2025 10:33:58 +0800 (CST)
From: leqi <le.qi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, leqi <le.qi@oss.qualcomm.com>
Subject: [PATCH v1 2/2] ASoC: qcom: sc8280xp: Add QCS615 compatible for
Date: Thu,  9 Oct 2025 10:33:41 +0800
Message-Id: <20251009023341.27277-3-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009023341.27277-1-le.qi@oss.qualcomm.com>
References: <20251009023341.27277-1-le.qi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX3kZIjm/yzmVt
 DwlUy7be5Kue9Q4P3wxhdnAQU/7Upnh5PNteyYKoSLZrrleFxD/oOsD1oHaa9kSS3KsX0peGwoZ
 TZOSYtdCA3kywEOOtGF7heqNtQR04G711raNNhOuUynaJnfkUQQhquJcUJECaPzuLL8tyuto9qW
 m0vsheNt3bq836spA1cgsgvqVggdmdyZpwtOJ3Joj7s/W9noGdjwz8L7xUgeb0K6hgVCJ2Hd3qX
 05hJtlV1fgByak8b3UTYSlelLogOMKNv3CCxTy8LsOgqMhHRljzwqnkwC0N2HornNwj8bbAL4CO
 o1bRfuftrnNFO9GGpy/qRLwpqjYA5FgaeN/2Eh6HfBLx7dV7qWjqmtIzUCfAIA80zEmvqKD8XSR
 cdB5TjAp+dHRru5DEi2j14dnxSUTuA==
X-Proofpoint-ORIG-GUID: WWyLSaAfYa7Y_9LyC5wu040jc0DLZeLS
X-Proofpoint-GUID: WWyLSaAfYa7Y_9LyC5wu040jc0DLZeLS
X-Authority-Analysis: v=2.4 cv=VK3QXtPX c=1 sm=1 tr=0 ts=68e71f1a cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=FlHidBSV6oufmEqtmYIA:9 a=zgiPjhLxNE0A:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1011 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

Add QCS615 compatible string to the sc8280xp sound card driver
to enable sound card support on QCS615-based boards.

Signed-off-by: leqi <le.qi@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 3cf71cb1766e..1780397e68d4 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -192,6 +192,7 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
+	{.compatible = "qcom,qcs615-sndcard", "qcs615"},
 	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
 	{.compatible = "qcom,qcs8275-sndcard", "qcs8300"},
 	{.compatible = "qcom,qcs9075-sndcard", "qcs9075"},
-- 
2.34.1


