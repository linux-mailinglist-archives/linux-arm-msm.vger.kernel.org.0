Return-Path: <linux-arm-msm+bounces-22988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E4B90C8BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 284C11C20FDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 11:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D981AC223;
	Tue, 18 Jun 2024 10:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zA1AtdkZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4165C158A0F
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 10:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718704822; cv=none; b=hR8qrOjcRSaoDU2zUW8fhH6clKkRzr0wxRjR8yQsLJ4aR1wjGLU1KDywe2qGvjHmIl2lvuuAOv8RAjV5r+2+SXveNckoE4630xviWT8nn+9kHogZp34zmGJ7HZTdMuyuJazhGywc2wotwLjM1FS6PorEEyHkPc5OMkCfdynYV1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718704822; c=relaxed/simple;
	bh=y6CpY8UrSo33MHhP8FCh1QwnMKQUwodzy+eoAoT19Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNN9UXgc74WrJF+BCDFCnUnyxn+eGDQNrGqoTObAbWPE1txw0cisX4Hqed4d/0nbKmho6vUDgaj0ullVLhh+immrlsZI6wAHdcLu31ykNWqDWVT7yhAnoknDTvJXJ0t3AO/cfje8SVFO2I67M8XYsLHQr2dRO8uDPUZjJ+uLs6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zA1AtdkZ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e72224c395so53824091fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 03:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718704819; x=1719309619; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ngIQn+y1I4/dZZwfy/zLsGesaWK/7P8e5P4qGlNeiQ=;
        b=zA1AtdkZhx2yBvP1fm72nvd4dFGaNMrQ9F95AET8l4nk0Lo3DmGwbQ0GNTQcZLNQx0
         aLvPU+eB/wIdloH6ziBM1627lX+zB3zk81cS0vbEJApmX6VZvGQgf4FnKxG0ywsZmxLF
         vpE9lPX3i/22liIUwjWqkZL1ZwTIZrA9+tOVN80Idl0Oxil9xPfOOzMELfFdfs3ZX67N
         GS0nXxhD2wBHeHDHRydxcXzM5wZ0u2Su/lDXRmidAo1RS5E/9AxPs2Nj+Dtt7yJJGt+1
         a9w6Wh8Cq35OGNPa6ZtIhEyv0KvgYZNawpfhPEyUrXicha5Jok1nGea9UkzgywsuP9+C
         bwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718704819; x=1719309619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ngIQn+y1I4/dZZwfy/zLsGesaWK/7P8e5P4qGlNeiQ=;
        b=jpG3tHTuF3MqUdlFe9SVIUWLJVFgL7n+JaTnp6PLlsLGjTHpNSxl6mDkC0xkA+KqWU
         yevdoFSspfiOsg6qYLm6MKVTpezZjTx8L3yPc+m/tN4FNERNZmmEZwlmYyZmqcoM1VJQ
         ojOGBZDDtcsiaOihCAYl4mE2lNqnFLnhSENOXudOTeTgdPohqw0q0trZR6JjmbThPd3N
         hcJydGBhGLKeN3XcweqmHEW4SPB5SVsUobyXUQLITctitPvvJ02dAZqodw3wvDnUs5vj
         0gGShPP54eQbqSPORXtr1Gu14INRLjAXVNZc32r1EAIfqeG8bsP1w+jYHZSj/9hi+Hyx
         Cnog==
X-Forwarded-Encrypted: i=1; AJvYcCWlbfJ/26TiDw5ujNLz9mMsjUno1B06U0dKtnK9VK2Qq/n6w/BQrZ1r5OBhMCrWfYTiFQp40MYBoy7tt4HZZ20EeMo89Zfh2YraQhqccQ==
X-Gm-Message-State: AOJu0YwC3YrBcC69UAhTcirxuceir4JkB13sQmu0BDS0FsPONWOOZaVA
	TJ55YbH1hBcwNBTs/NYmSMY2kXTno1A+MOFXkQOawzXitPWCfdjFFKzZsQBw3Yw=
X-Google-Smtp-Source: AGHT+IH7rtbQgMI/Xpi2ruQ9UrqNrldQoq58i+N6rvWxQBTuiDOV7XZQFcZOb2BQcHFO++Xy6iKxXg==
X-Received: by 2002:a2e:b013:0:b0:2ec:27e6:39b7 with SMTP id 38308e7fff4ca-2ec27e63cf0mr46551291fa.37.1718704819326;
        Tue, 18 Jun 2024 03:00:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05bf41c1sm16556731fa.11.2024.06.18.03.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 03:00:19 -0700 (PDT)
Date: Tue, 18 Jun 2024 13:00:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: qdu1000: Add secure qfprom node
Message-ID: <uur33zdu526onphnxjtj44mijrj7ykfst4ninrtggcloj6youv@vrdvdd4esecu>
References: <20240618092711.15037-1-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618092711.15037-1-quic_kbajaj@quicinc.com>

On Tue, Jun 18, 2024 at 02:57:11PM GMT, Komal Bajaj wrote:
> Add secure qfprom node and also add properties for multi channel
> DDR. This is required for LLCC driver to pick the correct LLCC
> configuration.
> 
> Fixes: 6209038f131f ("arm64: dts: qcom: qdu1000: Add LLCC/system-cache-controller")
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
> Changes in v3:
> * Addressed comment by Konrad

Which comment? Please be more specific in changelogs (no need to resend
just for this issue, just keep it in mind for the future submissions).

> * Added Fixes tag in commit message as suggested by Dmitry
> * Link to v2: https://lore.kernel.org/linux-arm-msm/20240612063424.2494-1-quic_kbajaj@quicinc.com/
> 
> Changes in v2:
> * Minor correction in commit message
> * Link to v1: https://lore.kernel.org/linux-arm-msm/20240607113445.2909-1-quic_kbajaj@quicinc.com/
> ---
>  arch/arm64/boot/dts/qcom/qdu1000.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

