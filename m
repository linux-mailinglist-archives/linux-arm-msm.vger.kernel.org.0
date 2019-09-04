Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9533DA8C5E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 21:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732883AbfIDQMw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 12:12:52 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46429 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732715AbfIDQMv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 12:12:51 -0400
Received: by mail-wr1-f68.google.com with SMTP id h7so20591104wrt.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 09:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=q8pUvpVjKp1g5Qr8w2IVnrREUirRn/vuVmUWXmSYL4Q=;
        b=LTfKPX0N8u61M2wJ5sy42uTQ+BoMX6ermJhYqKH/Q9DtGM30IwZRVjEk1iEvZtxsFg
         jQGWkdRoBDp2evmwXeNcR4Jf89nZto3VO5zeJr9dneojF1ouo9VkWbE2ima2ckTz/TcK
         HUhJSSX0ZdT69PvDgc9MqPoNpwJNAMOvdEDZ8rgfjX8b6w+KYSLYv6oexA5UhJ9bgwjk
         xdzh+p3SgAql537WzCRStiL10eKM0SWalzasmaxAMDujB9HZfdyPziW4Os3qGGG5zIEj
         0qayE9Hgo+ALfLW3FOs/S7GpC4nmNRQVGtWL0kMqrLWlSOjpmVJQLLFEeObL1ztJmEU4
         3jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=q8pUvpVjKp1g5Qr8w2IVnrREUirRn/vuVmUWXmSYL4Q=;
        b=CpHqfUz+vJWnDDv84F9ItOe31frbV4JuMHECOi+yDxDMEgxELnzoCOB43kGc2TLlEB
         4oq8u21hwI3/JKzn2B5bO2bmH3n00BsvgaeyhS7qi05L2H34XeRkdjDy/joR1F2+2YkD
         uzXHUvOcLsHk1LyfrBgv36/U030MgHMDt8155UgM8kSx8LM1lxOCquyI7aMLVofLPPsu
         jPr/VmwVILb1sBbDfDPhpYJvn4uoXdcuceO8BliRKQ5lc18h5J9TGHLnQ2p+B8Yi8EMH
         A2gSX/q0Nvo15VxhKDhb0yM/m+fF0Fx3mweQlmwDNKwKMwL5Yehoc9K0bpKEhZxHbi6x
         AQgg==
X-Gm-Message-State: APjAAAUCaQZEYQV8FZSCDA//bZpL1ZOxKLyCpS4W1KS1DTliVE70bKNq
        Ykrr1Yem2iWzWuAnq7xBFccTWr2Ylvg=
X-Google-Smtp-Source: APXvYqwdxIz1SPASSWDxK72taN7umX8eaGJ50gyjNa1JHwg+UjQz1fdTJ6rPguOhSqf3vQ64uuDm7w==
X-Received: by 2002:adf:f48e:: with SMTP id l14mr32359282wro.234.1567613569826;
        Wed, 04 Sep 2019 09:12:49 -0700 (PDT)
Received: from dell ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id e6sm19269452wrr.14.2019.09.04.09.12.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 09:12:49 -0700 (PDT)
Date:   Wed, 4 Sep 2019 17:12:47 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/1] arm64: dts: qcom: Add Lenovo Yoga C630
Message-ID: <20190904161247.GP26880@dell>
References: <20190904121606.17474-1-lee.jones@linaro.org>
 <20190904141257.GB6144@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190904141257.GB6144@bogus>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 04 Sep 2019, Sudeep Holla wrote:

> On Wed, Sep 04, 2019 at 01:16:06PM +0100, Lee Jones wrote:
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> > The Lenovo Yoga C630 is built on the SDM850 from Qualcomm, but this seem
> > to be similar enough to the SDM845 that we can reuse the sdm845.dtsi.
> >
> > Supported by this patch is: keyboard, battery monitoring, UFS storage,
> > USB host and Bluetooth.
> >
> 
> Just curious to know if the idea of booting using ACPI is completely
> dropped as it's extremely difficult(because the firmware is so hacked
> up and may violate spec, just my opinion) for whatever reasons.

Once [0] is applied, we can boot Mainline using ACPI.

> We just made ACPI table version checking more lenient for this platform
> and would be good to know if we continue to run ACPI on that or will
> abandon and just use DT.

Which patch are you referring to?  If you mean the ACPI v5.0 vs v5.1
patch authored by Ard, then yes I know, I instigated it's existence
due to these devices.

DT will *always* be more enabled than ACPI, so it's advised that you
use DT for anything useful.  ACPI booting is ideal for things like
installing distros however, since they do not tend to provide DTBs in
their installers.

[0] https://lkml.org/lkml/2019/9/3/580

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
