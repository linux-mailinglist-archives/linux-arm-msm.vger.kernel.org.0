Return-Path: <linux-arm-msm+bounces-25292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2270A927A21
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 17:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C156E1F27337
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 15:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35331B14FD;
	Thu,  4 Jul 2024 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kBYzZgdx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EDF1B14F2;
	Thu,  4 Jul 2024 15:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720107029; cv=none; b=tI2fY/eeR85gjlu8CxpHfoBj58i6AOG0ev4V7FBmncMT1sWriSDwEF0dMFC45O2kx6g0oJ519+bkl5fugZQZsv3DMKyQXEBaWApZwE9dY4stB7TksYRmsEuwo6iihmlRuJR5DW22Fknd1li1DF6ggr7Q5p/4Py/+gEtM0Urch1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720107029; c=relaxed/simple;
	bh=28bDdNrt3TOLK4V5yDl48Th2PSqXkGIXkaNQhDQvcpI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PSf89dIiRUMyMChtNRRnmNJywpQrcAIj274anowKTS/VowSG5BhNzSnJcSNCPEHivBq5zWyULL1gOFSd9KoObW956izuAThoEJv0gjmkftaPbLISiXj7+PpoBuqCsuwvouvNMySsZnL4TMSF8axCaFvOYIlbiiTaPyJiSNA97Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kBYzZgdx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464AA2EN013708;
	Thu, 4 Jul 2024 15:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n9G7P1uY75ZauY5Ppnuop1jFLwcZfqN6DO7dx97e0h8=; b=kBYzZgdxveT3EilM
	y/tsxG8xiZ/GO2ZMMt9CPDf1pz5nqqmHokP9Fuq90x5CwqtzDKPPywTouqGc8HrE
	j428jZP7dnEs9Vc7T7YDd2BXF5uUD1BlEj5gTx15GTam6JDg1shxox9RqPRR4No9
	4zY1cE+foKj6n8iLtYZPIRmtw46uae+iwzq5VSsPT/3qxVlNorhw/WnIUDJ3RXTS
	0P/O/ATGH3MaPwfM+odU0j3wO4vIpvzBW7f1Yo1LXXcZ+I/66iK4R2edLbXfsDxZ
	/ntpnCgldKsCCjODfDo/I6bvo/fVWltznPe53NvYZgDcgJ72HVrE9t82LhZ7fIpg
	dps6WA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4054ndua76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 15:29:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 464FTuGq007012
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Jul 2024 15:29:56 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 4 Jul 2024 08:29:50 -0700
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Baruch Siach
	<baruch@tkos.co.il>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        "Sivaprakash
 Murugesan" <sivaprak@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Douglas Anderson
	<dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, Iskren Chernev
	<me@iskren.info>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@somainline.org>,
        Vivek Gautam
	<vivek.gautam@codeaurora.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>,
        <stable@vger.kernel.org>
Subject: [PATCH 7/8] arm64: dts: qcom: msm8996: Disable SS instance in Parkmode for USB
Date: Thu, 4 Jul 2024 20:58:47 +0530
Message-ID: <20240704152848.3380602-8-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240704152848.3380602-1-quic_kriskura@quicinc.com>
References: <20240704152848.3380602-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JGY6BX9lhqx5dctLSMzG70TMDrzboaLk
X-Proofpoint-ORIG-GUID: JGY6BX9lhqx5dctLSMzG70TMDrzboaLk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_10,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=491
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407040110

For Gen-1 targets like MSM8996, it is seen that stressing out the
controller in host mode results in HC died error:

 xhci-hcd.12.auto: xHCI host not responding to stop endpoint command
 xhci-hcd.12.auto: xHCI host controller not responding, assume dead
 xhci-hcd.12.auto: HC died; cleaning up

And at this instant only restarting the host mode fixes it. Disable
SuperSpeed instance in park mode for MSM8996 to mitigate this issue.

Cc: <stable@vger.kernel.org>
Fixes: 1e39255ed29d ("arm64: dts: msm8996: Add device node for qcom,dwc3")
Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 2b20cedfe26c..0fd2b1b944a5 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3101,6 +3101,7 @@ usb3_dwc3: usb@6a00000 {
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 				snps,is-utmi-l1-suspend;
+				snps,parkmode-disable-ss-quirk;
 				tx-fifo-resize;
 			};
 		};
-- 
2.34.1


