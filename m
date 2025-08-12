Return-Path: <linux-arm-msm+bounces-68760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9DEB225FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B38AF1891E08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2A62ECD3C;
	Tue, 12 Aug 2025 11:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gKLOsrHB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7272D2E9ED8;
	Tue, 12 Aug 2025 11:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754998590; cv=none; b=N1bZQ2PBHfefU6A9FUSVIiZGqfJ6tfCWLni/5cYfjRDUDPP0LsHz2wAtKo9UtIlsiAutikjQDpQLvlTA2p4cXtdmRGuHR/btUjj3/Uaqt178+X5IIUVNZ2hvS5A5/Dp0J+ygsOEKhCR1GoN5tBaVoNT44ZrWsPSW55T6UzAAQL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754998590; c=relaxed/simple;
	bh=1j5yg+lSAHuLMhU3lbI0jIA24J98gX9/8b5M+zM8EUU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VKaMdMtGX8xNbjGH9NlV9gnwQuUm1LK/5+WVZZztLTuSRiJpWpRTU5wTdiE4YLvt+XRocD8hRBElzxTtFqXcNvSW+1v7+/75OFgaD1Z+lTtkp/VSQU3FdlJXpUItkYBWRxISfACcJta0csHY81hSnHBp3lfnqUfI/zqOtMotflk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gKLOsrHB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvfh7005909;
	Tue, 12 Aug 2025 11:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vjGxB8wpxqwFfJruwY3bBOQyHUoTNtgE82/
	/yw6HIuQ=; b=gKLOsrHBzIdpUq5Eza245/LgaAID3I2X8Hgk4GeuyTR8G8tdG0L
	5g97Fy9ZXSCzL69eZ5aENPiwn81cuh2Fg6/oAlzY1Y45yhoFeUH7KhkIWmBb/zbe
	mOUUgxpdEC86xfCsQchzh3WOyBWEEQEfFX5J5CBs3vT+RNt0WqiQylZ1ul/jfgUk
	ePrWHqYlZPHR/DpWsPdnQaRT56ykW8+rqLUnKmEJvWFz2xJPBDJkYGTyl15CDJ9A
	qheWYCtmx7mMXIRVpjgwsZGMVlVNoFRF8G6CYedQ0NKyfX6P8QKQBT8h93+v9Rl5
	rBcLt9OJPSAz2fwahhouDyWgq57fUVb1njA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjks75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 11:36:27 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57CBaODP007939;
	Tue, 12 Aug 2025 11:36:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 48dydkvfp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 11:36:24 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57CBaN6t007936;
	Tue, 12 Aug 2025 11:36:23 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 57CBaNvj007934
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 11:36:23 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id D8D17223D5; Tue, 12 Aug 2025 19:36:22 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH 0/4] Fix SSR(Sub-System Restart) issues caused by BT_EN being pulled up by hardware
Date: Tue, 12 Aug 2025 19:36:16 +0800
Message-Id: <20250812113620.3135226-1-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX8RFQH6orgeia
 vPqxRn7GL/x9kpHtZ1NAGFbPYVT1hb+Vzl50RShLIhq/mRbvuhq9mpRZF5tmj2q/KIni/nMsqAv
 UVe5XqqyKz4qNxPm1JYDsdzw9BzpsDByI8/+ZdKKiqX/5ZEo79ei4AgPskXEoBpYwdeO7bz7s4d
 9oh5soqFjYWsFw2/7yC/eUXtAOazju9U+7lecVoGsJqXIApr0uUQWtOtcvvDTV/OgUpv8EwW7r5
 Va0Ml2KK6shhmG/jO4IcSavKJNOSXpSs8N0phac+AmEX08FMRT5XSYoiBAb2T1xpSoGO39s1ZIX
 3JkLwJyxwzbRfMEZbfh7FyN5hvlL0es2e9dTMFNzkXMOxFRKmQq2ZQbjm12RFr5wi6e7Pr4FB6b
 kw6GBcQM
X-Proofpoint-GUID: 4cBojP7PceuRmHwqAMSv0oKW7mFZ5iOi
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689b273b cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=CCsBk6LTjx9FGpkNJm0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4cBojP7PceuRmHwqAMSv0oKW7mFZ5iOi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

This patch series addresses issues encountered during SSR when
the BT_EN pin is pulled up by hardware. The main issues fixed are:

1. Timeout when sending reset command.
2. IBS state of host and controller not being synchronized.
3. Multiple triggers of SSR generating only one coredump file.
4. SSR process failed due to tx_idle_timer timeout

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>


Shuai Zhang (4):
  driver: bluetooth: hci_qca: fix ssr fail when BT_EN is pulled up by hw
  driver: bluetooth: hci_qca: fix host IBS state after SSR
  driver: bluetooth: hci_qca: Multiple triggers of SSR only generate one
    coredump file
  driver: bluetooth: hci_qca: SSR(Sub-System Restart)process failed due
    to tx_idle_timer timeout

 drivers/bluetooth/hci_qca.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

-- 
2.34.1


