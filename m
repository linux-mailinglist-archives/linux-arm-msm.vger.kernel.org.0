Return-Path: <linux-arm-msm+bounces-87104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D167CEBE94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 13:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B40893023558
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 12:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39A6321F3E;
	Wed, 31 Dec 2025 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D/uBJnT+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q47NQ4Ru"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102201EB5E1
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767182997; cv=none; b=Yb0eW4c8D48MqIw2fFjrzgny8onP6uxVOXTtLbtwMsD7/gneRlfo6twOBenpNmOD/cCPM31zPLVaYTDzwhU6ogddR1HKiS0XhK3nE7iJ84LG118Vk5NKjs3vLjyha0HX4Ix652TK6SlCDcSqaA3PIjTtNUbJN1qe3+0ymK5+pek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767182997; c=relaxed/simple;
	bh=sCKczhGejw5Oag+FXj0FW00PVZyNXveA4dF3esLudH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ne4LL6GyXZRO5CGiR1BP+ZWB5ZPBCyZGIHwatQD1xD7UiTKnHUh+eAO6w63vli71FXCpI9WFfZ253I0lrCPHgMXQyY9tDT0+2f8fxclXnFMNgrlcu11RbMEzg9MXBpHlTzxppBhcpGWmnTlks6j9O2bYVSxeurdy85O2u8se7o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D/uBJnT+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q47NQ4Ru; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUMP34v2980989
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IOnm9Ff2w1gpsH1R8vKSe+pdwXnYXE8q970eQ6bQ+7A=; b=D/uBJnT+MgFVzrOh
	VcyEuTJ9k3SW65QA/vYvh6jlMZ1FjiJe/chMPajG/6shTRTgPbshQfu6RMD5wH4Y
	kXCh+qVqe3g+qjiF6Y/7a5Mm1jBccR7uZQRDk59rfAbULFYkqUz61qOX24HryXHh
	ix9LHHOliWO+wm1uEYu8RRkTGHHkCAYLLSrOmueK8NGgH3hMkObkRTK+UaLi9gF5
	xAhapq4+qkL5AAmaOUCKOi5UBpTlG24GVzFWKyx1XvK90C+JV0XJDWYuexeOE14B
	Tjy7lh5ZJdKOEq1OTYooRqGU0B17yNgcwShCmiuNKeljUYJoKtTcLfiue1wcOM2U
	fUGfGQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky3dc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:09:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso27741571cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767182994; x=1767787794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IOnm9Ff2w1gpsH1R8vKSe+pdwXnYXE8q970eQ6bQ+7A=;
        b=Q47NQ4RuSPWBk3wzBvmA2T5CebiYPzpqg+pWdlyrYHbySrQ/RNFVYXzRRuTSLPplj2
         3FSiOLLP1bH71XOEgPc6XY3woMYiOj8tUB0ZUxJxHKROAArR0R99xRKyVJy/0h0Kl6iz
         NUSsl8aXzJm+3WQ35GPy2qG1LdKzDRrgz5X6f94DIm5dyXla5iLFt05GlJ1RHb7yabqT
         h4tD4VWpwIJEBHyYOOUt1OkY1KuK725siSttTOI985u4ZHORpduXTKQJub8ntisT+x3q
         j0j7exiu64bEBSg0vQ/d0rWU9KZr1MXCZYCQTTRkhOKX0MZdZkR+316kSnI56LM5qiOZ
         +Oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767182994; x=1767787794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOnm9Ff2w1gpsH1R8vKSe+pdwXnYXE8q970eQ6bQ+7A=;
        b=R3NtHQ8KBD7YmzRmhCiyIVzig52GaM2FMfK5iJo43VtVxfVzz1xGGB/y/dQGlKSwS4
         jTjas5LFpn6Cd4fIJp2og2A2qTnDorUTfUeUHJ0rHvz5A2c0va83P3yl2gdDk4aX6/fy
         wUASTnLACzleU94ETa+ljDKMd5sygqG8a88RDVO0ffMJEnrwb7OXEOYNESCBKPxgI0+t
         CmS6UxfsbmVZt1Xdib5pKarnhcvlSg0UWfLe/HrCpjjHdVEZBL7nrhrrPMU1uq9GAVb3
         QW0Aynwklf3PQCP6p/1T/t3tmSW8aIIVK+DpCOV+Me9ywa6LAV/cu5FXJNNu94W5JW1T
         kzKA==
X-Gm-Message-State: AOJu0Ywu5ufHFz/RKT+JL71uIl/dJUXHGnshhkhJqZu1YBFZyI3YhzPK
	7LoVIWQz8U0vfI3I3Zgv38BbrCPsVXZW5CqwPRmuf8jl3XQ6EqRyp9BLaUd3e7qygV9uOj/wW/R
	iqXt1a4X+arlP3XhwT2FElUJfyN9dPYBnZ3kVZvdR97ZK4iTPH4/vkhJNv2cforJzIph4
X-Gm-Gg: AY/fxX4aylccpnsZzzZnOGwAZiooXM5wa76b/lugEI7zouuDHnNbnSa2IBiZJDdkFoQ
	ydy33YZPBmgsbz6lXyJOFBbno8lJVYKKNcWytI5BhEH3fuEIZtDXtNSFwwju+f11Gbu/Cwzu2eU
	j2aCDJ9POWvAM/pE9Cr47xNgPd8X8Uka+AfHhzoTosTw1c4nHKRWAbtLbETfMxaZ+26rSYMJQOM
	7n2uMmqYYQzvlNGZMidPrC+wro9rlLPxPs5yy8C2FGdXgfYOI570kbNGyZqvwMpeI2VRKvNusxR
	wGOmyYgzbN7QOdZIg9R0i9HRndi42qox1Oicq9ItOR6B/TMj8zXhLAHpm22ilXkH+CUrEoJ1one
	YkST2pAepZbU7GTA0bXLAoM58yZvMe/HWIHBSJPAYrSAMZPN8MPi41mHb4G2V+UmqOg==
X-Received: by 2002:a05:622a:1646:b0:4f1:96c5:b592 with SMTP id d75a77b69052e-4f4abdfa25amr414239051cf.10.1767182993973;
        Wed, 31 Dec 2025 04:09:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFk5b3tqRN+mM2aHAUILacSKkmjbV8QkOEbDA4Iwmhx4ecguWLY9T4Kw+x6gPy1+6oUic5zVw==
X-Received: by 2002:a05:622a:1646:b0:4f1:96c5:b592 with SMTP id d75a77b69052e-4f4abdfa25amr414238771cf.10.1767182993598;
        Wed, 31 Dec 2025 04:09:53 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f09149sm3924692966b.47.2025.12.31.04.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:09:53 -0800 (PST)
Message-ID: <ab7d6780-4328-4c77-9133-402dd1c4fcaa@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:09:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] arm64: dts: qcom: sdm845-db845c: specify power for
 WiFi CH1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-8-1ff4d6028ad5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-8-1ff4d6028ad5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwNiBTYWx0ZWRfXxz4ULCoASA+u
 NaZWWhq0tnHqM5CM426Lxwu6v+k/wfeStob3nIGgXC5KXpbgT9xvgtqNAA3ANRNyvsWPvKEBdcH
 qL4c7D78mgZtXoD/tlQqPbHNnDRnPjOQDLCggvkjLKhTsLOmK8cAeiH8NNLwvoUqUYmWnBkv2A3
 5xTs7+w3LZsnWzMhSsnmIEVh4JLV7MNqCz8IAwJLcSzYsqYIsN9F26zTwCP33uk7xxx3TB3et2E
 NIbOwkyrFgswl46I3pz44DKlz1zMrjvkOJ8V528i8nF41c50cFltZW6blzBaef7xn+o+RKh/j2F
 L0guMRDQNi+UkKqpYSnRhOy0kxuRGh28Y6acc0RtFWFLOzbLhY47GXLz839KxbpHhin7Qk/La4O
 0VQn5xAgy9G/TyN9Q5177Ltg8iG+Yqkp5NVKTsDTh3xMazOSbQAbArnFp0a2d4wc19hmUnJtGVW
 pkKXQS0chsN6HlPQOXg==
X-Proofpoint-ORIG-GUID: QWBQUoNHmhXERgIUqRsupSNgSiuRYp1K
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=69551293 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DbB6eazJVb8MnLPbLtEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: QWBQUoNHmhXERgIUqRsupSNgSiuRYp1K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310106

On 12/31/25 12:35 AM, Dmitry Baryshkov wrote:
> Specify power supply for the second chain / antenna output of the
> onboard WiFi chip.
> 
> Fixes: 3f72e2d3e682 ("arm64: dts: qcom: Add Dragonboard 845c")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

I don't have schematics nearby, but jfyi downstream doesn't do that

>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index ad283a79bcdb..5118b776a9bb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -379,6 +379,12 @@ vreg_l21a_2p95: ldo21 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> +		vreg_l23a_3p3: ldo23 {
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3312000>;

Do we benefit from the 0.012V spread?

(i.e. is there anything else on this rail?)

Konrad

