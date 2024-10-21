Return-Path: <linux-arm-msm+bounces-35309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6BC9A940E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 01:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DC131C22141
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 23:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CB11FF05F;
	Mon, 21 Oct 2024 23:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n7/U6e/i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260451E260C;
	Mon, 21 Oct 2024 23:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729552901; cv=none; b=YpPUpRNCe0Ltcz5fuJ4YTbF8qrqtOh9J2T5O3OfSU2J+hI5njcKxBEKnST074czAgRUS2lJci+1mBwlveFELfMHRKEi8EL+o/t5OFXd1nUwlyiPXM9va+LEjOsN47i3ecCnLUw1TUFqGqzIVDL8NBs9By4SYqqAY82Tq4dp+OY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729552901; c=relaxed/simple;
	bh=X126EPpvmFApisTxzepdtHvlWX2WpACTdUL/sfxvBI0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Trcvo0bZsZZXwcy1vRQT4B35v+XlJLR+hjzsR+GV650D/3kZN8+cNipPzJLUMIdcLdMw9dxxOh9syk4PKeGdpIuPhMREK6SchV9uKBE/AuJRqOC1fWtlK+DQub/e6YITgFEZaTJ5/jbFtijBLVxqb9w0w9rrR7CdXOYhEHj7mds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n7/U6e/i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LFbeWV014493;
	Mon, 21 Oct 2024 23:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t5S6ZzOuqOCycVYc2mvHV1VJtvMFV6txeqKYulP9RHs=; b=n7/U6e/iLthc81bj
	8mYAfMNQAEbSy4PI9USviP8jYY0XsJT/ss5VLmBpGFfA/mLhJaNLxjeNvzhyE+4J
	LiaBZ3Z8Pq9q1yCqwi3y/Dh1iQiG578kL8q0oFTppb3d31YUikVykvGlfFPDSvct
	Zr0Lqrje3LXHO6Zxd8temH/Z0cB5Y4jr+pYv9uU6CS8U3mDR2I2mzRp83JlLv4od
	+7mdo2BQKNWaSkY/ynR/hDqy/2LZ9U5Kgf7q33+5CgpuqXbeG2V2uCT8FATXb7ot
	lcj7sjjv1aslF4ePlKWNOxdwrDorzwwhhD5V+CAoQtxmUhoqKGZAJ2/EvzfOl/0b
	5aBANQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dkhd2eq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 23:21:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LNLRFo001597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 23:21:27 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 21 Oct 2024 16:21:27 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones
	<lee@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>,
        Stephen Boyd <sboyd@kernel.org>, Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        Melody Olvera
	<quic_molvera@quicinc.com>
Subject: [PATCH 2/5] dt-bindings: mfd: qcom,spmi-pmic: Document PMICs added in SM8750
Date: Mon, 21 Oct 2024 16:21:11 -0700
Message-ID: <20241021232114.2636083-3-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241021232114.2636083-1-quic_molvera@quicinc.com>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gOyr1mHcc2VV826O32O3CaEpQnNSci8p
X-Proofpoint-GUID: gOyr1mHcc2VV826O32O3CaEpQnNSci8p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410210164

From: Jishnu Prakash <quic_jprakash@quicinc.com>

Document compatibles for the added pmd8028 and pmih0108 SPMI PMICs.

Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index a2b2fbf77d5c..078a6886f8b1 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -76,12 +76,14 @@ properties:
           - qcom,pmc8180
           - qcom,pmc8180c
           - qcom,pmc8380
+          - qcom,pmd8028
           - qcom,pmd9635
           - qcom,pmi632
           - qcom,pmi8950
           - qcom,pmi8962
           - qcom,pmi8994
           - qcom,pmi8998
+          - qcom,pmih0108
           - qcom,pmk8002
           - qcom,pmk8350
           - qcom,pmk8550
-- 
2.46.1


