Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF1247A78A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Dec 2021 11:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhLTKBE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Dec 2021 05:01:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbhLTKBE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Dec 2021 05:01:04 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 306DDC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 02:01:04 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id iy13so3394410pjb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 02:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=glxIKfznhcNipnrkJByGI9s+AUxnZnIKmybM9HizRSA=;
        b=ZpDSg3GGMyKyLyKij38c9MVzCBq1litNCaAtMAZGrCtCncGp9k9Hndc8mept5FMffg
         erWQMOMVd6mw7WmyDMRK6T6pUWxfRjXBLyNjuCpCwItEwvI2yFCPOVAPLJbZ/MrCoysU
         5RBJImkszLmpykN5ayQT1eX1V2mdAIfq9eMy8KsxEkXtG+mkf+Jmpmkr7Y1BAC9gSudM
         Iptl+nm/wkfbWAi0oJL29SkgpY+Hn5LEdS0t/LTXhzUzEDmV2sZaZXf3VTUp/Q/MIuBh
         HhN5baKfZK199yw1GSt0wbCC/BMfZbxvTKQnWogtlRDNoWVhVBYL5NX13G2yXMq5AdNY
         fuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=glxIKfznhcNipnrkJByGI9s+AUxnZnIKmybM9HizRSA=;
        b=fwEfe+bWbKnW/s8wIuM1k+h/EnLPEkhymEy2gmEwTOKX0J+Su837NmoM0kh/4VXg+8
         i/ZklE0TIU7k6NPX9KxLb20hfDxMkBy8rNI6N6tsBUQ5XbVuWbMJOgJDTaIZ0kbY5fyN
         fP3h6a2Tsa04kxahV+ATzoN6PeCpoZkTQiqDVUR7lY184iQ3bUqAsCh70hzdE4yf7NLo
         X+bz7tFbcxTYa3HfjkuNY0z5gvDFgbITi9q1ZI3A/C7ka+rhjfUC8oEanfEb1VK3NkVE
         lATnEV4MzjJ70wQviSOTXyy1lQ3+4YruZKebl44MJ5d8S/BqfJ2QOqp/I6c9X0NJG8uw
         S5xg==
X-Gm-Message-State: AOAM531FJwz4/CEj4+k06nM5AvAeSEP9NwNt1EZkRsljFj1Vh4DmcB2l
        wpMe63Q6pntHw1Pu/Gy3002ebwgs1Z6VWQsQfDl1vA==
X-Google-Smtp-Source: ABdhPJzT9dyHPL0f54cBqBFCr6WK2GpNgLSPMaBRAJ5GmbHyUhVZsqzeC+78Izoq8hsEYBMZvxe/ishN3wqS0tBbh7c=
X-Received: by 2002:a17:902:760e:b0:148:f6af:f2c8 with SMTP id
 k14-20020a170902760e00b00148f6aff2c8mr9280960pll.95.1639994463118; Mon, 20
 Dec 2021 02:01:03 -0800 (PST)
MIME-Version: 1.0
References: <20210901084732.943248-1-ardb@kernel.org> <5bdf0bb1-150b-6b60-6f9d-86542b4d7695@linaro.org>
In-Reply-To: <5bdf0bb1-150b-6b60-6f9d-86542b4d7695@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 20 Dec 2021 11:12:32 +0100
Message-ID: <CAMZdPi9m_JJogxwT7k_0bzC9+gPxq9NHkuDF3T0HEj8EU-vd7w@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: qcom-cpufreq-hw: Avoid stack buffer for IRQ name
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ard Biesheuvel <ardb@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> On 9/1/21 4:47 AM, Ard Biesheuvel wrote:
> > Registering an IRQ requires the string buffer containing the name to
> > remain allocated, as the name is not copied into another buffer.
> >
> > So let's add a irq_name field to the data struct instead, which is
> > guaranteed to have the appropriate lifetime.
> >
> > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> Thanks for the fix.
>
> Reviewed-by: Thara Gopinath <thara.gopinath@linaro.org>

Seems this patch has been overlooked. Would it be possible to resubmit
it with a 'Fixes' tag?

Regards,
Loic
