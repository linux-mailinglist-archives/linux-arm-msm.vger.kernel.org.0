Return-Path: <linux-arm-msm+bounces-65293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A225B079CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26812172E84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D914A2E36EE;
	Wed, 16 Jul 2025 15:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMKWZ2Dg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B544233D9C
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679694; cv=none; b=h+4JkpircYbByI0Yk1vqdchGgBOjSLZ4IsKI0AzugBHLhvUBg5aawJA8IBZdioGVge9Ql5hfKSjxMIsvg8dnfzltwtzH4qYZIXdtv+GObbJLItUkEErehLwVS2h998uVbHoevox1CpWUHHK6yGwaXhXfuK6cyb9R8BTc55v+q20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679694; c=relaxed/simple;
	bh=HwJpo57RFu4YKFi1G/WbvBeaj5ntOXvHLOhM/OG4UqY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FGY6aM2+PJa4wX7uCuc67qgbsfv2xrfprcjt8I/p1BhtNKPw6lmgoxp3c6FYr4vDVw88w3Am6t916RV2PV0DH02jInA+pXdsOx1HkxAEwedvSq0Q39x+E1LjE2wlE9um3hFm3ifLdXgM1GEHoY104/TXqnZvd81u2Z3nBzHwxHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMKWZ2Dg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GD4oZa024486
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VZKMCsHazxjdkqYHSetpbR5/PKn4CY0xIoo
	KMOHaHjA=; b=pMKWZ2DgSADpm8HEqZuibDX0UBDDw9AST1FpgKSwjj2Jy+95/dP
	2NOQQMe0iNEtHHSEbSh81azFQUpxNV6zwu8hZMJTusGiygCOwVl0i5J/mjiRewY4
	CNmQWEXPHz2aPXV8xTEsqFPFJSKQLaTKixIU1HkEZoaeDpuxhAJfkhPlBOW4pvEG
	QzOj3qfpixBxJsbJw7jiS2C6iOFadoSo6s2XQIV46Hv0RF5kQcAaXVfSVAR0QAGY
	Mhn/X2XhSI+9HY/QaF4vYMGlaJO412Wt+fLw77k+u2Y74tJMDlQe1cUhCqU+am2W
	oMX6vhRWGgSdB2okQax3i0rgrN95bYZKWHQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpff5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:28:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so54797a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679692; x=1753284492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZKMCsHazxjdkqYHSetpbR5/PKn4CY0xIooKMOHaHjA=;
        b=vIWhT+qupnJR38/FU0z7MHC6wxAJYKtay/oqsLvMxePaqU2tGGIvyi/eZ/g1P0RJnh
         0iejp7Dp5kGPQ/BGWlu7+dxWfrjnhGCQEK0zT8TQwEq1ZSLkuU6ElMdH323T0NPbsoL8
         MuGLnsuD7qqfo2p7ebXuM3LtOxNRA+pgfVdP5sJZTyBF5f452YKLVMn1tIoprVhW4JkS
         y1Z+WsAgk7CBebU0dXoOaVCt4iMMm7sNzSaiOl2WBBs3r/24sBXTtXuUFped/Qxyf6Sn
         dUamf0vaNNhlKu+sylvRjSdLz/lUxmhk8ERhWVU5mW45WZkl4AruB2KBoLuANJJLxkrY
         bM+w==
X-Forwarded-Encrypted: i=1; AJvYcCVd0d5+fG+iTvQJhsWtluK0OI12AbTcQCIrUi6p1vhyXGO1WsGMSnrzdnyHsuVF6TjKy+5d4aSdr1ugbws7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/m+uwZ6eGqI0yUqMgFfHGq0BiflLO0eLCMzYcnT8e01gHocRN
	6XTcnnKjWla1AQna3pBd62Ui9IV33q06ypJJAYYmwiZtGVIKX7TUJiasDjySNLcHyLik1Nep8/n
	zf00DtKTawFkjNdLBIHMxoidA+NXwAFleLKaJlXOM0vNtJVSLvvTLExxSMrha/T5pRZ3p
X-Gm-Gg: ASbGnct4RZr4jMhVyLLGzBLrcbsfXomNi4nHkWRGBfA4FSsbI1aD0P02XzHz58SHIGI
	kHnfLfRKr9Bi8f93DDR9Xzwbs2bew1aKy7X8pGtbJqb31kZ3t5YnUUjQfUhJ/FfhLnYdAZ9WHPt
	kZtCvV7MZVljdAK4Rn13pideUsVnCxK4zvWWZ0R9axheQ8DcjYt3kkKRRZ4h4PP9uCQkgyHhbuD
	vngBf+Pb/nLo2E2WtJO8CbpDw0eolRY1NcwLmZ3sYh89Z5ls5A0T0rMX84dKv5RdoVGJ2/jr0uY
	0USTY0ZDgzeoEOELQBmshhENVh2B507FVafFFiG9uVMe1WhvE5TwtmE4AelweuwLYSh3CPrpl5Y
	Wh3Tavk4ZqDDR2/gcgRggLUdgZAkZ1weZZFJexwuS/U6YZUwNtjWURcULdYoi
X-Received: by 2002:a17:90b:2ec7:b0:312:eaea:afa1 with SMTP id 98e67ed59e1d1-31c9f4389ddmr4109793a91.29.1752679691813;
        Wed, 16 Jul 2025 08:28:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGK4dc/pwGVIwFcWXELIY47gNpp4QXWUC2QB+vNktvv5F/caCsYlOFCAErMO4+m+GGA3ZhrXQ==
X-Received: by 2002:a17:90b:2ec7:b0:312:eaea:afa1 with SMTP id 98e67ed59e1d1-31c9f4389ddmr4109750a91.29.1752679691396;
        Wed, 16 Jul 2025 08:28:11 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f20e87bsm1688563a91.35.2025.07.16.08.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:28:11 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: robh@kernel.org, lumag@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        ulf.hansson@linaro.org, konrad.dybcio@oss.qualcomm.com,
        quic_tingguoc@quicinc.com, quic_rjendra@quicinc.com,
        kamal.wadhwa@oss.qualcomm.com
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add support for RPMHPD on Glymur SoC
Date: Wed, 16 Jul 2025 20:57:56 +0530
Message-Id: <20250716152758.4079467-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOSBTYWx0ZWRfX+R0G2bLKelpn
 0oihbSMn80ZTD0V1+s8XO/FiGRSITa6c0E/aimB+R5+jbr83ej3unq2lxsMtPj64ACeVkplunEO
 5hHx7KS3fPp5GwWHPn6W6pzOqKZYSCyXw6NHt+619zBih9x2KZKo1TJCWLlLgGL+5jAlYJyaWpA
 /TmXRMd9yHh76Aro9J62O3QEBe8O4qMabkipCY32gdRpBRLm7b4NY27YFFLv9P0uko26NmVORnR
 HCRDHZOVe3N+uILEcMMrZiZhij1HcIucYt7ns6fR9ya/2M++ro6Dcpl+6OzZo6HjBzfyJdqguO2
 mjlJeH8Zx6w38umXoROUZYpTl+SR9CFMageQ3FK41Mt/qAxZFwstidNtQpljk7h0WrAaJv44B1I
 GZjf+4NiQR5wPR2B/rplbpTnvZmN3Zf6wn5gmstD054339Fz37zr8l066cGn4RZjJK08/IC9
X-Proofpoint-GUID: XcSiYgRypUamy2qv2sWEwpb74K2O76xo
X-Proofpoint-ORIG-GUID: XcSiYgRypUamy2qv2sWEwpb74K2O76xo
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=6877c50c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=76G38qL4IpClrheZAL0A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=889 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160139

Add support for RPMHPD bindings and driver for the Qualcomm Glymur SoC

Kamal Wadhwa (2):
  dt-bindings: power: rpmpd: Add Glymur power domains
  pmdomain: qcom: rpmhpd: Add Glymur RPMh Power Domains

 .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 drivers/pmdomain/qcom/rpmhpd.c                | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)

-- 
2.34.1


