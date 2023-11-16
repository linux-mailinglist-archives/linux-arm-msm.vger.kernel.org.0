Return-Path: <linux-arm-msm+bounces-774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFFC7EDDB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 10:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9544D281040
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 09:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51E528E0A;
	Thu, 16 Nov 2023 09:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WGeYg6Rg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E081B2;
	Thu, 16 Nov 2023 01:35:46 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AG2LsOm018760;
	Thu, 16 Nov 2023 09:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=ji2aruV2fK/7GKyIMJTR5DS42OxRi10WnpQFHX80cvQ=;
 b=WGeYg6RgDVs8iyI54jG28nJ7eTtIBdq6UQmUXrxQ3YhhAsebG53mXJBlHiFE7LdmcJAC
 KViu+QByKln2ZUYPfCaTHR6Ht2hu0SA0e8IoOZhBB+tVbf+Vy9keGgeH/XmiKmpmQ4mq
 lHKrKjAqc7KirE4vD4nG50/3UShtXQsyjCz8WrZoPEvCTY+5nUV37MIofQYC8EWDgBwP
 gTY0QoDDNDB/GHW1soz6bxU/K+VXU1wiHzJbxyGNx//FJbWDnco0MO3QrVWqMjrLEdby
 bd4p32mw6SWNrPjjTmyjGzK32apWIJ4FjDLFN5yf7LEgV2r/79X0KL7PZNvmUoDVJJzn JQ== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ucuac2wsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 09:35:24 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AG9ZJrs029200;
	Thu, 16 Nov 2023 09:35:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3ua2pmgd82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 09:35:19 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AG9ZJZL029186;
	Thu, 16 Nov 2023 09:35:19 GMT
Received: from hu-devc-hyd-u20-c-new.qualcomm.com (hu-rohiagar-hyd.qualcomm.com [10.147.246.70])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3AG9ZIvB029172
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 09:35:19 +0000
Received: by hu-devc-hyd-u20-c-new.qualcomm.com (Postfix, from userid 3970568)
	id 9BE7D220C3; Thu, 16 Nov 2023 15:05:17 +0530 (+0530)
From: Rohit Agarwal <quic_rohiagar@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com,
        geert+renesas@glider.be, konrad.dybcio@linaro.org, arnd@arndb.de,
        krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        m.szyprowski@samsung.com, u-kumar1@ti.com, peng.fan@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@quicinc.com,
        Rohit Agarwal <quic_rohiagar@quicinc.com>
Subject: [PATCH v2 0/3] Enable configs required to boot SDX75
Date: Thu, 16 Nov 2023 15:05:10 +0530
Message-Id: <20231116093513.14259-1-quic_rohiagar@quicinc.com>
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
X-Proofpoint-ORIG-GUID: NCdeT_Etwg5Fo5lMO6EsnxTo8d9lxrok
X-Proofpoint-GUID: NCdeT_Etwg5Fo5lMO6EsnxTo8d9lxrok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_07,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=386
 spamscore=0 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311160076

Hi,

Changes in v2:
 - Updated the commit message for the patches.

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


