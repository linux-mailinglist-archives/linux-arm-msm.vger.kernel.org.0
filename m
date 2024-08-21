Return-Path: <linux-arm-msm+bounces-29183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ABC95978B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 12:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6F10282D6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 10:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A40E1B5EA7;
	Wed, 21 Aug 2024 08:34:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E8E19ABB7;
	Wed, 21 Aug 2024 08:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724229259; cv=none; b=Jifxs6Ms33IsKmn0UzBFy+D+G0iGgAcBmnSYF1A2JMRmW7c39ZrYfmBas0gcLYVAmZMdUPhMfxORdRxG10r7ZXAlk0OQIlDGSQappIzSxdp9kRQCXZijdRqJKDmMciMz2y3UJ5N5v9ux47+ZXFVWhuHEHfDo88TTwVElwmU7vF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724229259; c=relaxed/simple;
	bh=e1eh4RWTQXmzJpQzlpw97zHFzuNJIyDb2qWjvWQE76c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+fF5t5v2OyqrgVtZpp2fH9pD0EhKxgy/KoBcwRK30LZIUvBJ4E9gr+ZkxYCIXUizmZXyKnbxF/71UrE00KLbiJEZS72EoMpm6DKxhtmqgyefliLwSt1AiPlYGEl4gik2DneSsccvjrZbFXLAK5QV4k/VzVhEgLb5PbBCia+/f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f3cd4ebf84so50949371fa.3;
        Wed, 21 Aug 2024 01:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724229255; x=1724834055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmNWd07rYI+nm/RXslZ5XPGefcXNyvcX2gW017gK9eQ=;
        b=pCKQURt1bMnCttXbFOjBFTODYLDVPdVg8wVU+aoR8wWbjveb5WAWvDD4H3GbXyFAQU
         uFXAZUx5aEimMzXhUdrsOqlex+y1rdwW0E5jdJ8/HQgEM4xqTHHViFIdaybTYjL9YWld
         thCux2t+YGhmjgOM5dfTlrV2gsITiBi5ArKJjw/N2wPPsEvrMlEKzLO7+Y1Vmn+9orGm
         hox/J6vokhIFSTt4mbBYdNyEZdPaRmFMKiqpwIVoK75OzYNd8TXUa3FOwyNfFt3jcLr5
         1CtICjl9EXwRVNoZcS7cGvAeGF4YYVbm20Me68Ay2WEdO0WdI3Y2ufHuaR5ljpjOs31l
         f2Pw==
X-Forwarded-Encrypted: i=1; AJvYcCU4Fuwo3WEDZbPHXxGb/uawFnIqYkajRoxyxt/tvtrQq7FCHs2wo+sRhoHOuKR2gna53DpoRRo+i4R+Aqiwcg==@vger.kernel.org, AJvYcCUWlOWQLtSBXjDpbi6BIZQ95Q+Fm5oamYDAUr8ycdqk2xp4KVULo7/TE4MIRKkKvD2QUOucvtW4abZhlw1+@vger.kernel.org, AJvYcCV+fzKwKNf0G338OJB2eOtXhVv4yKckJHC+1JXYVf5M6HjVEC1Yd91yCfcLtZlRV9HC4qyRusHSN6Tx@vger.kernel.org, AJvYcCVYPvBnuHUeb5Dpn8ymtzyjGzsocZr7nObRlGKj4FOO98H4OU7w3A95CyvYPOQdPrDDcq2Zr9dT6sTA@vger.kernel.org
X-Gm-Message-State: AOJu0YyxQsoi7GSRJOF7iwa0i4tp/rsbGDvPd1Mdg2sHOU7MHbBsC3kj
	Dsp2j/r9hbX2yfwDufppjuNLTMce7JhLt0GrWqIc8iK5+Ch+KjCW
X-Google-Smtp-Source: AGHT+IEB5vvCSAUn2khAEv938RT0Do8b52SovI7z6QF3S25PSWYf3y6VhRQk+VaYeG+jIEoNf4aorQ==
X-Received: by 2002:a2e:4609:0:b0:2f3:a06a:4c5 with SMTP id 38308e7fff4ca-2f3f88b7b14mr8737401fa.29.1724229255079;
        Wed, 21 Aug 2024 01:34:15 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42ab6e7de7bsm42463875e9.0.2024.08.21.01.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:34:14 -0700 (PDT)
Date: Wed, 21 Aug 2024 10:34:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, 
	quic_pavir@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, 
	bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH v2 3/4] arm64: defconfig: Enable Qualcomm IPQ CMN PLL
 clock controller
Message-ID: <idvuqeb3oqocvlzl5uylsqjg3b4kmrxmpe26bupq76rdffis4y@eq5yep4kgzjh>
References: <20240820-qcom_ipq_cmnpll-v2-0-b000dd335280@quicinc.com>
 <20240820-qcom_ipq_cmnpll-v2-3-b000dd335280@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240820-qcom_ipq_cmnpll-v2-3-b000dd335280@quicinc.com>

On Tue, Aug 20, 2024 at 10:02:44PM +0800, Luo Jie wrote:
> The CMN PLL hardware block is available in the Qualcomm IPQ SoC such
> as IPQ9574 and IPQ5332. It provides fixed rate output clocks to Ethernet
> related hardware blocks such as external Ethernet PHY or switch. This
> driver is initially being enabled for IPQ9574. All boards based on
> IPQ9574 SoC will require to include this driver in the build.
> 
> This CMN PLL hardware block does not provide any other specific function
> on the IPQ SoC other than enabling output clocks to Ethernet related
> devices.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


