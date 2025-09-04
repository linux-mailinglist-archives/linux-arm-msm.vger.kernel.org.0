Return-Path: <linux-arm-msm+bounces-72060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98487B43DE0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 15:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72EC1188FFCF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 13:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3443780B;
	Thu,  4 Sep 2025 13:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TD2e84ab"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC32B2EC54A
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 13:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756994306; cv=none; b=f8cWQMpz4/Lir7EYz16b//R/cTvqoHmh4JnxB2XwHjkADgwPISA0V0E95xQT0dfpTnqESfwA12UdUsNVxsOkfVTMpvdBBk9rKhn+hp/jbdES7VM9BxlWdyOnhCxL1Z/wg6WMayVrDS71Ykyy5YJK+XxNkoyh6uMQGoxqA2OgI8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756994306; c=relaxed/simple;
	bh=8pcinqgMIZxfWHXEht2qh36JiGk/vHy4x2DTtHokKs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lW72OLNG/0lSOWiAbG1aHSjWgqT7QrRCnFRjvKqIucpkcmMq8ZdfvX/W+bJWxLtsdq12k/J1oaV2DmfrFLsug6JOlKGbSXiMU9QDgFAAN8IcNHFmHi36NE5gUBbB/Dg35Y3o/kIHG8XU8oRJlsBHGn3PhgXOFV8rpg+tlYnK40I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TD2e84ab; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X88X002355
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 13:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lk8hEdBosykMJy5XLeywfmQ3
	hkUqyOwk4iBgoodWgA0=; b=TD2e84ab6Uy7j1qvU3KxN7qsmVRvPOwf5dSF4mJf
	95Pm0uyl6IhgpqZ/iX+vfEl+KPs9g9LeLabUNy07iyrHwhMeuHk50WyrmFkptf4p
	jJrZp36gzZmqQ0X1b9bFJ2qbOBSQtI8mAYDu4bxKDYqzs7ZRTevExLPRpLSFzkIC
	W2wAMczzc9vGAC2R18tY+/VHCiPcvlXGveMXNFLfO5sDR7DaEeHA6Rqvm35bTCQu
	yRBMEdy/5eBId3ScJj8H/ilW/GoyTl33gjVAp28bAf2WUrmX658kdoqimDcFlSYX
	aBEYD1Z+0oV0HESYDE+hTRkelNRjHwsejDc6sp5ntfEwsw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush37j8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 13:58:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b31ba1392fso25148311cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 06:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756994302; x=1757599102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lk8hEdBosykMJy5XLeywfmQ3hkUqyOwk4iBgoodWgA0=;
        b=ucRhhlMCQzGZ2Tm33VAmzDAKimaLFCgpfmef33/7UNKKjlaQkcmVUZ3YNVt8NSiCSC
         P8utYTY1ba3YxhRb5k61+XUjUbZ8/vzCUwtT71kDZcvnBVKD5CwwAUJ3eWajRjSg/SzG
         bW2keRlF4PEXFjoomuN3vXeMh4dpelXQa0Dy5VQbOpuFDaFwqXagHHMJFhKT5J3TdLom
         63TMAshyjup+YmVyfGDaCgtDV5A0UECezdxTTpcsHEFO9EtnU5Nw8cFY+r1F7oS/Ymit
         mg9KY2IiAgD0hMHNI9V6FAU7VV+r+I6g2VRix5rBAbdMj5D5ZJA5ABeCRNncEb4v8X5U
         R2jg==
X-Forwarded-Encrypted: i=1; AJvYcCV0ZBU3B6uuCMUeo4D3GyvuRX825FeGAkqS+f0iB0EaT1nPcl0o8vAlKdLn9gj/OG/wHJ9jUDgFmJgDbO4L@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5dUxljN2SQGI9QpAHGHN37yxsW226NR2Mk7CNF33OUwg0nH1L
	NHbms5WuCt5g50rvEV0nUMVoar3e7D1ycnnjiQkBzIUSu3XAFBxzdMf0PHyBQHTddw3olY1wZuv
	OR9WdUctCMG1lQMaGSNCbAGerhsQWtXFp5eDcDZ41eD3vd3Ham+vPBiJlqnBMPKJjSg39
X-Gm-Gg: ASbGncvSHqNNWf7F+oI0kr713BTEtcSOROgkmUdJ9kWIXuMu7LfMPTNfLLD/XL/96Hm
	fk3gd3+rhzdJkPokgrR1oFk7eje3UvLWJYc8klz2K98SUEFXIl0njcjuX1cbyoOHsIHg971BVe5
	JueobKKl+hfWtwPhmTftsAMKSqbJcd9xc9SBTcFwCoN3s6lfV6kMi9QqhACn4fzx1Y167y62Wcs
	mxmVl5gHV8O7OXwpKv4OzFv7lg1Vz13G3zHBoN/g26GC6hdHU7hBAMjeYnbG3X56wgfI0PRiaoz
	xNqfhnSbT9fl2DMmGXaOyCRlRd014B07cznj88UnV2orv1AueHjV7KDzfRz3npJFIyr7Rll/IIw
	Cd/5hyJVgxiWGwNg9gbl3JlWdu+gboJ5xz/E4TMTAYUUin4Lrivxb
X-Received: by 2002:ac8:59cd:0:b0:4b2:8ac4:ef4a with SMTP id d75a77b69052e-4b31dd2126dmr208884991cf.65.1756994302336;
        Thu, 04 Sep 2025 06:58:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOwIoZdKCnb8w1m3GAfoE0S6ahe48XHy+4go65RZaBELSpnCxA4DhortdmwPw0TwHA5cpPww==
X-Received: by 2002:ac8:59cd:0:b0:4b2:8ac4:ef4a with SMTP id d75a77b69052e-4b31dd2126dmr208884421cf.65.1756994301497;
        Thu, 04 Sep 2025 06:58:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c503edsm15199401fa.10.2025.09.04.06.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:58:20 -0700 (PDT)
Date: Thu, 4 Sep 2025 16:58:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/3] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
Message-ID: <eneg3nxaatpiqvujxnvfexwdgb7mufoi3qn6pjsxh42e4n3tqz@npvgjdh5cu5h>
References: <20250904-hamoa_initial-v9-0-d73213fa7542@oss.qualcomm.com>
 <20250904-hamoa_initial-v9-3-d73213fa7542@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904-hamoa_initial-v9-3-d73213fa7542@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX4ErqdQCwepFP
 cwDZZc+4vgD3205TD3DVXAXQuFLRgk163OzKrvL/3SFvX4CoD9pF3schWEvkcZZ0WXm76imXNCr
 SN718u3HYsoIaHjkOQxM2cTl11dU4KBnzthd0n8h0JNPW24dnOHfIBT/xeHIfva34j5HuGU/jam
 7NibUzPPZA00DOlGd36e80a+FHqGZfxRkRfLcs0CvvvCqBiNd4QQ8SerVOs7AntDQ7bji4MVmnm
 OFS93MH9DRYaei8gVG07Blk9W40iulrf+LT+jqcKOEivLdk5N+LrryMJJgdofj/DNhgTjcLJBFe
 jeKLidzW6c+31oWDXqDY19q+oLdMCG5NHnQGhjXe2p4gjLwC9UG33lIU8yTVdmRcjAsL6C8PeJe
 HKSN4pL9
X-Proofpoint-ORIG-GUID: IxAS8BYVwHM7ztaWtEMZDIaQa1vPbt9l
X-Proofpoint-GUID: IxAS8BYVwHM7ztaWtEMZDIaQa1vPbt9l
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b99b00 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=kMu10WXGbiujYwnt40gA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

On Thu, Sep 04, 2025 at 03:48:34PM +0800, Yijie Yang wrote:
> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
> the Hamoa IoT SoM and a carrier board. Together, they form a complete
> embedded system capable of booting to UART.
> 
> This change enables the following peripherals on the carrier board:
> - UART
> - On-board regulators
> - USB Type-C mux
> - Pinctrl
> - Embedded USB (EUSB) repeaters
> - NVMe
> - pmic-glink
> - USB DisplayPorts
> - Bluetooth

WiFi

> - Graphic
> - Audio
> 
> Written in collaboration with Quill Qi (Audio) <le.qi@oss.qualcomm.com>,
> Jie Zhang (Graphics) <quic_jiezh@quicinc.com>, Shuai Zhang (Bluetooth)
> <quic_shuaz@quicinc.com>, and Yongxing Mou (USB DisplayPorts)
> <quic_yongmou@quicinc.com>.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile          |    1 +
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1248 ++++++++++++++++++++++++++++
>  2 files changed, 1249 insertions(+)

> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
> +};

Why do we have DSPs in the SoM, while GPU is enabled only in the board
file?

> +

-- 
With best wishes
Dmitry

