Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7AF820A5FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 21:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406523AbgFYTl2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 15:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406116AbgFYTl2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 15:41:28 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED851C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 12:41:27 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id s9so7809296ljm.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 12:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0zChu5NuqK8iQIUSN8hc0V6TgI7jS8t8rrc66RrTyMg=;
        b=IJEluxN5ynq0LgPGOYBOvKULgCl5INb0OLYzWbyx+0W0SCmpcuiXuHILiZ0lMhqt3s
         GNPoTUQOirD6NBSicG79/NGxt2qaplIrFoe6mGjhqfQ0ChVaghjL+t79fI5t+gn3vIBZ
         ImuTzMnodSyyKZH1+cAbw/iBrBebnKVEInFUyCQrevpxVTE8ScP/ZpN90ZgYHPo0gSGe
         ULTzWcwBwlDDvfnWxhTRiTqV6cOxCdGmsiSUcoij1XxBb8H+ZONZNZzAlJBtR9AoJrB2
         trXlHnAP9U+O2XbsdPn5oAPh026OQG0YbwySQFlt6Tiw8Qttz5s1wD3ghAsLaiM+I0Et
         X4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0zChu5NuqK8iQIUSN8hc0V6TgI7jS8t8rrc66RrTyMg=;
        b=fMlwjTPPmZ6ef5Z5bPfaTZTI8CDJYTYfPQi1C/YpCglwW86uFotWTOkE2cFNv+pt13
         qbPm+hbRfOW+iADXakw75LJSB1bQgqkhPd5pfuQfuwK91c5qSVLeDwWyhrtitNUzHWFF
         obROTidnV2gDokISA7WUW0Gj6L653sSWN0GC669vJcTrgGH9Q2EsljfqxOqLIvyrI9z4
         mpgKvdOJrAsZmTw+2k6Fs4wFXfiF0OdweDed1hMR9VEYkGU2a+Iph1Y7yuG9Ne04ZMZU
         zE2SFnN4EZInMUfR9MNogL2IH1QWpg/P5e8Wb37SXB2w1SwT4aFllcGqAhn4Xb7pHaWA
         6DAA==
X-Gm-Message-State: AOAM530EtR7QcPEOlIwVYGkka5o8EAeijkcFZtdgkrBuxoyAM0u+2Lq1
        JmJi013/jhzX45ic7vTSSaRytj0hBZU=
X-Google-Smtp-Source: ABdhPJxWlayAdWCqXaDjcJJF3JFPeAfVeVjewllhoyJZXszj3c3iBM9r3KCGLR2HjEB4QptldoNOFA==
X-Received: by 2002:a2e:859a:: with SMTP id b26mr17894874lji.191.1593114086377;
        Thu, 25 Jun 2020 12:41:26 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.64.162])
        by smtp.gmail.com with ESMTPSA id f9sm4226746ljf.27.2020.06.25.12.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 12:41:25 -0700 (PDT)
Subject: Re: [PATCH 1/3] phy: qcom-qmp: Allow different values for second lane
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:GENERIC PHY FRAMEWORK" <linux-kernel@vger.kernel.org>
References: <20200524021416.17049-1-jonathan@marek.ca>
 <20200524021416.17049-2-jonathan@marek.ca>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <fa5edd52-cce3-e9b6-ec8a-57bb8a676fff@linaro.org>
Date:   Thu, 25 Jun 2020 22:41:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200524021416.17049-2-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/05/2020 05:14, Jonathan Marek wrote:
> The primary USB PHY on sm8250 sets some values differently for the second
> lane. This makes it possible to represent that.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
