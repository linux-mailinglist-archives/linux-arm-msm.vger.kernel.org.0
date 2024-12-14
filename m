Return-Path: <linux-arm-msm+bounces-42233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB1F9F1F07
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 14:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B71C516712E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 13:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAA1192B60;
	Sat, 14 Dec 2024 13:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iEfcoWpE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDE417E015
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734183574; cv=none; b=EER6Sr/4gl4h2GLgzJS850TxtgaZU4R3+rqNYssImoLFSBF6WVyNArlMsD/DS2C7bMT04nF0bkWrgVG2WVePB+ylPJs6ARS74IurvHdiX/miyn8IUJDGQoPkQzwFk3Xa3szLiPKEVj6eGwKRqg4SsyE9Mwcge+aYbNYYAvgN/hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734183574; c=relaxed/simple;
	bh=uCCTyowJytqPjeU0yepVW6ZTRMX3ONlee0DNAXnNUZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uebFArBaijgCH31KJQ6YDsRr7Y31j8KHkVmZoMuTy0G6EN1KTisLtipHo7/p2I+5+MFfb6LZ5VIjiKa8JIqtw/DCMZCmZwkZkmZJHtNJOnZms5vy0mFy1p1yw6suNBfUhyCXNNa1sWl8svnWMaVSWjmJttGQ68zidYhJcAa52mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iEfcoWpE; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3003e203acaso23738871fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 05:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734183571; x=1734788371; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PyYLiYc+Kz4TS/e32iRPlnuJpX7Gz5eKbfwdorLaoU4=;
        b=iEfcoWpEi74xTB9YuVx+oaXlc510z+LughYijBiQc41m8PHiJISfTuaJSPaugpVuiH
         /MFfAkXV663Fr86vxeS9aEUiAavuAakOLIvek3kTF3sKCGnG3HQb45lh6wcEwEEgwDNW
         Fw/EYfU0tOwfNuNKRZDPapEeQKx1UbpXHNU11GRnGQvxMxsaqApzxsDyw8l9aaBHpMeV
         nVwLmS1aACTuoRBCoMIKG39N1Yv11Xp0Htnd2fndyBHy9zEKvPSA5fjXS4PbqkDnZb9b
         XyrQjcQ5zJBbaDxYdCBMjDtx/R79Ze5gB0ib3H5qXHNGO0xVXmPSrfJlHzJZVxUUJC/B
         x6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734183571; x=1734788371;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PyYLiYc+Kz4TS/e32iRPlnuJpX7Gz5eKbfwdorLaoU4=;
        b=Hy3hFQDq3oM67hR2cndz7JXl2Lf4XyLjV0KBSNsMQdJbY+ZRHCCyxY/VUPE7HnJh/c
         80Xl9ujj8XyBxmWAOt1THjgyc3Nuk7on/AzHGCxzhnyioJh341EhX/YtM0AwUssdm+Z8
         zV8cYLoeMTefLpnxl0NKWMnuGXKJUXUBe89cHB9UlfcrjpNZlUpZrsqL7YaDck4gtzgT
         dPTt04nvYw8NjD3r/4hMbtxpOis0+NxW7p4/9siFJprZzf9GFX55N5WPtmh+Exmb8jHq
         uLXXd902oXngOxSwhlccRjtBSaBsgzfhExOaNvV1vEFUSgcPoTDJ4Luwwj5M9+yj2PAw
         78AQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+PpovSaJ0Wggmf+yjqpA67th8RKL2HJcdEUKa0hhR1+Fls59UTjhpjbE7mvAgLYVbNRfsNdozBjcoBVUk@vger.kernel.org
X-Gm-Message-State: AOJu0YzF2ypqTHXmaIC1u5W8xylZ4LuCrHGYP1Yfx37eh1xdqpR5Ue/6
	Z3w7UU7VUuRInzYcAZw2YOfv+2BwhaV2e5y1CD3ryxGtuCSSr3IW/E87p6vWjx4=
X-Gm-Gg: ASbGncsbVD4zYTugwxOGX2jsZZe0zKCVRdXVh7VwvOPzLV1KwyFLo4AdLWBPqHrujwq
	ecOvoctvYQ9/q4kTRvJmpfGDSKC/6MCFYYFZOZN1T1t6V5Ar6btzKGFM5Bd1M8TKRm+EfVbyr4r
	5omh8r1h0kQD11SK/vccdZEoNEiic95oEo4vhPMkvi2hetYOjM89I5/OETn/yMDvxV7h8MzcUgW
	Pdsq1JZgqxRMBZBD3prktiiqMQZ2BQRLJr+q+8MLpPWIxJg/HhwWTauJkR/l+YiWYz35+wNLYnN
	ZQr7G7xhFGDwwx7AmSdVNQJ84TOETt8bARV/
X-Google-Smtp-Source: AGHT+IFiGcfkBdkpjQAPcZxAxvnDue49Lcam66Ov/sQHEPWgB+rp6vC1TwupJiCBCPo5zIatJCwGYw==
X-Received: by 2002:a05:651c:1544:b0:2ff:d83d:9155 with SMTP id 38308e7fff4ca-302544f9757mr21690611fa.27.1734183571029;
        Sat, 14 Dec 2024 05:39:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344061e1bsm2427441fa.51.2024.12.14.05.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 05:39:29 -0800 (PST)
Date: Sat, 14 Dec 2024 15:39:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: andersson@kernel.org, chenxuecong2009@outlook.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, gty0622@gmail.com, johan+linaro@kernel.org, 
	konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org, krzk+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go
 (sc8280xp)
Message-ID: <lwhell4z72srw67gj6gpt2uyqzx4k5dzjw5xs7dab6lbya7soi@tsoh2bcn2gwc>
References: <20241213085100.564547-1-mitltlatltl@gmail.com>
 <20241214122303.653935-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241214122303.653935-1-mitltlatltl@gmail.com>

On Sat, Dec 14, 2024 at 08:23:00PM +0800, Pengyu Luo wrote:
> On Fri, Dec 13, 2024 at 1:13 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
> [...]
> 
> >> +
> >> +		/* /lib/firmware/ath11k/WCN6855/hw2.1/board-2.bin
> >> +		 * there is no calibrate data for huawei,
> >> +		 * but they have the same subsystem-device id
> >> +		 */
> >> +		qcom,ath11k-calibration-variant = "LE_X13S";
> > 
> > Oh, this can be taken care of! See [2], [3].
> 
> [...]
> 
> Hi, Konrad
> 
> I want to distrub you again.
> 
> Finally, I found something, after I enabled ath11k boot dbg, I got my
> id_string='bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255`
> 
> With qca-swiss-army-knife (see [1])
> 
> $ ./ath11k-bdencoder -e board-2.bin | grep -i "$id_string"
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255.bin created size: 60048
> 
> It have already been here. So that means I don't need to extract from
> Windows. I just extract it from linux-firmware then give it a variant
> name and send patches to ath11k, right?

No. Usually 255 is an ID that is used by a variety of boards. So,
basically, you have to extract board data from Windows, add a proper
calibration variant that is specific to your board and then send the
resulting data to the ath11k mailing list.

> 
> Pengyu
> 
> [1] https://github.com/qca/qca-swiss-army-knife

-- 
With best wishes
Dmitry

