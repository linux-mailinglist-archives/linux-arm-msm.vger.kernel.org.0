Return-Path: <linux-arm-msm+bounces-46103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2446A1B9BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 16:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 622BB3A5852
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 15:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF6215853A;
	Fri, 24 Jan 2025 15:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s7zZ3quV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90664157472
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737734135; cv=none; b=ZE0uu2EiX4GRI2BEaQOdP7K4vGCKb40aCe7ZcSVZPPgQC2lxTtHFNpCJYcEkBVJTw4cSAV3/LLoapwEmWmloc7q0KKDL+F5Tsn+qplX6+ug0b6z+VIzxkXNZem8l0ZsG/5zSHoY91Qh1S5oZcqkynNYukLGy0yjXwV3HDS1JoQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737734135; c=relaxed/simple;
	bh=s/jO4NPWKOieyxzi6luyHh+P5ju9zoKIC7bH0SB8o4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R8AGUFHKTvZcjryVQY9grTuDtjf02uylwp0RWfgprZvG7+th+WzEjbKGWeQRy8YoDoW6HRgb4imk0PA440/fdryOV5knyxSWD/UOzGby5AFs0gMTHSFQZhKd9Z24Ec6RYmzytdEWhmwrsYoy/NlY/1yJAZsPRmil3sNf2HRTfQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s7zZ3quV; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e4419a47887so3175785276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 07:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737734131; x=1738338931; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ilPZPULNnLI6UK/uv5dVV+2Dss3A/uBmwkDVQdaY3K0=;
        b=s7zZ3quV6sSGQi23hJ8dEM4EP7tlS0VnAiaxBv3lK2wpY8qVBS+nv0u+LtSgG3zm7a
         3jC/AeebNiMJTjl0CVRjs0C+ZCprv/VSwLRNaAB+dBzP91o0J1unli1foSINTUIjCnrN
         WHlsm/odmDIZNdqV4J+p6YtC9wuZ+t6FP+ZlBqLaLju/eWO3BGhQmaL8HMcSn3NxA5uM
         wozOiTvrTWMH9N0FeRUT9N3m3ZjyqmTfRJlH4vvuzIdATqdDi3VjBVvW1VdVijcrWkOK
         N5FZhjLj2bhGl8EF8f1n+WVssM5PB9NIxCkKwnRfCaN37YqkH2LBT4uq39WZsLnGIbfF
         Dgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737734131; x=1738338931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilPZPULNnLI6UK/uv5dVV+2Dss3A/uBmwkDVQdaY3K0=;
        b=BiZfin4IOgm7jeiBrzvnGgqRp7zrTwiLQzo9Kvvdcr4uhDu4/oJ7p8dq5MWryOQMN3
         K2qIjqN910VBDLBjRIyLWQocvGEpisbL3ZfbIuOGEkS8c58xdFJC1Jk3b5tOQUPJ8JcI
         HskByVSwJAcx6q6cOqyp/EH2Z56gY3I6IxV+UIotAHS3mkPCL2itfnHWMCz0+OarRDLh
         RjdaDxsDFXT7ApKZQ8R3WAX36ofVc0iBYkn9YtyH6AG+Cv/Sl9ooXAsdgTdI3Jtuhqvs
         P0ha3Q/N+1vwBvgZobF+bULnaSZ8nqCxf+uBGkhldlHAwh0ffwd5PBWa/wHp2rwtEYd7
         DLwg==
X-Forwarded-Encrypted: i=1; AJvYcCUEJYB0DEA5V8gjwgx19ukpKo+qMZUUdGYvB/Usamt/XLhcKJTDv2nhmktWm5ql08WhWUezE72ercxPQQop@vger.kernel.org
X-Gm-Message-State: AOJu0Yww7DTUOKztvGBJq7r0K6CWJEpMUyjydW8N2geCG/7HZ1IK4O7b
	j99dXHPtOoehsNU5WKQyzbEUYICW/1+PUDbKRcqgzKCvgmVBBuYVKbTZ5q/0tCp/VOXV67wWgT9
	s8N1j/23F106bi7zdHoLUaQl1l70R2usZaT7etA==
X-Gm-Gg: ASbGncs26/eg5E3KriZZ4M0keX+5D8MhLCZk7CnLd35Ii4ok2Uf5HUvAuG+OV/Qjn+/
	sm+ZdqhBV3LAbjx23mnEBp8lODYN8qQJKv0LNVmFaUbzn6EXPcd3kyapw59befzs2YPfEOMvb3m
	LS4dkSAo4r2WFVf7okWw==
X-Google-Smtp-Source: AGHT+IE5CrP20lwY9b957F+q8FfX4UrWyqpcD5u1RzqaZ3UIpMjXmbJiX0igSbAvphxXL+FBMTlukLRROvc9N2dsUB8=
X-Received: by 2002:a05:690c:3701:b0:6f6:d4bf:d01a with SMTP id
 00721157ae682-6f6eb940fb8mr246220177b3.34.1737734131503; Fri, 24 Jan 2025
 07:55:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
 <20250124105309.295769-7-quic_vdadhani@quicinc.com> <d3tydp3m7pehhiphupwybjlol5v2u3sabqotqximxmnswjlczb@jmdzpbrcrgou>
 <08545d45-bfe6-45e4-b7be-503c318315af@quicinc.com>
In-Reply-To: <08545d45-bfe6-45e4-b7be-503c318315af@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 17:55:20 +0200
X-Gm-Features: AWEUYZm4pYCNJdHGiPnsyF_MnRCwaJQzJ4L3pN0DCmSTM3Gxdme16eoXtL4QfTk
Message-ID: <CAA8EJprSZx9Bx7EXA_RpwZdhieOLtrTARqXSuo-gO9sVMdK5Qg@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] i2c: qcom-geni: Load i2c qup Firmware from linux side
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Jan 2025 at 17:24, Viken Dadhaniya <quic_vdadhani@quicinc.com> wrote:
>
>
>
> On 1/24/2025 8:34 PM, Dmitry Baryshkov wrote:
> > On Fri, Jan 24, 2025 at 04:23:07PM +0530, Viken Dadhaniya wrote:
> >> Add provision to load firmware of Serial engine for I2C protocol from
> >> Linux Execution Environment on running on APPS processor.
> >>
> >> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> >> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> >> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> >> ---
> >>   drivers/i2c/busses/i2c-qcom-geni.c | 7 +++++--
> >>   1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> >> index 7bbd478171e0..9ad3b8c9a224 100644
> >> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> >> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> >> @@ -872,8 +872,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
> >>      }
> >>      proto = geni_se_read_proto(&gi2c->se);
> >>      if (proto != GENI_SE_I2C) {
> >> -            ret = dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
> >> -            goto err_resources;
> >> +            ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
> >
> > Hmm, so if the SE has been configured to e.g. SPI by the TZ, can we
> > switch it to the I2C?
>
> No, in the current design, TZ will not load the SE firmware.

But that's what your patch is doing: if the protocol is not I2C, try
switching to I2C.

Instead it should be 'if unconfigured, try loading I2C'.

>
> >
> >> +            if (ret) {
> >> +                    dev_err(gi2c->se.dev, "i2c firmware load failed ret: %d\n", ret);
> >> +                    goto err_resources;
> >> +            }
> >>      }
> >>
> >>      if (desc && desc->no_dma_support)
> >> --
> >> 2.34.1
> >>
> >



-- 
With best wishes
Dmitry

