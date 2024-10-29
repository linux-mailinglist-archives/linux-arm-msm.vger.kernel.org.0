Return-Path: <linux-arm-msm+bounces-36250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0E49B40CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 04:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FB3FB21B17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 03:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B5F1F7565;
	Tue, 29 Oct 2024 03:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EQLUGKtc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C465149C4F;
	Tue, 29 Oct 2024 03:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730171557; cv=none; b=lPvvqhbgJ3clXRoOnqdOhBgYzwe4O7aUMKuJdkmM9Fn0lNq3zmQim+qvRKmlIoNwo9zuKy47GYZ1urgwaOn/Sg9Lj44asbn4o1hdlj5O4LwGzVue6Pto4Ib9noUHHkis1BsJQqKW0ASo0AGyRnmhTxMkxEedHaSMP2Og8AbdFOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730171557; c=relaxed/simple;
	bh=AnKGB5qEJmuBsYyFcAMQDGxAzQO/N5iGbBB0ygAtp/c=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=fuwO6VMUmnpDCNDTyPOfrfVSoz77rhHJF5jpM+vpW3KnzMaxiVU3E532GiUXBaf9r9oLY+wXYFCe9Hb5kCdVdNtAMxZG7H3+U6PlKirgu5yHAacZL8yJnjxTeDUWtyyVAbonU9Yp6zMxZQ3L9wXOP5PQHLdus+EbYIH8FHlwhK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EQLUGKtc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SLNuRq005754;
	Tue, 29 Oct 2024 03:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5VxwDdM9oNjw9I44/LF8Cm
	cxos08+pTMMfiAPQ/j2nc=; b=EQLUGKtc00JIwpOLj5uCB6ePshF2AOWfVRdzfw
	xMkyWwX9bP04xFU0lunjfR1Bo+v0y0pvOhVOzALt+ofsN6OEjfz5wuoQ8M9ce72D
	9belLdH2DHtn5ju5GIyTbaN9WKE306RmPWbGeIDAUGHEPxtnR3Noffe+b4ysJ2zI
	OBfWRaFw4kk0b5+5jJBs4pnexXd+R9i8ichwZx6KvKT7c8JEw9loge7WtzD9/SAD
	0KPgD6q4+alYGc+StsepBfpfi9AsKJc0SSVeqVU2spkpNJ1cMSP+A+7fE+ctKxxm
	RezXXX9V1H8xedTve4FyAmqU57IKpyCcYT4271M8CVwi7EoA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gskjxvwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 03:12:25 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49T3COLT016954
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 03:12:24 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Oct 2024 20:12:19 -0700
From: Yijie Yang <quic_yijiyang@quicinc.com>
Subject: [PATCH v3 0/2] Add ethernet dts schema for qcs615/qcs8300
Date: Tue, 29 Oct 2024 11:11:54 +0800
Message-ID: <20241029-schema-v3-0-fbde519eaf00@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHtSIGcC/zWPwXLCMAxEfyXjc8XYchpcTvwHw8F2ZKJp44CdZ
 ugw/HudGI4r7a6eHiJTYsri0DxEooUzT7EI/dEIP9h4IeC+aIESWyXxC7IfaLSgbGd6xPazC0E
 U8zVR4PtWdDoX7WwmcMlGP6zxmlqNA+d5Sn/bwUWtdqE0WkOlWzvaQ4towXmjoe8cSRms12SO3
 5Qi/eymdBFr/4JbtGKp/RtrQZCAGmUoeF5hd7z9sufod34axflZSROVaea54lbWsh95PjSR7jO
 8vjUl8fwH3svpdSMBAAA=
X-Change-ID: 20241029-schema-1a68d22456ff
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David
 S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730171539; l=1370;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=AnKGB5qEJmuBsYyFcAMQDGxAzQO/N5iGbBB0ygAtp/c=;
 b=v9nIjoiGXBC5VmtJjLtTNk0yb2WdvlN/m5gasihBeK24chrxZ6C3PX1fQyPGkO1tJ1i7xSb+h
 L5b374nOP2ZBd/kAnz1vXGV2mKSMbx2rSN6q9vzpaMwQLg/5zdJSBQu
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VUBW2ZrS1V3F_hLxco_fOZlL3i_TqHAH
X-Proofpoint-ORIG-GUID: VUBW2ZrS1V3F_hLxco_fOZlL3i_TqHAH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=914 bulkscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290024

Document the ethernet and SerDes compatible for qcs8300. This platform
shares the same EMAC and SerDes as sa8775p, so the compatible fallback to
it.
Document the ethernet compatible for qcs615. This platform shares the
same EMAC as sm8150, so the compatible fallback to it.
Document the compatible for revision 2 of the qcs8300-ride board.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
Changes in v3:
- Remove merged patch from this series: "dt-bindings: phy: describe the Qualcomm SGMII PHY".
- Remove unnecessary dependency description.
- Rebase this patchsets on top of 'next-20241028'.
- Link to v2: https://lore.kernel.org/r/20241017-schema-v2-0-2320f68dc126@quicinc.com

Changes in v2:
- Adjust the position of the EMAC compatible fallback for qcs8300 in the YAML file according to the order.
- Link to v1: https://lore.kernel.org/r/132a8e29-3be7-422a-bc83-d6be00fac3e8@kernel.org

---
Yijie Yang (2):
      dt-bindings: net: qcom,ethqos: add description for qcs615
      dt-bindings: net: qcom,ethqos: add description for qcs8300

 .../devicetree/bindings/net/qcom,ethqos.yaml          | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)
---
base-commit: c8f460cd88112a37cbb3321a25ddddba08bb0372
change-id: 20241029-schema-1a68d22456ff

Best regards,
-- 
Yijie Yang <quic_yijiyang@quicinc.com>


