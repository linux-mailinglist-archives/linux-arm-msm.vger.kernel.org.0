Return-Path: <linux-arm-msm+bounces-19391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBDA8BECC8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 21:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1E21B213CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 19:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB2F16E880;
	Tue,  7 May 2024 19:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VDKS6/cm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE2716C860;
	Tue,  7 May 2024 19:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715111512; cv=none; b=SHMfBxMcLjX5DsZfIBxvy7rOkhq4jwZMi+WUlgqHbXD78SiAtRs8bTlSq5CCsJPRQXVsRTEqkj3hq3daYDX5x6MYo4/PQJ4Ao6wTb2gqywVBmE9VOCUzIVuoB1ph3ORjmgfgjg5KZCSP2We1LaMFFPIETHvXloF3i4r+/wufj3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715111512; c=relaxed/simple;
	bh=2TQXo2YMYhg/mBJxKuqafaOEZef1g+SCKODQN1pqdkU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u/9wiE5mGMQHgEIknYpgqHRlfLVBFtDkVX3w1NO+H3dkyJJzqcOuisBJxKehA/Z3EijBQwEbeoY4zADFEFwx+5fsJta+7SDSeh0Dz7PzWRd3vbtBWd5ZlggWzLwv468EtlvdzsN6h4SRt7LRT4Sd/fXfMfVdobdZdKKDwPwSO2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VDKS6/cm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 447Ia4bd013325;
	Tue, 7 May 2024 19:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=/ZM8SPXr7udKkYr/SDUm
	noP1IOgbHf5SfkdSPWJ27XA=; b=VDKS6/cmdhWxzbvZ1QMvOO12LZMuqGbvDwaz
	OOLBS7VfKlksuSlIKsLl6Zt3pW9fLJIXryYBgQhhES0MmXeyQDQGq0JA6ca1CDSz
	WRJel6X07Rmn+yThom+4+tJzKgpBEjLwyI50f+kTMq9GeCH5mWYyZUFS5FEentNB
	94/hyK2PUcdoU/6tGmaZrXEwWZID0JVeTrcXYhd0garroyMv5x2hMADTIZC436CE
	cHRK/aGEXosln3hvHeIYRujgmS6gNquHoGDJSkwVT6RcrAGFwx3Z2/07GevoZ/aw
	4KCg4k6ztkM92UJG0yQ0USovSxunf8epheZT4hwHDiI7kCQhWQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xysprr4f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 19:51:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 447JpT5D007172
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 19:51:29 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 May 2024 12:51:29 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <bagasdotme@gmail.com>, <robh@kernel.org>, <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v21 08/39] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add USB_RX port
Date: Tue, 7 May 2024 12:50:45 -0700
Message-ID: <20240507195116.9464-9-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240507195116.9464-1-quic_wcheng@quicinc.com>
References: <20240507195116.9464-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BWMy_sVse0W-Cb2h8I7AAZLQHSFJ1OMf
X-Proofpoint-ORIG-GUID: BWMy_sVse0W-Cb2h8I7AAZLQHSFJ1OMf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_12,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405070138

Q6DSP supports handling of USB playback audio data if USB audio offloading
is enabled.  Add a new definition for the USB_RX AFE port, which is
referenced when the AFE port is started.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 39f203256c4f..6d1ce7f5da51 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -139,6 +139,7 @@
 #define DISPLAY_PORT_RX_5	133
 #define DISPLAY_PORT_RX_6	134
 #define DISPLAY_PORT_RX_7	135
+#define USB_RX			136
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2

