Return-Path: <linux-arm-msm+bounces-39193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E11679D9688
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 12:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E960B287E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 11:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142FD1CEE8C;
	Tue, 26 Nov 2024 11:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TKBV0blt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465ED1CEACD
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 11:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732621773; cv=none; b=ugY1SziK6pRh2+pt/ncssRGYzsPMjZqFZ2LZiNlg7kaciE/3u0MrZizrQcnMp4cnCzcUotDFumM6G63f1m10ui3AzLiqVcdPRIZ/UprGzYfvX+7CDv5lojFa9lzwHxrLYXwWfteOln854+ZmNI9ei1QfGy6u5Fk/qE+GsQ54a1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732621773; c=relaxed/simple;
	bh=DWw67zE2lJp2DCEzhU+vtzbe6cSTq0sENaYdnpP0uZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbYGetaYzXhCGzWX6P1VpWZQoRNUlso7xZZY7NH1VT3pOveI1SpC6/RpdbSCT0PB3M5dZ+bkrWn2TLDaOu9FppQrVFL7EntRPPkfJCw1TVtHc/oFiNtUhZCSOL75Wp09i7QWipiMDo8CYsBnu6sLeQQDoqwnQMLdF/KW9Q+gowY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TKBV0blt; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffb5b131d0so31400811fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 03:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732621769; x=1733226569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J0808uU3LOgHtR0xR0Opk5zAIVpmbB5OAomrT6pxSII=;
        b=TKBV0bltDmspAG7iSS+w1kD5wxJgo/T5eqP1+o0DirQ4d+PtiBVJ23fu5RT6+Q+ZtK
         qob4kY8VWuAPkFvSBL7Xmbfj4mBN+amw+IturHQgPDbp2keJzN8LQazsucF5DOsAo3Jh
         3OnzuSoISo/USTyrnXfz/TR7m10c7y/zXPht4nx4ZT6bICj3xOJ7hDF0fOlmbjedh9X0
         YXhkhjBpvzpqnmOL+DPk9LI9g9WP1yJBuU0wEsvO6HBX4TPtbF2tTu4td1tV0IAtYZNZ
         7yDKrL1nNiqjdbyBh8NvvRTAtkhB7YQrSwzXYrplOz7fOcvCB8VFIpAqwy7KdZPq7LGm
         1Kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732621769; x=1733226569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0808uU3LOgHtR0xR0Opk5zAIVpmbB5OAomrT6pxSII=;
        b=fJ2jIWzlftbOvXHA5s9Ya04OjqlAwF0qzDS11/x3XCZeW8ErKYz+0d9BAg0TSdUY7S
         G5bBL872fyfAykzhhuHXn3BP80quUvxiLVKqt0oh+8Vg2mnMlGiCQOJSGQp1yrncNlRZ
         ZHj5axAw2PEuzhgBkqQWB4mCN/3Y88WAcb0SXGw3UYe/VA5MrZCCfHibg7Ay2fQ4ykwZ
         sgwNbcaoIPEd+98XmRYI6D3RPgvpHPnfuNo4lJU7T1OL7hFd3N3RKvs//u29588uEHoi
         cHl8VYZ9vodNMrHp99CO+25GZai/YhBTDBi5wgOEWSMspZj7/QKyktuPpuRoDfhMl0JQ
         My4A==
X-Forwarded-Encrypted: i=1; AJvYcCWaBNjgBxIyDbMWpZ6XcJWf2p1/KL36dmurliJnDk70g/7QhXNukQkXyZQnhPxVf7VMJ9gZ9RfwBGHgkhVg@vger.kernel.org
X-Gm-Message-State: AOJu0YzaGYm6s7kA7xo6HaqTCYOxhVmESkDVXtk7fqq+ctzkXCXXEHTQ
	qE9RWH1CS/obBq2z6n86Nx7YtQcjDzmSFCcVndIekCR6k27D/xAm7mv8IyojV2I=
X-Gm-Gg: ASbGncvNc3JajsDMexyDFEC85WDfCUDqFKNSq0tEHgjOQNv8Mh0o8vmZk0Tuioqc9A+
	Q5pA52yx0S+MHqvFJfwSiibEuR94MLI6i/s7mCU4xbB9JfnGP8XFjxuKr/PuRMsRXbiZTQsnwsM
	o1zs76ZxJfc/K0nwYwvzDLgbiKMSdTrQeZb6QhCSB8cW05u3+pWiu7k3xCydTzwXib5EUegF424
	J0hrcIsAXqJ7teGVJEF9OUAyVpwy8MrXzs3xtViTt8+0nBVo0yCK2Js+mfhTZ1s+Q9c5rMH+ysk
	gduOGf4i9QY7CSzvdAl1eZn8HOFdrg==
X-Google-Smtp-Source: AGHT+IEU7idZYH7tdB8+JrK/IxXdtauSD0OGplAdnzOdck3dh+fzMnfl7OJHmYrF/am6b8KRWcNcwg==
X-Received: by 2002:a05:651c:984:b0:2ff:c6cb:60ba with SMTP id 38308e7fff4ca-2ffc6cb62c8mr38677691fa.34.1732621769421;
        Tue, 26 Nov 2024 03:49:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa4d16f9bsm19527931fa.19.2024.11.26.03.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 03:49:28 -0800 (PST)
Date: Tue, 26 Nov 2024 13:49:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8550: Add 'global' interrupt to
 the PCIe RC nodes
Message-ID: <f2tmdxywunlvyzr22f4uxh7yzha4i7azls6ssw6s3x32w37svl@f6pxwi55y7tt>
References: <20241126-topic-sm8x50-pcie-global-irq-v1-0-4049cfccd073@linaro.org>
 <20241126-topic-sm8x50-pcie-global-irq-v1-2-4049cfccd073@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126-topic-sm8x50-pcie-global-irq-v1-2-4049cfccd073@linaro.org>

On Tue, Nov 26, 2024 at 11:22:50AM +0100, Neil Armstrong wrote:
> Qcom PCIe RC controllers are capable of generating 'global' SPI interrupt
> to the host CPUs. This interrupt can be used by the device driver to
> identify events such as PCIe link specific events, safety events, etc...
> 
> Hence, add it to the PCIe RC node along with the existing MSI interrupts.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

