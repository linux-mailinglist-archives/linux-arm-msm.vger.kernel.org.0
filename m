Return-Path: <linux-arm-msm+bounces-66542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1B3B10BC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4BBD1CC18BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4682D9EE1;
	Thu, 24 Jul 2025 13:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDISVEdl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4502D9795
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753364569; cv=none; b=h14fdCCG0Hus1yPTVbaF/zQJgq6zokQv7PSVQXV0EMDVENiLpaQgdE91O3IsVHxeTbBqsWKwd8hfcuVs5IK4YBSIOFlO686wXaUzm+C3xOncurKN+e3ssJdyH5hnsUVjEUF6F7pgWMSIkhgtOTd1qIY+p+gtIpZL6fQxvEbeYI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753364569; c=relaxed/simple;
	bh=kMhPDLRft58cFZj+7bDbN07osFzXbyRLO+xR3b0qJmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C/b1xBHNXqdCaL0oZf/qJxpLS7KgCSnN0eVAgTGA3wGwVMTUKFkaN71H4AZIQFp2I3DPjOvR1GiYZZa2cBlHz9PU5fOLYLyP+zn1pBBOmI6sM+Dilf9IF0DioKE9SCa2PwPiN5yhmPSUYsya+PVhMZ0ewaOZ1j7yXusLRCRTbio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDISVEdl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9Op9x022161
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tsUjJO0iLJb/UG0dtmULJPTzB+FcOPgkwsm
	DaJ4piAY=; b=YDISVEdlwwJL4Jp3sjRXEiZnt7qMrCT+tple+g2+hVnF7wei8xf
	eKrbR4FPpc0u77TTC57OI0M4tw/8l0mrG9PyPqVu7enK4xFrCyk65eyqSagGoLK1
	igjFIbB/aLVgKWYix+E6QQGQeHnVBbSceFEImZkGDnCPBjBdgosE7NEY2gINkvPK
	/HqK8JXo+qvw0dezTKP36m07BnyDcOmEF4Px1WOkxBhwKwKrjQQIg75SGcK1B2fv
	XIH9to7szgfYYKo7fdRpW/njQ2CucprPT89S1pdWcw+jcLSYG9A3Pm7OXHPy1u9V
	2r77cd/hF+Iq+mcO0AC/CLFafQmIubS8GIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044drnk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:42:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e095227f5dso171637185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753364553; x=1753969353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tsUjJO0iLJb/UG0dtmULJPTzB+FcOPgkwsmDaJ4piAY=;
        b=eob3GnypOrj/9DfGPnnJsUrPmRlJ8IfyWKAsj4wr96U9PD9cXw3FowBDEQQM0n2F3v
         Mnibx9PprtpRtiHbD8UpZQiSYLVf+EJMMigmTXmHrc0qyKJjYcCWLsd7VeDDDOuN8uKf
         3/KCyUPWhi7r0y+23t+iTF9Y8GjOyIGFBloVnOB1Gzl+8t4J2AmIQQKq1misj4pETCtb
         4oqrrrniUg47VnDPjNqlasMRIoZ6LVgPmTpfahOscQniuhWE4tbd6vzQkW8/rnOwXPYT
         0ro09Ns+97UkGG8qym3Wla/FgkZaCqN1qFJab7Yrqyasshg9i+k+jmy3NRjSIa8W0ssE
         u9hw==
X-Forwarded-Encrypted: i=1; AJvYcCWsnMGrHVRDRAJMmEPHoXMIljnNIwEaG8oJPmYuZypf69zHeiSF6I7Oqfx2Xn6bP1KOOV69Wc8SGZON+F3J@vger.kernel.org
X-Gm-Message-State: AOJu0YyIuRiwrI8+6axZ+BdV6+FAVI8+XWXqgQqBsuRDiR1UyDH75rW3
	IZ22iY/TMt7m1BQz1AP1R6jWPZkBRJ+KMKx/ZxmADf4Qx6K0ZoOYbRZ+EOxxyO3vyD30WQz8eNn
	JqW0+IWuCzysdNCIJ5dbrqdLSnB5QGvFzbhIpWz+B7b232Ak2sYG43+M8kIaQ2DNWPQ4q
X-Gm-Gg: ASbGncuWEbdYTfI7+ugJBWhcrcP/1jw8pJoWWwZe5sTpaM2tqlOdKLma26kSAQlHRkD
	2xe1aEujrcRZdnSgDKmHh813+SJyp/fWuC5iHWmTfU7zSW5wkFrRKoj0p8GoMBFBMq1y8JtzDUq
	ru9I4HmfWDLjozguaJsKZTklE72brwyZTuL1DXL5EP5jQVtkyZbuMipsSIhTszNrvUnNT+dnwlD
	i+qESROWkd4/knMxXIqbKiw9bKzrVbe6ziJzcgQIHV4n1irPumPK5cD549lyw2Cddw0igUOMj6i
	OiWOd0oQKXKJEtEbKupwDBfInbrHWtBfgxlB5UfzmyYeV966DaGMhQ==
X-Received: by 2002:a05:620a:4095:b0:7e3:4413:e494 with SMTP id af79cd13be357-7e62a1957b6mr823189085a.60.1753364552578;
        Thu, 24 Jul 2025 06:42:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaDLmi5F7qLiXnyBH4lS2oCZRlvOc0P2LHa/r9heMqn1DJzqor51NTb7bwX2PM8IlM8IoNgQ==
X-Received: by 2002:a05:620a:4095:b0:7e3:4413:e494 with SMTP id af79cd13be357-7e62a1957b6mr823183085a.60.1753364552035;
        Thu, 24 Jul 2025 06:42:32 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc7885esm2228471f8f.35.2025.07.24.06.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:42:31 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, sboyd@kernel.org, broonie@kernel.org
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srini@kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: drop sm8250 lpass gfm driver
Date: Thu, 24 Jul 2025 14:42:27 +0100
Message-ID: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=68823857 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=FWHBK-Jb_X8E8erFsI4A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: kowKD_YLV24BfVeM5K6KBLW0qQ2dIMxI
X-Proofpoint-ORIG-GUID: kowKD_YLV24BfVeM5K6KBLW0qQ2dIMxI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwNCBTYWx0ZWRfX5W/KMqCDStN+
 jJIVqJPEAtrRby0BbCaxq67AMqMZJf1ZnazyzMdWIBHTjS937cc75kms3LucahERuGeLNLl2436
 mN6Xy0KY79zGRT66Bs2qandw45SSp4fnjVhFLXnrLwy0ogoHacbSXJvy2VhATUn9f1nq/VTnsw5
 Cb1NtyMWxJ3WTnC+bSDUVtvAvQtbiuYVNZV2o9FLGx1paCot1PBGDH+PRUWx4JDiea4mTgcKYV8
 Drp1sNPUuQBV9KYbGPgmni4ta+NDsWToFFVJFk2Ng3mjWRiKFNJXYzbpZCdJuqsBBGGJxmTUxdF
 /KZSEKz/dV6QytA8fLJNqMHl9ZBaJmuvE7rZvkmYeVnYkr3DJVv5ugh7P4eVD7cp8CBaw22/Cgc
 H5qMl7UIBnHuVFK/Ip/ISu2IEyZzIUkE3HwH+hjmDx5o5M9jItXfGufwy6OYWZxiR385sKvk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=689 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240104

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


Its been more than few cycles of kernel releases that the device tree
has been updated to use dsp clcoks directly, so there is no need for
this driver.

iIts time to remvoe this driver, as there are no users for this driver

Remove this driver and associated device tree bindings.

Changes since v1: 
	- updated lpass-wsa bindings that was including a header from
	  gfm.

Srinivas Kandagatla (2):
  ASoC: dt-bindings: lpass-wsa: remove un-used include
  clk: qcom: lpass-gfm-sm8250: remove unused gfm driver

 .../bindings/clock/qcom,aoncc-sm8250.yaml     |  61 ----
 .../bindings/clock/qcom,audiocc-sm8250.yaml   |  61 ----
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  |   1 -
 drivers/clk/qcom/Kconfig                      |   7 -
 drivers/clk/qcom/Makefile                     |   1 -
 drivers/clk/qcom/lpass-gfm-sm8250.c           | 318 ------------------
 .../clock/qcom,sm8250-lpass-aoncc.h           |  11 -
 .../clock/qcom,sm8250-lpass-audiocc.h         |  13 -
 8 files changed, 473 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
 delete mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c
 delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
 delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h

-- 
2.50.0


