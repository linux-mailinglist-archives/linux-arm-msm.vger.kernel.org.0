Return-Path: <linux-arm-msm+bounces-84226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A22C6C9F1EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 14:27:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8BD8F4E025D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 13:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2352F7462;
	Wed,  3 Dec 2025 13:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZvFKtRo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D2EIte1d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252E02F7441
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 13:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764768420; cv=none; b=YeVgvvYAfHoVWBb4Nn/Mzw52V7CNNGSrCB1PExM3jdU/yF0gGsMM5oEgvxgAWXymr21utcpDTOCFg7vbVcGAejX784MH0kDlIHrACwVcmImtJ9gMQFgzxzZ9Nfn1Mh5RaSw8GAkQZcDREkb8sWigZISo61DR3+HYVfHRioBLUPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764768420; c=relaxed/simple;
	bh=uJBOxPm6Eimz6DhfdchKbr3oFckVKr97/7nJ/4jxK5k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oCQP7bkiDFaXDnrqCEedk4FtIK84EJERP8usuW4U5WJ5xo68cl26bLY+MTpjPHkxkj/QaDGJ1YxDtOeInENeTQ674vAJXQbi6PNTUT9Eeo6yW5W8ZhstkTmF7EKGbGQ1zwNV8l7S+UsRidvCxvF9Pi8beP3+AShkpi7Ij7z+cXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZvFKtRo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D2EIte1d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B39PwoN1969503
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 13:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GM1a2Fk0kUJGP3rjxxqSZR
	GIGfHWv60CItWyO6WDoZ8=; b=MZvFKtRo6xFNZp/seJRdCn7EYmNvIEoi+jmpUf
	t+7Tt61y+sIt+5QGsPD3oAel2eWLID9nMktUWglDDdf56Xk7lb42Mt1T9jrDbTDy
	aT8PZOZhwTcN9KtAZ8WcDFUVaoxaujLuY+RmZIWMv8wLrPgB6qdAkDrQ6mit/uVZ
	GiRcCPQ1POTX5sENkE/+gRlJkCzPS1ZzedkboVBzE3m1lZ8ltLdjUxG+IBCwTO40
	ODVSx051mSXBdidjQ2EOdvC036x9BJel76V121tdhB+055tXvxYO+oY/g8qfMdSa
	XEXucMYEZTY6uvORmo9D7j3naaccQmn4mub2oSxNovZKOmQw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atjjs0pnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 13:26:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7be94e1a073so11490457b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 05:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764768417; x=1765373217; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GM1a2Fk0kUJGP3rjxxqSZRGIGfHWv60CItWyO6WDoZ8=;
        b=D2EIte1dPLPREwz5kowk1MOlI/y+9Tp7fKNkY8etiLm796J5za+lDEHW7zPSrSXbT/
         LyXYRJpblqxFQ0KgSF049zrBrMlk09B1ieHAmsRVa9cNFCe4aXoqAe22JtcqW3EpSt/b
         7wEzUn/vfn7EIzmNfE8hyJs37R1eet+QwH44On7IxP/wpsItImPBgRZpwPTQATwjovUf
         hoIwdlqIVdUY2JlH4DDWnzRG7xRG3W1gvy7KhZKQ47fKYA45YN8uh6VCuWlM3BLtdp0d
         Z7fkFbcm5MbsNQixWI+/e3NNZC1UQVBQF1B0IwUcUY8uqC56ksznN+/pmUg5HW/WNvo8
         dgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764768417; x=1765373217;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GM1a2Fk0kUJGP3rjxxqSZRGIGfHWv60CItWyO6WDoZ8=;
        b=rACvAbeeA7pAI/R8KQaahTjGa9pdJM+lYC5uiy1HkAZoOK2StIUCCEPrVpUIC+IZUO
         Ozki0iukzp5le1stH6b/rStMqW16Wd8aTjZ1CDhugv5tAw9xXY6K2uXMBtFwHLTfvqiF
         BnsKtwfxSsdRt8Si25gr8ltw7bKM2hPoi+w3w0WiZZrHzQICzUUco0GCj2bAKotSqSp8
         VjiV+CfzMGxdl7lUWcJWcU9cXwDRChC/EXmFgHfwGWiw4a0IjNFM9Tglj5WSgvBuZHvq
         UXIp1q6YexjZ4aV2Y6KxAzf18Y174eRy+F7ahe1ZOd90+yCEe+owVv1exLzichUSlAYl
         xRcA==
X-Gm-Message-State: AOJu0YwqfYULSJvc5xTCTbjJ+y5/vageFbuiG7ZkTtoSoYIu4Cd/8nr5
	ZQAc0osBO73WnQs4/gQ2tdA46N21SBgWpKxede96BoO+pzWaM4xtp0/xZ/GcLyk0LS9qIGHuoCb
	2QHmyU1sEK5e6UJFMKHvY4Qz0/FEovxF/L++3JCqncvNpvwComBgfEzMNh0DnCxdUABzK
X-Gm-Gg: ASbGncuNECUqs51ykdiPMArvhHcC8AII1TkU3ArXJJpQBxCsceJPN1YwJ34CqWrn/K2
	zkt4lajbjMfOn/poy1YHOqNDLKmBX/OujN/fURaTBSQ583lXx0jVdEvkzzS0gwnX5uJSt1lH7E2
	/e64RAY7BBp7yLhc9M7eQh4xbqgBIIUbCa0kuEDqaF37Bd5ySbIxWwfEIKJkKpEybnJinbGWBx2
	/1xxMCB6zkmZLqcyBFJn/ds9nMWR5X3zI0GFDgiqXqO0a2jkytbNY14uPNTUJymEEkt4GorISB5
	7CirysD5Xf3I2STJZxlMVt5AQqY4N7aYYT3aMHXUKuku/xdx2lijHynMz8/Ahd0sHE9qtega9qI
	O3OVFmzlZQ2+z0DmuUGh31wgscQaltP3gWqLeRMOfS8M=
X-Received: by 2002:a05:6a20:2592:b0:35d:5d40:6d80 with SMTP id adf61e73a8af0-363f5d3256emr3029248637.8.1764768416948;
        Wed, 03 Dec 2025 05:26:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH34O1CWJT583sOs7/4wtQYGkh3bxAdnLsd5JA1NN4grgg9eTVN1+0lSr9Uz9txglRW0Dx0eA==
X-Received: by 2002:a05:6a20:2592:b0:35d:5d40:6d80 with SMTP id adf61e73a8af0-363f5d3256emr3029214637.8.1764768416314;
        Wed, 03 Dec 2025 05:26:56 -0800 (PST)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e6e6e06sm20287524b3a.43.2025.12.03.05.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 05:26:55 -0800 (PST)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Subject: [PATCH 0/2] Add firmware-managed PCIe Endpoint support for SA8255P
Date: Wed, 03 Dec 2025 18:56:46 +0530
Message-Id: <20251203-firmware_managed_ep-v1-0-295977600fa5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJY6MGkC/x3M0QpAMBSH8VfRubayCfEq0hr+41wYnRVK3t1y+
 bv4vocihBGpyx4SnBx5Dwk6z2haXVigeE4mU5hKm6JUnmW7nMBuLrgFs8WhysZr+LFuR11RKg+
 B5/u/9sP7fms1YT5lAAAA
X-Change-ID: 20251203-firmware_managed_ep-37f1efb69b15
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        quic_vbadigan@quicinc.com, quic_shazhuss@quicinc.com,
        konrad.dybcio@oss.qualcomm.com,
        Mrinmay sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Rama Krishna <quic_ramkri@quicinc.com>,
        Ayiluri Naga Rashmi <quic_nayiluri@quicinc.com>,
        Nitesh Gupta <quic_nitegupt@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764768410; l=1093;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=uJBOxPm6Eimz6DhfdchKbr3oFckVKr97/7nJ/4jxK5k=;
 b=b/U+m8vYbR2kFPXh8P/G5wa6/MjA8v2RliBAYBT98obx34wyLBHBCBoZqWPLnHQu9FFZVO/Tu
 mIjW0+AZWtgDpDErop+vKDQn95QoCACuvv/MFfYcc7ngg0dN/l+w7Rl
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-ORIG-GUID: tf-snEP4DhgaJV_9Hjb96ocCpB0o--Lt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDEwNyBTYWx0ZWRfX0q6cfub95mp5
 +RCgcfUE9eC8c/9JQNw75fdcaArWoiXQlO+6UykzQrZpL1i1e18TcTXBSZewJfFQ0OVAx71qbWO
 Te0RV7XSuv+rubOPwic3WGy4FSYXkSFikLkd2KPz0ARx6Q5+LM9A+UPr8rRG+rk5y7JloQtPYDx
 dWuZvUlCBpl7LeEq4SrvgTB6GEnrAvrr/Jhhre//IEA5ajgWgDoNX5jx4E3uKeM2HN58nrtB2LZ
 r8fJBRqt9oluMVXo9eGXI9zghFoQGfTPkMLFy6LnPkuYerNOVLzQREZZ2rkc8DlhYN6iVkv2iBC
 59O5JfboGIszkxL9Y1gIO5Bx94yeT5k4TyfP5MsfETsTYLF7X6OqPb9lTM4KSS4hGPAzTdo8EKA
 j+ZKsj/+2U2fJDuQ7YgECS1Hu4ejhQ==
X-Proofpoint-GUID: tf-snEP4DhgaJV_9Hjb96ocCpB0o--Lt
X-Authority-Analysis: v=2.4 cv=ZqDg6t7G c=1 sm=1 tr=0 ts=69303aa2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KnNq_94ptiHzTE3zWj8A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030107

This patch series introduces support for Qualcomm SA8255P platform
where PCIe Endpoint resources are managed by firmware instead of
Linux driver. So the Linux driver should avoid redundant resource
management and relies on runtime PM calls to inform firmware for
resource management.

And documents the new compatible string "qcom,sa8255p-pcie-ep" for
SA8255P platforms in the device tree bindings.

Tested on Qualcomm SA8255P platform.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
Mrinmay Sarkar (2):
      dt-bindings: PCI: qcom,pcie-ep-sa8255p: Document firmware managed PCIe endpoint
      PCI: qcom-ep: Add support for firmware-managed PCIe Endpoint

 .../bindings/pci/qcom,pcie-ep-sa8255p.yaml         | 114 +++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom-ep.c          |  80 ++++++++++++---
 2 files changed, 178 insertions(+), 16 deletions(-)
---
base-commit: b2c27842ba853508b0da00187a7508eb3a96c8f7
change-id: 20251203-firmware_managed_ep-37f1efb69b15

Best regards,
-- 
Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>


