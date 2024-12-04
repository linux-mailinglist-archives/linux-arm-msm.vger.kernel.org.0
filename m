Return-Path: <linux-arm-msm+bounces-40404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E35809E4803
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 23:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D6A02833A9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FEF1F540D;
	Wed,  4 Dec 2024 22:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jm2oHuzf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B06C1A8F7E
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 22:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733351930; cv=none; b=qF2KJzwi/E87MHxhiGiHcB1Bpy7ZovB9/dw7NaQ9AI6oieku+oufYXggsvkk5mPhsI64NGA5qi2q84avlM2vENZCb0xVJPnsHdiq1qXc6dZqe3io01zcNTFfqvnxbGjaLss+FfSfHAC6XLy3o4/oisx/Xwulv7RUpgzya3/g7yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733351930; c=relaxed/simple;
	bh=KJLX17C7gU6BadOMdJW53aMXiqKx+n3qDA7Afh/ADZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kewmF56gzHdGhM9wO72UYqHXcUBJsJFKSSH4/axeyHRxsU6xtK/Dufv2qz125LoiMszzYtpNCtBqvdREwRIxJGxp2xceV0IISD876rwcQ95eVDcuJYwk6yn5LUvBma7zq5aD4fblXJXXYZrvhiG2fp4wypzUkQWREGlePdoLAqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jm2oHuzf; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so350854e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 14:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733351927; x=1733956727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yaiSwDbrMYKMDUjpZaBVp9SW03Bxx8afy8F+RulJTZs=;
        b=jm2oHuzf3nYE7jMiYdViOm8NedeftZijfUS0qeUayCbZiibU0sfDFT/VUSuCOXXSCG
         hEl9z/R8KfcDwRXafAHCrWOutOhztgh6gdawHpK0p8gJQB8bk9Rasy4hbVLYqVxdnHlo
         ABxWXDR67f1n8deqMHAt9SY4VNPYj9jS1tO780L0G1JfdCuskCkWdomCbDOhRxmtlZVd
         fa/a3RM42/+AzZ8mMwmo9k/Ew+gWW2vaQ1ErFNpX7kVPODU17ioAxwSIGo25B3qil4RT
         KpZw/y+pfwtlRlHN/fllr9E3RynWa51OVIBZ2CjrwibaZiKYBWlXFqvKqgNWYwzfuj5v
         GoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733351927; x=1733956727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaiSwDbrMYKMDUjpZaBVp9SW03Bxx8afy8F+RulJTZs=;
        b=Inv8BhyFe9bUbxnFsW0CAAWAx8rt/EiNLfBclJRL9lwFBtdElUBlo8K4y0CLQEX3Ki
         mXquHFDd/3SwyABr62wkb6NwYtrMxMBmi9gslewEsmKrtTZt5OVArEr+p37bowZlJt6c
         qHn7L5DPTgW40Jf7q+rpLf4KPvrgy86CKv3wMoBCu89n6+olSCq4l266jqD8wMDgVoco
         IHQ/4JmbmdUbvSdCndRursvKF/wZdHHm30A/hR7zDqHSQnqPTuYXh1ppPfYpleV3JyiO
         2Saixz63YhFhgdzjONoFMxk3YxGV7XRya/+REVywDpY7lTws4jSKyEUHQ0WB/deKvnCa
         dsfw==
X-Forwarded-Encrypted: i=1; AJvYcCWKnowNRcrc99SCI9Ebb3Ay1pfLYT8T/fSTL83kj9BLFcQVodO1QmLBSeJ/kBuDd1ze8UT74rdUdO1Lil5k@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdk0IxFCtZNfJTe/FSnqE8eZuBNKSJesH2K/8oSPMTxb1Ltfsl
	VhYXi7iDfLf4XDoRPVwrKF/Xu+hb7rN7hcrstNsUye2HrITw70+qLRoq7LAy710=
X-Gm-Gg: ASbGncttscW3wnUhNoaRG1PA76XeFScOjsNqujCokt65vUQkAHUA5eCkttz2281gCeM
	TT3Fro00ztIT0DhWSmWc7AgHVWvsPkAoARheiccfirdD196uU9ThSeNAjZpfUlo10z7BZhdJ6yS
	ZfyX7CADnWnZzJoi/mLNuhilNjblr7ztk1180qmvmyGD7926m6S/UdJuH/x8+xBfwPgMcvzc30R
	NdKhN2HzYioUKm15Hy1N8hK6QOceKi6ZyxP8lMXptRneNJQUv/YfiWUm2V2zqL0yC5ne//M7A+7
	nvH8CzGeYIV7j4/1B6zMGiwUKo1NPQ==
X-Google-Smtp-Source: AGHT+IFRPqvjPiQx+Q57Fj0xvxu0oKNkY5X+QdBxKXoQgr7IIB2rslmWg5kV7euTl28oWng6NSpDpg==
X-Received: by 2002:a05:6512:3b12:b0:53d:a86e:42d7 with SMTP id 2adb3069b0e04-53e12a2e9dfmr5167020e87.49.1733351926740;
        Wed, 04 Dec 2024 14:38:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e22947be2sm25534e87.12.2024.12.04.14.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 14:38:45 -0800 (PST)
Date: Thu, 5 Dec 2024 00:38:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, robimarko@gmail.com, quic_gurus@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5424: add scm node
Message-ID: <4epsd5nmugjwdu2xwzqzwkihqiaf6bppg62mvllycjvn4637oc@bcubp6qjcdcb>
References: <20241204133627.1341760-1-quic_mmanikan@quicinc.com>
 <20241204133627.1341760-3-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204133627.1341760-3-quic_mmanikan@quicinc.com>

On Wed, Dec 04, 2024 at 07:06:27PM +0530, Manikanta Mylavarapu wrote:
> Add an scm node to interact with the secure world.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

