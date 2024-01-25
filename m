Return-Path: <linux-arm-msm+bounces-8233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 230D583BFB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 11:56:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D00A0287EC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 10:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CB061687;
	Thu, 25 Jan 2024 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a9uTMdnc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C3C1CD0B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 10:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706179482; cv=none; b=Gl+ojGEPpTk+lRk3uK0ORTYSdhshCxc+zcgWFXHGPHxfn93aIaRTZ/XiZDDmegCnLwyiAoj9tGXECHV8wVA7nmb7Ion2vvTJnHnsR7TgpN5GltA+JctIUsPliWj9DRF0RqjoRKmhFJWr3mwOuUJPdqjQO0oO4JBRtQzjVMWYDg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706179482; c=relaxed/simple;
	bh=yT1mRF6XNlXaTfuWIVMhLXVcISTzbXHuEXNJEvgnJqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVzV5RVB0PSOo+I9W14JQYfxOt6BaoPZ1TZMCssg4YDsNSPp8qt9Ro15TC3ulNK9rKSgVv5u5tKr0uf+qgB2qBFesXD7BUzL3KEBW7PmQrg1Jf+Mw5hjBnSIOjU6DZtM1jFK2Hb2dKdzLgezC+pCwqWWqdZ4/5KZtXIwIsiiDy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a9uTMdnc; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-559f92bf7b6so1239446a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 02:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706179478; x=1706784278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DP1TkMGJCcP03wjm/2IvbB0Zl5zG12ipI2nSUEb0ViM=;
        b=a9uTMdnc5HKWIM6ieliulr3BHXgwysfjW028gwnVeVZ2qZr/U9WbCRnWbjzVmumKHA
         mwwl/6BtHFs8tJkhCDlVStk03+ffHCejCwK3uw1Eg4+C0n2LXJWDd5efWjsH9BzmGgKR
         1j3C2xEmSDvDKxc0OeI1Nirkva/MTPpbIuXA2f+6741zGkWVYAoEjTyNSG3hLH5opRMe
         PN42Gx3nqxXQ1ny6h2JHIFcR7AhF09r8rmXhE/l6LzNDJ18tOyYL3d/y/GNtIP6EHo5T
         dMwmqiaxhT3DdU4LNdD08RMDtF9xwaBadNSxmAMY8jkWnTzxoIPojryIacOGZn2xwKHk
         2wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706179478; x=1706784278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DP1TkMGJCcP03wjm/2IvbB0Zl5zG12ipI2nSUEb0ViM=;
        b=KA8nPF23aD/d3Jn1HHYf5g4EqfqCS7ndwXXWnQuz0fouP+AeS9yxE3tRep5xbabwMm
         cOufTtUglLRL/833I5i1Le1DCwOme8Q44BWEr+dVcFhIlgMybXCswRa3kfnOVH9YlfOK
         1Q0DAcF5uBYkKaUhXrjU2fxv7LzneGkXojzmHrRSKkBze2fYeVnHrEkJRSW/qH6Kzop3
         7ScfjXwvFpgzAXoAGuQLaXl7lrkjm6YKLZ6d0LfLh2oZZAGQimN6xQiOIHtQaL8Pv9Oh
         XtacTwnNN95Sy6E1upC3YMGdOdU7W42HTpq/0/O2w/PUW744kkSyOiQX5OmPHgYlnjAI
         d5Ng==
X-Gm-Message-State: AOJu0YxjElkyB+7mxc0Jaz1uRI8AKDi/foTh/z185ODd+lTJkKlfY8+/
	4kSFZdJCRUrxXH9yCqO0P34vAeCu255+yvTOsfPUfESZcd/TkytSDS9Ihf7w4RQ=
X-Google-Smtp-Source: AGHT+IGG9jiccgy/B1Ja0Qj3GOeWRI+vkQ1p7kjIJbpZvMUF9eD/sku0Vq25Up2+hLJIJLvcnhGwEw==
X-Received: by 2002:aa7:d857:0:b0:55c:feaa:aca4 with SMTP id f23-20020aa7d857000000b0055cfeaaaca4mr661597eds.9.1706179477838;
        Thu, 25 Jan 2024 02:44:37 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id ig1-20020a056402458100b0055ca5ce62ddsm1760685edb.12.2024.01.25.02.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 02:44:37 -0800 (PST)
Date: Thu, 25 Jan 2024 12:44:35 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] clk: qcom: sm8[56]50: Drop the Disp AHB clock from
 Display Clock Controller
Message-ID: <ZbI7k+bDy+KSmncq@linaro.org>
References: <20240125-dispcc-sm8550-sm8650-drop-disp-ahb-clk-v1-0-0f8d96156156@linaro.org>
 <99817149-4a2e-49fc-aedc-fe298964a019@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99817149-4a2e-49fc-aedc-fe298964a019@linaro.org>

On 24-01-25 10:49:23, Konrad Dybcio wrote:
> 
> 
> On 1/25/24 10:27, Abel Vesa wrote:
> > The Disp AHB clock is provided by the GCC but never registered. It is
> > instead enabled on probe as it is expected to be always-on. So it should
> > be dropped from Disp CC entirely.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> 
> Abel, you just raised some concerns over my series doing this and now
> you're doing the same, plus breaking backwards compatibility for no
> good reason, instead of solving the problem.

Sorry but, during the off-list discussion, you convinced me that it is OK to drop
their registration as long as we enable them on probe.

I've not seen the following reply in time before sending current series:
https://lore.kernel.org/all/6aa58497-9727-4601-b6eb-264c478997c3@linaro.org/

Since this is blocking the patches for dispcc and dts for X1E80100, I
thought I'd just drop the clock as required from DT point of view.
But yeah, you're right, it breaks bindings ABI and that's wrong.

> 
> The correct solution here is to register the AHB clock with GCC and
> pm_clk_add() it from dispcc's .probe (and enable runtime PM on dispcc
> if it's already not the case). Then the AHB clock will be gated when
> no display hardware (= no dispcc consumer) is in use.

I agree.

> 
> 8[56]50 are in a good position for this, as they already have the
> required DTS reference. Unfortunately, I still haven't fully dug
> into this for platforms without one, but that's on me.

Since I need to do this for the X1E80100, I'll probably do it for the
other two as well.

Sorry for the misunderstanding.

> 
> Konrad

