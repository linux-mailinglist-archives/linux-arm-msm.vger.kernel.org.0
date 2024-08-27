Return-Path: <linux-arm-msm+bounces-29554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A8F960303
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 09:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1B15283044
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 07:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56774153BF6;
	Tue, 27 Aug 2024 07:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KXKeCUfr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D670433999;
	Tue, 27 Aug 2024 07:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724743671; cv=none; b=qhgiDvFrfnyUeIF9thythLIHX0IqFLGu+jFS78/w0ugi3DZ1XM3+TBWdRyf00zEwAxuc43tLhJmX5gUqRqnpjqtWS6TKt1gSRh2CB6nePDdM57AOexCq2MZ8fv0m3fkdEEpqJw/wTED+2i8etWWpBWWlJhaodM7TeBtvpj1Gsn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724743671; c=relaxed/simple;
	bh=pRiB9Gn8ioIy9oLdEEAFsuKgbFZLkdvpSu0MPLeNr80=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SWyg8vBj8S0MyEt+itytdlsGAd0lzMhhFi02CJ6zcuvePlOLoZWIt9Fzn7NmOquFIh04W4f+DkBFMr+yKtg1mWzo0dZmtEKYmcdj32Z9XMNRZ7/hQsuMW+yyD7/G18d7lz1xDrdnj3pXfBXvt1sykZPqNv/HwrzIgIf3woeyjhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KXKeCUfr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47QJHQrN024902;
	Tue, 27 Aug 2024 07:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yCzGpDbbcZ6f8dYa91j+rM
	eTrakHTRWlOs/PuYRi4i0=; b=KXKeCUfrYoHc+pqwxmkhmkrhAKgxgf7E6jcYjc
	s6g9F1Hr1ijaohl6t1a2v7rzRg/vBEQRPrH530ywK7Bmi8rLYsXdUQkruF46hkxv
	zixGNCurJMLhNR3PgKyyWGYNCk1IJYOFDNHe9Vji/zvJE2kuRYt8ult4D2zl9IZz
	xJqYR8xg6f4E6i1kHbR7pJEjP67lhe/crk+Jymk2NE+qprHHb/Ai8Lw1aZg+UY//
	71GIDrV7RRtOYXLUdr9Pa25h77dBfR2OPC9VIYtpGoaF+G0JuIay5cD3J2JYLIKY
	mrxcyKO+PRDfK7zBvKEmoW4cLvKlmuTYEtrqiPbYcGexoOCQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 417980x44p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 07:27:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47R7RkFD028036
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 07:27:46 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 00:27:42 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Song Chai
	<quic_songchai@quicinc.com>,
        Yushan Li <quic_yushli@quicinc.com>
Subject: [PATCH v1 0/1] arm64: dts: qcom: Add coresight components for x1e80100
Date: Tue, 27 Aug 2024 15:27:23 +0800
Message-ID: <20240827072724.2585859-1-quic_jiegan@quicinc.com>
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
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -1F3UttFaUTWevehpQpbBxUkGtHaWIbq
X-Proofpoint-ORIG-GUID: -1F3UttFaUTWevehpQpbBxUkGtHaWIbq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_04,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 mlxlogscore=498 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408270055

Add coresight components for x1e80100. This change includes CTI,
dummy sink, dynamic Funnel, Replicator, STM, TPDM, TPDA and TMC ETF.

Change in V1:
Check the dtb with dtbs_check W=1, and fix the warnings for
the change.

Jie Gan (1):
  arm64: dts: qcom: Add coresight nodes for x1e80100

 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1514 ++++++++++++++++++++++++
 1 file changed, 1514 insertions(+)

-- 
2.34.1


