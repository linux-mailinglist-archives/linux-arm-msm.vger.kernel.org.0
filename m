Return-Path: <linux-arm-msm+bounces-86082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80549CD47D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 01:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 883843005191
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 00:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354502745E;
	Mon, 22 Dec 2025 00:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pd+578YB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aa9pymwp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEBCD27E
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766363566; cv=none; b=JcWSdURK3OakSAhXDW6yxKkkTRDQchgDbWVubM3dlOFzPENUD9tkvpe0JLq8i3JIuvTnq7xKBucFukFfNXjQ19wzLYjPpuXQOPQWrzGVhychLtR8a3K1QTu58VvPXzmglhpCUBzqZXJvaGJj9YLOT64uKMUNw/1uGfro9B56IUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766363566; c=relaxed/simple;
	bh=/P1Ss9K6KnLFAVUf7uen3EDlmfjoh/ntTo6JdjeeED8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSZszWJy52AYYe0gOmahp8YoxTf0ni4XYuTPxekZc2KIDjKw0HSkOFM68XcFcCCWMJGHAX3Idl2C24qaCpbW32AvCmzlCEFAdrjITlH8EeJGQ2ftaQWAqpsat6QKBgNxty0Abwdg2xEoutjuT67Xw5GbAzZOOYAr+nKNmlgWGmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pd+578YB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aa9pymwp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLMiccU4091253
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z1su2xa5xf/fsB56X3nSG3yw
	37f1nbHEaamUZrUxtuY=; b=pd+578YBRv5/JUYBldQRdmnzx7CTNlfJuEmpsIqo
	ifkSPDiGYeXrCRQlOuirczrSHlEhImsRlPNAuEW3Xz1aNVRCeQ5x7vGuCukTUEwR
	vmq56vR8IRcFsoCa3Wh/Yl4ssZz2udvGvXlS8UhYN/X7AQ60g7tuNiOKR7g78/0h
	CXe3CHpyWxkIjyFbwaTHBpQyXuoWF5HyWwddO1yH2COl935LXqNpck+wq8q5q5iJ
	NfiofqPgJXSV5TQOhWYjg3+fiRVrZoKAodOAZkMx7jGDDNC5O+jKqpwn2a4R/PIH
	hoAvYTwL7F9Sa+WU8E7Avs5ZjevyeC8hggDKPex7lXj5ww==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux330c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:32:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee3dfe072dso91896901cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 16:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766363562; x=1766968362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1su2xa5xf/fsB56X3nSG3yw37f1nbHEaamUZrUxtuY=;
        b=aa9pymwpka2KYFErwXCE5v1dhsASpBALHfBiXq/927VU/Yo2UGPmMmyXPs/wrR8OcJ
         MUuaQuxTCkh0C07GIt3oU6ET9YfZhS1bjgTbhFQxqMIBZ+qVLE6MdhUAaNLn0yfmA3oT
         oAbOWCwjTN93ChYFrUbG9rpIjLyED+UiE0zoh+DfzZZmw7toi0b1Q0fcfC79thnv9tVl
         GRF9sAAiqJS5Tao/I/zBE2ZXrIoKGn1l0InnJr6ZpAgZH9AYL3tzmfnYF2ia8sLHf3C2
         8jJo7L3AOpyN2UXKkZr6oFwUHAUjiGJoeDuVGX83PfWO4clrqZ6dAmCblO4dkVT7MvuT
         pfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766363562; x=1766968362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1su2xa5xf/fsB56X3nSG3yw37f1nbHEaamUZrUxtuY=;
        b=iAX1aPIJfg+Es53ue67FfoIp5wC9lKjDy5aFR3JP4hFmlTBjGBqn1NwFJo8TLOEby9
         s9NYgPC5C2iDUXWF6qfQRtxOcPErcGU8sf4dVBcBkZt4AGyzG772IqSfNPL8a56wk+Q/
         YD1+L/2HbdZ4NrHcm0koe5eZ08Vs5HlLDUs8slzhsh5TxbuZRGEvLFb/gxpdS1yrf8Om
         2jlv9F0KnxKR9lWgzYWrXoEDmsPwYs0DX9qqbFv3ePyMguVjysbwhnHbHrC+fLJPbYnW
         KlWRBv4khM2Y+zvD/oT/dZeMCbZzKYEz4IHIvQp3MgZiK9INPk0V0vjDEUMDtYDKXt8l
         /fbg==
X-Forwarded-Encrypted: i=1; AJvYcCVbHs9B0S51Mf/SeUKGZXNvTk2w5DUQXB3yWlHZwZo/88ee723voJCEMS7lIjAtcGjzUOlmnrtNX4cmlUgg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+4uKD6JNB+frJo267uT7csZZ+bixHn5txcL/RIuUWydd1EKz/
	QOHxNAnuziaki7Y1YdfwhvVZgKp9Q23jj8EeDbx2LLFPWyIzyMAC1UCUJaHMEBSJlQ5PD6p4x2M
	Rb3+VGnpB5d1/n4KkTuQWKziiS68c8jLbl1bf3Fw697+cJ+Lti4OCsmiKXz6CbGxnTC2k
X-Gm-Gg: AY/fxX7z4kcg6k1uJ/F6hYtBsAX8pbjYm1c8fhMe14CaQzQqSkDLhpzyD4dXeI52Jia
	hcGucUql9gx1w1HRnoO6Uc9jV9XsuMtuo0W+saVHZMu0+v0vk9MXA/4EmKWXmb2yJWy9v6s/u2s
	zcedKoIY/bQvrp2kMT2+lbFa4rM3Yq2JYw0FQL8h/iafzPEI3WXxnKZcPHFqmsFEv1qef0WNZQ8
	IwQDtmWy0jsAN/0b/Uq6Nsecmnc4/5n2NHTmFVhKWOx2kZsMarFmI5fRa25mhzi6IIxZ43wOtmC
	OrJhW2ZeHvuWUkpSq2fO6S4XXBD54S0cAc9JxfTfetPh7LtIsZQD0O9YcIa9jrma8DJtrsvvgph
	wvaUgXmeY+c77Y72vDhm9U1YUw7tTGwk0t+nNdzyZCj3pEpucwDsEw7hYAsJUzfC0dVg9NC8TxE
	WMz2WmsT+7VmPSIJj/f4T3xwo=
X-Received: by 2002:a05:622a:4017:b0:4ed:6e70:1ac4 with SMTP id d75a77b69052e-4f4abd797e6mr143160061cf.42.1766363561798;
        Sun, 21 Dec 2025 16:32:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8L9/ZhmTLolvhHCyRbDif98BMnmObLNsixcJdDC+x1mplVZz0L9G/hiRCGw7dTV3xG8H3SQ==
X-Received: by 2002:a05:622a:4017:b0:4ed:6e70:1ac4 with SMTP id d75a77b69052e-4f4abd797e6mr143159831cf.42.1766363561298;
        Sun, 21 Dec 2025 16:32:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381224de35bsm21998551fa.7.2025.12.21.16.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 16:32:40 -0800 (PST)
Date: Mon, 22 Dec 2025 02:32:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Georg Gottleuber <ggo@tuxedocomputers.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>, stefan.schmidt@linaro.org,
        stephan.gerhold@linaro.org, wse@tuxedocomputers.com, cs@tuxedo.de
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: Add dts for Medion SPRCHRGD 14
 S1
Message-ID: <b2ofd5pxifqhznqo25byc5jksneeasy2zlli5jpqezllj2ja4j@tscydfwesmk5>
References: <20251204155212.230058-1-ggo@tuxedocomputers.com>
 <20251204155212.230058-6-ggo@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204155212.230058-6-ggo@tuxedocomputers.com>
X-Proofpoint-ORIG-GUID: SrEr03fYIA-ZCZndy8OEiDS8WrSFreKy
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=694891aa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=yDUiu3_GAAAA:8 a=9wNOON5vNfT10lXOXtgA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
 a=gafEeHOdjwYkg5oUpzAY:22
X-Proofpoint-GUID: SrEr03fYIA-ZCZndy8OEiDS8WrSFreKy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDAwMyBTYWx0ZWRfX7uQnTtt1PXLa
 ga7n9JRx2CC936O92Y3959YNRRwd/211G/DGWkiPTP6O+Uzk9awgEefcVn2XgxyI7aKPjkvBDUD
 6OgR8F6M+wB6YiJQTkXzgVrhr95Oc/OYVxh83S7y7AxEyTbv9bpTa3voPzQpYCHOThvzWZdOSIJ
 w5zAFRHFH0zhLuq5oHOpxmr3zJ1LZyvtDtO/YtLi3ZLeAklsXCS36UZ1Q9Eoq3nbIaz99PjUVfg
 pBtWgqdmVhoBvP37q6kI/8d6RtrDrqrfn/GRXW6YK4feX5Jekt/hclX1NkeHJVeieuekTuwiICk
 cLUHEi7p9Z0+JVnj7wSM4xtF582LmzG6lQLgH6veGbhUoU/UODmp8PwdE4GDr1pI2FcmN5PjyEV
 hDUoeYotUTWJKf3g+y5Gbc1ZM3MCLYfiZ7e99Ka89tP8bbO++GpCIiyP3GO7IrBaYpkmeAN4wbQ
 oGkVd2a8mflJTTBvmQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220003

On Thu, Dec 04, 2025 at 04:52:07PM +0100, Georg Gottleuber wrote:
> Initial support for the Medion SPRCHRGD 14 S1, which is based on the
> Qualcomm Snapdragon X Elite SoC (X1E78100).
> 
> Working:
> * Touchpad
> * Keyboard
> * eDP
> * NVMe
> * USB Type-C port
> * USB-C DP altmode
> * HDMI-A port
> * WiFi
> * Bluetooth
> * GPU
> * Video decoding
> * USB Type-A
> * Audio, speakers, microphones
>         - 4x speakers.
>         - 2x dmic
>         - headset
> * Camera
> * Fingerprint reader
> 
> Co-developed-by: Srinivas Kandagatla <srini@kernel.org>
> Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
> Co-developed-by: Ettore Chimenti <ettore.chimenti@linaro.org>
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
> Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    2 +
>  .../qcom/x1e80100-medion-sprchrgd-14-s1.dts   | 1515 +++++++++++++++++
>  2 files changed, 1517 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts

> +
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		firmware-name = "qcom/x1e80100/medion/qcdxkmsuc8380.mbn";

Please use the `qcom/SoC/Vendor/Device` path for the firmware. In your
case it should be:

		firmware-name = "qcom/x1e80100/Medion/sprchrgd-14-s1/qcdxkmsuc8380.mbn";


-- 
With best wishes
Dmitry

