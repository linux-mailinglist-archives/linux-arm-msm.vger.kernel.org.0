Return-Path: <linux-arm-msm+bounces-76646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACBCBC9159
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 14:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6474F3AB2A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 12:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7B72E2850;
	Thu,  9 Oct 2025 12:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SSLn1sWS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477F22E264C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 12:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760013687; cv=none; b=QdUd6lYaZ7IWqGRUfSxK7gdWbLZuG6yqZNBTzGmnH8XoASUXe824YlU7HQWH8bZ6/BvCs2Ey7Oxv+fkd+k6AvO+nupysciNILw2H/6bmj6jZxVb651Bl2Ox/VFBSw8bc0n2W1LvlJ74WA/rRYf9es9TID7l0J2vipKOVo5/BH4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760013687; c=relaxed/simple;
	bh=X1oa2Opgwt86ZgTlAHfUOPHzjmWzARhbTh2OGEMTJFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dr/NZD5DnzMuqwzgoHJuD3VjlBc38kw4xYiIJtQU4ux/EEQq8udC300neCULFZylpZxLyDO98V3Hs5fBmQT9zyroRNMRGS7MUqquMJt5QUt86sYJtylVevpk9sBKW6EuUeVMuChfepG82PvtqWmxA6+gLSI/NkDvlijr73BLOPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SSLn1sWS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EW9w022397
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 12:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZTbeb8JtSoGShn4747twCq9ITGkpUoqhfkcNYUr82qo=; b=SSLn1sWSmfpL2OgU
	0658n3ll29JfHEgDaZTbbF1a5zmen66CZ2rVGdfnBJ/kz9lMDcEMjX4ziuZjTUbi
	mL0XXowkItiB3TVJfzUPaOsQiAL/SRJ/qPt/ir3fOEBABQwLZv1ZSixeJwSxdfx0
	dqGijEtlLIFtNEm+kb4f1iMROLZ9Xs+hhr48FRLzLaA6FPC9CjBjdA3VS1Vy9hjc
	vRKDv0eSshuDhmKjeVafoSUZ6dnq8ZBIg5VAdcFtGEa633NQ7RtSC6CqqXlgBMcn
	5SnNXGs2bIapB52aAfzY4q0DLwFtc8UXVXg/a+dNT7RyIAsscqrocMpZf5w8NK3r
	8wlpVQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sjrw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 12:41:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4dee3f74920so2805811cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 05:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760013683; x=1760618483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTbeb8JtSoGShn4747twCq9ITGkpUoqhfkcNYUr82qo=;
        b=A3saQxqi1H6Ny8w/RmbWHEx7z6bRC4mdLPJMc9iA8IgV2vPrL8sMm0SdB/hbVIOIYU
         MtiGJTRGb/RqXgbcC9l1XdhbiGlTfdGCQ50jH0PxzeOJEx8Ax0xUhzC8vebAkTa4dZ0H
         qBNXpcGEN4lVxz4rM8mIZvtXdQE+Lblnv+nit6dQsSRnH+vw4sLDOaGHGOK0lSDKbvjM
         k1oZtfG+VqR1U7m2nvRGVxtRxH8I4j/R7SSxBpmk4GzZtT7FcCRkbKLqov880nacpDJP
         YrIRFEb9FbabaGjm0W5Fbyb+t4aWqr65+I6w11UgscmZuun4IALurWMWqI52AC1t4dGT
         4ZpQ==
X-Gm-Message-State: AOJu0Yx3jiR8A4m5fIa2wuLSr8yBAACrO8Ep2ZKLIcoyID7EmXygrCCN
	U+iDYmgaDhbCE8BLTsDkgM3854UQpM2Px4HygrIhh8Yrk2XiLyrQ5S6b6ulb1095Do7V4cGJYll
	Uri88TDWDFABKg2mlJDiBLfoPQPajQtBdP4QA8hY5TOT6G8pVj3VqklS+p37aErh2JX2pUWun+a
	we
X-Gm-Gg: ASbGncu9A95eMcgMXTRcQRlzT0ClOJ7093+AF8cYYuIjeUBOQMFFo25TESApj5AVJ4w
	snATeUjqfjhFn3+pu/kdBNi50eoe85uZCz3KRbXJCkgmDkyIGPsVxlfHsrtquNQED60xfxS+jHB
	QWQVd47lBJo3ohhAFaIUtj4Lp5xifEl17golC+CdFqP8NQznp80X1LctuN5UozCxycGruXsnLJf
	oc4o7v+m44x/h3tsOmCMJ30Dh0JIcMF6tqcbMyK8CDc82IWBCr2V8r6dLZYn0fRbg38KyxhBq/0
	394JprKlglfF7jtyATb/Bw5UIK4ZY/fhFujyKSSBohzRYp96bFknAGuPspBnad3Uz8bsmafLp3v
	emUlkVrVGSx7x45XBMmfR3viF6Uw=
X-Received: by 2002:a05:622a:14ce:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4e6ead2c674mr63640371cf.9.1760013683173;
        Thu, 09 Oct 2025 05:41:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8vZzBR/cCVwVs93I5MExBLM2zASHRyGAJj8t92r2vWzVp2okk/WgeWQ+4wqfpf0OQhTpPRA==
X-Received: by 2002:a05:622a:14ce:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4e6ead2c674mr63640071cf.9.1760013682606;
        Thu, 09 Oct 2025 05:41:22 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4c83adec08sm1189038366b.56.2025.10.09.05.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 05:41:22 -0700 (PDT)
Message-ID: <6ede6425-6b99-4505-a231-de819bab9ada@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 14:41:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: Add support for Huawei MateBook
 E 2019
To: Jingzhou Zhu <newwheatzjz@zohomail.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251008130052.11427-1-newwheatzjz@zohomail.com>
 <20251008130052.11427-3-newwheatzjz@zohomail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008130052.11427-3-newwheatzjz@zohomail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DjiFIyiDAnkTZaxd14qRNf3irexN8op9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX6CGTvt7vGILj
 ApcMZvhFzH4SMuIftQKaZAFrU3NdhcLUMMGDVZ+cZQQfrttNClshmNK/Nc98s/Jv7IuULb20H1g
 8JLYSur9zG8l7eN8ODTkOWmYo29lInJxB8Bcgn+uqs0tsAxUMwdkxqauPU4GdAQd/wdVtpUAJFn
 twrrdqKkiSAUWCNmFsq8LXzp5AY1CxR/Z2ns7pzUK6DmUGbZPRsvhdGwvBfcPbI9GBVKv3yj9mE
 mTEm+QMxfOXJfuPXoZZcMcgvpdwCeN11rVtTgi8WECD95AC1zQKRYiCxLUHCmh8sTsb9DBMEUzN
 R73RNLLIsnYU8edkRJdY80W+uK0hc7NOeNbc94TcaT1ivtbTopy9za93c0MH4Pyp+ztxfaiZ0Kf
 HyfpoqIwr+QoKsFljd1LBS5P205xng==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e7ad74 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=l4nIPSqNMi1mnKGloYcA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: DjiFIyiDAnkTZaxd14qRNf3irexN8op9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/8/25 3:00 PM, Jingzhou Zhu wrote:
> Add device tree for Huawei MateBook E 2019, which is a 2-in-1 tablet based
> on Qualcomm's sdm850 platform.
> 
> Supported features:
>  - ADSP, CDSP and SLPI
>  - Volume Key
>  - Power Key
>  - Tablet Mode Switching
>  - Display
>  - Touchscreen
>  - Stylus
>  - WiFi [1]
>  - Bluetooth [2]
>  - GPU
>  - USB
>  - Keyboard
>  - Touchpad
>  - UFS
>  - SD Card
>  - Audio (right internal mic and headphone mic not working)
>  - Mobile Network

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

