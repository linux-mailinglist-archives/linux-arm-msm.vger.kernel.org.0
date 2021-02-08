Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44C98313D57
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234117AbhBHSXt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:23:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235582AbhBHSWC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:22:02 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73413C061793
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Feb 2021 10:20:03 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id fa16so39962pjb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Feb 2021 10:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9zRqnKotemQIlYkYjhK/E4a+qqM6lIOPn69n16fDYNg=;
        b=iQ9gOSuGIorCBxq5QjWrJ4m/CGdpR6udlj4xdEXLeUZKY2j8DkwDzrVmhJe6WFXqfE
         HMZLfrhOP5Qw0mx1ysB/Qnet3crW13tSpr3miFEaNzqU8b2V/RelL3qWEn0fdWBfJbs7
         VEMA1YLfeL6TR603KlvQg7QiJ6c4WckTAx2/0Nhe35pn8Ak5CEPNsYjtoYGYxT8Lmyx7
         6iGlJzOxj8Z4sGNMID4NIndFFSQOZW5GLC9JpmpMrck744/uZTkknwCbpamB8D2/lJVD
         eBt81hSB+5gIsSKbYVBA0PiQ5fid1RV0riYShwDd+3wY/XqmRPKdHWhZ2I6SJ8mhgbFq
         rYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9zRqnKotemQIlYkYjhK/E4a+qqM6lIOPn69n16fDYNg=;
        b=Hxi5OyQJo8ECADWZ+PaTdx2KA7760MrvpgG1lmINNzSkxrcj8aVvDYJZ0+XrdbsNWF
         NmmLO4/tDAb1vrrTEeoV94MaNYbGoQRpExxQ18DtPlLjH8q2Z5276G06joec/AvktORA
         Hr82e+682GAeb7j6rNQX1F5sAbI8KN4s4g7G0NzpmegFO2iDdpxztRUDBlH30FQyiPG/
         89uIRIjNJLOvYdY8TCfUPlfGsCPPiaFzIxUTpZWxg9d6rUYHrSLAMogwK8VoGfnSPtgA
         mu4jZwL8if47s93u4j8YBvVbWt9jHkhV5tfLzNXtNazVz1RzLJzh9icX3ceB3kQ7h/nf
         vhhA==
X-Gm-Message-State: AOAM533/y6WO9Ct3bgocS4VxmJpaXHgvOdzeMyvqirP0CwUJ1fTS1S8w
        W/Cm5ELbqR2ATHYe2RDIeokP
X-Google-Smtp-Source: ABdhPJzzXqA7utP+VvJ03ls6iQG2HZlEEddlPGCei34k0Jcx6mpRbeFjGg27D3cVekFEFNDpzQgJsw==
X-Received: by 2002:a17:90a:c702:: with SMTP id o2mr45232pjt.7.1612808402901;
        Mon, 08 Feb 2021 10:20:02 -0800 (PST)
Received: from thinkpad ([2409:4072:511:b09b:7889:3d00:547a:9980])
        by smtp.gmail.com with ESMTPSA id w5sm14883217pfb.11.2021.02.08.10.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 10:20:02 -0800 (PST)
Date:   Mon, 8 Feb 2021 23:49:54 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     jassisinghbrar@gmail.com, mturquette@baylibre.com,
        robh+dt@kernel.org, viresh.kumar@linaro.org,
        ulf.hansson@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Add APCS support for SDX55
Message-ID: <20210208181954.GA276254@thinkpad>
References: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org>
 <161280637168.76967.9168707371952675235@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161280637168.76967.9168707371952675235@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 08, 2021 at 09:46:11AM -0800, Stephen Boyd wrote:
> Quoting Manivannan Sadhasivam (2021-01-17 20:11:51)
> > Changes in v2:
> > 
> > * Modified the max_register value as per the SDX55 IPC offset in mailbox
> >   driver.
> > 
> > Manivannan Sadhasivam (5):
> >   dt-bindings: mailbox: Add binding for SDX55 APCS
> >   mailbox: qcom: Add support for SDX55 APCS IPC
> 
> I think I can apply the clk patches to clk tree without the mailbox
> patches, right?
> 

Yes, you can. Thanks for applying!

Jassi: Can you please look into the mailbox patches?

Regards,
Mani

> >   dt-bindings: clock: Add Qualcomm A7 PLL binding
> >   clk: qcom: Add A7 PLL support
> >   clk: qcom: Add SDX55 APCS clock controller support
> >
