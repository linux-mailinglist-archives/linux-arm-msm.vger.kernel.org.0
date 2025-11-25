Return-Path: <linux-arm-msm+bounces-83230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ED00BC8497B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 11:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E04D334F02E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 10:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE83A313534;
	Tue, 25 Nov 2025 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C2cAxbGn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2920A16A956;
	Tue, 25 Nov 2025 10:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764068207; cv=none; b=PRxMOF0US2Q2Mi6F1t2051N9U3IfFcIapgtDBNR2OgCtcHsZa08NYyvdOVEYvfa+Rwsa8flLPxbWuB4Yig6WEy0QivRRn4hyq0JT71NyLGRYcmUpbyfNGXaCDmOwx2wNKTTBHAazzMa39CtV3aqDtjGMrbStyz9Vl+1DuhBJ79U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764068207; c=relaxed/simple;
	bh=a//Seg/IrgqejUbY8F0cKGb/VuWzJNfsZ7wYz5ZPpoo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZVNx9nw+y7u2Rcb0i8MHq/q2JczyCCcq9gF0gXPoLrMKe221cEaksNdYjdx1ANAKg6Nse/HxWhhPHtlElUhO8XWjebO6EsLnIlZjKWa8GQCw6eYAZlkl6O48SW3m5aSqEKOxro5VPuOb4tCjcJLvAb6CQapLavdrniCjdOSBbFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C2cAxbGn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9ePiq1741109;
	Tue, 25 Nov 2025 10:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=37RRWhWvxz6mmCraG+qSG55VsHuZOALnVv2
	2qCpauS0=; b=C2cAxbGnnrUJbzQ/E4MGwx1s0a80cS+5ZTWcTiEDTgillIedn53
	eBnmNiJNbkwka8kPOrNije8iM3fewdHUDY/YFWERVo7AImkzp1+X3nbS5DxECiRJ
	KBUNgIYbjKSNGwW/vjMsaVXookPfAPIyzxiySj6KGiUeI2CydmXB7789NDEENDSt
	uS6ZOJ8y7XJrZiQhFAOmAYJWm3CudKrSDHViwZ1lpJY/emRqcoskmoGGtWA7Vr4E
	s1I5sWcuruqGJDRUb5Mj1SitG11KRMyBT7QBBmYYhLKw25/WMZJwnJDQnA4KGSKK
	2eQUh3JWeMja562/Ld96kzBzCQLLMli2BFA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amtebb1xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 10:56:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5APAuSdr009130;
	Tue, 25 Nov 2025 10:56:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ak68n435q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 10:56:28 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5APAuRFf009098;
	Tue, 25 Nov 2025 10:56:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mkuntuma-hyd.qualcomm.com [10.213.97.145])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5APAuR6e009095
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 10:56:27 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4582077)
	id D1416465; Tue, 25 Nov 2025 16:26:26 +0530 (+0530)
From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com, quic_amitsi@quicinc.com
Subject: [PATCH v2 0/3] Enable mdss1 Display Port for Qualcomm lemans-ride platform
Date: Tue, 25 Nov 2025 16:26:19 +0530
Message-Id: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
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
X-Proofpoint-GUID: Rdln7rj5V51-nygwn-P2VNvBd-uIzk9o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA4OSBTYWx0ZWRfXy3Dpd9kIp2TZ
 m4XB0xm4/Yy7UB7hj8BWCZ7mlFUhDgqxQSG16vWXRYcqvRq5De2CS5dpw+9mkBkYkRxWCPGSrXB
 hG5d4lDegPWQDfF6kFVYqtFwI5nrwPZuB3YOIuMGpayx1Kqxy9XPPDSFRTatkqkTBOV+gtOAje2
 9/zoh+v+9qTknrFXF5bwRmE4Atiu2X1culMGgQFVypDUGDZRuO/ZWe4CXPU3sVDZ7AWTqtx72wy
 rwQsy579EtvtrHzPTY3GMIrUpqbzPV7YfVHY0tYFu+15Gq/DC1CLPtXFfc/9cW4fBBi+eINKmt1
 8DVtxejYFNzqnbqrFn3fjzotyIQ2GOnFKMsmxFYTv90e/GgGF8oUFKz6JT7TQLIf4TGYbKWF3Tb
 2ZDcfn/+n6xXzbDRjeC1R0912luh9w==
X-Proofpoint-ORIG-GUID: Rdln7rj5V51-nygwn-P2VNvBd-uIzk9o
X-Authority-Analysis: v=2.4 cv=d7f4CBjE c=1 sm=1 tr=0 ts=69258b5f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=kpoA4S6LcSF1uKdZkzAA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250089

This series adds the DPTX0 and DPTX1 nodes, as a part of mdss1
on Qualcomm lemans SoC. It also enables Display Port on Qualcomm
lemans-ride platform.

---
This series is dependent on below series:
https://lore.kernel.org/all/20251104114327.27842-1-riteshk@qti.qualcomm.com/

Change in v2:
- Added fixes tag for the DP driver patch [Dmitry]
- Included below patch in this series after addressing comments [Dmitry and Konrad]
  https://lore.kernel.org/all/20250925-lemans_dual-v1-1-9c371803198d@oss.qualcomm.com/
	- Removed the misleading comment: "same path used twice" [Konrad]
	- Removed unused label in 'display-controller' [Dmitry]
- Removed extra zeroes in dispcc1 node [Konrad]
- Enbaled dispcc1 by default in main dtsi file [Dmitry]
- Added EDP ref clock and updated dependency series.
- Link to v1: https://lore.kernel.org/all/20250926085956.2346179-1-quic_mkuntuma@quicinc.com/

---
Mani Chandana Ballary Kuntumalla (3):
  drm/msm/dp: Update msm_dp_controller IDs for sa8775p
  arm64: dts: qcom: lemans: add mdss1 display device nodes
  arm64: dts: qcom: lemans-ride: Enable mdss1 display Port

 .../boot/dts/qcom/lemans-ride-common.dtsi     |  80 +++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 338 +++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_display.c           |   4 +-
 3 files changed, 418 insertions(+), 4 deletions(-)

-- 
2.34.1


