Return-Path: <linux-arm-msm+bounces-33241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2927A991FD5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 19:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA95928202D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 17:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F604189BB5;
	Sun,  6 Oct 2024 17:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zHyFrtp+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7B217CA1D
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 17:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728234850; cv=none; b=ctL/am8We7ckHhM46ev04UQ7AJTVvdqHs7NqY+/8SxFq4wwieCM7lVrA9LKuwA8EeJtW65uUyOQbJ/N7UHfpoLcrHwskjCMo0+e+10WjYKP7pryvvPDqrZ38EwRPGtpCWHgzx+Q+X03vbivgu5o47AT8lXn1IcpC1B3bv4H8XWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728234850; c=relaxed/simple;
	bh=vE/c0eBlgBjSRIK9Hg3En+da3/L4K9sXrYVyOzJoG9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehtSbStxsnmi2QHA9ocMDHhFoUTt6L25WhGKIsv8UN/28LYA6/8pixQ8dRi0Q3Oe5KfCV3Gq6jsOwxeiss2mOiNSvMp0oL6xSmBF45VM3uEMtPh7vqZ/ORsi/LpH+kKubNrNnxUrPbeOTMK9vyAIuF/a8IKGus0lEAm07qlvCV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zHyFrtp+; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fad0f66d49so54275901fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 10:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728234846; x=1728839646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bNVDlqGn5Sp7MkBgm6j9EIyNaI6m9TbHqLOAff7QDrA=;
        b=zHyFrtp+b4m0C+aIznz9NxaS6q7664JGcjqG3olTrcGGNAiRcCAGg+xyAbRh2wkcRu
         fm/kYQdVxB5sVcF8e/jrosZT7cKh4a2k30axPlrmq39BSIqvYWskLHEtFoVqmP8NF7wH
         Emto3IS2HYCown9Q21rq2es67cWMrH/GVXMwQsilneIRmejL7FvXzSHYLqF7MpeySOcw
         A/XhtSxgoOqsmtS6L6Yx9kp5gMmgPRW58NOKfy7OlubE0e6vIm3fO1/482PYi3FmUSqc
         8Zluvjp8qvt92C9/LIkfKzFL/4l4FuDAKXizjFUqscjjIiFxtNJykSi35QOkCbYFwgXb
         iUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728234846; x=1728839646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNVDlqGn5Sp7MkBgm6j9EIyNaI6m9TbHqLOAff7QDrA=;
        b=K8ljImCNWDq1M6ayAQ0mb40rrthrskO4K2yl68a2HOZVD7szcOt0NCv4mON72IMC5H
         GICUKFlPMGuArRtSIhtCPV97G2GjPCQjDjFcS2DCQX73ixJjBYgKUFB7T/iUx3cgDuiD
         o9uztfxd2hhnw4D0jyFCpSAHq8XpA5+tXPUf92Q4RuR6Tct9XCV2GOJt9hBvusS5CLxR
         w11ApiKIHC9OxPF1dbS7isXjTP+OygD32g1xVML1Ua61z2kLTvL4JJLUoI8KwwSgnMkW
         MZGnCfe0DBdqCqWORnNiutR3Q2hhLSO9cHo+BauN6rGy9RvorOKj2ft1E3sDbhmW8inO
         +9KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVibGh3fLl0ae7TzcpaS/eZS0iAw1UZ8nmm/tYHmPcH2aGaUGxtF5bg7Z052XWYewJvtxcu4nlg66ZFyTwz@vger.kernel.org
X-Gm-Message-State: AOJu0YxT6pPXERGbRAnTPKW5SMvWTw/nIhJZSzJPH99C30I5CipS4z4H
	w3U6oKsfo6rgQPjsgG7hgUfiFkaEBN+a2mQ3DWwFQvqxL0jlsocHh5rFZUaVipc=
X-Google-Smtp-Source: AGHT+IH7FkwRAB1NY9i14h5pPQLoT6hiYvf/0nhxu4F0xQPf5UeiD116JF4Fnr0DeufYi+zydBLncw==
X-Received: by 2002:a2e:9798:0:b0:2fa:dce8:7373 with SMTP id 38308e7fff4ca-2faf3c66104mr29884641fa.31.1728234846503;
        Sun, 06 Oct 2024 10:14:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9b2499fsm5752681fa.92.2024.10.06.10.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 10:14:05 -0700 (PDT)
Date: Sun, 6 Oct 2024 20:14:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/9] arm64: dts: qcom: enable dispcc controllers by
 default
Message-ID: <kwlznlphw76aqzgx5wayh2wodhr2pdbogui7inkl3badj5wxz5@ww75h2zzu42w>
References: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>

On Tue, Sep 24, 2024 at 01:05:53PM GMT, Vladimir Zapolskiy wrote:
> The changeset is based on a discussion about necessity of enabling clock
> controllers, which is found here:
> 
>   https://lore.kernel.org/all/9ac4117c-755e-4e49-b3a2-661e7195a7ed@linaro.org/
> 
> Still on a few boards display clock controllers are kept as disabled
> to follow the intention of having a non-function changeset.
> 
> Vladimir Zapolskiy (9):
>   arm64: dts: qcom: sm8350-hdk: remove a blank overwrite of dispcc node
>     status
>   arm64: dts: qcom: sm8450-qrd: explicitly disable dispcc on the board
>   arm64: dts: qcom: sm8450-sony-xperia-nagara: disable dispcc on derived
>     boards
>   arm64: dts: qcom: sm8450: don't disable dispcc by default
>   arm64: dts: qcom: sm8450-hdk: remove status property from dispcc
>     device tree node
>   arm64: dts: qcom: sm8650: don't disable dispcc by default
>   arm64: dts: qcom: sm8650-hdk: remove status property from dispcc
>     device tree node
>   arm64: dts: qcom: sm8650-mtp: remove status property from dispcc
>     device tree node
>   arm64: dts: qcom: sm8650-qrd: remove status property from dispcc
>     device tree node

Please consider squashing "remove" + "add" patches. It makes it easier
to follow the logic.

> 
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts                 | 4 ----
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts                 | 4 ----
>  arch/arm64/boot/dts/qcom/sm8450-qrd.dts                 | 4 ++++
>  arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi | 4 ++++
>  arch/arm64/boot/dts/qcom/sm8450.dtsi                    | 1 -
>  arch/arm64/boot/dts/qcom/sm8650-hdk.dts                 | 4 ----
>  arch/arm64/boot/dts/qcom/sm8650-mtp.dts                 | 4 ----
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts                 | 4 ----
>  arch/arm64/boot/dts/qcom/sm8650.dtsi                    | 2 --
>  9 files changed, 8 insertions(+), 23 deletions(-)
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

