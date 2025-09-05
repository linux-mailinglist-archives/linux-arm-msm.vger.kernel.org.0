Return-Path: <linux-arm-msm+bounces-72320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D3AB45C0C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C012188BF6E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44AC31B80F;
	Fri,  5 Sep 2025 15:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XEpTXwnz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1072A31B80B
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 15:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757085062; cv=none; b=QUy6SP0+ZIQhbtJ9d1EvhBgKYVPyAtxqIfH2qHLk9f67Msmg1hQ7zbRE3NZRwrmHkeJXLm0bvAgwnUSvojKdYfqDGzRybCqoeBGl4XJV1NsLGuAacZwZfAEymmscYwk8msr/g/nB9r5ULhzNL3Yrx+D3SKMwJC7kJc7lgGr5hcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757085062; c=relaxed/simple;
	bh=BqHA2KI7+E2wg1IN5Us0LjPUXVJRXh89VEgZqldP01g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZrdAEfBkhZklv3molS55Eo+mc4Y1dVoNhvH6J9+iIGe8QSWa1HItgO6n/JjAOnpqUoBZ5ciYsHbLyGjhCQx2GNLUcqPYDOu5VPOL+pnPkY8upuNqxAMoes26V2qEFpsfpqqM/gAGKvyeQPBW5buglBLttYYVp4PgfP0j1OeBI+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XEpTXwnz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857RdiL022450
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 15:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zCUHK4JFj9/T7BE19qN/qk
	2a+SV8gFmOlRACJ/Kqf8I=; b=XEpTXwnz5PB6w5E3IGR7bKCDisTzDrgig6yQuA
	ON6AdQ65OQQm0RQmsgMuwezC7utsjqe5XUWsMtXOtqjmF5dRLJ7iN5x69tYVawmQ
	bPEKDOxXw40fN2LwchmwpUwRoKJHUADYt4le7jXlZiBMNjQye8OI3eVhkE+V1iWU
	4gH+a1KuzV+6cIGFlC/yJaQpxekusFaSrWsOZrzrHIbE+rZ/WoheZ/tqexuARcDQ
	vdvEnWAgPeOVsgPqaz0hC3+feaj4vj0d3h0Jnr4W5YzOkbdiIA4rCtueREOLiam3
	MJ9yET6jcFJ+Khw/vkKqwVhrf+GhNpWYlwqWub/shxxi9z9Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk9bc7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 15:11:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24c9304b7bcso26358385ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 08:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757085059; x=1757689859;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCUHK4JFj9/T7BE19qN/qk2a+SV8gFmOlRACJ/Kqf8I=;
        b=YIuCD1Fq4fd/qY4Sor+gyy8P4lD9t2Apu5gPNPEjB+wRYR/u7H1S4Nz5QSMEvMBAiJ
         jUSWC2km9asl6sdUDVtQndzw192kzkcmpLGZ72rD21QEIdCNq2vpuMclPEQduRQg3z4d
         6cnFeoF031XZMZibLPOOrnMJH9JUsVDwD/yKu62wrjoJ9kqP2giPnl8Fwllk/h8BHZpC
         lLakH+Gm/8GDg5ZD0J4KsQ8ZrGdbSQR2IExx43tDVifLp+13o9a3zNuJ7btT9noMqJ0l
         ne4qMBWb4vU7jsj79roj/Z8w5d2un90O+3Wy/S/hrhot03ewVph27/2QyL7YpaTQPBqi
         xh5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxC+tXcY/V+dqDCxa7uSqe5ZnfALEA96SlM4JappI99S7j1/x5dK6o31KMpTQ4Jy4m4BSg+GgkofBQDPft@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2o8vNAkPbzXjMnC30LRrYy76cg8EO0EFjO4zYyUYWReaUQ2Xw
	pgnfkSch/6nTEta2Ldk2BHFnM++DU9ERB3vYg8Z3OWapFI+HN8I8Syf9nmxuGikbocrBUTzGwbD
	y+eVhrSgefybGxaFkLJT16RvmjYNNtXJF2lfrf9DwrFfqIUT4G8qgAtVAIaTde9FJ7vV7+1PLIK
	cl
X-Gm-Gg: ASbGncuyd8icytTKAcuDgzCIHwSUw5wY9N5zFuEWkLaBudidI4Q/69EX3aE+7CfIqpf
	S8GeqBjZGZWmNNiBgwD2dA4MlWNSONu5QrMb2nVXQGl0Ss6ipJXJMdDkVRG4pTTS/33GvqKDEGk
	VUFWroSnuuQ2yT9wzp8B6wdK0aWXkCN2492icfz/y8/JfOrg6cJqTxANNWcXsqvBiovujLSqwlx
	xgHIMPwOvdWs4WmqiiPOSj3UYKGg2RbGZp3Zb1W0X6iNsiVP+J0L8hZ7KkGpjq0hUGaQJZHQVU6
	rmzb4/IuR1NQUiD9aubNSwqcWrsYohAXvjcxoRAYReWsj7U7MmePGBVsX8lR0zmzSM2d3lPXqiz
	qCRPQUOPI9qc1f1P3LB4EuisOmMbaelbuAggaBqdg+kK592FIhYBXnevCh0qf
X-Received: by 2002:a17:902:d552:b0:248:ff5a:b768 with SMTP id d9443c01a7336-249448dfcd7mr276291155ad.10.1757085058996;
        Fri, 05 Sep 2025 08:10:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg4+nMFAS/BPgW9bPSO2Z4RPxKHv0LPQfTZ6rcqDIJDLKIhTOAJ1a06wN5qeR/MIqSzQ9cVg==
X-Received: by 2002:a17:902:d552:b0:248:ff5a:b768 with SMTP id d9443c01a7336-249448dfcd7mr276290355ad.10.1757085057885;
        Fri, 05 Sep 2025 08:10:57 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f5a0bf9sm29279908a91.13.2025.09.05.08.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:10:57 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: [PATCH v6 0/2] pinctrl: qcom: Introduce Pinctrl for Glymur
Date: Fri, 05 Sep 2025 20:40:18 +0530
Message-Id: <20250905-v6_tlmm-v6-0-1720e5080415@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFr9umgC/2WMQQrCMBBFr1JmbUpMmrG68h5SJNSMDTSNZmpQS
 u9u7NbNh/d5vAXYJe8YTtUCyWXPPk4FcFdBP9jp7oS/FQYllZFHaUTG6zyGILTSZFE3FvcExX4
 kR/69lS5d4cHzHNNnC2f8vf+NjEKKAxEZao1pWnWOzPXzZcc+hlCXgW5d1y/+AXS1pQAAAA==
X-Change-ID: 20250905-v6_tlmm-323fa634a61f
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, rajendra.nayak@oss.qualcomm.com
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: oI9pVkYkJjrlPHcjBCCf92J3eh69CC82
X-Proofpoint-ORIG-GUID: oI9pVkYkJjrlPHcjBCCf92J3eh69CC82
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68bafd84 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=XKE42yAn20ll-QmRT3oA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX1gLHM751QX1w
 HhxRmc16Nmbs+q9AlhH3FEI/hZ8If6WUIgZFZkN/wb/4tw/itjHs+VB0lwIhtnCMafLY5bivfAq
 GuhKVa53F8Ovx7AxUGmLvS9YqiPHmeF+xTpxsDZpTnJte1YctxhEzMidd2GWEl6KdBBd086VNuD
 D5LTZO6pWaCerppOraGWd4/T5v4rHGZOhYHyfyMG6u0JZewHAvBde9e/BcLf1zEN4iqRNHS/AGE
 Nuu3oQsmXtjgClc9W1aSvq5XqWf47IRkPER+3052BN3ijS5/1OcgTMKuvMmO0JAD0O6cclLGuTx
 l1zHHLr3icjRI+5787dlmMVZQsEXFo1Ppp+/4zQHUBy1qBkMedOdm+qp4aDK5zte5DVzIx8ZbAY
 +/fMiuka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

Introduce Top Level Mode Multiplexer dt-binding and driver for
Qualcomm's next gen compute SoC - Glymur.
Device tree changes aren't part of this series and will be posted
separately after the official announcement of the Glymur SoC

Changes in v6:
Fixed maxItems for gpio-reserved-ranges in bindings
Rebased on top of devel branch
Link to v5 -
https://lore.kernel.org/linux-arm-msm/20250813065533.3959018-1
-pankaj.patil@oss.qualcomm.com/

Changes in v5:
Rebased on top of v6.17-rc1
RESOUT_GPIO_N changed to lowercase in bindings and driver
Link to v4 -
https://lore.kernel.org/all/20250723103644.4058213-1
-pankaj.patil@oss.qualcomm.com/

Changes in v4:
Updated bindings to column length of 80 char
Link to v3 -
https://lore.kernel.org/all/20250721163221.310746-1
-pankaj.patil@oss.qualcomm.com/

Changes in v3:
Fixed indentation for example tlmm node in bindings file
Fixed s-o-b and review comments in the driver
Link to v2 -
https://lore.kernel.org/all/20250721143037.20983-1
-pankaj.patil@oss.qualcomm.com/

Changes in v2:
Fixed dt-bindings error from example node's reg propery
Fixed gpio-line-name maxItems
Driver UFS_RESET macro updated
Removed obsolete comment for pingroups
Updated ngpio to include ufs_reset pin
Link to v1 -
https://lore.kernel.org/all/20250716150822.4039250-1
-pankaj.patil@oss.qualcomm.com/

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Pankaj Patil (2):
      dt-bindings: pinctrl: qcom: Add Glymur pinctrl
      pinctrl: qcom: Add glymur pinctrl driver

 .../bindings/pinctrl/qcom,glymur-tlmm.yaml         |  133 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-glymur.c              | 1777 ++++++++++++++++++++
 4 files changed, 1921 insertions(+)
---
base-commit: 578c9ce6071995e1c2e7ec3ecd2fd2f5498a1dbc
change-id: 20250905-v6_tlmm-323fa634a61f

Best regards,
-- 
Pankaj Patil <pankaj.patil@oss.qualcomm.com>


