Return-Path: <linux-arm-msm+bounces-26563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBF6934DC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 15:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA99A1F2425F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 13:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC0013C80F;
	Thu, 18 Jul 2024 13:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qcM07StF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFEE13BAC5
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 13:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721308020; cv=none; b=rqS9LAXWniLzoA+XXnOB8j2ckjvkgf8Q1iN91T2kD+HbHJ3TRTK3G5sdXbGDJsldw8Vp9CTDjnhsA3rqmXOukOS/UZIlMcTzM32DYOpjxfcNel9Yv8jjjeyRjgrJlILWowI7O58sBtQYa8vnKM2Aijn1JA4DCbXh21oUqiaLKPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721308020; c=relaxed/simple;
	bh=djFjnEapvar73YwrLaz07BFQzKJRi6JJDEjTOBaGgW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1kREFv3Xz6leZD/BYD15iT6kF8QY6IKsVvfxJyXBo4AwSCJDfoa6EWQh2ZRnoEj1XiZTre9mhyFOwC1UFnSV26xhp6Lpr3YnFbWjE83vWsqwr+0ZJ0C5kZt9LAKnonpc6FoiAA7SJca8tU/pAe/jbYUWSGRLbi/FDS/pxg/cUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qcM07StF; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52e9c6b5a62so352264e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 06:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721308016; x=1721912816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pVjvPiW915O6hXy1dnjgZFJRRYTFWxFmRy/fpGBotgg=;
        b=qcM07StFqvpSa2K/5kqALJ7PfIaxnhN6BWUDya6UK3qxUnKV3NkdTIsLyqZWzrJrOG
         SpEoYB4wijq07EHTWGm3FZPiiLMC6sPtQhS0Z9CDXPGllOmlxw/wtFISO+MPrNEZ+rsJ
         S5lCs9NccExPO7TrPZ/kkT5vy9mArzEQpNqxjZDtmF+Duu/7Zox4oJWswLlGi6+LGpzl
         foTlNmnTkyUjzzEt3q+mCSfuIM0qUMaAhRqHRIS4IpEvoL/ajGmHW9oPvkZwYgGC6/de
         XTHWniCYUDP9pQaa4WuYS+SjAGxi3l8inxc86MjYrgwlQFrioMVu5OXNa6Z8+gbSlHOS
         n/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721308016; x=1721912816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVjvPiW915O6hXy1dnjgZFJRRYTFWxFmRy/fpGBotgg=;
        b=i/Fb/zFQF/t2o1cqLWBLUMKTZPYUw50fdcwj9fbrPIaFEnG8patXEfXQM3lytHnhj+
         OknsGOuQ46qhgsN9XoezjqJusrEp8gB1tsG4ekzoi9E8ciVZF66W4jOBPyy073SQSxGL
         FC7FZzNF9yb0uDaqKVa8gLYLGLHekZ7tm3+UV11vJQ6+G1+Tqz9P/C54XjyQVvFl9SRu
         uZZrIoY0FTG+0U38fxC7+yQhCc9I20sRU/kq21LZY4YgcuaHzL5cDJMzO6/yZ7+IEaoN
         jUiAqYO29KyM85jbok0YEQrQRemaRr+CwJoY44tr09QAbgEYnTwQGbqc1OVJX6AgqnP5
         a6sA==
X-Forwarded-Encrypted: i=1; AJvYcCXF00gpJboVqUFpob+jvlJdU/+8ZjT/5qN0Rpd8etaO+syDKgWpP7TU3t2fP69pTHpgmoaLiPWgZFD5aa88bQFHSqFSePMtvMyBNsDs3w==
X-Gm-Message-State: AOJu0YzVJ65gr2jA1nU+kuaWDNjTIBVHQ2KaGPKptp/5MqYpoDZL5q3+
	dxkh3SnqFRvHoq/2PmSbv8ixR7q7WExKk9/FNBupmB6FqRwULLF9oAl9T1wfmGM=
X-Google-Smtp-Source: AGHT+IGTjq6DlHRN25DEtbrFtVEQIQANz99wGmd8fi4oStiY3LoeqmSMrCyvZ3dZ6fugBkOpxXHedg==
X-Received: by 2002:a05:6512:2392:b0:52c:d8cf:d4f4 with SMTP id 2adb3069b0e04-52ee53a588dmr3533169e87.11.1721308015652;
        Thu, 18 Jul 2024 06:06:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ef07a0442sm87103e87.275.2024.07.18.06.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 06:06:55 -0700 (PDT)
Date: Thu, 18 Jul 2024 16:06:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Amit Pundir <amit.pundir@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, dt <devicetree@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550-hdk: add the Wifi node
Message-ID: <qitt2j5hw6pax7yekdooutxebhkznhdv3aafnhkysr5fjcbmd7@xqbp7h3ld4gs>
References: <20240718125545.2238857-1-amit.pundir@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718125545.2238857-1-amit.pundir@linaro.org>

On Thu, Jul 18, 2024 at 06:25:45PM GMT, Amit Pundir wrote:
> Describe the ath12k WLAN on-board the WCN7850 module present on the
> board.
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---
> v2: Changes suggested by Neil

Which changes?

> 
> v1: Kanged verbatim from 490812872449 ("arm64: dts: qcom: sm8550-qrd: add the Wifi node").
> Link: https://lore.kernel.org/lkml/20240702091655.278974-1-amit.pundir@linaro.org/T/#u
> 
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 113 +++++++++++++++++++++---
>  1 file changed, 101 insertions(+), 12 deletions(-)
> 


-- 
With best wishes
Dmitry

