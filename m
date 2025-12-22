Return-Path: <linux-arm-msm+bounces-86148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BA8CD5309
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D25533045A79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B33B33342E;
	Mon, 22 Dec 2025 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KIPpIkC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JThsV+iW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2C0332EBA
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766392132; cv=none; b=IJ+iABJ4AH5taAfJ+YN+OU/1ggkX0rpuFvGLjSycjRqOX167QhLyowV479uyO3GZ5F2HGeH5u+3kbLpfBF78jd/nisAjvu1NZqfhq0qQLzerFsdjthzCQjXCuxg98XdNBWbY+zjjMp9aDq7fjH7IZKATRgMAZz9o73vkZkABRA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766392132; c=relaxed/simple;
	bh=D1CzXEDGqZ4SIxckMt+uoSKACIrQ6NvDhcsFOK60C/4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PkAHVyYT5ZmM3l5jh4N38o6PTPUJt2jo1QWPbHdIbu4Lmpk61ow2od671Gi5zioXg2Zixwtal+T0IfI8XedlNqRpehP+bY7+JjSB+D/kE+FoRvENTBpOz1CMq1aOUdzMMB/69B2E1pIVEIy/md5N7WCzCtFJhpahcpu42M4ODPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KIPpIkC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JThsV+iW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7Yqc33234134
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=arSuoSo08Lo2cAeKWtUafv
	WaQHmn64vSxSM5X523+O0=; b=KIPpIkC0jtim7FVA1qtALeZ5rY2un39259QmGU
	46u39Khw3ytvrQWK4oVBDuUeFKBqJruPUnNtY++Sg4oLpSJJqTBBOTZGvwVplEBp
	savQ4t0cKL0OqSHZhTgkzQDYY6Ero9qvKTb+gvt/DY+qS//17mkcgYzyqNrEuSzK
	d1o+dmorD1+W567KmLStxPqu+Qt42Dab+7XGCNadWGsjfD6A5c35H8LsH8U3DNn5
	WphwdIHpBVyfa7a+SYRRd5Ulxn93wQ8j8uC3/MiUx8mKPDRxue+gBVMV3BBP6ip9
	d/WSrJtNY7VxSETCNU07g92z4B6/iluqINYwo7DRa52MYNpg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtqmak9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:28:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b9fa6f808cso1073328585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766392129; x=1766996929; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=arSuoSo08Lo2cAeKWtUafvWaQHmn64vSxSM5X523+O0=;
        b=JThsV+iW7FECWpjpXjJ2XuoBWw1mAZdkqfaxB6qvYj4zz8XOjGs8+Hz05Ke5cOjW9Q
         mkMK+WGBhrI8DFKkDjAnRbOkfCl7A88lC57/bSSaVbUd4aKg6a4gfs5ls0ZrrDSi9zDV
         KOv24oML6O40TEduGTl0NE/YqNGvOX0b0AHbRydl70opHaG6SVI5gVklu3ZH8b8JFsiL
         fAk66JUkAoQE9cyjymP1yUtD3AEYKuGCmDreaZIEMYOUdWCompV3y7xH0LHFIPgv9YFi
         HJbZHFesgs9ro6OcnHmeNo6DCUJIGjyzV/haONcJQr+lRdD9W+4R9CyOFKJ9N0VClLOc
         HlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766392129; x=1766996929;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arSuoSo08Lo2cAeKWtUafvWaQHmn64vSxSM5X523+O0=;
        b=n5rgVZQdMwGxkPp6Op/Wy1Wmi0iIz96d9hYRDL2ZQ7zjQVXSwWcrTP0UMtWY5jODGQ
         KEkOYwTqNk3ke27BvzoTTia8U7144CS2rk+eUC2LBxE+DyHwIPZVISwXJoklAR0YB9eQ
         3yZzDG0lQ1c+GB9qtJA+QXXlFCXJVn4VGF/BwfGrnVT9ca9DZVE3L8a00R1bdwgioFNl
         BvbYiQa6U9iXrJKq9lWOsIY7kcf6g0cbiIKuuiQP77PoE0TLl+hD7MAeGCuohvyCgG9O
         3zQk8VD/QrPaLGVd45IW0N76dmV3uzjc9rhathpLzBIOOBCv3Ly0jC4HHLPZwOSjpZr0
         Je1A==
X-Forwarded-Encrypted: i=1; AJvYcCWsJ7s3JWgYfbMMHNrcm7Z4rCoW0G7jTEpLx0Xj5x21qCKlRI6hdohkAgtHy5S+gDoAoSTQ/pJk7HKCzFXL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3cVsFN9sLhjVhijoqPyUY0qrCud6oJNVf21+fnA0rZA6nSNqk
	SYnRSTxzBKIsLITXyom/Bu15kvAJEzdrdY9fO35fxeruuEV3Q0Ws52akRRcJWikD1kCgfWUGdUD
	0wMADMVeSm+R6no0/inVQzJgnW33FkncQ+5KGOSlYIhUbP1JEytYVF9WZioe7baAb5rIP
X-Gm-Gg: AY/fxX7C3CkQPMxcFDq3OyyhnT7K4QgFjj8hS92BzlIeB8d5gtEwKIzhknVzmTYMSeD
	EThRM9yQcs7L0/h+jpEX3ExD6RLdH08ufcpolNDu/ha0LoNabIDiUs8OjdAq/W8UZowMsPLnHd2
	zw0lTayIZKwxu4fnAk9fuzJMP7NFjQ6043pD/Ljv42yVV8be2wvvYIfC2BjKf4VoNoz3SfgbcEu
	cE/uYC9pchmycTq6RquGHLHUPh41oKgdTYobyc5hgspEto0c72Ix35vuFp9GR9qhYYdU4kOgX0/
	NMc32mSzuJSrpvpQRHfuI8Sdo2VhHrObIEDJvb51+sa3z8cIoCYFa7/KRY6Wh1KFo1bRn/l+xqb
	nakVU822qfYv+qKZi60p0fNw7MkScEZly6ce9yS3pkmtaQS3jPn6xyl/2euDDk/c5sJ6MopC9HL
	K+
X-Received: by 2002:a05:620a:f06:b0:8b3:16c:1a82 with SMTP id af79cd13be357-8c08fd22fd6mr1764908185a.47.1766392128770;
        Mon, 22 Dec 2025 00:28:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHy7yKdj2dHsBU68SEa7/loz6oBVeXcN72zBV95sKHOXNIQUSoqbxAhyg3QnDEl+FhtFeixww==
X-Received: by 2002:a05:620a:f06:b0:8b3:16c:1a82 with SMTP id af79cd13be357-8c08fd22fd6mr1764906085a.47.1766392128331;
        Mon, 22 Dec 2025 00:28:48 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0970f8572sm764046585a.25.2025.12.22.00.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:28:47 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v2 0/3] media: qcom: camss: Add sm6150 camss support
Date: Mon, 22 Dec 2025 16:28:38 +0800
Message-Id: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADYBSWkC/x3MQQqAIBBA0avIrBNyKImuEi1Mx5qFFg5EIN09a
 fkW/1cQKkwCs6pQ6GbhMzdgp8AfLu+kOTQD9jgaRNSSrBl77V0S0bgNNrowTUPw0JKrUOTn3y3
 r+35ApmPjXgAAAA==
X-Change-ID: 20251222-sm6150-camss-2b46fad884dc
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766392123; l=2152;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=D1CzXEDGqZ4SIxckMt+uoSKACIrQ6NvDhcsFOK60C/4=;
 b=2fzW7qTm/UZDCu+ciY2beYdxaDwkLusVY0kiJjHK4ixqG/bITvQWRfusWOJeAdAB8gwdfNPDY
 tSHfVZvW+QkCf+DbkDgt2AoELqIDF1zoWEWTIuQwxTy+mcLpDsKguuM
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: xVmI0h28GmOGeIRLgVy05eb7PqQGryCq
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=69490141 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=b5PrnZgeE6CfPZZ6BtAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: xVmI0h28GmOGeIRLgVy05eb7PqQGryCq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA3NSBTYWx0ZWRfX0WCZSAVGdr/Z
 Ypj7J6DMs3pVryCU1vYIjGTPAKS9ajxsX+Umz8hhJLifDJYhm+3p+wCSLcxZcT3Vyjx6eSOgfe8
 IU2T8Yf2x7Qu5nm09WQHZ1m4htR6F0ryEiPXW8SPPnltgpzTfcz2p0fG+dM8nDbPSBn1ARpq7Hp
 C23ArKy9MsCiAIYxS9LV/iiHLJ2DKPBF3unQWMMcPdMGxvrQybxWHnrHTqPUXMvRldMH1JoFdYe
 4g95LhKQejuYhX7XheQDXjRLD6ktNrPojVsNZPtqnl53rZCily2hbiWsJejcB1Qbegp6enIh9+A
 9cdJr85DR1QW/2dJXzKCWjyJoUS+QCFcvQlcdUIhD1cUgSJRWMK8AD+gFeJftTSLw5aEZIG3b1A
 Je8K/V5LURlQw/8okIK7e9JdWzBdYv/gLZi6qcZw7jWFDH9GJLBFgo14xoICbiMUApnyty3IsF7
 NZ5NHt/aPxbZOqcnoXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220075

SM6150 is a Qualcomm flagship SoC. This series adds support to
the CSIPHY, CSID, VFE/RDI interfaces in SM6150.

The SM6150 platform provides:
 - 2 x VFE (version 170), each with 3 RDI
 - 1 x VFE Lite (version 170), each with 4 RDI
 - 2 x CSID (version 170)
 - 1 x CSID Lite (version 170)
 - 3 x CSIPHY (version 2.0.0)
 - 1 x BPS (Bayer Processing Segment)
 - 1 x ICP (Imaging Control Processor)
 - 1 x IPE (Image Postprocessing Engine)
 - 1 x JPEG Encoder/Decoder
 - 1 x LRME (Low Resolution Motion Estimation)

Tested on Talos EVK board.

Tested with following commands:
media-ctl -d /dev/media0 --reset
media-ctl -d /dev/media0 -V '"imx577 9-001a":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
yavta -B capture-mplane  -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

Changes in v2:
- Add more resources(BPS, ICP, IPE, JPEG, LRME) and details for CAMSS.
- Correct the order of the header files. - bob
- Add Csiphy id num, improve the resource name. - Vladimir
- Link to v1:
  https://lore.kernel.org/all/20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com/

---
Wenmeng Liu (3):
      media: dt-bindings: Add qcom,sm6150-camss
      media: qcom: camss: add support for SM6150 camss
      arm64: dts: qcom: talos: Add camss node

 .../bindings/media/qcom,sm6150-camss.yaml          | 439 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 200 ++++++++++
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 189 +++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 6 files changed, 833 insertions(+)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251222-sm6150-camss-2b46fad884dc

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


