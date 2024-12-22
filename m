Return-Path: <linux-arm-msm+bounces-43062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC299FA3F8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 06:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E937E1885308
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 05:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC6951C4A;
	Sun, 22 Dec 2024 05:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oWUCOYrM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319C020DF4
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 05:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734844119; cv=none; b=PGWjJiFt77E1TJXhzl1ru31CVjQK4B2PHMUuNP7lfafynwtcq8lCTS+0/w+WaBX+m7uuLuSiVXJjmKgoHdQJGjAJzPS5CzhKNWCiRQIMzCAqHBaIY8GUN5+fv50LR1hr1sdLIuvGQmZ9qulE7qxGElH1mHNwVz9l1lVC3bnPcHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734844119; c=relaxed/simple;
	bh=M3BQggzvehW1xb2Hdms5/aPPlKaAydg/firtTy5Vr2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgUklZA0izCJSuFY++BPnw6dxCQ0bLqXymfRx0vKyMFoBDaKSzCYtv/Z9ZFz+z7c9XOtEMLCjfF0AGFkFT7fZXf/Mzj2SoJtJkWlsV7EN8Iy13UBBxf98DDUZdpxeK6J53jKi1wC8VDtWGB3H8DvHN+h4fLk1cHVRq4Uxg9tw6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oWUCOYrM; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ffd6af012eso42133271fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Dec 2024 21:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734844116; x=1735448916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LhIhwXQyWGRA6ZQFZENdZOUdSDFOhh5oAher3TloHlw=;
        b=oWUCOYrMd8Pq9yY93ZOTgyXXoOWEj+vYkZkM2uuYMIq2NZscvREaX5LJrdYmZZGhWa
         ty8fBTog6RzxVJeNSfJCOTLrwOZWNEZtoYpZJdtdBeBylabqkIsj02N3RzxiSKLV7s28
         GWVV3nSsz/8E5fIBHIUh9l2kSyUt86UrM1sSZttuFsSjlg7HJISU1Ebbi5zOzoB6Kx60
         ZWj/70jQTtrDhNvhbsvd0r16HU/0Uc4xfwCKg/0op2cEQG6jIB0n5awIFkNxB2OvFVyh
         ke5Fz2oooC8INXG61xcuM3VLWgLtQyWHx9HONyujl5F5LyBAcWhYAUUzeriF1GgLUcXS
         j0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734844116; x=1735448916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhIhwXQyWGRA6ZQFZENdZOUdSDFOhh5oAher3TloHlw=;
        b=d6Jnn1ZpzKMliaOCcovAz6hA9d2fkV1wS4aSP15U+INl5Y1/uoPK6Ny8AUnLxCZ3/r
         504JBlY7XI53p/G9Bb+POuCxur6Q5SFVciLsu6u2BqP7YyezSA+PK0XdQLLrXUG3xDya
         jVJrf8wHn6Bph9+mN7QVRETwJ+MXwXcVX73Fy7z4t4PDskcZxEIYWBAvkaFv3fEJ1djt
         SU10XS1RUARGn+dnafwGAA7uKdo1WKUDyTY8GpTGRTP9R2etbFTK/b1vsy0j7t/Hqa5K
         DUlFZn9bf2/jmf6cRPAa0UnTVxszR+x7LzMw0+xRNP/OBVTLkvtblxV0dtGcr2mnXsLt
         JJUw==
X-Forwarded-Encrypted: i=1; AJvYcCXCt/5vrpn+ga4ujfTJifeZaM99R7qh9ZSo77PApsCmuDDj9QYeitqJZsYqO9LR2pKCKhkDwKHAD+IKNLQQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5mTSu0VeobUEKrhlZVfKfCcqecQ7VIaSa+dyLM9scT6qeWU5N
	ANbRqmXHTJF86HkaxtT5XrCP37wcMbMeXjMViNbFFqUxkuub0AD0eijm+Oq0PIV2odGDwW0sxcc
	V
X-Gm-Gg: ASbGnctMQzk874eXYerEOAbW2Yf0xOMCWpWIqziRN9UaoPUFSDxrSxN7F1hINRt8TKn
	N4THHHQx6BUaHhw0wRuMb4oceDjIIKkYEBdNKUsiMXOZkX7bOeH3KshwIUQJjsFoQQYrcczIQCP
	YMkpSwLV6HGhInvKoUV4xRsePDOaCPbyTmF791LJqT9s59OF3YBUjZCZQUcKol88YripRSXwS4E
	7NbA/NNbB882H0PbJqc83uR3jiZSk8R5zVpPzyEv06rZPPEmFU/WKn+HkJ6YVEHVaQElzDaAYMD
	KAK+2BQI/Bczv3VCeW7vNf+K6sASkiPCmyBo
X-Google-Smtp-Source: AGHT+IGtW6Kf/rJtLlyncFJjC4GU84ZPSbTV3FNxTfKyH/QwjK+pivG8twNWft7UnKacR2ZRfKJ4Cg==
X-Received: by 2002:a05:6512:6d3:b0:540:1d0a:57fa with SMTP id 2adb3069b0e04-5422953247fmr2247671e87.13.1734844116231;
        Sat, 21 Dec 2024 21:08:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422382fabfsm871452e87.231.2024.12.21.21.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 21:08:35 -0800 (PST)
Date: Sun, 22 Dec 2024 07:08:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: konrad.dybcio@oss.qualcomm.com, andersson@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, konradybcio@kernel.org, 
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robimarko@gmail.com
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: ipq6018: add LDOA2 regulator
Message-ID: <ffwb2sxdzsi62pn4g67g4lysrfrsuqmzz2nvolw6i5fv4l2fo3@7tuh76xvusio>
References: <206e1dd4-7e71-4e84-af80-19a0d448b469@oss.qualcomm.com>
 <20241222044001.266999-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222044001.266999-1-amadeus@jmu.edu.cn>

On Sun, Dec 22, 2024 at 12:40:01PM +0800, Chukun Pan wrote:
> Hi,
> >> @@ -31,5 +31,14 @@ ipq6018_s2: s2 {
> >>  			regulator-max-microvolt = <1062500>;
> >>  			regulator-always-on;
> >>  		};
> >> +
> >> +		ipq6018_l2: l2 {
> >
> > s/ipq6018/mp5496
> 
> Does ipq6018_s2 also need to be changed?

Yes, in a separate commit, please.

-- 
With best wishes
Dmitry

