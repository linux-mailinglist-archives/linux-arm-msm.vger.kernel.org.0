Return-Path: <linux-arm-msm+bounces-68870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E682B23EDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 05:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E24362769A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 03:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9514D22338;
	Wed, 13 Aug 2025 03:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mmxTTExi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031758836;
	Wed, 13 Aug 2025 03:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755054974; cv=none; b=R8zj5U5cQiWJGxgmEWquKbrjIKhBENu7pFuxO9taZ/xrZ+Gyr/1XuvmX76YurYXUpJUsmvjZZBfnMum2VyJyzfvAtCAK48QltCSY5pTqRkTel/oUYi22iOl/D+EBPFFgnlZti4nsM4Xprcv53USYbOdUW7v+1m1OdqprtUGZFcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755054974; c=relaxed/simple;
	bh=Q3CAbHLCBVDyiOb5ExsJtxT9sJ3zARgcXcaVYKZzXvU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AIqfsMFP47RSzJ7xt1PfaSMzjJGNgRmn2Bco9/KUqbeL0VqT+6Wea0tp7FZSkZW1iz/cfcKvBEaGRhd4MH5T54+LSoWGGdvN+lykdSf+wxUyT/eee1G7LC52/6Vk3SReEBEkMS5bCQ7m5xKogmBC2VkjaN5SfVGw6fCFPYkjbV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mmxTTExi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CLve0u006378;
	Wed, 13 Aug 2025 03:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TyQ8V+iTVg28IwajxsYPxQLlMjOJohRSq+X
	yP8tZTpk=; b=mmxTTExijIFQYsicbL8lvgnQMkPEPCdEMoEeq5a4yw/WZykM3Wd
	7MiaYPhO+NM2x6HQ8sCFYsNJc+g4Bnv1C2ZKYH9IpvBMUvFWjlIDTrmN3PQw6q1e
	ziDHegvsV2V5lO/U4yhTzSSgslyOWps1KIKPFDvr6aEbLRTIqeSa1LkxoiEhwkWk
	bQTLGc5jXqKZVf7gm7P5YVVQ4REnZVjREuSfhIlEN2G3wjY+LiZh+2MSXJji0092
	qkAdUcgMgFn1TbWE0prHuns9Yo74g7nvBiZxbhHchjBnQOuXJJTYKZ1yEfczq0VZ
	xcPlxaL2dHazuU8z0DnJo/VXfZ0v+Va9NzQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjp2yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:16:11 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3G9ik023766;
	Wed, 13 Aug 2025 03:16:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 48dydm0d2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:16:09 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57D3G9c4023763;
	Wed, 13 Aug 2025 03:16:09 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 57D3G85a023760
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:16:09 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id AAFCE228FA; Wed, 13 Aug 2025 11:16:07 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: quic_shuaz@quicinc.com
Cc: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Fix SSR(SubSystem Restart) issues caused by BT_EN being pulled up by hardware
Date: Wed, 13 Aug 2025 11:16:00 +0800
Message-Id: <20250813031604.3824329-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX9vt1EYBN4Y8q
 eXMQXo2AgGxHfz7bzGjTduxDmlL+nmfzk/YUuTqZsvvdsayeoJfS6+qphutbjJHqi5KaDXLmsfw
 CcQFU2OHmJArV4Gfr4QiwoJJ+rJj28XHhRzqZSxGbi97waVf65c23Yo23uF/RwoJtNGpd/4OHbi
 k0RkQaEZx0u9aMdEoe1/1ptNbQD+Ysx8lDhug0V4HZq3bqEJf1YSNWcRzbbyJBwX3re02k+OmEX
 Iayd72ffGFsa/FXeEE9Hm8+ol5cLDQLEJoTysPHS9W+1R18XK7U3p5G8Em/jn2UFNq89YE+OZna
 x5/uWdNh9eYpaVH636nUW2l17orWQwVSA2m3DMqE6Xvnbj86i+Y0xVzINEkOHOfmYl4x93VM+f2
 PDwkNTyo
X-Proofpoint-GUID: 11e1wfYqZpUlL31j0zHJi_Uyr9t1APnV
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689c037b cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Dei6p5SHAAAA:8
 a=pGLkceISAAAA:8 a=CVKY41Y29sSDTK7O-P4A:9 a=TjNXssC_j7lpFel5tvFf:22
 a=M-Yerj1wOn-OpK7r_3ei:22
X-Proofpoint-ORIG-GUID: 11e1wfYqZpUlL31j0zHJi_Uyr9t1APnV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1011 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

This patch series addresses issues encountered during SSR when
the BT_EN pin is pulled up by hardware. The main issues fixed are:

1. Timeout when sending reset command.
2. IBS state of host and controller not being synchronized.
3. Multiple triggers of SSR generating only one coredump file.
4. SSR process failed due to tx_idle_timer timeout

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
To: Marcel Holtmann <marcel@holtmann.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Changes in v2:
- Update commit messages.
- Add new change to fix Idle_timer timeout.
- Link to v1: https://lore.kernel.org/all/20250715051618.724475-1-quic_shuaz@quicinc.com/
---

Shuai Zhang (4):
  driver: bluetooth: hci_qca: fix ssr fail when BT_EN is pulled up by hw
  driver: bluetooth: hci_qca: fix host IBS state after SSR
  driver: bluetooth: hci_qca: Multiple triggers of SSR only generate one
    coredump file
  driver: bluetooth: hci_qca: SSR(SubSystem Restart)process failed due
    to tx_idle_timer timeout

 drivers/bluetooth/hci_qca.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

-- 
2.34.1


