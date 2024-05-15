Return-Path: <linux-arm-msm+bounces-19882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE9E8C662B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 14:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38627B20EB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 12:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498EC7CF34;
	Wed, 15 May 2024 12:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CA89P5O5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2487317C;
	Wed, 15 May 2024 12:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715775045; cv=none; b=lU8vgs0s/BaP/r9EA6ZB+6XBEZ69jmwvjxZCMZ5gKiKLP1s+Is5rkmWnqDca2pSifSRONxEdMpTm5NyViK5w0YIDEBr1XFfEZYJEZz0GU26QSAs/8gMJihUm2l8uiDSwv+n0NXi0o124xsLKBG8Nzf5r2Lt2tapO34YngMyN/DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715775045; c=relaxed/simple;
	bh=pJqvjsgCvNBkKyzYsgEoP0V2lPFJZrSdd7i0P9EDSt0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ir8mfexq85VfUWvs/yW94H4fwEg+l2/qBHkfnedKJMDRBDZyjUQkaLXYKFi1Ov04uy4tIQBkkume+SxiOK3D/N1mTgz6drCsNTjG8jbv52oJCH2H5rW4GiwUTsY7B69AMEUmVj32fh7hRQz44rKplKrjommjJmHCoNCRm/RP9mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CA89P5O5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44F90XOe007493;
	Wed, 15 May 2024 12:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=xEF+xDSBfTCHhiYaODH9Zu9Pp0jwfoPRn50l2ESd8fA=; b=CA
	89P5O5VHLBw8cJIdFacZ8WKVzv/BafF9cPRBAambzhOPSUa6nc1o4r/SKE5FdiHf
	rZggD+q5bAkEg9ekLX8eRBWeIQhckzQRCnGVvDraHX9uwrvhnKMAjJiBIp5HkCMS
	/mnh/c//ZXL3Xr34IonKNTb/ahVFExaI+Xd02thFTqVoD8ZWezVmP1kfafStKQBL
	F94jtpAOki3+HcEG9/isL2WFjN/Bxs7BZEqP9G/4kn5HITyGL9F5h1zh6mH66H4z
	BySjJWo91WrWZLaE7Meqe+y3s0HJ/mXhVkn+JO+OzC9imGtGCSPgluDnCCr16bEg
	/n9H7kjiIqYVb0w/nx4A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y47f42q7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 12:10:27 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44FCAO2G022765
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 12:10:24 GMT
Received: from hyd-e160-a01-3-01.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 05:10:20 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <ulf.hansson@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <bhupesh.sharma@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Naina Mehta
	<quic_nainmeht@quicinc.com>
Subject: [PATCH 0/3] Add SDHCI support for SDX75 SoC
Date: Wed, 15 May 2024 17:39:55 +0530
Message-ID: <20240515120958.32032-1-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9pyKq2YjbFl6FZBU8xxNWWVMCLdjkkXm
X-Proofpoint-ORIG-GUID: 9pyKq2YjbFl6FZBU8xxNWWVMCLdjkkXm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_06,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 bulkscore=0 clxscore=1011 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxlogscore=873
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150084

Add SDHC instance for supporting SD card on SDX75 SoC.

Naina Mehta (3):
  dt-bindings: mmc: sdhci-msm: Document the SDX75 compatible
  arm64: dts: qcom: sdx75: Add SDHCI node
  arm64: dts: qcom: sdx75-idp: add SDHCI for SD Card

 .../devicetree/bindings/mmc/sdhci-msm.yaml    |  1 +
 arch/arm64/boot/dts/qcom/sdx75-idp.dts        | 45 ++++++++++
 arch/arm64/boot/dts/qcom/sdx75.dtsi           | 89 +++++++++++++++++++
 3 files changed, 135 insertions(+)

--
2.17.1


