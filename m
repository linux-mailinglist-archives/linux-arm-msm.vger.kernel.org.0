Return-Path: <linux-arm-msm+bounces-39122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7509D8AF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 18:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C7941686BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 17:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21B71B87FB;
	Mon, 25 Nov 2024 17:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ij2t0Ehl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AC71B87DE
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 17:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732554280; cv=none; b=KNA3FpxuhwPXr/Cq+2a39R3/W2vnGIe/iAOUL6DQW/gFuVqJsIl+An/GYAnY4dY8udpORifu8fgoxKXr/4rC7L/r9l57PI+R/NljWqKXJzp77cWmbDuH/0JY0cHOZphk084IQI9NQOCEV5NiyYaTsQK/xHdkeB5RB/4ihpdtSgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732554280; c=relaxed/simple;
	bh=/Cs4hfj9obntVomONyvV6xiN7rgE7OfVdzENAMostJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lpuvft+45j+OA/ZsXwAuG8W2VUHADKjmcp/3dvO1xRBdaQJbXeyH8asVyCiadkfiBXEdC9kpdT/P8NqzgwZzVHhxpUHlCYOOmN6BFqhQb5SWOYcFslPfl9uJK465BdwEREQYhK7t9E2SQ5kgtdEw/LMfGd1QLEdCR2Ebspaj7jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ij2t0Ehl; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so51685701fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 09:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732554277; x=1733159077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FOqS7XycPVasCpLUmsgPysaSQK/jkK7vxYxhUtuGR7k=;
        b=Ij2t0Ehl9Zljn86ExxgiSFiNxYrI5HuIEjRtlouGz4ERFzf3PoS3LBoZv4f0RGoeAM
         qSJw2gmPvITWt1WeNVLdLpg5TDDcgsKpoX96uVGRzAcdWXOnHa4JUlqa2uYjLwHYohj1
         iHF5pIkrAMOZ3wcq1FBdEmeoQNahLK3O3nxHKMPzaIY9PZtfif9ZiCUUh14IoA5mnp9+
         zUOBG9+ODXlmAbP3lIoghprd0a929dZPXjbumSuOquB+7YcAZfRnPqmZKedJcbKaoqWk
         Q4PF1/42ub24pvRJ4BDrh5jW8MU3pYt1SHl3Q8udYkd0XbRZHU1JFW0TYyJyXoOFltpw
         Hszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732554277; x=1733159077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOqS7XycPVasCpLUmsgPysaSQK/jkK7vxYxhUtuGR7k=;
        b=tEIJC5nBgBqk1w5Jy/NupyjwPgz3rCTRAF1DA18xzcjclxx/1FG8Z0JNghS/q9Fq3u
         28RoRgwQPj7RBlgRuXFvr3y6Fd2Cr5aYrxppfVMIxjTkIc5bHwCk4ygXY3tSwkhUpcaU
         eJj4v3aTBzQAif0eVm2N9ptl1GD7ajiLDTjiloeYkhRI1p/dPx71s/dGI6H4RusxpM82
         rbm932sksOVfUuhU0bQo4BjatBFrV2DvuajqHyDCTnX0TotfE0Iyx5vIsvM163ZjA4M6
         Gm8MeSOMgK/nnZPG5i1yozjtgMjuKNKPXJgBhiZYtFK1Dvx0tk2cmhsFU2Fb0DvQz/6T
         QxgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV36Mh37RV5L+imMNnzqcit51dWV/U1SSE3TzCEaRiaXH7CQ5U12kqrjNDeOlrW1bx2+eDsNMJdY3Yihrc@vger.kernel.org
X-Gm-Message-State: AOJu0YxgVU3HzA9Fro5sN1IWhyRTVdI6YPOfPJKOh/WzHuQ3g+l4CQns
	ejE60GwBt1Q0ffGPFM+VCql5IppcgiQ4/fvfyIIqxPdSW9rXu08ozjzGyujbygI=
X-Gm-Gg: ASbGnctimFFScnqAk3YOrLZl77oDlaEDzI0DDWmJi7DOt1Fp+GS36zWFRQGIQ9sVlhT
	WaSLwUKI4i8KnIoAGxMl5pEonc0O37By1JixseXqu2KSoactj5Ypok1QdpWWSqMaSBUZVKPrITs
	KxWdMrwr4qyJKKE9H8wt6hEybcfxnDUoDlXYXhSyiHuihZFIiDNXTOW8W9/V82LzgyGO8+qclak
	VBnEIfdBG9GBoqnrl1Q2uj+o9YW1ov4RQA7CdXG/Yq8KjGHLp1z9YyfgHjKlZd0ow7M8KWybin9
	mY38jMBqlEkJqYCVHdZRb8DffPqFPA==
X-Google-Smtp-Source: AGHT+IHAWOCIhn3v6jdT3oe9Kgmdlf5AUqH+NzlAaOE4/2CkcMdsXewmUrNDNbExMP9HdvEzf3cYWQ==
X-Received: by 2002:a05:6512:1252:b0:53d:e397:2ddc with SMTP id 2adb3069b0e04-53de3972fe2mr2227535e87.5.1732554276908;
        Mon, 25 Nov 2024 09:04:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53de59e1ea6sm283947e87.53.2024.11.25.09.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 09:04:35 -0800 (PST)
Date: Mon, 25 Nov 2024 19:04:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 2/2] arm64: dts: qcom: qcs8300: add TRNG node
Message-ID: <ulzzcla5vkwil7bs4himipguovx2yegp5k66ehornzmzix557g@wlglv6up5ey7>
References: <20241125064317.1748451-1-quic_yrangana@quicinc.com>
 <20241125064317.1748451-3-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125064317.1748451-3-quic_yrangana@quicinc.com>

On Mon, Nov 25, 2024 at 12:13:17PM +0530, Yuvaraj Ranganathan wrote:
> The qcs8300 SoC has a True Random Number Generator, add the node with
> the correct compatible set.
> 
> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

