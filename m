Return-Path: <linux-arm-msm+bounces-41000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4925D9E9101
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:53:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 494FA162214
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 10:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE776216393;
	Mon,  9 Dec 2024 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zCHOHbPG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7C3189B85
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733741629; cv=none; b=j/Omd3J0ESsXxfCafgaFodO8QCtrSiR3OGjfomoUriN3QLbQ11/Q/tFx3L54i8JZvubSsrSeVOwOX3bEjDPwKKAVm/sSR8HimsmTN8Hnv84W1zeSSojig8knJRyUehkb5LxdxWU/c7ZevJ5gvh1Td7bXKngKHGUnPKI43wccFug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733741629; c=relaxed/simple;
	bh=VJe3OFxjYH/n+Js2Q+bcEVuEUQwrmmLqoqv/4AKrmog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaP+wMPcFULLIHeI+RaQ2PRdJ0dROfCKYeXm630ffhGeXKNG5XYwOWNkrL99eSC9HNt8g/Ty1DadH87CVXpVAdcvytnKmWmIYIiUWf1HC1qM7ULlpQdMBgawAfJYD7E/k8y7Hu14Cqg4SobHXF0QPLSe/rw7XqjM27jFkWYAqr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zCHOHbPG; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53eec9021f6so1681601e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 02:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733741626; x=1734346426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zuxxa4msj7g+VEGAF/7cr8B8QGdlor53ZC2L8A5c7uk=;
        b=zCHOHbPG6r7bWn4j42EHdJy6zU0JjyXHf4N0AwyVP9tAJsibwe3R+kSCPNuJKpx7JI
         v03X6DoKASeuYHVnqoBLeJIhaoC7aZpGG6Z5N/aP1LRewijie4A+g4Hz0cueRsZQaE/D
         gU8mQLbTvBc5vW+lqIpkytIsB5tPnQOr2VzJjREGKokqjMA+XongMhw07vhF274MSUPx
         mg6uTveUHOdjeRv79CsIzC5sRLoJlWVCpfXJP6K1XST0AH1YthBB7yY7cxYLSGCeDmgk
         SiTnTAk84sDNS21Rtok962vNrlpkw1dii0GEVj+w7lfdLGpKxfmm43BnYrrUDWHSP931
         qFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733741626; x=1734346426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuxxa4msj7g+VEGAF/7cr8B8QGdlor53ZC2L8A5c7uk=;
        b=OHrLe8xxugWhz8XynkkT8rn3WB7lIlXMY+WHJ6PSw0hb+BsaQ4hf/zsndmHcSlj8Qw
         ZcPCtJFHGM696wj+fAoxH87PFL6WOHQ/7j7z8m5GeS1dnkEKziRhH7MGIqxFaxxLaV0u
         GeXGk7Z3ANAuUbZdN1MyUszbScPN4CVnq8ZoNtl0P4QDqeikNY0gA94nC7b+n3qbOEfF
         PxMgVL+RoNkNEbz8wQvia0b4ZyTOJ4bSXH7IhD9PbFFbWSYS7P97v/YT5AUv6lTN1VIo
         dIHA40OcdtsfbRzGiZ/6AIqzmV454m9tCul8FzsOi4IwmSDQ7sXDs2xiMomuq4ULkkUx
         v1aw==
X-Forwarded-Encrypted: i=1; AJvYcCUBN3X3zsOJ2izLoe9VzaMRRe8xaUmhPG9oLyp4Sk5a7BE1OrY8HN6VPQHCUM2g4paq2gzB2X1xEYetitGo@vger.kernel.org
X-Gm-Message-State: AOJu0YzSAWvgmsjNmfp2osrKy160ptJlfyKTt7llnge1Cm5ozQg/jlH9
	03VRYWAHmecY6r/fSOZ0jmE7UnHGV39e97i8Z7m1/NWGYNRWXgs2ERqeTy4ZDZ0=
X-Gm-Gg: ASbGnctjeuZbzNO4sIPknIghggWK5WsTBsZCB0ckuLG30t3b1wlEceVLjtiJax5Ah3F
	9z+kNZYTfdb1jeeWdveNGJokvN5axF3IhlRf9WhVYxJ1+OdKulEu9g45F+I9F5HsBhKpQvO21AB
	ST7eO5PojmA7RSl4a7ePqvTppFj0poBYhds93ROedwhZg1HJa8WiAF7VsEAcxfp0EcV74sOhwse
	WbEnpUqEBGtpGYX2smHElSSb+fIK3ONw2RjKTx996dzO5QlqUesChuk20OCUBiBbvWAxFdmlBQT
	10C0/aym2JTWvqsl2p0Ywip6/WP45w==
X-Google-Smtp-Source: AGHT+IGt7OXGzTL0fiwZIjrAOU2/hihahldE2uGCnpjjBi748Y2s+MaTsaJJHjw3nMeqmjGyZAEh5A==
X-Received: by 2002:a2e:a595:0:b0:300:3a15:8f2a with SMTP id 38308e7fff4ca-3003a159395mr31671461fa.2.1733741626366;
        Mon, 09 Dec 2024 02:53:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-302226fe9e5sm2863291fa.0.2024.12.09.02.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 02:53:45 -0800 (PST)
Date: Mon, 9 Dec 2024 12:53:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Naman Jain <quic_namajain@quicinc.com>
Subject: Re: [PATCH v2 1/2] nvmem: qfprom: Ensure access to qfprom is word
 aligned
Message-ID: <plemc4swba7ybrncyxt3axxpb3qjbdktfkt7kqt3dqymlusfpq@sfgwakjp7z3g>
References: <20241027-sar2130p-nvmem-v2-0-743c1271bf2d@linaro.org>
 <20241027-sar2130p-nvmem-v2-1-743c1271bf2d@linaro.org>
 <60068361-ddb7-4906-84ca-195e5eb13a0f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60068361-ddb7-4906-84ca-195e5eb13a0f@linaro.org>

On Mon, Dec 09, 2024 at 09:55:14AM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 26/10/2024 23:42, Dmitry Baryshkov wrote:
> > From: Naman Jain <quic_namajain@quicinc.com>
> > 
> > Add logic for alignment of address for reading in qfprom driver to avoid
> > NOC error issues due to unaligned access. The problem manifests on the
> > SAR2130P platform, but in msm-5.x kernels the fix is applied
> 
> Is this only issue with SAR2130P?

I don't know. I know that it manifests on SAR2130P, but in the vendor
kernels the fix is applied to all the platforms.

> 
> > uncoditionally. Follow this approach and uncoditionally perform aligned
> > reads.
> 
> If there is a need of having proper register alignment this should go as
> part of the nvmem_config->stride and word_size configuration and not in
> reg_read callbacks.

Thanks, I'll explore that option. Indeed, it might be easier to handle.

-- 
With best wishes
Dmitry

