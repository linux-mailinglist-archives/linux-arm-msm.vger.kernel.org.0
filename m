Return-Path: <linux-arm-msm+bounces-14710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4358856B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 10:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D33C4B21A5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 09:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8808A54FB7;
	Thu, 21 Mar 2024 09:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YZmR/82u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2A053E1E
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 09:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711014305; cv=none; b=rErySo15BdLdfY4I18kFD2neyzdsf2r1jWmaluW+jtAJWHAMvJWdB7B2um8nyy4ubWhp4AlLYVH58UupK+pRcBM+0aZWIbhYqT5YgOTt3/rcVWmcQW+09vlkD1Br4rqOmu69fWlryNZgz2+mQRV4Ik87iMWZLm8mlmIAU0NUDgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711014305; c=relaxed/simple;
	bh=USv2fOw88lYmsXLEAJsg9gUy2ptDgrHgVv9Sgni5eFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rfqGBY5uG3XOo10YK/znti/6B4h/yOPvRFYv6PXwdvIgu9/OPn7MHVnmk8DMPfB+NgOlr+ofPHmN91R0uAaFPrHud9beDBVqBQxunoRNCnTHdog1YiDmv7dvfeFy8qtpUshYrcg1bBHD9oL/NhbjoQypGqeVcijqNGk90R/OtKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YZmR/82u; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60cbcd04de9so7146377b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 02:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711014302; x=1711619102; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wsq6huHxMXFKmsQE0mL/RER+3c0d8PlFp7FnnyoJiEE=;
        b=YZmR/82uRfmQtV/WX6IQlMczh7Ac9gJHx6eRJtpJOTf9ZojtwyKMwDw/BeZ9oPP7vD
         5W8jCqW3Eca8b8HDksAOu+EdXs6gW9d5uCDiHNB37NdFiEscYGPPcVOvzBw30pX26CUF
         KX2B9/1Du+riMrWgYPr0gkKkQxRzldc23Aoug8eOelaqtpaqTW65zljuakXEAoiS7RT9
         Ybs5AyRUHiVBg/2uh6xvIsWomag3MlGkcQNjiJ2Aeh9nfCPknblfd7iSkfQao9BDe4D2
         eZ42mV9udbjHycM5JoNfcX5Df8icELJy4hNVMX01T/hWvmKIvBziC2/hmFJxTvQdIJt0
         eX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711014302; x=1711619102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsq6huHxMXFKmsQE0mL/RER+3c0d8PlFp7FnnyoJiEE=;
        b=kSM1/f8/KyMke3JcwfeI+esP6mDm+9PrlNicHnvCFM8BqE0nIKAaiD2GrWB55s24Ao
         TXHYyd8B5GskOldYD/2IkU5HNi1onM6QSSXcA448MQMD1Gt6LnyGzaV/aUg2Hb2yoJ0N
         up8OcFLDbATEsgp5pmfXIrEPRpwb1+64NnjkmE88dR67UiNB5bWuVyDiK5kZYjxR724x
         scs3Fhebimows+AqvPyBGDMy437XbCTEogvsdJs+dzz0Fw/ZhkFprS/EfotqiOKVyoiX
         gxkzYyBiGmuQRRCvwov7pArwAKGZ48wadoFKXXdfB6DsfZe4DU91tlTFuHad+opPq7uo
         CikA==
X-Forwarded-Encrypted: i=1; AJvYcCVJsz1MYZVbuK2Vwz3G+HDPtUv93UmzUb2m2AumGenfRGU6If5NrMcJBNc45Rouz/tH9MsGzWecaJWE0FePEHJvJ+ahQSoY7yYlM5OnIA==
X-Gm-Message-State: AOJu0Yx7yWQ5MmW6OCpBfPgRznT2v+zvyVXqrK1imBk4y+2RU6UKfydW
	6KSAgp+xD07Xvz5X2Xu88sY7ficTcbDTFTsRO+xrZDp1eW2nH+GbuB29b4evA12Tl6U9IVI0GJy
	/P40pPZQpiUu3h4JTiDLxIJecWIqujkbzu2Y0Sg==
X-Google-Smtp-Source: AGHT+IHYhhmTdh8jHR73tDxXGEyjQHJf8EIgdwjfMRiP3YSKMMj9MKe6GuvrydG88IgBd8VMu6yZcI70K5Z7Y418EUo=
X-Received: by 2002:a25:ae84:0:b0:dcb:e82c:f7d with SMTP id
 b4-20020a25ae84000000b00dcbe82c0f7dmr1349884ybj.41.1711014301808; Thu, 21 Mar
 2024 02:45:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321092529.13362-1-quic_jkona@quicinc.com> <20240321092529.13362-3-quic_jkona@quicinc.com>
In-Reply-To: <20240321092529.13362-3-quic_jkona@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 11:44:50 +0200
Message-ID: <CAA8EJpqrJ1bh3hdS8Gm-QRe1iEYj34Wwz+=vOtONUgAF=hOZYw@mail.gmail.com>
Subject: Re: [PATCH V2 RESEND 2/6] clk: qcom: videocc-sm8550: Add support for
 videocc XO clk ares
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 11:26, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
>
> Add support for videocc XO clk ares for consumer drivers to be
> able to request for this reset.

Nit: s/for//

>
> Fixes: f53153a37969 ("clk: qcom: videocc-sm8550: Add video clock controller driver for SM8550")
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/clk/qcom/videocc-sm8550.c | 1 +
>  1 file changed, 1 insertion(+)


-- 
With best wishes
Dmitry

