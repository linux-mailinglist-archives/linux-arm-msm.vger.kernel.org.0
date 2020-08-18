Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41AAE248734
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 16:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgHROTB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 10:19:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:56950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726612AbgHROS6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 10:18:58 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1E38C20786;
        Tue, 18 Aug 2020 14:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597760337;
        bh=q04K0Ou4ZszLumqF/XYpooMQUDyI6Hxy/aWw2HXfGYc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=w8rlkhsf+Vd2d9PmYMVpOj596PW4Bq4XMG2+b01zpNHJa3svDOEdLzRyUNUZRQDLX
         Y4THoJ4MiqLCMgr04IJkdqv89On51IXV2GzA1fMb8H7SXp1gb1s33RVdPg/ETSD0rD
         gNfalzLF1t7JoWB1823T1+m8jqxUSNi3ZO2cqKCo=
Date:   Tue, 18 Aug 2020 16:19:21 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linuxarm@huawei.com,
        mauro.chehab@huawei.com, Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3.1 43/44] dt: document HiSilicon SPMI controller and
 mfd/regulator properties
Message-ID: <20200818141921.GB608639@kroah.com>
References: <cover.1597647359.git.mchehab+huawei@kernel.org>
 <2f88fed96d67b05fc033356fdbb7e3227955ab34.1597647359.git.mchehab+huawei@kernel.org>
 <20200818131024.6918c5ca@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818131024.6918c5ca@coco.lan>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 18, 2020 at 01:10:24PM +0200, Mauro Carvalho Chehab wrote:
> From e464ec2c38c083403b556e60f189ee8ae2f2c9c6 Mon Sep 17 00:00:00 2001
> From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Date: Fri, 31 Jul 2020 09:46:02 +0200
> Subject: [PATCH] dt: document HiSilicon SPMI controller and mfd/regulator
>  properties
> 
> Add documentation for the properties needed by the HiSilicon
> 6421v600 driver, and by the SPMI controller used to access
> the chipset.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 

Did you mean to enclose the whole patch, headers and all in here?


> ---
> 
> v3.1:
>   - Changed the DT properties to better match upstream requirements
> 
> PS.: I opted to submit just this patch, instead of the entire
> series, in order to avoid flooding people's ML.
> 
> I'll be posting the full series again after DT specs match
> upstream requirements.
> 
> 
> diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml

staging drivers should be self-contained, please keep dt files within
the staging driver directory for the driver until they move out of
staging if at all possible.

thanks,

greg k-h
