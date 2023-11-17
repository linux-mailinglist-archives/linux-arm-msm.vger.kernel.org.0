Return-Path: <linux-arm-msm+bounces-851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B8F7EED1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 09:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8393F1F24CDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 08:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24718D529;
	Fri, 17 Nov 2023 08:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bamR1pYY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2C2C4;
	Fri, 17 Nov 2023 00:07:46 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH7MdIX028435;
	Fri, 17 Nov 2023 08:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=ITIDxKaImMiWRxUXX82mP+iiZVZ+GOXSbcadpwtnJ6U=;
 b=bamR1pYYESV23KyPMAbJ8Xx9WmTD6EmBh1hhZFExwh+lPsb3lFKRHK2TGZ/k6MZzUO4R
 AfayYNGI1dsOl6J1PFXELGLzHcdhLu6wPE20DpZq2vCG81S6Ha7LwRzG7tkG8NburDeq
 +xp4srylEGD57W9z/rMepwaEtzEvhrNvxP44n7dxT0W2blJ9w8oXigLUWaM5n8R5tmHw
 5Hi1v3ElIfeCcxwcXkfV5W2/KxC+eoeMirDgQhkrzGpleXdwm6MI1r4vMG/A9tfzYHjm
 PLTrCtpLHQjURF7lHdXy5quP8nVZgVffacp8V36Bn+Vm6vlfjFbdD2ysus3OKCjdvKjP JA== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udxs38mer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 08:07:43 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AH87d9W025916;
	Fri, 17 Nov 2023 08:07:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3ua2pmpnx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 08:07:39 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AH87drn025903;
	Fri, 17 Nov 2023 08:07:39 GMT
Received: from hu-devc-hyd-u20-c-new.qualcomm.com (hu-rohiagar-hyd.qualcomm.com [10.147.246.70])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3AH87ciH025901
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 08:07:39 +0000
Received: by hu-devc-hyd-u20-c-new.qualcomm.com (Postfix, from userid 3970568)
	id 461C32204F; Fri, 17 Nov 2023 13:37:38 +0530 (+0530)
From: Rohit Agarwal <quic_rohiagar@quicinc.com>
To: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rohit Agarwal <quic_rohiagar@quicinc.com>
Subject: [PATCH v5 0/3] Add devicetree support of Interconnects and USB for SDX75
Date: Fri, 17 Nov 2023 13:37:34 +0530
Message-Id: <20231117080737.606687-1-quic_rohiagar@quicinc.com>
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
X-Proofpoint-GUID: ZnE04oMll-cs8e6q-4PCt433Z_zs9ce4
X-Proofpoint-ORIG-GUID: ZnE04oMll-cs8e6q-4PCt433Z_zs9ce4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_06,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1011 mlxlogscore=409 mlxscore=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170058

Hi,

Changes in v5:
 - Rebased on 6.7-rc1.
 - Collected the Ack tag.

Changes in v4:
 - Reordered the interconnect to keep it in sorted order in patch 1/3.

Changes in v3:
 - Using macro QCOM_ICC_TAG_ALWAYS instead of 0 in interconnects properties.
 - Collected reviewed by tag.

Changes in v2:
 - Updated the commit subject of patch 2/3.

This series adds devicetree nodes to support interconnects and usb for sdx75.
This is based on previously sent driver series[1], [2].

[1] https://lore.kernel.org/all/1694614256-24109-1-git-send-email-quic_rohiagar@quicinc.com/
[2] https://lore.kernel.org/all/1695359525-4548-1-git-send-email-quic_rohiagar@quicinc.com/

Thanks,
Rohit.

Rohit Agarwal (3):
  arm64: dts: qcom: Add interconnect nodes for SDX75
  arm64: dts: qcom: Add USB3 and PHY support on SDX75
  arm64: dts: qcom: sdx75-idp: Enable USB3 and PHY support

 arch/arm64/boot/dts/qcom/sdx75-idp.dts |  29 +++++
 arch/arm64/boot/dts/qcom/sdx75.dtsi    | 170 +++++++++++++++++++++++++
 2 files changed, 199 insertions(+)

-- 
2.25.1


