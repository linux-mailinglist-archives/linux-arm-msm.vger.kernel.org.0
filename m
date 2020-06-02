Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 084F81EC137
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 19:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbgFBRjw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 13:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgFBRjv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 13:39:51 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD5BC05BD1E
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2020 10:39:50 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id z206so6687571lfc.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2020 10:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WFiNn0czVB+5Qq9qqdAj5GWmVsqpkK4lAR8rumTBlGI=;
        b=Ylu6kQeCiib8NSRj21Glov2/3k76t5BUisJNWTzmtl0NInwNiQekUahRsaCY986xQj
         +i14XNoukMO/gkMjW/DGRgytDn8FdWidix9tjt4lcw/R4hip81CyQ0Hb/OelssRrnFWW
         shR+LH6YHd83epU1et01q3pe9k1pQQ9wK2D2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WFiNn0czVB+5Qq9qqdAj5GWmVsqpkK4lAR8rumTBlGI=;
        b=DeDzjfHSwNZmc0f79ySKC4kOxhrNEqVkPT70o6OH5YiQqcwsRaZa64Dx6SqLNqtt0/
         BUnv/+9SOF8GYVcXUknVPXYgICnfWIIiMDHvmrrVMoZ0yWcInxhefTWwz3dvdhQrH6QB
         beBvpLDydEBqk3q6koHshmXjus38ik+VjaCVeRtk18EnmHTg3yKUiNcLCYv0Tmoe3ls8
         zYr/rksQB9WK5rkGe/PiC1xk+UMSK8VnNyQ0fnA+t8e0M01GVz+fuYAiZKnUqNF2mkYF
         qTAzmF2HOPL0nfkqGsqZUGwWlw3Qjy5SgOTQ8vq/6drcsar5Gm2Ifzx7eVk8IZ8IFdOU
         4rrg==
X-Gm-Message-State: AOAM533/3gbfTVl8w8BCtqNr/TWX7SBgcAxoQpDvtxtusc8R72E52mpY
        Hc3Q1EhDxVYz4z7wm53u9Orhkf0EUO8=
X-Google-Smtp-Source: ABdhPJzYBmAP6dHrFGKxXFwJKPF1HEIMdUesAYGt8X4lGdyuAPEunMhm0EFNWkzPdd+UWgbG3p1Tig==
X-Received: by 2002:a19:4048:: with SMTP id n69mr250355lfa.31.1591119588464;
        Tue, 02 Jun 2020 10:39:48 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id d22sm843841lfn.84.2020.06.02.10.39.47
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 10:39:47 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 82so6692692lfh.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2020 10:39:47 -0700 (PDT)
X-Received: by 2002:ac2:44bb:: with SMTP id c27mr257871lfm.59.1591119586548;
 Tue, 02 Jun 2020 10:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200602163257.26978-1-sibis@codeaurora.org> <20200602163257.26978-2-sibis@codeaurora.org>
In-Reply-To: <20200602163257.26978-2-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 2 Jun 2020 10:39:10 -0700
X-Gmail-Original-Message-ID: <CAE=gft5RNxfUwDBrFe=NTXm5P75Bp19SRX-bL8kyy-dnr2P3xg@mail.gmail.com>
Message-ID: <CAE=gft5RNxfUwDBrFe=NTXm5P75Bp19SRX-bL8kyy-dnr2P3xg@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_mss: Remove redundant running state
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Ohad Ben Cohen <ohad@wizery.com>, rohitkr@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 2, 2020 at 9:33 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Remove the redundant running state, as an equivalent is maintained in
> the common q6v5 resource handling helpers.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

This variable was written to and never read, sigh. Thanks for cleaning it up.

Reviewed-by: Evan Green <evgreen@chromium.org>
