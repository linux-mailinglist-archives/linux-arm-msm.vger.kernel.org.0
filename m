Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11F5E2280E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 15:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgGUN3H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 09:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgGUN3H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 09:29:07 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2368C061794
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 06:29:06 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id o8so2828781wmh.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 06:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jiFlTUkH+lETI0C1D7la/stWtHZn2hC+zDKsk33/K54=;
        b=dlKs38vniF37chPaqcJ261/qVmlEKkeCQsAbXHFSuu3T0lB1L+6dawnglZjltfzLou
         2cZdCuUVJQFOKqeq/ujf9RyEM0eRn5i+ciQT0HI9PaOzrd2w/GJ6xIxHXWzHpYUJzz9/
         GLc/8YgSoZ7MXpFwBf4zCXk3kcL30tgnevtOXI3uH5JcZ7YT1/pjleVqKv2T3dA0Oemw
         EHEc/TI55WTxME9QxDB3DBquaTPHW6ukt/Jo9ORwxsDs57/JMd85eti3Tx4F/jecBjv6
         VvIyJ1WlUD5NhD296dZ5+HoihuutuQIepThYCjKK/BqhN8QZLeVxUffpO1y8odg6/HSm
         AH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jiFlTUkH+lETI0C1D7la/stWtHZn2hC+zDKsk33/K54=;
        b=PklkiOTCVZMh1+uhaZ7DOWeHKrKJJ6reDk3+zVvMn/FFep9p4FBMihFL6I8UEPakgk
         nAnf55Mwf98hBzQiD1Mp/cVJqV5jRjfqpcNHp54RKuxxnpDBfZxNu87Aq0brmNzQIggB
         7r81x698pPdUh94S+sXYyzp73Pe7QtXpdhjrfa0TZCwra4kJqBOscKFE3ZGfbpZoRXF9
         B3eyBo2rIHFxTEbcwV495oWLuI8l1ALuCCWYj5j59oXtjTnoChKecvQo8bRck4BtW8vP
         iJJxMw/9KsHPKHAj8L+xgBXXJY3AIeboA+Zrrt5FAWd2OZVsE9jZFjdaWCkuE0pwXIx4
         g46w==
X-Gm-Message-State: AOAM533Dx20zr443qrYy/NItDaDXuPsvgC2TKzA9lQK38fflS40pLmfF
        FUh+9OuH/C2e+7fWrz+0uMkXdw==
X-Google-Smtp-Source: ABdhPJzqpUCfhoVgVMr8V4335U6IXqD6TNdzwyMe3wWaUGx/VjVy3WyTPTUADm0LTHV4gAgq2fpcng==
X-Received: by 2002:a1c:ac81:: with SMTP id v123mr3898661wme.159.1595338145458;
        Tue, 21 Jul 2020 06:29:05 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:c144:5385:c824:85ce? ([2a01:e34:ed2f:f020:c144:5385:c824:85ce])
        by smtp.googlemail.com with ESMTPSA id g145sm4607336wmg.23.2020.07.21.06.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 06:29:04 -0700 (PDT)
Subject: Re: [PATCH 0/2] Add msm8939 tsens support
To:     Shawn Guo <shawn.guo@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
References: <20200629144926.665-1-shawn.guo@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <6615ee72-d222-b16b-df72-0f5117c3e7f5@linaro.org>
Date:   Tue, 21 Jul 2020 15:29:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200629144926.665-1-shawn.guo@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/06/2020 16:49, Shawn Guo wrote:
> It's my version of msm8939 tsens series that supersides Konrad's [1].
> The bindings one is taken from Konrad though.

I would like to see Konrad's ack.

Thanks

  -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
