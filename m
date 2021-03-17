Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFC0033E946
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 06:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbhCQFv1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 01:51:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:45764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229550AbhCQFvE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 01:51:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA52E64F8B;
        Wed, 17 Mar 2021 05:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615960263;
        bh=SxkdZQbf6PDqPYgJuJicDAlqFwp2dLeBYfuLtzbhiow=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VeeEct6WHo5Oc4F5vUhicYUcRzEFF/DOaYL8XEzluCoB7qRtPi2pimY+AsKT35CJp
         2nZe3bzOa2A1Oen6Q0/KjCJWJwLqv9xi+Spbuqifr9ddZQu8TBFASVv2nfT48/kXih
         TZtYnunA7EvOuxvIMu2NXxSctoFKOa+xuyownIWfbKveFUaUoF0zZ2bisieOH4FMzm
         w2cHplk63Tz1H5UQZuvb2zyWkOK3bji49KQJ/cxDsb3lT4v109JbBZ7DfgRLA7S78w
         bO5E71+yZTboxRDngjM9RHpABuS1qjYvOSfbJ/otEprq1ZRPeOsR55hpuKj/j67m0V
         IBO6kvXoiwgEg==
Date:   Wed, 17 Mar 2021 11:20:59 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scsi: dt-bindings: ufs: Add sm8250, sm8350 compatible
 strings
Message-ID: <YFGYw7FjvZZpuznA@vkoul-mobl.Dlink>
References: <20210204165234.61939-1-vkoul@kernel.org>
 <YEr3kg6vPu6Htnpw@vkoul-mobl>
 <yq1mtv237a1.fsf@ca-mkp.ca.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq1mtv237a1.fsf@ca-mkp.ca.oracle.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Martin,

On 16-03-21, 21:21, Martin K. Petersen wrote:
> 
> Vinod,
> 
> >> Document "qcom,sm8250-ufshc" and "qcom,sm8350-ufshc" compatible string.
> >> Use of "qcom,sm8250-ufshc" is already present upstream, so add misiing
> >> documentation. "qcom,sm8350-ufshc" is for UFS HC found in SM8350 SoC.
> >
> > Gentle reminder for this patch, Rob has acked this
> 
> Was not really expecting a DT patch to be routed through SCSI. But no
> worries. I've queued it up.

Thank you. You can blame MAINTAINERS for pointing it to you :)
Typically DT binding go thru subsystem and dts thru soc trees

-- 
~Vinod
