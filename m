Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 964DE212D02
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 21:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgGBTSu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 15:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgGBTSu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 15:18:50 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0CEC08C5C1
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2020 12:18:49 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id d4so24990105otk.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2020 12:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jRIEBzGgN4d7YlR7st1P/jWdFL9XQ3Vl0E8DBG5inJM=;
        b=uptIQwwuu7LLhQ5BebZnRucA4yx79hkX9MsCaNgPXHc+4sW6fYb8Ma0WG/QZ6fYDkL
         7CdXciQXPoZxefKXg1aZlVZGomC5VgFvYZCCemrYwiAPfqPIaUh79kgKi/RAkg9NRpIv
         AjNvVa2FLRKmfGQ/C+ofSk4ZhzxoQdi9jDHGlirho0fHOyp+rCJ0YlEl11rhG/0s5zrE
         QI0PanE9bioGWA7kRhJuQwMURFJnvxBrc6k43Qo+XGhB+BEYvu00QTsAmH7fhkF+ZWxZ
         XHkhl2rsZQPDiwm67Y1VvB0XPSN50TfH5XsIbY8Us3IK3Vsy6Qv0fkUNBNL1oMFKSuLj
         zn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jRIEBzGgN4d7YlR7st1P/jWdFL9XQ3Vl0E8DBG5inJM=;
        b=OSvai0KLNDw5WdEtq12F+/pfMAmD6J406xQCJu9NHZ3X9xDV+osWUL1Fx9ZrottoVu
         IDCHVKHelDbdPtpaz/rMcJcl80pMyMFMkNPbXk+c7ko+sVtUmIanzyc7AcNDh7+weqVn
         tfX6VwSEdAFQV3I4XaCwNv9J/BraE1UU9UreePqI5NT3f5M5CFfHXKoFBVzQ44DC6Sbi
         Ij2m57veVl1cZg2FDM+sqjFOw+ikx/3/alriMIb861MaQpxMxe8Y1l/StwuP84yNJgAT
         7KYsCQZsUKMWja94/+EzVe1xZ+LUNKYAkoiOMMZiWcQcKQHSLSu8324ne2MSdTay0LBz
         Mmcg==
X-Gm-Message-State: AOAM532wok+QvjMqaiST33hahz+9bp4jMR6jNTBnTCT4ZCWstaYK2yTl
        O+2FHw64w7ESb6QAh2AaXjyPL8FoYbzcAw/07EXIoEVT+fc=
X-Google-Smtp-Source: ABdhPJyE9o5qsn4mmfg/bTi/do0nytBCytI9l2XHtzasMOIfuZopADxFdFg4hQFCUv8pGK/sonqdb5SzWJU+UiPGXwM=
X-Received: by 2002:a9d:69c9:: with SMTP id v9mr28599024oto.66.1593717529169;
 Thu, 02 Jul 2020 12:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200702103001.233961-1-robert.marko@sartura.hr>
 <20200702103001.233961-5-robert.marko@sartura.hr> <20200702133842.GK730739@lunn.ch>
In-Reply-To: <20200702133842.GK730739@lunn.ch>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Thu, 2 Jul 2020 21:18:38 +0200
Message-ID: <CA+HBbNGcV0H4L4gzWOUs8GDkiMEOaGdeVhAbtfcT5-PGmVJjfA@mail.gmail.com>
Subject: Re: [net-next,PATCH 4/4] dt-bindings: mdio-ipq4019: add clock support
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        David Miller <davem@davemloft.net>, kuba@kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 2, 2020 at 3:38 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +  clock-frequency:
> > +    default: 100000000
>
> IEEE 802.3 says the default should be 2.5MHz. Some PHYs will go
> faster, but 100MHz seems unlikely!
This MDIO controller has an internal divider, by default its set for
100MHz clock.
In IPQ4019 MDIO clock is not controllable but in IPQ6018 etc it's controllable.
That is the only combination I have currently seen used by Qualcomm.
>
>      Andrew
