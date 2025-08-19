Return-Path: <linux-arm-msm+bounces-69708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7683B2BE1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA1B75A1436
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A8031CA78;
	Tue, 19 Aug 2025 09:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnVc0skG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03E831CA69
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597168; cv=none; b=tvPEE5dITrsgjcFDdKbhdaJSu1MttfcDow4VH11i1lmgmQeR8sI7Eg4vmCD1Vd+Nj/Vht6hxihMo+2QjYWxbKMENfvxAjbdBLTZALSeqZUwn/lO8YjqWZkYbiggkiKgUwf7RYKNd2SC6e3JpK9ba2U/BTt3lfQI9Wl3S3Jct7qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597168; c=relaxed/simple;
	bh=38N9I0VKimRfRVnSSj6djIRevZawE7ZVJqiqrTU4J9c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EqDPV3X3I3m9jJJTs2MgBgbjHV4nb6NcYRhGOpBp/MDj/uqIuHrKDLm9GtyMTM+xgjz/JgUdFBcsJOIN0B/sgEkCdYqzZ1rFfDN2slGnX5k6IiidDnQYSO1F+bC9sd6dXC6fgn0Xmv+7j0tSCKu6pfgbyu4KznoPijrsY7Iz9fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AnVc0skG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90ZGa008311
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yMSbPrOON3TNvIQidDDgr1
	8fW3sn3LB1WNCcBukXkTE=; b=AnVc0skGkGbGeM6mkSFhPmkSGEuTKXM48DiEa/
	6gsoXIzhfSHQKOoRiRWgP/l/GAqKitBBsvQKUalksHdShEZs63dYGdeKDVBDRzh8
	AKDvMRCHYkg9MNkZWMVldaWofBvd5Bb7H4aqzctmkBkYE5+nbBvZ/q9+CmZfnd4I
	XCWRsOiuU2MtOO9cqt5m9IjcQzcwEXSG8OB1AHQbqW24Z8ss8Ut+Q7QE/SpzlNbY
	hpbeImAYmUzrk1mDP5mrbH1j0JLIukiXTwP+28l/0vGNVVjC+xIG03reg/TMWuO1
	IB72dV/PKlNk/InFH7ciu46wfuiSnS2Aigu7Mzp+NLpC8ljg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99r0wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:52:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e364afb44so3348370b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 02:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597165; x=1756201965;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMSbPrOON3TNvIQidDDgr18fW3sn3LB1WNCcBukXkTE=;
        b=xP7r/79Rm0d0zyCleFGzduIldIbiMyl9ZwarNaRlUqi26kCeBWKXrb+KsDZAwsFA42
         OdAF4updDUZAv72GOub3HieSX0Dq+ILnTyK5AP5Lo4FSsb3gRC7R59GnGKwTFMjl8GhH
         vgvMNa0SI1hvDKDKxC2dCW4bjr0oEVPd15634FNlfB0TlYpZ4aoibgY9j5WHzA1cBG3A
         cts1HsbuIqRqN/x/ZHGbdiGkbogv+kOjB/Lk/XlnM9s8r6mpxpKCCmFnHY3xQQ/LHGXP
         0N0ri4ESIiT02uSBtW0hYPwFHSnV9YGxCNGJR+RFtA0g9pXkQvjvrpA57pcEC+IxvAr5
         lc1w==
X-Gm-Message-State: AOJu0YzLx1wX4Dw2hvPv7g3jBqkFeanJeGE+TnsbiuDQG/z7smNwhz7o
	n+KeoOrba/3aTSJcNwzDcrOizq2c9ee+PPJPGl6/CjbWFGMkBBotN/YNPZJh9/6dbZnpsYdP2Wd
	qHiccrcV6T9RNm3qbwNShSYQC0ECqXTL+hJV/3+AHXoNTa+hqc0PXr5o04RbyphNBCWQW
X-Gm-Gg: ASbGnctV/yHQV+MTXPQGitDYW+FY92fO6xXwstXywMEgzKUfhHXt9Q1fxeXR31EP1Xs
	nYNBqAO3T6N4XHbxCnVgZN9/lbDYSvI3revjiO6ZlUnEmeoZbLJbFxxg2n5d4zO2eV/SsnYCTlQ
	ovZzBAop9+XxumSfN2e7fUvW7QipGna/co+jJocQ/yZhYoKHdiQ8l1HDZ77UbaYV216qz2MZ7sD
	Vr4+zDJvOUXLqK2ySxrz3Ht2n7K+1pFdumnPfoAAeUPrZB5QufilKiLxmR5ImJM5QOLRyspqIMT
	yA+ZFXRBuWGjYWFRF4xBfltzbNdmIBJpiqjgNlp13YvhJWxIG//uKH+672XhOo4NEM1EZ/EVHcz
	tNjAUSLyawdJ5Tiw=
X-Received: by 2002:a05:6a00:1406:b0:76b:d75c:8a76 with SMTP id d2e1a72fcca58-76e80e900f7mr2238850b3a.1.1755597165142;
        Tue, 19 Aug 2025 02:52:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERARc6TEVlJ3blrIMH87ei72Iq1vvtNGAWDumq2BbBlVBab5p3465uV3MClzQxCQhrzchKPA==
X-Received: by 2002:a05:6a00:1406:b0:76b:d75c:8a76 with SMTP id d2e1a72fcca58-76e80e900f7mr2238809b3a.1.1755597164687;
        Tue, 19 Aug 2025 02:52:44 -0700 (PDT)
Received: from hu-wenbyao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4f7cf7sm1998291b3a.69.2025.08.19.02.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:52:44 -0700 (PDT)
From: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Subject: [PATCH 0/4] PCI: qcom: Add support for Glymur PCIe Gen5x4
Date: Tue, 19 Aug 2025 02:52:04 -0700
Message-Id: <20250819-glymur_pcie5-v1-0-2ea09f83cbb0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAERJpGgC/5WMywqDMBQFf0WybiQP46Or/keRYuKNBtTYpEpF/
 PdG6a7topsDc2BmRR6cAY/O0YoczMYbOwSgpwipthoawKYOjBhhguQ0x0239JO7jcqAwLVMQBP
 OgHGOgjI60OZ55K5l4Nb4h3XLUZ/p/v4IzRQTnBUSdMalSFVysd7H96nqlO37OMyef7vFF1dnu
 iKMUikz/a8rEg1pASAZkZ9uuW3bC53ppuknAQAA
X-Change-ID: 20250818-glymur_pcie5-db4ef032e233
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755597163; l=1518;
 i=wenbin.yao@oss.qualcomm.com; s=20250806; h=from:subject:message-id;
 bh=38N9I0VKimRfRVnSSj6djIRevZawE7ZVJqiqrTU4J9c=;
 b=02RxM9rKPE1R1Nls2PZIH1ASO0SdWMzgA94+HFc7dUqJpc1XOl66Objos0mlbgQbHDrb9KAmJ
 6FRtmuG8KDeB9tPlMz02LBa2wEqxsntUipQ+k5undh32so5apmj6XXd
X-Developer-Key: i=wenbin.yao@oss.qualcomm.com; a=ed25519;
 pk=nBPq+51QejLSupTaJoOMvgFbXSyRVCJexMZ+bUTG5KU=
X-Proofpoint-ORIG-GUID: sxMxIgLH-4YYsLPtpz0kkeD2yPzjnbmO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfX37DikmdFWoea
 DTiy78F7bdLGyYQGBjfSTmPyPN7zJJbdqO1fDzU7Vc/bPRuiPhor9OpFFzzGT7KN8YGsld/4xKk
 avmv59JPQjf8UVeQYmh138qifJV9J73+Pq5r1+NRO19Yz7hsePs+nvGwnI7WnRjpOjlTdeokOvI
 kw0XaRvaVj8JJ+GQD87iQJrTfyokvh6wwuECQzjdAUanSKk/oDjfbzG4R68ayjEXJEIPaSyLEMP
 1+kSv5di+pZc0vNAofQGuu2n3kIvt1tmgkGW882fNDJ7p3uWuedXVRA49Va0FCtUPmGewBcaTRP
 7Wr3MS2n9/MD3AyCa2P+y7j3bjk3jTS6WG1RVg6liKHMi+QbgyF1IPsMyKblbHA+yDb9a2B2KBm
 8Kz1CpDC
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a4496e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=450xJL59MvcON_dSg4wA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: sxMxIgLH-4YYsLPtpz0kkeD2yPzjnbmO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1011 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045

Glymur is the next generation compute SoC of Qualcomm. This patch series
aims to add support for the fifth PCIe instance on it. The fifth PCIe
instance on Glymur has a Gen5 4-lane PHY. Patch [1/4] documents PHY as a
separate compatible and Patch [2/4] documents controller as a separate
compatible. Patch [3/4] describles the new PCS offsets in a dedicated
header file. Patch [4/4] adds configuration and compatible for PHY.

The device tree changes and whatever driver patches that are not part of
this patch series will be posted separately after official announcement of
the SOC.

Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
---
Prudhvi Yarlagadda (4):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the Glymur QMP PCIe PHY
      dt-bindings: PCI: qcom: Document the Glymur PCIe Controller
      phy: qcom-qmp: pcs: Add v8.50 register offsets
      phy: qcom: qmp-pcie: Add support for Glymur PCIe Gen5x4 PHY

 .../bindings/pci/qcom,pcie-x1e80100.yaml           |  7 +++++-
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |  3 +++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 29 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h      | 13 ++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  2 ++
 5 files changed, 53 insertions(+), 1 deletion(-)
---
base-commit: 886e5e7b0432360842303d587bb4a65d10741ae8
change-id: 20250818-glymur_pcie5-db4ef032e233

Best regards,
-- 
Wenbin Yao <wenbin.yao@oss.qualcomm.com>


