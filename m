Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 714B350408
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 09:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfFXH6T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 03:58:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:50814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725916AbfFXH6T (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 03:58:19 -0400
Received: from localhost (unknown [106.201.35.23])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D35E32083D;
        Mon, 24 Jun 2019 07:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561363098;
        bh=kVDcI31FJiBeQjNCXXdfs7eUHWmy92Y3czi8wuLH5wI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gPTtIiAselJiL7oUTaniU7q2/RVh73sobFdW2O5+XihToq6h6heKCbEVvcaB9lgFL
         IrvSEmlzyReh8B2NoQLQ5qRURdF+LLPDbu6Cas/pEtIZksLtsEFpTOe9cHY1IyMdye
         wF0UJd9brQf+ubvGMzWV3KP2GukvJ0AjZYgi2RAM=
Date:   Mon, 24 Jun 2019 13:25:09 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 3/5] clk: qcom: gcc-qcs404: Add MODULE_ALIAS
Message-ID: <20190624075509.GY2962@vkoul-mobl>
References: <20190612091722.9377-1-vkoul@kernel.org>
 <20190612091722.9377-4-vkoul@kernel.org>
 <20190617042649.GF750@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617042649.GF750@tuxbook-pro>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16-06-19, 21:26, Bjorn Andersson wrote:
> On Wed 12 Jun 02:17 PDT 2019, Vinod Koul wrote:
> 
> > MODULE_ALIAS was missing for this driver which can be built as a
> > module, so add the MODULE_ALIAS.
> > 
> 
> MODULE_ALIAS() serves the purpose of providing an module alias for the
> driver, which allows the automatic kernel module loader to insmod the
> driver as a device needing it is being registered.
> 
> When the device is instantiated through the OF code path the compatible
> will be matched against the MODULE_DEVICE_TABLE(of, ) and if the device
> is programmatically registered (through platform_device_register_*())
> then the alias "platform:XYZ" will be used.

Thanks for the explanation Bjorn :)
> 
> So, unless we're going to support module autoloading of this driver from
> a board file no alias should be needed.

Nope we dont, so will drop this one and as well as from SM8150 driver

-- 
~Vinod
