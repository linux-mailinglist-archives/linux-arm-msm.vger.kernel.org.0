Return-Path: <linux-arm-msm+bounces-85010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E96CB54DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 10:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20BC7300A1E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 09:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DFC2E62A2;
	Thu, 11 Dec 2025 09:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NOSEQvtX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K6DGCbd3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6486B259CBF
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 09:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765443773; cv=none; b=ZGh5SdCcLT4lCu9gwM7if2cmJUJivi7FqmCmgomuQw3Mkr3KarMTvIJEzCbK1g2CUypXnFD7+IVSRCaLeQmE7kns2xkX3Clxk4YLH99VCSzSKWtbLrNe8I8O6gaDyD0+lk4kJJsmglIZ95j4ThTjGzjIiNLCSYajgKOQPBb/4T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765443773; c=relaxed/simple;
	bh=QUa3DEZcMWBiNcmvpB2lseRak8nUOh0xeBJQMi2ZJhk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CjJ/WuOU3Zmeg/22cgHoHbhEU6aI+P62JsSs4UpVng0mtm0bMFDbXnQsNOWYFuin3+hyWzMza5Sq6yYE7cNdaGTzlExRQ/pP6E1D3r9cPnqKUfLYAS1P2GfahoCmiI5Qg2V34qQ0O/1NmVo/JhAScynuV0wVDqZ09hgUuMfPL28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NOSEQvtX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K6DGCbd3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB8gSH3685216
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 09:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F58wD7iZDQFljT0FOPoy97
	8P+NtpnD2MVmAR+CtsprI=; b=NOSEQvtXGD/LWi1Oeag7Wu7l+kWC7ViqVEVyWq
	vgNS8WjXQs5JdJCOiSEC1tImIio1qpdSnz+ao3D8tC9q6hVlyAvijwBT05cfkU5b
	SyN9K6YXzPRyJ+E4swgpxwrEEtHylOFKYuLaRdHAj4k7M99k/cOhlh8krKe1pDcZ
	A3PEydvKanlNaWO1pQCmo9SV1t2Zwpnfs1NLEpP36D0/OoiWpi+B0JRyvmR4NhDm
	azlZU307oXMjYyk59MfG2TgceBrpkJoQgwWEzWoZ6y8AdpqeYBvhkbLuYSL7ayi+
	LuF2F/pL3PsbXNGoH6X7UbiZLsjWb7/BBr/HUIDHPyDQ73ng==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aym5817kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 09:02:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34188ba5990so2010292a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765443770; x=1766048570; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F58wD7iZDQFljT0FOPoy978P+NtpnD2MVmAR+CtsprI=;
        b=K6DGCbd3/ANAt96rlppzP9JIeM5mFpYJy9EfDkufCwT1j0mrT3/LKLLJCUpFWtmYNQ
         C1b004VupSylkU+kmON+gLEQEysXoUSr5x6bSUkJqLS7i/h/m7Y1OBorHwuzNLtbmFEb
         4EDa35K26aHYWPbEjR3S5dHquVHxFyOcfPYYfmCK7slnAiJQ/x6zAZuSSCtjY63VAp8f
         AUEoKX7xG30VhUlG7RoOwvEcFmnPvoNG5SdldllXza6Wk9xrcBV04hC99PiQRBkazur9
         1KEWMmdAPS/l1lARUYXKtmRB9COgJfjOCZfliVkA6Ec9RHV5i4Rc4wviTuynOiYeTWZD
         C9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765443770; x=1766048570;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F58wD7iZDQFljT0FOPoy978P+NtpnD2MVmAR+CtsprI=;
        b=KZCH/bSf8tS11RcV//NXkXixXmaN9O4IH5k6nxLdPePKpo8jplKx+Ag1r8MikGv+LP
         6Jj2lqRVSuJOSGg8dteb7LlBz+sT4aXXCxwt/FHA/1cRITA4gj2AcDOzf9wXiBrrJQe+
         ZGlLusdBhmTbdTvbHfcO2WAIlmn0qDKA0cyZ+a+7uEnRcgHoaaSSen+AHKWAP/X7iv7w
         xk216QtvuX2PXEqO0VHqCiiu877j8UTGoW5++h+c5f9eSESOvb/NKvPi48suFn+1veuN
         YTF1Pw+R1XshuJkkHc1gQ23Dmes+MIghVx5TFxHk31bFqavaTkpuHe3V8WUlgAgdojUj
         ubXg==
X-Gm-Message-State: AOJu0Yy69R++bndKDIxiRbgTo+/gI+bEmrDyQ5sBCnwwEu14lLDk4/2M
	lkrvT2TUBHsjBiPrQyR+Q0boUVvd80mkdHM147LrFmEH4i7esnLUKDSqMsvzv3PAOgoxinv70kx
	pFHaZOMPEo59J9lCkn4FDjCj7vfFMbl3LzxZeLQA5PBtUOrau1pVDJCwY72Cil8uo0X8b
X-Gm-Gg: AY/fxX78vOWeJEgvZEr/4Bb+aLZL9IsE4qA/9C595H2cygL3YIMmI2jY/M25u08CRFY
	vnSI60zN/Bk+qLk5uOsGgV7h9Pp3XlXkGqqdcuX/bl3Mi2xKCpCv5ysL6DXlMG38Crn/LPM88C6
	eoSVz07QIf8lmAxJAfScqyeIWWRnDKiixE/Irec3JqRcEuENCIYLzyW+Khu84RT2z5zgFntmyS/
	tIRmgSyk98FekgVCx6mRbvtI81DA94apq76mD/ZXPdG452F+zS8gXAkhFNADezphXjote3RsU9C
	O35yFo2U2c2N/Vs17fbn9Nh08fwzsQn7ptYyKOVymN61c2sK9tNQ+kFRqwuX/ZzRgc7Pp7+VP51
	DguVrMKehu+VG5fXfGngdm48NaIiUumgIkwqBcbLaFPeyBVF6o/u9DBn/100wI7RYrF9sJ9KB19
	RM94/ru0O/gXhLIQZNjIXgAq6SVhNwLQ==
X-Received: by 2002:a17:90b:3806:b0:340:c070:82d7 with SMTP id 98e67ed59e1d1-34a7287ff49mr5417139a91.35.1765443770067;
        Thu, 11 Dec 2025 01:02:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpdBFOK+imWh1RtyBCLxP9QV8KUhIo5EFmPmTd8eE4f9vxE4MXLIE1IrNkcqT9CW932fD1Xw==
X-Received: by 2002:a17:90b:3806:b0:340:c070:82d7 with SMTP id 98e67ed59e1d1-34a7287ff49mr5417105a91.35.1765443769582;
        Thu, 11 Dec 2025 01:02:49 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a92860032sm1273780a91.11.2025.12.11.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 01:02:49 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: [PATCH v3 0/2] soc: qcom: llcc: Add support for Glymur SoC
Date: Thu, 11 Dec 2025 14:32:34 +0530
Message-Id: <20251211-glymur_llcc_enablement-v3-0-43457b354b0d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKqIOmkC/3WNyw6CMBREf4V0bUl7pYKu/A9DSCkXaNKHtkAkh
 H+34trNJGeSObORiEFjJLdsIwEXHbV3Cc6njKhRugGp7hITYCA4gysdzGrn0BijVINOtgYtuol
 eZMVBsaovFCdp/AzY6/chftSJRx0nH9bjZ4Fv+1NyEP+UC1BGSyE5a1HwrizuPsb8NUujvLV5C
 lLv+/4BTuAbq8MAAAA=
X-Change-ID: 20251029-glymur_llcc_enablement-6a812c08f4c1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        rajendra.nayak@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765443765; l=1669;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=QUa3DEZcMWBiNcmvpB2lseRak8nUOh0xeBJQMi2ZJhk=;
 b=l2ybs94rRCXgGLVRQz5cHnwnzw1SEI6ju38FUzO2stw9luMlDTXxZLv7GnAN6vjtPWNhVmXpf
 hjE3VaDas8qAj71segRGh/QLk2+vgqFM4YsPKCIiDJGL09MDFRCnB3H
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-GUID: dq70CR8ozkKuUioHeMEyX29lKklHS2Nq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA2NyBTYWx0ZWRfX64Aq8wlsI7b9
 a4g1XCE0lVvYzM7wUCRk+xVYUT11Yo8FF2gfA09H6Fi5QheirQa6tsXD/tcfC1481XDZVPp2XW1
 aOw9Ppwv6KKbKV/4S/PanpjFNa8CL+sJuIxGXM+MuK4tHA8bX8R7VG2Ihqh6R5OorM7GcetNPMX
 rBMjuz0ThoOagdL8SnNITUbfTHBGgsakQpjaniRdFplhNJ4L8A7tGW2u+EZ2+OsNvTEMt9anL1o
 FCB8DnRH/QvvNG8hjSWgLurQAVav7EjiImAxvGcjOeTwJpB22XZcyAtl650qLnoiGdkCDvmZiBF
 +TqwYRX9R5UaVE8sbr1fdh38hCL2XNcCN4SxJGxt3IwkF/VpSpETxpJbrorRibG2h5uZuuH5Btc
 jVbBOJkeOULF+1pLR6lQd3e1z4ncjw==
X-Authority-Analysis: v=2.4 cv=FYU6BZ+6 c=1 sm=1 tr=0 ts=693a88bb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=7q9y67zIC7BUKB0Phv0A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: dq70CR8ozkKuUioHeMEyX29lKklHS2Nq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110067

Glymur SoC uses the Last Level Cache Controller (LLCC) as its
system cache controller, update the device-tree bindings to allow
maximum of 14 registers for llcc block since GLymur has 12 llcc base
register regions and an additional AND, OR broadcast base register.
Updated SCT configuration data in the LLCC driver.

Enabled additional use case IDs defined in
include/linux/soc/qcom/llcc-qcom.h:

OOBM_NS
OOBM_S
VIDSC_VSP1
PCIE_TCU

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Changes in v3:
- Dropped patch for changing alignment style for usecase-id macro in
  include/linux/soc/qcom/llcc-qcom.h
- Link to v2: https://lore.kernel.org/r/20251125-glymur_llcc_enablement-v2-0-75a10be51d74@oss.qualcomm.com

Changes in v2:
- Updated dt-bindings for maximum no of registers to be 14
- Re-ordered the fix alignment patch to before adding a new entry for Glymur
- Squashed commit for enablement of usecase id and driver changes
- Link to v1: https://lore.kernel.org/all/20251121-glymur_llcc_enablement-v1-0-336b851b8dcb@oss.qualcomm.com/

---
Pankaj Patil (2):
      dt-bindings: cache: qcom,llcc: Document Glymur LLCC block
      soc: qcom: llcc-qcom: Add support for Glymur

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  47 ++++-
 drivers/soc/qcom/llcc-qcom.c                       | 207 +++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h                 |   4 +
 3 files changed, 256 insertions(+), 2 deletions(-)
---
base-commit: c75caf76ed86bbc15a72808f48f8df1608a0886c
change-id: 20251029-glymur_llcc_enablement-6a812c08f4c1

Best regards,
-- 
Pankaj Patil <pankaj.patil@oss.qualcomm.com>


