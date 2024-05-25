Return-Path: <linux-arm-msm+bounces-20476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B33E28CF13D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 22:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D7CB281947
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3BD12838D;
	Sat, 25 May 2024 20:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U29I8WCE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9675B127B6A
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 20:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716667951; cv=none; b=FGF8Jf+6WgxBEedLazcgE9JeDw02NYKQqVeApMhOZTfK+anwuKaNauGCS5BDPhhjgROlkSBfE05cGNk5XK+xVGQOlkGqJwW6O5uTDX3bkFCkWsDoq21YpBbCdkESZdGHmgVLnl0vcxZq+yT86abD+5RilPg7TkS0j8EPUsMn8SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716667951; c=relaxed/simple;
	bh=t32+BYEdFdm8RxICBn6Etujr+udUrtOVolvHKwANZww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgrQ8XZlR6DWHkIVJxUgW5PiYCpNO+ZarUGcZwzv6ITeJYgyJRuMw+2sX5wGID4MoFSI/4hNK9nupFVBI1b6tsDFYYb81hB9DBqJKjHvmEQWrsv9hCVohVhSZV4aSVjKEn2YEgMAo1w9TKTgYENIcJCZokIBaiNSPL8hZUBabbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U29I8WCE; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e95a74d51fso32233301fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 13:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716667948; x=1717272748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cfUxVr8crw2ZUzJSJFucQubqbnPhxtTufTMJKMuPKJA=;
        b=U29I8WCEpUoxXPZQMSDZhEFLbD8My9WlPUT9pMrrcyOCRgl7Rg8tg7Nu8r7YyZd+ef
         qJwz7Ih+4IOnKHo4FfA+F//teB/WdV1swoa7J8KlTHCJjEBP3HIk6nh64yI4KfvihJjS
         9tl0Au0OLkt1jVCxP+kcLScJQt7/2e+UshV+bB/MuK/ZkckXYl+8Pr3WOSivp8I2Sslf
         IsJcA7dRlFpXnnnJQwna8o3S2NdgRQ1aruEo15OQGhpkeHv5SYSkVPXPppFXvwwmAivu
         Y75Mc5g27vi/DrExh8KzjfC5IXGgFE00JN/RFbPonaEIaZFfJxgtWFUN82Ixtk7lt45h
         F4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716667948; x=1717272748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfUxVr8crw2ZUzJSJFucQubqbnPhxtTufTMJKMuPKJA=;
        b=SeVyoy6Wa9mLR9pKQBUJvW7IRcI+s3gY7swXlp9iWQWI77XdxoJTffJHl2LHvs4dyO
         KiyozvsoaLC3PZaSl1nO9JvmuAg8eX46BuG5lyiZLax2K0GV+/qsHK430Hrh23VcNUgm
         BgXXnWUOOq+6w0N8wfy0Pbsh2mJEfl0IHB8F/qpEg7HSnPjpetvjGn0BKU8LfQDv54p1
         Bf0HaUwtkNMzeiQDWyGX3P0X2uxfO8QzYzupEYn1D9Bax0TnDdS5oHvzH5KON1G6fcS1
         RuIMl5a6XCp9NJGi66NCHbz0JPGwNFYWcvxdg8QWTWXY9Pvcv8NL4DTEjOHyWN40wv4q
         sJpA==
X-Forwarded-Encrypted: i=1; AJvYcCXxrg0RSHk/s3CwWILOq0ecR8VnItNYTu2EZw+DeqhocLeQvdzzvAE+MwfmQu9wb3hJqZIExfgHAD48O7u2WqZb275TZId+A0hMYh3gJQ==
X-Gm-Message-State: AOJu0YzzSV8cHfWqmp0L4LUVnc2OUmTMDlEHw7KojUEFQ4zYHmy6ER5k
	Js7t+EPFtkalErrxinbqY04pS9/jZvz6YgqaK1rglo4v8dXS0xOSj2t51csIHMI=
X-Google-Smtp-Source: AGHT+IFkoI0PZaAWya0/NyMZeqpNyosQOZLdjgcIJlweHSZDpSJAqOBAE6pe1lfZw7gEiqC1v9V0Vw==
X-Received: by 2002:a05:651c:504:b0:2de:8697:e08b with SMTP id 38308e7fff4ca-2e95b0c1620mr55308111fa.26.1716667947848;
        Sat, 25 May 2024 13:12:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcc4874sm8649151fa.26.2024.05.25.13.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 13:12:27 -0700 (PDT)
Date: Sat, 25 May 2024 23:12:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x: Correct PCIe slave ports
Message-ID: <q3z4d2o2tapf3vvuc3r5jewwdlvtrzabwtvfkz2ehniyaxnffg@uymhwkjvfu5n>
References: <20240525-sc8180x-pcie-interconnect-port-fix-v1-1-f86affa02392@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240525-sc8180x-pcie-interconnect-port-fix-v1-1-f86affa02392@quicinc.com>

On Sat, May 25, 2024 at 10:56:20AM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The interconnects property was clearly copy-pasted between the 4 PCIe
> controllers, giving all four the cpu-pcie path destination of SLAVE_0.
> 
> The four ports are all associated with CN0, but update the property for
> correctness sake.
> 
> Fixes: d20b6c84f56a ("arm64: dts: qcom: sc8180x: Add PCIe instances")
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

