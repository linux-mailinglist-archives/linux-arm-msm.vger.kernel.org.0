Return-Path: <linux-arm-msm+bounces-89286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 655E7D28FF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 23:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D2D730402C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 22:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D33732AACD;
	Thu, 15 Jan 2026 22:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EwS9dfMf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MGEcp/h1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730CD3191C0
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 22:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768515776; cv=pass; b=JgDaeUD6E30jdu1qTotmRpUc4bDXQBwCeHHRJMSMp5h1zWhlNEApE9ncBVIw3N0rsh7+4BRH1durArvYx2wwEy0J9Wq4/10MdXJX3sptlf/JFDQgwAxIA4DezOYmym+mxPv6fpNQDivxWNISIjfaq23PSUCdoREoXAYI76/o7fE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768515776; c=relaxed/simple;
	bh=QOSpTZtZzRWh6tMwZ43PxOAFHYO4aoU0A1v2+rA1+hU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssdhRB5+Mx3l9n+dMD2VEfxfrKmTF/cHNTTE2tR0u6t+79SJWAbXFp1HKwLYTZFj2ZkeWsWjrviZyMaz9e4omny7KBBh/A5o2sh/JP3zAQX0WxVsnIgpUVG9XCOhVvcP4/gDQVYCETSwHi101D/dDj6dMBWk+Ydpi/aCGtkjZmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EwS9dfMf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MGEcp/h1; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMILmb1199765
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 22:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=++9T+ZreIDbyL3ecbXA9o3o1CuOYwWv1qVO5IQ0Q36g=; b=Ew
	S9dfMfmURuxOliARPU123y2Oyz1MjThNR2Kd6AKCDc39J2yNb+FhZkBJ5jUvjJf9
	HnbwzzdTmIgflGY3834KzvcX7gTb3EXAkVAc4znFywLaF+WBRGo+7e2WJJlcExkU
	eV1z9QPPQlfw4E883NK8mZBOw0D/9hPE+aiiEtgVKAMUz1WkDGo9mR2QtwShIdcU
	h+DE6B9GhUVuFWnFpxo+4FJKY+SzpJKJKA1ICCjZWuQHAbpGqbyXBJ8ZXyPDqo34
	1PbinfbGMRoejGcuL/Lk3nz01mcfKyv6c8hWJ6d0YRtJOGCeP6yOaLskCWuCp4e2
	B00wzVc60FTS4YvYT7Hg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq7wq85bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 22:22:52 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-459f574e553so2999335b6e.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 14:22:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768515772; cv=none;
        d=google.com; s=arc-20240605;
        b=EEsFyXfaw8E8IjJyVQ+d6jBmDIEUjno8Max4+vCbGZCK/l9meJ2Q+urzgBBooKoC1y
         5PP3PYm56gDiEQ9m+LGCr26uqB/Er9xFKkAWVnHuaBA0bPyMmc4bWhNACELgLpDAiI/B
         zGHoxRtsYJRjgB9I8JcqUKhOrKobO2cErugfyrgkcFsQgWdIgzkf0A5i2+9Qi0o4Bj9O
         F3BUUyWe2qydhQxP/kFxCVbKJzoAprG9Nf9b+WVuztLtk20HhU+/xm0VYjjhi08RkNQB
         ejgC8k9Ps6NI5MCJllHXq+YrsV+J1CUhFGvCdqQqQoIxBWzNz/nwrI36Nh7/+NHX0i8a
         eKSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=++9T+ZreIDbyL3ecbXA9o3o1CuOYwWv1qVO5IQ0Q36g=;
        fh=q6Rzljr7yCtnx7lqjBDNa7xPF3lgE16ESs4hETSlpMM=;
        b=GTSAjiDkIkhgn7MC3ErRsm/OhRH4GYxo4Bfmagt7AsNbf2C9p3udcU8QVca+XBwVQC
         dKP7A7fNvnDWF0GdLEw7n/UnDqCZ433SSg/mMo0HYE39F06jfWFR++x6ymzQmRJn+rYU
         pqkjsEqzWSx8RMIzgyKm5+btPI6wAp9DYykTISDTfibPHJ+vJa2vaLVkZyddffs7JWD3
         qmekCzzOK/ijpN6XzRus1TYlvabnJs09IOUEXUjA1J7lVBi8W4RQI6M+8ovjQo/8sFeL
         8Lrcf24FkomrqY0NoPjz3p40vkAgKBD8VMezMlMZgC4S9qn4FU+L27u/Q8kUbiZNzvjR
         nHFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768515772; x=1769120572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=++9T+ZreIDbyL3ecbXA9o3o1CuOYwWv1qVO5IQ0Q36g=;
        b=MGEcp/h19ZorkwpQVUxH0/UFOcQFxfyjtdKrAkJ5wgvjM3u4W99lIPP8iUVJVadP60
         lmQ4sS3IBw67u48VlP3tfSaA02OubUSxy1gd/J4tVlO7cVqYVq7SXdFzzEzfLqn6UBrK
         IYVQTfBh0J4AYawySR7On/NsP00SdBh2w4LP7lBXD++p2gKaUJiZC4yjw+a2sBHs1xPF
         hU2WLR+kCZEEqt6yQrC4mAFKl7SYu8oLJ/U/cDn6HwrTLC0cJ59Y7ht5Z/l5gL6/6ryt
         //4Yiqu7C2BjnLnwF6WF4yS2xnuK0EzzMg21clo3i4I1DscKXDF5lDsJziGQ5nQu69VG
         G19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768515772; x=1769120572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++9T+ZreIDbyL3ecbXA9o3o1CuOYwWv1qVO5IQ0Q36g=;
        b=RiDKjs/lze0tf16Z8/fBFZehq8nNHuGbIMEZrcjlprxtqirh/qtr8flCG7H6G5NehU
         lCPllDshq/y+XM7IJYFaY7f5XPkZZpXgdK/odDQwgtVlGPsq+5OCe584He9NZeWvCkcQ
         2J86kMsDh7KgZLeFLr6jf9p81F6zByQfzI8DDp6imvl9yTGbmNooz5vg3rtbj1iOo6kh
         3lHIaP+UFZV5pNd82P5ErRHdAqmtu5Lk9HxaUSdfaDrfSImuNCXKk2+2UpOSGMOTXptD
         jYK6mfQaIMKHOfajvSoFkH5b38zyJChuUNMy/RHAdPZF08OQL3YFSnuWqcfeNF43NtM6
         RjzA==
X-Forwarded-Encrypted: i=1; AJvYcCUuifz9OD3+yBRl4BYo8SrK0rPQ/35QC5vcD3776K6IXhaWsMKtxmdBTiP8e+2pUb7GZaX5TKzDmlChH+fl@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ9b/ZdVwJScW8R42psvLw03/3wzsJVMW0em0IGv/A2kP1GbXX
	zsW5s8L8SzgtAj6mzsBP9NUq654E7D51g57F78QJrCaldlp96jmyzOLZMZ9VPeHJ5dvTxxq3KyY
	At90tLprKdKFGMpYJw2G2VCpgcmdbeSLBjOxyS5TQ/Gx/2cAAT9lhIgfpwpAjpd0jhOZSxcA5PJ
	r7WPkK/QQnRMBvRM48RZ+05vFTIE72yRrOCQB4gBcDMLY=
X-Gm-Gg: AY/fxX6QtNjzrx2HNBjTo/eM/LReVAeJRB/NlrKbZGfn3aRoBbAj7RnC2FlYvS/z+pa
	Fy+bpKBlJBbHjZA5gvKNPTVE6UG8lj+VqyMipY4nJSTQJEPyFZqxZjm6PG4ukmEtFubnKrSzWpk
	gjDXIKKEJ5ICHZZMjyztH1vkpFTmQjWNRhJvJfSuFg0R9Rczf2yR8ri8HnQx0SRZQ1dw==
X-Received: by 2002:a05:6808:1a01:b0:45c:832a:cf43 with SMTP id 5614622812f47-45c9be84eb5mr563349b6e.14.1768515771739;
        Thu, 15 Jan 2026 14:22:51 -0800 (PST)
X-Received: by 2002:a05:6808:1a01:b0:45c:832a:cf43 with SMTP id
 5614622812f47-45c9be84eb5mr563321b6e.14.1768515771312; Thu, 15 Jan 2026
 14:22:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
In-Reply-To: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 14:22:40 -0800
X-Gm-Features: AZwV_QgUato_Mye3KIAfma_metaK0S7kEx5joU_nnqK9vXWwCVlcPa3slMjygkk
Message-ID: <CACSVV0006wVK-JWweuNYAfu-a9rtn=zp93sey1srPieGEaJWRg@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] Support for Adreno 612 GPU - Respin
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=au6/yCZV c=1 sm=1 tr=0 ts=696968bc cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=mvrZoGBVeotMckK10bAA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE3NSBTYWx0ZWRfXzvsw03Lbygxh
 W7gwFIXDWNdL4UjvznqL8VTb/ExMO71oD4p5f7ecXuZ52ae1opD3vw59D1uwU3HPfDqajYpvYmh
 1YCRUtkepCUt7NDyv13Hy1L04U7cwejFcchrrff50e/uP7sU63spik0AWnLb7fQ5bUYZYP3bqLq
 szbmV93CioBsO2Aji28Dsb1kpN+2gDRlwo461Irw3sxK8LHn6YJg/xnRb3ur4kKYfmnt/EGCcow
 8QYmGHJ0eunlqicpEXHCaeZ5qNkvG4XDCJgD2315lM+opAU3XE1QgQjOKMDWi0moShhKJRYVY18
 0n3z6fje/wjdG9EWjubnswzCIWMpF1AnRByPC+hRuduCs+sK/UZmNWYNXqFm9+1+9sqM/6IiSIf
 pyiEWGXgZ1DXVoVqXvdWYdoz6R+kKyENLLjxL+wissVUxyhm1iqsWPlO1vCgwCr2Hi6THqumk19
 UVZQXAyjbFs/1wYhJ4A==
X-Proofpoint-GUID: JSL7-Hcr-bxz5luxfzUfvXuOCM7SgnW6
X-Proofpoint-ORIG-GUID: JSL7-Hcr-bxz5luxfzUfvXuOCM7SgnW6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150175

On Wed, Dec 31, 2025 at 12:45=E2=80=AFAM Akhil P Oommen
<akhilpo@oss.qualcomm.com> wrote:
>
> This is a respin of an old series [1] that aimed to add support for
> Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
> have consolidated the previously separate series for DT and driver
> support, along with some significant rework.
>
> Regarding A612 GPU, it falls under ADRENO_6XX_GEN1 family and is a cut
> down version of A615 GPU. A612 has a new IP called Reduced Graphics
> Management Unit or RGMU, a small state machine which helps to toggle
> GX GDSC (connected to CX rail) to implement the IFPC feature. Unlike a
> full-fledged GMU, the RGMU does not support features such as clock
> control, resource voting via RPMh, HFI etc. Therefore, we require linux
> clock driver support similar to gmu-wrapper implementations to control
> gpu core clock and GX GDSC.
>
> In this series, the description of RGMU hardware in devicetree is more
> complete than in previous version. However, the RGMU core is not
> initialized from the driver as there is currently no need for it. We do
> perform a dummy load of RGMU firmware (now available in linux-firmware)
> to ensure that enabling RGMU core in the future won't break backward
> compatibility for users.
>
> Due to significant changes compared to the old series, all R-b tags have
> been dropped. Please review with fresh eyes.
>
> Last 3 patches are for Bjorn and the rest are for Rob Clark for pick up.

I guess you meant the last 4 patches are for Bjorn?

BR,
-R

>
> [1] Driver: https://lore.kernel.org/lkml/20241213-a612-gpu-support-v3-1-0=
e9b25570a69@quicinc.com/
>     Devicetree: https://lore.kernel.org/lkml/fu4rayftf3i4arf6l6bzqyzsctom=
glhpiniljkeuj74ftvzlpo@vklca2giwjlw/
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Changes in v6:
> - Move the rgmu register range update from patch#8 to patch#6.
> - Capture trailers
> - Link to v5: https://lore.kernel.org/r/20251226-qcs615-spin-2-v5-0-354d8=
6460ccb@oss.qualcomm.com
>
> Changes in v5:
> - Rebase on v6.19-rc2
> - Make the reg list in A612 GPU's binding doc stricter (Krzysztof)
> - Link to v4: https://lore.kernel.org/r/20251204-qcs615-spin-2-v4-0-f5a00=
c5b663f@oss.qualcomm.com
>
> Changes in v4:
> - Rebased on top of next-20251204 tag
> - Added a new patch to simplify gpu dt schema (Krzysztof)
> - Added a new patch for GPU cooling support (Gaurav)
> - Updated the gpu/gmu register range in DT to be more accurate
> - Remove 290Mhz corner for GPU as that is not present in downstream
> - Link to v3: https://lore.kernel.org/r/20251122-qcs615-spin-2-v3-0-9f4d4=
c87f51d@oss.qualcomm.com
>
> Changes in v3:
> - Rebased on top of next-20251121 tag
> - Drop a612 driver support patch as it got picked up
> - Rename rgmu.yaml -> qcom,adreno-rgmu.yaml (Krzysztof)
> - Remove reg-names property for rgmu node (Krzysztof)
> - Use 'gmu' instead of 'rgmu' as node name (Krzysztof)
> - Describe cx_mem and cx_dgc register ranges (Krzysztof)
> - A new patch to retrieve gmu core reg resource by id
> - Link to v2: https://lore.kernel.org/r/20251107-qcs615-spin-2-v2-0-a2d7c=
4fbf6e6@oss.qualcomm.com
>
> Changes in v2:
> - Rebased on next-20251105
> - Fix hwcg configuration (Dan)
> - Reuse a few gmu-wrapper routines (Konrad)
> - Split out rgmu dt schema (Krzysztof/Dmitry)
> - Fixes for GPU dt binding doc (Krzysztof)
> - Removed VDD_CX from rgmu dt node. Will post a separate series to
> address the gpucc changes (Konrad)
> - Fix the reg range size for adreno smmu node and reorder the properties =
(Konrad)
> - Link to v1: https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-0-0baa4=
4f80905@oss.qualcomm.com
>
> ---
> Akhil P Oommen (3):
>       drm/msm/a6xx: Retrieve gmu core range by index
>       dt-bindings: display/msm: gpu: Simplify conditional schema logic
>       dt-bindings: display/msm: gpu: Document A612 GPU
>
> Gaurav Kohli (1):
>       arm64: dts: qcom: talos: Add GPU cooling
>
> Jie Zhang (3):
>       dt-bindings: display/msm/rgmu: Document A612 RGMU
>       arm64: dts: qcom: talos: Add gpu and rgmu nodes
>       arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU
>
> Qingqing Zhou (1):
>       arm64: dts: qcom: talos: add the GPU SMMU node
>
>  .../devicetree/bindings/display/msm/gpu.yaml       |  89 +++++++++---
>  .../bindings/display/msm/qcom,adreno-rgmu.yaml     | 126 +++++++++++++++=
++
>  MAINTAINERS                                        |   1 +
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   8 ++
>  arch/arm64/boot/dts/qcom/talos.dtsi                | 149 +++++++++++++++=
++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  14 +-
>  6 files changed, 357 insertions(+), 30 deletions(-)
> ---
> base-commit: 2408853dde584f01950a0f976b743739cce30eca
> change-id: 20251015-qcs615-spin-2-ed45b0deb998
>
> Best regards,
> --
> Akhil P Oommen <akhilpo@oss.qualcomm.com>
>

