Return-Path: <linux-arm-msm+bounces-54775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B24B9A9402A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 01:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA5623AC2EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 23:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87269253F04;
	Fri, 18 Apr 2025 23:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAnD0l4J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5272528EA
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 23:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745017547; cv=none; b=sTZwxQfI8q3wscVSsK18K6c6nNiETubwxst2tfp2lk2P68KDTXzL/BXJ/r0seJ0XhPzhwt+3YiDUvrflQM5wx5XqdNIihj7ICD1yLc8/5WUg9FpZHtAt6sQFuzf0wND2vrqgBQxMVYRBnYTwAMjiEOFHZdivbBzr3hLRLZ5mbaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745017547; c=relaxed/simple;
	bh=hEJgUS8qfyBdIBBy1jMSOghOaaiuoTU40a3fcivZFtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0Gr/yxCbU9E9Ibqz5y0XhIC7VLwXuWqq+EDvOSZ2IiOvL/GI6OaZT7rqFgYxVTLJAnVA3G1+9Ta8CWn7lJzwh4JnF3lHCLJbwsrR/Bs6JWUMRTIJ+LzfbwfAsZBqIcVcETP5lMMPyjOhUbsWJVW/t8+RzOPTimL9RcdKSbIxpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAnD0l4J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IEJgP3001236
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 23:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V8QJgEdBBmdXG00IRKFSzJ2Q
	lscxaEHZ/g5OcrgAEXw=; b=hAnD0l4JvW6vvYR9/nEtwghNNnBudR/3MMl0Rv/s
	2sKLvJdo5E1i50B3jfKpUXyR8e3BguEcErmZ6xLmH2i3e3TuCw0+OBb35tcOpga6
	jPxc4vBDu3KwOib7IkIwbzh0WeggUVhTIoLVkBB5ngwpO1A/kLDJoSd7qilvqkoO
	EFEF4M1J6zXguFsaODwAXvewCm3Qf1g60AteSI6e3DwQ5syfyPOaDusv0TYN1rJr
	fa1eLuDvI5ghSGV/VfEVljreu4AQlCZ954gssG8q+VM25Faui6CQly6uSpuqlPac
	pQ1Y+p5rPc/0pgbT6/lBjFOihEuPH8jHAn+zRbF6qJe9WA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjkc2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 23:05:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f2b0a75decso59227356d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 16:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745017543; x=1745622343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8QJgEdBBmdXG00IRKFSzJ2QlscxaEHZ/g5OcrgAEXw=;
        b=A8XG83+YLmaFbhyJFXC3vC3Jtd9JFzMRzOoX9DVK7Zv2XH9FOQAVJOYD3vF6Y8UcbO
         1pziqQOsttHKNbCH2x8uBMGbBdQFr2Avsy3LotQk2VH7HnAfXWn7roEYzs0yHAE93gxa
         /HqVvmvE1QLvyw+ErX/aZqn6txe9NXxT0kqEohasHi+MJCyv6A26V8LWHOe4z1HldiwQ
         8dh9VpGd0XGPWJapPsVsiVVdwblX1Vgu8WQuX8tFC4Eq12MIeirPqmgo5YwC7uUp5aQS
         P46sy94Xo6wdqvT/eQ5Xmo1p9uRBIR8NnmX6nGyYbi/3+iMvgHtFVKK6A59v/D36o0P+
         dZBw==
X-Forwarded-Encrypted: i=1; AJvYcCVRIAeVDolr3qB57KMaU54rw7kdA8vDM710i5Wipa4XQ2xB6EE5IKnlX5ofdydbdp2QpQ9WJvwVq0JYBSE8@vger.kernel.org
X-Gm-Message-State: AOJu0YxsoUBR703B5qARA/Ec2AbqV/lbJT0+dBQxqph+Ky/gx2FR+nCj
	rEQkYiZCoFK73Uz7021nCT26FEt9OIdutnLL2Fw6h+qsQddIXxo6AuLp8iTmjfNas3zyAO86RQs
	PMq2yR4/+IDUQ4yi9j8o/sCi8UTZ3Xprj5m2b+JOIHFiy2Hd9ikZWtr6YhqCAxbAq
X-Gm-Gg: ASbGncskwN2/tmvcVma0negS/LHRJjyCr9BZAGSVNs2UQKiHXNinhPx0Nez1cAXGpCD
	ArJ0QL9fIX0kshIj0VoLvC2S3lHkf4DNP4s87kIOzLM14lEgBnWM/cUM3Dj0LlYNxz1e+9F9QvL
	BX7ZTbAc3qqKwR6VXDULz5PkaiqIAxV96zpKF5VZDnzdX8MqGc7GDG4g2F+tV5VCb4nX2Mj/Fhm
	KcgL8vBzh0ST7B3wMOrEu6AGA7TF0aQSGkUeNubV+t4CtvD0SVIRcgPb/fdD1ocDLvr3OiHuCvR
	v9kDpWnTGd+0uP22EIIVJ4G42tbKPQfQ/zW6LJKYg7TYCtTxDH1h4GxEtxVWPlqrIi7PcFNW4fw
	=
X-Received: by 2002:a05:6214:5185:b0:6d4:1ea3:981d with SMTP id 6a1803df08f44-6f2c4678a3amr65315656d6.43.1745017543568;
        Fri, 18 Apr 2025 16:05:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEf26KzMLQvj2MKIJpjhCLfMiXPBJMSzk9JeFklWtqtVydsNaw/jNQAzTgwl2B8HD3Bgw+5bQ==
X-Received: by 2002:a05:6214:5185:b0:6d4:1ea3:981d with SMTP id 6a1803df08f44-6f2c4678a3amr65315506d6.43.1745017543272;
        Fri, 18 Apr 2025 16:05:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907a6736sm3482341fa.51.2025.04.18.16.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 16:05:42 -0700 (PDT)
Date: Sat, 19 Apr 2025 02:05:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: add iris DT node
Message-ID: <asfwnyn5grm426vq5qatrxfffv3wmbuzx6266rblanzqepffzx@7773dcxfaqe4>
References: <20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org>
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=6802dac8 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=CGpxOeS8x3tCTpWUsd8A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3zCVRcbHwlBp-cx0OuoCH0veZGaNzmNl
X-Proofpoint-ORIG-GUID: 3zCVRcbHwlBp-cx0OuoCH0veZGaNzmNl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_09,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180176

On Fri, Apr 18, 2025 at 03:20:35PM +0200, Neil Armstrong wrote:
> Add DT entries for the sm8650 iris decoder.
> 
> Since the firmware is required to be signed, only enable
> on Qualcomm development boards where the firmware is
> available.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-hdk.dts |  5 ++
>  arch/arm64/boot/dts/qcom/sm8650-mtp.dts |  5 ++
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts |  5 ++

I'd say that these are 4 commits.

>  arch/arm64/boot/dts/qcom/sm8650.dtsi    | 94 +++++++++++++++++++++++++++++++++
>  4 files changed, 109 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> index d0912735b54e5090f9f213c2c9341e03effbbbff..69db971d9d2d32cdee7bb1c3093c7849b94798a0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> @@ -894,6 +894,11 @@ &ipa {
>  	status = "okay";
>  };
>  
> +&iris {
> +	firmware-name = "qcom/vpu/vpu33_p4.mbn";

You shouldn't need to specify this, it matches the default one.

> +	status = "okay";
> +};
> +
>  &gpu {
>  	status = "okay";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> index 76ef43c10f77d8329ccf0a05c9d590a46372315f..04108235d9bc6f977e9cf1b887b0c89537723387 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> @@ -585,6 +585,11 @@ vreg_l7n_3p3: ldo7 {
>  	};
>  };
>  
> +&iris {
> +	firmware-name = "qcom/vpu/vpu33_p4.mbn";
> +	status = "okay";
> +};
> +
>  &lpass_tlmm {
>  	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
>  		pins = "gpio21";
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> index 71033fba21b56bc63620dca3e453c14191739675..58bdc6619ac55eda122f3fe6e680e0e61967d019 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> @@ -824,6 +824,11 @@ &ipa {
>  	status = "okay";
>  };
>  
> +&iris {
> +	firmware-name = "qcom/vpu/vpu33_p4.mbn";
> +	status = "okay";
> +};
> +
>  &gpu {
>  	status = "okay";
>  

-- 
With best wishes
Dmitry

