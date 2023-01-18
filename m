Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1812A6716B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 09:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbjARI6V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 03:58:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjARI5E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 03:57:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AEE36779B;
        Wed, 18 Jan 2023 00:11:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 17510B81B9B;
        Wed, 18 Jan 2023 08:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A985BC433D2;
        Wed, 18 Jan 2023 08:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674029516;
        bh=fLeRuQVxiw9tI+APR9Y667hU7+gwUKduzbj3LXSGHSA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IsCICPXwLinPf+G54q3VEBv/bfjrnmeq8gDvENV6ITJQUO/FPkdBX6BZvZan4WWPO
         Lhr2kDVBzWgr7OlPznLcxBbTj+cF5zJk3Qrz9VVK4anYBaus4USGiVUZp43C4sau/K
         GNWJJcApq37VdoOO9UsNjFtiU5YfxqYK71H6iem3lzR44FFI4iruG+fhurOC59qbZs
         wGXoHJkUD9YjMfLAZyFi0eb6+PgxMSqJrRm+Si5KzKJJanzXQAFf2zRwmInWTY7Zyo
         B7cgQROkfDSXTqB1/k7X0qN8M3EGhsjqZdnvmj7Cqz8B2zI7rZ/QUcdhw1uwKOGeSJ
         j00VZPN2Y9aaQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pI3YM-0000aA-Je; Wed, 18 Jan 2023 09:12:15 +0100
Date:   Wed, 18 Jan 2023 09:12:14 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 1/6] dt-bindings: phy: Add QMP UFS PHY comptible for
 SM8550
Message-ID: <Y8ep3jXNRPSIVwUy@hovoldconsulting.com>
References: <20230117224148.1914627-1-abel.vesa@linaro.org>
 <20230117224148.1914627-2-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117224148.1914627-2-abel.vesa@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 18, 2023 at 12:41:43AM +0200, Abel Vesa wrote:
> Document the QMP UFS PHY compatible for SM8550.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
