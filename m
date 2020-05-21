Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258D71DC6E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 08:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726966AbgEUGLH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 02:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbgEUGLG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 02:11:06 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E24C061A0E;
        Wed, 20 May 2020 23:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=YCf31mHTKJUJ2rSc/ZizMDYsKG3sbmur+UHa6QauDLI=; b=QLyZNTE5PxTd11WCRmaFk54LrB
        RzY1mNlVeKOym0TeUpg0HGD9x76M46fqKYA6ALsJH1Q3BPoalikEQhyA6jEaymUrCMp2OlYt+4nuK
        hzd6baas9b47MCANI1eNhSMSAS/DqT9d8+3f0fdCCxaYBo86m+BycfJe6irWAO+P21i9KTIKQB5zf
        Pr7RaKlx8OqAm2F6pjHgKspyV1jhnRHvJF+gcMfE0zoqCEJZ3S47OKucgpS5IJTqTa9jiJA3/tiZN
        LcTfrMKEB6m1BOXNCjdmTlrLnRsacRgWL2geqA8er0d8H5K6gXijIuYjw/H07bnCZgvND62lB9pDb
        Ks2iaLww==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jbeQ2-0004hA-PA; Thu, 21 May 2020 06:11:02 +0000
Subject: Re: [PATCH v3/RESEND 0/3] Even moar rpmh cleanups
To:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
References: <20200521060425.24285-1-swboyd@chromium.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ad95dcb2-28da-ee31-e635-3c115608f75f@infradead.org>
Date:   Wed, 20 May 2020 23:11:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521060425.24285-1-swboyd@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/20/20 11:04 PM, Stephen Boyd wrote:
> (Resent with more Ccs and To lines)
> 
> We remove the tcs_is_free() API and then do super micro optimizations on
> the irq handler. I haven't tested anything here so most likely there's a
> bug (again again)!
> 


Subject: s/moar/more/


-- 
~Randy

