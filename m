Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D981ABF63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 13:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506344AbgDPLes (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 07:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506035AbgDPLEr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 07:04:47 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47747C03C1AD
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 03:53:50 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id v9so7249023ljk.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 03:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QgaYHDB+V/P8sJggA7Iblc7jogxqawaSl+yzOQ0/Rn4=;
        b=jU0ibB7dsoTTJYnbq7KJWD85iq65azWfsvxPzehE8nANACAg+Xlc06OrsGr3JWXvou
         +BdxX7QH+4uNZZbRVtz1Sj5e+iyJNk2NR2lC4/RCe86BW3cGHIDvCNTX4J/dPtYe04lf
         6G4J+hPkIZtAxrYdOwtV3czWB9x44QZehux9ei4JpD0kcovDb37m9XVWZZTzjLFfwNz1
         pXypwEZ1sJqzrhLWKG+b6tys3DKV0kCeJ+YEnh9bqHbsd74k+JfGJVnkqjpGTBVdXuYF
         n/RjND8rmIlYPVAQhR1gEvwX1ESXbgBH96blAk4ykcIl0nkMrwLci8W9mA/QX0ri65aj
         hw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QgaYHDB+V/P8sJggA7Iblc7jogxqawaSl+yzOQ0/Rn4=;
        b=NNIIIfljB0KgQ/XBiVEZ1vcUyqm1AKaGZv5RG7tbS3P4SIhxMJefUmPL4c3tox5YwR
         8qJaCssFP3VxrqtANLl9svdS3EmRneJmIJfbf459zVrtABAtj3KMOEoYLk+dheSLP9eg
         8IyrE3vhJbJjaD4EHky+3fpKYF/nOW1Rp7/zRQWfd0C/gbF0//xFuqjtX7SjFJVZEh9w
         vtmtUlSJwClkGPpD5gnERcQbiKNetlYhHmcejNA/ELIKqwrcyWF9PvDQFf21vMKWRlCF
         ptvKNcU0wADX2zzm+ggfAXs6lr0jFCX60Sql4w5ysrlxNwlZ24JwcIp0QyQiR9GxXH85
         ybEw==
X-Gm-Message-State: AGi0PuZfB1L3RFtUCpLx7ENlWe3hR+lI+0gxBSO3qprq6D8Ovim0JOk3
        Vpn3P2siK/lxEIwAFTpTMlqs7/+EWSi3mhhWOXEAqA==
X-Google-Smtp-Source: APiQypK6nkSTANaZW+1a43XoogM3H6sNnq4kMI4xqLyVIWS/PF6q8zPv4riQVVKMftU1hlwobUdBnlrK6GlVZzGsIdU=
X-Received: by 2002:a2e:5048:: with SMTP id v8mr5601989ljd.99.1587034428690;
 Thu, 16 Apr 2020 03:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200408070504.134847-1-yuehaibing@huawei.com>
In-Reply-To: <20200408070504.134847-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 12:53:37 +0200
Message-ID: <CACRpkdYUX5EuRQMj_c+0wJa2pP13MF1jd8T8AjpifeR22kc_pA@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: qcom: Remove duplicated include from pinctrl-msm.c
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Ajay Kishore <akisho@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 8, 2020 at 9:02 AM YueHaibing <yuehaibing@huawei.com> wrote:

> Remove duplicated include.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied.

Yours,
Linus Walleij
