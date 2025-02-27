Return-Path: <linux-arm-msm+bounces-49654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 492FFA47897
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 10:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41D0B3B1F1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 09:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60684227BB6;
	Thu, 27 Feb 2025 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mpsib+GG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C1E226533
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 09:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740647054; cv=none; b=WqOnwTDQHvnstM2XncioqTGED4w7iXRfW34xDpIz4A1q6OTE9MV+c5GxuAEFEA8F4PNFhuWPypDNZmCQi6jcS33V7hayJ0tedt94TkHx3oTb+kdABDg63lno5F4oZ7kJ9XIk6MKQ1lcAEBrFkGMdmg2yrTs25klLyNLbW7FD40o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740647054; c=relaxed/simple;
	bh=u42Ak1Pq8Y1bErL2ZVfxQnVap2YnXcFLZGDObYLYRiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lP/BIcven3z9Q5WHnFpwSbUw/NqkMBiJhSoTe+HQINr6wkGcKIk8V3gFO+dp8+sJTRyDVhFg4Zk4qnHWLZHrq0IoH/0VxW2Ta63Hk7N3RwqUw2cDfBS3I7xM7lSar+YflofKvvpmtNYbFTArz/9U2fnqe2hx6N2S8g6b3soISnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mpsib+GG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QLgpUK013437
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 09:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ISIpvDLr4nm46G4XgdEgTIb0RhLt9O3O1FoP7hEvHq4=; b=Mpsib+GGht62Gc7s
	n4NuZ3WOyVpgMdj6M+UTLJDKu880SS3jOBz0EIFOmxEOlE8qAfgfHWxYhkf3yd58
	u9kCWOJqEOfcnNcV7Qh+Yluv1LVg58aIPocqsZBGL04NdLumH81bDwM+LGfIBBg+
	DGdailFSJ1IctjUA54FPRsJEU9o+C6xpXl56PcSjJ8iTc5SMGAYNbwQOmRW//iU6
	bFBsEioWiFJfWe+IPtGSA/kBxPtS7rITJhYHcw5lBfk/d7/svqT9jeIr3TAsUfMf
	WkucAuUflQEe3ghGcyg8SO+W/sEAdKkdFlhTuTGVcY0bFYct4yN+8w9+vKGR1Axp
	FGhu/A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk50p2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 09:04:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c09e78ac63so22287085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 01:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740647051; x=1741251851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISIpvDLr4nm46G4XgdEgTIb0RhLt9O3O1FoP7hEvHq4=;
        b=iWL1RKPFZ2XUbaD78D81Go9ttutt6K5RGvFxfW+cYTWqTFzOZlwzZsoWOweA4SADcV
         EFFJnE4x3gqqw3Lf+3WprAgDWHqD+5/1dSce7zkvy8Mrl+KY9ovAz+UHgtJ6/lNPwXhQ
         97Mh3XHNLLaRQ1xvKr4NVuzl6G8c/YPd6eU2yYb+vFXyol6IVERqUWgj6k9LcjvE6o4O
         61NPOMvhamC1EmGwikC5UwtGaEjQ0cLfZ/HBIluRcsWDXWE0Nsq60Vh2ir170Q9AqneM
         3QEGPOLc3//DTPwAlqh0MKjAUA+ZGA/aFagX19Am81g+UMVhZ8mIYevUmuGn2WRNGDXK
         wSFA==
X-Gm-Message-State: AOJu0YxplPnbdLp6VoLYI2pdUqWPIod41I0nywa7tuYEiRlwFRG4qtLc
	qaNwwc292+sngzMNZfpdEpCyI+c+r/s7Uxy9BAh0sVA4BSS7iWgKD86pRBdZTSTWL2bo582Qhnk
	0KdBBskafuMGYACYhFmsuLk3lRW+vKczRqlnTDkq2gdrUaT70mVfNfx5b7TvRI+DT
X-Gm-Gg: ASbGnctdPp63tr63OQk6cXt88rIJDERqyQpmEP9JCri9SXLWx5jb0VmpKIeghpRNPUS
	XjXFZo9B8YgYfdLvgYYhhd7wjV9PKM/1xGDkLMVdeio85Z5A04ZpFxNRJLo0Nx90rteO5heAjaS
	d7qLEd5hfsu9pnQLY4hYFKSGR7RXmzsV8ozRtEb3GyuhDUmhkJNFOr03/eecjzG8+/9cU79ZMkc
	24862MT58L0+NCZxRk9wfzK0nOZCggfCExzDf75xZaiLZFrpybsqSwj7sLHh/YEEoLNYHYWpOh6
	dEfViyz6eRgxU1BzzgoFgPaStZ8weICUh3DJ+4ouN+nZ9wIK0pYhL0yEw3ajCum2+eps7w==
X-Received: by 2002:a05:622a:1a96:b0:472:147f:1dba with SMTP id d75a77b69052e-472228d5fdemr128421581cf.4.1740647050863;
        Thu, 27 Feb 2025 01:04:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFR+YpAMmMQyxSjZPXR+O/quj/d9e8NAkyiIF0cnW6DFrG6HqpBefPVaVbaehbYTKv4y3sMnw==
X-Received: by 2002:a05:622a:1a96:b0:472:147f:1dba with SMTP id d75a77b69052e-472228d5fdemr128421341cf.4.1740647050539;
        Thu, 27 Feb 2025 01:04:10 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c755c98sm89714266b.142.2025.02.27.01.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 01:04:10 -0800 (PST)
Message-ID: <1687d1fe-a9d2-436f-b219-6e7cb3d2414b@oss.qualcomm.com>
Date: Thu, 27 Feb 2025 10:04:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] ARM: dts: qcom: msm8960: Add tsens
To: Rudraksha Gupta <guptarud@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, wctrl@proton.me
References: <20250226-expressatt-tsens-v3-0-bbf898dbec52@gmail.com>
 <20250226-expressatt-tsens-v3-2-bbf898dbec52@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250226-expressatt-tsens-v3-2-bbf898dbec52@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zevSdgWDvuBVX2sNMwZyRUec6x9lvepF
X-Proofpoint-ORIG-GUID: zevSdgWDvuBVX2sNMwZyRUec6x9lvepF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=927 malwarescore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270068

On 27.02.2025 4:50 AM, Rudraksha Gupta wrote:
> Copy tsens node from apq8064 and adjust these values:
> - thermal-zones
>   - adjust thermal-sensors
>   - delete coefficients
>   - trips
>     - copy temperature and hystersis from downstream
>     - delete cpu_crit

Oh you most certainly want a critical trip point so that your device
doesn't become an oven.. I can't unfortunately find anything that would
definitely state what the max temperature is, but I guess that you
wouldn't want this thing heating up above 95C anyways, so we can take
a conservative (likely undervalued) guess like that.

> - qfprom
>   - adjust compatible
> - gcc
>   - add syscon to compatible
>   - tsens
>     - change qcom,sensors to 5
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

In your commit message, focus on what you're adding. The fact that you
copy it from somewhere else is secondary. Describe what (and why) you're
doing in this patch, and only briefly mention that it's based on another
piece.

Konrad

