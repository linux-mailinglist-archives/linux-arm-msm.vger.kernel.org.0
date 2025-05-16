Return-Path: <linux-arm-msm+bounces-58244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 588C4ABA580
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 23:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CD073A76AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 21:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0036528002D;
	Fri, 16 May 2025 21:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSr35TX2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F88120B7FE
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 21:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747431982; cv=none; b=Lwj4mV6TqazdPjh2bq4E4un1TIlEoSMxO7cEu+1QdAIjGYK7q0foHwjFWMm5OiiG8shFR+9bG+v7hASr4QaQ7WEZwhCk28kNan5pNH/GUPKDDlHjRHxoUwKs+HvRFJzV1XJtNM/AGmZVlSFT/GawNIVXVRyx+xJX/ja+RR81S0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747431982; c=relaxed/simple;
	bh=x1I+M96FVV0T2PrTxu+gkhm3WRV9mo0ojZ7qPCHoyq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKUkpqnR8i+Cx+HaafUO7BdJfX8YQfhyiXTkZrAE5zgyqq5HQaIcG1HqujOO0v1yDwEESN5qlLpHQ/UkAHNM1nzly5f/vMPOv6Q4wwm5M6GNI89Wk2YpiEm8lPN4BEk7SnVZwzxXjGqgAF95i/MQ+oh5x71m4rNXxbiWgn8zQPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSr35TX2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GCpmtP013922
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 21:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7UidEZPjEeJ9VoU45fGZNa28
	09KbmNCPYvA1jg+ao/A=; b=gSr35TX2DUCriTfVCEP/8y7/6vHFYfIckp3tU6x2
	8W1p6Q5adpuyAT90RMeneLN6sK+p8XjzueqLkxjviKFWn1pbhhy19cFDuz/zvK8j
	UUOyatHtaDybzJgfba49n24ExFzKT2bkM8r3f1319RhX5Z2iJ09ARkcQimn6vEtV
	EPo8zVx8XcQFr8ycGrarQqtzzNKn4gK9EiZOn/9Q630am0ebNnUhp9wXf0BYKxv9
	BDzG0sdWI+oxhN06fqGkEk9yvMnh131K5hpyEdDZAy/FBAv2/nwDYsmNqWDu6Gba
	uRZ/b0zCUg4ZBwALrltay44HBytj4EopWkJZ+86yuveRJw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46nx9jtpj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 21:46:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f6f2c41eddso55129966d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 14:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747431979; x=1748036779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UidEZPjEeJ9VoU45fGZNa2809KbmNCPYvA1jg+ao/A=;
        b=NwIXYv9d5gZeOAqvJTwIxuACKaEYORmcAKq50h7GFLYIXAA5OQWvBF+IACRZ1mspcu
         Toj/3oQMDt1MwEmuu9olCnlrViYvrV/hrYj/KkYFcA0A8krF40HNqBnJHiJIyBpal0Wx
         N9aVSdaBf6azEv+CUI581icabFIY/c/jR4YOAwD0dCOJpFWAZZl88H+1T053SNZ/2n0T
         jVy+9BqnGujULDBNwFwlPFQIjt+VD3AQjQBsRlqK3UF6ejGk7ZVBee153uORucYfuEd+
         RMsV9GWUhVSN3he5EGKs+EHWzaS1qjaOodbgQHq8+UAopbOgPKeHQt9XNRMh2bBMGwHK
         sOAg==
X-Forwarded-Encrypted: i=1; AJvYcCWW05QP/BIt0JEXkY/nW1QwgygHHnc2UGgHICN/rM6QVozCA//UznJyVGz4npFMeJFiAMCvCQZLvhuvwFLg@vger.kernel.org
X-Gm-Message-State: AOJu0YwtydeUZKtqWsN5HYM2Jcc+xpjBVAHP9Ds7zO24R6yTxfczJ6a6
	tniREN1ey7qIUXVQKDXlsQAH2cPXrU1vRNqG2xHrzu3kML5vRFHgMOlEK6LuRUBXidH2swByN7m
	ba6JHKiP5sM2UBWfzsLZTs4TfqfDc2QoOctvEiAKAhIQs2MUVUwzYTfH9DzLyvVlYt32x
X-Gm-Gg: ASbGncsbc1virM7IijyRpvCSyJNWJ1VfmBsP6A8RrMs4GE3zDAAUYVxVEuq85FrXNo+
	gTXWZZJjKvNcQmQ0IuMVO+6pzt+jBls+io+Dav1SvAxY5qvsFe5gqqKl3XYoI+I+fyicgOuFo3i
	wNkth69kDhC4qLlJCtec6fNJ4Qs6rjvxpJNsqPhLpEA9e62Eo7VoWxOLcXtc3vDQnteVYlt5dGY
	sF9auhcSdqjyYZ/Qm8W237dOX3t9kB+ACAgfNpnDdjCOrmD1M9je04geCShZVXqVgOTulmS2My+
	/fe7Odk6mMIxeMlSfokTy3sz+xqL5rShQbn5T2UPQqPU7XJhpcLiSIPpd0F5m3xR33gE9AXSGFY
	=
X-Received: by 2002:a05:6214:c61:b0:6f8:aec7:1cda with SMTP id 6a1803df08f44-6f8b0841c7amr69293676d6.17.1747431979114;
        Fri, 16 May 2025 14:46:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGojBHQjyJM43ToTT5NAh9CaVO/Niw4DHnezRiLcvv1wkMoOLml3xqYQOq2mXcSGzxB8vYymA==
X-Received: by 2002:a05:6214:c61:b0:6f8:aec7:1cda with SMTP id 6a1803df08f44-6f8b0841c7amr69293506d6.17.1747431978775;
        Fri, 16 May 2025 14:46:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f161ecsm598021e87.43.2025.05.16.14.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 14:46:17 -0700 (PDT)
Date: Sat, 17 May 2025 00:46:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8750: Add Soundwire nodes
Message-ID: <nr7sxs3bbacbrengxfnnmk2qpyajyazxkkzckcssm2ztbdsrdu@22w74cmrjf3r>
References: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
 <20250424-sm8750-audio-part-2-v1-1-50133a0ec35f@linaro.org>
 <e83b58ea-0124-4619-82a5-35134dc0a935@oss.qualcomm.com>
 <afda790f-0b5e-4569-a92b-904df936df85@linaro.org>
 <1a0be977-39b8-4089-a37e-dd378c03e476@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a0be977-39b8-4089-a37e-dd378c03e476@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7kXklbqwKwZhxedEy-tO1WXa-7S4xsq8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDIxMiBTYWx0ZWRfXxbT0N64quFjl
 vlHXXidiiGLFYtnM1FftZz9QKUjhvGGO70mHAlXAOPYFAWQDKKZ8PNWO/sSZ2jawRKA9I/1tvK6
 jH+Od2kfbNio+Lk7BzOWKWPrF61zwIvQK2O+MNWhWEXP/PLqKY+HFKGRhYW8zhF+KTvyLtzRMaz
 M87xpskIm1Rbli63UN/8V9ysZHRzcPeO77o5f+nAWWx31mCh3uMHjMOM0oaKQWlH+uFuw4ib25A
 /Y0pVneThLUUv53j5Ws+ddCM/NX//hDj4ZplDQPXjRw2vy9iwdBD3x9r9Pdnpgye9DQqlG/JGLj
 N1VIgeurg/EINjl4YBegm5brQE9fQRrid68ZJR7Feysuth1HeA2Mf/UtfzEq4SeWBVsyWz91IsD
 7z0gVG0bBPQWl/0LNOSgXuoyGT1pVDu4cpjjyptQNiF7fkIe6YhSmZOA+BChH08yDSyOm0s9
X-Authority-Analysis: v=2.4 cv=CIIqXQrD c=1 sm=1 tr=0 ts=6827b22c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=dQ_4xI23x1PVSAzVniEA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7kXklbqwKwZhxedEy-tO1WXa-7S4xsq8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=879 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160212

On Mon, May 12, 2025 at 09:38:01PM +0200, Konrad Dybcio wrote:
> On 5/8/25 12:37 PM, Krzysztof Kozlowski wrote:
> > On 25/04/2025 11:24, Konrad Dybcio wrote:
> >> On 4/24/25 11:40 AM, Krzysztof Kozlowski wrote:
> >>> Add Soundwire controllers on SM8750, fully compatible with earlier
> >>> SM8650 generation.
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 122 +++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 122 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >>> index 149d2ed17641a085d510f3a8eab5a96304787f0c..1e7aa25c675e76ce6aa571e04d7117b8c2ab25f8 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >>> @@ -2257,6 +2257,36 @@ lpass_wsa2macro: codec@6aa0000 {
> >>>  			#sound-dai-cells = <1>;
> >>>  		};
> >>>  
> >>> +		swr3: soundwire@6ab0000 {
> >>> +			compatible = "qcom,soundwire-v2.0.0";
> >>
> >> They're v2.1.0, same on 8650, there's a number of new registers
> > 
> > Sorry, but no. This the "generic" compatible and it is correct. Devices
> > expose versions, which is perfectly usable, thus changing compatible to
> > different one is not useful. We could go with soc specific compatibles
> > and new generic one, but what would that solve? This one is generic
> > enough - the device is compatible with v2.0.
> 
> Well, I'd expect a "2.1.0", "2.0.0" fallback there..

+1. I think there should be a version-specific entry in addition to the
fallback.

-- 
With best wishes
Dmitry

