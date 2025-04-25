Return-Path: <linux-arm-msm+bounces-55715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AEDA9D0AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 20:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F1FC16D983
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 18:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B25217716;
	Fri, 25 Apr 2025 18:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DC8hQOTO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B92188596
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745606730; cv=none; b=Doe5StS3xIIuJ5BxWPj63aAKLHE6tv/YM+v5WtsoZlFJE9nDI68FnRs0PrLgCfoZGM53U7UO9OK/bhGrZI+jdkF+fV4jwNYuuQa0Lx/dVW7f2VI2OBMifMVlZ3B2d/G515FR0InorOkXyTA7xJspRudSwEuQwHJfpmsm2vlKWUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745606730; c=relaxed/simple;
	bh=BNpdicJXoLGWkWg4ZeGn9Ii+XhEcaBNojBK1EIAnv0Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UsFqTQ9qgruWL5Fs2r9/r69Xuf/n70qnFTzf6tTs2DV8a+w4YSxjbeLXCi1QGX4nIbsjYAC7Dk7xeVrLhMw6oTQgfZcs5S9tSVEaX4ZqcMDjZkAqih6grUHfwUkOT6QWkMmjfN9WSF51vL+D/cgqlbv6c9KUlC+AbMq4gHLmKpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DC8hQOTO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrRH004656
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fi9sboloBMqbSP3EVVpuP2
	G1c7dk9xKFMIdYMIuaGQI=; b=DC8hQOTOKv1E75taRgPLP0NXSuy1/OZcM6G2zI
	58is3urAZkP5OTimkMy/PnOzBVEeoro41Ts1lWhGXqhDuuUrJU1V4o1S8MCDpIFW
	X2h5jr/RTKN8aEOnsYr78OCiuq6VcCjjxuqhhBs/CkPyBan/CNqK+Gq1SCDkDkVz
	wk/VHxoVlNx//HDrBRDaH2PUxDoMk4quEeP/BrFoMNxO7qPd37cNHma6XZTVmra3
	dFhg1MsT5vVxmAz09FhtX1AdQp4KrAeuIpk0Z8+ra5KI9oSbYEti9QcdO6B7C8PX
	iFxLRHbZf47VUf3BB212qpPqzkhWm7NKZOJf7Wp8oQ167uew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0a1ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:45:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c790dc38b4so464378685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745606726; x=1746211526;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fi9sboloBMqbSP3EVVpuP2G1c7dk9xKFMIdYMIuaGQI=;
        b=EYs0fcTWZEdTWhvua+mg8H+mLoGTNU7qPORwzsPUBRMsvxaN5ssKyzAo6kbCCEiWZD
         ozZELz5a9GP27o0MXMiJfDcTmtTm0hjFOGI5ya59n5OjaO0qSZrMt9nXZsp5GAaFDv7D
         dsU5UBXA2LS6zLHLYIzXROV1JWbjhudeVQFMI3j2n9Sx2kFkZ/WB8GImKKcULmyORdeD
         Nhw98Ydk2HVibALy2QH0st4FA9/hVnbzN4MhHiSN1SjGVFbesior3UfTyZpXgLl8zRCO
         hbafGBKDVM22QlTZAVZHRH+rfSRXNL/nk7XLHfbeSzC3K7hP7S0qu5jtv/ojNc17AWGA
         gilA==
X-Gm-Message-State: AOJu0Yy0pRgTvFYZOnzMkifUd1XzGsmHiOXBa3m9zkaRn6SJkptN6cpQ
	Q+6Tu9zzPA0zvRUXJYfM/cnlPHwVAkmNqQFzNhvHZHEBFKAcyuYYaa2FpvbigeW0UYZjpHa8x+R
	Nd4SbtNd3sdvNyyyHIzOqmgfeThjIruL3PF0pZKFE51BRgJGbjxJervwA+q4CeFWz
X-Gm-Gg: ASbGncu7TaokxpmqB/0fd5JBEP82SUZlOGFefNI5Zdc8cRpBuwJUsrLeGyQ84hZB2OY
	OGFyP/YAoKLQfgqapUZEj5UBNgmvkRu0XZQkWUEiBSd5KRlwefzbeqTqHLous66RkJZfdqCnkNn
	FVowMnRcwIVWAAzYUhjKGvUx6x8FsApAm7E13jxkjirLmuUGR/VR2EJT4MUnphkYg0KRNamzp8M
	w1Dd9WLxJ+BpvWXZOtOZ3ZW5DfezS0fsdtWUv/p42QRCIfP2L51CWkp5m2OdVlEUJrDVNXvM7Fr
	N8dgemve5uj7dA1DPAnLyz7eluTMUIUCXtWliCvlWrdC0S3nabn0mFQpLqadb5SRuZt4vnzODh4
	4+YjfaU72He1qzy929wWpLCx+
X-Received: by 2002:a05:620a:2805:b0:7c5:a20f:a091 with SMTP id af79cd13be357-7c95859ad12mr1195496085a.2.1745606726218;
        Fri, 25 Apr 2025 11:45:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXm1vmoiTdWeuAnhhj3urgNVnN0twLPssYE6XSpmYFJdZ0adsQi97fPa5JHVZwSSNcVjQcmA==
X-Received: by 2002:a05:620a:2805:b0:7c5:a20f:a091 with SMTP id af79cd13be357-7c95859ad12mr1195491485a.2.1745606725857;
        Fri, 25 Apr 2025 11:45:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb8979sm688984e87.257.2025.04.25.11.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:45:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/2] Bluetooth: qca: add Qualcomm WCN3950 BT/WiFi chip
 support
Date: Fri, 25 Apr 2025 21:45:21 +0300
Message-Id: <20250425-rb1-bt-v5-0-154b35435b4d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEHYC2gC/23MTQ6CMBCG4auYrq3plIG2rryHcdE/oIkB0xKiI
 dzdwoJgcPlN5nknknwMPpHraSLRjyGFvsujPJ+IbXXXeBpc3oQzXjLOgEYD1AzUeit0AagUOJK
 fX9HX4b2G7o+825CGPn7W7gjL9ZAYgTKqvVSVRcULJ2/P0OnYX/rYkKUx8v+OZ1c7RAYgUBlzc
 MXe8c0V2VVCCY1YCevdweHeic1hdk4Cq620CrX6cfM8fwHZFY6pRQEAAA==
X-Change-ID: 20250201-rb1-bt-cec7a314991d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BNpdicJXoLGWkWg4ZeGn9Ii+XhEcaBNojBK1EIAnv0Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC9hEry2y1Ev170WQH7/km4wS0ikUFkOMMx0Q+
 9w2dIomY3+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvYRAAKCRCLPIo+Aiko
 1V22B/4kNUWwXx7Dp4N9DP4cXRd2PdCtSJIU1T3SaM6f+8rlx84DXdhmQX26TS4tdHl+wWxVg0C
 jQs+HmHg+2N4I2MSEkgMwvnuhbg+eJ66NAavDPgclLF6xR0ECVBg84++hiijCxkGoGpfsJJWqfW
 zwqbrMkQyAXJpHz55VB+erQPNx0zzA6kqqUBsXdP/7pulq9A6d43Ln8Mn/OqAvkUMLm+QkJl+Wt
 +5ZtGbl0PmhVn5S1wRAvvBPz0q6rZvS56XPX0LWM84R7Bi+URdViSzbtCY7ZUvRsNLaJszTcomk
 yBf7s76new8y/mCHZVBvwS3X8b28lOeLAYo1L46N/RxkDVRM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzMyBTYWx0ZWRfXzXW+uwA9F1Oe x0/W2p4vlodqynkC77/zM1jNEFgPw2ADTFt9lc9FBe/kD/U0Np+H4RwYu0h/3FRiTt5VLLFtrAe 7lbmhLdkU4NjAdwKDATJ3bfyf/nMcqQVHPm3w/9nkxeTwgnw5a9zHemJ/TnvD2mILN1c7sxuAu+
 5RIe87oura+KFTeCCiXltRV0IfFtJmZMPPw0+O6EJ1KGKViA/xitMkQ+h6HwKqQFgnZuyK6ZaU6 ypQyt42TbJiUGg73k/RpJul3645F/Q142Jhxh/VxH9ZomFLG8y4XKvGbi2IxN8I8M02r71cMBb+ DD7jKgFzHw80oV9GrdJmD5u0K97N/tEgLv0BiapeI92HC4ylR1zHGT5ouJf5Sbx6BlMiCtHb7an
 uX3B6lEaUYDSC1U5e2uaLzZFiufzT778rgf0Q/RdtD4xOs232MDepgxhS90bA0SAXYQBt5po
X-Proofpoint-GUID: Tz6liaolbQ_0g1q8e655KxPXViBqBy_v
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680bd847 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=QHDpyB9KspxQiDUAPI4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Tz6liaolbQ_0g1q8e655KxPXViBqBy_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250133

Qualcomm Robotics RB1 platform uses a new member of the WCN39xx family
of BT/WiFi chips. Add support for this member of the family and enable
it to be used on the RB1 board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v5:
- Rebased on top of linux-next.
- Dropped applied patches.
- Link to v4: https://lore.kernel.org/r/20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org

Changes in v4:
- Added empty line before status property (Konrad)
- Reword Bluetooth commit message to follow linux-firmware changes
  (cmnv13t.bin and cmnv13s.bin were merged).
- Link to v3: https://lore.kernel.org/r/20250202-rb1-bt-v3-0-6797a4467ced@linaro.org

Changes in v3:
- Mention new firmware files.
- Link to v2: https://lore.kernel.org/r/20250201-rb1-bt-v2-0-fd44011749bb@linaro.org

Changes in v2:
- Corrected QUP interconnects (Konrad)
- Added /delete-property/ interrupts and an empty line before status
  (Konrad)
- Enabled downloading of different NVMs as required for v1.3 of the chip.
- Link to v1: https://lore.kernel.org/r/20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org

---
Dmitry Baryshkov (2):
      arm64: dts: qcom: qcm2290: fix (some) of QUP interconnects
      arm64: dts: qcom: qrb2210-rb1: add Bluetooth support

 arch/arm64/boot/dts/qcom/qcm2290.dtsi    | 16 +++---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 83 ++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+), 8 deletions(-)
---
base-commit: 948bc2b5c6fec70fb8c5b63c78aaa27611d7eea4
change-id: 20250201-rb1-bt-cec7a314991d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


