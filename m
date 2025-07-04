Return-Path: <linux-arm-msm+bounces-63726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43274AF9851
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 18:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 723734800D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 16:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B4B1487F4;
	Fri,  4 Jul 2025 16:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M769Qswx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13622F8C24
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 16:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646721; cv=none; b=Ud2EGmIAkyjeAgmqZsQTac69bcElXYEPx0DH+qdNIIYTa3JhOrWXLSRaZfx9++nru59/UtX4nxLOyg1rOQTOkfaSVZDF6uJh8uJpsoSmWyJxDCF+3U5IqKSN0me9BePGqH5gqIZHmnPLsjEoyps0XJd+s5glEKpRuAHUlbtPu14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646721; c=relaxed/simple;
	bh=P/5XWsuuqMDqR+GLmerL71P40xuUdfPA8CFQpOrn3/A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mMyUrL0aPE+JBUWC7mGW0D68LqzwX4JzC1PEXFCqN1dgTt9efHO02Fn1CTh9MSylpesB1IwUNPdhlQihtVEsr0hlS1J3qBJKeeKT2/aAhw2JgOZj5tu2Pt+m5RRUFo7B1A7b9pr03fKwQJZ+UAqoZGFjD6atXWm2DoblDjOsBjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M769Qswx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564DQYix007050
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 16:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pomuj/cQkgzD0OUOqyvuhg
	sunp4U7azsh3q60HaOzhQ=; b=M769QswxAiVvqsD67zoEryy3gtauzpiYXdg/D6
	GFVNMgIOBWklhT+7Tsc4W0lT79Vf6+wjlpus5Ma2GIIXeVbcYK7PAkoER/PM8cKF
	iet+cxu8NC7/ZffkL5RktlueG50XgCyTBkoEdw1Dh/n8J/kQwzfVHth6mx3ctHL9
	v5+kFd7EpueQo8rIS6PKBCVhx6/JQcUnWBWqRHfA4liGedJgm3u0U0z0H7UsQpzp
	bVlyPO2sFEv71q/V3O0yFhnvMP069vZRf7ZF6bVdBPIxJ9AgsvJYd19iO0zdhRWU
	hSk4FO71voCs4rjLfUAFloMGGDEDgy0z4dwhmOztr/2XIK6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5js194-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 16:31:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d40185a630so173988785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 09:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646717; x=1752251517;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pomuj/cQkgzD0OUOqyvuhgsunp4U7azsh3q60HaOzhQ=;
        b=HGfpTPygSLqzuPKW0HlbDk6x/r/yc4WIfhFAaJq5HOnw4yvwqj15nkSuZ3NfE0KkNk
         h2TXCi+OFy4xYRevRYFAS5qEyBrqxAPLR0u1dHid4C/VwTJ2ukyWXZENR27AHT934xrJ
         HbW17NaRudQuBOCyD7tL2qn+IO1czDxcP4YRdspXHSiGSZT9DqVmNJMyIX7ziG1wHO3A
         Q+BhaVu/s1tkRE+g/iO6fNLANnlKUGGUD8oZQWieZpah4rvxJpKNXGFOvtUpJ19W4tX2
         etOc7uNXWZHkD9Ckgax7mp/Ow/+YaB5wn1hxquip6g0/yy/SIHmwXLWXcfe6m4lBvIkC
         D+tA==
X-Gm-Message-State: AOJu0YxooUd0OkXWv1wh1/8jSZVp5NJKdgoV8UJmqvXR2HnCbtZ0AEi8
	3895GrMyrB8WKV3ydIxv6TYOAC+FaXcC1IghUhW392oo+kXMbdSz7MItZ+0UkK+TZqV2weNcamz
	p86IMXJvTtWJP8Xk2S/eNWoUbsYEl1AAKC7Cvbb924+L5uN4mKisbsZmP+y2CobCbKesG
X-Gm-Gg: ASbGncsB9KG+VO5I/Zl/phTcNdi5Zj/y+TpIwYCHEqn/OisX5+Z2rW7mS6hdJDofZQl
	ZF2r9JVWkMpfEHoZrLYV6m6JU+mbfZu3ARSJsiqQRMW0LtO68Nd98GV4Z3WLS+Ylj8urSncO8Gg
	SDWoFmaDXDkjgezmsW3yfyfJWBRhaQ1SYQ45hny4pkGWOuWJs1dI9DLoS281+SNC0sCRFBHJ1zh
	jhxQhYBwTUtf1N/mpDlQEopVlCi+CchjBDj/WCahUx3xz0tS2x1dqkqwuE/0bBo2l0o2h3Cb1aq
	5DOKslnvNYdYQmVV+s3chILVOkDPPFBbV7nWnk4tyVoEElwDS2SQ8iBfbaVUYEsvDnrxPX3V4Rr
	oqEtzk7kZEvvlA8984heaoX4TkbGcWJQNYNw=
X-Received: by 2002:a05:620a:450a:b0:7d5:c45f:c3c8 with SMTP id af79cd13be357-7d5df0ccffcmr335999585a.12.1751646716968;
        Fri, 04 Jul 2025 09:31:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU1hI88kRN5deziiAv/Vi3VKoh+SdcIIBtiyE5bqnofAdqmJ/2dvCk8nIcVO9jscTO9QwtdQ==
X-Received: by 2002:a05:620a:450a:b0:7d5:c45f:c3c8 with SMTP id af79cd13be357-7d5df0ccffcmr335996185a.12.1751646716499;
        Fri, 04 Jul 2025 09:31:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1af83102sm2813571fa.6.2025.07.04.09.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:31:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/4] dt-bindings: display/msm: describe MDSS unit on
 SC8180X platform
Date: Fri, 04 Jul 2025 19:31:52 +0300
Message-Id: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPgBaGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMT3dyU4mLd4uSM1NxE3SRTs0SzNGNzs6Q0SyWgjoKi1LTMCrBp0bG
 1tQDrvXPlXQAAAA==
X-Change-ID: 20250704-mdss-schema-b56a6f376bf9
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=P/5XWsuuqMDqR+GLmerL71P40xuUdfPA8CFQpOrn3/A=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0YG468fhkcSp03tV5iquzegXb7G/dPKhp+x9lUOsxWVZ
 zoxeoh1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiTpwcDCtqF3t9UcuNlPtZ
 3n9IbsmC/UcunFH58WVvukDWLTN/068LsxQta556ZTU7/P7w6+Vm5R+iNzxTXcrWT7Tp3RPReZk
 jkaW4ht+rNZBjbsCC9RpMO5IXlsbsW+91fpJHZcOv5MqU7tpUk0XOwWtb1ud7f95tqrnbsGlS3l
 zuv+sjpYVZCzT3HjBRPtv/uGBWd2JIoMS6Qn/bF91aSn3PmN6zPWNlb82VPz7BPoUz1erAgxUG9
 2LUM28IyvruYveRvG7fcqyp6v0s5irTpbMdbXLt2RccSkleKfEg6WZXvo+8++9ATYe1b7ibd0Yn
 L1AP/6Y++d3kOctWLG+PWcjRzD+1NrKi5Gvpk217Df8DAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=686801fe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=MtNW3POlok7mfpsrGdgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: TCvm30uxVaaaTFGSrn45ET2mVcQQIm0l
X-Proofpoint-GUID: TCvm30uxVaaaTFGSrn45ET2mVcQQIm0l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNSBTYWx0ZWRfX/q295mEQqHMz
 uFleDBNS53YWw+TpKxvYeFnM+Wu8qKNwolstFoDmBcxGDk5Ihchh2Mrxh/hk5ZkWoFOHVVnlKM6
 PUXQWpgHNJmF9mHBxP2tPr8Q+cI9lPuYOzWE5coR71uOpZ+AToIc/HITcXbmBtr/59zPq+dADop
 avQ3mtC1mL71zX9jl4rzJLIKncDqcgSOEJ2y1eMHlOJjHofnGivirEtrGA0Ao+Z/hgKo1iJhgpz
 C4eFrOur6LL5JBg7CdIe47K41NO8rku2PrVGLT4al6K7aWBnHSTYhAF9JUFwtegqWIYnmcdO6Xb
 0RtrpGtKPQ3jsfApcQ8hs+Lg+lKDCYtVmixbJ9bTlSwfdNu3yu4duijcEtv2fQ0KMHka52Uva1f
 0ClwvmI1sLfAAf2cNenZHde/EOiP2K1lh9quviOnSB0XC2zJdU6ML2/Gj221HWnkx+ODWsRG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=874 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040125

SC8180X is one of the last platforms which do not have DT schema for the
display devices. Add DT schema for Mobile Display SubSystem (MDSS) and
Display Processing Unit (DPU) and add SC8180X-compatible to the DSI
controller schema.

While we are at it, also update DT file for SC8180X to follow best
current practices for MDSS devicex description.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (4):
      dt-bindings: display/msm: dsi-controller-main: add SC8180X
      dt-bindings: display/msm: describe DPU on SC8180X
      dt-bindings: display/msm: describe MDSS on SC8180X
      arm64: dts: qcom: sc8180x: modernize MDSS device definition

 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/qcom,sc8180x-dpu.yaml     | 103 ++++++
 .../bindings/display/msm/qcom,sc8180x-mdss.yaml    | 359 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  14 +-
 4 files changed, 472 insertions(+), 6 deletions(-)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250704-mdss-schema-b56a6f376bf9

Best regards,
-- 
With best wishes
Dmitry


