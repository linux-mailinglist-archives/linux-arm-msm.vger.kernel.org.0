Return-Path: <linux-arm-msm+bounces-88046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 271DCD03AB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A24B2301787D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498F743CEDD;
	Thu,  8 Jan 2026 09:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F6qg9DwJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/e0SyCA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0414843AD5E
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864365; cv=none; b=iJXjOFQJNlMvwl94xG6HDtFsrty9YcNim66UQDCgMjzxhdKp12gCaZIhTnXX5GlNmHdRJtLJ9CcvAxsRiVVFnU9JUvAOBWA46yPPHdlw77UeNZizbseZvq0rXSDI7zXfdubHauz6bgHLp6yHrtrbaJD6Uw3d+rHhbC+TufFpEfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864365; c=relaxed/simple;
	bh=ZpYeP2uHTlP4ONhJUiEd0PFxUrvOlJ9tu81BVrgSmdk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NZMLOh8SVbh0ZDiMADka3pTf5cWHTOpH55ChaT6XlAzOZXqhxDSb/QBU1dqPcg+yqlhYaQbp8Qedq9x10HSd0Il0emoajQPQmlhFaF0as+DCfOcAmdaKV22GiajOmrrCJb9usoX0DaDAxOvbKvN38GA0GhJuJUggGrqwTw0DUCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F6qg9DwJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/e0SyCA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60872L4t1496310
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 09:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pxxRXlUaPaCRv1jR69Ek97fex7HvkXgKqcB
	KmyZAVMw=; b=F6qg9DwJUe1KLWGKragdeZOM4nLZnQYaDJDVJO48AA1NfUQhN79
	aTglNQ4AlTGz6aMcLOlu1qAxxZxN7A414uRd3SEwmsmebFamn2so12XIV1lq/hGJ
	ZqL+br07yskQOq1X0GIiMRchk+idebWZOEsbO8c1bs0RBJN0lO9jF2TkFh83fWCK
	9os/epivSACDuLZ7Nu6j6vEJ3DjWyreZ6IxCzOidzn4ivnzrL/RGJYSfZqvH/4mY
	VxGzk8wr3VBjQPfR+J+CDTEdjpwoPplp4okX5XP48U1vovKrOojl/b9ZhpJJilxg
	9x5BtbLQAlWe6A9WKSQDs0JIpM5QZWr/PmQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj7ua8dng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 09:25:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88051c72070so64756306d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 01:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767864355; x=1768469155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pxxRXlUaPaCRv1jR69Ek97fex7HvkXgKqcBKmyZAVMw=;
        b=h/e0SyCA7Qt8wWhzkSDdZVn3t5y5GH8n8Vw9vBhqyOfDkcYrv8yttA/zF448u9z9YX
         yM7+PtbAssRcSd9GQvFYALGPBUhwSzj5aGy4R9sog/Th5TI2mv2ja1cTjiU5yP67KhAm
         ziAX/haBlr7ZVu5YjU8neIsevzTVtCJub+mdA2rEHStZrfayJE+0E7ZKp0ee7vwH2gi6
         WOgvVn9O+6wKRHWSCixv/GYrxf4Ipor4OqO169juPEMHzZCSradgll1CIINws0QZaHOl
         JfM/f4fyIO8YbpJj6yI4NMTJSyg/rmKtGliNRJJZ9lUXXf+/+Ag8jU/2X6ZeShhfWVKg
         MFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864355; x=1768469155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxxRXlUaPaCRv1jR69Ek97fex7HvkXgKqcBKmyZAVMw=;
        b=iO1YWLF0rd/sNT6Wf+pesz1xNCFTPc3BN9r9URGD4HGY3tS46h5IH4fQKVgKQfWe/p
         rpG4XUSHOjYRohLP2axKMIUw/JL5unpYhPoFKs1IzqT3aLaY0F0OEOYRcDgTmhDhGCLu
         CpKbwT/7FFNixb8RWNmf2Nv8Hy2bFEk87pMnFyFgS4A0VCiA3R7NDrTf5uaOwbIoKYZQ
         ftm+t4oyVfhUwtAMJlWv5uJQYxh7AepTvBuqF3FS+81A7YXfjt6ts2dmrCfcBvdOs2Jz
         jkO2DKRaWFVEr/lzgi2T+KtC19rBj/cdk02q1xC3i8HhWN8B9bPoncIsbok/2w0fYYew
         NDBg==
X-Gm-Message-State: AOJu0Yzt+dmn4VyLc/QGa8hvSjCRKopuVjgw8LzSoZkGLKSInJgwz0/9
	WRkDe9GgsnHiXYBSBj6hgA+gqaRGU3xu6RpGqQ5apGMrjhAm6u8VQQvt1+M/RUmwvKZQDNibh9z
	Lj9HuFwXn7u3NEO5PnLr+Utc9rfBoj3iL2Exj1IfB3FWDc8z5P9W9i43FO0f/2YnC9C+5
X-Gm-Gg: AY/fxX5eRdziXzwZc9wuxHsv8KL0hitfHqEF54vwJqGjGTulUaZ1GQu0ou48rZrNwzO
	kn9i/RD7vaVmQu1pCjBGDiFlh9djnaQLgpOLwQ6+q9WAjfrAfSlv4M7o3wmp+4DAw+syfJq9V4G
	MFCfHhfsNQv+k+cN1LbHypIy6bOAtCiCoWp8CDAjUXovQYwccn6Lye1bUDTW1mmivZInFqecfUT
	E5fvfRSag9JRZWhxlTa5paDZ+Ir17ZpiaHfyxEn94zqU27wNgslRfE/Azd6t94oKOGj37D3zcCz
	AKphLNFCrwx5XZKjLnM6Lhcz4JyPS7YdJG+ytQav8cmrE4bgjZsU1vWx9RQxwYe4DQKxXyKZ57M
	Zeh18QtEWuZOritAP+opzqtj5RjXsLCuNiqLEdUCN7Y6PcCM2GlRyRhVAcUpUUo3RwHM=
X-Received: by 2002:a05:6214:5b8a:b0:890:808f:c242 with SMTP id 6a1803df08f44-890841cd3f7mr72813756d6.31.1767864354881;
        Thu, 08 Jan 2026 01:25:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5gYWCHBf1g20SAcvTWRoIVwYrCT96mja5EWoj8rSUevnX0ANrRjXpHwdh/4XCvq56TaycSQ==
X-Received: by 2002:a05:6214:5b8a:b0:890:808f:c242 with SMTP id 6a1803df08f44-890841cd3f7mr72813496d6.31.1767864354444;
        Thu, 08 Jan 2026 01:25:54 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce659sm49279916d6.10.2026.01.08.01.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 01:25:54 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com
Subject: [PATCH v2 0/2] arm64: dts: qcom: talos: add PMU
Date: Thu,  8 Jan 2026 17:25:40 +0800
Message-Id: <20260108092542.1371-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfXyYpJW3ScCWNN
 qcqE6HpVPOMfGKpp0fOmVsX1Ai616kDO0WvpF8YK4RxPOzIVBK4mEbiWF+8Ez2p5tRNRKIh/2F5
 w/ghBFT+2IurZnNW/1ihgi7LqoDADl2jGkqpE/qokKMmR5bc0BOOJMPA9yaQZFb20S26+d8dghJ
 xc93nUp9RZcodqWsdF//FK0qoT+lBmsgNqGnP9FOn7hddQwalyuiLJrncoscGKUR242urNH1Qty
 ym4hjqgdACzk29ObTYhZxYgCIG5EUCvrWRk7Ku5mP5xsnHOwfM8x4i6cDQWiaD5wsPJUFoNsw8D
 DO3rprKwcnwqDTW3vtKtk4/ncDTOCmO8LZTQFOTtU381eAejL5jSCnrqlitrFWIz4kbB1fezo35
 dVFTh5xANITqYIA3pJqfHra1BwD8XaF4M8K3b9AYQKqTG0Bdt//enltlCSKdTGd8hhC/soMAI5c
 eqMFwrzSPKsQNaMIH6A==
X-Proofpoint-GUID: oAeL4cGfBvxdb9wSWeUPJcYwg-OjnwAr
X-Proofpoint-ORIG-GUID: oAeL4cGfBvxdb9wSWeUPJcYwg-OjnwAr
X-Authority-Analysis: v=2.4 cv=XMM9iAhE c=1 sm=1 tr=0 ts=695f7823 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HPTGEUuRviVpGpH0MF4A:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080062

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Swich to 4 interrupt cells on the GIC node to allow us passing
the proper PPI interrupt partitions for the ARM PMUs, and add PMU support
for talos.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
Changes in v2:
- swich to 4 interrupt cells on the GIC node
- add PPI interrupt partitions for the ARM PMUs
- Rebased on linux-next next-20260108
- Link to v1: https://lore.kernel.org/all/20251217092057.462-1-yuanjie.yang@oss.qualcomm.com/

---

Yuanjie Yang (2):
  arm64: dts: qcom: talos: switch to interrupt-cells 4 to add PPI
    partitions
  arm64: dts: qcom: talos: Add PMU support

 arch/arm64/boot/dts/qcom/talos.dtsi | 328 +++++++++++++++-------------
 1 file changed, 174 insertions(+), 154 deletions(-)


base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
-- 
2.34.1


