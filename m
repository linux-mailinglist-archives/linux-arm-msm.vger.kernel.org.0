Return-Path: <linux-arm-msm+bounces-74760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D49B9CA0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D79318899B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9321628DB56;
	Wed, 24 Sep 2025 23:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJ9U22+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1079228E9
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757051; cv=none; b=gL9P+q75qzbYdf/vOvRzq1AusKDsBNDWogDSwqrM4soMSExNF0Pq1fijKa8VAMR3aehyiGnrq4oRxFMoNRACKpmNL/yDlATW+i5nNd54J2GOJwHVUv8eYMAgSh74bfIvprlzPS7ufF/ao+0VoQ8WQG8sZdC0HfG2aEOHUfxhx7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757051; c=relaxed/simple;
	bh=HbXyfoMuaXdOi+XNdzbbQmz+0DZCe36zPNBcfEwwZow=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X2lXzHiFWVCAaQpN23k4VD6J/NsJC9uZywEs7AhsmdRTwDBZ4jEhxFkgzLtKFOnS60CAbThQfDfEnogrc2gadvNVpt3123/3J15MQLxQKitkZJ/edC7ZjryaGixAmifKQZihumqsLzdVznTamF+WoP4qy4HHIloRggvol2XIfhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJ9U22+E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD5hpi029706
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yHPnfqqswUUOj8uDWMMqRL
	Rxv62OlWni7Al2oR+xh1g=; b=nJ9U22+EBEjBt5FnLJSVbCjTzFuYd1hsPFwcvc
	Od7+l4xrwKwHSnV+uQNOs8C2WhgphBplDHr1pA6F4MYSkc0Q7qZ4n9C6nzoilrFG
	dBwR/3hUwIP2WY9J6ZtDC7/tIoXEZV3Sb6JJckS1sw75Nrnet9I3T4YliVt2T3NS
	eNy9UPVUh4LB9Q1maIdx+2z2lcuY274xxqi1y0EEVWI20baykPQG8lEq8PyfvFQQ
	v3HIxO+FVrUSKely6veAEtaLiEgS/caqW918G/4tPytFuam5kKPUpLc5296URTSh
	/XtaWrHVjFGDiaaD3RqATmoZGRt2QtscZbR7JDpNHwfk2Dmg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fnx9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:37:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32ee157b9c9so321607a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757048; x=1759361848;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHPnfqqswUUOj8uDWMMqRLRxv62OlWni7Al2oR+xh1g=;
        b=Oehkas5LAamzClSREHW3HzJ6VDZ0oykd3k9lSvZY80RVXbD/S/kVMwS2Rj5n9E4EUo
         vX+TDV9uloQaZzIv+ZibxNlQXYGSImUfiMksZY6SiBlTWkJbkyl0cYmzHdHWeGTGCfJI
         tEXwcpC7NZs0UJbOQB89tBQbosX//vuPfL3UP+jCF2vp9Ph1JxnIDDEEgUKvKBdtJo7E
         WMoMy1HcPa5A/fxntzQp/2Dzei4EHKL65sXaPAHY1bAb2dyJzHBZGnfg52E+Yyuu8LRn
         ImaBx5WS4qAv2zAZ/N0wSVRXaCvUC5hXIN0GJzYHYpQcYluzFlgmCp6cGXp2G7DZVt5o
         vn9w==
X-Gm-Message-State: AOJu0YwzK6eptwoFcwZLhd3VFYBTMYxJnD9IZ06Ye3fYhiPioy60ru8U
	elLbQ810v232WULhD1y+oVoTlEgVfbenCo6jGYbotjd9NtJihB2r2F2RECSPOsB5MadtBg4VbMq
	HcfFhz/rFC/ByKCjxSCSAiCFH0zezm12n9ozc9roWUf1GwHp5vw8VkmZSrDx2lO6yQbvw
X-Gm-Gg: ASbGncv8hj1/HyUnCA1uD2RQWOy9p0k7Y/TVzkseXWGr73xlv3q4Oue4gElNDK3G2GQ
	YETHDFkt0CKmcZ2FRvm3ZECfKj8VMvS743jOhax0qaZkfmcvUohiC6Xk1lFlnuamd0sQWpsO6ZA
	okJc1+QcTA31b2DFcGpcpzsERSai4l4fTNIjamg+UU73v3r656NvthCm6sLF0oJFFocIUmxVlhl
	mfX38wAB5hQYA0JL1Qy/ay8HRlU3sPVUXT+XDnotDpAIbixbiUX8gCg3d2xhXDBMDcSQyN/yr8N
	m72gZ/nMjLRJMNd6s0yDMOQrglgkbC7dhPte8rQM6uxJrdkL1RDNCzUxsqg2liC/gknZbcCwfDI
	mBxNErySUHndN6pg=
X-Received: by 2002:a17:90b:4f8e:b0:32e:7270:94a4 with SMTP id 98e67ed59e1d1-3342a22f5c5mr1258190a91.14.1758757048419;
        Wed, 24 Sep 2025 16:37:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu1fGpjzdi1GVnmxxWp5bhgd/H2916Z+w4tQ6cpsammJ90qXtBWMYWR89G7rEEpNT2kZSv+A==
X-Received: by 2002:a17:90b:4f8e:b0:32e:7270:94a4 with SMTP id 98e67ed59e1d1-3342a22f5c5mr1258164a91.14.1758757047916;
        Wed, 24 Sep 2025 16:37:27 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d73550sm227187a91.3.2025.09.24.16.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:37:27 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/6] Add initial remoteproc support for Kaanapali SoC
Date: Wed, 24 Sep 2025 16:37:21 -0700
Message-Id: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALGA1GgC/x3MwQqDMAyA4VeRnBdoS2W6Vxk7xC6bYdiWRGQgv
 vs6j9/h/3cwVmGDW7eD8iYmJTf4SwdppvxmlGczBBd6N/orfnJF5aWsXLUkjBRS9HFw4xCgRVX
 5Jd9zeH80T2SMk1JO83+zkK2scBw/UJVrNnkAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757046; l=1727;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=HbXyfoMuaXdOi+XNdzbbQmz+0DZCe36zPNBcfEwwZow=;
 b=yTmROiAJGXM4/BM+N3MM+1kh85JsfNcQcrpuH20R/3Mgwdhq/fituUy1FsGbKULrP1cNxY6r4
 LHfRxxXWzRFClPnl3LAbm505O2QVF/ZfGwPwHhTCC5CGMNUStmQhojk
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: G-XHsCGADfBb0lifwyRVRZxcBIpCw-rA
X-Proofpoint-GUID: G-XHsCGADfBb0lifwyRVRZxcBIpCw-rA
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d480b9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=YhI_PNPeQObCTaMrVkIA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX9hnlLDFtdFFG
 GmSa4hSAHnvP8iX/9An6yrPlXrv8nS6RT3qXvTBZrosxud5F+j1ulIKBCq9ycZwVkTm7N1OBIjE
 6mUw1qPMKt9e5pODpceWeZ9Zhd60UQuLGhrd2qfkI2KvKs51/pIytyXom9upbnBp2Sy8M/Y6aGk
 i/6Wvz5JU2qxtyIU7uKUFxhC9gz1Fwtx78noGVcfioewsOzmD/rH9GdOkf9lnGO2NPPvLl+vBtC
 hvnVtzH/V/v8OGc0fUPrMtdsM09UF4B6LYb6EHNfk72YWTcr4eQ9S3vpwELtZssOIVq6MIk5Zqc
 I7MO0y7K/cIEZu+VoORVyzvlcHpfS67UNbCbdpX1IudJLV8e0KsZv2yaru7xH/LYcBs8cyDLliJ
 V4ASNKEW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

Add initial support for remoteprocs including ADSP, CDSP and MPSS on
Qualcomm Kaanapali platform which are compatible with ealier Platforms
with minor difference. And add initial support for SoC Control Processor
(SoCCP) which is loaded by  bootloader. PAS loader will check the state
of the subsystem, and set the status "attached" if ping the subsystem
successfully.

patch 5 depend on smp2p patch series:
https://lore.kernel.org/all/20250923-smp2p-v1-0-2c045af73dac@oss.qualcomm.com/

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Gokul krishna Krishnakumar (1):
      remoteproc: qcom: pas: Add late attach support for subsystems

Jingyi Wang (5):
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali ADSP
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali CDSP
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali MPSS
      dt-bindings: remoteproc: qcom,pas: Document pas for Kaanapali SoCCP
      remoteproc: qcom_q6v5_pas: Add SoCCP node on Kaanapali

 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 174 +++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |  30 +++-
 drivers/remoteproc/qcom_q6v5.c                     |  89 ++++++++++-
 drivers/remoteproc/qcom_q6v5.h                     |  14 +-
 drivers/remoteproc/qcom_q6v5_adsp.c                |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 |  79 +++++++++-
 7 files changed, 384 insertions(+), 6 deletions(-)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-remoteproc-4a2c41480982

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


