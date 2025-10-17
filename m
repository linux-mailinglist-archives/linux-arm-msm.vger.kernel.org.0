Return-Path: <linux-arm-msm+bounces-77656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15855BE5E34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 02:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E26819C6653
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 00:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5031E1DE7;
	Fri, 17 Oct 2025 00:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LJJhu8ju"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A9E1F19A
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 00:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760661039; cv=none; b=mE8+N+d4qxuDgxQpLJrkj5DzMspubjE+piQs7mLQdoeesYSt21jZ5aA7prZz+YMyZBlGNrsI1FIpWcHK6lJrcdQwMcbKXtVJVTx0nGbwlJZcwcMzEzEWfEu/YUE9xK+ZVjtyc5PcthGETT0KMgzK/sFXLSN7MCnV3O/0OJ0Vy5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760661039; c=relaxed/simple;
	bh=plPCRytJPMNMkedqxfIhoirrL3iZbMoYA+6Lwx/N7BE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ja+wGSAwYDDgvRnCSqgAsd1Wwd82x9z99h4q1Phymlh6O+VpnLBDSwSnYTr5H200QGMVGvj103N3l6vTrVXZza/rf7IxzAyri4xbgiQeJgfFoaFsWddffFTbdk2V40fgElvl8evzhdg6O8ssdaoZK2zlFN+Q98RSG9bfLTUFke4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJJhu8ju; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLTRd025396
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 00:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WhuBaQ0vD5RlijFZMAJ7wtP6QS9Fh1//v/3
	i2yHv/fo=; b=LJJhu8judZXWCezkRLFmztBubw+tbQEn1qRtNVPWY0kvMoku4UV
	v9hYHx8YDFKk7UmCwQl07Q8xnSYHboAVRjDZh0pMKU4meF+pZuSOu76YbSceV907
	JyfDDcKSqNDK3XzzPNV/M3o4VIkT1EucjEulDpmogz8mHG2f89Vz1KLhgy9SayPy
	VNDaGpE8OVvR6QMsUp3KXorBjRL/zoB3eIGGm5fGRg8E7NMICjw6p7eib4yvmz4r
	iHSpP/f3u5CfqXYY0SJVRusMACCe4XfuCEYncnTyna1lqB0MfBnSfNithCVbqO7x
	sp9B1A/tM+xKXNtaPBCm/oCzkLvuHnZbDzA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkj8pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 00:30:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77f2466eeb5so1620139b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 17:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661036; x=1761265836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhuBaQ0vD5RlijFZMAJ7wtP6QS9Fh1//v/3i2yHv/fo=;
        b=jVLC3zESEiuipq31GsxPXUXo7rtOBb/HfbNDH1Q/3AQQ2Kt0/ikK7Cllh3scMgNay8
         TLQBTzG+V3+8IbC0U7iJ2gwRc6pEfF6FE9YbvvUMp8h79aX3JGnUJ8ax3JLTCwBnT6/M
         wBYbFYdiYQGsjVqPo6DGenk2MqwS9US3Y8Q6lxxWeep23mYtNHA3Nt8A/KaZF/JfzaeU
         Bgvw+G/4ANWBIGrgkhOj2Ebn8S1dMWr1q958MhowBW+npEpXpX4Rl4a1r0QX8oDj5JVw
         nGJ/QbHd8jPtjLhQ3RIFP8IZmas9hESUsCOPthYIboY0O126Aeh1CF2uhzlI3JrUjeau
         Hrcw==
X-Gm-Message-State: AOJu0YypYZ+pBxevS69jyLGREVuJYh12DpP+BerWny0kvsBO4/MBHcQt
	8KepF7/hEQJBjUh/s4CGXMvUMLiCBHyXIxiMShvmF2GOpPKELIF1DsIMAv+8hAB+odXxwCejH1Z
	CfzDgjUxnq0cp4LsQbnfdk8gHiV/uVRNflBe39ibu+7VY3KahoWiw6OotvKi62CqIzTmF
X-Gm-Gg: ASbGnctY3kQhdv7dA1ixkaktvct0dklIdC6tGfWPEpGJzlJNqBcFWzGHNvLmM6I4ehi
	nBwXAGzWOfiS4ZezvqHzeKeNfdLN+MJcYA6uYHLX0YHVI+oMIvbTl//KzArTyUClsn/1LUNe693
	6ik0BOk23gUjUc5/VRO+jWDTe1y3vfJ8/FRutcH7vvz+Oj4iohIq+EFjNT/79ZxqUS2k1PIdypy
	ogdNGSyKyxB3pcZwBFAaQhDgHry670R6xCDbLWtmyorpZvesWCt0uJSTHsAKM0vTACU7HheNHoO
	+l+9zIEk2CDEfxR+s/d1XT9txLhYotnT92oxjU0JUvDhNeCnj/24W0QY2h8mREFBbbnV3LWpLju
	XevOnu+iQc03uGuGtLknsZZRBe8MLHdwMKxuvgN9EZPJU8AwdQgQMi/mDRJT4/w==
X-Received: by 2002:a05:6a00:9508:b0:77f:4c3e:c19d with SMTP id d2e1a72fcca58-7a2208f14b1mr2369510b3a.12.1760661035561;
        Thu, 16 Oct 2025 17:30:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGE9f0Yv8LO/RR0RoaRlY7SCaHq3pVc6vgSKnvPNDE9IgXwyKGCiHBZIwanOZsjZ3NSJukoQ==
X-Received: by 2002:a05:6a00:9508:b0:77f:4c3e:c19d with SMTP id d2e1a72fcca58-7a2208f14b1mr2369469b3a.12.1760661035083;
        Thu, 16 Oct 2025 17:30:35 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0966d7sm23613050b3a.40.2025.10.16.17.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 17:30:34 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] soc: qcom: pmic_glink: Add support for battery management running on SOCCP
Date: Thu, 16 Oct 2025 17:30:30 -0700
Message-Id: <20251017003033.268567-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -Nh2w5Oeor1fkaYsGcsJ_vg3Sk6fPAEu
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f18e2c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=K_O0-d9jgD1I_3XzafcA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: -Nh2w5Oeor1fkaYsGcsJ_vg3Sk6fPAEu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX+QDXLWBaSr+F
 Bly3cpLB26Ec67tA/7OBR8G4Po1v+MRSuFgVn+wM4GgzOStEx3w0tyFvDUxUJsJoIDaYgaZhTB7
 4CPbLerfULG5QgMVJSNRCXrxbORyCfMiZqeko3Ed3MGgy0RyPGHX+w5xP3ElihSEafxcc9G6nWp
 V1trQMjNLklZ1OscM3lZPy0zxjY8Ctx/NqQKSObbt8PMD+J+TqPN/Bqc2M7uZGAESJoRNjvbi0N
 zWu3xkmIHT41AqxFmJJqrjQtc0koZ0f2zsvKV+QebfS834+OKPlf6+xHcx2l8N+D1vhpBj0X8bS
 MaVMq4yPb3zUs7+ieNqrCq8arFy4tdM7PGXpm0867SFe+jya4Hp50UHNKlh5+AJILHpYO1GHZo2
 I4PbXl8UGPQN+cEeO+707m2yoPHMrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1011 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

System On Chip Control Processor (SOCCP) is a subsystem that can have
battery management firmware running on it to support Type-C/PD and
battery charging. Add support for devices, such as Kaanpali and Glymur, 
which are running battery management on SOCCP.

** PATCH 2/3 - was picked up in this series and prior conversation can be found:
https://lore.kernel.org/all/20250919175025.2988948-1-anjelique.melendez@oss.qualcomm.com/

Anjelique Melendez (3):
  dt-bindings: soc: qcom: qcom,pmic-glink: Add Kaanapali and Glymur
    compatibles
  soc: qcom: pmic_glink: Add support for SOCCP remoteproc channels
  soc: qcom: pmic_glink: Add PDR service path and service name to client
    data

 .../bindings/soc/qcom/qcom,pmic-glink.yaml    |  7 ++
 drivers/soc/qcom/pmic_glink.c                 | 74 ++++++++++++-------
 2 files changed, 56 insertions(+), 25 deletions(-)

-- 
2.34.1


