Return-Path: <linux-arm-msm+bounces-86552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BB6CDC02A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63BD03008889
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41D8314B75;
	Wed, 24 Dec 2025 10:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJNiv0R5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cAjLcP8r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0C43148AC
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766572515; cv=none; b=LomKSbBCwd2hiEvj15UMDqwAsK6XHs1iMWQ/xVPkFtB3+TX9yeofBbi6qbpLn65gJ/RHOArWCrroRIclFs6EG1AS/RcYFG/EGsqUSQXkue7SWgmBwjTOSOzkdFDZgB8AeCxzACfUthaGSjNy1qi+HUHI8YIkuPmFZ0TsPwXvq8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766572515; c=relaxed/simple;
	bh=WBAxW70kLr36N+16VMDnyUYrgMjJ3I+VrVEfqsxWN7w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DW2QMXhi/cQwsf1Wa1DqgdRJd45OlAwuUio+S0D07AQ0UsEMdxoFukwtJ9a7xYcBvy9jUdWIMO2Ooiz1fD0h+kVh4Yd/1uC/hGg/CyFOSbdtOKnYqTW4S43P+VoYz8ZujOhCKYceFLIIJmVUNDBeNL4fk2SqDgjocxp3KsLor1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJNiv0R5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cAjLcP8r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOAFFqk1597861
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=o0wRh4McKVmQ0eCqz7MNa4
	oubLjNjqtOBrRue2Bwmic=; b=IJNiv0R5hRfigZVFdhNJ2GSfXmIFv4SA3CNqbc
	tYYZb6uAPDINnjakzKe6ZXTchRFQ8yRWG5GjX01jTVGC20bgTdopGim6SvF7nWBY
	Qp89WfT6Qc7ovuw6TTu3bNfIQBKXyLX65J/RXsdV3cny0tXtYXWO87a5lt8SAr2P
	0YKZlD85UKUQfQwazAv4W3uqrdTjWPZZFcvBkKw50BpOCiYCTc+/N3Y79JjtMe3T
	3e2rItRD2l5BvPEGgEXTjPA768GB3Az/hbTnNQk76aSLIlqaafRTlM+M8SVGO1LH
	QoLo0IZ3syjUOLnadI5gaqymRWyOKyem2sKBd8uOibEcwg7Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683hb0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:35:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed782d4c7dso100788121cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766572512; x=1767177312; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o0wRh4McKVmQ0eCqz7MNa4oubLjNjqtOBrRue2Bwmic=;
        b=cAjLcP8rbF1Mb0SbofVTNbFeRn7QmWbiYSr9L0af0bfU54Qffl7twpe+z8bh+ZtW1z
         1c3DHk6GoD+gWW5cOKcvzCAnFZzN+AoRJiXDw0hbAc8P3UETvHVyj8L7DduVfQSmWUuI
         HoGlbQKD3kb5wHOsAdg46OrBou3FtNBJj75C5iDtsz0PDxgOAHymBAFrCv4vk8nuQhRS
         rsaBmksN2DJX3L/zv+DbWsBCdRJG7PF7zoNTtIWZCWKfCM0ziBZqfRkBGtzc+lnMcaBR
         OGCqlgRtsH+gOxOx9D+eObxMwL+nD3JfRl/GJn68lN2ZUZ+Deh5LO5X0WpL/iafNFEe5
         kZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766572512; x=1767177312;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0wRh4McKVmQ0eCqz7MNa4oubLjNjqtOBrRue2Bwmic=;
        b=Ur8Wmoo5Q/cCfEzAD+dYbrlhPbiptYAa4M9SWesx1F/2YWEhGUUA2oTheZ/0Rie566
         fMkB3livtI5Zhr9NfkCOQt66Lm+ozfYHJlIDarQKjTgQTvjCwXPEnNzgJvbqq/Se5iuG
         yikSA0oIjEw0qZIqRJORt77vetK21V5YbF4tyQsHn2LtbfWh+IU5dBBHJqqpmXk2IUor
         Fc3Op3zoyHZ7jn4VO5hhxLnhht5jZK2f4JYNuO0teLkBMEJKrAEX7bT2uBW/2fEM+VUk
         KYdlGNLulGQiwMXgulUnBPyKJhRDtMrbO/XAlbpxM9F3dLg8dXT2Z/ymEGhu/EhahgvW
         ftoA==
X-Forwarded-Encrypted: i=1; AJvYcCXbEZAY0CRvxfwkNmk7fEWlyqRymfSQS1WdiERdu96otX8YwJ+DzVPjCNNTpYwcLPiHBeYRD8wm4LojvsJK@vger.kernel.org
X-Gm-Message-State: AOJu0YwU90xtIreJNrhkpZlZr0N15frmkNuhX7K8YyThJi0df9UFA/ap
	I2l3Z0N9XePBxpnEkK5VMhx3Si0GhlP4qTme4G1V66yvJLqL4Tq0ddREXRso13TH17FRFzriuXN
	278iyrfYXSBsEEy06HOK2GnuZXk/slk5gaLe/BwePH168FSVmxAlM4mkGnSJz6bbItnVvVlAQJu
	o3
X-Gm-Gg: AY/fxX5gXFqK4rQwKQ+6kjnJ9qpm8U8ApGtxDfqwe0d5aeniNUGB2H16rhpiXf4ENd2
	F3aCf7ibhlQ880Dg+xiv1S69alqcTcimdGo2DpJl1TCvQH/pinXYiPcOgPNEIHey9njcF4fb8+9
	NlNW9muWkTIsUSLebFCqYzEZLrXrd1Ggri4OZHlrKCfu986rUO5FfEMM8wiRzvwP+1PMzkfa/sB
	Nhw45MJVbeBeYeMuzG1r300PvUDUI4BB+5Tle3nJRgk6ccUwOQTNuzI0oVE0zksAsu0dN9si2Aw
	Vt/8OcD4g6Gx2bA91owKhAmKEP1AyIl9CNKls7JB3TLjxVH3AEx7LB0LS8zR8iaGmR5jsDwyoPL
	7z6mTXRiy8ibHMDY=
X-Received: by 2002:a05:622a:341:b0:4ee:24fc:be81 with SMTP id d75a77b69052e-4f4abd400d4mr265149121cf.36.1766572512042;
        Wed, 24 Dec 2025 02:35:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSi9Ewyw0GUdoJ7T4Ey1Be2Kg2DU5JzeaC0kxe8WprrOkVsKHayOTqD1ZI8V5VDJHlkvaSig==
X-Received: by 2002:a05:622a:341:b0:4ee:24fc:be81 with SMTP id d75a77b69052e-4f4abd400d4mr265148861cf.36.1766572511527;
        Wed, 24 Dec 2025 02:35:11 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad806asm1729496266b.23.2025.12.24.02.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 02:35:10 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/2] phy: qcom: qmp-pcie: Add support for Glymur PCIe
 Gen4x2 PHY
Date: Wed, 24 Dec 2025 12:35:00 +0200
Message-Id: <20251224-phy-qcom-pcie-add-glymur-v3-0-57396145bc22@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANTBS2kC/43NTQ6DIBAF4KsY1h0DWLB25T0aF5QfJVFRqKTGe
 Peim+6abiZ5kzffbChob3VA92xDXkcbrBtTKC4Zkp0YWw1WpYwopoxgwmDqVpilG2CSVoNQCtp
 +HRYPuOJPripGjJAonU9eG/s+6UeTcmfDy/n1/BTJsf0DjQQwEGFuRpGrwUVR93YU3uXOt+hQI
 /1KlPAfEk0S41yUjJeUVVXtQsjnRfSpPeRpoGbf9w+P+e0FEQEAAA==
X-Change-ID: 20251015-phy-qcom-pcie-add-glymur-096b6d951fac
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Wenbin Yao <wenbin.yao@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=WBAxW70kLr36N+16VMDnyUYrgMjJ3I+VrVEfqsxWN7w=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpS8HWhHQtDdSEVoYJxea7dghUNT653wUP2zN2Y
 ubbpH5HYjaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUvB1gAKCRAbX0TJAJUV
 VmZSEACIRfe3BGB3ilmF0Ghsy+pek5aRzxoJ4aXuo8K1ipfgA2G1xV1cY2H6mpzkxB7KGfPMaoa
 oSg5JNqE8Htv2OuGs5n2/OT9H+YwF9B5rZv0gLfsBwu9NDxByL7SNyEbM/WyAGyjBg1i8uv70L/
 B4+5cTl0A2xHoF1q4BcaD/jBaIHNn5TXkrLzZvX/7rRFW1xm26jaqLhxHOZ9vxwnD7O3VS6MQvM
 g/0QEq5GMXZnT10O8ZQPSX5Cf92vlsDGvjkNJsSc039UlJBQ9wY3PbJIcmArnqt6WSjtmCuuzgH
 uGS3jF9OI4Ut3qGMGU73IHEJyBxPMB/BP2b4jpo3NDJDFJjdyrO54SZD6+4Smz323rXDnVmFkFW
 0XVlBBdt4/+2PqcJ7UUCUy9eVzRFRWUOp19t4E70aGINJWKAvYJbWEgvfp+Oka05wK19o2L4fwn
 4EWEwq5e+oNqAO2iDYxSGPGFmHoX3ht+k8i2LTsse9JscLTnyKEWiGQnli7ExGklnQ7ED2wSqYa
 +35VEH4o7tKkQSt9+x8hMqTDutulZRVWigGlGelHmlgr6BXaNE2BnmJXboRCsjG29fvzfFa6s57
 126+yp0q5yocn3GIS5U0IXofHZAGzsb2PSnxqZts4DYVAL4FcTEtj3WCLox3GKc2MRpoOEyiJN4
 6bv/AchUNMgqQJA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 7thHHHsQ4CJJ6TKU9ZNSsCSRAng_cTa0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5MCBTYWx0ZWRfX7xDH/faGNnw9
 Ubl1QyEOjdVaypuch5/mJHSES1tkJdq8uQK8TBKeQ6pMOJb0vZXDB2+Wlu5sfSjFVvryuspfWJm
 K3PDnp61fslFXHUtdJ689KSHBzHP5z7efgnE5sm5dMB/UJO1iTVNFZiKYwrQOUR4qmBJOiOlWea
 cadldr8HlnYsVg0YbkehCWsNbnsRLIOazg+bDJxUha0vRN9EVLcwDY4TN3/nU29XHSgc6gZp3A6
 LKXpqt/tCeNwHDb565EOF/XVKRhBfd5alYot3vOloyfru5z8ueWp4yhJs0OKCO/b/zWzFoebvCY
 jr/kLWZcIoUNKEmaMIhMeF74fwYZ0QkYCd/CnAwQpxF6tH9h9QoqLRoyrbifdFaIVPwTo7tLj/n
 1IXY9P3a9UdSZkAS0QzwxJkb4GlqZ4UX6x3xxQ6qMfJ1yr+neW6+3NjtXKH41XFOL/F87AjTLeW
 Bbsvg0zD1WmnqxAfJ1g==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694bc1e1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=25G5sqDuFd8dvZOKy0MA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7thHHHsQ4CJJ6TKU9ZNSsCSRAng_cTa0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240090

The Glymur platform comes with two PCIe Gen4 2-lanes controllers.

Add support for their PHYs and document the compatible.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v3:
- Picked up Dmitry's R-b tag for the 2nd patch.
- Rebased on linux-phy/next: 27287e3b52b5 ("phy: ti: phy-j721e-wiz: convert from round_rate() to determine_rate()")
  So it can be applied without conflicts.
- Link to v2: https://patch.msgid.link/20251216-phy-qcom-pcie-add-glymur-v2-0-566a75672599@oss.qualcomm.com

Changes in v2:
- Rebased on next-20251215 
- Dropped dependency since it was merged.
- Picked up Krzysztof's R-b tag for the bindings patch.
- Link to v1: https://lore.kernel.org/r/20251015-phy-qcom-pcie-add-glymur-v1-0-1af8fd14f033@linaro.org

---
Abel Vesa (2):
      dt-bindings: phy: sc8280xp-qmp-pcie: Document Glymur PCIe Gen4 2-lanes PHY
      phy: qcom: qmp-pcie: Add support for Glymur PCIe Gen4x2 PHY

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml      |  3 +++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c              | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+)
---
base-commit: 27287e3b52b5954b73203d32ee76ffd5f53f5074
change-id: 20251015-phy-qcom-pcie-add-glymur-096b6d951fac

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


