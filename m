Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8FDDF268C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 05:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733127AbfKGEY7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 23:24:59 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:35969 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733076AbfKGEY5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 23:24:57 -0500
Received: by mail-io1-f65.google.com with SMTP id s3so803763ioe.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 20:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NkSeoMnuWg5T7g24I3SC9PrtQXIiA61Z2VNxVdt/qfE=;
        b=KeT43MVjU2B4DpAy2SYkA6NIhlp0NXSIvrPo/xsJrBm01MgR7r5J7gwjL6ER2SKvvu
         6zZI/iChBctFpUxgVnyp2K9HXsspnceqjcg0uSaOkMkVpQYDzb35q4B4mpiwWuV4v6yj
         34iZRafJSCVKeLd8feC04XhdnMKrH3chAmGDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NkSeoMnuWg5T7g24I3SC9PrtQXIiA61Z2VNxVdt/qfE=;
        b=JrAsvwPkgrF53Jyeal5dVUIvKxZ+ZicjgKFVkWiOpbVq93Mejb96d2nT32ZjDALdHk
         /bzrIUNKnAtopb3z/IPmNb1MuC1v0hcPmpaVYIdIfomLu02bg22L2rc1QmI3CDWEu5Nw
         ZUSzZdzGxVLHT2iTFCYJUrJoLlEGx6yzOpzZKMNH3pOqMr7lvPtQD5j2RwlgY1iC9D9f
         LK4fiA/SP47dQrwINQI6RzymDTGdRxbaOXIDzFrpuPXV0sA2tSwVd1IWK9qEleRp9THP
         S6Ei/9xLXMJ6IFclTgKximozZd1fCD6gbYbyrHoRmHIrvYPKCnViY7yLNOtRXs+ikybo
         PssQ==
X-Gm-Message-State: APjAAAWHFDtBrsPMPWW4v2oKCsD0ZybhHRy+wnlBvU82SaSqtC+etFWW
        7PvFodfhyvNbq3jRqA6L6mmYg1coY9U=
X-Google-Smtp-Source: APXvYqzZq+SdEW6XTYReDmLak565N9RAWZEOL2iaLujqAYivk8Jj2CxAsxcrTVmXxuHApx1XNfMu/w==
X-Received: by 2002:a5d:8056:: with SMTP id b22mr1235663ior.60.1573100695623;
        Wed, 06 Nov 2019 20:24:55 -0800 (PST)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id z19sm132119ilj.49.2019.11.06.20.24.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2019 20:24:53 -0800 (PST)
Received: by mail-il1-f179.google.com with SMTP id s5so574092iln.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 20:24:53 -0800 (PST)
X-Received: by 2002:a92:109c:: with SMTP id 28mr1827293ilq.142.1573100692855;
 Wed, 06 Nov 2019 20:24:52 -0800 (PST)
MIME-Version: 1.0
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org> <1572524473-19344-2-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1572524473-19344-2-git-send-email-tdas@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 6 Nov 2019 20:24:41 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UjwO25HeVtYvzqEdUxyA4ED18ZxcwEaYVzBGRFTa2FTw@mail.gmail.com>
Message-ID: <CAD=FV=UjwO25HeVtYvzqEdUxyA4ED18ZxcwEaYVzBGRFTa2FTw@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] clk: qcom: clk-alpha-pll: Add support for Fabia
 PLL calibration
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Oct 31, 2019 at 5:21 AM Taniya Das <tdas@codeaurora.org> wrote:
>
> @@ -1141,15 +1160,11 @@ static int alpha_pll_fabia_set_rate(struct clk_hw *hw, unsigned long rate,
>                                                 unsigned long prate)
>  {
>         struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> -       u32 val, l, alpha_width = pll_alpha_width(pll);
> +       u32 l, alpha_width = pll_alpha_width(pll);
>         u64 a;
>         unsigned long rrate;
>         int ret = 0;
>
> -       ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
> -       if (ret)
> -               return ret;

My compiler happened to notice that with the change to this function:

drivers/clk/qcom/clk-alpha-pll.c:1166:6: error: unused variable 'ret'
[-Werror,-Wunused-variable]
        int ret = 0;

-Doug
