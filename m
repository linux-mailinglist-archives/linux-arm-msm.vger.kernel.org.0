Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E38C91C552D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 14:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728963AbgEEMMq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 08:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728960AbgEEMMp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 08:12:45 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 783BCC0610D5
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2020 05:12:43 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w20so1366023ljj.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2020 05:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jCkYjBhiVEvy0x3Ue8g2r+hn+6C7TksnCaeziOTVJG0=;
        b=QFDGpwpdAjG4puvpxt7yXioyDCQRWv8af8uv28j3ibtUVzeEm40eoEpbjJfCOBHeEN
         nYh+gwUf7GpXOphCOJSSRq5/SrvcRTe/hb6RS+XpqYi8jYaSpk43m3by/tDB162gSyXD
         8F+k7QECoZNvysKdCFSOIHoOxJvt1CFlLt7aClN/mMwdPQkIQ/G65Od+yFoyfBOIsqui
         sLED4V37/OhtshXrK3QiN6QZ09KLvSRmeQguVgo9UXSVEeu5zO73lTc2Os0FeQuxHXFV
         uazREV7iVchOwG9fB7cIX+ZnpSmWkDac/RVVhYef39tZ8IyT4PCR3qJGit3oWLN9iXiW
         PFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jCkYjBhiVEvy0x3Ue8g2r+hn+6C7TksnCaeziOTVJG0=;
        b=T5Fixz2KF7A7UuPjgHhO0JDlXhBH+f0qlXnAZsLkd89cKBhyMfikkcgq7y5g19WSjQ
         Mr9zgxkezQqN6oOHxnwVQ02L+zLNG0eAtFiwLkgkFr/4Hd+t4gMAgvqV0K2MrPn+GBdb
         O0SHEhyTIt0KECyVTimJsrdgIrEJbUimcDYtpTSCs+/e3ZQl/K7IZPxGajY37eoEi6NO
         nfQQoW+oqn9GPArDecF/F6FZKV/5tPGg1CFxDwFzuRoHdEITNlLBcEcAFmZg0XqIKzjA
         t91lLXGnIPNatnEqIf9hebnJCVYtHIcfRlDSmB4Yuf4C7EYzQ1uOzG4bXCoeBrk+6rJt
         s7mQ==
X-Gm-Message-State: AGi0PuZN3FV5TOuKNeusodhCo3R8jGUxd9Px2xKqa7n0UsaZFBoS4zgo
        qqC+D2s7R36QAoGejUQtel0njrrrwKVvxuHyjYKFEA==
X-Google-Smtp-Source: APiQypI4n3wOwtw+5CxzN9WhaiI9i9oWcjIepnnD18HMaud1N/zwYMkYxFtOWeBMr+wDtyiHi2Cq8Q8HPpRcwwyTcmk=
X-Received: by 2002:a2e:2ac2:: with SMTP id q185mr1605622ljq.125.1588680761762;
 Tue, 05 May 2020 05:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200505111204.963-1-manafm@codeaurora.org>
In-Reply-To: <20200505111204.963-1-manafm@codeaurora.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Tue, 5 May 2020 17:42:09 +0530
Message-ID: <CAP245DWxDVBAXU_1uqfA0iuajVCZvZOL4HG4VOOwZ1qMSuuMSA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add 0C (zeorC) interrupt support to tsens driver
To:     Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Manaf,

Thanks for sending this.

Typo: zeorc in subject line.


On Tue, May 5, 2020 at 4:42 PM Manaf Meethalavalappu Pallikunhi
<manafm@codeaurora.org> wrote:
>
> Changes:
> * Add zeroc interrupt support to tsens driver
> * Update zeroc interrupt support in yaml
>
> Manaf Meethalavalappu Pallikunhi (2):
>   drivers: thermal: tsens: Add 0C (zeorC) interrupt support
>   dt-bindings: thermal: tsens: Add zeroc interrupt support in yaml
>
>  .../bindings/thermal/qcom-tsens.yaml          |  7 +-
>  drivers/thermal/qcom/tsens-common.c           | 72 ++++++++++++++++++-
>  drivers/thermal/qcom/tsens-v2.c               |  7 ++
>  drivers/thermal/qcom/tsens.c                  | 51 +++++++++++--
>  drivers/thermal/qcom/tsens.h                  | 11 +++
>  5 files changed, 140 insertions(+), 8 deletions(-)
>
> --
> 2.26.2
