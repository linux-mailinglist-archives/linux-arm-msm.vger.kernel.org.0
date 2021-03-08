Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0551331B0E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 00:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbhCHXmf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 18:42:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbhCHXmM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 18:42:12 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 259DFC06175F
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Mar 2021 15:42:12 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id d16so3642955oic.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Mar 2021 15:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=YrX8nTHKYz+wW05r4DDWAogxqn1kNrxGp5s6iI1zmb8=;
        b=PydUBXPfTCq16UXhSwXy2SL5lt2a/SEWn0gWcVtN1FAWhXP7eCb71Hql14VEXbQlUF
         TZ6dqND2hdfGTLY5yfdl4QiZcBuUw+y0cN//T2s7BIHU3ZPtl/bgwGpS1JGfDmDlwaCB
         d7V4Y6yv83pUKtafFO7kRWP2CI7035d78MI1jdaYkj5E+KaasNEClTY+qeqQQbTjhKjG
         cQvmlAn7u9XdHESFIBhMcVAvVddRuwyK6ngJjCLQ+LoIvCFf48TcjMHuiLQASwypw8Zc
         NL892D4Ppl5oQ/QMYtWcIJbjQRgNqYOi0BRXKMuN3YQuPe1hUl535qD05dtQX3PpKWm7
         kAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YrX8nTHKYz+wW05r4DDWAogxqn1kNrxGp5s6iI1zmb8=;
        b=FkLDlL+y+AZkXM3L/V0KWBp0iythDViUVp9Ug2IGlX5KMXnECWGIhdNB8gf7rNOu8d
         QVsiloa1e+Na98k5ieJegc2jzVTe2uJGgoquFgKT3u+VOQpv8oTxV4Bt6MJegxf4Iami
         rDV076Mv3vIuxzjbIf/fbnxFD7skpKnp05smLuUf2UIjUqP9y1kCk1kxOuDRsKIVJokK
         LApSeKTAu4YubH1UA5C48gZBpy3JTimvxQzL3lLeCELqEsF80lFZgVuhQSQOcnNI3b27
         VYSauTEciNdb5MhqVPMG5nC+xSyYiEDtzRmvctiApgNsToB7G+2OmaWo3YDu+rop6sm4
         wN+w==
X-Gm-Message-State: AOAM533uCV25cQ9Waa3Eun0WlGEZeLcl/7iWZLHeMe8nC/sYY7C0AOzw
        YglLmvSYArBro/fPQdP2zro5RjY4ror3zg==
X-Google-Smtp-Source: ABdhPJygOUyLJe9Z8aYpm9+HTWm+5ZirrxkanbqfQrWhD7PNt4T923+4y+WubgqcuhbRrNG08ztQJw==
X-Received: by 2002:aca:bb04:: with SMTP id l4mr973700oif.9.1615246931532;
        Mon, 08 Mar 2021 15:42:11 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g34sm612489otg.51.2021.03.08.15.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 15:42:11 -0800 (PST)
Date:   Mon, 8 Mar 2021 17:42:09 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: sc8180x: add ACPI probe support
Message-ID: <YEa2UWn26IMg1fii@builder.lan>
References: <20210304060520.24975-1-shawn.guo@linaro.org>
 <20210304060520.24975-3-shawn.guo@linaro.org>
 <adf598dc-d000-15d1-d14d-b782455507f2@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adf598dc-d000-15d1-d14d-b782455507f2@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 07 Mar 05:54 CST 2021, Konrad Dybcio wrote:

> Hi, 
> 
> >  
> > +static const int sc8180x_acpi_reserved_gpios[] = {
> > +	0, 1, 2, 3,
> > +	47, 48, 49, 50,
> > +	126, 127, 128, 129,
> > +	-1 /* terminator */
> > +};
> > +
> These can vary per device (unless Qualcomm is enforcing something on
> the SC platform), so I don't think hardcoding is a good option.. Isn't
> there any data being passed on which ones should not be touched?
> 

You're right, this is both ugly and error prone.

But we looked at the same when we added support for the 845 laptops but
where not able to find anything useful. On qdx2xxx the solution was to
pass a list of GPIOs that should be exposed by the driver, and only
those are made available, but nothing like this exist on the WoS devices.

Regards,
Bjorn
