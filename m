Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 936282A4D10
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 18:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728697AbgKCReW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 12:34:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbgKCReW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 12:34:22 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62851C0613D1
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2020 09:34:22 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id s21so19212495oij.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2020 09:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1JaZqXqFdIPWnt0E572LVN0+nDbV1o5m6gHDSDoIC4I=;
        b=Q2n8tpHV5nvmR2OSazRvxRWjiFH+PKL/RCPajflFlEudEY3RSDuRnYEQVw4yaus37x
         8YPDStWRw8UUe7KUhTt/YXdJ6a4/b5XzFw7pgoJEeO4PnTLiFCiUR90suFcU6V3mm9Ag
         v9kRYp1akaOMtiswKY5Ia6V3Wg5CAta7OWvv7YZ8vTpPXsWYlI8xONYzj4DrjflJU7nb
         TfgTPj4oqYkDJNOZHZPciKnMyuo/pUcLdTxK00YuA/+1wpQGHhiuYp/lyRvW7tLb7GO8
         qNPmiO4bXYC/5h5/j/Qqyl/0y+MmidTJDA4tmN2ow2p9SbLLsDtXgvDnfDBpAeVR5sLQ
         wVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1JaZqXqFdIPWnt0E572LVN0+nDbV1o5m6gHDSDoIC4I=;
        b=MwFEKXyE2gztvfCoPpEUCbsVR8Us1Cmwkv/6F9AxhBA7OsjsJsQ/FK5M2/mEv6FMBY
         VVv2IrCa2tGJQwI2x/jQ3ZWDAvIjCS70gsTocqARzXBOPiIPKWsqCMy9q52/sme0vDR7
         zTuU4lXcqbSOAhAHwLmPZvW3fhmYgBc0GDFP3f6NQJuVi4qODLJiMQMX59lgiFsj9Jxe
         e7YwpRry8Y42IyD4PQ8sOakY8RAUdrdTKPuE+4nmjEJ0Te2+l5u97F7qx7SU0E79DvTi
         suUkcZmyvgMqiIo1wn22p6VXs/hO6/ik9cvtYJ/xNZttpNm/S4ZdnYVEt0xrZJSZFTm0
         gFLQ==
X-Gm-Message-State: AOAM53309Rl7fEUq1SORFMi2Cdg2VVNq0JRSxYOnR5yGd++CHdvAvW/5
        53oOE6xiAhWJYp0vTe60wjx+Ow==
X-Google-Smtp-Source: ABdhPJxHzlfUfcI++bJ+iZGECeMfHDlxPyTogVh3GwkhPPMW09JbfIDc7FH7/XeiZPCfD6Y4u1WguA==
X-Received: by 2002:aca:5d07:: with SMTP id r7mr135553oib.87.1604424861654;
        Tue, 03 Nov 2020 09:34:21 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t65sm4261575oib.50.2020.11.03.09.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 09:34:20 -0800 (PST)
Date:   Tue, 3 Nov 2020 11:34:19 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Add GCC and RPMh clock support for SDX55
Message-ID: <20201103173419.GP3151@builder.lan>
References: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org>
 <20201028170853.GA3191@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028170853.GA3191@Mani-XPS-13-9360>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 28 Oct 12:08 CDT 2020, Manivannan Sadhasivam wrote:

> On Wed, Oct 28, 2020 at 01:12:28PM +0530, Manivannan Sadhasivam wrote:
> > Hello,
> > 
> > This series adds Global Clock Controller (GCC) and RPMh clock support
> > for SDX55 SoC from Qualcomm with relevant DT bindings.
> > 
> > This series has been tested on SDX55 MTP board. The dts patches for this
> > SoC/board will be posted later.
> > 
> > Thanks,
> > Mani
> > 
> > Manivannan Sadhasivam (1):
> >   clk: qcom: Add support for SDX55 RPMh clocks
> > 
> > Naveen Yadav (1):
> >   clk: qcom: Add SDX55 GCC support
> 
> Bjorn, I've inherited the gcc driver from downstream and did some modification.
> But I'm not sure if I can take the authorship of this patch hence kept it to the
> downstream author.
> 
> In my point of view, the downstream author wrote the driver so I should keep
> the copyright and even list them as MODULE_AUTHOR. But I don't think I should
> give the patch authorship to them because I haven't received the patch anyhow.
> I usually keep the authorship if I take the patch from a source like LKML and
> repost it. But in this case, I authored the patch using someone's code!
> 
> What is your view on this?
> 

I think the author should be the person whom prepared the patch.

Given that the downstream driver is a series of patches from a single
author it's not unreasonable to squash those and retain the author. But
if your effort to prepare the patch for upstream was non-trivial I would
consider it reasonable for you to claim authorship of the patch.

If this is the case it's definitely preferable to give credit to the
original author(s) by mentioning them in the commit message (e.g. "Based
on downstream implementation by Jane Doe").

And the copyright for the work definitely needs to come along, possibly
with the addition of yours, depending on your modifications.

Thanks,
Bjorn

> Thanks,
> Mani
> 
> > 
> > Vinod Koul (2):
> >   dt-bindings: clock: Add SDX55 GCC clock bindings
> >   dt-bindings: clock: Introduce RPMHCC bindings for SDX55
> > 
> >  .../bindings/clock/qcom,gcc-sdx55.yaml        |   71 +
> >  .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
> >  drivers/clk/qcom/Kconfig                      |    8 +
> >  drivers/clk/qcom/Makefile                     |    1 +
> >  drivers/clk/qcom/clk-rpmh.c                   |   20 +
> >  drivers/clk/qcom/gcc-sdx55.c                  | 1667 +++++++++++++++++
> >  include/dt-bindings/clock/qcom,gcc-sdx55.h    |  112 ++
> >  include/dt-bindings/clock/qcom,rpmh.h         |    1 +
> >  8 files changed, 1881 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
> >  create mode 100644 drivers/clk/qcom/gcc-sdx55.c
> >  create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx55.h
> > 
> > -- 
> > 2.17.1
> > 
