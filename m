Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15309636D0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 23:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbiKWW1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 17:27:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbiKWW1o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 17:27:44 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A87DF13
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 14:27:38 -0800 (PST)
Received: from g550jk.localnet (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id D57FBCD3D0;
        Wed, 23 Nov 2022 22:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1669242456; bh=iwnmiNGqfqg07nfIfNJxqYeVAkagFGeAycU6WPCvEAc=;
        h=From:To:Subject:Date:In-Reply-To:References;
        b=Oz16MTg8V8yRS8OP22HU1vgOweY5Vh9KiMsnptbmFxeFsikdQ8yDED2u/ANX8bWIw
         zE1gkTj7zOM/BFTZBIGiVja+o4bvOrhQUZyarZGlBsYQdVoqks+5/4T6JBu8BIn0kO
         Samz+nlLNcT+YXtuAw4j5ULELowdG9fJ8+aMe2S4=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: nfc: nxp,nci: Document NQ310 compatible
Date:   Wed, 23 Nov 2022 23:27:36 +0100
Message-ID: <3199667.aeNJFYEL58@g550jk>
In-Reply-To: <a5dc12a7-14fa-749b-ba8d-e8537daf98f0@kernel.org>
References: <20221119153903.770853-1-luca@z3ntu.xyz> <a5dc12a7-14fa-749b-ba8d-e8537daf98f0@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krzysztof,

On Mittwoch, 23. November 2022 17:00:08 CET Krzysztof Kozlowski wrote:
> On 19/11/2022 16:39, Luca Weiss wrote:
> > The NQ310 is another NFC chip from NXP, document the compatible in the
> > bindings.
> > 
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> > 
> >  Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)'
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC.  It might happen, that command when run on an older
> kernel, gives you outdated entries.  Therefore please be sure you base
> your patches on recent Linux kernel.

I seemed to have messed up my send-email invocation. Will resend with proper 
CC soon.
Thanks for letting me know!

> 
> Best regards,
> Krzysztof




