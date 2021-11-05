Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6EB4468F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 20:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233302AbhKET1N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 15:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbhKET1N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 15:27:13 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93AB3C061714;
        Fri,  5 Nov 2021 12:24:33 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id bk26so14822388oib.11;
        Fri, 05 Nov 2021 12:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XQeAgDVPrMatGxUAJnx2FSGsJF127xSHo+APhMk0Q58=;
        b=dzKRNza/f9HSFkZgirZnErPLvbZzUQ643ru/Nixx/s7W9D734aEKI/NTA2ieGROHOR
         PRh5CpstQaXWEq0ik1/D7UV5MS67rZAeceHReE+GkqEOMoemiKuZ/cHx9STcAhJqqrb6
         FjZfbuocS+5V024M9GvKNCIri8arGagS1bHasnIdtNMiOyZ52d5qTjfjYzlgz25WM4Zh
         QxsZlGP+9Juai8/ZJns8OjXVvs0gHDeUaPqmC5gZXKHcQ3hdkB0T7ysDvmTDED+fADs7
         3HuJuZQdDiuspORZW3uMF+2I1KtpflqrWgb1AYcV9+WlDZ93r72yef+cOBpfRq95jpeG
         PYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=XQeAgDVPrMatGxUAJnx2FSGsJF127xSHo+APhMk0Q58=;
        b=rO+Tff7iGpKURQubokO3RHpK8hMjsrc4iR4XAk5M+kT3AlZV6WkmaoIxSaL6X7F4xl
         p45J6C7CZlHA7yOpYy2w8+KYk4A3Ajmxz3tdXFERoMkHS3IGcDSqHkerlZLPR0J+r4ut
         c2jmqEsUnGpADCtVXr0ZBuDRDuLtrXdpHCi8zgHkiQ0++v6bNdoO4sAUlE+sSRYsT0/w
         cSxTb9TYMlmsano6bWKZWy4EOUkOXrW3sYVjUW0kxgd3SkfFp3oyA+sEcUMJ+N8xYSFD
         Mz7UsW57sQSpG4sMdVlrZx8KF0tql+95ISNcTpsRWkiG8cSRlXgArV6tQ+Xcglpvs6Wy
         y5qQ==
X-Gm-Message-State: AOAM533E1DnZ+sfdovBKw54/MNmTWHSAZV9ciN63rMdi/zaxDHFtmljY
        5au/QCXAk6ojk80fiOBrPNdCyVFMHug=
X-Google-Smtp-Source: ABdhPJyFcGJRVn9ejLzO7BhRak/280TJjRSiro7mkoi8DjY79g9D9SLq+YWJKALObw3WIl1h57lWyg==
X-Received: by 2002:aca:1b07:: with SMTP id b7mr7908598oib.178.1636140272966;
        Fri, 05 Nov 2021 12:24:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r5sm2716496oov.48.2021.11.05.12.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 12:24:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 5 Nov 2021 12:24:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        wcheng@codeaurora.org
Subject: Re: [PATCH v3 6/7] usb: typec: qcom: Remove standalone qcom pm8150b
 typec driver
Message-ID: <20211105192430.GA1449812@roeck-us.net>
References: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
 <20211105033558.1573552-7-bryan.odonoghue@linaro.org>
 <YYVG5DZJdNfZyj8x@kuha.fi.intel.com>
 <YYVHcHC1Gm92VxEM@kuha.fi.intel.com>
 <749a058d-a16d-3a92-25b6-97afcfaa7787@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <749a058d-a16d-3a92-25b6-97afcfaa7787@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 05, 2021 at 04:05:37PM +0000, Bryan O'Donoghue wrote:
> 
> > > 
> > > I don't like that you create point where the support is temporarily
> > > removed for this hardware. I know Guenter asked that you remove the
> > > old driver in a separate patch, but I believe at that point you were
> > > also proposing different config option name for the new driver, so you
> > > could have removed the old driver only after you added the new one.
> > > 
> > > Since you now use the same configuration option name - which makes
> > > perfect sense to me - I think you need to refactor this series. Maybe
> > > you could first just move the old driver under drivers/usb/typec/tcpm/
> > > in one patch, and then modify and slit it in another patch.
> 
> No problem with this in principle
> 
> > Or just merge this patch to the next one.
> 
> I think this for preference unless Guenter has an objection .. easier/less
> work

I understand the logic, so I won't object. Note that I may not have time
to review the resulting patch if it ends up changing the same source file
to replace one driver with another.

Guenter
