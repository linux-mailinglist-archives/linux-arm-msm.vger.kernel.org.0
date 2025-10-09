Return-Path: <linux-arm-msm+bounces-76522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B6DBC7347
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 04:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1D5819E467B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 02:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B6F1DB125;
	Thu,  9 Oct 2025 02:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XzaGlgMi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C15B19D8BC;
	Thu,  9 Oct 2025 02:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759977253; cv=none; b=tqv2m5+UFS4PbVFtDEhjXOdXrokuJnVRw1zJ0vsjtzKn+qKzeziBLa58Jt1WKI4HPMeHQYK9687Id5/VTiw/JBPgAffRHtIDQfYpimWTXHa724TYwFSy6uVHM0n+K2of59lRY50WPp0+mAOAHLZvsl6NQhqS02/VvrWF8NIZMaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759977253; c=relaxed/simple;
	bh=eVUNRhdQImHHCEv6YSUjF0Y9hrbkTSeU2jct+pr8qb8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LAOcQyqtCXUrXDGL6r62f7xF/P4Kyw+oAwjf0WjgDqQIxPWAh/m9MMCGLpWmvF6fmmiDgq0jIINwTJEyjl+0druxK5Os4eTMPls5Ywrivj44kerY/eN+bCWztKvOCEyvYNRSEXhPFUdwNpsL9tmm0dmgbG3HHjXuPOgsyqEQXRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XzaGlgMi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5HLg019521;
	Thu, 9 Oct 2025 02:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2yVGCQnbJBK
	Txy9yWRcXlSajLarce85lgj6A8TjD1DU=; b=XzaGlgMiyDg5a82gKoredYvY/AT
	zmzmBtkFI4vWcMSm54xHxSdjYWNDzbMQXTH6cRDrs7Sc1me9AlcqPxNAVXIjax6e
	thTZUix3M9Xk1yVDc2bepYSOCCWsGXs29y5OsGrR1qcgYqo9MXobmEQ0mm8wmgF3
	89qeq9DnAkDcAXcYGD1QBrKiylbEmsC9AdLhaPwzTTB+6oJqHx+usfXYwvyYWzI+
	EgQrBQiqUlj7R7zVjC9JEmaPpLEkhNY3s3RkOx9kS30n1vP19Nfn8pxjHVtgnOUI
	17oGJGUnuNDDCX9r7gpc3+RH5glL+PvxTIYTrQ+zTX8bKxO4Z358EBM1RoQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv9a969e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 02:34:01 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5992Xxww026719;
	Thu, 9 Oct 2025 02:33:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 49jvnmwgsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 02:33:59 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5992Xx9d026709;
	Thu, 9 Oct 2025 02:33:59 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (cse-cd01-lnx.qualcomm.com [10.64.75.209])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5992Xw5L026705
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 02:33:59 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id BE5EA210E9; Thu,  9 Oct 2025 10:33:57 +0800 (CST)
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
Subject: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS615 sound card
Date: Thu,  9 Oct 2025 10:33:40 +0800
Message-Id: <20251009023341.27277-2-le.qi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMiBTYWx0ZWRfX7QOA105ElUi5
 +eH/yVAiazDqgip4b31HrcVwV9GwQLFDfO6QW37xbehjF1wW2cLxW2XVJkDgAP18NofP6LttEII
 PEh+ifd2ZxHFKbMiHx46NNMxlKY8k3+5SXVX79XlSckbYfkjVK8dg7cXaGPPkhKK/DxV/S9MiFm
 ZAkDq3d/qkeVOIbL1g7sYj9pNK/aFG0UY+0lUVV1yhzlKoZz85h4V9HueaeB0WGJG2L4ofJcLLB
 jY49oTWeLeIcS9VD9crbPGFS7xV4RJsb51YVZ14jIj3gp5RHWtTDBMLMcuKn6R5ClIDO2k8I3Nx
 6nH1sVdXXWHgbtqetk5XK9Awq2d3ASsmm+z44RfO5dDtOu/L4+m4UHbZxcg7GGdU8LwAG0feMdp
 F/eN9wsRphjIzE46u1/iMy4eoilGBw==
X-Proofpoint-GUID: qwvxYE69Py2o15ax8Z4xY9tIxOnu_ytA
X-Proofpoint-ORIG-GUID: qwvxYE69Py2o15ax8Z4xY9tIxOnu_ytA
X-Authority-Analysis: v=2.4 cv=JPk2csKb c=1 sm=1 tr=0 ts=68e71f19 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=Xb5-F2_Z3AT_iZed1NoA:9 a=zgiPjhLxNE0A:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1011 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080122

Add bindings for QCS615 sound card, which looks fully
compatible with existing SM8250.

Signed-off-by: leqi <le.qi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 8ac91625dce5..b49a920af704 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,apq8096-sndcard
           - qcom,glymur-sndcard
           - qcom,qcm6490-idp-sndcard
+          - qcom,qcs615-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
           - qcom,qcs8275-sndcard
           - qcom,qcs9075-sndcard
-- 
2.34.1


