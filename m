Return-Path: <linux-arm-msm+bounces-82927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1EAC7C724
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 06:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3CDF24E1759
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 05:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B88238C15;
	Sat, 22 Nov 2025 05:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAv1AnzL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WjedWGoE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C2025BEF8
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763787638; cv=none; b=jx70Yd1JZjrduvRtbNoMiOVmCNVdi+ztKAB/ENTd/FMYgXf/bDg50yfDPdeWga6Cu/DZ/kx8jGkS4MyysXhPAnpPKj9XdhFFo6X+QQZtkdY6cI8gKhb3RUc1GAqXhKCGHqHEzKTu2i/DTUwriiFqIpRtQx0UzmcEy5vXFm9BdKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763787638; c=relaxed/simple;
	bh=NGyGdpzeHbDT5s8GtObErQ/1Hw4nUTMFgum22HkJPAE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y+2sRfolqlJNegLFDx1p4T1ojSLa1bWosfT78DqZCpFPRsyjHHPspw3livQ122BJ1JTDHHTbyOqkk/pk0PrSq1/+koNAT4u6HqiJNpmIb2q4BkMJ5WHODbKN+hkrjf/vv1KS+dyDa03eDF7PjCkymbCtCJet1MznYI6GgoeSehk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gAv1AnzL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WjedWGoE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM4YOBe1760842
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CPeVE8lnnyZm9D6CLF+G2qREqfO8+bp/ub6
	rM0Fd8Tk=; b=gAv1AnzLPfhTM+Q8hMfUxxU5X2GTjQz108wnoOoJ9MgPr8eLqBv
	A0E4/Rue6hz5x9Fzwsy47OW9Mc11A6W1FJYr1j94nLRyEMZAWI8Vn9ALpGmGZ9aP
	f1/57mcIDSzhStNv96+FTBXmnvc+OWe0kJmNPEApHnkOgrGUakbR9NN2tsAVb/Eo
	OmWNwoOdVZwmx3t6E9rze64EW7ZCdSNgrfWt5zRvbkedZ09H0BMjDgxF9IBeTZEN
	rVY/McU2sPWU+BDGqZwg1t+9VuSB62GxI4prwSDO7osVqYlUlG5dxUcMBlqNd6IR
	GObA/6Tx+ONe52BwBq7WqP9k9AvNmKPHhEw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak691g1bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:00:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29809acd049so54402925ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 21:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763787635; x=1764392435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CPeVE8lnnyZm9D6CLF+G2qREqfO8+bp/ub6rM0Fd8Tk=;
        b=WjedWGoE12m4N4sA9VZIcjMvfuM4AB8kuUChI5jLXrZb2hIelPdsPdtQb0aX/sbt3j
         v+EwmfGFiikIbYDhEP9bNVf54WeeYV4Li8IFl24jaG2gguuHZF5SbzODsz9xRp46EYwu
         s+u7u2u1+rD3qeCaccUa6iD1UQ2cnZ0eBcdCBcnLlWArFxJs0E7KoJSaEf3QtWMxn0JR
         KnRNDA38YaOWf/PjMUMZumEPDLukgZCke4dAaedcg0i0W6Wp5aBfnqSzaXGWNV0215I3
         ZWSBMLCLMWqzHiW9gfcZEjCUb+7m20lj/mK556WfhzOGTyMohYKLxWnbl8nJZXw5RIr2
         hHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763787635; x=1764392435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPeVE8lnnyZm9D6CLF+G2qREqfO8+bp/ub6rM0Fd8Tk=;
        b=h220ahpyktewBJWlThJfYU97sOUglapDvZHMLc5cSvnZIqba++iBVvWCiuW3oSPVyZ
         09+cVtFEbIOQ+CUdo/yPlWpJOG+I61sTg+JnfxG+SiZugQYCLZCK2hA6oxXHuvJRiWVX
         uRnzfj74Ci9H3I5F7NGn6WEAFb36KKHh1uJNI+vSLeT1b4RAQ2vX3mP45T1acrYT6R7r
         4crvbjgAibP5kIOlDQ8Q2EfeCd6mf6XAhlm1sfRxxYweLUS9KxNGAiklI8AndXBcmg0L
         Rh2y3uKsvRoyQfNHUSXyHoOvXeOdG9FlNUkMRDD42MQx75WT8/7oxwYriuU/DZ0c3L/6
         FD9w==
X-Forwarded-Encrypted: i=1; AJvYcCX8kNug0QGrwXHLt6NzY8438mn4JgfjbBd8B8ab8TeVj3496a12BDz8cXJnFv+MuBS2tAmEz3sbnvPptkuc@vger.kernel.org
X-Gm-Message-State: AOJu0YxOLb4fcmnUJDJG9pgZSbGEuHzJnTs8jVP+tVEVq5incHCloWFU
	lZ3wuvbuCfwT48ketSN97W+l1t0TjGu1mCdPpJL/NLPVOC2zPGs/Rd7COVFLKYtg3Ns3FmiCxRl
	UxmRwYKI+kJj6I2fybKb5dd2UjqfSlSZka3c2lOoUgBsViW5XIfOT9AbPeLdxGCWBWUKh
X-Gm-Gg: ASbGncs+uGs+hoBrE/FPDLLgMuYKuMD2LB0V26DcvfcmFBM28J2aaTC4MMnNjBqQNGA
	XcaD0OhhnZeJEix9Nhzk/5utAwxGtphrDmA0CCHfFhiLueXWIv1a20hCX29xjEL3pOHr5o09UrT
	uWeJz0OhfkG3YM0uy19gpgNisKa5hzF22BaaQ9I1d9XP9qRCoebOaQEqvz4H9bJRb9N/62geDvr
	MLbFJ3h5cRFEADo94uP0VVVHc7xrZEfko6Iz9HC5ZY5b/p2P/U+l1ZFnthmnZ+58P0R06rY5ZtJ
	nnCMmqhUSxNmOOQ89bUl4nDCc0reuCg3v7HdW6uy573Lyj/zYH2SeYyymtvIW5o42x50zB/9enO
	v4Z5/BJcxt9KKLzZRFce3bqtVVJTw59p87hDz0wOPM6E=
X-Received: by 2002:a17:903:1b45:b0:297:ebb2:f4a1 with SMTP id d9443c01a7336-29b6bf3be03mr51850755ad.38.1763787634456;
        Fri, 21 Nov 2025 21:00:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErGn6a+rZ7niUqJOnsHXL1BP002PdSJQ83OT095SG307ONeuKuxhmN6KASHG3xjid0KHlyeg==
X-Received: by 2002:a17:903:1b45:b0:297:ebb2:f4a1 with SMTP id d9443c01a7336-29b6bf3be03mr51850075ad.38.1763787633778;
        Fri, 21 Nov 2025 21:00:33 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm70688725ad.25.2025.11.21.21.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 21:00:33 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com
Subject: [PATCH v1 00/12] Enable I2C on SA8255p Qualcomm platforms
Date: Sat, 22 Nov 2025 10:30:06 +0530
Message-Id: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Be3VE7t2 c=1 sm=1 tr=0 ts=69214373 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ifZ5Yg0d2t39b6RQntQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: LB2b56oe_1ZGE3-y9bRiUC07KovEaKVI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAzNiBTYWx0ZWRfX4EukwSLCFDIP
 KWks/m8fNJ2OUArLjeYv+IXXmEfXviIG/FhXMQ3dlkR1Xx/7ITsWXOALMPgdZ1/2cy2U+EShVBF
 tSDetIpHW7nnCOMcE9/6M9tfS4ohzSWfnNPUTeY0pfb38qu27GnR4GeZUhTxPX3G0+I6saR8hoS
 A4wm5IYU+XNFyn3HGWeyA9xFd2R/i8CM1edzP7UPbXBl6AImbjyupr7bHvwLjVDr6b/nTbmWED2
 OaMuyseV5JUUk4+tLhfIXMqQgYzYpzz61beWU0ydXTcLRwpLQEMHzMVH3Hm9v+ONgILKAC6/BUL
 TP9EmMmuXC6s8h08oTL02Wz66qIStlGUeBn3fl6MSBc9naKdLSDoY+Q+YG2D1ExSYzP3c80NONS
 Ax8CXtPEXHeY7/zR0Ar+aqm0ykIxjQ==
X-Proofpoint-GUID: LB2b56oe_1ZGE3-y9bRiUC07KovEaKVI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_01,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511220036

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages I2C frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate..

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Praveen Talari (12):
  soc: qcom: geni-se: Refactor geni_icc_get() and make qup-memory ICC
    path optional
  soc: qcom: geni-se: Add geni_icc_set_bw_ab() function
  soc: qcom: geni-se: Introduce helper API for resource initialization
  soc: qcom: geni-se: Add geni_se_resource_state() helper
  soc: qcom: geni-se: Introduce helper API for attaching power domains
  soc: qcom: geni-se: Introduce helper APIs for performance control
  dt-bindings: i2c: Describe SA8255p
  i2c: qcom-geni: Isolate serial engine setup
  i2c: qcom-geni: Move resource initialization to separate function
  i2c: qcom-geni: Use geni_se_resources_state() API in runtime PM
    functions
  i2c: qcom-geni: Store of_device_id data in driver private struct
  i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms

 .../bindings/i2c/qcom,sa8255p-geni-i2c.yaml   |  61 ++++
 drivers/i2c/busses/i2c-qcom-geni.c            | 287 +++++++++---------
 drivers/soc/qcom/qcom-geni-se.c               | 245 +++++++++++++--
 include/linux/soc/qcom/geni-se.h              |  17 ++
 4 files changed, 447 insertions(+), 163 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml


base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
-- 
2.34.1


