Return-Path: <linux-arm-msm+bounces-76685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8DBBC98D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFF993A5855
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0D42EA168;
	Thu,  9 Oct 2025 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KRPIlznT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6C9153BE9;
	Thu,  9 Oct 2025 14:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020776; cv=none; b=TWZC0GOLjr1zIo25N0wKRmHK/v9W/jc0036eKGqHrbj+NPhTWZblc9Pj0tgw0WV66B6pk6Pg6ponN8t0q+JjbI7Wd6shQx57OXKO53gYFyMsIbAhMaoDrCYoATTjT1og5ovBtxGGPU/npkpMxtPIGrLXtccs3m2kuGuTcAYGR60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020776; c=relaxed/simple;
	bh=uh2IDWFo7rvYDMsMhJuSenYWne1sXcCRHwdbLyiokz0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oh1Jzk4C6euknAaHGXlba7Nc0+thS32sM+3VENgo189dTCL6gRCOL9p+jFRP8SxihlRbUW6NgvJRpeMhRuuPUoJa1cDhwX6Lo8bvm02/hmvw8iyDARYAIjukslCGH+DXbVpfLDYd/jxT1akEUiW3eyBBlfI0mHJ40J53vg05Z6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KRPIlznT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EHWh029031;
	Thu, 9 Oct 2025 14:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FUkgG7zdl9I
	vI+P6lJzi/KqtMlYeRq8sWqEluHu5vC8=; b=KRPIlznTgZ8W2DcTTvqonsdknTN
	g5u2k6jhnfNagvf4260pPv0vcZjYNa0V1CfGG/GlYBocW7tF1dyl2gFWdnu6SgRg
	UEYQDsL7F1X6QnXXZBul6wO0moiVw1jts6kQWQy5cmPs462SsxyEXfhyaF/sd+f9
	YVLoDR9FurKzdUzFwrN19KaSvZN+s1pOjHBT62SkM1gGjX52GV4dn+hvnUV9sQnx
	t/Zg7GwZ5EHvyrVpEYbXLewmrPdzPRhabMeBKV2vmmKEMzhr53RDte+ROavG/qFy
	41urdZ643w/BFBC54HY9Kd/t+gzLqUD7hJ6K0CRZf5mD/+Cj5cRB3TMXgsw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ku8bn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 14:39:24 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 599EdKPr012507;
	Thu, 9 Oct 2025 14:39:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 49jvnmddp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 14:39:20 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 599EdKgn012478;
	Thu, 9 Oct 2025 14:39:20 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 599EdKhl012476
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 14:39:20 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 3A9BE5CF; Thu,  9 Oct 2025 20:09:19 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com, kernel@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v2 3/5] ASoC: qcom: sc8280xp: Add support for Kaanapali
Date: Thu,  9 Oct 2025 20:06:42 +0530
Message-Id: <20251009143644.3296208-4-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009143644.3296208-1-prasad.kumpatla@oss.qualcomm.com>
References: <20251009143644.3296208-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX8xgVySD7Woq0
 Y86bmDCvreNL4tDM56+plwWT+CfslppuACT4/0AtkLKDlBlpMgLmwkfsiG6PQrVsIpw1ZBSVRwM
 hXOCMpnTKwFKLVSnQ6nPKg4FjlJuK/eLUA+WapZRGn0xEmAOBtvHC3uTnXqgHfL2lUX9yyWpRcF
 dUjPVYOnP+h9qsTou2xEdSZeWzvud30BvmpU32evh3vrbypMiR6R221VDbFWvPrBiI0cCQzB1o8
 BdM049RZpD9th7dwKvgCzSAQKFQalqHBCegWKg7UBV7HLcxPN+Pa032404pN8PLtVgxCjRan8VE
 RvaonZglxA185CdZcq2zENVT5nAUUAzd0u6vkTDI690fPWbtnnG0q2Ws6rw7yaWIxMulTMeYsqC
 gR9x/abG+TPI++G+a/ZWk1Wi6icUdA==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e7c91c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=aEigdc9k76sli10p-ScA:9 a=zgiPjhLxNE0A:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: StZ2_NNm9mmhzDbBSaSxIMA6vnSmBos3
X-Proofpoint-ORIG-GUID: StZ2_NNm9mmhzDbBSaSxIMA6vnSmBos3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

Add compatible for sound card on Qualcomm Kaanapali boards.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 78e327bc2f07..aea8c1daff32 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -191,6 +191,7 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
+	{.compatible = "qcom,kaanapali-sndcard", "kaanapali"},
 	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
 	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
 	{.compatible = "qcom,qcs8275-sndcard", "qcs8300"},
-- 
2.34.1


