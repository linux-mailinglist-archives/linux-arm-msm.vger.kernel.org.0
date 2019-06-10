Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 995DB3B02B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2019 10:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387781AbfFJIDE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jun 2019 04:03:04 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38468 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388227AbfFJIDD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jun 2019 04:03:03 -0400
Received: by mail-wm1-f66.google.com with SMTP id s15so4719365wmj.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2019 01:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=u82TTwb8ixlFfrNUJnFoGiqW7vUPbpvM9WdQFkW0Sgo=;
        b=ILTcYwTEN0sqsAHKFcmwrFWMuSfyNM1NchlalYVj8bFmYmVu6fm/AHxWHvy+r5vmfm
         0D/FGWCMsEkO/oOofk0C0YtrlvwLhDhYC6an9C7JRnbAARt2r2tBQZXsQqDKGziDxVjc
         Z/aZhho0FcHYIrxyszQIHhvUw5nWnk2+Epw+hO8WzVSlHagZmy+fE4XxMeN0HLfY1fQa
         YcPAqgiPJxAsz78MsL6jn7fb3aAuGThiJ1jBNR2QdIz2RihvMb2NwDFsB9DqgMnDwIB3
         ZzJ3nTCgumg+ALD2kzR59+lC7LqoxXgFTJvASWAsgttbe5X+Qgz1Nff8floBpqRHbNKG
         jVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=u82TTwb8ixlFfrNUJnFoGiqW7vUPbpvM9WdQFkW0Sgo=;
        b=oL6qtY2nnizRzyU2hV+n2gxVM5WsGdvRg/Wgq3xcp7vQX6zMWQgYIg/S6T1iGLs4Ij
         q4pb0iuTcaCy3wxy+wccA9+ffcYRae6A1U4AdxduYIM5YhGuYPB1DN10wHCUj859xnjY
         JE6lBPtqYoQpzuvaNDLvqYOXTOfqFiklbe5kIEgUS1g3v2g5iKDITwoIAIfnSYkuyT3R
         fFaHMyE1H/l9CiQAf1tHM5UVoVgl4HjxyYuEktZAJywKbJ0Zt9rB4NPLhJQXwS/xgkIY
         CWRg1kyUW9k64cJJrvAR7zRWn5p/8t266FfimN3wm/UYye1/wyQoVvIYy/Tl523jOoQz
         U7xw==
X-Gm-Message-State: APjAAAVnjTL/oTvmdYIbQXTQ6wDntB7//nM5QP2EcXRnPUqfXH30gsLO
        gFoPQXavuWDvXKvvtSK4p/aCXQ==
X-Google-Smtp-Source: APXvYqz65id5SFfU8rn9yGZIaRt4Ct2BsHn+rIV/wkq2ik8juXBU/IcNLZAF70j8d/PFOU51TXB9nQ==
X-Received: by 2002:a1c:8a:: with SMTP id 132mr9007662wma.44.1560153780728;
        Mon, 10 Jun 2019 01:03:00 -0700 (PDT)
Received: from dell ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id s8sm16879674wra.55.2019.06.10.01.02.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jun 2019 01:03:00 -0700 (PDT)
Date:   Mon, 10 Jun 2019 09:02:58 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        linus.walleij@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, jlhugo@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/8] pinctrl: msm: Add ability for drivers to supply a
 reserved GPIO list
Message-ID: <20190610080258.GI4797@dell>
References: <20190605114302.22509-1-lee.jones@linaro.org>
 <20190605114302.22509-3-lee.jones@linaro.org>
 <20190608040610.GJ24059@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190608040610.GJ24059@builder>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 07 Jun 2019, Bjorn Andersson wrote:

> On Wed 05 Jun 04:42 PDT 2019, Lee Jones wrote:
> 
> > When booting MSM based platforms with Device Tree or some ACPI
> > implementations, it is possible to provide a list of reserved pins
> > via the 'gpio-reserved-ranges' and 'gpios' properties respectively.
> > However some ACPI tables are not populated with this information,
> > thus it has to come from a knowledgable device driver instead.
> > 
> > Here we provide the MSM common driver with additional support to
> > parse this informtion and correctly populate the widely used
> > 'valid_mask'.
> > 
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/pinctrl/qcom/pinctrl-msm.c | 18 ++++++++++++++++++
> >  drivers/pinctrl/qcom/pinctrl-msm.h |  1 +
> >  2 files changed, 19 insertions(+)
> > 
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > index ee8119879c4c..3ac740b36508 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > @@ -607,8 +607,23 @@ static int msm_gpio_init_valid_mask(struct gpio_chip *chip)
> >  	int ret;
> >  	unsigned int len, i;
> >  	unsigned int max_gpios = pctrl->soc->ngpios;
> > +	const int *reserved = pctrl->soc->reserved_gpios;
> >  	u16 *tmp;
> >  
> > +	/* Driver provided reserved list overrides DT and ACPI */
> > +	if (reserved) {
> > +		bitmap_fill(chip->valid_mask, max_gpios);
> > +		for (i = 0; reserved[i] >= 0; i++) {
> > +			if (i >= max_gpios || reserved[i] >= max_gpios) {
> 
> reserved is a list of GPIOs to reserve, I don't see a reason to check
> if that list is longer than the number of GPIOs (i.e. the first half of
> the condition).
> 
> It wouldn't make sense to be, but there's no logical issue with it and I
> had to read the conditional a few extra times to be sure what was going
> on.

If nothing else, it's an early hard stop in case someone forgot to
terminate the reserved array.

> Apart from that you have my
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks Bjorn.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
