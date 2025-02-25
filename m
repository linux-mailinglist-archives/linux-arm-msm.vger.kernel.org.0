Return-Path: <linux-arm-msm+bounces-49213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B78A4337D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 04:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BD86178D7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 03:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE51B244198;
	Tue, 25 Feb 2025 03:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sH69G2Vd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407AA3B192
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 03:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740453466; cv=none; b=jccAxPf8HkrHlSbnwYCwxNqk1I2k9mm4hNvDxaeoUz+XgQfKmZyNPZcJWsF/ReyjlGGs8aB9IRkIkevJRaFNY1VTxcBbunSNKI5wT6OKAQELd/rzWoDNZXbw2ahB4LqCScMBadgIxjciGJX6hldwK06dw3hNXXs6VCrd6H5fAUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740453466; c=relaxed/simple;
	bh=tbCy+DgoiEqp7P0KYIuTrwCALW4WbEtXM2gHBfT/4WE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6CtLBYd/toMcncSDAGTZ5ZB+4npdlLT5hTzHxv7ccxfJ6Yls3v5Dk9gPaBg9Jzam8ss/nmFUnH3mDCT01ugr33pvj3F4N83FySPPUx6HBALVTdrMdl4ZyZgk4DUc/vxYvNIND8mAwVkPWNLYO8W2K7skHBN3SUMAbHHXPvfCZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sH69G2Vd; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54622940ef7so5793170e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 19:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740453463; x=1741058263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8Rx6B8ENt8mk1zd17zD1gzF1s2RlMqc2vCUueRva0w=;
        b=sH69G2VdlqLiGIFCFR3nAQ+um7Pz52pf5q3zAYcHfmf8s4vu6+T0ATnUwLXIX7lsYd
         jjl/itK4fIxqlfAaT7QeZSNpF7++5qGmFgLyVm16byAmmKvFJjJsfp9is3KkkUuBSY4b
         awJyHpLXzDhDIXIfrtMnBRm2m/gWPeb4ssx80sX5RJfVCUJbNqjTYnLqo9IRJJxQjAuz
         uLibC6AoDxu8XT9nlnqz5wCIWE3AZSPsGu6jsLI4NeHZzziEVvWiSc70HBucHh4af3Kg
         jKE9N9qTkkjbFSRQ4LT9V3neQ9lh1bDpzRh9EygiSpwLIl6I0Ga0W9a2NvbqAPtWLS4o
         deLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740453463; x=1741058263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8Rx6B8ENt8mk1zd17zD1gzF1s2RlMqc2vCUueRva0w=;
        b=oKkTOYlSaaszkMsqwlubzl0rq3Tp9TBURdN3YmoOn1tLxsphxxzhpoQ1yZ2mV9hG94
         kjiqpCsu96CitWdwQ05k4Xy1MKx6HYvyLA6sp1VXGp7YenqgmaAED0vbi+WYlCmcNLPq
         VU4/xHHR38cR5yqIKb7qKZ0mxweJi0q5qFfLqUOUzMWf00u5oloylFWRV0OfSU39EdGM
         teAjB+9HEvOTFWWqfuWynrQHD6i4OZvgipJXlOFtQuT8ZlH9t7+VhSs/BJNgHOeaykvF
         7w2qauCC4ALWM00NiIn4L5vAjOlESk07vBa2CWCCd9LxnWlFRlPvXvWyPQrMtOADjFGe
         FQmw==
X-Forwarded-Encrypted: i=1; AJvYcCV0u5tvj3aQEwwxrJWWtGkbi4W9CByauzEhXIVYwu9RNN9BVJlgQ9lSB6Ax8PbdH9uNsOmb6Ud1Ilu2S5mH@vger.kernel.org
X-Gm-Message-State: AOJu0YxDIstLfQxBfCFj54BP0hfO0uyfkNISJwuB3pcyfAO0wmHAqhiq
	EIx2BnRu9BlLtVY5OGtB86UTPkox9qRsjcgFC+6f51dU4bn7MDRnAF5AY7F2UoU=
X-Gm-Gg: ASbGncsDHdt14/IIpZ4nAVNtpfzJfreYdVXvrrV7mfIv1WAxY3q1qBMDQDS/3QD5k94
	OPyTmxJR92SAT0mI/G5nCXIj7RY4BISic2M4g1aWtZvNM7tGURreOzZne+G4zQd21+8PilOzMju
	Qe6/3BK9b+irzk4Vo0pzs96sVbBv+bnVxYI5rNzdfoUebrfn8KAKE6TlpeR1OF0ueifJsCKXmz2
	zju/qidmx5NapC/29VMI4055wWQb1p0JLsA/AProOOY2FdsQubbMr/CAbiaGcevTtTNY+kOHitn
	vTpTM1lnKtt11wIpSr19tMIMDMpIP+aGzp+75GCqv3Eto3DKQvyH/nnTshaoGmbrU6xqtG5A/Ep
	TvUT76g==
X-Google-Smtp-Source: AGHT+IFC1G+Qt1OfzDp64XzP6VaS1qBh0uBCplEpmO2VczKHd5eRQaq8KvOqpCDlmmDiv/XhQqWkzg==
X-Received: by 2002:a05:6512:108f:b0:545:27af:f2e4 with SMTP id 2adb3069b0e04-54838ee8c9fmr6726358e87.18.1740453463391;
        Mon, 24 Feb 2025 19:17:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b25d0sm62961e87.32.2025.02.24.19.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:17:41 -0800 (PST)
Date: Tue, 25 Feb 2025 05:17:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable modem
Message-ID: <osoaqtrqtm3s4lksqmlsimyjsbcgozfo7gzjfmxntdm5mvekch@5hhumagio6ks>
References: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
 <20250222-fp3-remoteprocs-firmware-v1-4-237ed21c334a@lucaweiss.eu>
 <bz3mola5r7v4rs4esmhiticq2ahpkhtwxqnv6nweyfkebszvrp@ap6yn6pvrtww>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bz3mola5r7v4rs4esmhiticq2ahpkhtwxqnv6nweyfkebszvrp@ap6yn6pvrtww>

On Mon, Feb 24, 2025 at 02:18:55AM +0200, Dmitry Baryshkov wrote:
> On Sat, Feb 22, 2025 at 02:00:50PM +0100, Luca Weiss wrote:
> > Add the necessary supplies and set an appropriete firmware-name for the
> 
> Nit: appropriate
> 
> > modem and enable it.
> > 
> > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> > index 5611209dbfa41d7834af7903535ed3e05604ba63..31ed26c31e6ea381a8942ccf569513df3300cdeb 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> > @@ -87,6 +87,14 @@ &lpass {
> >  	status = "okay";
> >  };
> >  
> > +&mpss {
> > +	firmware-name = "qcom/msm8953/fairphone/fp3/mba.mbn",
> > +			"qcom/msm8953/fairphone/fp3/modem.mbn";
> 
> THe comment from the previous patch applies.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

