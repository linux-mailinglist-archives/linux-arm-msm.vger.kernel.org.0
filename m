Return-Path: <linux-arm-msm+bounces-76570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1210DBC82CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CE66F4E8712
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5448F2D47FA;
	Thu,  9 Oct 2025 09:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFjIDM5p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FCC2D3A96;
	Thu,  9 Oct 2025 09:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760000801; cv=none; b=JOW31fpmW6rZVOoPkCqOfG9VoVqpjOyzYD7fhMDVZ7MCKaokeJ5isMLMuFL3ur3w4MjAUiEtQ9siNK3edGT4Fg5jYGPSb+oA2sp1JXRK0TTho/SIFJstAVX193CFoE/cZi85Q1pis7qkvOXXb9o8B4j2+0Dh/HYb3YLcQnHyoag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760000801; c=relaxed/simple;
	bh=QPGaCkUwa95NG/UBmjFJVOWDEjL/TosRXyHH/njVueM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j5gLJ4Gi7RG4HWUWJTZubuoL4217j4eChK1TYkAoHJqRT8BBW/Ov81vxWfOH1RSj+5YUAdmg1ERWOIJqLkZhZoURO6hTGnNcUVQt9SFjdSnm0qNg+GcCWlcGBApV1yHE1CKbqRfWa6o7VMAqM0qHHGbvWkY583YGztBzDBG/Jno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFjIDM5p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EJAh023279;
	Thu, 9 Oct 2025 09:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jWYF1xdKVcBY6vx9aFokm2OGkmdNNVvW0M9
	Z2ExOgqs=; b=KFjIDM5pOP3U4sV6hwQWnlKPjlWPfsGc+xkBetKEFtpNdrdq/sY
	J6sTYQW2vNeLUXm71RArzyWZp6z7Rckiy1WTIbuqdfJo7gClcbr+pIyf3BpBOUqM
	h1w1/f+i3v1/lYQcGGnBwQIZ7cs8hb3GxLukjCcnXaJpfJ1Cb14BvBpmTQQ1mhO8
	QaaJe046dqX5K7QkLo9r2s5PvDRCJKZdhaxonO51m7PCv40jDQi5FBxNon1UVxux
	upxww1MJ2PV7yNiX1JUk4r8SxTf41ygYXrWyFqJTNkEiBxqD+FSky9D6Z4y3417U
	P0EtzV06F121Zw3PomHFNnB9KqWTte20IIg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m26ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 09:06:29 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59996R6m007044;
	Thu, 9 Oct 2025 09:06:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 49jvnmykbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 09:06:27 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59996RTo007039;
	Thu, 9 Oct 2025 09:06:27 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (cse-cd01-lnx.qualcomm.com [10.64.75.209])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 59996Qnu007038
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 09:06:27 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id A493D21860; Thu,  9 Oct 2025 17:06:25 +0800 (CST)
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
Subject: [PATCH v2 0/2] ASoC: Add QCS615 sound card support
Date: Thu,  9 Oct 2025 17:06:17 +0800
Message-Id: <20251009090619.1097388-1-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX2EcwbTmDDeUV
 3naBOcZ2xyJvo8KdYgLe4OsCnowLF3vPLDRj4rluRmAnTcjXX5Oj/qYwnOGHRLSmFcbbtcv0+mn
 Koq3EqiIvIAKK516NZjQMt6//FVMIDZlCfn2O5NLrXnRpZH78BhRAC1aKolkCf0Nu9pzeeyI2+P
 4ozU+1nHqcLxSYWaE3+LVxxWMV8Z/iPDcNSVO0mvD3WdMHyk4ajJ/sI9CePtXDzg1zh6O29/nnJ
 rrJjYTra0eC2fDU2y6A4CuxW71H3YFtXq/zSi2NtACguzHsBLMohoVm12fxBSDWYHF/KLd6b+dP
 HHaftc3Dz7pygqhwckaOTm5SDvWnE/lmFbV33WqTyjs+DUPY/PE4YBM01AKQtSz2XcSwggzlUWr
 ConXEFIsGZftt4sk7CbAtyQVgDIduQ==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e77b16 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=-LUE9sMnR5qqSz9F25gA:9 a=zgiPjhLxNE0A:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: mHAS_DxHSjDGdlYH3TwdkSJWMbRaZYZf
X-Proofpoint-ORIG-GUID: mHAS_DxHSjDGdlYH3TwdkSJWMbRaZYZf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

This patch series adds support for the QCS615 sound card:
- Updates device tree bindings for SM8250 to include QCS615.
- Adds QCS615 support in the SC8280XP ASoC driver.

---

Changes in v2:
 - Updated Author/Signed-off-by to use "Le Qi" consistently

Le Qi (2):
  ASoC: dt-bindings: qcom,sm8250: Add QCS615 sound card
  ASoC: qcom: sc8280xp: Add support for QCS615

 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 sound/soc/qcom/sc8280xp.c                                | 1 +
 2 files changed, 2 insertions(+)


base-commit: 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
-- 
2.34.1


