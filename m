Return-Path: <linux-arm-msm+bounces-24574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A47791B8AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 09:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F22C1C20F63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 07:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7940048788;
	Fri, 28 Jun 2024 07:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eWDE87eH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA30140369
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 07:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719560535; cv=none; b=a1VYSab4BslTloVnHa9mte0kqzFPGJjWjBIgXcSrWGmk80s1dFoHjvVpgf2kpZ/ILGjkWJhEiHR3TUjP9jY/76kbwSQosXJxG1nw8N0tKtgiAJknRXRqrg7aVfSZ8YLjXmuFSJjp8A8b2B7t3K/RByJnvLw0Voo+94yVb2GDJvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719560535; c=relaxed/simple;
	bh=th+V9j6yh5My6EhP3guWXo/ea8Qg8OvNze7mhEtKnDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nn1ZGD5J20I4oBBExF1vZ3lgwUzi6FVBiwVfFrAq7GvBLCrN8GuZ7vvJrpDj6vEXMMXRkbTkJ38wgoeXlHGdyp6yzlos//a039K8hMHK0Bpshh36lswh13vV4ikNlzyQM3AQIAU6jNogiMEyUyiKOqlvVGZF0Wb7yLTcQVO6Jz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eWDE87eH; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ebe785b234so2614681fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 00:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719560532; x=1720165332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NMm0osVyJZdmOeSmEoxSq8LLZPLRQtI4SNJ5X2YxpwA=;
        b=eWDE87eHvx5krGC3C7tUB9omHfA/XLhn1cMvzPmQi1vtx0QN0b26gihVZQdu9oOiKG
         uA8XNYhVfCmkdRH3dVa5dzzODgRQuAbAhze+O7AlT5Bw29mC+TbJqnikSqhwY9cSj9PR
         bJ8EHX4vm8U3gzpC5wgsPAC0HIBq4243LeDQ2yI5A1lAe79Kn8mLuR34VDViHZfrwIx8
         Sw4Y/A9g+4jPCczrZ7UKJbSNFr10MDnn6uggS93sG4K+zM5uofQM8Ym8Sy9Onww1DBsv
         KZjC3/4b7krGUjkKlbYskt7+CRtZKPeoily8SXGjMxYdzg/q8bOG0XdVNBMHP59IZR5j
         dlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719560532; x=1720165332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMm0osVyJZdmOeSmEoxSq8LLZPLRQtI4SNJ5X2YxpwA=;
        b=ZuIKn+VKFIWNl6FkeL8ukkNRDqj01x30Qspf+FHhDtIIi6sYrp5OAX0xXHhW/Ilcx9
         ez7b4etrRcvuwyhJvH6HbeYcYlrJYW8RFsE03YaRPyUUXMFSghASqCGI8BAumtWBeYfY
         1mDJhsoYq3iIS8mrPakEKui853S890zueito6p3OE9BpOpH9Tku8khgw0/DZPYvcbtga
         T5HqQKmueU2RSCK04X+DD6cjCIaSK1ZREKFWeT3bvE0IMWeYyQVaXZZSveYyJhXsA+7Y
         wB1sP4Ym4jFy7ykOaZ4hGRFYZ12ZuxCDwRbDGbLei8payg35B3XT4tC54+ALEN3P5JD4
         tz7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpRAlSd1XPPGb46/+fOQ1bXWKhLHPbe3Z4jXZPICiu0/7YnWbljRnzNhhF9fah+mm/g2q+4Bwe7r7Pa7ppuMsSWNQv9GJjqtbjhlclnQ==
X-Gm-Message-State: AOJu0YyI9kVsyyygKZNGTskB7ruPjjaJCACIfVPwe15OwAhqDQmSrNvA
	xzvrYCwmCGnAPUhJrtGZZuFwBxPFXlP84RsXJ2hNJfnXG4757WYzraq0qP7C2GE=
X-Google-Smtp-Source: AGHT+IG/qIByI+70l0XfVH63ki8U2sfazMwDB35r0gTgk96nZmuAEN8+w64PQMPGRrqKl8Wn8oYsAw==
X-Received: by 2002:a05:651c:1511:b0:2ee:4c66:6828 with SMTP id 38308e7fff4ca-2ee4c6668femr28264571fa.24.1719560532124;
        Fri, 28 Jun 2024 00:42:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee5160e737sm2091621fa.11.2024.06.28.00.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 00:42:11 -0700 (PDT)
Date: Fri, 28 Jun 2024 10:42:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org, 
	bgoswami@quicinc.com, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org, 
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org, elder@linaro.org, 
	krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sm6115: add apr, its services and
 simple sound node
Message-ID: <nh3e4nfxfm45lj3wnaoqin4vdc7yfru4ro33ezi6tyhasdh7uo@tq5bm5xmuegp>
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
 <20240628010715.438471-5-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628010715.438471-5-alexey.klimov@linaro.org>

On Fri, Jun 28, 2024 at 02:07:12AM GMT, Alexey Klimov wrote:
> Add apr (asynchronous packet router) node and its associated services
> required to enable audio on QRB4210 RB2 platform.
> Also, add an empty sound{} device node. This allows board dts
> files to fill in required board specific properties.

There is no sound {} node. LGTM otherwise.

> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 59 ++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 

-- 
With best wishes
Dmitry

