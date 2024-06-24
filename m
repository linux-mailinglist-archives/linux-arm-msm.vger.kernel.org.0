Return-Path: <linux-arm-msm+bounces-23950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7373914E0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 15:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16B3C1C2250B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 13:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F3E13D623;
	Mon, 24 Jun 2024 13:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bbBbkXhB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C177613D531
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 13:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719234717; cv=none; b=UILqXVGfFCgdu4To57UyQyrkotQl4kKsaldKARK6OtPdW80z4VB95YFYS2qbend7lm98vRpcYwG0mrioPn7RTEWeEY/aJXtXdhq5MPgLRx19ILwxQwmFLym0V6SYlkpfog/y5D7L4cuRSk4fN/4P/SPJinjLqhffx7NAXbYOx1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719234717; c=relaxed/simple;
	bh=VjNCFzWs4fMip61XK1/2tUG/6+rad2HUZJCzNnVtNt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9zHezYVDS8VC69yVbSHZk8SPkK6Vws/cTgumAzdSEMeKCOobcleg0wMPj5Rbhc5A5hpRihejkJY5nk1a/XWnl6L4ZzIo0adD4x/raBrmXnMAqR0VQmAoJBJZtIzPeEofi++2MiEWuDgqBhtzZF3rAblz3Nbrt+wGFnbkP9KF/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bbBbkXhB; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52cdf579dd2so1789541e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 06:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719234714; x=1719839514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IPk/V6ZCtMtNKcTQ0BbQ1yW1GyQn/NuNLdo14/zbbMA=;
        b=bbBbkXhBa2nkhptAqEeGO8yEE7uHmESMz7hsnO3+2uVjxWH+Ug6zhZi7cmfZgtckhi
         jPlc4Q09Pa5oTVal2/ZXeCv73GvHcv9QGIL9NCI3Xhx3WURdmPN3RZZxagLrf2zhGCv8
         W/jp7nTU3Ca+5E+CYd3lSJejV06OG4KdSGm+U8Odg7cQVWqJgQPU8WPaAHNZjoD3S9M2
         VOjB8WSU4vOo5deTZL7nyPRcdfMgeHFswQWlGkZz9riNwJ2z1YfBJQ8891tRfQ/ly+lg
         aatL5cF8YLHpRDmhmaslhZpbdqhJn51um9dm6EOpK5lyhkWmF7wFDDY2b9srLcaSPY8E
         26pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719234714; x=1719839514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPk/V6ZCtMtNKcTQ0BbQ1yW1GyQn/NuNLdo14/zbbMA=;
        b=LoUmUOZishVBUqTpB/lLiYT+/cY9ae4PFW8ibJ9iQ5vbawT307F+textVjWBXldDFb
         7Rvi6626tSrA4gvkR0hzBS3xnz58SWPMP1Hj9nWCahZ4hdMUPZrI7QP/KsqfJlWIbng8
         +e8TsALxn5b3+sy0sDvljetbsyTHNW4XlEFjzRLEZOXwIOybb2Q+YoKYdqHk2KZdBeO0
         4mea81YUgD6pwqZ2eMX2avldQblKtjPo9p/KxqBuhj0akwV0ltnxm52Ih3uL/9cSn2il
         iI7PK1+o6icLVXtSssJidinQkwVHhmAyUbDsyYSypiDkjFdSEuQgKnsFjYMA98aSL+mK
         HDhA==
X-Forwarded-Encrypted: i=1; AJvYcCXlhNx/5shZyDuoXlShtXqEYXjp95/2eyPJ5J5I9Q+MLHYOCN5VawTMu2JfSB9m2+rLwGGO+tOCEWotmql9ULO6+zXOlU8ao0Cii45Qdg==
X-Gm-Message-State: AOJu0YxetwyLu1Qk017ZGP+paBAeRYRb9bflyfruygUoxfb+etZet7a5
	/SktNSBhhXmVTym70DCW5ZwvoYCq9szrOUyKmodNoKBnLNgoD+hMFvE227p9L34=
X-Google-Smtp-Source: AGHT+IE6VlpPc92A70dxmbYGuqq6zvs+OwoLUdsYnDUUrs9lY4ROR5VlF1Z3d3UMo8Oryl7Nn+WZYA==
X-Received: by 2002:a05:6512:3e0a:b0:52c:8b03:99d6 with SMTP id 2adb3069b0e04-52cdf7e671cmr4286209e87.6.1719234714150;
        Mon, 24 Jun 2024 06:11:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd7cdf464sm947409e87.143.2024.06.24.06.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 06:11:53 -0700 (PDT)
Date: Mon, 24 Jun 2024 16:11:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8350: move usb-role-switch to
 sm8350.dtsi
Message-ID: <3yq7bdgvngxdmgoumyxkvcaj5ikut4i7mrsjhwly4hja3kuhcg@5f4mphitl3hp>
References: <20240624-b4-rb2-fixes-v1-0-8d763ee4e42e@linaro.org>
 <20240624-b4-rb2-fixes-v1-2-8d763ee4e42e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-b4-rb2-fixes-v1-2-8d763ee4e42e@linaro.org>

On Mon, Jun 24, 2024 at 02:23:43PM GMT, Caleb Connolly wrote:
> Since all boards with this soc are capable of role switching, move the
> usb-role-switch property to the soc dtsi and stop explicitly setting
> dr_mode to OTG since it's the default.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 5 -----
>  arch/arm64/boot/dts/qcom/sm8350.dtsi    | 1 +
>  2 files changed, 1 insertion(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

