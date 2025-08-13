Return-Path: <linux-arm-msm+bounces-68896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9166B241B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 08:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 445AE7A8E15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 06:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA082D3747;
	Wed, 13 Aug 2025 06:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VDVPCiKh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66292D3220
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 06:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755067138; cv=none; b=ee/qHZXF8TwAZbF0RVThFYiC84fLUq3PNtpGalX56bcyBuFF26JZZ64pKMPnwMr8pL/PTRR6oDR2SwnsyEaGLCbIIu1xxQOBta26d3E+InPXSwWRV2xCvN0jNSYUQStNUfC1EA/J4Ru01HvqDE0DcluLnX04QL0hzPj9q67xjdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755067138; c=relaxed/simple;
	bh=rXp5CgpdfOwq6IvtQTfJNHezSgRGwP7XgoOkdM34CAs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Til71Sl52+G0flClsZ0MbVlXprL8XUgxMIt2MwuA3UwHSRVk71Vf7uGooI5kj7lR3zQ1D7ry5Y3lt34E9hYATDV361G2LgNQbXET6ckzH5WrI9eY81RNtZxmvwxUQaueWRzFQ9nzmMLK/wjVI+NtxskwJoWPwvmsSfI5WdjFoTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VDVPCiKh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D643tQ004099
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 06:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=X18+UHg7svFJzutDLuLGcKihBz8fvMq6lXl
	9O85SJg8=; b=VDVPCiKhd7wqr8qb45I2gzPhX8OXurZrITlNVdC8eGcu/MrElrg
	pCFEw22LxaVcjfYhm6dOjEE+V737aWYCb2MknciswHkVJ28RYA6tnm2eALeZzhNF
	hrrVIS7BlN5flqYyx9o+6OzbfDBxJpw+aWVp5SB9qy8RHqHx9C5p4vRDlw9nKlpp
	I2tOpJjnYG75nPPpDvE7fjq2uXobuVRMELA7ZOVx7atMuncNZB8JWzmAp4Sw/L+j
	FosgZHrrSYRSkzitDPojVOayr9sai8PSf/RtPul2SbSq3kYOLFDOGkHej75QQ12u
	2pxtbt+UsWkbGa2YHQapL48kPD4C3GJYGVw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmapa1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 06:38:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32129c65bf8so7048434a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 23:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755067134; x=1755671934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X18+UHg7svFJzutDLuLGcKihBz8fvMq6lXl9O85SJg8=;
        b=FJY3fUeUDqh2o873d07kjM+7C2tyfiaEH01Lso87mKk+PA2aTyFrIbHak0L6vdrL7V
         FJQCGx0cOyCuHTOpsQ0QITqrGn1FBbicXTwRVG7neBvrJVfcBIASvI2ck5veai0vz6om
         FoXuUYkL0sBxX+mjmWpDNujzCmwoCNWmJVLhJnXH+NIBN2QPD59I4KWS471Jw9WLAjO0
         A0YSUmHKlEEsoZ/w+HcspDDMVq7Lidanc4PSSw4y71/GsykiCrWWrvUHfUbs3gXCaQxb
         EaJYZzr1qDVwc5/0RBfdk+hcu07eM/HDeQj9RCKbFJgpfjFm1GCtr3ihNqRkL2Dvgfum
         Xr8A==
X-Gm-Message-State: AOJu0YyUbrQ3sdqAFA+rGvVLmLnkDu/29JZsqXWS/p+BWxagelWsu+Q+
	6YPXYRxzBglhA8454DVZFC8K6Ii3FV7yzPuxGdeJt9diDoKJDE0F5q78DZybVihXRDliUh9++dd
	nMpswroWFXwjkdn6EFDWRcFKBHc2TY7mcdLxeiIQybIHMOfJ15jWlTfAet1MPinow53KN
X-Gm-Gg: ASbGncvfyBFk8Ulr0FyeYMZFY2ubjIrq1d8If4hiTXVP/r/u27kH0p1H8W/H5/gDtBz
	ozTmPy76bsBlgnU4fo8x9uHPKJ3U5hBVeic+iWi9ZblqFWDkHgHsIx2vkFmjo1KxbOpSfTMsfIG
	VrK+B8Sm7cgqev3Wc9dbfA7CPZgb2lsy0xOBbjNqm6DESq34lAfaGmrQREwrJE7g/nSQDGYzjV/
	iRnYRKt6P3MXrWF5pZfqT18wEPpZL2QkawDTuFYUQs5OeY1VDxWzaH4M6HBXg5Ul+vrFa5mgJ9q
	X052z7jLS9JCX9d4X2RljPOUjXe5RUHc+Do1keRlk1HbYPtz+lsdWdv53tG69VfTzmHdx+IfQRu
	87w==
X-Received: by 2002:a17:903:3c2c:b0:235:f143:9b16 with SMTP id d9443c01a7336-2430d1e30c0mr26615725ad.41.1755067134615;
        Tue, 12 Aug 2025 23:38:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2uBR3ZPiiG7SAkxHbGW8wZNiVA+HlrNvkHKaxz/Lc8LMbuYKlIhTOF22do5XE5gFKhmT0Kg==
X-Received: by 2002:a17:903:3c2c:b0:235:f143:9b16 with SMTP id d9443c01a7336-2430d1e30c0mr26615445ad.41.1755067134156;
        Tue, 12 Aug 2025 23:38:54 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24309a18411sm21766305ad.146.2025.08.12.23.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 23:38:53 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        stable@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: [PATCH] arm64: dts: qcom: sm8450: Fix address for usb controller node
Date: Wed, 13 Aug 2025 12:08:40 +0530
Message-Id: <20250813063840.2158792-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX13tSOLKVD02I
 EMYOBu7NTZB9e1+fYSTQaFSHLOG8YeU6JfeAbVFAyRd53qPjItaeMm8zi3IFerHjctI04oa4+uH
 gCht0aipnkDjKheIa+b8oFufbnl8Qsck2zVjxlV05h/F/9ju3hmngDYK8QgKy5jQNGKP+PAZsi8
 ER2dbV9YXBtm6B8n0FcnUxCVtkCPiB5D8lApkrFWkdZ4A/BtEBHdRmOUwFD9pD6h93NF84EJ2DC
 FJCi3fLsvNzpsb5/gwKTbk1tBM67PN1WYwvLsrAKeH5zJWqNf1PC6FyCM/3dBRDGQ08HzJFXYQ0
 mRKOPwtU1IzZYychcrN9cPhtuKOw0vCRA1EyLudwlsRv7t9RiQA0zjPQVHeob8YVHYuHapm6s9D
 AeBRcjKe
X-Proofpoint-GUID: i84ahWizSy6fnLqIdP5ik6iNLa_ODalc
X-Proofpoint-ORIG-GUID: i84ahWizSy6fnLqIdP5ik6iNLa_ODalc
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689c32ff cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=1MfqABlD--IGNdjwxagA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119

Correct the address in usb controller node to fix the following warning:

Warning (simple_bus_reg): /soc@0/usb@a6f8800: simple-bus unit address
format error, expected "a600000"

Fixes: c015f76c23ac ("arm64: dts: qcom: sm8450: Fix address for usb controller node")
Cc: stable@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508121834.953Mvah2-lkp@intel.com/
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 2baef6869ed7..38c91c3ec787 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5417,7 +5417,7 @@ opp-202000000 {
 			};
 		};
 
-		usb_1: usb@a6f8800 {
+		usb_1: usb@a600000 {
 			compatible = "qcom,sm8450-dwc3", "qcom,snps-dwc3";
 			reg = <0 0x0a600000 0 0xfc100>;
 			status = "disabled";
-- 
2.34.1


