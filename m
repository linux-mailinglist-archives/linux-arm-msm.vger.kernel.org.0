Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 871751DEDC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 18:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730544AbgEVQ6D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 May 2020 12:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730306AbgEVQ6C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 May 2020 12:58:02 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B9E0C061A0E
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 09:58:02 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z64so927843pfb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 09:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BkkTyhZXqmoYbosO7mhxikeBEfxh7Z+mKVsgtxzKXjc=;
        b=D3Bp3rA7dZHgJDNILqtIl03jqxrcBE1NsI4VoPgOXz60I+mTJSkSAPnmaNYEiu0a0o
         49AuqImxiOkBVcVwD14jur1mia1kyXecpd7q2E/MEoQIJU+XHGIROmRgFkf264k2bO+H
         IsSXK6QHMsbWIcUelyIimtNCBf0v9zv9q3bY9a3mnRBMl/s/tiX784qJdZm7lBQsz2W0
         vHY+wkC+9rUk5L0scxRbOJoqLm0KMawq5/2xdzudO7X2odKnzcuAQhkSr7VymQRjK9gV
         8o0NokYx/W/97VCVuwmQdw1UAeLGuQInbwzHuYTfu4k+AJ8DQekdHWSq3+WRR3eczjEE
         G6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BkkTyhZXqmoYbosO7mhxikeBEfxh7Z+mKVsgtxzKXjc=;
        b=ER25BqhGNqok0l+UYkEj9dxtcqFJsq8VMm+Eu8XhZz/fl2VlKfwyWOsJ835BDpS6Nz
         WemwwMpEvYPa6YfwdW0ZzbXfOCj/8JEXMeMDfhvMCY1YNg8Tfew3DTlPO+4/siA0nD1I
         c0/Pa3QJMbjEcGd074OUoHtWKqZjvrfHnJaiwXJfJokjd9miTXdo2wA6D4nBh6c4A+bJ
         fNk73F0oMifboKRHmM6wJFbC36ly9ie7kNKLjXNPXAfQU0x9Bydyb6GJCkDz6p0rhJb1
         WiFCOclrg9rzSRAgMSgrQXdVcTKIv4klz0/OIHuVKhhcWbz0VFJB9TeSGpNojFYZ2F48
         gNWA==
X-Gm-Message-State: AOAM532doEfBvqHytCLeunLikUTpL4hRXyKI9HRU/Uan8g48FOqWLwkZ
        pMsYQ8l+FZkpyfKPe/NSJpXQ7w==
X-Google-Smtp-Source: ABdhPJycgYV7PdHnM12T32FAcBZScokQWtdDcQ/9aRg72UFU6AuDhyp+VlUT7TEU3QNodO7GHT8uiw==
X-Received: by 2002:a63:1066:: with SMTP id 38mr14656449pgq.207.1590166681780;
        Fri, 22 May 2020 09:58:01 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o25sm6501119pgn.84.2020.05.22.09.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 09:58:00 -0700 (PDT)
Date:   Fri, 22 May 2020 09:57:58 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Cc:     loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, robert.foss@linaro.org,
        vkoul@kernel.org, wsa@the-dreams.de
Subject: Re: [PATCH v7 3/3] arm64: dts: msm8916: Add CCI node
Message-ID: <20200522165758.GH11847@yoga>
References: <1586248382-9058-3-git-send-email-loic.poulain@linaro.org>
 <f127d7f3-d69e-1137-4366-5fa77abc5c3d@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f127d7f3-d69e-1137-4366-5fa77abc5c3d@gmx.net>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 22 May 09:10 PDT 2020, Carl-Daniel Hailfinger wrote:

> Hi Loic,
> 
> it seems that this patch was not picked up in any tree. Do you think
> sending it to linux-devicetree would help?
> 

Afaict it's part of [1] and as such is part of the qcom pull request for
v5.8-rc1.

Please let me know if I'm mistaken and I'll pick it up.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=arm64-for-5.8

Regards,
Bjorn

> Regards,
> Carl-Daniel
> 
> > The msm8916 CCI controller provides one CCI/I2C bus.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@xxxxxxxxxx>
> > Reviewed-by: Robert Foss <robert.foss@xxxxxxxxxx>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@xxxxxxxxxx>
> > ---
> >  v2: add this patch in the series
> >  v3: add only cci node for now
> >  v4: no change
> >  v5: add cci label
> >  v6: no change
> >  v7: no change
> >
> >  arch/arm64/boot/dts/qcom/msm8916.dtsi | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
