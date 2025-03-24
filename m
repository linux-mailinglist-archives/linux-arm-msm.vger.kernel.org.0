Return-Path: <linux-arm-msm+bounces-52394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC02A6E416
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 21:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC05A1893CF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 20:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B3D1D7995;
	Mon, 24 Mar 2025 20:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eYPa8gWO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6F42E3367;
	Mon, 24 Mar 2025 20:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742847574; cv=none; b=cNfx9zIO+clYV4eptfVs6GSgCeK2no9wV4dkaa8NEzeK2fGiCnXnvU2L+SiGDMhoLqhYNVxHYXa+k5nNqx4xx1hr5mbDM9EIM61tyWjk3vfJ3lJfv3HGErNMOvqfCyq4p9nqcAOuTB/errkUZQF804oeKCQKcfFAT68nLUEClCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742847574; c=relaxed/simple;
	bh=SHtlYyK96nNYeRsZl51JNLnihxLUyUGfO7rJjmq9wPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VaaczdZHqYdbXrGGhQRsxPEIOApqrPTxcpbo3P+pSWKZDMnWN3Rmif1fgejNhsx0ylQk/8IBlzC0jeuKnKNyqiNR60hZz+xXD8rux7dO+MWow64h8V6vXFPYtvnHabfcFPdzrD8nBZonStaOBXzo39xlC++ZYwypm+GK2MxM1Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eYPa8gWO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52OJx1V0030810;
	Mon, 24 Mar 2025 20:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zqLU6UizuUl2cHEcm9G1K2zmKbgkw/QLmK2vI9n3WkY=; b=eYPa8gWOy3M6K8L7
	HZDzMjAIjX3fCVvbAyKBsuhGG9EAyl6j9Y58CBf1zjnCs+/fDqgCrhdsKq04+Rkt
	RiPe3bf7DST1wigqdb+QAvNX06vVsKHWNn0sxIsom2vFtuGZWQJBDQVefBEG8ZFI
	fXaqZa54g29PEg2Dldha/j4+BhJ9ly49C2QzCmgmR1hgqaJkCdmUbn5QUKQH3lkv
	GTQFZo2KjXULE58iXNM+WOXZ95TmHNnX1jHsYXkah8sVVNw25lQ86IdXmgxT69xb
	TkX+qTxI+7Xp4/VCBY55sXuxJxqh+D4VnBS3oGduZfmTbEYMNGI+S2hsdXj5iBV4
	I2o2YA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hmt05g7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 20:19:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52OKJJaM029885
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 20:19:19 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Mar 2025 13:19:18 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 24 Mar 2025 13:18:33 -0700
Subject: [PATCH v3 05/10] phy: qcom: Update description for QCOM based
 eUSB2 repeater
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250324-sm8750_usb_master-v3-5-13e096dc88fd@quicinc.com>
References: <20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com>
In-Reply-To: <20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742847556; l=1369;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=sIInSxwQYCptc1zM+9GvSJpihS/ENH6pXV7Y+Z5GaXM=;
 b=h+MW4IVJwoec1a+TtFTei8IKOj7jGpDRv75tH7otuBfNYQYF6B4mdTHuzZcdPOoUTqJRA886g
 wtDYmnH003kDwI/5aFg1Pr/M4UFIB16LAR3SXDZaMaQcmZzsU0qaeZn
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vdF-k7EsdnyFGy-VGkObChUioC2XBzd_
X-Proofpoint-ORIG-GUID: vdF-k7EsdnyFGy-VGkObChUioC2XBzd_
X-Authority-Analysis: v=2.4 cv=aqGyCTZV c=1 sm=1 tr=0 ts=67e1be48 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=hZnO6B-xo8vswsGY96EA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_07,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=872 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240143

From: Wesley Cheng <quic_wcheng@quicinc.com>

The eUSB2 repeater that exists in the QCOM PMICs are utilized for several
different eUSB2 PHY vendors, such as M31 or Synopsys.  Hence, the wording
needs to be updated to remove associations to a specific vendor.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/phy/qualcomm/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index c1e0a11ddd76c2056eb2e72a287ece4def2cf5d8..3cfb4c9d3d10dce49bb93b241f9b56c75b934601 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -135,12 +135,12 @@ config PHY_QCOM_SNPS_EUSB2
 	  on Qualcomm SOCs.
 
 config PHY_QCOM_EUSB2_REPEATER
-	tristate "Qualcomm SNPS eUSB2 Repeater Driver"
+	tristate "Qualcomm PMIC eUSB2 Repeater Driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
 	select GENERIC_PHY
 	help
-	  Enable support for the USB high-speed SNPS eUSB2 repeater on Qualcomm
-	  PMICs. The repeater is paired with a Synopsys eUSB2 Phy
+	  Enable support for the USB high-speed eUSB2 repeater on Qualcomm
+	  PMICs. The repeater can be paired with a Synopsys or M31 eUSB2 Phy
 	  on Qualcomm SOCs.
 
 config PHY_QCOM_M31_USB

-- 
2.48.1


