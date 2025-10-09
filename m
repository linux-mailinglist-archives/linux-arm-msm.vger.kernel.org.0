Return-Path: <linux-arm-msm+bounces-76546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52008BC78AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 08:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 719553BE2B9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 06:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4D02BDC27;
	Thu,  9 Oct 2025 06:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6vUhfmK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4597F2BD5BD
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 06:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759990777; cv=none; b=eSdmEoFKsJ053zOBK+pJKjOkzpxV022mvPjh/ZmU08wfaDLUBAzfe9T0sucEr5jZTZWRq0z9p5IM7IY92KMNFZCZINZK6UZ8jP93MTkVRJoC+NxOIMr0Vxe5E8fsEDn6kBOyRFJLD7jWgV2dv4IaWzk4/ViYydRHuB1YkARMohY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759990777; c=relaxed/simple;
	bh=oj3ZGY6/IILJHtVhKA2pv4u2cYCEUcRJUrt5ILBWwaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pouMZoCi45qp+G4bybnsu9IFUeF58ll3JChT2WaUdawGWvCiEWZ60SvupRwKq1wL2PVaP9qWJNwxDZ00GtSrQskdVjk33iYHgF37pg7Vwn5Crzs/y4cotjKSnsT+oLPoO2ynjg6t0lIbpdQnTQnvV1IB5+TZQn9SRubCvzGHxSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6vUhfmK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EIn9023264
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 06:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mKq3yr9dCGurHHla7xpzo8tVBMxkbqg8w1/ZkAGSJww=; b=L6vUhfmK/kuMOSQ/
	12D51qQOvUVVgKtQvZL8CUrNFBD8aC57zU0NNY9V0jZLOh7RWd9tiY2BXUixtyxv
	Ftel022nfyjLoCfNrUZ4rAuJPq91t/GxCmxoNEeKQCRIm7mZ2Z9IR7Zp809TikfN
	kcuyMN9xTOuC3ZWxlCnjI7aXH4M1ZxMrdYrY0dXpTfjtraQKmGmK9pSXHzlBIlVw
	3Z/tEZ2rLRYHxTmykUIDhLKwzyD4uObx8yi2s+4Nfx0i1VUhH4GECTjwldOa65wt
	rYNBsnXD2iVQ7ENz+GBvsLZ2GCUj8WtlRghJT0hJBD0id/+BGYiRjek5K1F4lzvN
	enlm0Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m1py0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 06:19:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5516e33800so1215913a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 23:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759990775; x=1760595575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKq3yr9dCGurHHla7xpzo8tVBMxkbqg8w1/ZkAGSJww=;
        b=auAC9s3bHJSrmo6CpQWnKNSXv39QVJW9A85GNvjzePsajVVzGlRW7hPsHQQ06tq8wm
         SBiQqfM74UrcHLHosQ3O8dZjndD06bQOXj+hgNe0ZKrN3vJfB7FE2UhkxXHhUferk5LI
         C50em4tA+vkajjrPzq+M7nV5b5d1UEqG3kb9ZnO7Ss+IUwCj3ASbp7aAPp5uUoF+Ckj4
         pYw/01M/Ud5WPX6VMAT9X3gT5S4Rajd8zvoFBOO6vIHiNXCbgY5mbZCA+hZM9jSWgALB
         efzcceHbEoKJW99Zk8OHnSdbjyxQ28y4nLRcSUlWt87R1mzP5fCipLC+TA+FHNR4gguJ
         HStA==
X-Gm-Message-State: AOJu0Yw+9VScCyQAFJMK2pPU5aFYi5nbmPG8v8bpjkBIYu+wqVCJY5xV
	X+mdN/1FEDKE8IqMZEbGphNvDQwrChLAdREGDfUzeCBSgsO64ywMdAkGxA4/t4J5rFZ1Irlt+XH
	WcAPaB4gLQqJyJ4re8ZOAyjEC4NY8u86aTizerIFO1sl9owug9nFTubOZFoWETgBR0DRb
X-Gm-Gg: ASbGncvqJkfUc6SDy91zWpx2VJoPj0EgQDnfddgECaXcnpi2wtljWOLTr4y07zpvZwB
	Di2NbmZ/DSb98u4WPoCl+RsTNdXekH1GPiLmtbD4WEjhasJCRxTg1JFekCbH7i3BbnCll5LBKvx
	xP+iEIXxG8Bz03ZhLqIyejq0/pJG2nepHIifuoVvy+lFN2+mlPU0JIExjxwf1P6RaUBMx7eMIoa
	Omtv24hHC1rH/lxwhfvQwRz0wdRoCGkBBLbp3UAP/CQt6vPw4lPCnzhNsbrwAP2LL3KCoSCTf0g
	nruz7w62pyxupt6r4/t1ca4xRPztrdHkUEqeE8DYUmAvimuIee7HAkbK2OMHP/Pf8rOCzC+HAFM
	nHlKPP+4=
X-Received: by 2002:a05:6a20:1611:b0:2fc:d558:78a6 with SMTP id adf61e73a8af0-32da84ed6b9mr8614512637.60.1759990774866;
        Wed, 08 Oct 2025 23:19:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkgqFYMmy2IRS7a6u6Iwn0slDhgJRib+1JAT43YjU6dOCmUekP/T+l8jn1xHIvBWMdRcySFg==
X-Received: by 2002:a05:6a20:1611:b0:2fc:d558:78a6 with SMTP id adf61e73a8af0-32da84ed6b9mr8614477637.60.1759990774374;
        Wed, 08 Oct 2025 23:19:34 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099adbcbesm19239671a12.4.2025.10.08.23.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 23:19:34 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Thu, 09 Oct 2025 11:48:55 +0530
Subject: [PATCH 5/5] dts: qcom: qcs615-ride: Enable ice ufs and emmc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-v1-5-2a34d8d03c72@oss.qualcomm.com>
References: <20251009-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-v1-0-2a34d8d03c72@oss.qualcomm.com>
In-Reply-To: <20251009-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-v1-0-2a34d8d03c72@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX9Y8xqbSlJIAH
 J0SO/TLLE1NDjNmdTL4VLXMkCZW3aFbELidsACrCXaoGupyaVazlUpiAfE4i+CAVsV8yPOcMt65
 p4TToBXulYw/JHw88mAKMxq1or5xMc4dxt22HldXgSYuOf13utyMgIOg48h8or3Hz319E77wech
 C86XXFpGNMcB76+wcZo/Bv6a67WIiK90wYzqzEtgOM6U2Y75nZY5cdShtk5iH7BQ0mQNmoqQ5zl
 9oSnccBRfnsPTCX5Y0rLlB43hEJuu+zNhjcLzSYsNKbWa0BgE0Vd9NB3xjP+04HHFRVc9O7p1gk
 epMNv5/sziLQGQOODTHTNV6JeChmtAGexDVYImiduDEccM+FpYTsh1RwLcQ8zjY++ruJwykh2yO
 0U5PkzCtqmX+VVVBuAcQNsv5O9s5sA==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e753f7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=FZPswq4iDIBThNNNJiIA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: GQyVq_ut-4LhB6VsvBRfW72dkR9VKTIS
X-Proofpoint-ORIG-GUID: GQyVq_ut-4LhB6VsvBRfW72dkR9VKTIS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

Enable ICE UFS and eMMC for QCS615-ride platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 705ea71b07a10aea82b5789e8ab9f757683f678a..6e80951c4159fd1fee2f737e0b271a9abaf82a49 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -288,6 +288,14 @@ vreg_l17a: ldo17 {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
+&ice_mmc {
+	status = "okay";
+};
+
 &pcie {
 	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;

-- 
2.34.1


