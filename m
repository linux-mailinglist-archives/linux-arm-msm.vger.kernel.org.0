Return-Path: <linux-arm-msm+bounces-21549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D73828FAA72
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 08:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17143B23953
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 06:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D6C13D2A5;
	Tue,  4 Jun 2024 06:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FOuVYTS9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5421B137925;
	Tue,  4 Jun 2024 06:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717481243; cv=none; b=QuXCTRZNF3gHg9Q3Yk2FEyZ8zoqAII2zRuudhV4t6xH8bjkjABtpnzdgGraU0AXBNgbGWVtcebTn1msGsK0SwF3C5U9PXo3y1PjdSJaPRj5vb0NGzRKleRJh/eHgtkAppQDhUtHGUWKSFSLHz1Zp83NzOW2LAlCIFY5oz2kJkWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717481243; c=relaxed/simple;
	bh=bGxbFudr6f6HDR8LGya9+QShQZordiD2i5+HgWNoqMc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AeRIGWt/uPFDHo8YnZZn9otuhujhKpUByVk5gZZoNkygj3HoqnZja7UQlHe4fkCl16iaXZJKAmxw7oZ7qIU8YN9VQ+wQQS2SDt94xyRR4ff3kjkHdFxWJDrKeBHOrnUlG6XPWbiLVH2xsMvdwx6ApdN51DYSRLGixyoG+e4MPPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FOuVYTS9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453MFf33008539;
	Tue, 4 Jun 2024 06:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XoZRczkcWRC3zU8aJpzdGz
	Niy9PsfBfJ5zKJJt74Hm4=; b=FOuVYTS9sIuCQr2RWrDAwd7Yrn9lvPVqjtFuGd
	jZ8Dh+hMsYu65cd9aPfbE0o/ff7R4RxQCLSwF1c8GxYbMmu7o7ZpxDzDzozQ9ReF
	cLH9NKrJ+TRj8VHuW1nMoYB/v+kb9cnZTDBYb6SOUZa2uFMvC3Hkx2bey2FMChJ2
	OjQYG95Dlwgqnr5gCcw1ckA8g+hkNLcFRypBlSvm2whw6MK/hmI2TVDj+ewHBSVA
	44TuJ/gBtKeLQdFxvGFiKnud8N0IAjx5BhPHKgp1JavO7jK0yC4VD8WwcE4tgmby
	jBn7l7iBz4b/8oW7y97ZxlE1JnhrG/iHIXaDC3tveGrer/Ig==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5kp342-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 06:07:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 45467DLr003134
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 06:07:13 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Jun 2024 23:07:08 -0700
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke
	<mka@chromium.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH v2 0/2] Disable SS instances in park mode for SC7180/ SC7280
Date: Tue, 4 Jun 2024 11:36:57 +0530
Message-ID: <20240604060659.1449278-1-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9MHZLtJmlE5fn0JG7tPiqVo8yKYs8Z0P
X-Proofpoint-ORIG-GUID: 9MHZLtJmlE5fn0JG7tPiqVo8yKYs8Z0P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_02,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 mlxlogscore=504 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040048

When working in host mode, in certain conditions, when the USB
host controller is stressed, there is a HC died warning that comes up.
Fix this up by disabling SS instances in park mode for SC7280 and SC7180.

It is recommended to set this quirk for all Gen-1 SoCs. Will identify the
other SoCs and push a separate series for the same.

Changes in v2:
Updated commit text to include error message as well.
Minor other nits in commit text fixed.

Link to v1:
https://lore.kernel.org/all/20240530082556.2960148-1-quic_kriskura@quicinc.com/

Krishna Kurapati (2):
  arm64: dts: qcom: sc7180: Disable SuperSpeed instances in park mode
  arm64: dts: qcom: sc7280: Disable SuperSpeed instances in park mode

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
 2 files changed, 2 insertions(+)

-- 
2.34.1


