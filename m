Return-Path: <linux-arm-msm+bounces-74737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27148B9C903
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6C6A3B00C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2065E29D27F;
	Wed, 24 Sep 2025 23:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXOkAyPS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9994A283FEB
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756549; cv=none; b=GZWnJFUKfkCkpjs9Rlhur4ud3WBzc2Zc7ycngHWfBGaomO65nBSbfR/LtjTXNIkOA6am8hmsisLIZpPo1oIITJrcsgis9zxs4HrMfxvn3pgKwXHL8z/++XuH152A7j4wQnp73MpVz3lQVb/vigLI/fFT075+Hql9rwcUCa0eKro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756549; c=relaxed/simple;
	bh=iNvBhLDG9ygoIMGrSAjur0ixwelDiqAhu5UHp/R+O/o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OglnaQggh6Rh3T9aDSzOg/o0Kkk/rbCAH3Wa+NyjqEYIWDr67KjX+zr93JRq9aFJQnkbUpjLfufQLnVY5ulw1ZtRPJbAwqHhhC0xGS2jKIoHIsicnIlx7jHze+aFofa2DO0YRWF3EPDqNneUhZcLOKvi02CYw82qNteBly1a+dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXOkAyPS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD3c1I028188
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9+l0csdA98QdCq8IK8vG8I
	Wfe5KMbV7vWJnvNBVhQ9w=; b=pXOkAyPSBZXFtG2rliNUD5sQmFFf9FZim01R5Z
	r99r2wPHw2nyj0Q2mPfoVqUBdPD1RFJarrW46tgkpRmnj8GvPqsb4OfGI+eYiRQA
	z5ob4Zv3J1zmNRj0CAFQpY4AUnXigx1GTaqBKsaVMlXYki6dzGNE/pdCpOf9zo1O
	Oi3nCArt74qgdLBZVTWOXPQ9NJujBjhOgxg97sVWBkHbVi+sxm5dyfhar7/69TPD
	3tb40dsM+BpX33k03BquvfgtMfe/LsopH6+vX+JFefBDQviV1nQ/1nJ8Q/1ODgh5
	jIoIsX6QStNrDGP/HH6ZYJpTqxFA5C1Zoth+yQp+yY32pVxg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnxcjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2698b5fbe5bso6238805ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756545; x=1759361345;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+l0csdA98QdCq8IK8vG8IWfe5KMbV7vWJnvNBVhQ9w=;
        b=SAz34l00VWNj6Wh4w07QwksvGjOJqrDBuNZrumVsRs+uUgNXs0k7a0fZNXbrBin8+2
         BbPyEqszT7RY/D0dvJci8fjMXhIf+I4VfX43KqP1vxox2rM/9l/Onv7L2SupecReThIn
         AsD+epjJQqCimU5uElF2sWI22faK8P7UTLet4gzp+yzcXlXhqEiqplAygVHs8igi3TZI
         Y+mIB+EbZ/v0ktrLLApPZqDLV9tcGGS0ewB2Q5RBAN4xvWrAisxOlJsmSgHB1cQN36Ms
         2fhAy3jh++gTqPt2ZqQa/s3ivLbDX46nO/w/NZHfZkTZHSLIfRO1+D3eSjY+HkGRsPr5
         Edcw==
X-Gm-Message-State: AOJu0Yz8kbblF5PexASjnkxna2I4sOMcc6LxIrd2cEXfdqaQApSFZ3yn
	ok1BQxs/lmEVYpGU+UHekhLMQUFJfyq5Y0zNFsuNryEchmNyWQP0qJWtnF+ydxq6uUSqw/P55pe
	/TppwfpDPFLm6IVOxQTDReKCCtGsQVzckRZZyaM3srXGG7RA9/T5fce7++N3K3DIxMI9t
X-Gm-Gg: ASbGnct7xl46rmxwrs9ICSa9HAWWxOnfZ23kaxBhrXnB9FMXXEJu67fMSQAQcyqnfJ9
	MxMSzbkgQajNk5aIGuehbNL463lTJPgGm9BrKT8e1n4PHsRys5gIPkA9f4tI6d7flU7WDhJ3uOT
	tQg2IXp6iDyFk8X7CL+oc0HLddDUjiEJiX/QyY7rc8FZalDZ5yE7vX0Nc7wadbBJ8RpkLS1n/ZD
	Csjwu1qiNr5reOtstvBZUd7jnEZVxnumEM40N4rhWsXi9S4QFES9JyLfyLiLFz5ab/ESZ198a+t
	L6yg44PgtPPZYZl2faeMLk0rfd7298baPV+VyVmK+OXQztB1MeNaBi2eRbVTNm8PdviV1ZRwsmP
	gadkRr9X+wZnRHWY=
X-Received: by 2002:a17:902:db01:b0:272:dee1:c133 with SMTP id d9443c01a7336-27ed49ded13mr14244545ad.22.1758756545251;
        Wed, 24 Sep 2025 16:29:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUEPADcwlddCviiL0reaYKNZCOT/tRIgVAPefqNdpaaX6oQdCmVpOJj5ORnG7Clz7s+SorlA==
X-Received: by 2002:a17:902:db01:b0:272:dee1:c133 with SMTP id d9443c01a7336-27ed49ded13mr14243955ad.22.1758756544429;
        Wed, 24 Sep 2025 16:29:04 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cdfafsm4292825ad.30.2025.09.24.16.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:29:04 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] Add UFS support for Kaanapali
Date: Wed, 24 Sep 2025 16:28:59 -0700
Message-Id: <20250924-knp-ufs-v1-0-42e0955a1f7c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALt+1GgC/x3MUQqDMBCE4avIPndBpVXTq5Q+xDjRpTSVXVsE8
 e6mPn7wz2xkUIHRvdhI8ROTT8qoLgWFyacRLEM21WV9K13V8ivN/I3G17YJLqJzDSLlelZEWc+
 nxzO79wbu1acw/fdvbwuU9v0AMNSaCHIAAAA=
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756543; l=658;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=iNvBhLDG9ygoIMGrSAjur0ixwelDiqAhu5UHp/R+O/o=;
 b=259J+ycLevBFX4HiFzgSeQV3oznulyjnT7EPeTQadK+TvFBBkL0cJtcubNHatuDgWE2EAWeFO
 wSvsT6yl5qzDNQJe7HxhU/TDFOjakz3gnGHdI2MRwPveN68RqnE3bS/
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d47ec2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=YZPfJuuz2T7GfvdrPZMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 0DDOi7WlwRR7rELZkdxtIf1ZC7Zt6YCl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX7bIE1wFrvUv3
 I0U0QaV1U8mCackgYxBUTgeDjDcylAP5x3yb/0UQMs2xH0mMWhurNUNclztlB/QZ0t1fiYGIdpS
 TocsQd+ZBkgKNu9z7ePO0RxkfhNeZy1ZEJnNVgGzVU1Zi/PYiz+WVfkaEjBYDdLX/LNVPShiTV6
 6p5WypvcgN2lgSze19JRl9HKyP9b3bv56pryT9y0siL0M21W807Bm1kGA9Ax6xqwFrJKFT53MO4
 6hF9Sjva0vysPJ9rE1eXg78vtj65s+RYXfZBXVPNLZfi0tSNbA3QwMFkscL5s9MK41QRSdbGfpl
 pYCLfa/QgepWOQ9HtQh9JwTXpokvEedHS/JfozuT68q1eue1W4CaYxnp9t9Ya3W+AILtQTzA0RN
 Fidvu506
X-Proofpoint-GUID: 0DDOi7WlwRR7rELZkdxtIf1ZC7Zt6YCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

Document the Kaanapali UFS controller and QMP UFS PHY.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jingyi Wang (1):
      dt-bindings: phy: Add QMP UFS PHY compatible for Kaanapali

Nitin Rawat (1):
      dt-bindings: ufs: qcom: Document the Kaanapali UFS controller

 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 4 ++++
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml         | 2 ++
 2 files changed, 6 insertions(+)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-ufs-476c9fe896ef

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


