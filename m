Return-Path: <linux-arm-msm+bounces-62266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 500F8AE760C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 06:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F9391BC5B93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 04:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9C91F099C;
	Wed, 25 Jun 2025 04:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HyUwcqL7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D281E32C6;
	Wed, 25 Jun 2025 04:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750826216; cv=none; b=cyRxhrITXfEAXhxfXMyL6WSTX778Uaecd5pd7dpt3wylCqatRsj+AwW51Zy7vTlWGuDra0v1SgDgdBrFGaBZqdUwrx/nmhMdhDSVUtgMlordse6dIFsX7NgMS/Gf8zovFpY3uPs87pM83vR0Rb13TQtLiIb1RCOhBPGsoeQV/Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750826216; c=relaxed/simple;
	bh=TBHogKU5UYKo7DgvkXDf8EN1yyburvFgHUEZd24xveY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OvKbqYEeYK1fU6NB1tL+QG1YSLCXQZTh3ymxnXNHqAq9awxwQRlEJKL7t0WJSjmrrNJIgc17GbEMI9IfM+87m3Qgz3a/LJbEeI/SlNTYVMgatZS3z/ig8DNUOxU+y58erDUpayTiXYYOG+0QNh9AurRqvH7SfCKql1QIY6DwZVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HyUwcqL7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P3VW0Q013850;
	Wed, 25 Jun 2025 04:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aj/f2WlZzwVLku+COiitPx
	wQ5c1WO2LueIfG9xSBymM=; b=HyUwcqL7Ft98V0Cx3VononRIznd7WKwnGk+vQ5
	Fl6+m55ToIUVjhIeyy7G0hWV7UPUcSYBboDb27FgzV2sNlnmJH3D5BEB78uzlOpp
	X/+m9N7ImHx7JfjWGEspCQZj7OKxo8wkKhedlyc9JiYeXM1oPchWrPs6IneTRA+q
	HYrVgyzeAe883qADVIBRCq6ZCiQqN7I9sWDeWGwTlEt2HgbrTYIa233SnR88GQG8
	0viZL9qo8E7frnMUbrzNpgxlvThmWiItSQCvR50bEjfarE8QDIyf1q6++MRjfH7z
	rd+LOzqdyPNO2x+hM18lw8FdoObJS7sGNLSMRSTclVm1qS9w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4qqd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 04:36:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55P4alh6030820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 04:36:47 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Jun 2025 21:36:43 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <daniel.lezcano@linaro.org>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        Gaurav Kohli
	<quic_gkohli@quicinc.com>
Subject: [PATCH v5 0/2] Enable TSENS and thermal zone for QCS615 SoC
Date: Wed, 25 Jun 2025 10:06:24 +0530
Message-ID: <20250625043626.2743155-1-quic_gkohli@quicinc.com>
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
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685b7cdf cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=JfOcGDDDXtGUpYJnmSUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Uy5duyMRIfQB1OKtnmOnimfa3oEX6Ont
X-Proofpoint-ORIG-GUID: Uy5duyMRIfQB1OKtnmOnimfa3oEX6Ont
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMyBTYWx0ZWRfXxBvZdzRh19+t
 apf2ZZ816CSM53rp9TfCkIQ711CcwQc9mUyxjtxACq1qJWZbqzPb916M/9FE3JDN1YHsCebiQbf
 /FVSWoBui9WppFZ5T8r/zjsVa3AST1GAgtj4B5L34fLjV5Kbw0vxOpJtBFFYu1GP+xjoDIq/Zkm
 YyFPenLTR91iqEJi/c8/hvspLEBAh3n5YUkt9hRaU/58SSkI1Ms7zCtfSXTTQrDjlNxm+Kt7xn0
 r4An7qOvyFAREwPORfa1sfz8/seB2zJIpwyX+rFWnXw+R6CRAv944s2ncIT8pFwFAGfvPvBeWJU
 /9pyksAd6892yHsSvefJg6bG18DngK7cR7L9ziw7VxmAlyz4f4pnp361YVigcM6oL2AxaV51Gxe
 V26fUTqsL/NAO+05rS6vEG7Z+z5wTZb4j0L9C80lk/4FZvdrRs6DUVbMhfSryz3OKlFU7BLx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=864
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250033

Adding compatible string in TSENS dt-bindings, device node
for TSENS controller and Thermal zone support.

---
Changes in v5:
- Fix git patch edit error.
- Link to v4: https://lore.kernel.org/linux-devicetree/20250624064945.764245-1-quic_gkohli@quicinc.com/

Changes in v4:
- Fix naming of thermal sensor.
- Link to v3: https://lore.kernel.org/linux-devicetree/20250613112402.2203617-1-quic_gkohli@quicinc.com/

Changes in v3:
- Add critical for all trips.
- Link to v2: https://lore.kernel.org/linux-devicetree/cover.1744955863.git.gkohli@qti.qualcomm.com/

Changes in v2:
- Drop the passive trip point and add critical for CPU thermal zones.
- Rearrange the tsens dt node and fix the address part.
- Fix the commit subject with target name.
- Link to v1: https://lore.kernel.org/linux-devicetree/cover.1744292503.git.quic_gkohli@quicinc.com/
---

Gaurav Kohli (2):
  dt-bindings: thermal: tsens: Add QCS615 compatible
  arm64: dts: qcom: qcs615: Enable TSENS support for QCS615 SoC

 .../bindings/thermal/qcom-tsens.yaml          |   1 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi          | 205 ++++++++++++++++++
 2 files changed, 206 insertions(+)

-- 
2.34.1


