Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A398315AEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 01:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbhBJASs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 19:18:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234518AbhBIX6Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 18:58:25 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD6A5C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 15:57:41 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id c1so392895qtc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 15:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ni+kLVtcTlrajM3nKZXvbMLINRXI7PKiV7Y5/GiTiNQ=;
        b=ikwSd6nowy4AcsWBLFejU/dbKJ2K8oadXzGFiMOvIk5YIFCBImhhKjpV3rYlyR/CTq
         d3wBIE+Emr8tLUzZDF2LA3aSOyj1SXVzy/LWmIpCBh8I9LmVjtzSwd6LOaTvuX+rXjVf
         SQBtFGU+Qymc8efVcmeWjfewSff6b6ZcDNVtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ni+kLVtcTlrajM3nKZXvbMLINRXI7PKiV7Y5/GiTiNQ=;
        b=FFtLM0Eu/uohMvAl4PR2tNslAsimqruyTrZzGQntKlo23tCqKk7NDZj6J3i0BYE3ef
         sh4eTbIHB9hLoFwhHD2V2FkbvdMS49qRSbyjjhVKYJrJe054mH+J2He4YKjENIXj+SU4
         iRcaB2VHbJbf8qKWsPop8LhmR8H5NO7Bct7g9+dCUP9nVZR3awxuZwWB3mKSBu0P9Z6H
         9GuIlIFym2W6mwKp9XPh2BKFUeNbqe4Nsak6z+7CKlatyuWzw5Y+bDvdwYxZcLpoOQl3
         zObZ5TqnkuNn/2eAYqrgxEPgW1hdo7mcEc1tFy1GIAkgktT9Khl/nsLXTYaBF/1zmXhi
         07Fg==
X-Gm-Message-State: AOAM532n0ZCWO6sXwnETFnIZJPBpiisd3XbOBydna36g85koF+d7KGYA
        4omaVGEmlZjm3JU8pZOPJEGy7oAlV/zgrw==
X-Google-Smtp-Source: ABdhPJxYw6WgD6CdBW0eSWt1fkwU5FARoPfclzorg8tETHVJmUyzEkmUf8VlM8EbeeimTt306De8qQ==
X-Received: by 2002:ac8:584f:: with SMTP id h15mr536514qth.104.1612915060854;
        Tue, 09 Feb 2021 15:57:40 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id t3sm236054qkg.91.2021.02.09.15.57.40
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Feb 2021 15:57:40 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id v123so183115yba.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 15:57:40 -0800 (PST)
X-Received: by 2002:a25:aa43:: with SMTP id s61mr617070ybi.32.1612915059631;
 Tue, 09 Feb 2021 15:57:39 -0800 (PST)
MIME-Version: 1.0
References: <20210209202849.1148569-1-dmitry.baryshkov@linaro.org> <20210209202849.1148569-5-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210209202849.1148569-5-dmitry.baryshkov@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 9 Feb 2021 15:57:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xoqo9JPAVYvKBExbio07T6vAuVnkP2VP1ZfqGstKr7ig@mail.gmail.com>
Message-ID: <CAD=FV=Xoqo9JPAVYvKBExbio07T6vAuVnkP2VP1ZfqGstKr7ig@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: qrb5165-rb5: switch into using
 GPIO for SPI0 CS
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Feb 9, 2021 at 12:29 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> GENI SPI controller shows several issues if it manages the CS on its own
> (see 37dd4b777942 ("arm64: dts: qcom: sc7180: Provide pinconf for SPI to
> use GPIO for CS")) for the details. Configure SPI0 CS pin as a GPIO.

Slight nit that it might be nice to mention that (presumably) the only
reason this actually fixed any bugs for you is because you have extra
non-mainline patches to the SPI driver that (presumably) break
non-GPIO chip select.  If it's the same non-mainline patch that I
reviewed to add GPI/GSI support to the SPI driver then I'm not
terribly surprised.  I believe when I reviewed it I found that it was
breaking the non-GPI/GSI code paths.

See <https://lore.kernel.org/r/CAD=FV=XmfpQXhK_tKor-ta+5dqT-aq7OnV1e=VY-vMuXmUQEfQ@mail.gmail.com>
where I said "Why are you changing this?  [...] I'd imagine this
change breaks stuff?"

Really the only benefit from this change _should_ be better performance.


> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Other than the nit about the CL desc:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
