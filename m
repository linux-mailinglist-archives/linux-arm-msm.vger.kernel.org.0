Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E98A225EBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 14:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbgGTMmA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 08:42:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:37870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728074AbgGTMmA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 08:42:00 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB9862070A;
        Mon, 20 Jul 2020 12:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595248919;
        bh=4yz1mHQSyMFEDoN52XWPGE0sCqO1YBjUJNDznb4FZdg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VseEDFQ8rEDcT17+j/uOZo8OcutPYZrPvWjr5SdDIH2nX6u4LzPK7X/C/vmuWYXwn
         QCeqnuoKgaRJBP0dWQ/+sOo4/35uuKv405eVGypPmL0vX+sZrobHQFSC5XLeGrFgna
         C3snPJxPTvDNZnq4zBER1Vmny7BF0Q5/o3loy6Rw=
Date:   Mon, 20 Jul 2020 18:11:55 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     ansuelsmth@gmail.com
Cc:     'Andy Gross' <agross@codeaurora.org>,
        'Jonathan McDowell' <noodles@earth.li>,
        'Andy Gross' <agross@kernel.org>,
        'Bjorn Andersson' <bjorn.andersson@linaro.org>,
        'Kishon Vijay Abraham I' <kishon@ti.com>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Mark Rutland' <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: R: [PATCH v10 1/2] phy: qualcomm: add qcom ipq806x dwc usb phy
 driver
Message-ID: <20200720124155.GI12965@vkoul-mobl>
References: <20200717131635.11076-1-ansuelsmth@gmail.com>
 <20200720062545.GC12965@vkoul-mobl>
 <010801d65e90$d57d2b60$80778220$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <010801d65e90$d57d2b60$80778220$@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-07-20, 14:25, ansuelsmth@gmail.com wrote:
> 
> 
> > -----Messaggio originale-----
> > Da: Vinod Koul <vkoul@kernel.org>
> > Inviato: lunedì 20 luglio 2020 08:26
> > A: Ansuel Smith <ansuelsmth@gmail.com>
> > Cc: Andy Gross <agross@codeaurora.org>; Jonathan McDowell
> > <noodles@earth.li>; Andy Gross <agross@kernel.org>; Bjorn Andersson
> > <bjorn.andersson@linaro.org>; Kishon Vijay Abraham I <kishon@ti.com>;
> > Rob Herring <robh+dt@kernel.org>; Mark Rutland
> > <mark.rutland@arm.com>; linux-arm-msm@vger.kernel.org; linux-
> > kernel@vger.kernel.org; devicetree@vger.kernel.org
> > Oggetto: Re: [PATCH v10 1/2] phy: qualcomm: add qcom ipq806x dwc usb
> > phy driver
> > 
> > On 17-07-20, 15:16, Ansuel Smith wrote:
> > > This has lost in the original push for the dwc3 qcom driver.
> > > This is needed for ipq806x SoC as without this the usb ports
> > > doesn't work at all.
> > 
> > Applied both, thanks
> > 
> > My script found below errors with W=1, can you please send fixes for
> > these
> > 
> 
> Since you applied them should I send a new patch or a v11 of 
> this patchset?

new patches... Updates on top of phy-next please

-- 
~Vinod
