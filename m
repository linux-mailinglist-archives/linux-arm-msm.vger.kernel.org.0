Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D864C33C081
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 16:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbhCOPu0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 11:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbhCOPt7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 11:49:59 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F8CC06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 08:49:59 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id y131so32064943oia.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 08:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ctH1m+B27aFfYUzrTEwqyuu/kBv+C5+MsoOTttkG5pY=;
        b=kjoa8CVftEnpQBfY0r0ElELXcyCG/FUSMEJxwrLkNX8azzW64FUGfc8B9xGgDXB7PI
         3wJjwD0Cv0GTGkgh8MF0WVZLFwjVG+rIbRVt+tpwygSUNfesixjx6KgJJJ3SnyKjM2RG
         uHyUnxv9yA9hyUK1+aUeCjsv+ePxt05jHB54x7QhSB8VXUrRY8qhtZJOGwmIE+qhMZmf
         fXVa4KlK7vJpddIkZFByOdZEhrPBO/y8QE0ddDMj/EJGcT/v+MIme+NnS05zjmE1dmAH
         MBXRjfJbtU21KUhUVVGc+tC0c7q7FGnw/UUvcRx+AFCq4/WzT/Gj7vN4BUHhPwhCk4b0
         Lh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ctH1m+B27aFfYUzrTEwqyuu/kBv+C5+MsoOTttkG5pY=;
        b=f8Xod6affJBy858cj8fGcthJ/g70k4Alu/kDn3eMlWE3QcZLrufTzCL58y47Mt06H+
         I/x7v7gIiFVc48eFh98QC74qrnPeKs8ZDxWrRQLQNx8bEL1dLlzmf2v/UMjcY8/cPBzD
         fFNWuoOmKD59tEeXgJ7m0qNE37x8h8s5KuCn4vAG6QmJn45rEZV3M66tG1JA/pR5iKw5
         pxVyjfy92CkLhTQMWvQoeWXPfybvGpPv8/A9VfbkENzq54IRew5iwYjzLoOqxcOhWE3L
         TzAQX3UxWEAFMxjgklabI4ZPes8qxlpy28efnmPApqDLMTLYSdTQn9VH6NnfAOY99Qni
         GfWA==
X-Gm-Message-State: AOAM530lkRa1WD/JwEmLOfYDSUPHomKN+CIVppEDRZzcupAgsO0WARqY
        +WBWshe1V21wxk2/guwqeJPNyg==
X-Google-Smtp-Source: ABdhPJx6QASLPk+TYXWrCWUllPrJPQ7sm6fWkTd4y+xYOPmBT0UCBRntzlhqs2CtwJizFQawAlAcoA==
X-Received: by 2002:aca:cf10:: with SMTP id f16mr12640016oig.70.1615823398759;
        Mon, 15 Mar 2021 08:49:58 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h17sm7071740otj.38.2021.03.15.08.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 08:49:58 -0700 (PDT)
Date:   Mon, 15 Mar 2021 10:49:56 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2] pinctrl: qcom: support gpio_chip .set_config call
Message-ID: <YE+CJH9Mgar5eE/k@builder.lan>
References: <20210303131858.3976-1-shawn.guo@linaro.org>
 <CACRpkdZp7m0s+6Fgzq4ScftAr-CtEPtAbz3jGCvKTzdqXJtfAA@mail.gmail.com>
 <YEqmTUXbn0T2dqla@builder.lan>
 <CACRpkdaQ_p1n6+cu5f2p6gWui-eDMF_MEmC0ZQM50oyb3CcZUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaQ_p1n6+cu5f2p6gWui-eDMF_MEmC0ZQM50oyb3CcZUg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 15 Mar 10:36 CDT 2021, Linus Walleij wrote:

> On Fri, Mar 12, 2021 at 12:22 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> 
> > I don't know how to make the transition, but can you please revert this
> > patch, to avoid breaking compatibility with DTBs out there?
> 
> OK reverted for now. Does this imply I cannot apply Shawn's ACPI
> support patch either? I.e. is this a prerequisite?
> 

I presume you're referring to [1], which should be fine to merge.

Iiuc the problem that this (.set_config) patch resolves is that
definitions of gpios as interrupts will trickle down to a .set_config
call, which is necessary to get appropriate bias.

[1] https://lore.kernel.org/linux-arm-msm/20210311024102.15450-1-shawn.guo@linaro.org/

Regards,
Bjorn
