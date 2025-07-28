Return-Path: <linux-arm-msm+bounces-66869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4707B13CC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 16:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62C7C1884360
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 14:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E44E26CE3E;
	Mon, 28 Jul 2025 14:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RH3MwOZd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396D726C3A7
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 14:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753711828; cv=none; b=gmp2BFI2kM92iOpS5i669zo9k01Y4U86DO8TFclZR2DxcGE40AeLRUKvgDKAjbJNLKMBSzGSfE/9YNjvCwJTEMjMpnAgKgZ6Fu9f7J+KxHQZBh+VQVmITxRzyYW0FHVMW0xbxieZDlapFQZi5mmur3TfGJr/gS0E7UpMoIXl9Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753711828; c=relaxed/simple;
	bh=8QWt017xkISsAk3LCIBNjlD5r69fSzYxEYbKfuENFFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RWAcIkOkC/qzOH0ZS4wb//xqK+/y/+VXBbjMig0gvgs9C6zsV7PGTbh8nBkQMVdevEPLc3yCrZniDUN5moAroL30Ysfh12qk4DqxlM/J6vuZ9BouvrVsDS4Gxsms/+hPjnbusqs9lbjFiqpocoZjxuRXLrOjdmOf0ePFbb0S8JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RH3MwOZd; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae3703c2a8bso934720366b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 07:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753711825; x=1754316625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g9JdoFB9stbK/NioU6pkTSDhv9DICLnnV4gmaBWeR9g=;
        b=RH3MwOZdFiMKMjOOi0PMYga09DUNVvtSFQfi35uL2Kh7amlQJM1InUPRmtsP6KmU4j
         jGtmfAhcGU9sRC31dT42wj+DasrUhxgnJUzbpdJNE6lENXli3lJDQ+N9NNNI24eiqOty
         IZ2HVnOm7/RiRincuISGf3LhKqTHaLMGyLZA6nAChTePPyclTz8uAlG9+dSxNdChx8Xi
         FtedShhRY4cvpS/fzFqtg1FlR+U+bNNO3dPkQkNTNEcLzaODwlSTZj2H5kPPzwi12hlP
         Z0OeYdqTCMgfR6MPldzL1DN41ZMddDtDbNkri6LeFoVxV/DsXhkexEWvxidal6Xh9n9c
         N7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753711825; x=1754316625;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9JdoFB9stbK/NioU6pkTSDhv9DICLnnV4gmaBWeR9g=;
        b=bea2Kbb3G6L9+YbIlPSxvcYhR7ro+N+OcYgMINsIHUdAcuVJVOIuC35saGqbJx1mYt
         OgSG7C+2kHbm3HZOyienRvNXa33LogemwCo6u+VzHtVv73mbcMNluQWO1iUzVCdAQqDl
         n46Z8IfPehYvfUtL1G75U44mSix6VY0st8j700N1v6c8hp0gE72QjpyJnVk1sL0OBJ7U
         oKId4jX4nl1WKZsOokc9w5elA6qNI2+VXzUCaea32CUiTdfzGA0DbTRr8M75CIVqanA+
         Kyw/+GaDALVbsoyIeWxwQPLsWmRDPTdux8VYhWFdXbNvedxImDKdK47FS1r4K0AlOOSo
         lg4w==
X-Forwarded-Encrypted: i=1; AJvYcCXfrarl1hr+3Ke3kClHxmNyuc98VDLFCFG7MYJc5BuvBVCzdmW8v3lELHzDioV/PPTtvTcwewAAcfvCibpU@vger.kernel.org
X-Gm-Message-State: AOJu0YxmXLUD6zQefmRGofeN4t7IUY8csXNlH3PjUH78NR6n+OrpXSeH
	rX/tRIrfukWC9EUM9KIXgWxybAqKI8CjxTv4BCBeCaO+VcnX+o4U4CLH/1YJZMtC0pw=
X-Gm-Gg: ASbGncu2EKyt8gfpMLecRJtuxTdu6XIg95J2Cp3mnvTpeIYDa0FgZxwfOefvMhdMY0h
	sGmNzbUcnTJeOeAkRTVn8xWtm+exR9OwVaQyABSffTSpNfbCXY1Xdl9HHws7pY3JYgwHrW1fDvB
	p0dKWMWK0f+q/CmFKUqSlSkKKh0fLkMCTnBlhR4yLtEuxkGpWP2mfO4YcBqrUG4BECM0BEcKwCm
	WwxovCZGgQwzG5sd0dHiHuhKrLlD0HuIUzhtsaNQ4rhP81x7MAYgzQFNVkt84NR7UmU1Lv92cjk
	IBkzHK4XyocvhHalgyVBYjk/W1dSK5Fos/KY9PekyHIPlnRqhgc2Ay73ikUFYBfaXZEwyGGyVoN
	wGbUTrNRDblqGLWlryP6yYRPaiQ0QKojl9rym63nItbJKk3gmdqg0Z7SeQC6HWYM=
X-Google-Smtp-Source: AGHT+IFw4HemneYmErhcNEVhL/wWhjoTApex97MjdvezqczWzvkDScv5n0Pf+ajLxJrV76XF66pw0A==
X-Received: by 2002:a17:907:c2a:b0:ae6:ae75:4ff6 with SMTP id a640c23a62f3a-af619aff29emr1265342966b.52.1753711825333;
        Mon, 28 Jul 2025 07:10:25 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635a669c8sm420485966b.72.2025.07.28.07.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 07:10:24 -0700 (PDT)
Message-ID: <5eba28a7-3d5a-4323-b74c-1bdbc738b9f4@linaro.org>
Date: Mon, 28 Jul 2025 15:10:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] media: qcom: camss: Enumerate resources for
 SA8775P
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
 <20250703171938.3606998-10-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250703171938.3606998-10-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2025 18:19, Vikram Sharma wrote:
> Enumerate csiphy, csid and vfe resources for SA8775P.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 3a11c0a98eb1..b6e80088d1df 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4185,7 +4185,14 @@ static const struct camss_resources msm8996_resources = {
>   static const struct camss_resources sa8775p_resources = {
>   	.version = CAMSS_8775P,
>   	.pd_name = "top",
> +	.csiphy_res = csiphy_res_8775p,
> +	.csid_res = csid_res_8775p,
> +	.csid_wrapper_res = &csid_wrapper_res_sa8775p,
> +	.vfe_res = vfe_res_8775p,
>   	.icc_res = icc_res_sa8775p,
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_8775p),
> +	.csid_num = ARRAY_SIZE(csid_res_8775p),
> +	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
>   	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
>   	.link_entities = camss_link_entities
>   };
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

