Return-Path: <linux-arm-msm+bounces-74263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FC4B8BDE9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 05:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4100A05A07
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 03:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C66B223DD0;
	Sat, 20 Sep 2025 03:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3YmAHs1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687E120D4FC
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758338477; cv=none; b=QM0vqEZonFESDsu5bItBIt4MaBenk8W92uw2QWbhTrXWASYiTm2qP4F2i2DAzYvEF4Z1FEjmBydSrsjbhgimigQIP9tmlpWJLRC8HgTzB9ZqdG5p0iwWZgSrEHGoS/TXsMsR0tRSbVz+Y1vEwS935GIS8TSVyXJbLCXyU09m61o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758338477; c=relaxed/simple;
	bh=PqUjMQNf8YZ2okXi7HcjlR0ay9cNBzPa0lh9m/FAw9A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iqYbKXtLpi2xJU2p0c6WcFADFILX5ks9PovgzIWoitZaYP/IoRp+W1ednPSZcPhsEIESAnbsR/kRC7LHjnKfm39872hmqpJQPRv3H2DtiBBLzT32sKh9P3TD5lMZDsT/RnZBHleeAKkOo3TYvpg2IQvQnwhMKWVIIS2PZ7fJJYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3YmAHs1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3FZ7w032317
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mN8wYVl6ESU9lxZvT+z+knTGjWTBarbi95s
	9t96uFCY=; b=D3YmAHs1L6zuwjw06urITN4y7EtDHdeq56luBVMG7I27Lr5atif
	GfJ3PrmQJH4Ag9rXbyWWQMvdgTAjLTeNJBnvG0KACRgZDiw9ranfQnZSXXXjhqaJ
	3YBn7FIVA2kkzTJGsHvLwXDLWmeMfYfEREJh2a++BH56KdStgU0rSbjRmK9/rrgc
	t1RYZaqPsjg+W313FWDVs4pzCON6CuxQhTDwximWmb7d6peYOsIqva9+aRGk4swA
	rGPQkCXBvrXgPrfKYucxbTPJYpMqFtkrozrEYxuSlo9L8D9B72W0Y2VEibD8ciEl
	OiQ4Oglhg7jTf6g/xGvjMIu6jmOmO18zjVA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4982deh3qa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-269af520712so23869705ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 20:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758338474; x=1758943274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mN8wYVl6ESU9lxZvT+z+knTGjWTBarbi95s9t96uFCY=;
        b=GrSUkXdFXNX7EJGeP/fgof1or3Vk7sKufdC21CEg8D89kD5PtPzONqWZvLsAwwXfsb
         /GWEu3QYHTNvyyQJKVYw4ilhWwHqxuFWjB3A5TyoCTiFgel5TceyYkLlovPCHl8p6gLQ
         gz2dmmst5ATYn2Vr0b9QUirX84IfhV3VwBTIph3iyeIwHGOupD2LUorCmc3XpEjFIfYU
         2PJLgR/iVbkq7hsRRZtLTjMzig8COI1MaP9kATAa96npV96FxHMuNkopyhlnOME1BAHm
         v3uostnX0Mb/1qkwqowvo55Pz6cmEZxwnWkZ7LUXfzaoNUPePh3Ic+SnMWZXJSCOIPjP
         BnWw==
X-Forwarded-Encrypted: i=1; AJvYcCVkcsLFf/W4rPfaw2Xx6QrApHiFA+o+0oJb1q+9JNxqw/vKoFsfZANX/WUowKDVZqgHQ5ke5xbz0EYEovzu@vger.kernel.org
X-Gm-Message-State: AOJu0YxDdTG347UeYuKE8TUxPBlb/t2SlnDnRcrRfBFaGXMo3Jb7Q3m1
	/MsDnOvMF2Od+jy5Y0MD6Cdf2di9iMuB7vq0EUeeG+zYCJUREyr4ztQLvFN8xXVyeBFFdLirs5V
	BPbZ0+LW7FLvQBhbl5+VA7ZO4gcWoFANqJyNNy5oEMa0JENFUeIkPSxRTUT/h68Q5eZTA
X-Gm-Gg: ASbGncuQAvpJ6xXu712eDs7iikVN2XrUil4OsEzywRuWUq5E5Yyzjpipc9Qc1TWI7O3
	VqSkZ+Z/ukLGiwB70nT0C0aiwXR/3jg4EC//uAww9pKiMiAGVe5uOgeFjN3kj3iq/x3Tdc3FQZC
	02zZkkKBbNXAHN5/GlghBvpxepNTGvPZWezZMYUCi4Y4XdPEMuo3Go8ziZjqDsdMqGQB4tB4I4a
	OU9UeurLAiF6JF9QdXRUSkT531PIxFnvOlUwbVMGT3Q5C8iLf0kXf9mfY8RMzJZgfGp0bl15N7Y
	LcOEoV/TJi9+HP3via+X49yUL6pKL21DoyMerUKh2YRTOG1q7pNeYwZkZ79vrNOMe9q/Xs5xp7K
	wu/TsOJK1Csv2tXQQ
X-Received: by 2002:a17:902:f645:b0:269:a4c5:f442 with SMTP id d9443c01a7336-269ba527e9emr74545405ad.47.1758338473684;
        Fri, 19 Sep 2025 20:21:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeReC8gmZ5NxVSWhUvUGV0oy+A6Sr9TpiqHXGqgd1xFA4p7XvnSQnBO/UwfTe45cPbjeV1ew==
X-Received: by 2002:a17:902:f645:b0:269:a4c5:f442 with SMTP id d9443c01a7336-269ba527e9emr74545085ad.47.1758338473178;
        Fri, 19 Sep 2025 20:21:13 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff448058sm6178807a12.54.2025.09.19.20.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 20:21:12 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH 0/9] Introduce Glymur USB support
Date: Fri, 19 Sep 2025 20:20:59 -0700
Message-Id: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YfO95xRf c=1 sm=1 tr=0 ts=68ce1dab cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=KpXeH89YwCTRUSzem1gA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: lM6V0s5zSVKBYaStS1G2UkXnGsTX7-z1
X-Proofpoint-ORIG-GUID: lM6V0s5zSVKBYaStS1G2UkXnGsTX7-z1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDE4MiBTYWx0ZWRfX7Bui5Y6II0K2
 kolsjkjhNHtyns4IY5/DN7fG22f2moEZMRGWM6fZeQK7wN2ik8DKbGru5qzNybm0623/o6lhjeH
 01RAQPlJK/o3849b4j+9aN0giSJ6sLrO03xGa0+ti4mrvnS9PaRKoj1/y60NbVsjBuSU8m6k3Dt
 gbN0dl+AEUViSCKDwJRTygNb9otyafg1elOpFQiySGXEzDf7Cop0v2q4POGTxQXN8KP28YrGAyf
 DgrrIqkIOfDqSZlIm9+mwxeSccPJ+s0ZT/Lbu59lo/e/iEXnUWgxXjAhhm1rCHszGrxOlEiuIqm
 ZGHlsTQtQWj0KqKDQ/+93XvN2JFbGGU5I88fjOj50KdyFhmYyYpLxxUKHtuazbtIXCEZOnWkU+b
 idcXrXmi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170182

This series enables the PHY level changes that are required to support
the type C based controllers and the multiport controller.  The typeC
ports utilize a usb43dp based QMP PHY for the SSUSB path, while using
the M31 eUSB2 PHY for the HSUSB path.  For the multiport controller,
it will utilize two QMP UNI PHYs for the SSUSB path, and two M31 eUSB2
PHYs for the HSUSB path.

Elson Roy Serrao (1):
  phy: qualcomm: Update the QMP clamp register for V6

Wesley Cheng (8):
  dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
  dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI PHY compatible
  dt-bindings: phy: qcom-m31-eusb2: Add Glymur compatible
  dt-bindings: usb: qcom,snps-dwc3: Add Glymur compatible
  phy: qualcomm: qmp-combo: Update QMP PHY with Glymur settings
  phy: qualcomm: qmp-usb: Add support for Glymur USB UNI PHY
  phy: qualcomm: m31-eusb2: Make clkref an optional resource
  phy: qualcomm: m31-eusb2: Make USB repeater optional

 .../bindings/phy/qcom,m31-eusb2-phy.yaml      |  11 +-
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   |   7 +-
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |  45 +-
 .../bindings/usb/qcom,snps-dwc3.yaml          |  26 +
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c     |   4 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 347 +++++++++-
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h    |  12 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h    |  17 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h   |  12 +
 .../qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h   | 639 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 163 +++++
 .../phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h  |  33 +
 .../phy-qcom-qmp-usb43-qserdes-com-v8.h       | 224 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   4 +
 14 files changed, 1513 insertions(+), 31 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h


