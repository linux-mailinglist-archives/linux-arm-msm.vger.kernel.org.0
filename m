Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96272EDBA7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 10:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbfKDJ2C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 04:28:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:40436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727419AbfKDJ2C (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 04:28:02 -0500
Received: from localhost (unknown [106.201.55.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A0E53222D2;
        Mon,  4 Nov 2019 09:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572859681;
        bh=mjpf4qHX+4LtFI3DUZH/vqduTv06o3J1bBEcBr2Htpk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SqRgqM0MKkPCfeT+cjF0A3wpLlpzSvc/pOu/qJdk2In5nKHVkXPDjHShTOEyWE1Jq
         89bVncd30CMe29c0gCKbZme5E7O21d+RLPyUXABub9M73gMta8P4HmRwvy2MMyZnEa
         YpEkGZ44myT4Mplb0nMyq1HRPhZmOXhh3dsRs1jY=
Date:   Mon, 4 Nov 2019 14:57:57 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] arm64: dts: qcom: msm8996: Introduce IFC6640
Message-ID: <20191104092757.GT2695@vkoul-mobl.Dlink>
References: <20191021051322.297560-1-bjorn.andersson@linaro.org>
 <20191103081311.GM2695@vkoul-mobl.Dlink>
 <20191104045507.GA28034@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104045507.GA28034@tuxbook-pro>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03-11-19, 20:55, Bjorn Andersson wrote:
> On Sun 03 Nov 01:13 PDT 2019, Vinod Koul wrote:
> 
> > On 20-10-19, 22:13, Bjorn Andersson wrote:
> > > Refactor msm8996 and db820c in order to make it follow the structure of newer
> > > platforms, move db820c specific things to db820c.dtsi and then introduce the
> > > Informace 6640 Single Board Computer.
> > 
> > This has patch 9/11 missing. But rest look good to me.
> > 
> 
> That's really odd, I copy pasted the recipients into all the patches.
> But I'm unable to find it under linux-arm-msm on lore as well.

Yup I can see it there but not on arm-msm. Do you use @linaro smtp to
send. Gmail is known to drop emails to lists on  vger..
I use @kernel.org one, havent seen issues on that yet

> It's under LKML though, can you please have a look and let me know if I
> can extend your ack to patch 9/11 as well?
> 
> https://lore.kernel.org/lkml/20191021051322.297560-10-bjorn.andersson@linaro.org/

Mostly looks good but the reserve memory doesnt seem sorted by node
(please recheck) and rest looks good so you can add it to that patch as
well :)

-- 
~Vinod
