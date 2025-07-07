Return-Path: <linux-arm-msm+bounces-63930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3B4AFB46C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 15:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7425E1AA4EBB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 13:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62F229C346;
	Mon,  7 Jul 2025 13:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gevcj9V9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59BF296142
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 13:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751894613; cv=none; b=N3FMVGuZjzvnmSZPm9WdzjumpupV5Yv7f5jY+2Spuqm7Y0O/J+RaYE0GzZ15KPRsHaF3edCzBxQuvxLPc/SlQ3s/4Vlv7eUtaynVVzF2p8wYVHQ5YhU4uRavJXcrB9EBUXLz0LVToN4z9GtwqeQwFNqA7+x8E64cUuxLYb4tRJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751894613; c=relaxed/simple;
	bh=9XfDpieyU8b2140bQho6t1DhMkVdpW1ldUV4ZihuTTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WP1gLF7Som3IKjqKNZn2wsnSFL0LGh2nTMZ5uO2Q59N/yJlHj7UMMcbuJMkz5ibqyvIBZnQSqdRdhIfef1CDUL/7vdq58BWkczIQ4p4cyC655Iq/ecDL4/z25mDSx5YLPo7gHc6fQ4XRkhVKsHufdY39SQ/akizIo8DbqEoYc04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gevcj9V9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4f379662cso2798872f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 06:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751894610; x=1752499410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A1JkCspwJaFqJzSejsi2dTXNLAQ9s3FaAdM20lcOhVo=;
        b=Gevcj9V9EMw7bXaPKvYUKkie88kBByVNXW+lKU1EXPEP7LZnEfQUV3cn8x58bQVVwi
         DgvPnSK4Ricdtz+otQKqZyLyJ5TkD/C1qTC3MpneMBtyg2nhIg07TkqqxsG8eOLi9h/D
         nTQf2/HI/huOU+tN1ZB3FXviCoSl//+xlUS+96oCVHelxXpJE76qCWXJP7zxmA1Mzp2f
         dPjFXQJAWLFBcoWMt0XFh3iXIC+jYPUmceClcCnKCf79zK6AL36Sb8fUFUVQowvTuKu1
         akNZ5I/q+bfK3Vl+ju0teTttgLIrwM5838oQPUPhCAIxx8Y8ej81BimX9aQPl8nS8fnc
         Cf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751894610; x=1752499410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A1JkCspwJaFqJzSejsi2dTXNLAQ9s3FaAdM20lcOhVo=;
        b=qxn5xP85/7eqX7z1SYuoMnC4cgukBJI99BeJYIxpdhcd/WevJx2ylZE/q7ZqtooO3G
         Rlfwmvv20VX0SA/yVtxFd3lU8R2O6mdXPUISGAIAZo21PKzATpyxXzmJ4atK3vGEFDHr
         vriYssvvIlw6FvDzb8CAPXLBUhLAegYorISfcyB6+7J4py7h/X9MoyNyli8KuA1WJb36
         5lIhc4I3kkG3WYXMKFj0ebYML2k06Qt0k/nOK0q1gy6ry9igD4ZyRN+TkNUu3p17iWOn
         HbYGyNanGxLCv8Ro/eEWPsYf7mwuI/rvDDTbWQIoj7AJGesOSW8QkOdcRx8uLp0E45mj
         Q3IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv0dIIp/VSNUOOFBkfOdA34MgyPbd/BBPckaJojHc1k8keoWUiiJHRKb/QkiN55ld1O35nLlYoAd94xF1S@vger.kernel.org
X-Gm-Message-State: AOJu0YxqEDAgP9GuYmCN6xM29+Cv2eWCpO5d13Zhp+4aHpVDGr7ibpHu
	k+ie3T9mpfWZf7qIzaM2oISosiGe2SYuyNMj5Qasp6w9UwUX77QRGIxQGVoWuYp6PEI=
X-Gm-Gg: ASbGnctcNUGt7IvApqLfaH0fcTuDatrKd/OPaOe49qjMilqVIqaGwbRE3p9/uH9k3YM
	bblLJdrpfc8P8pXC5E0JPFwWJj0AfyoEaz+TmEgFtc3SLmbyT1e8QQ77wTO/VBw2l5JzYrdvqKv
	MKCNs4maNWKjn6UANTK6Xxv0EL7XhBNo9jWt574+V7TAZiZCKo9p7vEzwlnFx0gObEKNmNyjlRg
	frS5ifDb2o77y+gvds9h5FiDI5JI1Ow7+fXmc4Mxk9K/t/HcEoI6+ziXv7jN9xqiH/LaS3AH4dg
	G1Et78B3VdYTqkhxRguy4GsX47mapUMSxEHusz4/0KcsbP18NPA1hqnM6ZmZywApYvWLznFHfTU
	6t/gz3xCcytbNPbWbe2OyB2KalN2Idn8=
X-Google-Smtp-Source: AGHT+IHqvfoZlxqkZhFZeUbrhKra+ACvfYiFm+JNhrK5L5id15gKmlIVnrRthZyMexYFNceXyA6Kmg==
X-Received: by 2002:a5d:59c4:0:b0:3a3:6595:9209 with SMTP id ffacd0b85a97d-3b4970294afmr9707717f8f.36.1751894610045;
        Mon, 07 Jul 2025 06:23:30 -0700 (PDT)
Received: from [192.168.1.159] (p4fc3d4fa.dip0.t-ipconnect.de. [79.195.212.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9be0bacsm138744515e9.32.2025.07.07.06.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 06:23:29 -0700 (PDT)
Message-ID: <06760125-4800-4068-8936-dddf27c28d17@linaro.org>
Date: Mon, 7 Jul 2025 15:23:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pmdomain: qcom: rpmhpd: Add Milos power domains
To: Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250707-sm7635-rpmhpd-v2-0-b4aa37acb065@fairphone.com>
 <20250707-sm7635-rpmhpd-v2-2-b4aa37acb065@fairphone.com>
Content-Language: en-US
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20250707-sm7635-rpmhpd-v2-2-b4aa37acb065@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/7/25 12:18, Luca Weiss wrote:
> Add the power domains exposed by RPMH in the Qualcomm Milos platform.

\o/ codenames!

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   drivers/pmdomain/qcom/rpmhpd.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
> index 078323b85b5648e33dd89e08cf31bdc5ab76d553..e09552a469264f28952fc46c3ab8c125e87310da 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -217,6 +217,24 @@ static struct rpmhpd gmxc = {
>   	.res_name = "gmxc.lvl",
>   };
>   
> +/* Milos RPMH powerdomains */

I can't find any public docs telling us which SoC is Milos (the only 
relevant result is Bjorn's email asking you to use that name instead of 
SM7635). So for the sake of future generations could you reference both 
names in a comment somewhere? Or even the commit message would be enough 
tbh.

Off-topic here, but maybe it would be a good idea to add some Qualcomm 
platform docs to the kernel with a table of all the publicly known names 
for each SoC? This would also be really helpful even ignoring codenames 
just to know that SM8550 is Snapdragon 8 Gen 2 for example.

Kind regards,
Casey (she/they)

> +static struct rpmhpd *milos_rpmhpds[] = {
> +	[RPMHPD_CX] = &cx,
> +	[RPMHPD_CX_AO] = &cx_ao,
> +	[RPMHPD_EBI] = &ebi,
> +	[RPMHPD_GFX] = &gfx,
> +	[RPMHPD_LCX] = &lcx,
> +	[RPMHPD_LMX] = &lmx,
> +	[RPMHPD_MSS] = &mss,
> +	[RPMHPD_MX] = &mx,
> +	[RPMHPD_MX_AO] = &mx_ao,
> +};
> +
> +static const struct rpmhpd_desc milos_desc = {
> +	.rpmhpds = milos_rpmhpds,
> +	.num_pds = ARRAY_SIZE(milos_rpmhpds),
> +};
> +
>   /* SA8540P RPMH powerdomains */
>   static struct rpmhpd *sa8540p_rpmhpds[] = {
>   	[SC8280XP_CX] = &cx,
> @@ -723,6 +741,7 @@ static const struct rpmhpd_desc qcs615_desc = {
>   };
>   
>   static const struct of_device_id rpmhpd_match_table[] = {
> +	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
>   	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },
>   	{ .compatible = "qcom,qcs8300-rpmhpd", .data = &qcs8300_desc },
>   	{ .compatible = "qcom,qdu1000-rpmhpd", .data = &qdu1000_desc },
> 

