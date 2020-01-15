Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA2CC13B80E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 04:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbgAODL2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 22:11:28 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:39876 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728879AbgAODL2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 22:11:28 -0500
Received: by mail-vk1-f196.google.com with SMTP id t129so4291742vkg.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2020 19:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ztj1hvO+WNVO+LNPV45474E/vfF/Pm9unbmeASb7NPA=;
        b=fAd2viFGmbBR8ZdFtpgvR+MYV5gshPH+9J4I8bVUF1JSXizaTydbFd3YzCEJG/Uhwm
         bt5fynuF1MlcRJYnjbuC+1/+Cz2lOaCcPOB05Z/Cm3DK+NnyCS7/OUT+geia3JjtPN8u
         xya4laWGuWdTzozjuIsMhQ3DFtjoqhCM1CM6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ztj1hvO+WNVO+LNPV45474E/vfF/Pm9unbmeASb7NPA=;
        b=XeuTepW3tPDFTci9/cQgWHw2I8OJaljTes11yRO4oOFSCO2IFmYKWonYjfBejBMGbM
         NIzDWSRKhsgxs2H0iAnEuE7Avng6kNH3dBu7FV1672rRQRfKfvosGE6fE2TpoE7AXP5R
         tp1pCbIn+vkMDfIAgNvczGA6SaG/e5eLWyMXXmdrYJCUoDu9RBEFa93uybNrDwyHz8ak
         nzyYI17pBdKkNOaP6KRkIVTVakk8W8u4JJorsk1QRQLiEPKgChoLeGPht4bqFupGg7hs
         +dRrezQJCdX7j/ssEftbENfOuz9Z2+JUcxi/BfqSafvzC1QcSZG6OGI4i9XZ4w/yLNrt
         SUVQ==
X-Gm-Message-State: APjAAAVIyWrl9C40qojLTQhThSpMIBKlfsrvt8s5tm8feyttn3SbtyhG
        3j2ess0QsZytkoVJArQFI0f9rqaWiDQ=
X-Google-Smtp-Source: APXvYqw5ARouPcoM6iwS60AKwJ2Vz3QyRCVWkZp3B5WI2Ol2H8JDo2rBB7eACR+OqURmtDDwGJ5TRg==
X-Received: by 2002:a1f:434b:: with SMTP id q72mr12978338vka.53.1579057887392;
        Tue, 14 Jan 2020 19:11:27 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id i65sm5141766vkb.1.2020.01.14.19.11.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2020 19:11:26 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id c129so4291085vkh.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2020 19:11:26 -0800 (PST)
X-Received: by 2002:a1f:c686:: with SMTP id w128mr13064603vkf.34.1579057885834;
 Tue, 14 Jan 2020 19:11:25 -0800 (PST)
MIME-Version: 1.0
References: <20200115025314.3054-1-swboyd@chromium.org>
In-Reply-To: <20200115025314.3054-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 14 Jan 2020 19:11:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V=Ys+RLHd15+Y9c2Auiytbq821CAXLb-tMe__Rq48uDA@mail.gmail.com>
Message-ID: <CAD=FV=V=Ys+RLHd15+Y9c2Auiytbq821CAXLb-tMe__Rq48uDA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: pm6150: Add label to pwrkey node
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jan 14, 2020 at 6:53 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Some platforms don't want to use the pmic power key as the power key
> event. Add a label so platforms can easily reference and mark this node
> as status = "disabled".
>
> Cc: Kiran Gunda <kgunda@codeaurora.org>
> Cc: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/pm6150.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
