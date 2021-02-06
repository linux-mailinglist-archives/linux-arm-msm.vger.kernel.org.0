Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F27BC311C85
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Feb 2021 11:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbhBFKE1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Feb 2021 05:04:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:39446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229508AbhBFKE0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Feb 2021 05:04:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 03C6664E5B;
        Sat,  6 Feb 2021 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612605826;
        bh=5EGhW2CiKOLAVPgtj5gKi1ZhLhIXgilYb62no3TpVSs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vJRXRo/a+zMjMkunUN17UTr6ripZKOrIAAPI/+9i24lJTItVC5YX9zt5XpmuqUoni
         K1fx1WjmpvyhH35W92HVcNLnd1KflLCtxihi5ZNEE19BNazC5kIBWvDyXHz4Fk+fMU
         O9C+MWmblMJ9bxT7dJCn+Z7sSRUUhisC5p2tyG5JHk2s6+b5hsBRmxCQdqGLibVUpU
         6kpDJBpKuCZUvQpKdu9kghxycR8Rd4dE3qGXv69Guf+lJrZDT4rgDWGR6iKqWS5HpC
         QTu33lGrtO5jXUT8EqBLj8bmkYoChcPGFr+6hKVlK3wmx1gTJ/MCY6AEXVqFpFXaMz
         LXralbB75hguA==
Date:   Sat, 6 Feb 2021 15:33:31 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qmp: make a const array static, makes object
 smaller
Message-ID: <20210206100331.GK2656@vkoul-mobl.Dlink>
References: <20210204180313.108876-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204180313.108876-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-02-21, 18:03, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the const array cfg1_settings on the stack but instead make
> it static. Makes the object code smaller by 24 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   73585	  20240	     64	  93889	  16ec1	drivers/phy/qualcomm/phy-qcom-qmp.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   73465	  20336	     64	  93865	  16ea9	drivers/phy/qualcomm/phy-qcom-qmp.o
> 
> (gcc version 10.2.0)

Applied, thanks

-- 
~Vinod
