Return-Path: <linux-arm-msm+bounces-74749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CE0B9C984
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FA704A8014
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892A32BFC73;
	Wed, 24 Sep 2025 23:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gShXKr9f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F158D2BD5B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756808; cv=none; b=B3w/TvNawayHnA9sf/vpLy8Y+L913J6kYc2NiZOBQil1R1/ElarqOWo5iJ7Q8k9BSxFAA5eyocCddzYrCrUirCqzJOzE1AD1ktQs/OwBxulgrXNrkFzTv8maCiroCGBEn4C2U5qAOl/i2TzelUWtoqY8xlk3bY74Fc0xJiuLn9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756808; c=relaxed/simple;
	bh=umxvkrokJQYk3xJ76JKSz66rH4x9Xxhhs+Zs0gWSzIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g1OcJbuivnpyiw3XSpRt5EEacNiXrwjw9h+uTNLsrrY3aLDJxpGvaRrIgtvMnIXCZHoXhO5x/P6dtCfROomYRwFNRUuBpSC7BjnmF75Q6mCvuxxobE2H4VHhf4ilExCBkY9OwaJasAmP1aLzZ62TqbnKqnNWvrcu3ymDaYlB2uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gShXKr9f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODSQtG019919
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYqxOAoB8NF5YCaEisytDjENjTj6bZ2vC8xEsIsfn6I=; b=gShXKr9fxnexgZ1j
	323gtm1ORSX+mhZIKqFiehvvOGitjdrSaJxVEyfWCun8U5yzn/5ANzYbiFoMh5W2
	bSA7bcwlR4n6W4tOLUzhu4QUknygOkG6i07INivhWaitkJPaOo/zMiZTDB3KGWc0
	B1xkQfOHnVgKzgy1VCj71NO8uch3toPozIbMSdnjdBwrpxmRhM+UkIqp90gSd6Ao
	nKR8Gm/Q/J6hFH1jYlVt3jhfygZTSOJejaQjPdeCkoHARO9Wja8VqPR4IN52+X+6
	Dpi/midkgzZo1MQnmveWd2n/qP6h/pXC2mWHM061LOkMm7FplSTjdWxd9cHwrdP9
	HqSN2Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdy8vu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b56ae0c8226so208932a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756805; x=1759361605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYqxOAoB8NF5YCaEisytDjENjTj6bZ2vC8xEsIsfn6I=;
        b=hYhZN/vCzhOw62L2mHpi/Nm99+VdD00ESuGwE+NBKPkOlqcTiCYmBeJAglM8mWwnJa
         MHMJTY3z1v1P3L8jcAKf88AOLf2iKz3Ipurm5U4Zh5iFacbQnIVAZVMINYSnmI4C2KGK
         Nf32p0FJz0miMP0ahS1BWZheOkzNo2kx58fLwDPmQ1OzDrDeafb4DrzJczHJfoMpdhyY
         ibQ7/AnAcf36aj6lwzBLpnj9SOjOSXa4U75OdFXt39EX/L6hkFc3wwjP3HnKV8IoVuoh
         0kikH2AWv3S110k+v8DIYER2daksACDvI5bJPs1zEe+jospT924reDEf6BhvJuI42V7t
         YnIA==
X-Gm-Message-State: AOJu0YyJlpEYd+RzxW/rakshTX3cAmr4Ma8kwjLBhsm1UXMkKFNb8GkE
	9wVdUodL6VNsUIdZ1F5KHdMT+P706ZXAaWNYVyRdz/nQwY1Jv8twDwE2sYO+kD2ALGkRVw4s6kB
	obBZQAZaMbjOMdT6NQtgCCrqjD0Utmjtu8aspN9oIn99TNFQKCGKgwkzimtEtCoWBB0QD
X-Gm-Gg: ASbGnctNXAcanHlh1m5tym4zpKYBATIZkWcDcgkvHqIU0NYztyjIjFa9OsEdqU8pZvQ
	2PYKNP3eN5tGfstvFVkjnWSOBKVbf7y2QlewdwJRQyLgKmje4gUvKv0JNV/Cyh2Ql/M/IvdzFVj
	aqv1c3VwACMYvxp6ZdHc+k3JHWXJEPGaeZm978tV12cHXlRfN90R6+w5QepDpBRC1jQjnxh4X7e
	HXifuP6ySsqj2453/kwlG4fA5X2ty95y1xZsLBo/SIoTg7Z3Kn3zFerp0Utgl7veRSAnrDPfRpY
	73Y6RUzhlobCQydIYCbo9+Ytk4sxfRwzPWa/BRPAkl72HvDSJ8Uo5uIHeEXyxafcyzIKvk0RNVJ
	Wby2fKY7NSDyfeVA=
X-Received: by 2002:a05:6a20:729e:b0:24b:bae4:9c7f with SMTP id adf61e73a8af0-2e7cdda1335mr1610557637.39.1758756805448;
        Wed, 24 Sep 2025 16:33:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECoybaViLhCapWPusumzB49M2p2wmSBDVVWBFqtou9GiF67zRhFS+R8iX5/dihHSrDIMe7Dw==
X-Received: by 2002:a05:6a20:729e:b0:24b:bae4:9c7f with SMTP id adf61e73a8af0-2e7cdda1335mr1610521637.39.1758756805012;
        Wed, 24 Sep 2025 16:33:25 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53ca107sm392911a12.13.2025.09.24.16.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:33:24 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:33:17 -0700
Subject: [PATCH 1/6] dt-bindings: PCI: qcom,pcie-sm8550: Add Kaanapali
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-pcie-v1-1-5fb59e398b83@oss.qualcomm.com>
References: <20250924-knp-pcie-v1-0-5fb59e398b83@oss.qualcomm.com>
In-Reply-To: <20250924-knp-pcie-v1-0-5fb59e398b83@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756801; l=916;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=f5d/tKNz4xRhH6PN5EHx3qLjVEk3ze6DJo2urPoB8ds=;
 b=w+hkMBPPUQq4P36jzBsLpA2YqJODM7WWQBRigQuS83N3PiZtdeKyxWT8T3hPfDuJWqcuIBS1G
 DlLzb4YfDctAqPe/xliHIj4V1ryO6sm0GGpHtZ65ZSTQ6pA8hho71Pb
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: 0C7wkMf3iqXyGCxCdVbMCwbKa8starUk
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d47fc6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=cOhV6jHuZs2i7JAHTEIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 0C7wkMf3iqXyGCxCdVbMCwbKa8starUk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX7huQMkOlVqp9
 Iav01OFg4Jqv/4k15G3nGISYp1fs9B7G1RYJ3jJCyv4AKhELOa/whEvrU0tL5dXVH9C2Kd8eMfG
 xav1V4O9SeCuT8E1MF3nny0GGBHcu1x0ZGcTTyfMfvfayBdUajmtrovoKBadMTIZ+EIWIDuO8eD
 eg+b7RJWRHrCBWBov/FB+5oT6mb2J8lesjhppVqOhZb9aOzy8HhK8llUqApMtk14oywSvsFrOv5
 W8X2ByBNtLKwMjLUy+6/2nNRs4jpFsgBgh0Ikkb04WA2CpmmopbkjKkKoLrLvaMJDvjswPepcgH
 LOJ9CK3dcJx4RvSwcnleCU/xEs9QRkQy7lXd/GwV2go9tE4rjdGENjET3Q3Gz3VXx1H38Lx2/UB
 ENWIDV+U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

From: Qiang Yu <qiang.yu@oss.qualcomm.com>

On the Qualcomm Kaanapali platform the PCIe host is compatible with the
DWC controller present on the SM8550 platform.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
index 38b561e23c1f..8f02a2fa6d6e 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
@@ -20,6 +20,7 @@ properties:
       - const: qcom,pcie-sm8550
       - items:
           - enum:
+              - qcom,kaanapali-pcie
               - qcom,sar2130p-pcie
               - qcom,pcie-sm8650
               - qcom,pcie-sm8750

-- 
2.25.1


