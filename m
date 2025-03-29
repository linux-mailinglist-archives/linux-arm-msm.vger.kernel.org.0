Return-Path: <linux-arm-msm+bounces-52826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E73C9A757D7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 21:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE462188EFB8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 20:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC041DF75C;
	Sat, 29 Mar 2025 20:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zHUlig8P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BBF1AAA1E
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Mar 2025 20:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743280257; cv=none; b=bdy9RT0WJeDBbh94WrdyYhnLn/1B0OEl3bfxrsWSMZ+NAOo8TI6SuT+Z2jupoAgzZ1nDcQcn6BOii5h2sFIlZs1RpmCCQlcMkc5qtWiyp/ag8rqULPaEgQlAFbpdZjBvZcNx07gkXa/+DHtEdYCJ8wbDEUx89H503CLwJoKyPlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743280257; c=relaxed/simple;
	bh=Yu8gx4E30LKjqkUeN+vwaFVnCZ1b49SThURUG43iDtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=caWDUBvPaiESwA5fJrYH/XgRSQypUMKuyfOZ2QatUzuUGP5Ylpexh/nUMshM0lPVHXbG/GCKQ4pWCJqc9OGGdx3RjN3dQphI6+D+sUdC2oFb8fYmqSrRMdofSYNGBPIWBsRc5ijREUKREaoaOpABuFb2fx8dtJffsX/FTF4SPgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zHUlig8P; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso5141445a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Mar 2025 13:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743280253; x=1743885053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hcKHKeP7WWkzt6wllCWrZxsfdiWPO0K4X4xYXivfUlI=;
        b=zHUlig8PCOj8nQe6uPjQC6nHhMdUFTf+ChShlT0uLCdRdWcvQ5X/c+gxSB9HNPUVOv
         TCYSGlWYebTj7KG/hCWm/mIawJn4NZcHu8lDWoKWKqxo9XgGPULaWxI/hOSLQEZI+xof
         1OFxIu5CKrKWnzSaGUPjcfDzT6xeaklpSsouh2ywp5eQjrmpuo0Eza/L/SOCctzrJa3f
         mhVxlCpx1gPIYo+HAxssKA87mKDJYBjFBlHp+lmOy/CrKVk1TsJDkkki/jvdZYlUuSDA
         ubfvkoNYH95C+kjfZ6awNUmq7AH1IISGBivAnI/Y0lFpb/aK2w5DzM9MW8+u3ExjSJVL
         8vEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743280253; x=1743885053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcKHKeP7WWkzt6wllCWrZxsfdiWPO0K4X4xYXivfUlI=;
        b=gImHcphzX8K9S7thfZcJwjSORBxx2alnC6RG6k7Nch6EF59gFPz2Kwfw/JaZj27cXc
         WerEK++yly/iTvYB71gtTVzRGwx3hSxc1iAVLE22FsabEsuG8isWakwZnKBrYyknI3IE
         70maD6WEDye8jRC9x70o6CGC7/GbGTJPTztC70JZ/jWTRGnkhcamN2pDtCAgVTz8L1Nw
         aKVYw2FgiU0VSpxEd+TgwGoN74J8Nw8QPrpNUpGJ/DA96LC4OlZXuTWydpjPvpYEqp8p
         Md612fdwc6lV/3ZZcsCgWkeOGvHjvBbCHyYNM1XWsvK90WGgPkRiAl0M7JIZNCKrP3ZD
         kHaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn4ARrwOg7lBRyUainoorDYjF9hboVePYn7XTx/iGeTF13SMJmEuXtd71i9dSw0VMSKrHLhje6brLp8cBa@vger.kernel.org
X-Gm-Message-State: AOJu0YzalBaVLzdEU2uArwIOaZ4Yc9caCbeIAnoPKb+dswV91WPWACy3
	eRCN45Y+LVtfiuwNB7DLqGpLhMVhgvXEC2qfEtapwfN1EukvPex6cisiIoybzmM=
X-Gm-Gg: ASbGnctWlvPSQC/k4FW+19x0UvZ4XvFJmLMIsVDvjwMUJC2YUKV7HJvezPQddHnp7Sp
	qUcHPwDt2NeM+iUVb6/RSYbR3LH1kPVIVlZUy+Se1qABEOp+ttu5Gzjs6Qlsg0cRNGBeSZtu+7X
	BBX/egGOezTUY6rz6/J9yv8ltfqzN+lDtxda0c65OGhF57UHS88S1UTwsA9JV36mtCl/jZnytqu
	OO8E0IYdh6rPRibP3H28VCvvbqdunIPeO0mLDicF0SqCoNbSE5TmkSj1Yu/KymHDKJcdsH4SsJR
	shD1+TDjhiaz9iCp5QlEWzrvfwIksP8IZyC2tiaM9w==
X-Google-Smtp-Source: AGHT+IEb6Ruea6hK6TV9vn2hpTxeIQDJ7rrjAnaoPPm7WZXIAH45MUutF4n7CxtI5vev0wjCTCnfjw==
X-Received: by 2002:a05:6402:4007:b0:5e5:c637:b69 with SMTP id 4fb4d7f45d1cf-5edfcbe9333mr3696024a12.6.1743280252884;
        Sat, 29 Mar 2025 13:30:52 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e04e6sm3377468a12.76.2025.03.29.13.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 13:30:52 -0700 (PDT)
Date: Sat, 29 Mar 2025 22:30:50 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dgilmore@redhat.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-t14s: enable SDX62 modem
Message-ID: <Z+hYel7Cb2t4mMPl@linaro.org>
References: <20250327081427.19693-1-johan+linaro@kernel.org>
 <Z+ZsE1wm87GfVanE@linaro.org>
 <04ada91e-bf41-4be6-9021-96bcb781a40b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04ada91e-bf41-4be6-9021-96bcb781a40b@oss.qualcomm.com>

On 25-03-29 13:06:54, Konrad Dybcio wrote:
> On 3/28/25 10:29 AM, Abel Vesa wrote:
> > On 25-03-27 09:14:27, Johan Hovold wrote:
> >> Enable PCIe5 and the SDX62 modem present on some T14s.
> >>
> >> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> >> ---
> >>
> >> I don't have a modem in my T14s, but this is based on the work I did to
> >> enable the modem on the CRD reference design and the T14s schematics.
> >>
> > 
> > What happens with T14s variants that do not have the WWAN ?
> > 
> > Is it OK to enable it on those, HW-wise ?
> > 
> > (Hope we don't have to split the devicetree again, like we did for the
> > panel)
> 
> Unless Lenovo planted something else on these GPIOs (doubt), it's even better
> to enable it, as UEFI brings up this controller anyway

SGTM then.

> 
> Konrad

