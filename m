Return-Path: <linux-arm-msm+bounces-74772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFFEB9CA9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26B3F327C34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C759E2BD5A8;
	Wed, 24 Sep 2025 23:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6F2lSwb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB1228DF33
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757188; cv=none; b=i1J+oeM1LvGh23i1l2v9zmpTaU2C8GQt5HFv4VaAeidY+N0Lkuozg/hJT+tFdjn9GGYaATkIFvGpbbRWeyHYy+jbqyoPj1L5Y8cwZ3/rxIr06QCaj/CadYTqnZEnTyBPMxdFFwbGeh9T6d5TL6+70J9uErxlZkxnVYH/UWMdwWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757188; c=relaxed/simple;
	bh=8eg+cFbUEqaa8C2+ywYwrps2m9GMnB3ORI9ICHtWuIM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=btKyYPZ4zVUux929OkRjLWnpd8HyhFhqyNDqqqTtwWAPdx5yoSXzLdgOlNAYSs7CjWS5yEdA6NzZhmgVWfZccpoJAG3OdlvnHO1+ooD4o9BPF7LMgk31UmDL4K20uyGm5n6nEIyhE/m08rJdRuYvcdCO/gCtomI4U5XCgHZoWWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6F2lSwb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCW1M4018070
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lO7q2RANT9ES5qL1pkzUDj
	0lrisGLmMonlVDVUcD5ZY=; b=K6F2lSwb9ptydWfM/GEgQdtIwjDpWbjdKf8eGi
	gOqgRzFaWjegp8ogQoDC93O8x9zhudGSDQOVcQMbo7C5z04ppknJn3MfE8mi9JIN
	z2u0zyI8xTfX0WZXEcEdCZLZX55rJXmEsAOgBFHOw5utFRr+NG6edGN/NwRqo3x7
	SdYqkDltigzjQLPsiRGEyGjaDM43Ua5vn9xNKySRSEoVR3a2zsjkfZD2tkBcHsib
	6wr6J6Uz6LK2Qao//wpBZLUdPdOrDm4Rj3Q6SoYS/Q++4e2/SsvO+Jfo7b8pZkNI
	yrCmkU/14QpjC+J7CWGezYD6rRCkPzb3U+YX58B361suLrCQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kka12s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:39:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b55153c5ef2so229493a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757185; x=1759361985;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lO7q2RANT9ES5qL1pkzUDj0lrisGLmMonlVDVUcD5ZY=;
        b=hS+PCnScoo1HVKSpu5LNicP/1wgK7rL9J4OthMchajMkbm9fknZHdSeVol0+mptat7
         Im39aU6BsDDE0/6Etf5FzbDfvrsgGYUTzPZ6QdudU+PkUsenQzuaroAV+PkXd2Lw0OvZ
         0wLsjA4/sVzzirErrhj9bSNeEunpqNmgfTtU+jqUIx5MEyFpSyz/G/8q4PGia6XWDyhR
         taqC/55mxFIoPTKbGYgIBNcSbl/lio5V1XhZOoh9ffV5G74Klp4BNXDd4PUC0tVhkLDh
         r0WkSXWLNVmWXJ6RsOayqgwe+jKBt0tf4MFuHXlKHlL11OyFKnG668+E/gnZX9inJEow
         50nw==
X-Gm-Message-State: AOJu0YyDTYcXx8gJ/LURHNXwBtjsHZiBGc0zFfxndvehYRcrLqZ/qEgw
	9uUDfP26eLooEb+ISh7MZ3Upo9ocHeYwyYfE9wdHsMGwjtyaLMSJHs+S7zA2db6S25UsEgH6k80
	kjftmVpQHU728gL4TPvs6BcaMPne7pLUyZgTRXtG9ylS03TFVf2pp6LMKHU9VL6Z+FQWD
X-Gm-Gg: ASbGncs/uWwxtNW356RveCvm5Uu3UYhxiK7+J5nnOzVoCtCJpuxLgEhY4NfgT/eiv2z
	JV8qMbwODRZmTTk0jpg2jlqRHGYcHsoIcUZGeFgCbb1vElQ1OWKe17t81j3YAY7XAcip5frQF9l
	v/Du6QQDC7pHaKrvHSnKHLKBT+M0jNHv5R7UuxacTbfNxdxD/9MtP7vP+4sWup6XNl5vu26HvLK
	y0dIyFovxR+771XjRNRuqK8AU07cZQzb92SZ18/3jRVyVsSNRGyjEbmDetHVddW9BvidZ7ph5HR
	QDkbbo/diox/Hd4Or43UAEYhgAotkwGa/I2PH0NCoOcrdJfgxc7AaCUTWxZYkcljGl8PCH/QEby
	FEr4ak81Dkd/sR1A=
X-Received: by 2002:a17:903:fb0:b0:264:b836:f192 with SMTP id d9443c01a7336-27ed4a2d511mr14978045ad.35.1758757184856;
        Wed, 24 Sep 2025 16:39:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGujwWV6tfUzBcIXoD7V5YBetQqmOFWFQHfV5bVrd9ni8278A6y08rnlQHTY7mPsWxSLm124w==
X-Received: by 2002:a17:903:fb0:b0:264:b836:f192 with SMTP id d9443c01a7336-27ed4a2d511mr14977815ad.35.1758757184427;
        Wed, 24 Sep 2025 16:39:44 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d3acfsm4610045ad.20.2025.09.24.16.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:39:44 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support for crypto v6 BAM
Date: Wed, 24 Sep 2025 16:39:37 -0700
Message-Id: <20250924-knp-bam-v1-0-c991273ddf63@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADmB1GgC/x3M0QqDMAyF4VeRXC+gtSL1VcYu0i5qEDtJRATx3
 dft8oP/nAuMVdhgqC5QPsTkkwuaRwVppjwxyrsYXO26OjiHS94w0oqp5+A9hdikFkq9KY9y/p+
 er+JIxhiVcpp/+5VsZ4X7/gJ7DfKGcgAAAA==
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757183; l=659;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=8eg+cFbUEqaa8C2+ywYwrps2m9GMnB3ORI9ICHtWuIM=;
 b=x94gWnO2PZ9XUBaMDycBf8LYB4ff8yEt2NCyz5lQCK9EKjoMLizUhLRyQuSaVmwuiH7fuwo5X
 FeIw9pWGKN1BYhdt9yG+VDtUuviQ9TAM9911G+GYKhPfmrReaz0M9R/
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: FXTskiqoycEtwyvb5rl0HMOj2xG1dbu3
X-Proofpoint-ORIG-GUID: FXTskiqoycEtwyvb5rl0HMOj2xG1dbu3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX6v1DUKC9Hd0M
 D1h/PxMzdRRKVVbzhqDx/f3ja5KMKLJW/I/4fCD16gdrl3m8vJPpXOesUNPlhNxSmo3wo+gbLYz
 TA/P8ulD4Xd+M9Kt3vNjLSWVEzizLs8ZDeKrV448u7RubSlWXFCR1rWVbL8XmQidGC003GbgUfh
 34u6RSQeLrinfzQ2BHxIXA+i7eJvxKJ7mKA/YDaVfEAD8xV/pyyhb9Xb4kF8ie3/deKZqtE8ET/
 N9ko8nZe3gouJT5Rg4sUK1H/343jMFflrBjilGoDEpldGzOEpQtBrMthD1macpsjVRA94u9dcaL
 8JWydVMn+MAZ86kUq+nvxzPR/aQtR6NxyiBVyghF58gY6lcwnaslBdx8c9Xl50vWHZd8T7Ltqik
 rexmVvWV
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d48142 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=czLK3_onmIaUr8cMAWMA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

Add document and driver for crypto BAM which is used by Qualcomm Crypto
Engine version 6 and above.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Gaurav Kashyap (2):
      dt-bindings: dma: qcom-bam: Document crypto v6 BAM
      dmaengine: qcom: bam_dma: Add support for new crypto bam

 .../devicetree/bindings/dma/qcom,bam-dma.yaml      |  2 ++
 drivers/dma/qcom/bam_dma.c                         | 30 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250922-knp-bam-c7e944a9b1c3

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


