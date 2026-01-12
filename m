Return-Path: <linux-arm-msm+bounces-88610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73009D14D6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 20:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E793E3009233
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 19:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4FC3112DA;
	Mon, 12 Jan 2026 19:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQl7DYCF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XucoZU2x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9115310635
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 19:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768244507; cv=none; b=Kb0hLmeaUy1j6Zpe93MMwf6C75DntSg36kLOr8Lk/OJPaukEfyu6A/10CqnExiZiypMfGgGRmAZ9vuYJPqxfC41UJcXHk+7I86o4qOeZfmhFJJxfZAR42yIjTkj8MDVyqpjc1Disv6vo3DroEEBYkoJJgMUSu4ljg3gWQAzB4I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768244507; c=relaxed/simple;
	bh=z4eQr0eex10z9x3L22NaYdnJLofS5JqgIZan2urwgdY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qlXibC/Pk7WEkXLxT3kortacHHBO93BZND3UuiOZeXU7rxWr7/wk/hLMp/wkV3nfDGeMImsF6qtGC5jo+7LIDkuUPOSSPpsyrBRGh+EWz5sixGXDzZZLR7luLMolU9eF3R0nPrEDKvp7FMck+5kj3Ldj0UoK1Yn5A4eDgSkGDLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQl7DYCF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XucoZU2x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CHfHPb1826301
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 19:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ub4EZpexSoQ29tSqpuI17Y5hs92pf2Di8Ce
	kObKFRw4=; b=TQl7DYCFoMBK4RgorI0H7fx+UMD3irgOM55hLFx0xX/H/DsCfPX
	74vrHrwiR39hGhwnXGONCTpKa+lvCe3d55b3iwwIyYNG915mZGxJsnfqGzjnI2BY
	Ln/1Tm2KQlQl/8YeC7fTnFl+reSI5FiRkB0fmIK2hyaLDpYf6rShpWszZLdImcHC
	1a/Ezy1e4a+aB/3Gp+z/cX56/rPkT5w3VnqcPlkpfPtIue7XfyCt3Wyqs/viT3pj
	iI/qfpC7emNVsUD7PlUByfPDAuZv6+HxO+Dyibk30XycEAFCWMf1arpFvXLvLnVF
	U88BSKzSUO1q9RhRVJX5t5Lf1q6xlawBKWQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmwur9w3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 19:01:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a090819ed1so45170485ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768244503; x=1768849303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ub4EZpexSoQ29tSqpuI17Y5hs92pf2Di8CekObKFRw4=;
        b=XucoZU2xgA9l6h+B0GwyJiogftjxFOfp4eZrrt9ZWm1QpVu3Q4HbhrRmkq9sf6vhRl
         zgXls1i5cDFAWugYwry9wmuUOzX7YN3YDyxTwQDbqvoPZPtUg/vR4J8k7sC4Yv/xg63i
         6NEA/7PKcfAb0V3dsUOPeczeMJXsseqngeRop0tp5UInu8QmsVv7EmDS7f1BhX7Vvc4R
         O4XR4Hzz++KBtWNIfGC4rnVNgrhLry0SeVAFzcL6rEbt9rNxWUysxInxQZcD9NoOz2vg
         v3hyFwdLSraUEvbd1yhHkjA43yqIHPY/pcYm7z/Mjf+oixAxl5cg3QZmtt0oEYcqNICB
         PRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768244503; x=1768849303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ub4EZpexSoQ29tSqpuI17Y5hs92pf2Di8CekObKFRw4=;
        b=p+s5IwPmHeviZW1mgEp0DXwUfDbrrZx5NVDjcIUg+WGZWZj93dSZZWrEVIc5jWgJb0
         zI3I6Jf8ogNbA3lRE61kfHUIu7Gyo5G03GFiCsSdqg3IUUyBbbHnhN11qgTkGjFH+5MJ
         HdGwBUzLUQQee8ZjpL+aD36EV1D6HGD/4GWIMelRMC5Ig/EPI3hzzNpS1uwhayLNlLk1
         Gv1fnPi5SV6AA6vfXZ7gY3RtN8vEycXXjD8cINruVq8PT6ZbwTR44R2pu872+Oq9JU1P
         f2UsFUJ8m61T52tybL+Gj0HHjJMyI+bSd6SDl0Yjw47TfQtxtbDkL4OMpTW6O2iSTSCY
         OEGw==
X-Forwarded-Encrypted: i=1; AJvYcCWlgP2zRVu9a8ktpxcOtAHYajmS2qfZXPO4VXjjZm+3usv/Jb+/kkOhhSh8eFztcSMPcYoFeGkQTWOgGwxN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb/vxL90iX6xmEiGQiWstIZLEblHV7nvgC/O+SLGIEA0znl8Zs
	2GucDTctIoEmOIeMuP3N/JNeVCKt2cx/WxgC31MuCknrcMSLGjL4tNFaZrI3il+4uUAvgP9nWtn
	NI/VttJNePeEappHokWCgpiflMnnLIhAGMpGyOhsDAWE2+i7zGBysgfXAGp9rObXA9L2f
X-Gm-Gg: AY/fxX69vT6TaVLytOa96NIfBxPVVIk1tFG4jST2mJSJZceMGhGqNbtHwgdCTDDrmUS
	tMqGpOhrnG9xVLdHlF0fm2WP1nmH0MRp3DALMohuDVgBH3wu9Q1hpMRWxODRm6fyTm/EOGXdPr/
	6oOa0hw3eMQm/aZ7EngjI46AM16q8mr/oJ8PnCFnboSB+jvP1lpI+GGRGGQo+cFv2N0W/6u0avG
	RMewCJZ3tnT1ZcyYQvIsoFVugnneo5vV8mDAIvCQI8C+VADcFpsyiIhYH9/oPN8CbW7nG6OzMD0
	fES61vsPpHV4UUFEjoFevZ9pNQ3NlqX7EZjlrtOcJeSHRHMM3G6idOVunqpJ1juoDxaKCJglYtg
	3o2tl5Gp0tl5UMsiEmzvyr8HYuIfZZEVBdIGXsCmOJZI=
X-Received: by 2002:a17:902:d4cc:b0:29e:9387:f2b9 with SMTP id d9443c01a7336-2a3ee45d592mr140344605ad.24.1768244503117;
        Mon, 12 Jan 2026 11:01:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0tB7SChKljt23is7ptX0+WmSMRFSk9n+Hiq1vowGI0jbs+xhng5CJUxAD6UGqr31W3CTyjw==
X-Received: by 2002:a17:902:d4cc:b0:29e:9387:f2b9 with SMTP id d9443c01a7336-2a3ee45d592mr140344305ad.24.1768244502438;
        Mon, 12 Jan 2026 11:01:42 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8888sm180120595ad.76.2026.01.12.11.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 11:01:41 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com
Subject: [PATCH v1 0/4] Enable SPI on SA8255p Qualcomm platforms
Date: Tue, 13 Jan 2026 00:31:30 +0530
Message-Id: <20260112190134.1526646-1-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDE1NyBTYWx0ZWRfX6+C/ZZ7bphwH
 BRX70kL0VF7o1Ln1rQOGRV67/ePAURFfd8T+RnY1OFWO6E5qQO8NfFnRi0e0fiYa0S/0oAF7DqH
 Sxu8M+0DieSd6VObKEBxC0pF3q6ASS0XdqgnOpzvJjYpgsIVFWQSksFoRsR/rj3YRh9JorvMJGt
 QoqjaWWKLmb2IKnp4jXQApBC7tg582apLK68PlGRYt3Ik9Utx10XpEbyl1Blb+eUw0dWxZiaLaF
 ihDIVzPSjV/z/VPjuQNPlxZqr/peETtUTOgkgPbV8IVv5FUoqNASm1YV4ptc374S/4GBqiQBW8m
 Qfb+joDPjn+h4vPvzges1Hk9N40cPmkckWo7KXHkBaHS5NrOR8BLVejorn0neE+jUyP279AUWvc
 rSpwp0kft7b0QbFpwfIDNaiiV4MTjFV9QgGverJ9cNIffw0cDrfTrlhPHb1VjsPqy9i6d95vQAu
 +Sn7BexCrwiG2jht7eQ==
X-Authority-Analysis: v=2.4 cv=HrJ72kTS c=1 sm=1 tr=0 ts=69654517 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NeO65QaY_C3oiTlxhukA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 3GvoJSF56VLj6Y8pBgWjk1yGFhUhdwe-
X-Proofpoint-ORIG-GUID: 3GvoJSF56VLj6Y8pBgWjk1yGFhUhdwe-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_05,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120157

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages SPI frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate.

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Dependencies:
This series depends on Enable I2C on SA8255p Qualcomm platforms
https://lore.kernel.org/all/20260112104722.591521-1-praveen.talari@oss.qualcomm.com/

Praveen Talari (4):
  spi: dt-bindings: describe SA8255p
  spi: qcom-geni: Use geni_se_resources_init() for resource
    initialization
  spi: qcom-geni: Use resources helper APIs in runtime PM functions
  spi: qcom-geni: Enable SPI on SA8255p Qualcomm platforms

 .../bindings/spi/qcom,sa8255p-geni-spi.yaml   | 63 ++++++++++++++
 drivers/spi/spi-geni-qcom.c                   | 83 ++++++++-----------
 2 files changed, 97 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml


base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
prerequisite-patch-id: 59caabe7cb91dd1cc983bcddb945a9f937f27700
prerequisite-patch-id: 8d9eae225d0a898c5543915583d181dabf22fc5e
prerequisite-patch-id: e2ce71b831c2f22b3945ba4faa9f5387857aafd6
prerequisite-patch-id: 4b4e8774d462676e04c9e14c30720ae559c90643
prerequisite-patch-id: eebfa4f5ef4f3eeef82c946f365e0500f3818125
prerequisite-patch-id: 9d5f48bd6188ace78aa1069c95899f23af2d9072
prerequisite-patch-id: ec7f320c0999d7ca947f7d3a86c4e6ecbc6694ba
prerequisite-patch-id: 59bfd0cd9f7a55a75ffd828bb8f9be94d4074e4f
prerequisite-patch-id: 24266f569d58bb78615ff4207c1c210e265912ed
prerequisite-patch-id: 4dbf9643a0e17e1c93caacec9d6ba170fcce45ed
prerequisite-patch-id: 74a1c1f32213a6e9de05765d721637d58f5baad8
prerequisite-patch-id: ef061474c4b96374ed3c935a440a8d0da830a972
-- 
2.34.1


