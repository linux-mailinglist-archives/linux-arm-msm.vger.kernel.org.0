Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5219A8D80
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 21:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732616AbfIDRHG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 13:07:06 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52909 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732613AbfIDRHF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 13:07:05 -0400
Received: by mail-wm1-f68.google.com with SMTP id t17so4129093wmi.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 10:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=OmbrMDzjBpiOxmAtJ5tpbDIpWnFC6mZzSWfiYEEna1k=;
        b=DT59i1R1IVCqVqjH/Pzz6nG1z04AT2jwcDTq/Hjuv5d79AwcEZu8Bm9ozefrl/gopQ
         SCFql3VM6ygPT0Y8fJZ5na+4iFOeAal7ie6ABTtEjeoRbpfTEh1arj3246ow5U+lHc7b
         U9FudxoN5QN7fNtoIOLXlqUaGJo3FvuTZ7WEcvVvliP5sA15eGmWBOxL5JbmJtk4L3KA
         hcgbAB8GV9LSqUj+z5G8iL0gThz8xJutMlKEE1aQj89RsleDV35ljWat1/g30Syt9567
         FEoJDA5Kdg6L72aGtyGGagxhsnvP/eusL1TnlQd78QrMGhYVNH33Ad7GQvoiqrj2+MXk
         svig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=OmbrMDzjBpiOxmAtJ5tpbDIpWnFC6mZzSWfiYEEna1k=;
        b=c3oPzEhHyFWJspQLMyUSpfo8iWbs2DMG+0YDcOxaENoyJTK+qrxVMiDPpkb9wMjh/C
         tcW3lYKw6vOaQnevS15aNKP5bFl6zXxUSEYE7Npc0Vizb4F81kxhpd+KZBhyuzbMeQxe
         ddq7qZ2+3lywfPOcVCJKh1KleqxXH/Pp7z7CP+TLyPs1nMxvjqkxC0R3eiMBy+cESBqb
         uUM+X1TJ5bMVND6qUcfxJ42qOaw3RIVX9LeVzWSHOAKfcEj5NCD9HFdHxCcGhrQ2ZIr7
         HPThK+pst4CqYiioweWW+RDkOsQwCTZzApKwUOj+bqPAMyYq3Py5wV0maEaYtDyZnb9k
         nwuw==
X-Gm-Message-State: APjAAAX6xNK0aMvGA7VCEY9Jx8fi9WcNW6caRUQywHDFwZEzDWr2hRUn
        Dswn5J9xwLkw5I1mcbqMY6oUl7+L8gk=
X-Google-Smtp-Source: APXvYqw1tqP/h/YX6foxFEa/SPKEduE11Gj2PCn45FoInpy6jTOi7mrXrxeQ+Jh3ASfHe5VUL9HNFg==
X-Received: by 2002:a7b:ca4b:: with SMTP id m11mr5138400wml.144.1567616823581;
        Wed, 04 Sep 2019 10:07:03 -0700 (PDT)
Received: from dell ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id j18sm17633627wrr.20.2019.09.04.10.07.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 10:07:02 -0700 (PDT)
Date:   Wed, 4 Sep 2019 18:07:01 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/1] arm64: dts: qcom: Add Lenovo Yoga C630
Message-ID: <20190904170701.GR26880@dell>
References: <20190904121606.17474-1-lee.jones@linaro.org>
 <20190904141257.GB6144@bogus>
 <20190904161247.GP26880@dell>
 <20190904165246.GA25356@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190904165246.GA25356@bogus>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 04 Sep 2019, Sudeep Holla wrote:

> On Wed, Sep 04, 2019 at 05:12:47PM +0100, Lee Jones wrote:
> > On Wed, 04 Sep 2019, Sudeep Holla wrote:
> >
> > > On Wed, Sep 04, 2019 at 01:16:06PM +0100, Lee Jones wrote:
> > > > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > >
> > > > The Lenovo Yoga C630 is built on the SDM850 from Qualcomm, but this seem
> > > > to be similar enough to the SDM845 that we can reuse the sdm845.dtsi.
> > > >
> > > > Supported by this patch is: keyboard, battery monitoring, UFS storage,
> > > > USB host and Bluetooth.
> > > >
> > >
> > > Just curious to know if the idea of booting using ACPI is completely
> > > dropped as it's extremely difficult(because the firmware is so hacked
> > > up and may violate spec, just my opinion) for whatever reasons.
> >
> > Once [0] is applied, we can boot Mainline using ACPI.
> >
> 
> Good to know.
> 
> > > We just made ACPI table version checking more lenient for this platform
> > > and would be good to know if we continue to run ACPI on that or will
> > > abandon and just use DT.
> >
> > Which patch are you referring to?  If you mean the ACPI v5.0 vs v5.1
> > patch authored by Ard, then yes I know, I instigated it's existence
> > due to these devices.
> >
> 
> Yes exactly that one.
> 
> > DT will *always* be more enabled than ACPI, so it's advised that you
> > use DT for anything useful.  ACPI booting is ideal for things like
> > installing distros however, since they do not tend to provide DTBs in
> > their installers.
> 
> OK, as along as it gets tested/used in some form, that's fine. I do agree
> that DT will be more useful on that platform as it was derived from mobile
> based SoC SDM845 rather than solely designed for Laptops and with more
> alignment with ACPI spec. The way whole power/clock management is done
> with ACPI on this pulls me towards DT ;)

Exactly.  For Power Management on ACPI, we need to re-implement the
"Windows-compatible System Power Management Controller" (PEP), which
considering there isn't any documentation and/or source, would be a
mammoth challenge, if at all possible.

Feel free to provide your {Ack,Review)ed-by for this patch. :)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
