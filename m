Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E16D2421C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 23:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgHKVRZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 17:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgHKVRZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 17:17:25 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65AEEC061787
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 14:17:25 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id 1so44021vsl.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 14:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y6METftXhKSKa4OJt8K+q8U+3V8Jq6aEorQMb99jfW0=;
        b=aediAnXzrsIsrvtUll1amabGwpepmtJ394qjWBNHZ0ZsjYESbfEhdOR9crzTm+iKoc
         C2znHUO5M7sdH7rb0Pkd1Ha0SusGVyHpnQlM7KjFQM0Ioa70gSeSag84l4BXHv84HhOb
         i+vQZuMhUFtXeL04J/JHVzYQlobEA10bxYqVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y6METftXhKSKa4OJt8K+q8U+3V8Jq6aEorQMb99jfW0=;
        b=ljEXV5vwJa9WkVrfAg3VrpEx3UjSfdgCOkfZCHtKOsHDm074J2pw8VE6CK3n128Ur2
         vxr6APEDYtRRGIXlXyJX1OfCd/iCcdg4yvPv9QGfZWLEDU8M8cwWV3dxfuNNd2fUlWRa
         9taKGS7oB4PwxgcNlI/9wJWx5pdUctLaI+Hv9iQgEm+ORfqoNnWmmV/sEFfDhs7ygAaI
         ljzBdUM0FaGyrCQRZ1HuAlXQs8yuLrB92iN8sTWEmx0jSA1GaT8DTYMDUcB4HhR04YRN
         Ec9EEZunNPvWHHvHyGDw/Mwlvx362fIn3F6v3uQDtagd7ojONfCbiS50xNKi0+oaxz6z
         LQPg==
X-Gm-Message-State: AOAM532qcLzLQeCbs4CsXiQAwHz3dlpHsThP5msG1+hyB8z2QV3g4zw5
        mEYMWJKOW2U/kpBlXw3eIlhiybKEOwg=
X-Google-Smtp-Source: ABdhPJyuXKD4dDzjmyAjhyPE5GeFj9D4YpxK6nuFt5K8SOtWhfvBWNZp1Wc8lYF8kOhMZnghz/5UvQ==
X-Received: by 2002:a67:fe15:: with SMTP id l21mr25280802vsr.78.1597180643844;
        Tue, 11 Aug 2020 14:17:23 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id e127sm31782vkg.5.2020.08.11.14.17.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2020 14:17:22 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id o184so46232vsc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 14:17:22 -0700 (PDT)
X-Received: by 2002:a67:fd67:: with SMTP id h7mr23572394vsa.121.1597180642357;
 Tue, 11 Aug 2020 14:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200811190252.10559-1-sibis@codeaurora.org>
In-Reply-To: <20200811190252.10559-1-sibis@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 11 Aug 2020 14:17:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VtPX19o-tdyPBT=07AgbT7kWKhjpuU4d22SQ5D0r=jog@mail.gmail.com>
Message-ID: <CAD=FV=VtPX19o-tdyPBT=07AgbT7kWKhjpuU4d22SQ5D0r=jog@mail.gmail.com>
Subject: Re: [PATCH 1/2] PM / Domains: Add GENPD_FLAG_SUSPEND_ON flag
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>,
        "Brown, Len" <len.brown@intel.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Kevin Hilman <khilman@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 11, 2020 at 12:03 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> This is for power domains which needs to stay powered on for suspend
> but can be powered on/off as part of runtime PM. This flag is aimed at
> power domains coupled to remote processors which enter suspend states
> independent to that of the application processor. Such power domains
> are turned off only on remote processor crash/shutdown.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/base/power/domain.c | 3 ++-
>  include/linux/pm_domain.h   | 5 +++++
>  2 files changed, 7 insertions(+), 1 deletion(-)

Seems sane to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
