Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 539AD2E8408
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jan 2021 16:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbhAAPCD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jan 2021 10:02:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbhAAPCD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jan 2021 10:02:03 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22916C061757
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Jan 2021 07:01:23 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id r9so19262076ioo.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Jan 2021 07:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4kOOgFh/zi2+/uyxh4R8IVKK26WWC6dix8EesJk8UgQ=;
        b=ScQkhb2ARawCMMkFt4VGyVuoR+8DlbdULa9BZqN4mG7fxP1WEN+IQxc+iKaXmqQQaI
         tpjlalLAlq4+DDnmhhkTAnaugLYm2c6loXLMg9Tm0x5vX8bCnGsblkE+EHOBplUY/pAW
         r5//4HjjyI1aamNSmzTgvell1tF2LBFughZnIifQgzISXDw/M+DWdpj+sB1DkCdl/Vi1
         EQiLTebLRaGr8V4VLqwdSyhW8ogjf6SKOKuFLDhwThb+D/uQUxZPZzJIl8erpdJQvZya
         lEFmXw0fdCeK6p30w0aacGtw7y505vrZ3+ZPBKx++1bNVp/csp1swkxOcZCqRZb6mjjG
         FAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4kOOgFh/zi2+/uyxh4R8IVKK26WWC6dix8EesJk8UgQ=;
        b=MNho+/1niTqR6lOKwzyrEtjTgktpay/CV7oj9hGcX/wbIAtnCjPBoquhX9jZEtr9ve
         G6/sS+8tGDlAsA1iBzgMPdvcPjIWZE2VEfJ5rPAuqT+V7X0gZfo/qi+pICqut2R8o65t
         G5DDFMcT1BYpQ7bxEu6JhSS18OaWbpHDyZTlD/nPhlQy+dl+Fz6752Wrq/gBQTq5Bck3
         yhIzbeXSkxuJ8SwAUlHYWMeK0N9LM+5IFGF2hpB81oAIPZ3s/mLojVV4yVomMd+zuxSg
         BFxoIp4cKxUikNJGyriX4mp1vj4FFUQir+Z8fmGQZ28V67Ezb2t25qgctE16yryBWiBY
         6Xjg==
X-Gm-Message-State: AOAM533J4G+93XyGwzcZE5nf4kmkg7/4956VDL4mPCr9NvugugXczdsF
        QvmBYiRodNLX4okgdRf4pmLCv7Pwp3qCklQ8dlbH2g==
X-Google-Smtp-Source: ABdhPJyuVgicao6uOosuEf7TN2BXLu15pH6KocfaAg4Di1HEyLzL85htJbnovjvLfSvQH+bi6NBlCd5jCpsAcJ5Apkg=
X-Received: by 2002:a6b:b205:: with SMTP id b5mr48481978iof.190.1609513282236;
 Fri, 01 Jan 2021 07:01:22 -0800 (PST)
MIME-Version: 1.0
References: <20210101022451.21882-1-shawn.guo@linaro.org> <ecc0ce97-742b-752e-0030-d1c4169c6f24@somainline.org>
In-Reply-To: <ecc0ce97-742b-752e-0030-d1c4169c6f24@somainline.org>
From:   Shawn Guo <shawn.guo@linaro.org>
Date:   Fri, 1 Jan 2021 23:01:11 +0800
Message-ID: <CAAQ0ZWQstwudg=a3wpQdSXEbWFGkci5xkpaMfauWgqMAN=vXuQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: c630: keep both touchpad devices enabled
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 1, 2021 at 10:32 PM Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
> Hi Shawn,
>
> it seems like by doing so you're overwriting the I2C host pinctrl, so (unless that's intentional) the more correct fix would be:
>
> pinctrl-0 = <&qup_i2c3_default &i2c3_hid_active>;

Ha, yes, I missed that there is already some default pinctrl state set
up in sdm845.dtsi.  I will fix it with v2.

Thanks for spotting it, Konrad!

Shawn
