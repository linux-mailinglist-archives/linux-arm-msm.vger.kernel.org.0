Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96D22453CBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 00:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbhKPXli (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 18:41:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbhKPXli (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 18:41:38 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13DF0C061570;
        Tue, 16 Nov 2021 15:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=0J3u7OZVd59ejMqTuydUhW9tgZR305v5d836Bv6rULk=; b=wd5zarV7wh3iqaW5fTpNdMztkw
        DBVa01+wCkKjbMDSJ32ZnsFzaMGH2vX6XKv7qiIxXRfhDil4Gu2fqVfXf/adIP2UZIdpqLNEWPn+G
        Z1/ZTAPmOFvsXdU61LE47zXWW3K4OAOu1UTn85IKZt74CTY73P+wQ3v0qDTee5uRAPIFzcxw0T7UG
        BSdFzsO/ojAOI85CEHlKA/kNFENqrYtrG5HcxxwFKBGI4sN+eW+E/QlmW4JrBhuW5Ir/ZZKNin7O+
        a9AsbGGsIcjIyLdK4NwBVyBq7neZijfl/r3F9IySTAA8dBw4zLJnkcEUh0562WfHMAl3tFKgIY634
        81/HOxOA==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mn82C-002xPc-12; Tue, 16 Nov 2021 23:38:40 +0000
Subject: Re: [PATCH 2/6] phy: qualcomm: ipq806x-usb: Fix kernel-doc style
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-phy@lists.infradead.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211116103951.34482-1-vkoul@kernel.org>
 <20211116103951.34482-2-vkoul@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1ab0161b-4320-773f-b160-f28db775198d@infradead.org>
Date:   Tue, 16 Nov 2021 15:38:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211116103951.34482-2-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/16/21 2:39 AM, Vinod Koul wrote:
> The functions are documented but there were style issues, so fix
> the style and add missing description for phy_dwc3
> 
> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:130:
> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:174:
> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:212: warning:
> This comment starts with '/**', but isn't a kernel-doc comment.
> Refer Documentation/doc-guide/kernel-doc.rst
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 26 +++++++++++----------
>   1 file changed, 14 insertions(+), 12 deletions(-)
> 

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy
