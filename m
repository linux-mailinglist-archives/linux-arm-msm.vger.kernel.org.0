Return-Path: <linux-arm-msm+bounces-757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1453C7EDB13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 06:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FDFC1C209DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 05:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F77C8E7;
	Thu, 16 Nov 2023 05:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mdbroBl2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8066919D;
	Wed, 15 Nov 2023 21:14:52 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AG4GGxv024428;
	Thu, 16 Nov 2023 05:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=NUHMr9J3BC7DOHJPpsAkaV77crTZzWD0PtrdKPemPOo=;
 b=mdbroBl2oifyjz2Nd8kB+XUPfmKe08fTL5qXimAa0Br91SdEC4n/drDzQ5WdoDSd+262
 L6jMmECzcovwM6rPhI8SjUjaEuSMizyusszIuVK7OctkwO8M30j+PO7SnQvlGNACR+CR
 dhPvBCQBEtMIHaFGRitKSYG/ZRzt5Vp+CctpBmYG2H9ANalTpbfEPJF/k7LmV5L1XmRA
 jHHS25bndJl7PecbFrFCc1WDgPA2RIRHyXD0KHZC/4iD0/A+U4N3zoaMyE83fjAoXfVi
 SRvFvzMzzsINB3pC5icc2O6zi/D1y0ok0jKwnq7KcsTYHkL6pSETCCgZTrrH8VMUDfpQ lw== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ucq5fau66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 05:14:27 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AG5EOmK004930;
	Thu, 16 Nov 2023 05:14:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ua2pkk618-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 05:14:24 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AG5EN08004914;
	Thu, 16 Nov 2023 05:14:23 GMT
Received: from hu-devc-hyd-u20-c-new.qualcomm.com (hu-rohiagar-hyd.qualcomm.com [10.147.246.70])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3AG5ENZW004911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 05:14:23 +0000
Received: by hu-devc-hyd-u20-c-new.qualcomm.com (Postfix, from userid 3970568)
	id 38B0022070; Thu, 16 Nov 2023 10:44:22 +0530 (+0530)
From: Rohit Agarwal <quic_rohiagar@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com,
        geert+renesas@glider.be, konrad.dybcio@linaro.org, arnd@arndb.de,
        krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        m.szyprowski@samsung.com, u-kumar1@ti.com, peng.fan@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@quicinc.com,
        Rohit Agarwal <quic_rohiagar@quicinc.com>
Subject: [PATCH 0/3] Enable configs required to boot SDX75
Date: Thu, 16 Nov 2023 10:43:58 +0530
Message-Id: <20231116051401.4112494-1-quic_rohiagar@quicinc.com>
X-Mailer: git-send-email 2.25.1
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
X-Proofpoint-GUID: jyElp1vsztzRKz2wJwHns79n0DK9-rzY
X-Proofpoint-ORIG-GUID: jyElp1vsztzRKz2wJwHns79n0DK9-rzY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_02,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 clxscore=1011 impostorscore=0 mlxlogscore=307
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311160038

Hi,

This series adds configs related to GCC, Pinctrl and Interconnect
that lets enable these frameworks for Qualcomm's SDX75 SoC to boot
to shell.

Thanks,
Rohit.

Rohit Agarwal (3):
  arm64: defconfig: Enable GCC for SDX75
  arm64: defconfig: Enable pinctrl for SDX75
  arm64: defconfig: Enable Interconnect for SDX75

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.25.1


