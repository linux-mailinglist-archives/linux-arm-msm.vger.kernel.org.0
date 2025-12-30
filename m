Return-Path: <linux-arm-msm+bounces-87024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD56CEAE76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 00:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA29D3038004
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 23:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757E52E7F25;
	Tue, 30 Dec 2025 23:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yv+o7+Lz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLS+XWtI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D567F2FF653
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767137785; cv=none; b=G7pyVAb8zk8VEOiMd8fhx+CfntBtnViNQEFyRkxoDyG1G+e1WdxljbhQYYTB2duavgaSe5qrtnSf4B9m3dVLR94a/CxCkT/KNQf6k78m704zXOhBVt5Le83TIeF2ffujBt7o89e8fJwx1+P4NtFDYrLh7ViU5c9hfzAEAMy/4Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767137785; c=relaxed/simple;
	bh=dsdXZ95EeYH9C3J7omxSTW2//MbnLXvg26+sdstW5a8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZcjqD80wq2MkK1EWBj+gcpPoAbD5M+0Fg0G6/KkNVXRAW1ZskmynxXJ6kNm/cUw7HWtE5OH3+i64VPyCeAZz5+oc9IaXZJAhoX9NrukCwZU4r/E1+/yS0iNSxZVAg3DEFxMnnddGwQexdjWcR0Jso5Xd7SzPQzzVpzfjbUcg14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yv+o7+Lz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLS+XWtI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUBDWFe2672752
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GaHFmXFU2LgOEbPPkpReuSY4xCJ4+sCSY2NisbXzuSg=; b=Yv+o7+LzjZXcCX2b
	7JPyh9dZxYnPFPvoaXJK+MZLcII6w+nYNiZlcGovs9KUL0M8ZAZQW+bKoRxT5K7c
	4VyrMpDe2wrLxh7H6zVdTw23s5WWApL1T7WfQyUl1+WpGYZeMtoBFLPfh5rweUXv
	XKiMK3lCGnzN/qZSN+3vePKariXpGxjeIMaS7tt7COionftMy9+7mhzjPxMVYBMY
	KpZgSA+zu7cfJ/eIxEwYMwO/FSxXleDRFmAD6gjGdZkxUudT8CBl4KeblAzHC/un
	iVOGmwPvW+yRLgYJwQaQV/69BxbPPEdOQdzBtNnx1IGNgu17Bgi3KIVoB/FKafN5
	6ysvvQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc4fctp6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edaf9e48ecso285351751cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 15:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137771; x=1767742571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaHFmXFU2LgOEbPPkpReuSY4xCJ4+sCSY2NisbXzuSg=;
        b=QLS+XWtI/yYjhrIh6oIwkDKaGJygVqowTgMJARyEQ6xj+IMmwJWJIjxGhZc0WaTAkN
         9rdqqkBIEPnUNWB6JiiA2VsBiJRiIA2B9e+R8rkRoEmkQdDqdABANI9x4TRHfn+mW7qW
         d8PsyWmvlg2p9Y4d8GizNV1R+N5jxOkFHP4aenXAijIYmQEs/6wJ5/FFwavfAXBf0sha
         vzlzeGbmixXGTLpRmbhwB8ZCrBgqt9RQU+lJLVKvKdaT4ugwq01kCFSNkjdbS2aGN7Uu
         dWVwONsQ083uCNKrb8/8O0bF735YAxy/Gn2H/0Y0KHhPSk2DoiOGs9fMcz1X5mXxngVy
         C+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137771; x=1767742571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GaHFmXFU2LgOEbPPkpReuSY4xCJ4+sCSY2NisbXzuSg=;
        b=A7y3cVGMkR9JAmG6EuVPtuwCZjK3EXrJCFbPcwkmZTGnV5d+gP4CDC8AjVRpLcYAi2
         gjkvnALYK6RJe4EJNbVo4jC67H2N5ZwswIAIC79uboIWTqABZ43FFeu5TVSKzgBEsFFH
         klVvmSUObXNApR//R4Bx4r0kdg/rt9ECDARlEMrhioENuaXZBzreVNiODA/PE6c6yU+R
         iuk+4K+HBAoXVYEUHm7jzgT1iF7nRYrogb2WSpb1ZsJ/t0y8U8PuGv41GeZiSo3+rTZV
         Pi9ZUn55KT0RpubbUf+4OfD+6vNf6HKr/SYm9YkmJkm4LA5ESu6v0usX1M4SlV+EeVa/
         9vqw==
X-Gm-Message-State: AOJu0Yx1hOlMlCvCQG+GniK9za1QiEwDI9KodBsV0GyCYLTNMB223q/7
	6gI/9F0rquZ4nq0cUHI+7xBGx611Re1oq+Y19PlvZGSlpGEGUPe9P59rlWissNK5nnMAJmaXFJ3
	IHQf/e4kL7oKkb2FoPuc73UCvQBZ+22cBEo5aTTBFZDPgqOLwvpMVH1xDconrHNJcWTeY
X-Gm-Gg: AY/fxX5MlilHu6lQqgl9p6cDSaNya/Uk68skzi4iEDCPwSAfxu1OIrmUnDxrOu9QBYC
	2r/Ci0CT/NopSCXc0WEeT1+pZpIsPqcAxC/cLbv13e97W4Fb040MPQAMRBHZUf/zeM/AEkBqsNQ
	EHlleD7/cEzHRq/AZDj2/TwoshNRC/z3dGJQmTTjsx0NuDnj7kxfvwlRMpUhvEg8PwCf742Xf02
	fhVKd//C1F+5k5IHnqvjkp6K1iXTEImogQYhvfPwwoar1ao95iGS1Gnudq+T6MPWxf0sBw3ERF2
	CtSO/Hu77+TuKn80PHHn0BIJoVXMqC4mjhUjGpZWPZBlX08WrWLRG2Le9ChJzA2OP3VRFe0ldR0
	4CxkU2WD+GfAFuI4pabtieVG1A4WFgr7sAJDhiuzZoWpsHkolnqYy4L1lM8XSwFq5DZVStyp3Up
	j/hoXGCatzb0zCt5mFAwtUtYE=
X-Received: by 2002:a05:622a:28f:b0:4ee:1563:2829 with SMTP id d75a77b69052e-4f4abdaad3cmr497925411cf.72.1767137771257;
        Tue, 30 Dec 2025 15:36:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7BCqXmSeXpjNJMgSVwWhyvWdlkv5tk6ilmCUcGI8RE1/asO6kLVQNDkJuRevRigqYoaXlzw==
X-Received: by 2002:a05:622a:28f:b0:4ee:1563:2829 with SMTP id d75a77b69052e-4f4abdaad3cmr497925031cf.72.1767137770776;
        Tue, 30 Dec 2025 15:36:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 01:35:53 +0200
Subject: [PATCH 03/14] Bluetooth: qca: fix ROM version reading on WCN3998
 chips
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-wcn3990-pwrctl-v1-3-1ff4d6028ad5@oss.qualcomm.com>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dsdXZ95EeYH9C3J7omxSTW2//MbnLXvg26+sdstW5a8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpVGHks3ladrkLXuAKtpF6vTDXvxft+w/1qQfxX
 qPTZ4Pi+fqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVRh5AAKCRCLPIo+Aiko
 1X1XB/9RVAlu0fS0XyVVNsfzMyzV7ZUtWWfh4tVhINiynx0u4UygowO8h7lO24yuVEKKVUSTBHJ
 b8NAbdOwfEjJFZXEWol5x8ywChGdEwbxHR8bd44LeF80FJA8rlZlbgp/bs2mKAvCreZsyofEnZf
 +OOl+6Cu5kLFc6XDte7pn1yPsPv0OOMiZgodEdd5Q9eXgVpyzbaX625o4PSLYrcfAuxIPOE7oyc
 3wZydLNC3ueDiOeKRhr2+Rc4tPFuwf7vP2z/THMgsn315cBcWgPx9uHF6jFM3elHZxpD1j6gBTr
 Pm6F4L60wOXU6YCQkgQY2jTpWojPNK1V4OsD9CXb3lP/spvn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: eEuQ1oPMSm4I2JM7aosz-B6C01T5qGWZ
X-Proofpoint-ORIG-GUID: eEuQ1oPMSm4I2JM7aosz-B6C01T5qGWZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfX9AewLv9R1SRl
 xhh0C4FZGXKFmzG814SYO1Ckg7IEou7lYg9y3iLfXqle+04U+DxUq6SmU2RLSb5DAc7s2sIMuKX
 qOI27pvWBi9VPPGweni0oTT0iFVe0sH6PkUOYDRowYKdW3VLGTT5ibHlwKLID3x95GecegoGHyG
 FT0OpSsPatjgQ8Z8VMDFppo6p04NEjcGJPZ6XSUVt8IOWCXyth63vEX2cVBIzFK3bHsuekpySP4
 hECmEzaBcB+/+OSD+mbntgalJPrhbgVako0L2cDGclSCFTidS6wkJ5hsavELApfkK0VaqufN/4d
 4SXLYUov6d6LW27ybsijLyYB83Ya455TdQFqKqZvtU2I7L7eBLXOpDT9K7Cj89Gp2mMy8PkwTKr
 JfXTY84eg0I9eu0PHk8B1IC0HDVHwgCJgsezWEaVxQ/95MtpCxdUPD9C6UtNTfxM11QEkTcDCNX
 WYxiTrzBHcx3UUhqwXw==
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=695461eb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TaVSYX7Pq2PjI-6xwy8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300211

WCN3998 uses a bit different format for rom version:

[    5.479978] Bluetooth: hci0: setting up wcn399x
[    5.633763] Bluetooth: hci0: QCA Product ID   :0x0000000a
[    5.645350] Bluetooth: hci0: QCA SOC Version  :0x40010224
[    5.650906] Bluetooth: hci0: QCA ROM Version  :0x00001001
[    5.665173] Bluetooth: hci0: QCA Patch Version:0x00006699
[    5.679356] Bluetooth: hci0: QCA controller version 0x02241001
[    5.691109] Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
[    6.680102] Bluetooth: hci0: QCA Downloading qca/crnv21.bin
[    6.842948] Bluetooth: hci0: QCA setup on UART is completed

Fixes: 523760b7ff88 ("Bluetooth: hci_qca: Added support for WCN3998")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 7c958d6065be..86a48d009d1b 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -804,6 +804,8 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	 */
 	if (soc_type == QCA_WCN3988)
 		rom_ver = ((soc_ver & 0x00000f00) >> 0x05) | (soc_ver & 0x0000000f);
+	else if (soc_type == QCA_WCN3998)
+		rom_ver = ((soc_ver & 0x0000f000) >> 0x07) | (soc_ver & 0x0000000f);
 	else
 		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
 

-- 
2.47.3


