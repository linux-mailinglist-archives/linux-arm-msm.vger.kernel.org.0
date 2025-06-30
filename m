Return-Path: <linux-arm-msm+bounces-63037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 569FEAED542
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 09:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E87421897B9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 07:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75D721770D;
	Mon, 30 Jun 2025 07:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BO/UiaG5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE41A214813
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 07:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751267381; cv=none; b=HwM/xpbb1IcujHpYilMzM0iY8TBCGww4D5YyKcelL4OQkJI1Hfj4F//oF8aigyVFxUQediYdYshiVSBad8kDzZfgbj/Q4N5Pv7X/Ak3TkuUBpjIJG1/AMjveLWxS/0r7IRkk3pUUorWaCwjxdt2df+G1lWjj9n3fFxHeCBKVeIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751267381; c=relaxed/simple;
	bh=ddiuvGxz83jlR9YKFCde8sWN22f7FfscTfyjv9iN2aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKJVun2KOxq12XY7AE0ApI3z6/GvGDh4NcvrSWmahJNmJe2MNcrqy3qENMj3WLUyIkkXTRieOfGP3v/TPqNIWHz7lzdYDYiN26yC3ZoRn+mdZs2heKE7GbTxpw9VMjjCiflqwVQ/UP8AY7jxF8I7dlIV+7y2atMdOgFnsZOw1Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BO/UiaG5; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so1533649f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 00:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751267378; x=1751872178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rL7MI4aiTt6sLWVA1573aHsEQCSTNCPjbPzbUM2vINQ=;
        b=BO/UiaG5MrdIT98UwEzy1UBaDJMj3rC9J1FSJglYBmBMmxYNsKhqHiPuoyvJG2oF5l
         djfNlnLo5lWaC0Sl8jPcgQPt2lumT5J1Qo+pcUpwmAZXRcQ5ndUpb8qZpD/2bvyOMRkP
         3CpkHCZB4Xu2qxtohitW11EXUUyysaXd+pNcSuHe8mpXjUszUGODQCp6rMzj1aqG43l/
         Xs+LDh+3BsbHP8LFwHdRVWm8eYfcEekH8Ysho0Gpjd6yyV8QN38RAYRhGhN5fD8DZJUO
         U4mFCYdZeRVRfd+ummGblsG9dovdo1Gs56M4WX19wqxaYaxl1MO1gjntIgi7IDeOMHOv
         YMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751267378; x=1751872178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rL7MI4aiTt6sLWVA1573aHsEQCSTNCPjbPzbUM2vINQ=;
        b=McyJs49Wwnz/zGSrpKA4LHsJekG4Ylet9uZ1DutyMB8QMpO36Mf9bCCh+ZfD1PgPOh
         koH0GqEAyO/r2av3uAbqIDgy6vquDNUKKhGIjFo+Dt8Ds0eeyTNYgxr6EWDofFroNzJB
         BYwTxrHN7b9L5Qh0Sv03IF+RRzswLydTIxtEWGUkbsiI81YdSvNC+nFeQklkNYr+f6c+
         lYNviFsY6zYucnWmo52xds4RvKz301P0e73O6bRqH9OKlEVdaun1g6BXAYonH9QdjJ9t
         w0lBxqmEWF0mGL70p5M3ZvDT7EU9eHo9uYkebKoEJUpqWaq5/LwuxUVm+Pn/2/cvf07p
         9vKw==
X-Forwarded-Encrypted: i=1; AJvYcCWqFIQ82XrsL82PN+QrfQlUNFqEOSECnT/ZFMPkxN786FmSFbp6w/DbFhUyJEZUFkDISzeeLIcztxZIpLxH@vger.kernel.org
X-Gm-Message-State: AOJu0YyF2glflZQjGRux8i1WoqD1hl+Goghj+NeFWZ/BfMJ0+tJOj/tA
	uktTv0EvctrOcf5nMt6gV/yuRrOIlk8QlqT+rV0NsIoEjAL8pm4kTY16NoAdipDaCOnJC6j8dHE
	ZQBn+
X-Gm-Gg: ASbGncvMP1wf3Cv+qQK1bV33IAbSqD3yRtheFuQrq+s/J/8sY7mYUF/+IZJxvO+EB0V
	ps5ql8jV2aaMkGLG4Fe8iRtJmFAIHpV8Uwn8j1VJS6Fojt+s5pchpriNhbk1U9661VsYFyUZ7pw
	jeRIlmUncggxHF/HzisHqj5Gr1kPr+03LnVk1ph3FQ6MyFHs3zXyWy0rqtEhDB0JKYNbRs5oLg/
	N+jkzblMQGhFB9o2PtCPp1MUHhdA89VGePe7LdwYnHVp5iAi3j3u0kAVGOQDm4LSGBIniOWzApp
	s6wpo90Jzzme4bjc9uyWgxeYvgBLTUhxaby9kYnC2JrjqRvQL2LGFf6T7Bf6QdFR05ZozCGAo65
	QLULFSyo0
X-Google-Smtp-Source: AGHT+IGG2/mG1Wh2790HlDLNzSCGs1iMdSzJdT+7KKDDoR78pqdJxJTRqgq2iXVeOJWxsyzsHUkPZg==
X-Received: by 2002:adf:b649:0:b0:3a4:cf40:ff37 with SMTP id ffacd0b85a97d-3a8f45494cdmr8755726f8f.6.1751267377946;
        Mon, 30 Jun 2025 00:09:37 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:5b42:ea56:7d4e:16d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453a1914d10sm16366245e9.4.2025.06.30.00.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 00:09:37 -0700 (PDT)
Date: Mon, 30 Jun 2025 09:09:33 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Casey Connolly <casey.connolly@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280.dtsi: prevent garbage on serial
 port
Message-ID: <aGI4LTPmiKxtrStQ@linaro.org>
References: <20250626132333.351351-1-casey.connolly@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626132333.351351-1-casey.connolly@linaro.org>

On Thu, Jun 26, 2025 at 03:23:30PM +0200, Casey Connolly wrote:
> During early boot phases there can be garbage characters on the serial
> RX port unless it is configured as pull-up. Add the pull-up bias and
> mark the rx/tx pinconfs as being necessary for all boot phases.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 64a2abd30100..60e4a311405a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -5742,13 +5742,16 @@ qup_uart4_rx: qup-uart4-rx-state {
>  
>  			qup_uart5_tx: qup-uart5-tx-state {
>  				pins = "gpio22";
>  				function = "qup05";
> +				bootph-all;

I'd add bias-disable here to have consistent state applied to both pins
and not just the RX one.

Thanks,
Stephan

>  			};
>  
>  			qup_uart5_rx: qup-uart5-rx-state {
>  				pins = "gpio23";
>  				function = "qup05";
> +				bootph-all;
> +				bias-pull-up;
>  			};
>  
>  			qup_uart6_cts: qup-uart6-cts-state {
>  				pins = "gpio24";
> -- 
> 2.50.0
> 

