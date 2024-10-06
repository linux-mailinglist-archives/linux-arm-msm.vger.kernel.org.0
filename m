Return-Path: <linux-arm-msm+bounces-33296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 315D999217E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 23:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF9FC1F21463
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 21:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE57189F3F;
	Sun,  6 Oct 2024 21:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QOze6scr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B974712FF69
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 21:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728248486; cv=none; b=rWzkLrdHxqVvwULCnM9PICiJjpfaniGQuilfj+2zu3HWAchKCfsNsagtej8e2veKAMnLn+BsOtefDJ+xTFZGJ/6nfCzhvjHaAYogARKCtIOSmyc1OJIkLX98Vwf6iy4FkYFkFiqtHtvFRup3VCWnroVFVMk/E1hDcnR8V8jIumw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728248486; c=relaxed/simple;
	bh=LDgJHD6hTTHMEMIdRKwjgKA25Ur3DcX7zJn5OXViZSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8pva6UPjyFc4tpEhIbManpd5toC6fD9wBw7i6Vb6m1aBro5wRU7HkGK/Qqwjkw9y3BQaTAs00cTZfQiTF88BTkLxIglyUH32mSsVqXi6UlD+N4r5uf2yG68E+N7drKCiTYcr5NncC7rWOH6EZEDXSBC+MKKDLQVkP7b7cXi4jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QOze6scr; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2facf48166bso42682831fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 14:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728248483; x=1728853283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e9dIlwhJyEYw+xT9irjfA9XW+mNVddQRriVBuRykZFE=;
        b=QOze6scrkFBSyGXnMfk/w/uWaIK4lz1mWNqCUoMR/iOcMB39OtHPZA8QFMikS+LNXP
         XLADIP0YnzWkqo3rWS6EPQUFmXG1/dkCUUaDmx1dUP7eLC6zrbSwHx+Wu03Tt0TXcqy4
         yXXiDYxhiGobZ9O+9on0gp99VYFjxZw92VY02CgS7aiBAytk4wAxJj0i2C8jOAYaxt1l
         j2IYjeYHdtutmmKEdJqsRxyjoLXuqYgwvQVA5m9DgYvMa9FOheNGEr43e2H1Q+D/uPhw
         O19knG7ESLGI5HDbpqFTRIWFqs5sfI6wkP6C1kL66033dlpZi669e6I6tklEdHA5mIhb
         1K6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728248483; x=1728853283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9dIlwhJyEYw+xT9irjfA9XW+mNVddQRriVBuRykZFE=;
        b=uFZQC1wXXyMQ98YrQhHtgLlAzHeb4qU8QqPEtGcJVNrSdBy0T3yN9ZuUs2cWkg40Qo
         2fWF+ThtGuON/eS8PqfMYziEx89K0x26S6W62xDDj24L7D9+Q7Qo9JGT0cdiA86aMSRB
         s7Fz7xEBo874+sCyVTqy5t9mu7QmAR8WyxQCCumsEL20S1U6M5KfbzXzr3fRNSQbudMq
         SdpYKMbqmB8DPZJcZ1HugcnCE1yrRzt+Hyf0xhON8gfJJaAEdpv0KrxLTDL0lU0lgt1V
         C055M3+EI+uDB+tj+VG6jLuUynJecY4AZMw/sGNh1eklWfN5RcJJw6IIjTHGHhktbNhP
         PVcg==
X-Forwarded-Encrypted: i=1; AJvYcCVJOHfBQXJaJU6DLiKcx/HQOZ4USjeURYNE3hyvJlVJsYfbH9DNP/AzPvJebT3cO1VM40tYNCuvXQPMf/7B@vger.kernel.org
X-Gm-Message-State: AOJu0YwHHguwXLWiVcpMQ1345Tt/pFBOmPw1cNhv2nv4ZgUmAoDcIbey
	2vZrAxCeawN7PIW5fYwamo3GSYTttNaVikNtz8EfWOUZFU+1mt0n7GsKE/fLN5Q=
X-Google-Smtp-Source: AGHT+IHn/yyp72Nuj5IEfSwA0g8llAX2zRR0mR2+c0aYtHrmscuT0EgbOpLVQxtVdQWy1TKHmKOdug==
X-Received: by 2002:a05:6512:3e05:b0:539:89a8:5fe8 with SMTP id 2adb3069b0e04-539ab88a739mr5370229e87.29.1728248482864;
        Sun, 06 Oct 2024 14:01:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec84cbsm607151e87.104.2024.10.06.14.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 14:01:21 -0700 (PDT)
Date: Mon, 7 Oct 2024 00:01:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add bluetooth
 node
Message-ID: <iwogtr32psjodarzztwpq67vvhdrrb74lnrny7czhwj2h5i3qn@3anogqdwsbfi>
References: <20240929112908.99612-1-lujianhua000@gmail.com>
 <20240929112908.99612-3-lujianhua000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929112908.99612-3-lujianhua000@gmail.com>

On Sun, Sep 29, 2024 at 07:29:08PM GMT, Jianhua Lu wrote:
> Add bluetooth node and this bluetooth module is connected to uart.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>  .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
-- 
With best wishes
Dmitry

