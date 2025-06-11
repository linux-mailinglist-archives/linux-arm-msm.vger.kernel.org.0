Return-Path: <linux-arm-msm+bounces-60952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 672F9AD538D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 13:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CCDD3AC47F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 11:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212F42E613E;
	Wed, 11 Jun 2025 11:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxXrh9Do"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CB92E612E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 11:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749640559; cv=none; b=E3Wa2cBzfiVMa67JUN5XR14/fiHdnWX6v6v5aqSWbyEdIBfAPS5JLMl4Qst5Ag9tWjBTvJ3bm4J/Y6CA+po4g4VQKO2KpXoiLUnCZ5bz6wxzUg+eZEgm2NAK0GW1neevzINoOQBJ4S4Q+R8YgVuQtCpiUzuNhTNfTRVQEPBHe1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749640559; c=relaxed/simple;
	bh=tir53TSjkw3/xfxcfRmGyJDlmk+DY/g391WffwmPdjI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NSS4rvtt77e8YgcMO9a5ue5EsIg0TpgcVW7enaqlgCgGIGFzU310O6wfU9tMMsLq1sl27lGcQmZ3oBk+SOGLoV6vVuYXYihQHjs+zqcHT2AmEHa4AtZ7WhwI4053kCsUK7FtS3VVLZPY1nAaLVgXIlHyprSWEtp7Y4ZnEGcX/Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HxXrh9Do; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DES7009053
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 11:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6bcwvX4gEpvYIjcBEapn8g
	GSYzu5mivrPS7uygKQxHA=; b=HxXrh9DoaapoHyvbZTEERKhkYjwPTYRb1wFUpV
	Qw0ee7jPdhV5kF5iykjlS+oAAwRVI1bAZ1TZxmCmrYXsx4lA+s8QkzcgU1MIoltC
	v5PXVqgWDGVxOpeEQsvSrU2FE9rU17ilM47eC1pDZzv4YAIlAmZncOP0fXCL6v7w
	iPCHYaTaf7vu7jTnVG8PCU5roiw7EzUAS7CA5Eo/9ObNOKCwrm3MGg4KUf4dvhjg
	4JFlmA5x0tOAlQhUni8ctyHXANZTuMIDsxvyBsGMD/5VJ3KEiF/YTqKUC/rCasu6
	htulFI8VimDqlmGpe3jE1iBjbXC3+ZYWJ/17g0xN9dfjhHyA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47753brpgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 11:15:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26e6b84a31so3941088a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 04:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749640555; x=1750245355;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bcwvX4gEpvYIjcBEapn8gGSYzu5mivrPS7uygKQxHA=;
        b=vIm4KKsq9R+TsQ8cKuUyRlBYI33Tb3yh0woSrZKyjlCduyyZ74lmXyVYcf9MIzJgLr
         oeQdUuWyeA0br1yzKrom65NjHuM4u4MAsuMMONGgXoixBKui5Z5ZVfXXrNQAai/B1Kor
         qQz8FYdisqIiQ9ZPPNXleXc4o1JGeEW2iHOnIjVghDfaxp5d/pAz8u4384VJtF1Cn8UG
         q+tOq7t9V7++2waLCiaq0HGraVTPE0VsTDsASPzJjaoatwNSK6QOFHoAt07O0V/2xL6Y
         LPZtvBSsnfbCGphlDMU4dHfW3WLY+ZStR7R8AOl0LFufeWf7Mz1MsR0cSxX3tZQXh5VD
         Naog==
X-Forwarded-Encrypted: i=1; AJvYcCXd5/rcY3Z1CC+iJ3PYusImsMW6slupV5I9cwe1iYWNGWiacRsfQy7W4WyUliMWddCGh0SocmTuKEQCGi5e@vger.kernel.org
X-Gm-Message-State: AOJu0YyOXfGKoOtDlLsl7WlMndZLMxFlw69UfkqbfxSQC4SJOo+lmA+o
	R+G2h80k/+XOsz+K0DOWkV9nMpD3MV3w61CWzwR3EEgKR7pbJKiejaIjQcJQmACMdbnkmrjf5rq
	Wzoox4TO/1Y53ywMXylCvqOH3RDyeGM/fFMeaARbLVUiKYmM/J0lsi8M8pXjfQRpmf1IS
X-Gm-Gg: ASbGnctvyO30yaDJe8sFzgY5JjkOfmve6VYcRTFT1gf1ukNRKPH4eV++2bz5/Eqdt8Y
	wWfrBwL1qDM3dvnYoS5vcCqGSQG4psuEZWYab0mdMbWmptXZONM7jCOvetn42DiogePFjZTZAaQ
	qTLIVpUSdw6HSqygkxnVFNqNFhxgvg0Qh69NNNQ4KUhwXISr37VaxHdBxE85JhUWfGwhOXPCUzy
	T1PKa2HUTPvZi85vNyFWRwu/8wvMLtoqtdigqZ/XsVeUQJHk1gmHpeA1Kvie18kYofH3cp5PHOw
	6T8r6Z+YAWsGs2gpToFP8xqb1/dUdI+a
X-Received: by 2002:a05:6a20:1443:b0:21f:4ecc:11a9 with SMTP id adf61e73a8af0-21f8674384bmr5182084637.32.1749640555081;
        Wed, 11 Jun 2025 04:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCzs/EwozS2+jM3nfZzo8sHxEcKNC8JH6C8JAdHxa5QTI2A6Hb8d3Gp3f9wRZbV5iIW6Heew==
X-Received: by 2002:a05:6a20:1443:b0:21f:4ecc:11a9 with SMTP id adf61e73a8af0-21f8674384bmr5182020637.32.1749640554632;
        Wed, 11 Jun 2025 04:15:54 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0e9d57sm8820772b3a.160.2025.06.11.04.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:15:54 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Support for Adreno X1-45 GPU
Date: Wed, 11 Jun 2025 16:45:30 +0530
Message-Id: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFJlSWgC/02OMQ6DMAxFr4I8NygJlFKm3qNiMMSUSIVAEhAV4
 u4NlKGLpWfrP/8VHFlNDopoBUuzdtr0AeQlgrrF/kVMq8AgubzyjCdsEQNDZak3TIq7QtmotMY
 UQmCw1OjlkD3LH1sap+D0vyVU6IjVpuu0L6KeFs9ObwZ7oNXOG/s5ysziSJz32//fWTDOMCfMe
 ZNUIq8exrl4nPC9q+MwoNy27Qs9+9qt3AAAAA==
X-Change-ID: 20250603-x1p-adreno-219da2fd4ca4
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749640547; l=1468;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=tir53TSjkw3/xfxcfRmGyJDlmk+DY/g391WffwmPdjI=;
 b=boSdoAmoFVFkKeAEz/t/ojFWCig1NztCZfwP8qlXEYtkZ0rhoNdUnxkTTjyrf8ntYT+9A+S68
 e8DQZ/kjg/kCF4HThVdDLAPhzajXNLrZGgxYS+L45XpzVh0R/cEUiN9
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5NiBTYWx0ZWRfX4Q/8tQ/C+kcc
 50R+XqHDRBGyAjvUlrVmhi6fZItwxkD4JnW2OptQWebc1WeMfCWU0OU6eV56PuyZPmlJjqrtECf
 mRAFB+oiuCv0xFavJ27vyI5bkyqfSTG8RY3C8dLQQ45uEGoZ2CAvd9w7kCIW5b5xb8BLevc03Fo
 qa0AerIaCAgesbSY+NHfu2MigwjauMuIpZ608s1lwAadALh7lG5djLmQNzSnUlkCikA8pOz5A/a
 MwuZIAOMnbhoOqWvcevxMkdWvK6ktw92iHAiX50Tp9WZwvXdp5JOoyarmTAPnvQQMFNj4fETuIm
 QvnVoyZxSLqzeXigVAbl5HAThgpiJTvcDKgQyx0tR26IeZEywtTitb+xmu6t20JpeOz81BkWoJw
 dV11Ly3n22sQAJBH7ynOpKgrT/hze3WvA5ok/09OXFuAjd9R1GLR4VxJ5LQGdWQR0unLfucA
X-Proofpoint-GUID: PTplGTCZIoviVtGLphtctjjipptY0MWy
X-Proofpoint-ORIG-GUID: PTplGTCZIoviVtGLphtctjjipptY0MWy
X-Authority-Analysis: v=2.4 cv=SqOQ6OO0 c=1 sm=1 tr=0 ts=6849656c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vb8sKYNj6oKrwasmUUsA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=914 bulkscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110096

Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
version). X1-45 is a smaller version of X1-85 with lower core count and
smaller memories. From UMD perspective, this is similar to "FD735"
present in Mesa.

Tested Glmark & Vkmark on Debian Gnome desktop.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v2:
- Skip 'delete-property' wherever it is unnecessary (Dmitry)
- Reorder dt nodes alphabetically (Konrad)
- A new patch#1 to fix the dtbs_check error
- Link to v1: https://lore.kernel.org/r/20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com

---
Akhil P Oommen (4):
      dt-bindings: opp: adreno: Update regex of OPP entry
      arm64: defconfig: Enable X1P42100_GPUCC driver
      drm/msm/adreno: Add Adreno X1-45 support
      arm64: dts: qcom: Add GPU support to X1P42100 SoC

 .../bindings/opp/opp-v2-qcom-adreno.yaml           |   2 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   7 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             | 120 ++++++++++++++++++++-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  38 +++++++
 6 files changed, 169 insertions(+), 3 deletions(-)
---
base-commit: b3bded85d838336326ce78e394e7818445e11f20
change-id: 20250603-x1p-adreno-219da2fd4ca4

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


