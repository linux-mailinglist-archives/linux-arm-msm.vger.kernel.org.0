Return-Path: <linux-arm-msm+bounces-302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 029CE7E6C6B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 15:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 328681C20850
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 14:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9C0200A0;
	Thu,  9 Nov 2023 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U3q2Dkg6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F2A1E539
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 14:28:32 +0000 (UTC)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921832D7C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 06:28:31 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5bf58914bacso8117167b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 06:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699540111; x=1700144911; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OiBm5sPw96SiR0IGoxFNn3RBFbgfNC/bWK202lBgfEU=;
        b=U3q2Dkg6Pv9Dp5wlJDo0T/7BOsQ48MH+8pfHJXAUPDYAMSaaFT6SFA88V4qHUHAvyW
         x2/CJ5hhLuj/u5iIJnnqqcQ0VH3Se8UdOOKFZuT7OvAiZ0vMjgvNdwWJswW/5ZFUh/fT
         i5sxut7hhzsp95y7jkd5OSUD1FPOGvLtj8GF/gh+JPrtMSQ7VZ+70IjPIE1+KgS/5ls6
         0LtvfzjtJOFNsy+6rtQomS4QQTUJ1FytJEwetTrRliClt057QpTVnt+msCGZ9ICU+rNP
         9anl0zmT8qFcvqKj/JsY8y/e1SatZlOzgAW6crT+Lu4qmJvmPKfX96firCU6RBse6hER
         shUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699540111; x=1700144911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OiBm5sPw96SiR0IGoxFNn3RBFbgfNC/bWK202lBgfEU=;
        b=QrRvls2UbbwVYjF1GDIRWNgK0wLfFi8QfB6M3tFCHBl36ncvXX0LO4L/ayvAW5+yZw
         d1BgfCk2CMslGagE6PZbTEiZitXGlP3aeMGdgHtryz5J82fRdTMg2OinreXZBx2f/q0I
         O3ZdQOT/ivV4kEk3P/PYYSAVioVoxiA1obR2IyU92Ro4Gav7zgAda1eq5RU508D/CpXR
         iVVwxXOzlRsLary03IaiMwqFZAEushPwM4qzxXL2nF4jgtGeGVUNDKQnI/hqVMuwxrEn
         y6B/9sjoIo/E+UjhtQdufoDxQGUgnI+gFwryHvTSVaoX54vtyRjXT83FlK81TPvAQLwB
         KXSw==
X-Gm-Message-State: AOJu0YzOVG8jGSMeD43p8iblxceOcCVG9+SjehHg3tT1slUPnsy+fgV7
	L6lTDo6Vw1tlcwpRxGz4OAOfBZdExBo330ZScbTxKQ==
X-Google-Smtp-Source: AGHT+IHjHrbh0/nqFgWusFIU7pH6Xcx7ZGhZvYC7PoVRBLlGmpMQi61cINEisGMWZuPi4JdaAzan8N4NV0ogrYpHwPw=
X-Received: by 2002:a81:9242:0:b0:5a1:d398:2e with SMTP id j63-20020a819242000000b005a1d398002emr5540050ywg.37.1699540110602;
 Thu, 09 Nov 2023 06:28:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231109093100.19971-1-johan+linaro@kernel.org>
 <0edf26f9-46c8-4c9b-a68e-a92a78b5684e@linaro.org> <ZUzjFFUc1dOE8C54@hovoldconsulting.com>
In-Reply-To: <ZUzjFFUc1dOE8C54@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 9 Nov 2023 16:28:19 +0200
Message-ID: <CAA8EJpoAwFaush7GQgp=LSmd7OyfBLFw+fLRanqY3wD8p8KZKQ@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: fix port sanity check
To: Johan Hovold <johan@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Nov 2023 at 15:47, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Nov 09, 2023 at 02:28:59PM +0100, Konrad Dybcio wrote:
> > On 11/9/23 10:31, Johan Hovold wrote:
>
> > > -   if (!altmode->ports[port].altmode) {
> > > +   if (port >= ARRAY_SIZE(altmode->ports) || !altmode->ports[port].altmode) {
>
> > I'd personally use PMIC_GLINK_MAX_PORTS directly but it's the same
>
> That's what I'd generally do as well, but here I followed the style of
> this driver (and using ARRAY_SIZE() is arguable more safe).

I'd prefer ARRAY_SIZE here too.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> Thanks for reviewing.
>
> Johan
>


-- 
With best wishes
Dmitry

