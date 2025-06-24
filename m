Return-Path: <linux-arm-msm+bounces-62254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B4FAE72A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 00:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83639171D9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 22:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900BC2185B1;
	Tue, 24 Jun 2025 22:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGU662D7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF12025B675
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805741; cv=none; b=gtb0oxGYVloloLq0mjl9IZlykEHhb8rQBSKlfu7gaUd3eShUwItm+NIrxD0vDYoa1FOpc3MAPPUByFR0GyVF33PVZOiwoeqpamRGiL6qv1TEMJ9yuph+qdBHA3ajg67MiF/fAzFklmcpe9DcUKI72ZVPY8AHCYvJdJQYm23TatE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805741; c=relaxed/simple;
	bh=GKgbBRhzEz04QuaakUJXbQIvwgTsuH+O20uET/6koFE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fK9lFu0wG0MsjmaJMHvIzmxyvkyIwUDAZKSrhWX96ofXHQJpnL5UFUn51832PrJ56wMI86HI21G8H+0sgJe8mmMHeTvHGPt2IWtniJrRsyS7vV47OkcAszpiwCpZU5y+xf2JHkOHdJai2iaKOhyBx3KO2l+cuY1/0gS9dKFFnE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGU662D7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OG9jf3032017
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yDujKkp9EGhxEGJXr7U2EwrKJpZFzJFRRW0
	Cx8wz8PY=; b=DGU662D7YSlzrw/iONvswLf1zxNUXnsgS/u4pN0xNsYT05C45PT
	WBbqyTfcnKeLnlP8JRTWm+uOcEBxIKDANO+QLVudbEpswX0s5qWVxXjhwOrT08w+
	LDuc2orao/xlMO+RVvJy6lPkcHf98daoQQEdRJX1zj7ude4RKNK3AdCmcJwArhjc
	PYcZNvMnpzWeauFPBCIqLAlW/InGT5tvG5uTuDk2dAiiP6nr1osHQNzbygXQNlKx
	LRd5brwO2eYLoknpbFSR03THdMHOR1I6+cJU44E4oGFZnPKuDOHgSY0lYyXkwweK
	2yaQb04fJkCPdb9wxbhSNSLt4H6V9F+bS2w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4q3fq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:55:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235196dfc50so2514525ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 15:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805737; x=1751410537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDujKkp9EGhxEGJXr7U2EwrKJpZFzJFRRW0Cx8wz8PY=;
        b=mnyEEcAu3J28wlM5vDfQPqyNXDVzw6/AlaL9GDaTsIDti9IcXnqwVc1USjDIF8Fd0y
         qit3G1elMRyIFRlwnE/eve9y//yzHLlBgfkv3C1iB66O8MAQl9CieIQn/7pa4rpW/rf9
         MZ6WwE/JzegYa/PAuhBjyHoUvWe1OwWAZtl2ZjZ7e5s/lsZsaKHhBtfXkhOVCw+adhwU
         yl83pYmTZVl6o0vYCAiQ0YO79vcgMI+cQaRQNuS7MsxK3P6vGUdRVysoC98LfVrw7Q0o
         BrLhQgMVsMOSRChmQPpk7Agw/z0DwIWdk9qruGoRiuHyuGMnY2exFdtcxNGUI0kwDnMj
         r7ug==
X-Forwarded-Encrypted: i=1; AJvYcCVP2xxeI4q1TmOzSgiCwmWBhcwYT/tCbHyjYtmAcTGG35g/lTuZ1/vaq+TKG+qTdgXCtwuIrtnWWA6cnLgj@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ9ItgjTeYS9oYqyhlOOnxT61OZ/EKsRIxkmWobtc6cYyCJ5BO
	ja2Sh5mKJbJHAmaUA81rRwn23g7JmOQUk51IFnGvGSJG73aL3Rd6QR6Ay6nDBYUVzY7UuU1EvOn
	x/04tlXcTf8GYqPgqC3T7Trp9bR0y78Hn6TzS8eFwdR1l7nnW+5/TELoI4u1w4oltPDFi
X-Gm-Gg: ASbGncuEtEaZ9cRgQgkgXq36C0HWqLegHxTe/6oMTirfy8wO3x1URW8tcXKXVI1SCXk
	AQRvTvJhngOFseUc7pn0hLaY58P0dcyKsbNPqyODMA5rQ2KHZg7FQVXOznwYVm9gVWB64729zfB
	BiWIGZ3xuRCIJnIOS8VMCq2QReiC/9OgI3rsGomtKgnbTX6RxoPVDx40MmRJl6tDzoq1SDiqsa4
	nIabEbUXNXXgiKlGx8jDmHTNQdq0fNDf7gry3YKKJoAIFSWSb1FLeT8GFSOIozW4eCBmMnxzxPG
	gWH4P7yJu3uRazKle2BToxYgPyFpSBBk8MFWhM/NVBmPZca2WdGw7mYjD40k3orQLE+vMcRweoH
	ODRykYyEj3Q==
X-Received: by 2002:a17:903:1aef:b0:234:24a8:bee9 with SMTP id d9443c01a7336-2380243286cmr84876725ad.4.1750805737369;
        Tue, 24 Jun 2025 15:55:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZQUxECsK0cz7E0Wf1H/BLEGfMGaA5fxjMnQoJMUXwdAmehx6B3JOrs6qWDXwa6Rp/SniUtw==
X-Received: by 2002:a17:903:1aef:b0:234:24a8:bee9 with SMTP id d9443c01a7336-2380243286cmr84876515ad.4.1750805737005;
        Tue, 24 Jun 2025 15:55:37 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53a65adsm154949a91.11.2025.06.24.15.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:55:36 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] soc: qcom: pmic_glink: Add support for subsystem restart (SSR)
Date: Tue, 24 Jun 2025 15:55:33 -0700
Message-Id: <20250624225535.2013141-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685b2cea cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6IFa9wvqVegA:10 a=RMJmDFgMWbxiTDYyVGQA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: W6xQaISDyO8aP9S0r-FQB_hdHdgiFv9l
X-Proofpoint-ORIG-GUID: W6xQaISDyO8aP9S0r-FQB_hdHdgiFv9l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4MyBTYWx0ZWRfX2EO/GWxSsCsF
 EYPmsk6mkAYBPFlaDmADvZZEh6YMVXvkAUXnK7v6e3YVrTOivsCgjKjaCDxTuLV+3h8MJRlkSBg
 ZoRUsDFcNFa31ul5PYxnb3bCfmEL7d9p3h13mg++5N+Rt1y1Ptopo9W3aQwrPh0ZTW+O/l12fde
 0bVWtIU/hxfvr+y7IpnWnWvPR/4CM5E+UHiTN1YdudkgQYS60/Mn7NMWmvoTmOfLhWh9Vu+HFWG
 A7yGaUTmkStX6kO5E7767MdF/3QRB7LW0AHgsEhZNo6/jcis9e4vcgGl1/LEVWQFUYLkPUEhjwd
 1PqQ8GtGoxhlfE8I5uGvHHRNgc4AL+Qq7CyuJNGwHqRVNFMuq2mYEPUZaqueS6591yg9JTgxitm
 U0t+YqecLskYTN58TiYtAucNLVvg320UqdX9tmclYlHQjCmShNasbjg/Hv1oFWBKTKbkmVbo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240183

Add support for PMIC Glink subsystem restart (SSR) so that PMIC Glink
clients are aware of when subsytem come up or down. If SSR is available,
the subsytem name can be defined with the optional "qcom,subsys-name"
property. 

Anjelique Melendez (2):
  dt-bindings: soc: qcom: qcom,pmic-glink: Add qcom,subsys-name property
  soc: qcom: pmic_glink: Add support for subsystem restart (SSR)

 .../bindings/soc/qcom/qcom,pmic-glink.yaml    |  4 ++
 drivers/soc/qcom/pmic_glink.c                 | 43 ++++++++++++++++++-
 2 files changed, 45 insertions(+), 2 deletions(-)

-- 
2.34.1


