Return-Path: <linux-arm-msm+bounces-76571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1C8BC82D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAF03189E56A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763652D6409;
	Thu,  9 Oct 2025 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3XqO1CO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0452D540D;
	Thu,  9 Oct 2025 09:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760000803; cv=none; b=SisaN8R33TWEoGJSMYzLqZU8rBROglYxCT/OnMMcpJiEp9MTXUbOgZ6wLhMzX2GPSqlK/6N5V+np9toEL43YI5hfPSP2KluO8gbUMjBsj/ogCt3+Cwd+Yu5s3Ob1aT6s58yKHqN9raRrQWFQY/8z2xTWSqmmF+KwH8B2TAC2vd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760000803; c=relaxed/simple;
	bh=TNu+ibU6v34rTUzl1MXOCGiI1aCY6U8lQ3gLRd8GywI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o0Lsuxem0tUMrhaA4ThoYDUMPawpzmf2MM6vNpF1FAEtnHDPIDdBqLelWvqzpf2fVKBjAvdg1LJK7PMLrR+kTqy/9ETV8ipL4KXArkoiQliksIhRmtCmBJWwApOmvaVvXW49t+aLutAq0RPAJrW83rg/xO8nNNHk2rDeHIdyKbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3XqO1CO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EI18004929;
	Thu, 9 Oct 2025 09:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Nmg/CDTQbw9
	KGrJHT2tZv+I1f6qNil85/LJcPh79njs=; b=J3XqO1COMLTtXXNS+mfL796Zqm9
	SaiNugcmFwTw98IBwq7o+vvuFM8H6fual93iPPqTf2lB/coYGTv8FR6Q0JXFGubE
	SSnW+EKjp9+nFkl2YbTrL//gI81b+WoV6ESyQbFwQ87GBLgTB3D3Zd/BS9dLB2H9
	kB3hUB+BHT4KppRxzFNk2zUQloIyZiSUWmSlQUu34zXTrI7NAgkvDpPuYeGlukhW
	hOqRJfuP8Szj1G8nwk/tqn6Owg9unUor3JobfQuTubVgd8k1UJYxpsCxJAphMU3J
	LqreabPyNaLwLJYaisT2ScibYoMBeMUvUdl7Huf2d4ivEA6a0hwOnkAd5Uw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4u25u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 09:06:31 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59996TSH007088;
	Thu, 9 Oct 2025 09:06:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 49jvnmykc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 09:06:29 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59996RTq007039;
	Thu, 9 Oct 2025 09:06:29 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (cse-cd01-lnx.qualcomm.com [10.64.75.209])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 59996Ses007052
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 09:06:29 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 7390F21BB1; Thu,  9 Oct 2025 17:06:27 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v2 2/2] ASoC: qcom: sc8280xp: Add support for QCS615
Date: Thu,  9 Oct 2025 17:06:19 +0800
Message-Id: <20251009090619.1097388-3-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009090619.1097388-1-le.qi@oss.qualcomm.com>
References: <20251009090619.1097388-1-le.qi@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Vrcuwu2n c=1 sm=1 tr=0 ts=68e77b17 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=CJnTM4orWChyhekU3J4A:9 a=zgiPjhLxNE0A:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: gJGgiy2-5ADUNnapsuW4DQAw5I-VNQl_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX6JZXRlXUFt0+
 FQ+mAyuLqQhLtSWl+eLR1yDFsKMFEERkNtTh1zwzHF9yRloLtC9rE5Oi8mGtd5zxh1ZCaMr/DDi
 6l3x2COTylKODD+jZU3UszQxIxRQEPITiw/dwzflPFMCMEAzbyKzLT34eJw6ctGlqYEQGakOW2W
 hfY5U78EYgIb+4lku52OUOf3bqjF4BXu7OZLCEa52kIZULuiqEVE5F1OZTZg3dFFTmho/sE/o5F
 frs2Roj32maPGVsTcPCXokNIAiykadTilOOmN5AojbvsgsruHqbkkrMg0fG2nkzCnO8w3RhCvZZ
 toqS9dis5W/sBAVtEIoiS9jPAKliowoDrcpbT3muuL7KstsDy/u2tbShcF4SrdKXtkJr9WoLwcA
 h1u+g0RIir7CFihfuwQZNaPMEqkDDA==
X-Proofpoint-ORIG-GUID: gJGgiy2-5ADUNnapsuW4DQAw5I-VNQl_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

Add compatible for sound card on QCS615 boards.

Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 78e327bc2f07..187f37ffe328 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -192,6 +192,7 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
+	{.compatible = "qcom,qcs615-sndcard", "qcs615"},
 	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
 	{.compatible = "qcom,qcs8275-sndcard", "qcs8300"},
 	{.compatible = "qcom,qcs9075-sndcard", "sa8775p"},
-- 
2.34.1


