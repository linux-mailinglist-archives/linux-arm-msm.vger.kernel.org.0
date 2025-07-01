Return-Path: <linux-arm-msm+bounces-63253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB0FAEFF94
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 18:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47BE94E0BD9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 16:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F6E27E1D0;
	Tue,  1 Jul 2025 16:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AXaP810p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4176827CCCB
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 16:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386876; cv=none; b=Lz4WYrMJ70e20khjeLaf4szoYbdLiSaylfBMVbZznqdiVJ3Zk9gu2pxGhxRRiya06eqiNxFM5QANTtbc5lV1piSiodeV5SmmByUqkPyEqGzzh6MLMvMEzgRXLWYm+fYrUoFh9c77V4wkF/UqU1/qWCzUx62P5epJzcKY0/VF1OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386876; c=relaxed/simple;
	bh=Za6lIWF/Guy1GsjD4sh7LPCArHr2/CqqWk9C2FJ2SII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q4EB02zjvY5iELR6Gcioqu+nlOb7PUJ/6ci1uQ1cA21jVF0qELBben/Rf/fq6EmPWvLS26paBV4U5wb4pcftnmCevF44/tyKB9rFynEPZaCu3tmFXwTbo45F8+5eaOhpMWVijJ/UHoCRKGOIRmbxFg9V70ufURjA3pJjbT7byIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AXaP810p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619wt5K018912
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 16:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	azQj83Mmk/KxwVbKtYnkyraSdBj9/Y2r1xncvr9qZTM=; b=AXaP810pOvQYnQYk
	rPwxmcwtgmMQrvF33lMTlg4zr1G8pf1JLEf1I0LYm+z+kTbmXYCbwAwv/mqX8fVy
	wFuHJ/FdZ7OiFJ9KXTF9+Ghn+gAPxFXJqOKnUZH1QliacHWXZsSVRMHS6cmKAT76
	BIW3fjV7WfWmaCZyJtPYiUaUGQlLm7IKyDjZdPbR1/CcEOF8/81hJISfwZJX9nDc
	ePzYNkT1Dc19Ool0I7RIxsiKEDbU/KOE8GW6enaJJXbFJsmol5Tld6pojvh19vC4
	/EYVbO8aBnf9jrZuD04Zb+1nqPq4Jj2RWobfFI7noxr+k/OfwDrS3KwG5A4Qn9bX
	cR1Aww==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxhn29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 16:21:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748e1e474f8so5660943b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 09:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751386873; x=1751991673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azQj83Mmk/KxwVbKtYnkyraSdBj9/Y2r1xncvr9qZTM=;
        b=vts3icfdpMNjMHmjFybLn0FnGoAV0Mvy2q07U0MxNatcsW9zYi4+S5XY3OCEH/NfRE
         7N7RMpYOC+eN+c3UJ3ZFDD8tRwqk15wbK7686rRTF/7HuaxT+UGX6doxZSidbNapVLUH
         y+eybM/+CHm9OXU5+zZdzYqjC5E+VVjpCm3X2JGpGJI24L6cloVINo1Kh/Koo0UEFozI
         UFQGqgyZra4l8L9sSVVU1XulKM6WjXilLL40TGAeuGOxvAA1skqJMiTJ8tk/GYApU5V2
         aiY2RDzbv9OHvNBj3QCha2ARUfQtMkLmCKc0rrg9cJM8MZsOxngqhamZtaE1yvX4P+ia
         ZIUw==
X-Gm-Message-State: AOJu0Yx2/zAxszH/TuS811EUuYE/+/NnYSIKaUOEtEbX0d4ep6RABhMk
	MyOjcW+QaaysrmKtc2T3N5gRDQMMVzDyo/j2MsvJhLtjRLtCuWPpSJowvtPaRsPp/x3Ar4GaB15
	YnsrwoneHmabQsEwfnSIC+3YLR7/E+DQUEZlTy3xhhjTBz6JArzJ7ig9Qu9tDsNFknu6t
X-Gm-Gg: ASbGnctFp8QnijTuC4nZ37ndnC52OB3aowLHtn1z0UsTNyayv/ApjX0WP5fCSAuGlTR
	l/F9QTjHvfnXAj9IBVlQItll3TwJpfb6cJA+qLz8Hwrr/KcghsQt3Vf2KTPurEw0bRgiACRSXgQ
	mSy4v0i13iStj78TiqHXttn570C1qmdNwZYbNRtNxJGvhVN/wby7Ec76fgzA7XNM+lhFZ4danY+
	huO7lgsO+5mIMPF73/Pmw9Oi2tiP/pJk36QSuAz/N4xTmNgL1DoN8AbcTmY2saj21Q18b7B5gJv
	iOi24RSUGRklvIDh7nidHZXVMaUzeFC6LJMyEruOJCheUhg=
X-Received: by 2002:a05:6a00:928d:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-74af70a7cd5mr22530379b3a.21.1751386872615;
        Tue, 01 Jul 2025 09:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEecrO+V7Bz+q8mJ2CDKZ/SQ9oZaD+cS9NTiHZCC1vT0OJ9WMqoEMlvUTMNHQy3TEelC0HoMQ==
X-Received: by 2002:a05:6a00:928d:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-74af70a7cd5mr22530329b3a.21.1751386872172;
        Tue, 01 Jul 2025 09:21:12 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5805265sm12573010b3a.168.2025.07.01.09.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:21:11 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 01 Jul 2025 21:50:45 +0530
Subject: [PATCH v2 2/3] dt-bindings: power: qcom,rpmpd: add Turbo L5 corner
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-x1e-speedbin-b4-v2-2-a8a7e06d39fb@oss.qualcomm.com>
References: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
In-Reply-To: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751386855; l=878;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Za6lIWF/Guy1GsjD4sh7LPCArHr2/CqqWk9C2FJ2SII=;
 b=/qoadYRq2CIL3dDt2uzdosYg4pWF6aJq3+3r7tYv+cVDujCQFvGoNr2jCHbcRIo/G7YiE+DAY
 GzgGzFreaATBfb5Mp8vvtOk/qRs2irrznGDZk++QBrGbmk4hgKxq+O0
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDExMCBTYWx0ZWRfX0h++ZmAgExMc
 Y1UlDj19ci6dttQhBs1iDkAzikuoQWhBv9UQHY1oxHNPF7cJiqjou8RUDzH33jnAVpNutOKu0jx
 iJ/ZnLmqXwPsDyAygUAFA0bEXBDLhAK39FDcqExHB3YNxVWcHg0ujbftNFLYh+MApxyDcnSbT/o
 hXgJwysYdyxOfYpohqnVi1ZyX7T25OfkQH7k/Zp+469Ph49qMgUZKtMVTqJQG5BBDDQL4/Z+VuP
 YT+oMsp71gsG1yRR9dWTrEwGXqYViQ78GMKR+l8Sq8PNVMAZDXC+B7MSv/IkzpnLbSS1P66qB2S
 mI1mPfAXVAHl79T6dqmqPAjHjR9mH+J/XsJjKxz64lmIvYNSEA8hYNmfG8oLyQbH8xsgbZQZfxb
 YXg7xFPlVh9HSPiRq5IroWCEaqXeqx3oYpKeoHX4QlpPzSfTcGh6LLpixgp9Tx6gqS6wGd/O
X-Proofpoint-GUID: Jz1atfqOS3FYYFof5zB8Sc7ZCIn3I46W
X-Proofpoint-ORIG-GUID: Jz1atfqOS3FYYFof5zB8Sc7ZCIn3I46W
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68640afa cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=S83do3EnnC4SDWe4yxQA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=719 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010110

Update the RPMH level definitions to include TURBO_L5 corner.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 include/dt-bindings/power/qcom-rpmpd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index d9b7bac309537cbfd2488e7d4fe21d195c919ef5..f15bcee7c9283e74dc8e6f9b6b6f73c0ced009e4 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -240,6 +240,7 @@
 #define RPMH_REGULATOR_LEVEL_TURBO_L2		432
 #define RPMH_REGULATOR_LEVEL_TURBO_L3		448
 #define RPMH_REGULATOR_LEVEL_TURBO_L4		452
+#define RPMH_REGULATOR_LEVEL_TURBO_L5		456
 #define RPMH_REGULATOR_LEVEL_SUPER_TURBO 	464
 #define RPMH_REGULATOR_LEVEL_SUPER_TURBO_NO_CPR	480
 

-- 
2.48.1


