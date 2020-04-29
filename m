Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA1B1BE529
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 19:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgD2RZ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 13:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726891AbgD2RZ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 13:25:57 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E32DBC035493
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 10:25:56 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id e25so3498502ljg.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 10:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aNxv6rQtebyNNMCF9fwKOf5NaXPv9WQ951LjP87jpV4=;
        b=f/x12QLKwjCA9Qqv2F6euWmFVtbkLRcbzdbfbb58NNpcby04ma9Im4Lz9zVf1t1Vzo
         FMCzTZ/0VZ1wqGyJ0saZCALw7AgylQXjKDGVrEToO5XadquQd4O1kTpnFkEE/f5WPPof
         IOukIKVPV25IHATOAAYECOOhpgj+pKHmFKSO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aNxv6rQtebyNNMCF9fwKOf5NaXPv9WQ951LjP87jpV4=;
        b=c+wJazwxpkVSgYQZlwkg2prmlyMk4AwYO4ITolbsw6YOndjGSIbc5dB487s58YN+uY
         yMCOqyzl+NtSfmxnrnLiFQllU8TABQzjzN1FtD8hM6yV0Mz2F7jKxAKIFsbBQWnsVb6o
         EFBzQ3RG6lZdr0kpt7G9v09M+bwfmwvTVNjh7CZpo/JSkwT1oOEgCIm4UNYrTLfUE+kz
         Hi3Nh+lTsrjMpNI0KB9I58ylAOu+62fAp3mzFtUwPLWhwNfWE6394NcKVL+8iG4aMMVi
         hStG1+rQ7dOF3WI3PAhJfVvdpa1E6Y68dNeex2YZ/EAf5DbkPg7dsoS7jO+fGZYFcSUH
         fNlA==
X-Gm-Message-State: AGi0PubpCgE3nwnoLXNWdfBOvlWJEWu7ZEEhIZ3UNid+vu8BXmWpjzbS
        +WXaC8yTz1jqT39JEZoFz99iEq6f9+Y=
X-Google-Smtp-Source: APiQypKPi7y63U5s6BBVgL/Sa+vSdNbkPuAKoMkemgxfpOaAQLZ8IU7e4v1GdnWIul2abuKj46HviA==
X-Received: by 2002:a2e:920f:: with SMTP id k15mr20145848ljg.131.1588181154796;
        Wed, 29 Apr 2020 10:25:54 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 130sm3092708lfo.42.2020.04.29.10.25.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 10:25:53 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id g10so2343184lfj.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 10:25:53 -0700 (PDT)
X-Received: by 2002:a19:7909:: with SMTP id u9mr7487789lfc.130.1588181152446;
 Wed, 29 Apr 2020 10:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200421143228.8981-1-sibis@codeaurora.org>
In-Reply-To: <20200421143228.8981-1-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 29 Apr 2020 10:25:15 -0700
X-Gmail-Original-Message-ID: <CAE=gft6BmZ2UNyrgs_c_O56rjvyA7D4w+T59Ze7q0ythD66eRw@mail.gmail.com>
Message-ID: <CAE=gft6BmZ2UNyrgs_c_O56rjvyA7D4w+T59Ze7q0ythD66eRw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Add PAS and MSA based Modem support
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Ohad Ben Cohen <ohad@wizery.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 21, 2020 at 7:32 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add PAS based modem support on SC7180 SoCs and update the device node to
> support MSA based modem boot.
>
> V2:
>  * use memory-region to reference mba/mpss regions [Bjorn]
>  * move peripheral memory regions to the board dts [Bjorn]
>  * overload the base remoteproc_mpss node wherever possible [Bjorn]
>  * Pick up Bjorn's R-b
>
> Patch [1,2] - Add PAS based modem support
> Patch [3,4] - use memory-region to reference mba/mpss regions
> Patch [5] - Update reserved memory map
> Patch [6,7] - Add PAS/MSA modem nodes
>
> Sibi Sankar (7):
>   dt-bindings: remoteproc: qcom: Add SC7180 MPSS support
>   remoteproc: qcom: pas: Add SC7180 Modem support
>   dt-bindings: remoteproc: qcom: Use memory-region to reference memory
>   remoteproc: qcom_q6v5_mss: Extract mba/mpss from memory-region
>   arm64: dts: qcom: sc7180: Update reserved memory map
>   arm64: dts: qcom: sc7180: Add Q6V5 MSS node
>   arm64: dts: qcom: sc7180: Update Q6V5 MSS node

Tested-by: Evan Green <evgreen@chromium.org>
