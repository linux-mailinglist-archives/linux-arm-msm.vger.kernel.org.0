Return-Path: <linux-arm-msm+bounces-31004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFA296E17F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 20:06:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA69A28303D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 18:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3029D172760;
	Thu,  5 Sep 2024 18:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fN1m8IJ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75441C2E;
	Thu,  5 Sep 2024 18:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725559595; cv=none; b=EtbpZ57u2JdifRnXXPNy/gBJobmWOvKmw+Yc4cjqcRj9/RtoGcBeuQq+5p8DMdnSVZIz4cPrSvKiaxQqvkLFWLoxOh2tlaMVVfh+YSC8CiuXkXBqX8qXL/gM6dGVfTAvvBkGEsO9BU55Aykax+57qRC6XBovlJKRW9v+MVEdLGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725559595; c=relaxed/simple;
	bh=3oEzgN+dyaaIsu2U/WHl2Pv34y+McqVjSPxZyvbVgk0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ep/j27NRSb6AOfDkXRPu4/Ppz9pQ3DnuhVj5v3SfzhD7jYgh3nVeG5GpFsQFXsHZOMQgbIn3KGQlk2TayKg+JOMqBSSJ31cis2u5MKVmAQQ29hC4of8ABNEDvBQvQHLlNSVIC2kODj9IE7zZEKhn97Nt5qzdnqokA7WEaR5QRsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fN1m8IJ7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485973mi016135;
	Thu, 5 Sep 2024 18:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B+/sMp0kcLMp95ORzvfWS1
	UqCl9q+KWtHsX5fROP7fQ=; b=fN1m8IJ7FQUD+7IW8al6/TLKUR2AF2MsGEQVNW
	CFHiZJJyQVwvriXhplNUG26VUoGgbc6XvIUPHHkX+okY2ET9cxma/fTsVBfqJng2
	DNkNjwU1HB5WR8fd8W/s2rdpVkoXT93yZVg/FcXg9nCsWa7M4qTE2KPuWwshdAjR
	KS6i0MXdOPBmtJ+jWZkP1x9eZdl3uLc3sVYVhw48gNpxSrm+AXFiQlW2OZdgQo7M
	xF8KjyXwPHFAHIUqKNsfHdRvHBnkq7+Av+26OPhbiaV24aOcuQtfGLuW/8vty3vS
	RBh4ezJW8/McvF5ipooLrpEGHv7oCqiv2rDLF/WYa4qC7XDg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41egmrnbew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 18:06:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485I6Tw3013117
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 18:06:29 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Sep 2024 11:06:26 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>, Nikunj Kela <quic_nkela@quicinc.com>
Subject: [PATCH v3 0/2] Add support for Qualcomm SA8255p SoC
Date: Thu, 5 Sep 2024 11:05:54 -0700
Message-ID: <20240905180556.3737896-1-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: he0LnfuIpGFght9jSg9yjfPK14BiMD5g
X-Proofpoint-ORIG-GUID: he0LnfuIpGFght9jSg9yjfPK14BiMD5g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_12,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=598 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050134

This series adds support for Qualcomm SA8255p SoC.

These patches were originally sent with other patches in series[1], 
which was advised to be split per subsystem basis.

[1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/

---
Changes in v3:
	- Removed the patches from original series
Changes in v2:
	- Added Reviewed-by tag

Nikunj Kela (2):
  dt-bindings: arm: qcom: add the SoC ID for SA8255P
  soc: qcom: socinfo: add support for SA8255P

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)


base-commit: ad40aff1edffeccc412cde93894196dca7bc739e
-- 
2.34.1


