Return-Path: <linux-arm-msm+bounces-85945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 771ABCD1276
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E8B73019E15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 17:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F01730F947;
	Fri, 19 Dec 2025 17:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbRJthbK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hkyTrakV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7BA2EAD15
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 17:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766165482; cv=none; b=cfQhdXldbwUhWyTkvc4mTT8OorI7ycovEqf2CkcaKd/KJFzINJ5YPXbbPP2rFZaVok09PyCTFKKOf9/tGMpXXp7X00HEEbsZ2sdTM7qcp0zGw/aPOIe9pPjGyhrbUVm46y7QhLW0cYN5mgzQczNXT+PK/ZiWFM7DLPX1rQg+v+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766165482; c=relaxed/simple;
	bh=5ZYhRufQUBS4EeEPB7KUS79ALnNyJR5mxc19Tb4SQHs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aRM9+ddPAXOORJnbLc1KiKPRnx07fNV+Dg0eGTE+W0hgVQ1DfbfSip7TESQOSgBXXtW1eRjLqxyx+wHqvMsMQ4dEUN5aBUeJx3YeELLO1ME0KSnde5ohhsQ/tML/y+VD/JP2oqTQpmWIKI7MQZSikrA9QS+vj4eMd2rPhobspr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nbRJthbK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkyTrakV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJFjnfq1355371
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 17:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iLH/xGXJYE4dm1dXzU/3wtyAAdQ6aQMf9Th
	AQsy6JaU=; b=nbRJthbKf17XYKWVMbTOx/S15cxdmHSyfAer8Iy45TR/7bFo7+L
	m1WZh9BFaKfzd6qV8dPej9VNYrolxnG+jsdA+58Yt8T/n3oQycmLXMygKldtxLrU
	4d9l0D6kxC1VxmyAPw+jFWoaN8Mz5DpWuplo0HmFEf+nR0EGNZKUfrNpAe7gNA40
	N08PmdhWSJCFj2Hn4DdMGRTaY98ndsI0CP6giWk9DX2t5IOkPP5YtYc+UxHr07yd
	yf96juT5lL7Pv1c4GtLz22TwkZ42/2b7IDY1p4NdUtq5ETyhp827Xg1xHaQi2DUb
	vUuhysCL8FILFeFZQ7bc21cUI6PDRkxfopg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c3h8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 17:31:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a31087af17so632035ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 09:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766165479; x=1766770279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iLH/xGXJYE4dm1dXzU/3wtyAAdQ6aQMf9ThAQsy6JaU=;
        b=hkyTrakVm6WtPo7irHU9Bt326mzSXpb3KP9GnRXrtciUuxEoQjYdXhHvhs1IJzBbQ1
         rcLBft1piWURV0QNWvEkaRpz5wc1Xjdy91WXVWx6Ix6tc45ge/kGIrpCzdR1vYL1LJE2
         kJE7jGrWFpy3yoK35XEZVtQL062KSdHULrF8RL3TnbPW5IkaUAmuRn7lTXjqcFr0ZSYU
         niIoV5KWaZ5ccWeFmMMFOG0X9P42lb19IXhuWK0yDlCxoX4MlgnhTK2738sfye567xnj
         bHGidMdXaV7CDFWEpfwkeyoSUMgWK7jPcv1XFPR9K9qnRbQpo1zDE5Gr9vezCUqFl9nI
         md8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766165479; x=1766770279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLH/xGXJYE4dm1dXzU/3wtyAAdQ6aQMf9ThAQsy6JaU=;
        b=G44M/DcIkZ1mK4/igScVaNC9DyW/axFvb/JVxz5GN5eqB8KqsOmEPXXDKE94CcfJSl
         gTk0iC/dQwNfZBoxSfroMSUbxNIpEBN0ZA8XmTbsBAIyt6Owh0ITFjoVLjOhjOHdkbIA
         Jq9wRCwwj9Y7t/0vma0pXl4lwv3PmWqRGdJEVc4biwrWiSZlS6FCftVntLU/EJ/0cOSs
         CqB7l3jqJJkyKrS3Yuv/0pg9d00Bk6dArPmI1+SQYhqss+khdv5FvIEWgDevg0zTqrLF
         xVOfeODFfzxNVKN0k6KtjWQtcAee2QgyIsbPM3J+Fy8m+Qy/XodeZ8pCdFKMEIJpaA5G
         zBSw==
X-Gm-Message-State: AOJu0YxNeDR1LnphYfmKPgQYNHEl4lXyPzGuCaVvk+Q55P5F8qk9W7fH
	TLVq5r7pIRUe0+r2An5Vk5o8LoA26UYM32vHDgw+T6UbMiWbQQ7WTn54ZPoC1TVPcxz1ITrGq7d
	TG39TdXEyju8fQpfjsEoDyjCyglTOj2cVNzpkMCBawvvu5ePsk496sKv1u/V0AtRHyjeb
X-Gm-Gg: AY/fxX4qH3kTfXWejGyvksh4xzZ64QxJaBHKLyfPIjd8Xpi41C9vcyn9g/Z5MrNjJoV
	o4nrsVOeft3bKTESxLVbNmc2LJjcH11bGVg/mb6Ztfn/5KGhXFGr6kAZlKeaqlBIKXV7Es68Wcq
	RnIxDFuanPNAx0EBa8V6OiKqeOSTu34niVRn1JRkOtrKmUKlB7eHLWFAdf6MK8RkMLmOecUsTjw
	8a0RXlBxwFAjd2f2jMsJXsFebFBrPJpz0Lq3DO830yOBBPvQ52hX961DcARWa9IZZIJFNoqwI7M
	ICi3oB+CDc/0ppe+V52UlqxdqfnuNIvBpqVtTbjYH7nWc0hWfds2Hoc3RUGYkfX7jhntvGrqfMZ
	dsB5eQSbGwg9IAG4o1jKFAAli6fvZh5cZDohvCY0/Uno+1Gk=
X-Received: by 2002:a17:903:1a68:b0:297:c0f0:42b3 with SMTP id d9443c01a7336-2a2f24228eemr35203955ad.25.1766165478985;
        Fri, 19 Dec 2025 09:31:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdnWXBjQ3S6HbkA5gNaY2q/0KnJV7Rbq57BCYvX238UsSrNgsmFJk7o/zFtVRutMEF5dWHaw==
X-Received: by 2002:a17:903:1a68:b0:297:c0f0:42b3 with SMTP id d9443c01a7336-2a2f24228eemr35203605ad.25.1766165478454;
        Fri, 19 Dec 2025 09:31:18 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5f5dasm27568705ad.82.2025.12.19.09.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 09:31:17 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add eusb2 repeater squelch detect parameter override
Date: Fri, 19 Dec 2025 23:01:05 +0530
Message-Id: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDE0NiBTYWx0ZWRfX9AlstQYUsFtL
 OeGH449UVgj+4ONWwk593W7L7ZoY8FAyEVvWvi8TqZ7x0VVDMktPFTQcWjfeBmV054xJtYa7ts6
 P1enIlEf8/Ftbell3GzTY5yh+sr5up3AqELVk6Vk/nMrFy1HDaNcJluzFDWJ2NNVXYuX7SR1Yvg
 VMOcxLvfOHMDC/6UmANglTM3CUOe9g9LgBh9kPE5Chq+xcVVc2wkBL52ybXPZYPRUJQgYJau+os
 73of1y11G3In5Mh6DFTRZxBe37NBsKH3mTKoQsksGuQemyJLqfHIRduVVRt+HOFlH1yjbk6kSwn
 Liul0jD2rh+RmELMU8ZSdqEcjvdNRDhbBA3gfzhQCCP0FTpNkF96iSqc1e7vozrx0WcAo6ERywm
 bMUUDws41qSkW7RC+c+TeojlYiJaQol+ph3TL43Eo693UXeC5jyAHPtaA7bqVGgiA8HJxEvt6NS
 S9DJeXMA3iO8QJTIRkA==
X-Authority-Analysis: v=2.4 cv=dOmrWeZb c=1 sm=1 tr=0 ts=69458be7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Jj6nKQW2Xfz6pTaCyaAA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: vS8VXoxMd_OCbLYygo8QI2hyALx6d64C
X-Proofpoint-GUID: vS8VXoxMd_OCbLYygo8QI2hyALx6d64C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_06,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190146

Add support for eusb2 repeater squelch detect parameter override via DT.

Squelch detect parameter adjusts the voltage level for the threshold used
to detect valid high-speed data.

Changes in v3:
- Moved status property to end of repeater node.
- Updated commit text as per comments received in bindings patch.
- Retained Krzysztof and Abel RB tags (since its upating commit text adding
  information in bindings code and moving status property in dt code)

Link to v2:
https://lore.kernel.org/all/20251204044644.3072086-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
- Modified logic to write to squelch related register in driver code
- Added multipleOf property in bindings to reflect values can be multiple
  of 1000.

Link to v1:
https://lore.kernel.org/all/20251203083629.2395451-1-krishna.kurapati@oss.qualcomm.com/

Krishna Kurapati (3):
  dt-bindings: phy: qcom,snps-eusb2-repeater: Add squelch param update
  phy: qualcomm: phy-qcom-eusb2-repeater: Add squelch detect param
    update
  arm64: dts: qcom: sm8750-mtp: Add eusb2 repeater tuning parameters

 .../phy/qcom,snps-eusb2-repeater.yaml         |  8 +++++++
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts       |  6 ++++-
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 22 +++++++++++++++++++
 3 files changed, 35 insertions(+), 1 deletion(-)

-- 
2.34.1


