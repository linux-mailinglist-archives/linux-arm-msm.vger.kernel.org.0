Return-Path: <linux-arm-msm+bounces-25520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AEF92AA80
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 22:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A179A2830E7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 20:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33CD14BF87;
	Mon,  8 Jul 2024 20:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="otKbJTIu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E6B14A636
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 20:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720470171; cv=none; b=BA2DDZgTr2T9XPDMyJqjTUiWAK0OFA21q4ym5sexYL1+cGKpn2FhcA8feqyHTAM1boVzkse8gZj/E17F5s+/UW7YQePLNgNQg7byfRzTPW3Rzoxa+vlLtoCoPrCt3wzQjvjOx7BSGFnUV3wTXpMLrGP4B6aCHWLV8qHcLCWHyaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720470171; c=relaxed/simple;
	bh=R2KVCos5XG85VgvllCrW97CLuIptz+ndjay2ZUunWNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwUJR6Bz9BkwW4v1WvmIOGw9NynUPQLcCXrBCXvfmXQlcX7xZQarnLMjgZC0P9Z3dZ+e4aSXxB1ZZTXKdUpXcrCA9ODmW5doYo3vQQma4tXX+gniAKKKIurHV7aOUrJcLQ1RgUQxTCGwxqmrrzzbko/C5gVrfQiQK9NO8mRaOEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=otKbJTIu; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52eafa1717bso1677178e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 13:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720470168; x=1721074968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7HBahP17JV4pcJVdiDBOVdbM/4Hr5+WhouhYHk2KlNU=;
        b=otKbJTIuY9E3q5aosEVsxB299bjnnS/GYxzeshEf7oPNIE5lFIqjl2x/UfxNX0ip4w
         FMfzBM0Fnz6AB33Z57loQ3Vn2YwmE45+p+H9724MLlVjEaHn0CEdXiZ+9NeLHJ5DJlIr
         +jrPThZBqlc2ZBWMLhMY1qP3lytuRHer452GY6bD3PmPH6ukaeBLt4Doj3B9WOCU0trA
         C9c3SLeKVBMXSBVnzbong3VwotApfqAth/5/mkS9GwZe1U+RV8TisnWoBL/PVLlQAILY
         uF4hYC/aDbfSHref6uemGJKCO5P9B66/lXzi1h5TWLtQGUkS7/rQjj0iTkVA/chqkBpg
         3L+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720470168; x=1721074968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HBahP17JV4pcJVdiDBOVdbM/4Hr5+WhouhYHk2KlNU=;
        b=gx6eDiYpesm/4Mv4KoaN0QBAhu5Ffg8qeZRcIR46gnp6Qt/tfFbIxKrq9Cr48zZJ2Y
         V0eO3WbEeBFdKAGNKlIhS1MXwwxNC/f1Wd3wdpNlgi4KftO88ojzhDnLK7kNx8W5WvXL
         zF/P/hlInCecK2UcAudm7vc8IyrttaWw9sRXTFiKEF8E3KgIeiTTJd3aek/3F5XLTw12
         8JsLjYUx2RNJ5KiYtBqXJIjZ/xfbAYVaGnqvwopV6lGm1MChx5v+QFsx9s6bC/EMRye2
         WmnLQztFcwp7EszRRhDgJuQMuMDfHEoLHlEnrfMn58WbtYFousUjOsie4V2IXDMnTv1e
         RTVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0KYvkglXvfEmj4GjSgpAJC3rE/6J8/ums7M2lXvKCkNqAWjgEjo1a+EIIELPPQL7gM4IKl6r/HsHaLTtSLoxFdol7H2Jm1Yypvlhndw==
X-Gm-Message-State: AOJu0YwXuY/RIFJ/Z8AB7uoDYiZPSLkH8C3vfQZ7so967rNtgRHWz/ay
	zs76miK2PLlfIC8QwFnWeO5U+9rdtHyFl127z/31WN7pQYPsq/uE86H4KJEb0rY=
X-Google-Smtp-Source: AGHT+IE0p6BHLF2xtN9vFb8HMRQw77rsrhSc+jsKvDlHT5osCua9WyKDoic+Gq4wlONTwBWcyvVmqw==
X-Received: by 2002:a05:6512:10cf:b0:52e:7f3c:6b81 with SMTP id 2adb3069b0e04-52eb99a1462mr250014e87.32.1720470168289;
        Mon, 08 Jul 2024 13:22:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52eb906ca43sm58149e87.241.2024.07.08.13.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 13:22:47 -0700 (PDT)
Date: Mon, 8 Jul 2024 23:22:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/2] soc: qcom: pd_mapper: Add X1E80100
Message-ID: <xlpyzotvlz3mgc3uu4sebogz43vxwrqxh7wtsk22dsdi47d7lm@fsvtr6foqpyd>
References: <20240708-x1e80100-pd-mapper-v1-0-854386af4cf5@linaro.org>
 <20240708-x1e80100-pd-mapper-v1-1-854386af4cf5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708-x1e80100-pd-mapper-v1-1-854386af4cf5@linaro.org>

On Mon, Jul 08, 2024 at 06:22:09PM GMT, Stephan Gerhold wrote:
> X1E80100 has the same protection domains as SM8550, except that MPSS is
> missing. Add it to the in-kernel pd-mapper to avoid having to run the
> daemon in userspace for charging and audio functionality.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

