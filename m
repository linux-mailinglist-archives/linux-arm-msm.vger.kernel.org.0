Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A55B6354BC8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 06:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243596AbhDFEi3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 00:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233796AbhDFEi2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 00:38:28 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E217C061574;
        Mon,  5 Apr 2021 21:38:20 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id e7so14848239edu.10;
        Mon, 05 Apr 2021 21:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=MsC5WijBlgfkgFy592W+ZSSEwoZPPcG0fLkOP+Z2XRQ=;
        b=gnrlHDJLM16uZ3LTd7lfpAx+OaGwwcrTvf0WPKH+VnDRl+A52miHB/314ZeRMY34Ci
         f01hDMsXkE+CmY1yckrosCGkKsFPQAue0tbVjDJs/XhKPXyuMnfYvTomWz16yJjzSklS
         BjOJ49l3aZ8ZmOdpEuX+s+NmW66Y3hlcB/UWAzxP6B5k8eEg3yu9tpQ1ZP457f6sEs4l
         +87NwKZr9N03Y01lHVhUYfR4WbpaUDqESSQZeYw4MaeQO9k1bsnk+yHyayp2XgLIWIih
         bGWJzAygMR1FdUFNfXhCHOAHsxnQ53lZTZmufjRPBp2EZX/6lfcgimIIWQDQ4/K1a0Er
         NlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=MsC5WijBlgfkgFy592W+ZSSEwoZPPcG0fLkOP+Z2XRQ=;
        b=C0fgYPmpr7WVoNDxxGrQAC9Q9as05PP9UF2jXIxQ4lhnhBAfQyscRWWcNgy6vzN1cj
         MoLQBdQTSjL/xggGgoJ36aSD7REgVgGJOenBr3UGa7zx2ybEiguKHTl+VS2Ftq5lTQIF
         CnhM1JtSup0z9WqvOiUlKVuABln3n4gkGZ0Skos0D6tX7qy3Ni7JqstFIq5yVA8PNFKP
         3xB/W16/cYTV3gM+xUtEC55pfSeyYtBJC+PekZrxs8e8olga792VQrC1AznJplWHEjxu
         7Dg2NGTOjath++jESJ4jq1SQmLpPb5610dmPk62J2n/EGcG8Ne+zzPf3APLsmvc5MjdH
         myiQ==
X-Gm-Message-State: AOAM53198H+ut8BustMJjezC6f1E0ucB1qNi71pN6M1sGfv/GZU00i6O
        jl26VRj3GoVLl0h+KPwykzE=
X-Google-Smtp-Source: ABdhPJwJzyO12QJ2coz1pjHurWxj6aOF+6RNjeQm6J/vW6R2eBL7p7z38SxYzKN3mO6CXulsJ+xnIw==
X-Received: by 2002:aa7:c952:: with SMTP id h18mr17466195edt.269.1617683899334;
        Mon, 05 Apr 2021 21:38:19 -0700 (PDT)
Received: from pevik ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id p20sm4894882eds.92.2021.04.05.21.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 21:38:18 -0700 (PDT)
Date:   Tue, 6 Apr 2021 06:38:16 +0200
From:   Petr Vorel <petr.vorel@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8994: Reserve gpio ranges
Message-ID: <YGvluI7A2D5Efmog@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20210405200259.23525-1-petr.vorel@gmail.com>
 <20210405225222.GD904837@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210405225222.GD904837@yoga>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

> Are you saying that once you export these gpios the uart stops working?
I'm sorry, I wasn't clear. Only exporting GPIO 3 disables UART. Exporting 85-88
causes reboot. And I have no info about 0-2 (it just most of
gpio-reserved-ranges diables 0-3). Therefore probably only <85 4> should go to
gpio-reserved-ranges. I'll send v2.

Kind regards,
Petr

> We use gpio-reserved-ranges to denote GPIOs that are owned by TZ, so
> touching their registers causes the device to reboot. And per the
> gpiolib patch you reference, this would happen as we register the
> gpiochip.

> It sounds instead like what you want is to make sure that these pins are
> considered busy, muxing in the uart (i.e define a state for uart).

> Regards,
> Bjorn
