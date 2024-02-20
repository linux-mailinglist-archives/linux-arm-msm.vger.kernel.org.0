Return-Path: <linux-arm-msm+bounces-11859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD2785BE04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 15:03:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F7571F243AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 14:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3326A8C6;
	Tue, 20 Feb 2024 14:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cUjaVRij"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C1C6A358
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 14:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708437815; cv=none; b=spXQD2JTO6ksOcDKSXITUz0bgv5wDZmBywgJqflTjQ1aywMabp1hWWERSnROEANWFfM75rX4lirLbU+Y+iL/S+g9gH0Fmvh4c/3tj9wVxwEGMeAZHZii+VrIRXN+hZNuNv0ihbx4IHe1gNopuXZqb1YDuRLLV/bERz8u3RzszIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708437815; c=relaxed/simple;
	bh=YIgXLQrn14CWmrZfowaGPAblUiVDzjmJHLps35gqblg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rd6e9Uc3E+pPm7JKR1J0K5Bwd2x2MKtJaxFToVyiS3SC9bI0bcuejAgj6bSaRHDsTMD9xQIYzfEYDBxcUZccZ5/HNxvQQFrJARD9h8pVTqYcCRnTr0eVx5Q6Jy37vqz126S1KPuw0v4zKFltGHRRNulgpmqNN7sJM/9SF2/KrX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cUjaVRij; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41270d0b919so2731595e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 06:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708437811; x=1709042611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YIgXLQrn14CWmrZfowaGPAblUiVDzjmJHLps35gqblg=;
        b=cUjaVRijlpkAuZyhcMvypRAMfKh2/AQw6/z8dfGU7S2aO72BL7k0f6E5CaYlHdrC7i
         B5CeBHk+oa3ThzoraBFbcmkWTASt2jDG/xQfkEbsNY7/2PpSgo8FDQUwpz1UGr3BLCGi
         JhClBUX8agY7V1P7/BOgo1JPNBoYWeyRDHbrTYAX8LDPQAX6usUAQ5m8/iFMprUTpf3E
         wOhSCzJJwSskJXqK2N7ncSWGbe5gZxpCg/L/e4mkOTgnzmmF+K3NHJ/3ouXJ/XTr/KWF
         r1HTvLz8oUsTsUAUxMiVbfiXxMmV6grWDrCRk6pHLPodfxLEtzHXifwBPX8429XnZ+Gj
         NbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708437811; x=1709042611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIgXLQrn14CWmrZfowaGPAblUiVDzjmJHLps35gqblg=;
        b=pZ1+sVpkRcvBg6cWnJQzYEx8BxC5ZqDdXYeLhm43H8RJ6uTnlN/XNgNq2glJ8g7ART
         xK6lzkR9QsQDxWd6H/8ooX3PVI/UkoWjRbtTi4yjMYyEDMi6HK6c9RpkXCtsC8V/pWMi
         th9jad2R3DcQZr+T3fkdQ0CwaIKc8B7t4WECB+Xk75IzjWDMZW8t9O4hBiEzehx/UwB2
         h/TI3uBiDYYLPohghE2b92MP+yuaA1GSyRkyR8QwH+0Gh8XVdfeGzkFGs1AkkEdTvqiU
         HL97yHLG/sxmtWdlR29/wgLAyrRJdrlR/clnXLCI4G5b8QWH4dKuQv7h6rM/uZWbBuOE
         f4cw==
X-Forwarded-Encrypted: i=1; AJvYcCUKhmZ3od9yD6N+/toUim1lm0kVuks9XQpHdKs8WTnUqlDiZV8oa1ka/1PHjP5ViWZJEZTHVW+bXVaomuJB74UMn9T3qZ4hFyL8a9V8wg==
X-Gm-Message-State: AOJu0YxOm8vmqTxQHqLmwkfr38//Yknb7tLEnHRGqQRgvgERb6gE2Wh2
	QBkAfb4ge8ZQVdcj052BNp5oGBcbD1xBFT9pq9Vap3wdL87RPAMVP7mOln/Wquc=
X-Google-Smtp-Source: AGHT+IG6vkgZ+8zSvP2/8Ap20RRDORuDhGSZX+BUAp6ws2+0Tc+tQb9sjACW+5haOxYS7Odl/DVhmQ==
X-Received: by 2002:a05:600c:1553:b0:40e:d30b:6129 with SMTP id f19-20020a05600c155300b0040ed30b6129mr11941148wmg.13.1708437811534;
        Tue, 20 Feb 2024 06:03:31 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id bj29-20020a0560001e1d00b0033d5c454f03sm4888305wrb.114.2024.02.20.06.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 06:03:31 -0800 (PST)
Date: Tue, 20 Feb 2024 14:03:29 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	"G.Shark Jeong" <gshark.jeong@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maximilian Weigand <mweigand@mweigand.net>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] backlight: lm3630a: Don't set bl->props.brightness
 in get_brightness
Message-ID: <20240220140329.GE6716@aspen.lan>
References: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
 <20240220-lm3630a-fixups-v1-2-9ca62f7e4a33@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-lm3630a-fixups-v1-2-9ca62f7e4a33@z3ntu.xyz>

On Tue, Feb 20, 2024 at 12:11:20AM +0100, Luca Weiss wrote:
> There's no need to set bl->props.brightness, the get_brightness function
> is just supposed to return the current brightness and not touch the
> struct.
>
> With that done we can also remove the 'goto out' and just return the
> value.
>
> Fixes: 0c2a665a648e ("backlight: add Backlight driver for lm3630 chip")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

