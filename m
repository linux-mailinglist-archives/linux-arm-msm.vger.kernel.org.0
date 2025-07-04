Return-Path: <linux-arm-msm+bounces-63718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2524CAF96B5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 17:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 760DD581AFE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 15:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A369289E16;
	Fri,  4 Jul 2025 15:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xvethSmZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F0629B790
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 15:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642704; cv=none; b=OwrQQe920p8zodyD7Vrgoat/TTlwcB/Gg10DYM4QrDHsejcKmCgcOMYUG4h8rL7saRtNKiDckGojRh3//f1ZV1DTFvgZtW81BwOnOPDL0Piqk97u2iUzKnBZ2LN37/up+F6kDs7ysBZYTWwyw342eLg4syK3+DTGSMCk85E0WMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642704; c=relaxed/simple;
	bh=4+t9XeVok2CNNwq8+4fTqhuZ5vwv/14UGzpJiaIIxL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h2xAU6x1GvojSxQ2WdyXPux4RQLq/DGCH43UnNxDQFJnLRFgMrGY59dDpzxqj1xpDN2Ui3SeLIvN3PnfvnpVOrByH+BXjPugtMTkKSgqqxfhNhdqQIT3/4KX+FZuC4tS/jzzRfwQg1b4XUlULa/O3Dfd99t8xw++ZO8MdJYDpVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xvethSmZ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso483961f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 08:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751642700; x=1752247500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ex3KxNtMtSZ/VdrbXkChoGhTiQNqhVU1db+WMbI9p8M=;
        b=xvethSmZlvBbj0Iwf55DsEOkXGJYBKk7O2C4xgcbOSZMXTF7dIZ8LiRiSpY3thzJfB
         UyNP4JS/UP3eyGfZRiFrDIInMzkChkFrAMowEx7QIc02mwUGqdX0PL5KwPSUjipRO5N2
         RXZeU5+1dqHGfy+b+klDvS5oxGXJQnd9Ww6e0S8rZ3FzwjW9PT9Cj4kEZQPobZrva1In
         cLQTLBG1kQy+6aPEKeXxOO40N+5tNScJJ20L3b/jEOak12iOKl3AaLP0EraIWrwmWHTz
         2lgapNFX2YorJjn5Z2HnF7TJXwwmm2j35UnWIXOrEjOonleVZduu5O6w2RsCoqRxAehX
         L5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642700; x=1752247500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ex3KxNtMtSZ/VdrbXkChoGhTiQNqhVU1db+WMbI9p8M=;
        b=Jp20TqKODYupXHJG69XwFQ+Ykcz3Z64rRd9KMN+R2BWydx7R4YuqKXRHRIAg9CC91R
         Mswc48KQY9iab83ncsEXeym7BGL6YeNk4pFfvPhULXWs86sbHc8UYZ7a0wl5rPiHup0C
         lYnGlWk5LE6bPj8YsQkvqkIlBANYxsPTMoQmdVkUZl4Qw3PJJpuVQWf1FM5RuGdyQQSe
         EAzpVodPBvsKrraIvOF5dx8xsQUoPSvsC3GdPdy9Va3CWLtEMiXmwNl7XZZXsMsjs5cs
         xuLldvmb/F6QZqDgu599hdKxLx2Mn/PX5IP6c3BA9Q2HD19vCv0/QNeVztLRLbn8meDN
         vYuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXITehGGJBonlj07ieI+a+Hy6YsihfjjLAH36mx+R2A0FsWJ5DDzD8WkSxga0v0XQrywqewg+apb2qZex64@vger.kernel.org
X-Gm-Message-State: AOJu0YzX66wY66QCiQ4xjY3yL8K9FCh2ovdkVoEHENblqxEMWM+aPi9+
	tp8dDy2w3qIvDNCMk253vR/Xev/VqDkOzAjCubGYQWdGw5eisqRReQzf0QcnNvhTeZY=
X-Gm-Gg: ASbGncuxzO9ITxevpLKM2FIZpsTVWXFrfUV84WOZEEVyNUKA1zDaaPMjm1WEE8LkItI
	msafOcZo5UHfy7Br/Hfpfy6sXXVVIowqWgwkrZr6ZzsX9JCTwaZdr8RTiw3Cp1yFM7HzGIs4Iy7
	IwtuMiLBqmWy30iHR+HwQ3QWCHofneuStA6tRC/r4FI3FNzGySXf1UpCMpLQGn5sCwePxBCbRW4
	g8VBLwtQm9eyLVOkBXTqK6cqlTPZ8nyyak4KkeYdat3KrgPiuXHQB+CWC7jq1/FRnPZWqEjQHRQ
	by0BD3t/Iz+e2iEu+cLLy4odWygeD0hk6dlDnXaGAdYXt2/U1FlebTvfXswgc7BeQdUQILyo/Wc
	m7knLxatMn5IEZHAgKHTkYIRqhU9BgvR39jZPdU4=
X-Google-Smtp-Source: AGHT+IFbHQUJNEaUtYuoiAKnpxKSTUdx7Of+p6cxehImAaw+BY4hOH0GpPbuuowaAwyAR0v3kXlQMw==
X-Received: by 2002:a05:6000:4210:b0:3a5:2beb:7493 with SMTP id ffacd0b85a97d-3b4964c8b9emr2778414f8f.9.1751642700293;
        Fri, 04 Jul 2025 08:25:00 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b9651dsm2780455f8f.65.2025.07.04.08.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:24:59 -0700 (PDT)
Message-ID: <f1c4240d-a601-454b-9cc3-88ed8becb490@linaro.org>
Date: Fri, 4 Jul 2025 16:24:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: videocc-sm8550: Add separate frequency
 tables for X1E80100
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
 <20250701-x1e-videocc-v1-3-785d393be502@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-3-785d393be502@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2025 18:28, Stephan Gerhold wrote:
> X1E80100 videocc is identical to the one in SM8550, aside from slightly
> different recommended PLL frequencies. Add the separate frequency tables
> for that and apply them if the qcom,x1e80100-videocc compatible is used.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   drivers/clk/qcom/Kconfig          |  2 +-
>   drivers/clk/qcom/videocc-sm8550.c | 29 +++++++++++++++++++++++++++++
>   2 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 26752bd79f508612347ce79fd3693359d4dd656d..53bbdbe0725bd1b37ecd4c6b15b0d31676d9f548 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1394,7 +1394,7 @@ config SM_VIDEOCC_8550
>   	select QCOM_GDSC
>   	help
>   	  Support for the video clock controller on Qualcomm Technologies, Inc.
> -	  SM8550 or SM8650 devices.
> +	  SM8550 or SM8650 or X1E80100 devices.
>   	  Say Y if you want to support video devices and functionality such as
>   	  video encode/decode.
>   
> diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
> index 3e5891b43ee404edc6c99bbf8f2583cb44df9e37..32a6505abe265472de4059c4a048f731fdbf1dfe 100644
> --- a/drivers/clk/qcom/videocc-sm8550.c
> +++ b/drivers/clk/qcom/videocc-sm8550.c
> @@ -145,6 +145,16 @@ static const struct freq_tbl ftbl_video_cc_mvs0_clk_src_sm8650[] = {
>   	{ }
>   };
>   
> +static const struct freq_tbl ftbl_video_cc_mvs0_clk_src_x1e80100[] = {
> +	F(576000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(720000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(1014000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(1098000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(1332000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(1443000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	{ }
> +};
> +
>   static struct clk_rcg2 video_cc_mvs0_clk_src = {
>   	.cmd_rcgr = 0x8000,
>   	.mnd_width = 0,
> @@ -177,6 +187,15 @@ static const struct freq_tbl ftbl_video_cc_mvs1_clk_src_sm8650[] = {
>   	{ }
>   };
>   
> +static const struct freq_tbl ftbl_video_cc_mvs1_clk_src_x1e80100[] = {
> +	F(840000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
> +	F(1050000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
> +	F(1350000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
> +	F(1500000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
> +	F(1650000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
> +	{ }
> +};
> +
>   static struct clk_rcg2 video_cc_mvs1_clk_src = {
>   	.cmd_rcgr = 0x8018,
>   	.mnd_width = 0,
> @@ -559,12 +578,22 @@ static const struct qcom_cc_desc video_cc_sm8550_desc = {
>   static const struct of_device_id video_cc_sm8550_match_table[] = {
>   	{ .compatible = "qcom,sm8550-videocc" },
>   	{ .compatible = "qcom,sm8650-videocc" },
> +	{ .compatible = "qcom,x1e80100-videocc" },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, video_cc_sm8550_match_table);
>   
>   static int video_cc_sm8550_probe(struct platform_device *pdev)
>   {
> +	if (of_device_is_compatible(pdev->dev.of_node, "qcom,x1e80100-videocc")) {
> +		video_cc_pll0_config.l = 0x1e;
> +		video_cc_pll0_config.alpha = 0x0000;
> +		video_cc_pll1_config.l = 0x2b;
> +		video_cc_pll1_config.alpha = 0xc000;
> +		video_cc_mvs0_clk_src.freq_tbl = ftbl_video_cc_mvs0_clk_src_x1e80100;
> +		video_cc_mvs1_clk_src.freq_tbl = ftbl_video_cc_mvs1_clk_src_x1e80100;
> +	}
> +
>   	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8650-videocc")) {
>   		video_cc_pll0_config.l = 0x1e;
>   		video_cc_pll0_config.alpha = 0xa000;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

