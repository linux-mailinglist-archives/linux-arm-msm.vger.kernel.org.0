Return-Path: <linux-arm-msm+bounces-63324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75C4AF0DD8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 10:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 894AB4E2E54
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 08:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1022367AE;
	Wed,  2 Jul 2025 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gINolL/j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F1F233723;
	Wed,  2 Jul 2025 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751444628; cv=none; b=HmBzHlQab9ICuJ0/rOPb3WEDm5yxEzCG/I1suLB4LZHzCNCNasVhBhiZARkSUjgU1bsG0XMoOrVCuVLtNAqdfWQiV0eD7Mbsp+Qp40DspnkL72JUiDs3/I9Fu6KB0ZEKczzubIFWwmsHSGg7jTjZiK1tGblNmtPZEYmaCeo8rtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751444628; c=relaxed/simple;
	bh=otBZh15OOyjJkHH2CKgAxb2GW+HM0480P32OmU9pIq4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e8aI2X+VyO+oAC5dGxLQ4+BnPshqaWPRj8rhYuxbBJjBah7N8kLz7PT0jNCBNsd7WyI7AJRiB6wxjKJVrFp7DkqqZhOkpGVd8BPeG7c/lPpZY8lvu78lQoDItMNzZcJ9YkXmQxCjpVDGdiaHxx3y5wXeK78bZ5XZGAhXWanXuEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gINolL/j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56235eYT020939;
	Wed, 2 Jul 2025 08:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DESyyby3BI6Fcvb3mJCAa+KVqYOAQbycV1UC39W8JRw=; b=gINolL/j0PfyJO0k
	4hd4mawCszVz12Vo/CtQkUOA/QEHAdWAYvJZnS+iU5GZgSbBoJsXblyi/id+rfjr
	Iy19UWac24sRR3aHsFHuL9jhPZ4R69G3ijMyxdUYFHnIYLfJLS+7sucjnE+P1qMZ
	ASkcYn8T70+3Vap9wgmf7a+Hyn1yd82FHVPhQbRd2xXFOuVJk1RJcMQuXBDcbD/g
	OUE8GkLduzpPOwgiUo6ZbBxWxiosPJpCutUazRz93wsqdsG7m3fhrUPHerqLOAX2
	UcrMe7TzSfdvnQe6zJNTHASXy0gz2TAZTRJTKToYtUbPIOap0Jz/On+XInUg8+6p
	wCji4w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn2fbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 08:23:38 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5628NbJ4026647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 08:23:37 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 01:23:33 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <daniel.lezcano@linaro.org>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        Gaurav Kohli
	<quic_gkohli@quicinc.com>
Subject: [PATCH v6 1/2] dt-bindings: thermal: tsens: Add QCS615 compatible
Date: Wed, 2 Jul 2025 13:53:10 +0530
Message-ID: <20250702082311.4123461-2-quic_gkohli@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702082311.4123461-1-quic_gkohli@quicinc.com>
References: <20250702082311.4123461-1-quic_gkohli@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA2NyBTYWx0ZWRfX2FjA3Eu5+2g6
 bmVmakLbxfaV4VhwoeYJsoNEWRcTtISyEsTokrSqcLXbVZFo/sMqL39CwtbrDfu2XybDWgypEU1
 5OqPI27ESVcgrTY0n7YGu6vzdpiRCiXt5qNOdEILjCI3LA2DgYeURvcKrpXTi7R+e/WSx2Gryuz
 gxvWQxU/dRNKWBrATwzIGyWii/DOXpOOMYxuwDoCiMf/Y4Hq/ta13uV43vMva3XBMztiEQpSonL
 JJTZY2jfoumYYxM+j1eZct+sILahZP8UlaR0XxRAuLE0FXtVpaQX5v31ey0AWh5q7zDqG+iB4v9
 MHQZMYUMoVUps0iNbX9xp6lES1aoIW6z720UfW9/MFuPoXxZqIPPTkD8HDhMwVpzu+PIzn/uI1u
 8lhxgvUnEidGwlR/B6zVzLAjWy6F4iXKcctuNkVmvMlQu4cOqaBmkeQTeKnseDaw8c+rZjNr
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=6864ec8a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=IfUgwc_bth4yghHgifUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bgJ0eKZHmk3Oc2qouhLxY8pmb_sJ0ctp
X-Proofpoint-GUID: bgJ0eKZHmk3Oc2qouhLxY8pmb_sJ0ctp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020067

Add compatibility string for the thermal sensors on QCS615 platform.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 0e653bbe9884..c8cc67b65f73 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -53,6 +53,7 @@ properties:
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
               - qcom,qcm2290-tsens
+              - qcom,qcs615-tsens
               - qcom,sa8255p-tsens
               - qcom,sa8775p-tsens
               - qcom,sar2130p-tsens
-- 
2.34.1


