Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 370B3A9BD0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 09:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731628AbfIEHa0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 03:30:26 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55898 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731359AbfIEHa0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 03:30:26 -0400
Received: by mail-wm1-f65.google.com with SMTP id g207so1433457wmg.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2019 00:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=HFlZwq0qxXTjPrcrj7B+tpd00WpauS+YbjV3gpTHZ3Q=;
        b=tjHmqDOv9YI9TmvdR+u5Vb9kn9GFHdw8cHJ9H/9JAbro7in1falYEmg02iMAG8Enm8
         qE55Q53zFDJKHdu6LvhJUIH5cbbzsSd/Oo8lKaAQ5QajB+NPccVu7Aaf5L6fB5e00gM9
         twb8h6FS2WzlMt+z5ZVv6/ahUp1mWrLTKUvPLGI+ZoBRaVza4fP9CdemlH0kwAB/QzAZ
         uHg1cfy6FBisXzVAf/igV6C4WLg1rJd3RIqXwY9BZAQ0KnhiiEvQ79E0dHBT/jQo7z6q
         wcJC/SOwldpyKNNRpOAcC1A5lzQEyzlonWx6MYXTmPUy/hhImJNgx30n1+Zxkyfd6y5p
         1sxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=HFlZwq0qxXTjPrcrj7B+tpd00WpauS+YbjV3gpTHZ3Q=;
        b=Mn1zPE2WEpAZGBvlrCAtg6CiR5UINb7BVsAbkVK5R0PIOsynuQw8idrR4Z5Fv8Ce8I
         YNkI4I/5X/AR+9fd2uqeksIIqjt4XprPaJ//nMCX1osdTYiLBtR61aeyY3iTjLhhaB9G
         yVdZ3pA29JhX2TaodYlV85ZRP4EF3MEEpxbHRBq0mFEUBZfG3KeiTNNbADW/VMRQqr3n
         NdSDjSW0Z+lpN7+RvEs6xVdRO6vFhgeyzG+Eu/BSsZg1hA0hJ6dG0xVRyyvyEOvCEcPV
         tiM/FUVD9FbX63X1ZpmmKmK6siv7X3+hju0AouTindmAMVtcE3CgbZWbBRcbaCToNbrT
         JReg==
X-Gm-Message-State: APjAAAWEgDeGDVgh3w7iAvsitMEQS21FLM4yScIPAKyzeQipXj8bqGSw
        TAGP5kmPlQiDac9ZoSywg+hJOw==
X-Google-Smtp-Source: APXvYqx9hIKtXo2fKrV6NCZnQd9e6GpfPm9KrsYcmzaMgYNsj4Y9AZC4Dki6vbgrkFd5YqH8pvr6aA==
X-Received: by 2002:a1c:c012:: with SMTP id q18mr1787427wmf.116.1567668624199;
        Thu, 05 Sep 2019 00:30:24 -0700 (PDT)
Received: from dell ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id 74sm1500110wma.15.2019.09.05.00.30.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2019 00:30:23 -0700 (PDT)
Date:   Thu, 5 Sep 2019 08:30:22 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, agross@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] soc: qcom: geni: Provide parameter error checking
Message-ID: <20190905073022.GY26880@dell>
References: <20190903135052.13827-1-lee.jones@linaro.org>
 <20190904031922.GC574@tuxbook-pro>
 <20190904084554.GF26880@dell>
 <20190904182732.GE574@tuxbook-pro>
 <5d704c9f.1c69fb81.a1686.0eb3@mx.google.com>
 <20190905064253.GU26880@dell>
 <5d70b193.1c69fb81.f9ce7.3447@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d70b193.1c69fb81.f9ce7.3447@mx.google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 04 Sep 2019, Stephen Boyd wrote:

> Quoting Lee Jones (2019-09-04 23:42:53)
> > > > But if this is the one whack left to get the thing to boot then I think
> > > > we should merge it.
> > > 
> > > Agreed.
> > 
> > Thanks Stephen.
> > 
> > Unless you guys scream loudly, I'm going to convert these to Acks.
> > 
> > If you scream softly, I can convert the to Reviewed-bys.
> > 
> 
> <in a soft scream>
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Done. :)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
