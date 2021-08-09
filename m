Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F07B33E3F19
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Aug 2021 06:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbhHIEsg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 00:48:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:43770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229483AbhHIEsf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 00:48:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0425961028;
        Mon,  9 Aug 2021 04:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628484495;
        bh=lZznYktlX+2ikqPLn6aMNgz3Py3XN6PikBXUyZCs/W4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uuFWb/MxmKMGFWOxlI6lrvVoAmJNyPUEj0kE/GjgaafOY+d68y4tLyukQq+b4oZJH
         w0cKfGFVR0HZrwm6AyQgJMJ5HGei94gbhj+bqN8Rrnxhduwbbb8lmWcYPp7qM8pEOp
         CbHVjBRVgHYsjLRCY88XSkIxQ7LRUj8F9YN8mmDlDHqbQyBcy2gAsBp20ZdafUmCf+
         Xqx7gomc+gPKVBXd89i7m4jDb2L6qdrheGDat/13xfqD9FKUWq5C35opLmOPU3FwXE
         E58R73xxk3a9oIHvjLO3PUk+Hk6nLU4uVLpDgVeEwVaK6WqW/9lpKgK+ocmVcn/8ht
         AePu9e94SuO8Q==
Date:   Mon, 9 Aug 2021 10:18:11 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v1 2/2] phy: qcom-qmp: Add support for SM6115 UFS phy
Message-ID: <YRCzi9tXsUVi5kHS@matsya>
References: <20210805091727.942471-1-iskren.chernev@gmail.com>
 <20210805091727.942471-3-iskren.chernev@gmail.com>
 <YQ0xrgDjxXeNecAS@matsya>
 <86fcdc11-9f2c-0aa0-ebab-a26fa9ac2aca@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86fcdc11-9f2c-0aa0-ebab-a26fa9ac2aca@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06-08-21, 19:09, Iskren Chernev wrote:
> On 8/6/21 3:57 PM, Vinod Koul wrote:
> > On 05-08-21, 12:17, Iskren Chernev wrote:

> > why are these registers 660 specific and not V3 like we have for
> > other generations..? Quick looks with V3 regs tells me that seem
> > similar....
> >
> 
> Well, I looked at them for a long time and the only thing that is similar
> are the first few QSERDES registers from COM_ATB_SEL1=0x000 to
> COM_BIAS_EN_CLKBUFLR_EN=0x034. Everything else is different. So I can re-use

Is the offset different? I thought all Vn registers across chips do have
same offsets..

> the V3 for the similar regs, but they are 10%, so I figured instead of combing
> through all of the sequences to save 10% of the constants and make it slightly
> less readable just use new constants.
> 
> Let me know if I should reuse the 14 regs from V3.

reuse yes, but would like to understand more why offsets are different,

Can you point me to downstream code reference for this?

-- 
~Vinod
