Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66116288DC4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 18:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389382AbgJIQII (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 12:08:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389278AbgJIQIH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 12:08:07 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FAD1C0613D5
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2020 09:08:07 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a23so9336137ljp.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2020 09:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4ZcCjxOSOpKZkXBVNu3kbvFlOdpYb4SLFZlWCNm3nvs=;
        b=kId7MjgANOiI/+Ylv6Eml6mUz2V6UYpbbarNiIwU/UDg4WF/38W60P5M41wGBYulPN
         h4U+CSvlkNQ/Tt9+LJWNrrglFYBsabT3y6nHC5C6mWvNSNhOlo1Aqm8vsN0RN/gHlFR6
         yZOtGiJgvv5bJgkGP4tL/+Ss3MXE/9Ye/Yii2elzkRa5TgFjoblhIZU9pcNKXeXta8rH
         J3o7OBD12f+xyvg5gNooMK3ZvAHW+DWehQt983JT4zie6kAKc2CzhHSbFtx8SyBZq5TR
         zchrOYh+PkejeHYep3CLwBi/L39Zbp28sZ413MXMDogUKQ3SH94SSXIu3CP+4WdwgzLJ
         EIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ZcCjxOSOpKZkXBVNu3kbvFlOdpYb4SLFZlWCNm3nvs=;
        b=B6Ar9v9iatSb7K1stcdyimpN8xmTGLWTaqu3pqMbTDri4EnPOI1VwTjQBIgvboNuLC
         tSAMdp2nkqwK9PAJAWmiJ1tXJwr8a0rHZz1SkerJ3cPJSyyBvIRGAJ07Ev5KWDoExG3w
         Yk6j3BCDOdji7th9JKmH40Q0h/yQIXLKghU9LJFsRCPZmUwz0cOLmyrn+HLTCb5npWfM
         grXZ7kqQWZ31zPv1chqG0NCP3lPoNqwgdYiVEjG+tqmUmS0BQCqv+UgcSt+TGpnClFEH
         tZpvFUs6B+2ys/dDRFobDRY+TepYqKAQ8UNvnCcA5Yi6sdY20+3eJLFNnIZQUd8NCgII
         hAyQ==
X-Gm-Message-State: AOAM531rMSjeGLX9qPDTspbGVm1oN7UvCXz+Un6kaAPnlM2ZQLRetJCi
        QcGScHBBpp6WtqP+Dph37ADKd162x90Q+vscI55t1w==
X-Google-Smtp-Source: ABdhPJwFSo8884+HnefvGr5GaVc7mN7PXC03bxgHqIJryOslbYdT9kfJA9VLDlJsm2yN/L2vO5Fcn6GXV0aalX+i164=
X-Received: by 2002:a05:651c:203:: with SMTP id y3mr5202695ljn.457.1602259685527;
 Fri, 09 Oct 2020 09:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
 <20200928063744.525700-2-ajye_huang@compal.corp-partner.google.com> <20201009135231.GA6655@sirena.org.uk>
In-Reply-To: <20201009135231.GA6655@sirena.org.uk>
From:   Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date:   Sat, 10 Oct 2020 00:07:54 +0800
Message-ID: <CALprXBZAFCOpWP2186RaP++613qnjPY3D3NbXEN5CToYsLNsRw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] ASoC: qcom: dt-bindings: Modify sc7180 machine bindings
To:     Mark Brown <broonie@kernel.org>
Cc:     Ajye Huang <ajye.huang@gmail.com>, linux-kernel@vger.kernel.org,
        dianders@chromium.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rohit kumar <rohitkr@codeaurora.org>, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        Cheng-yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 9, 2020 at 9:52 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Sep 28, 2020 at 02:37:43PM +0800, Ajye Huang wrote:
> > Add compatible "qcom,sc7180-sndcard-rt5682-m98357-2mic"
> > for 2mic case.
>
> This doesn't apply against current code, please check and resend.

Hi, Mark

Thank you for your reply,
This patch depends on  Cheng-Yi's patch series
https://patchwork.kernel.org/patch/11773221/.

  If I misunderstand what you mean, please correct me,
Thank you,
