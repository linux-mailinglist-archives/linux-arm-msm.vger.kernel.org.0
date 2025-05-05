Return-Path: <linux-arm-msm+bounces-56771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C891AA9080
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 12:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97527188A373
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 10:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A4E1E5B7C;
	Mon,  5 May 2025 10:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pr5Ovneq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2051D63C6
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 10:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746439356; cv=none; b=hhm53JvImML6EbLHj5WxfEp122i8QRVxoWeJ+IpkV1znfXLHt0cJzpO978Dm5o8Z0RrGTMfQwcxIc2e+z5Yk1197V2PJio0xEBsvA3QCUErOGAq61b2hlaP6iS0JJU9p0CBseQ8ii4epkgrDyGcaTuw2gBsN3ieGVBED6820bjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746439356; c=relaxed/simple;
	bh=mxThnLi8OPPkVYNsFzOw8l6BCiHqLnhHqhkWRug5/jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THJze2Kt2G+7YNiHMuPpUQ/EemI24YBPObc9Ofes5Mjq2HBpk/N8HIRGH3+oK7v2PgMIx/9L7VofI/x0ZWlgBN0BtiSMH53mjV3CvGZKSMc2YLHOhorv5sUkC9nfs0KwTyOHxLGoQvB2uGD0wDUcuPAkFSzFYb9S4BEmK3D/aeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pr5Ovneq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Km04Q015107
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 10:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/9fYSq5DweCt0c/mKdUYu4zF
	2w/AfXBHNdWtUjJsnQE=; b=Pr5Ovneqtq/III50Kuv4i44I4PfmNM4qEPTCqgeW
	2MZSh/b5Mjc5oNqAzl10w9BJwm9CzrB/vf6fUEdCtZwD6RDJM1kyoLkcOVg8DdPJ
	O4oftrZklUGUjpBPguK9FBGPc824v543r30vi7PsGTamSJUsFpW04UDxIWO2CXoU
	CdcK8tWfAY8j5DHQsxxSihY10/MHpK8ylhfZcFDcrQ3maKfeIhxS6DUijW7EfmWX
	tAkWpT7Gxs2JzY2DkB6Maz3l92h1VIdbS7m11lMJ3hHXevr6hco7cKPEyT7uGtDh
	6cVgc3qHOSq5KITO2YSPaF5lWc7cZYZZUG1R0fvh1tfwmg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep3u8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 10:02:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c543ab40d3so86447885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 03:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746439352; x=1747044152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9fYSq5DweCt0c/mKdUYu4zF2w/AfXBHNdWtUjJsnQE=;
        b=aHwxN5skog+yn+BgrRQ+0bjoAmsQBuLFLnuhxOhIhoptZrJpd4T9L5AnTiQ3jZSDbn
         RlcA1R7IbN6KZcVOsD7znrrYmmmItBxbu7y67qgUnV+yAEOuXgln6WlybQjweR1psZtb
         k/+iSt604CXZf9L+ou5Hj/qolS7aZn2sdjSIfnf8PC76TC3+qvvE2x0EVnV1KOQEstcC
         co9uJv32ODHro+zRUeR8HDZrciQkzRlMLmHknpxiZ8jDCqmSA+CmqVlRewLnG3zNT3Da
         d53Dm1nHdPROH+ai/pnEIqcxIy4K1mm0MyfNnOZafq9qu2TlEDeUeMDwKRPQOrSkUiaV
         C87Q==
X-Gm-Message-State: AOJu0Yxu5oJQozJ9A+9Os9Z4sfzucTBMXy4R7ceRNBFrdn3/j5oYlqg7
	IkPgNzcUaSOErAUY5rf3qX42HOIUPhDYxMH0/5/VK463CJptNV1yv+S0ph9JzSGmaInGMaUbSjN
	TGix16VV+wYbCJGE/6A1jxM6HNnQI3a29QN3yRhppD51g8rEcdDmnKbeXrB81Vhrc
X-Gm-Gg: ASbGncuGnsdCWaMUFZYSp+oztmpCpJAU4Y+nMAu7g+L8Cyx6OAgKFtQFbII0sCNSOx1
	CEX0tYSDAom4V9giqSRqvBffYt8Ntbr5udPixtUwxjkzwcgEr7OMm/GAysgFKs/TOgJU3CDREnU
	pMZZdw4WbQS9Q1HCTelsfhgUImDX+YdK/RPSi5VSKpM5MSNkcsUnN9hAXq57aGluTos3g4nyeTh
	7Ql69kBwIopJcTxWGqdrw+KsAaBzG0fvxGvA26gO2gSNJumv3VgEIZ2qctJ47AjaVy1waoIjbVK
	ps7lT5wQUbqe7dhQPMHsgi7DbWk/1FPqu33Cc6w5UCN+WXYdlKi0axvjtevr0Xkyo7JfcYAC5Bg
	=
X-Received: by 2002:a05:620a:271a:b0:7c8:e67b:8076 with SMTP id af79cd13be357-7cadfed7d3amr1246673585a.50.1746439352347;
        Mon, 05 May 2025 03:02:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqWph76clESWo+RRt5n+cffHDapDxsmW2FMxzwgdEB/oc5DR9lfIjFKZY2YWluhdW3xKhUNA==
X-Received: by 2002:a05:620a:271a:b0:7c8:e67b:8076 with SMTP id af79cd13be357-7cadfed7d3amr1246669085a.50.1746439351979;
        Mon, 05 May 2025 03:02:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202b18e4aesm16561471fa.113.2025.05.05.03.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 03:02:31 -0700 (PDT)
Date: Mon, 5 May 2025 13:02:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <grwlmrgi5cfv3jtuki57ug7gsqykpwdf2to2l7di6glfxtb7vz@6id6cpfkrbuh>
References: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
 <20250505094245.2660750-3-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505094245.2660750-3-quic_amakhija@quicinc.com>
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=68188cb9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=NFKUjzz3svuqp3DBVBsA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pIQ9Vbqhv6xC-avyLNKi1G0v0pe2GDfS
X-Proofpoint-GUID: pIQ9Vbqhv6xC-avyLNKi1G0v0pe2GDfS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA5NCBTYWx0ZWRfX6WbxvM6jOi4y
 L1jeRB1E6vMnd+vOUbNgZfJU74eZ5OxI7kS6egUl0RJwF2ZfHBjPwL/rido3Y3oLB4+qF4yG+Kv
 uqZbIU2aKx64beWpS0Dpp9EfWjmAiEBLja0Ug1cp0fmvUrwNyWwO+M9ly593nDVN/+WITgJV+GO
 eCCHCbMXrsNiAWxuSc+CdRRSYcVeVNBqEtJnBz34xJ81gq+iVItZ6AUQglCaBFKxfN7yBwfIpzI
 HCURsZxPSqiL+YRoop29bpzq6mEWSLQ2UxBKVpwsCNSJ3Unpu+JgcpOa2fDsqN3c7WZqckeTxXQ
 uBNVo8mvHohvwskhxtVQi1uIoRfbhn7uHXS/rPb2ajt9sgh9eCsmc7+5VLgkbuO75lvMeNy4URu
 x+6NsR91SQiA8Y/0As+bnrU3hxFshDEcB5Rp/WyYnLaSgIwiGG9E0943XAlSXwCNpO1EEh/q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050094

On Mon, May 05, 2025 at 03:12:41PM +0530, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 183 +++++++++++++++++++++
>  1 file changed, 183 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 175f8b1e3b2d..de14f3ea8835 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -28,6 +28,15 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;

12 V, if my eyes don't deceive me.

> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +

[...]

> +
> +			bridge@58 {
> +				compatible = "analogix,anx7625";
> +				reg = <0x58>;
> +				interrupts-extended = <&io_expander 2 IRQ_TYPE_EDGE_FALLING>;
> +				enable-gpios = <&io_expander 1 GPIO_ACTIVE_HIGH>;
> +				reset-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
> +				vdd10-supply = <&vph_pwr>;
> +				vdd18-supply = <&vph_pwr>;
> +				vdd33-supply = <&vph_pwr>;

Here you are saying that 1.0V, 1.8V and 3.3V pins are powered on by 12V
supply. I wonder how the board doesn't trigger all fire alarms in the
building.

> +

-- 
With best wishes
Dmitry

