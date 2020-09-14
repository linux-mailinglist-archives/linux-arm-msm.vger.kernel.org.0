Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60945268827
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 11:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgINJTm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 05:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbgINJTh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 05:19:37 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 294F5C06178A
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 02:19:35 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id c13so17116240oiy.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 02:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PntEDM7LF9YFHS/fGomhwipLRARKe4IjmrD2LSF9a3U=;
        b=VyxKPcjWnBBwHP+A6iZKryD4xkDXQ5KFR9iVkwHUK3DCvLDl6GJALmKd62cETe/T/h
         5cp95uIBwLWal7kiXal3YRWAWWTawzHD1oFcfae9so+04qVSxMUbVdaa96q1WC3laz+F
         QVCZq5SB0Y5EGEhdI4T2qGTi2V0WrRHuHjYSYPHJocsPBCSf8u21NkRJEcg83cThOK78
         xllBmvMh3A0743AueKeJTlGLfIzRCzAhzSet5wwcih0rG6mQffVmVkxaOippCE9Bk7cQ
         0CmqCIM8zdJbRD3UwUu4kMbY2ijPykTio/c9MVtmP3GyHGXKohsTA5qdc6Uo56/dEF3G
         8M0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PntEDM7LF9YFHS/fGomhwipLRARKe4IjmrD2LSF9a3U=;
        b=VihCIrtHBzyD6iZwMil6B14ml21gPrFeDAGwbRxqB+HJzBgKTHCEVOiUldngBUNnjp
         6u4gWGtea7yq2Pawvxl/2Bm+3sga9Bw9WLNznkOeW0Su5FZXxCM92Ggd+MNSVhPKqJzy
         BkhMuZ3ypIeWuO1NXLXNMNFnHVfPJG7OVnzOmXlzVDr0Ae32z14QNYwmtETvwRPpG6P5
         lu1J7XdX7hTW8CMYdrfHpUdOQ4pzF9PG43+klkNSi3swRJVUDJuUd4ygVw7DdSIH6g2q
         VEZlzqXUmBNXiUfOEtskSgmYvmnw0kMYVynf3Gtf38GA9bRtsnloZLw9WUbSh50fTT8z
         Su2g==
X-Gm-Message-State: AOAM5302C0S+g6HfzsrgN1xCNkFgb9D/kOkyY54y9/OE198knok1kS6L
        KD5DZOazFuftvqp4uR90GGjdgwRuvH/l2rcaKOvJ3A==
X-Google-Smtp-Source: ABdhPJzlVYpLLKBqckSp7cRsb8j0H8g/8KzM210y/SP/BYJaFBsL0tM+uwdKjUZ9Xls9z1uoNnukdCcEAIT/PhlQ8dc=
X-Received: by 2002:aca:2301:: with SMTP id e1mr8577962oie.177.1600075174577;
 Mon, 14 Sep 2020 02:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200914001229.47290-1-dmitry.baryshkov@linaro.org> <20200914002314.GZ3715@yoga>
In-Reply-To: <20200914002314.GZ3715@yoga>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 14 Sep 2020 12:19:23 +0300
Message-ID: <CAA8EJpoti+s6nh59UFYkNR9+xeb8_zgxUdcbzRnrdwi7qvV2rw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: sm8250: correct sdc2_clk and ngpios
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 14 Sep 2020 at 03:23, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Sun 13 Sep 19:12 CDT 2020, Dmitry Baryshkov wrote:
>
> > Correct sdc2_clk pin definition (register offset) and ngpios (SM8250 has
> > 180 GPIO pins).
>
> The second half of the message is no longer relevant, and you only need
> one of your s-o-b below.

I should stop sending patches at 3 a.m.




-- 
With best wishes
Dmitry
