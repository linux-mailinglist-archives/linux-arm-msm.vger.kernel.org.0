Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4952B4B1CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 08:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbfFSGFx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 02:05:53 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55804 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbfFSGFw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 02:05:52 -0400
Received: by mail-wm1-f66.google.com with SMTP id a15so334250wmj.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2019 23:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=gAuvNEON1/svyE5y5H38rhLBVdlEdqq6m64304VJxxs=;
        b=ZG5JbVEDRi1cEztR9JPWFYHH4s7iBIKyn45vzLAIoPXuizb+BCH+2XrkPjcbPH+1Ge
         cxejIXjDRzw9xLk+MnT9Zih7O2ENvIdCKSZiDYiW51dEI6MpvHstHy/nIbOL0QiMtuTX
         KogdXhG2DKT8In8hoZGJq/KEpY62ZH6MuYMvKrzmUHM4qxAN9s6yQ3UJnarzkakBYySQ
         tHt79MEzHGr/Uog534lU+QVR4htpUZqCBlkM95IoYurqq0tY7LhLQGkmQSP8wSOqHWuo
         bX3VmRDo5xrT5yc7eQqIo3N2WlUYb1rEokBD4QOEKdDAcyY8XSkIczKfymTMszhPZIxw
         lZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=gAuvNEON1/svyE5y5H38rhLBVdlEdqq6m64304VJxxs=;
        b=gN/wINEomYOG6hjxZkxTrCpXjr8lSClPtFOqCb/U1a00gsFxgHVOVxyjgLnsayDxYJ
         Hp5a2nmAWNc36/wrsoOON7E9qgZMrS+8EAyYQb+8OzRW0mikG/JPZThEJ2bea1GzLn0Q
         yOcAMLwf5dNofko1t8m+jqyFJVXs4Z+4fz4PLDRqkYL61tIU7e1phQieOlvOeoTmG1Co
         gfquEwgQbgHNpEdl+3cMth5dJBb4PsVEiUiEQfpT2rAH/kLzNjlK5iDZjRU+N6agLcmB
         iRvlYFD7DRiA26Hhf+ztRGmBrjg8q3pOrR01fSAkIx+7cGFDJ0DqN1EhKypyDNgyGTwB
         1T7A==
X-Gm-Message-State: APjAAAWa9EHdiCIG05S60X8JtmZftkH0nrDGAtb0gbCTZjizCMdP4zi7
        7+DBkHCLvuXKoVBt2GKILOMS5Q==
X-Google-Smtp-Source: APXvYqw9N8Sn2vt43SeeNig+fvTZyfd4FhrFCZQ8nv6+4b2CTetI7wo1XDje3ODj4gCpw+qO/iboMw==
X-Received: by 2002:a1c:e90f:: with SMTP id q15mr6736132wmc.89.1560924349841;
        Tue, 18 Jun 2019 23:05:49 -0700 (PDT)
Received: from dell ([2.27.35.243])
        by smtp.gmail.com with ESMTPSA id c4sm13697164wrt.86.2019.06.18.23.05.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 23:05:49 -0700 (PDT)
Date:   Wed, 19 Jun 2019 07:05:47 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     alokc@codeaurora.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, ard.biesheuvel@linaro.org,
        jlhugo@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, felipe.balbi@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND v4 1/4] soc: qcom: geni: Add support for ACPI
Message-ID: <20190619060547.GG18371@dell>
References: <20190617125105.6186-1-lee.jones@linaro.org>
 <20190617125105.6186-2-lee.jones@linaro.org>
 <20190619055207.GA14273@hector.attlocal.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190619055207.GA14273@hector.attlocal.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 19 Jun 2019, Andy Gross wrote:

> On Mon, Jun 17, 2019 at 01:51:02PM +0100, Lee Jones wrote:
> > When booting with ACPI as the active set of configuration tables,
> > all; clocks, regulators, pin functions ect are expected to be at
> > their ideal values/levels/rates, thus the associated frameworks
> > are unavailable.  Ensure calls to these APIs are shielded when
> > ACPI is enabled.
> > 
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> 
> Applied.

Thanks Bjorn and Andy.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
