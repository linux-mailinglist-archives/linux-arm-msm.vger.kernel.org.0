Return-Path: <linux-arm-msm+bounces-70794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C90CCB35323
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 07:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8958F240A23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 05:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800D323FC66;
	Tue, 26 Aug 2025 05:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AH2uWj3A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D8311CA9
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 05:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756185515; cv=none; b=QCWLJs0EWmnPaf54/OJ/f67A2hdBA0xpQHXRqyM1woIVgD7tlVu2OdfHO0aey6z2KRx28xeCsxCeifGuZ4yRp9EXnsd4NiJnxtMrft+SibxQXaPoLzIFw4Q6PRLJ1I17db/nssi5IlHq5SbcQd3oQ927Ju9WQyfo+95eO0oMC1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756185515; c=relaxed/simple;
	bh=vlIwpMdPLzbszsLDUE4+FJfpWc1+VEt9tIvX90Lc+30=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sn0y9H0IVS/OjqB1Uz2nuaFk+OlZTlY/mZ7+7hKKv4SQHQp684Ajcsi8aZ2890TWBTSDou19G0mPxchM6vwK/zRJ+HAPbCA02iCx06yAMr185qOOvm0Uo5fOPxqwNaK0pnvNhC7KnqIZKtd6lg3pYhX0ODqZLzDlnwdjycm3b3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AH2uWj3A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PHNPGK017266
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 05:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2vsPhyKBqG+IBewEtmHLJo
	hfftWb+4Dg3ZClfwqwBQM=; b=AH2uWj3AsUXqsfQ9CHE3rUMsJRLP6TjvIt5RW5
	7gJxkvCYE8uNT5h6V4K+VAen4WClM4AcRMf4qlHI4DV9FEfBji66EpcuTyNPQtKn
	yMrrKbWItE5QSrrkZm1y7GwnQz3oBDjN+0D6mh3XYTnvVE9pxPoMA/wqugwrf3IV
	vbJTNp5c3Da2VQzyXaxA9Fb8/sOwmmBCoqqd/u3ikMBfV9CMOurqWSoJN6v0VQqw
	jjnyed6mhXC2ZimLNKcTkQj4BHdgBn+P5I9oS6ERPYEUXM9V/n2/koFs6q7YGg1Y
	o3wRNklyQAxWoS3lH7Zh0U5kwn3QroqCpYJUEX9Yez66KixQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615fdqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 05:18:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-246088fc25cso57094485ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 22:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756185511; x=1756790311;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vsPhyKBqG+IBewEtmHLJohfftWb+4Dg3ZClfwqwBQM=;
        b=FJ4V2cI173HGMGYgt4AIwgs/Yn+hjst1PDW2mh6xdWpkcYt3WDUrGDjdZBpWyhnxHy
         8tzN+5aVOwGxRiJG/NmDz/0+tDcDsgTTzBN8izaLk2nba+/zu05sCWKz/oImVJnE6pkD
         7sS7IQH1rO5qxcLh0DwrCbj5rIhYYGzl+aZRQ2krMkimZaSB3/7cEwf6HIOnQa3pO8gZ
         1qkwDneGdSsNvGsgzi7Aw1HtInUyltcdI9wjVLe0KklpJNsB1fwhJ8jXMJLPNoiGNTGG
         THhZ/CGDClwCFh6LoD5TZprnsgCSy7TUhcj3vAKm/Bqb/TjGesmumBYgGdSWvHXmSP5J
         e7wQ==
X-Gm-Message-State: AOJu0Yxk3I74rH0Oa97prfinoBZLtOFynRrOMhK4rhJjDzUep8ruMi8V
	xEeSWbhnsa6rrtp+NozEDELjrHM3PCTFroTzugG33UHxnk/6FVTj0tgblPAZALbpXyHUM3Bsuld
	q8wC8e15MK2SEtbE6zOxHtYuv5Uub+1mA6o30hIHm9Ch3zBJy29CmDUyATnfCtS/JLwMt
X-Gm-Gg: ASbGncvXtJkvmPIWsnD1o2MFWEk+UbHs+lx00Iy5DZoHzT9LRTJ3nhkHvGmdJ2+WApW
	kx/1pcoglqrH+PF2EFwaQThBpqjD765/MQd677d4CA9UCc+7K/xN6JLX4yerOlCyv15VKD5xTse
	yZZeHyH+XJiNxaDXc+kSpEeo/VscJSEdAV3Fnkpx8tQNQL/WzcyUVYlmwSO963e4oEUtMck7dE8
	VRmeIjidZcDJDT4O7P+hjoshtSHK5lfriBxHdqyXA8cY8w+agFHqQPLeTWC1Rkxf/03jYKS0csC
	+cH4w8shIWqjzvycUmhPKyIUccu4nM43kLKittGJ7gBYIYw04fdMCLlRcthv7WbVj7POLFIn3dg
	=
X-Received: by 2002:a17:902:db0c:b0:242:a0b0:3c1f with SMTP id d9443c01a7336-2462ee0b27dmr189012685ad.7.1756185511505;
        Mon, 25 Aug 2025 22:18:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh6SmRROLIr6PMOz1PXF4cr/CmjrIyVmNC6hvrLBZh8ZNDcT48YrclMSup6MtV2RwVhMvgVw==
X-Received: by 2002:a17:902:db0c:b0:242:a0b0:3c1f with SMTP id d9443c01a7336-2462ee0b27dmr189012375ad.7.1756185511073;
        Mon, 25 Aug 2025 22:18:31 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466889f188sm84348085ad.146.2025.08.25.22.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 22:18:30 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Add PCIe Support for sm8750
Date: Tue, 26 Aug 2025 10:48:16 +0530
Message-Id: <20250826-pakala-v2-0-74f1f60676c6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJhDrWgC/2XMQQ7CIBCF4as0s5YGiGh15T1MF1OgdmJbKqNE0
 3B3sVs3k/yTl28F9pE8w7laIfpETGEuoXcV2AHnmxfkSoOW2shGnsSCdxxRaINHq5zrsDFQxkv
 0Pb036NqWHoifIX42N6nf949ISkiBXa/sXh0KhJfAXD9eONowTXU50Oacv54v/WGjAAAA
X-Change-ID: 20250809-pakala-25a7c1ddba85
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756185504; l=1290;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=vlIwpMdPLzbszsLDUE4+FJfpWc1+VEt9tIvX90Lc+30=;
 b=0KL+6x8TGQEUpYJvqY3iP7+9EiYO5OHNdo3h8C2d3xI/A7u5IucNW+PqyxEKSkGSKdoxYvNTS
 VfQB9wQxqcECRS59Ps24xjDDVMDDAnOl+9daRomBfOlTaY1dUeBmR0y
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX0McpsKY9XhFV
 spchiC8GDCArCs5CQRpdCCUACCime/dF0sMEWO0ybI5Xg+drvR65ZLEVRn1/Dl0HTowt9/sliqr
 TXZykE1D8Ov6caH9ayBwl50104SptVgGCCUxHNT50XZbpEkLA0fZVULrVbNMp9DRSdOVYmN56vE
 PFVS+t1MvQDTOuOwYx4DWWOTocf1ftls065X7jw7tSxBzDuGR2035fTKZHKb2x6mhxnNj6UM05X
 N2pti3Z6T+QVv2mrH6U89PJ1t2WQkhnx180tY95MidOCJGAaw4RyUeHka/vAV4wH8ldsleSZa9o
 2JJMXzbArdIX4yfOzV6pc8xLV7WWpQ0zBnVAPHtsQ2AhSFrLsXnVxTTWkOhX8JJJfvI2EM4C18k
 SXJ2WpUV
X-Proofpoint-GUID: isHWhBCnrMmsjv3ea0CvetQUbuewVSEV
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ad43a8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=qIbWdXD6M1inJYch3NYA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: isHWhBCnrMmsjv3ea0CvetQUbuewVSEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

Describe PCIe controller and PHY. Also add required system resources like
regulators, clocks, interrupts and registers configuration for PCIe.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Follow the x1e80100.dtsi pcie node description (Konrad).
- define phy & perst, wake in port node as per latest bindings.
- Add check in the driver to parse only pcie child nodes.
- Added acked by tag(Rob).
- Removed dtbinding and phy driver patches as they got applied.
- Link to v1: https://lore.kernel.org/r/20250809-pakala-v1-0-abf1c416dbaa@oss.qualcomm.com

---
Krishna Chaitanya Chundru (3):
      dt-bindings: PCI: qcom,pcie-sm8550: Add SM8750 compatible
      arm64: dts: qcom: sm8750: Add PCIe PHY and controller node
      PCI: qcom: Restrict port parsing only to pci child nodes

 .../devicetree/bindings/pci/qcom,pcie-sm8550.yaml  |   1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 180 ++++++++++++++++++++-
 drivers/pci/controller/dwc/pcie-qcom.c             |   2 +
 3 files changed, 182 insertions(+), 1 deletion(-)
---
base-commit: b6add54ba61890450fa54fd9327d10fdfd653439
change-id: 20250809-pakala-25a7c1ddba85

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


