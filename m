Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFF491B5CF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 15:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgDWNvg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 09:51:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:40160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726926AbgDWNvg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 09:51:36 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6C44D20728;
        Thu, 23 Apr 2020 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587649895;
        bh=d8fk9lPETH+eLlCSVPRo/VJIzcglnRP9c3doWogaRt8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ssdOxn65MQz0P4dbXZzwrLhiPWNFPavzAxSfodlbeA1TgYRVdu2M0z/P5SRSy6Wjh
         /zqfgLXBD8Tz36/DQ2JHuNZOo/bEQEkW8xv0yWHe4jsXt1ZEwOWgGpZKFloha5oXr9
         tq78VaLLNlvGPqTgRg1vfX0fUJf3iMaa5gJKbJk0=
Date:   Thu, 23 Apr 2020 15:51:33 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Akash Asthana <akashast@codeaurora.org>,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 01/17] tty: serial: qcom_geni_serial: Use OPP API to
 set clk/perf state
Message-ID: <20200423135133.GB4091353@kroah.com>
References: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
 <1587132279-27659-2-git-send-email-rnayak@codeaurora.org>
 <0c9dcb67-5742-ce13-50a5-41c29bbbff51@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c9dcb67-5742-ce13-50a5-41c29bbbff51@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 22, 2020 at 02:52:21PM +0530, Rajendra Nayak wrote:
> Hey Bjorn,
> 
> > diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> > index dd46494..737e713 100644
> > --- a/include/linux/qcom-geni-se.h
> > +++ b/include/linux/qcom-geni-se.h
> > @@ -24,6 +24,7 @@ enum geni_se_protocol_type {
> >   struct geni_wrapper;
> >   struct clk;
> > +struct opp_table;
> >   /**
> >    * struct geni_se - GENI Serial Engine
> > @@ -39,6 +40,7 @@ struct geni_se {
> >   	struct device *dev;
> >   	struct geni_wrapper *wrapper;
> >   	struct clk *clk;
> > +	struct opp_table *opp;
> 
> I just realized this is going to cause merge issues across geni serial and geni spi
> driver (PATCH 02/17 in this series) unless all of this goes via your tree.
> I see this is also an issue with the ongoing ICC patch series [1]
> 
> Do you or Greg have any thoughts on how this common header across various drivers
> issue should be resolved to avoid conflicts while merging?

I can ack it and you can take it through a different tree as part of the
whole series to prevent that.

thanks,

greg k-h
