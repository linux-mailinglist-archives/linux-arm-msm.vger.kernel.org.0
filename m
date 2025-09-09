Return-Path: <linux-arm-msm+bounces-72792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4AFB4FE8D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 887515E0ED9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A5A227EA4;
	Tue,  9 Sep 2025 14:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWzlZ2CX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FB82264D5
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 14:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426529; cv=none; b=UDGFBtPeyWyNHfw1wkLP/LyhnNdDOQBT20pzxHRGtPV0S2IpRAYpSAYoqRPwM1bnzY2N42FlnfZqTbJbHooqoTjgoPeIZolmREHVDq3raIjlsxu7GqY9eqsQEBAYOFb4Yr/DC26/L57olc3r+CTXTBskPCiAuAaK8UTZBYZSx9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426529; c=relaxed/simple;
	bh=SKFCckqprHkjCOnclksylqPnY+SvrnqhRqe7pMrdZDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDAvOseLD1u6XULRx1ZFmLfpvqBLyImfymdtPbhI7TaMi0yrpuif00aWkj2sMHS+x22gP5NCv7/AsNdGEBEy+DA9BdKYxdOZwIUIKO+OZr/LFee8HKMCzbnuuFoVCiVHIk6wc1+LLw7BbLwy3IZ77yqOWxExLVy1mLvnZOMM1iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWzlZ2CX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LiLL004598
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 14:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9B1kQb1T0UY6CATcPtK/c+w8
	8VXB7tYmHIDUsbEh6cw=; b=cWzlZ2CXdbwfse41ZXIbaRErWR8Y5sCPurxEUwVd
	YWhAZCgktvv9YMAF6NVErZCYsp1wkWLw+AX3mLOAo7nNNEXsOPRuxBA1VJGk2eEa
	UyC/bLydqe3gsWTPcRUP0fV1RHDvi/Lp4ACdRc+TcNIJMOjs+cY2iRZ3RNW4yt/y
	5wJroWh6r/H/SLaI1jougP7sAQPt1nCmf5+049v2eAW+M3oKg7PBkMbdX5FPElTj
	mGDHKrmRpqPd4362UsgaexfB+3WroQeMUnnCyEwuU5JQUGmXemksDKMGvZdi9U7D
	+XAyQ2bCW64NRW6Sz4Xl84P4uPtKtvK4S+rurdTXRCljeQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapgqn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 14:02:05 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5376ab3d024so1205446137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 07:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426525; x=1758031325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9B1kQb1T0UY6CATcPtK/c+w88VXB7tYmHIDUsbEh6cw=;
        b=P5EWSS/anIVoSLHtsUOL1rAEZbJaCyM7kH/bjczs3hKrZjeFdAUsREYcVZt73FMDe8
         fep7uVz1P1UaDMUiXNhZ9dM6GPBzOOGXx4HVZT8vKzR1GEs41SKpiA0A0tNKSSo0eWDH
         xv+tM7bXqeOrp2RAY6a5mh6OEutIV26s0BUJWXRYjHjzCEvBs/JOPrbUJHKoJX6P4QH8
         pxqocOtNHeQ8nk9CbUsUeNyPFWFz7B32mHK9U13xlpcdd2wcP0OhKvKQsTQ7HXobGoCz
         klucMEgFlamLZcHJxb6+CBIwVjqWp6/foTjylHDuqZz30D3tvbR0gxXEKmpremE61WDm
         gYew==
X-Forwarded-Encrypted: i=1; AJvYcCXQ7p4VuMca0ectDO9cT9UXZtzxGGy/5XBckm1osXGAxdWv7rNxaMomDXBUnT4cSZsjrV9AEHC3DnufoFMd@vger.kernel.org
X-Gm-Message-State: AOJu0YwsWVwN3uTlesMGUXBeu7zY+KXMaletcDh+bBBt0baxJnvUpZTy
	2DvgerdJK9jIb9TCzbwl923LEJRXolymgM8O8qWNZ+NnW9sf6oZKiidtd+nTBmzq7VRtLcIEtQq
	F2euFUM9e18GVUyu2Q0dTE8o6bkx68aC+1pRGjsx864+3mAmyHdyhWlJ0/8nXBDl3tktH
X-Gm-Gg: ASbGnct5Q2dm4nxEWs4QzPWGyr9Kfj2nAxKuHg041EE9xZRnSNjaKeSChDYQnGpLKg6
	6OzJMPLcdMcP7exyAjsacKbGtq1yeXWTBfxEQkyFzCl364WiUcNujbQzcQqDcswtekO2jhQ/POT
	rb5VP74JmEM0WRM/zt/coE1PSkXHW23xsoTyuVMNYaTnxzZ8TdKpAT/yNe2KBDc2E8QEe6TXfLh
	k18+2DMSdmDM4URH/KBS7eqHqkPt0muorE2kZXvGlkZ2nWV+ZBM1jd89j8+5pgDDIxhv9lHbsCZ
	rh2ar8uzL49OifY/nCjoL19o4ajKZiT5uzkTUKfpj4HtXQw4IsJT46i3s1+LSIf8v70is0XTDsq
	1HnyvGfCkVgIT5HB55Ka7uCRHryJBnL4Cp7vlGkxL2fzFnqK41sLi
X-Received: by 2002:a05:6102:644a:b0:4fc:eda:abd8 with SMTP id ada2fe7eead31-53d13a4ae5dmr2295378137.24.1757426520491;
        Tue, 09 Sep 2025 07:02:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL84NEi5zzLfmvA6uWURA/n95r+KLG5Ks00UXmw2/s0p20cMz2peYilnoYQd9/RRTYJAcA+Q==
X-Received: by 2002:a05:6102:644a:b0:4fc:eda:abd8 with SMTP id ada2fe7eead31-53d13a4ae5dmr2295275137.24.1757426519750;
        Tue, 09 Sep 2025 07:01:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56818067eb7sm537728e87.106.2025.09.09.07.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:01:58 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:01:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_svankada@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
Message-ID: <w54mpkzk7irjb7m5jiouxhj77czj4ex72oqioaph4o5qhcsay2@qjolctktsu4s>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-4-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909114241.840842-4-quic_vikramsa@quicinc.com>
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c0335d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=xh7zYxaUke6ZEiU0VLUA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dbq1Xthr_2JZ1962FbE78onFhorI0MzZ
X-Proofpoint-ORIG-GUID: dbq1Xthr_2JZ1962FbE78onFhorI0MzZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX9iEPDjFdflI9
 X0hIFXA6JibcHriiu5M56ONW9SIHYpVuL1oftvS6Eoj1rdgLLvTfnNW8FQ0eJ4WuuJQn2niW558
 BfwlqCG2+DB1lDVMdSyVF7NpgB6omBgsJr7Sf1IRh+2rfNttrS/PSdPEexwGvYgCRTukRhMGbGQ
 xB/L4IKmdKLqzuewsO0BPiEAnykKtC0nN/hDoEGG+IENciaJsSWvUM6+RB6HwPkOf+5/lVizmRq
 fQ+ZSjiEsI/X6GD54VbwSwDSBF3dJfgGu800/1Klm6RhNiuoh5t9D9Mlgiy/D2/k8fNWXKquscw
 7cYRpxh1ObH/F0FFihh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2509060000

On Tue, Sep 09, 2025 at 05:12:40PM +0530, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Enable IMX577 sensor using the CCI1 interface on Monaco EVK.
> Camera reset is controlled through an I2C expander,
> and power supply is managed via tlmm GPIO74.

Why is done as an overlay? Is it a seprate mezzanine?

> 
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  4 +
>  .../boot/dts/qcom/monaco-evk-camera.dtso      | 98 +++++++++++++++++++
>  2 files changed, 102 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
> new file mode 100644
> index 000000000000..5831b4de6eca
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/* Camera Sensor overlay on top of Monaco EVK Core Kit */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {

Is this a different product than just Monaco EVK?


> +	vreg_cam1_2p8: vreg_cam1_2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam1_2p8";
> +		startup-delay-us = <10000>;
> +		enable-active-high;
> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +

-- 
With best wishes
Dmitry

