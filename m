Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92B7763652B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 17:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236495AbiKWQAZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 11:00:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238605AbiKWQAO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 11:00:14 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9591FC5627
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 08:00:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3428A61DD6
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09775C433D6;
        Wed, 23 Nov 2022 16:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669219211;
        bh=Iu4fc6+0jXoq++zDmmSSwKANHEKd+b9fm0eRRt9Gqpo=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=ZQSeaoyCi71TMsReD1GAQDoi7Apbh31NxLSluL58NkgT0flGgl6B7/R0sQ2X0I115
         qCtf/+uhsTM6YyV4T1RQ8/Zw9SeMEe3TOEtrz/RoYbN4nq2CqY8UcNKt9sZqr0EXxk
         zWIzZRp8RHL3VexxM82ZS59YkYPucNe/vpBpDRFUk16aPBfrxcsFAk1p8+WmCs48oP
         ih9TlHYbRxwynCO6IizwaRGkyPgDTKeciagoc5VTlOt/nR5xqnIlxmSccx6Tzzwn7q
         kJhTU6XQSWMnPkqFWKu9aKybR1gkcZ+wHdP34snFloOPkJOkGr0Avg85KZHi17qZEa
         7n4Gvnhqcb4Ug==
Message-ID: <a5dc12a7-14fa-749b-ba8d-e8537daf98f0@kernel.org>
Date:   Wed, 23 Nov 2022 17:00:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/2] dt-bindings: nfc: nxp,nci: Document NQ310 compatible
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
References: <20221119153903.770853-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221119153903.770853-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/11/2022 16:39, Luca Weiss wrote:
> The NQ310 is another NFC chip from NXP, document the compatible in the
> bindings.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)'

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Best regards,
Krzysztof

