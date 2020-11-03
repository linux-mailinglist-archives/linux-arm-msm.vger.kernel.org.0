Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE45B2A5A81
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Nov 2020 00:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729763AbgKCXXx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 18:23:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729733AbgKCXXw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 18:23:52 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9843C061A48
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2020 15:23:50 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id w145so14562441oie.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2020 15:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5idH8msE3xfT1HbX4YlOiogZBOJmNFWbJdNuEHZ8WFw=;
        b=MeEeitO3VKKF+R/g//klhrVAxmbyesvsNh/vAetCz2k8UWHjlZsDJIPJ6vvs5dIK8c
         zD+nACWetivQkA4wAQRnQCCDmRLjgmjFCIYsD3rL8yWPO6SY0FDzh/Bo/cokFp2dp5uK
         T7vhAAy5gJ7a7N7cju6ibW+jY+5NrUtU2WoRa2J27k/JoQ3GZPgu9xtf6HdPs4IopaGl
         USwK74OdUVdifv5jO3vo5i+FTEWZeL5UwnfSa4EKd2Zwb7Ohv2yN9vccOi8b2b5kK9aG
         UKivjO4ZKujYPT5Bf61xQ91/wgFPjNgJcAUaVq9liRVmB2d9O0jQbpf57fbHpxf7FNuR
         BYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5idH8msE3xfT1HbX4YlOiogZBOJmNFWbJdNuEHZ8WFw=;
        b=FzMU3SDTRgHkds7A6riL2FZypP4IWWEXNHiRyjzgPFq4YyvioQXHH5D8Mw1iGBSs/7
         Rpc6Tv1idNO4CJjSpgtKK/lcjqKJOXoJhZLxuIk3Ohnd2wsqcN0eAjqQn/ZT04i1/qmF
         vOurex5WkTl4Slu8TtTge0C2wHer+A8i24JSIDfqlmQ8mLqEiDkJTCDIrlzFrs8SzAgx
         koWB69D1oFo7+CXehEU2rg2876n6H9BY23O1A9YZiFXLEwLBbZ9okCdRjb+pJoqAtPcv
         RJu2jDCgk4uPx3Z6RHiMt/GiBfixtBYiFPb7tzo8yt0odTi6JgL34asp7ucxqMRORu8x
         YVIg==
X-Gm-Message-State: AOAM531xvaVgV+FB4yLgpN3UOluYXyfGAc+ZC1j54xTaP3tHntbr71sZ
        VUtZPQElkqzmd2v+gXpuNxVoUQ==
X-Google-Smtp-Source: ABdhPJx1UPasIFvrVkPcIC88OzuqycVKCqwEWY9B7tYX34ixnYUE0EC3jXxsuaRkB1KKbYryOsxSYw==
X-Received: by 2002:aca:38c6:: with SMTP id f189mr992189oia.27.1604445829901;
        Tue, 03 Nov 2020 15:23:49 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w70sm39163oiw.29.2020.11.03.15.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 15:23:49 -0800 (PST)
Date:   Tue, 3 Nov 2020 17:23:47 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jun Li <lijun.kernel@gmail.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 29/29] arm64: dts: qcom: Harmonize DWC USB3 DT nodes name
Message-ID: <20201103232347.GD65067@builder.lan>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
 <CAKgpwJWWg+fimuQOCcw=L0HZSwLYXNNCAV4ifzzG-HXfkFmazw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKgpwJWWg+fimuQOCcw=L0HZSwLYXNNCAV4ifzzG-HXfkFmazw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 02 Nov 01:34 CST 2020, Jun Li wrote:

> Serge Semin <Sergey.Semin@baikalelectronics.ru> ???2020???10???20????????? ??????8:04?????????
> >
> > In accordance with the DWC USB3 bindings the corresponding node
> > name is suppose to comply with the Generic USB HCD DT schema, which
> > requires the USB nodes to have the name acceptable by the regexp:
> > "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> > named.
> 
> This need a counterpart driver change:
> drivers/usb/dwc3/dwc3-qcom.c
> dwc3_np = of_get_child_by_name(np, "dwc3");
> 

Thanks for catching this Jun. The code certainly needs to be updated to
look for the new child node, while falling back to the old name, before
I can merge this change.

Regards,
Bjorn
