Return-Path: <linux-arm-msm+bounces-31567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF4D97625E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 09:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9A811F24C07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 07:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9C218BC05;
	Thu, 12 Sep 2024 07:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ebGr2VNR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4DF188906;
	Thu, 12 Sep 2024 07:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726125318; cv=none; b=RS8zBEfdkgcDiJBBXe4FeehJssRsh12rNRaC9XbgZm/WYhaM5GDKXZnlqFjbXU2QRgsdKGUwFa4Dbo9fvZOqyj200bWy4r0rVgjnIA+pWtvcTj2baT5fIlyJsPEaoaNOA9T3geAlHeSMsNONYGAO+wWtCsKIE4B0Nei+0iOjlaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726125318; c=relaxed/simple;
	bh=3v2vCCllcM8vJvg22T5gtMXJGc6AOicHbI9zwAwEQug=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cyXQt8RnVv9/96zzIoHMiIgRvgGLsXCdZPGd/62fzcwTmNoouMqPuIBBl+LtzVTz+y9xjLtavi4dn8xC3AfaRW+JOxpYMxt/2hzLj+AO0b8HplIyhYEmstp4UvdzBtAZWkwRh8dgmKI0kB3fANCKnPgWxii+KozsX+YLfg5Y8C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ebGr2VNR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C2L8Pd006676;
	Thu, 12 Sep 2024 07:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZxJ7NCNW1Cz6xqRyaiFTCUzzAiDVE4S9pdA
	P/UhJqn0=; b=ebGr2VNR3qSSm2rwiXtjD4yUmGf8u/BKgZzqm9PGcLtKOA/KiMO
	4iuqZPe0waC52XMUcmYLmUA/AaX/m1jB4rHGIh6quQTKp0Z51VBGehd7NxaQ++yh
	c+xueyMpn1TWCcRCb9QvNp6iHivCtpCiOeN84d2skgUGkVrJD//lAMH62sw194gA
	7yDrz8xCzW1JR4USeaOQthnEQwBFITxL2hRxegb0oEvU7YRxgr2tpeKWfRv42UU3
	hJnEiCheTeCI4SCdhKZ0FBsdTFlG3T3W0rXwo7TT51w9Axl6ab49CYGPzk9oL4jf
	o1cBeqHTWh9KcjV4VurLx3a/2m/nqCyU1uw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6pc6rp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 07:15:00 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48C7Ete3000425;
	Thu, 12 Sep 2024 07:14:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41h168ypm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 07:14:55 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48C7Et8j000397;
	Thu, 12 Sep 2024 07:14:55 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mahap-hyd.qualcomm.com [10.213.96.84])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 48C7Esms000393
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 07:14:55 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2365311)
	id 5B8AFADB; Thu, 12 Sep 2024 12:44:53 +0530 (+0530)
From: Mahadevan <quic_mahap@quicinc.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, swboyd@chromium.org, konrad.dybcio@linaro.org,
        danila@jiaxyga.com, bigfoot@classfun.cn, neil.armstrong@linaro.org,
        mailingradian@gmail.com, quic_jesszhan@quicinc.com,
        andersson@kernel.org
Cc: Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com,
        quic_vpolimer@quicinc.com
Subject: [PATCH 0/5] Add display support for Qualcomm SA8775P platform
Date: Thu, 12 Sep 2024 12:44:32 +0530
Message-Id: <20240912071437.1708969-1-quic_mahap@quicinc.com>
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
X-Proofpoint-ORIG-GUID: ejgitIFGMrpN6cBJ8c37Bzd_qi-zwMkB
X-Proofpoint-GUID: ejgitIFGMrpN6cBJ8c37Bzd_qi-zwMkB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=868 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120049

Add support for mdss and dpu driver on Qualcomm SA8775P platform.

---
This series depends on following series:
https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
---

Mahadevan (5):
  dt-bindings: display/msm: Document MDSS on SA8775P
  dt-bindings: display/msm: Document the DPU for SA8775P
  drm/msm: mdss: Add SA8775P support
  drm/msm/dpu: Add SA8775P support
  arm64: dts: qcom: sa8775p: add display dt nodes

 .../display/msm/qcom,sa8775p-dpu.yaml         | 120 +++++
 .../display/msm/qcom,sa8775p-mdss.yaml        | 225 ++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         |  85 +++
 .../msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h   | 485 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
 drivers/gpu/drm/msm/msm_mdss.c                |  10 +
 8 files changed, 931 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h

-- 
2.34.1


