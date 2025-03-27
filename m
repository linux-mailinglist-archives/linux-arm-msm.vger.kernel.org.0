Return-Path: <linux-arm-msm+bounces-52579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1FAA728DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 03:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B31133BBB08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 02:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B6B1AAA0F;
	Thu, 27 Mar 2025 02:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHutvdpL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A801A5BAF
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 02:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743043797; cv=none; b=qveZmhS1zxZ7CpiwtutAQIbUUTEruXf9TSsl8nW752xkUjinWH8b3UvosVsQe9UrqNVdhdNwdzst9D6IUYraRqM1OvWi3Uner+5MiyGBv5VqgKHmMJ6Z6XQY3nPWfJuOMMlEMLFmhwmfm1/Qe5uLVmUzWpFniPBM2tvkEeSCcX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743043797; c=relaxed/simple;
	bh=EHLOgzhH6O2Rn7iaTj9DxsI7QCCalqfBeAAtjxKhXjU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E4J/FhpoXS2braQAnxNpbTX6LADXjSL2dgOdLJcpjKftH3oZLB0KJsZGg6xjHKykfyX3by/lpDAU/+YCnEvUIo9hb34EaUpi2nmI6+v0JqIhlkdZXPHoRhVx4hUMx1xlrQxFwrZh/kRD85m7Cxl6ZZ4zR3O1mmT63GEaOZw4WXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHutvdpL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QKIX2A025450
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 02:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EOG4RdX/l1J1UWKeCN8ca/QQMrmD6lUuCmW
	X0hkRM/Y=; b=KHutvdpLqul3Bc70JQhVxWydZqLy9WnaOMTbRUl8wAOgjnaLDQs
	ZCW42Kvh6w1UNQSYMOdCnvo74bHhy1K5pZSrzeP/mHoa/su4/DyXvghIo/Q2zeLP
	N0r03DW0/Z1SAYVKIrdd6mYxfutiqwQ9hTBtsMMzetYxmEjMRDqyilavi/ZtMoO2
	fdTkZgfJZ1LBcpPpOKDlG+j94/saRc/Dhbno0M3vV/RrSwAAUXKP3T8OnBWjTdpZ
	RGEqW8eFUNBS5YIOkROPszYA3C6WSkeYwvMAODo1PLPLDSeloQHgr66Z3zUlPPT3
	f24P0Rl26R49kdisfNgk97IZsNUHYI7vOQA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mffcjg06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 02:49:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff605a7a43so1212051a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 19:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743043791; x=1743648591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOG4RdX/l1J1UWKeCN8ca/QQMrmD6lUuCmWX0hkRM/Y=;
        b=XPs2EWa05D5/zJ8gcGVPX3QreiB521Le5KM3lec6E6Lks0Epxcg52khtZKI69IBZ/u
         L/BhNIau/hvrRj/brkvUT7OuRbL3DzwqE/HkHW/orhYUKpqt4TK5U0Ca4uVOhU2OO3WR
         K4Rjfrnr4CSFcxhtLD82X7t+xMKkQyo/7nBSRiapOFYE6DjVE4jTwx3LKs3lkXIl0b1E
         zB7C1+eiWVHv8G6zMa8dkQ/0rw0x1r/DC0ltC08CGpPgSmjvGvq4C2yr/NXd41/+mGxn
         xQgrN4tpVi9KRTz6Crhv4whsNRMqM7IFe+AZJyegtTA89uHHQJblIj295Hb3/Xs4UtyN
         hK6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyQsouH/5KtSxXQ6H4FciiKtTSnYWWs+N2N85+xnnC8sUCZu19416N4ksqtQWOnqwbiXwt2K1v+/rm/WIn@vger.kernel.org
X-Gm-Message-State: AOJu0YyN5VPYTQ1kyA5O59zvgrrRFGQHswg6H9zGhUP2O5YKiMCRdy3X
	qn+fAYaoTl5pjb2YV+tSOYCTugds4go7doX/MBxWlWIAP1OArrD5SXcfYLjkdeQSSrUmRF2/1lS
	rvqcbaMNbaHIPifxCkDxHEuL+C3MPfXb+hc5W6KdVPNsasWq0FZJcbusRw/8Nr6gD
X-Gm-Gg: ASbGncvbsyNeYk4PlJ8aycNoCFVTuqG1UR6RW2j3PCWLUAxpBio6eemVgJEOk/Af+1F
	dSFOomIhm/CX7Yg3iM1uDn2wJ24IoznhdUkH+nf3oo8OCCWDXYzPAF/2/64bfPV/1N82upj19iw
	iBy/Luh7iuW0qQyEHj92fznnjVBZ+Nz0vfPAQ+W5BYNXX/+78r5omHdcqgLd12zO8uIAluiqXd8
	akEov9vajPLCqL0bqLgriyfOgsuk71Ynj3WzQSi7mifYGAT5BTfvQ06S1vpgbPGed/UdzFbmHzP
	RVjaXLsOMz4piXXI4KIOwFgJDJy8QP7RfnXsEldnUUHcaqIatu9ZYJxu+UG6nK9lUGRHeTkt96E
	=
X-Received: by 2002:a05:6a21:3381:b0:1f5:a05b:c741 with SMTP id adf61e73a8af0-1fea2d91d81mr3854467637.18.1743043791488;
        Wed, 26 Mar 2025 19:49:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKIPaRy8lsd7Z3F6l+Js80wTB1uu+1FA4rXbfx6w06EiixINvcfPYB5I4rA70fIfkCmCtFsg==
X-Received: by 2002:a05:6a21:3381:b0:1f5:a05b:c741 with SMTP id adf61e73a8af0-1fea2d91d81mr3854434637.18.1743043791018;
        Wed, 26 Mar 2025 19:49:51 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390615874csm13511878b3a.143.2025.03.26.19.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 19:49:50 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Enable CTCU device for QCS8300
Date: Thu, 27 Mar 2025 10:49:41 +0800
Message-Id: <20250327024943.3502313-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CdgI5Krl c=1 sm=1 tr=0 ts=67e4bcd0 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=Vs1iUdzkB0EA:10 a=pe-aGEEqWberZWJlMgsA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: JoKJ0hXMHabYbTRUj7WKhcogZ63VpQGZ
X-Proofpoint-ORIG-GUID: JoKJ0hXMHabYbTRUj7WKhcogZ63VpQGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=821 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270017

Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
configurations as SA8775p platform.

Jie Gan (2):
  dt-bindings: arm: add CTCU device for QCS8300
  arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
 2 files changed, 160 insertions(+), 2 deletions(-)

-- 
2.34.1


