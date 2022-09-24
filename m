Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0695E88C6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 08:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiIXGi0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 02:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiIXGiY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 02:38:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DDB6146602
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 23:38:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BD8FA60E84
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 06:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39AC1C433C1;
        Sat, 24 Sep 2022 06:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664001503;
        bh=T8nmOQrLj2xvmYYRjnPLdaZP1dXgSLOPrMfJSf2fi2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bM5Ao7/0CcYomFx8LBj61ETlTKq/rE0Qxp5aOZNZy/P0vDNmF4lgnb9Uo8UnitVKf
         QOSveK5GXpxbDFYdnZG7XDR6jEkzFIVHj5Em9N8GYkXEDW+d8UqCIpW5f3jNsge4iM
         kmMqbbtxxtgB8V/V45QDFcIAScfJv930vSeEVOl9CgmqQ+uT0PKkOZkLXO+vSj0ArJ
         sXdHP4QPbIwn5U835PXeg9grFdoEgi//ZgOG/4g8rjpTtER4cJCUp4t75r+dkkqu1U
         Ep9yPg8YH6YyAy7KuJv4y6uDzkTdN/Knugm2VgiYcXsylkmuSoHWjz4ApKFShz2KZe
         JCq2OE04eLa5A==
Date:   Sat, 24 Sep 2022 12:08:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Yuan Can <yuancan@huawei.com>
Cc:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, kishon@ti.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 0/7] Use dev_err_probe() to simplify code
Message-ID: <Yy6l2lSb8v27P5WB@matsya>
References: <20220922111228.36355-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922111228.36355-1-yuancan@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-09-22, 11:12, Yuan Can wrote:
> This series simplify the error handling in probe function by
> switching from dev_err() to dev_err_probe().
> 
> Yuan Can (7):
>   phy: qcom-qmp-combo: Use dev_err_probe() to simplify code
>   phy: qcom-qmp-pcie-msm8996: Use dev_err_probe() to simplify code
>   phy: qcom-qmp-pcie: Use dev_err_probe() to simplify code
>   phy: qcom-qmp-ufs: Use dev_err_probe() to simplify code
>   phy: qcom-qmp-usb: Use dev_err_probe() to simplify code
>   phy: qcom-qusb2: Use dev_err_probe() to simplify code
>   phy: qcom-snps: Use dev_err_probe() to simplify code

phy: qcom-snps: Use dev_err_probe() to simplify code
phy: qcom-qusb2: Use dev_err_probe() to simplify code
phy: qcom-qmp-pcie: Use dev_err_probe() to simplify code

Applied these three, rest have conflicts please rebase and resend with
acks collected

-- 
~Vinod
