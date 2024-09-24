Return-Path: <linux-arm-msm+bounces-32221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14163983C36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 07:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5622283B38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 05:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09329364A9;
	Tue, 24 Sep 2024 05:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FdYmJQIv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4237C3D551;
	Tue, 24 Sep 2024 05:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727154708; cv=none; b=AkF7vj+fyE5kpPWAq/qYA8dMo/TteXqGuoV0ADlJIovWh6wzPeUojtanccFnfjJxl8CQEa8cIyAhnMO1XvALjVKtcdcdzms0yxj7w34QO933lt0r8GRjgwQvJxJuqsHtZ7TkClGbYU0UIXl8CbhaeXkKYzej8WP0cQwqAqZbvTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727154708; c=relaxed/simple;
	bh=lGWHI+SJQBdKvuBMCLewjLfC4AXoEQ2T7G3RCNtD3Jc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M/9HOx6Dzj71fE0OLZRvflI9cDsyaPnm7MRQPNNiP4uXP2jIMm2ip4q7QtGuVFm16MN40tHnlyvA8TKS3nNSpezmbUk2z3rle/tPd4e5eEPKAwhcwKah1RugHM742RMrwe0JegqA2DA0Sb5DcrQglxThV96VH1Pd9G2X+gcr8Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FdYmJQIv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NKsHiO025777;
	Tue, 24 Sep 2024 05:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7bFk/pFaDP3cfFbgI1xD16
	zPRgUnJr6hfsvlps2phJU=; b=FdYmJQIvwzNbgVZ6lid+bMCZobgPJ+8JaHSFnH
	KDMmD2W7XFPgUUJ8Uj9zFa1KReMiJ8bNcWR5l+ked3r2wR8btxU2T7R70q9/btXA
	p4gBrOD6a2e5Z5tduGVa0PwM9T7k9mQrRC1V9Po0KG35TnUWkB60rKqaLAlC9dG9
	rPlt0XOLH++iqz1H7Z5NM+445Q5km6v61Qsv5XuUlXJ3rE/yAoM6GC1R6LNfTuYT
	zIib8RwkvHu5k2E92vNsySHrdgCQ++0ntkzsSfdTMhddyfiqp7EdhrB7IEwrg7ii
	j54UlADRakyss+tfXY3FYtIzCIi0IrLEvLhFG28vEvaQvy4g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqakeu6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 05:11:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48O5BgVF011288
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 05:11:42 GMT
Received: from hu-kshivnan-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Sep 2024 22:11:38 -0700
From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
To: Sibi Sankar <quic_sibis@quicinc.com>,
        Jassi Brar
	<jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Ramakrishna Gottimukkula
	<quic_rgottimu@quicinc.com>,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
Subject: [PATCH 0/3] qcom: sc7280: Enable cpucp mbox
Date: Tue, 24 Sep 2024 10:39:38 +0530
Message-ID: <20240924050941.1251485-1-quic_kshivnan@quicinc.com>
X-Mailer: git-send-email 2.25.1
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
X-Proofpoint-ORIG-GUID: z7Z0boMY4upqfLm27Vbc6uk2TF_pOotC
X-Proofpoint-GUID: z7Z0boMY4upqfLm27Vbc6uk2TF_pOotC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 mlxlogscore=683
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240033

This series enables CPUCP mailbox support on the SC7280 SoC,
facilitating communication between Linux and the CPUCP firmware.

Shivnandan Kumar (3):
  dt-bindings: mailbox: qcom,cpucp-mbox: Add sc7280 cpucp mailbox
    instance
  mailbox: qcom-cpucp-mbox: Add support for SC7280 CPUCP mailbox
    controller
  arm64: dts: qcom: sc7280: Add cpucp mbox node

 .../bindings/mailbox/qcom,cpucp-mbox.yaml     |   5 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |   8 +
 drivers/mailbox/qcom-cpucp-mbox.c             | 156 ++++++++++++++----
 3 files changed, 133 insertions(+), 36 deletions(-)

--
2.25.1


