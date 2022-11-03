Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70A16617B99
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 12:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbiKCLfT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 07:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230376AbiKCLfS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 07:35:18 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4A96401
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 04:35:17 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bp15so2259592lfb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 04:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMfCMMBFOe9bcE0uhCdXWh0+bagJTHzdz2cxOm6mYl8=;
        b=iNcjQzB4XnQMmNRivwf3hv9yptWVq4ZjEAoeEfe3d0olkPIFTXtygBmC/u/dbKArOu
         5wvdBuRxKLPw4tTcNck2BlcLg+MdWTJKGagkQL5I1sSBfzaQgC2CvYjbHnHwSbK25X9z
         pZIY3+IM7H08c0m3NQ881a9PL7oBgkLwbwwo0shAB/JbAIDbpPWYemxiALY9UOmQV+tc
         939Pm90DVnjlX1vu5LTvZWZWpRFvHcVeMXWZ3xLmoQj1Oa/U9PaFrKVvrMI6by8pKY8r
         R3G1mIFm9VBccaRBytsYImlmbemfRqR9IZMlT9+dPPWlzG8xG4CK5paqhG7/Ab35ncG0
         0M+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FMfCMMBFOe9bcE0uhCdXWh0+bagJTHzdz2cxOm6mYl8=;
        b=DfchWNjcaqlRVGC69Bia4NSMlSWk0RBJG3oZoOryfBGrB2WXJBRfWQgihk6oYNNUz7
         EtsmOBmv3y3dbxRjEAM0YFQz310QDpW7Hikvqf7qsDoJcdJ6oQzvt109XZSe5lxZP/bA
         UhgZntIxAL8/GiuVtNCU7UaT0O2oz0EDWhgawgYuXyz7ElP/g8q+lBBu6WrkQVzXQ9De
         yMwfD1mDCMA+WOlNug5NpSF21xZl8o3jEewZ8Ps68zpNPiIaB79Kr3rlF3rY9Fu3lpWI
         YpbJSxY9y1EvO0DH4mtal+mD9juOFeUZCgedhhR57rhYdvv8yTb/4csPqRIXsjTLQZX6
         Znvw==
X-Gm-Message-State: ACrzQf32gd/ex5ALM96zvaJaiXj8Ir4EKofpK18vTIkXQCL6sEYttgqv
        o/CEZS7ap/EamtwXuco/efxnkBEzdy33V3bof4jQC9g7
X-Google-Smtp-Source: AMsMyM5A6nuVW3A3mLSDk0LjKFa641aNeDJZSemvcrC0NLxhyfGaN0vc3CpPVwUAMthQ1B01u9aLQuoE0hrjCIMsPpQ=
X-Received: by 2002:a05:6512:e9e:b0:4a2:1503:c2e7 with SMTP id
 bi30-20020a0565120e9e00b004a21503c2e7mr11902141lfb.476.1667475315085; Thu, 03
 Nov 2022 04:35:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6504:1693:b0:200:906a:3589 with HTTP; Thu, 3 Nov 2022
 04:35:14 -0700 (PDT)
Reply-To: johndesousachambersgh@gmail.com
From:   "Barr.John De Sousa" <lonatotogowestafricans2021@gmail.com>
Date:   Thu, 3 Nov 2022 11:35:14 +0000
Message-ID: <CAFoF2jtrqKkEHMaw7z4NGnPgC5J_uW=8EqayDE2E+LGM=45ksg@mail.gmail.com>
Subject: hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I would like to have a word with you, it's very important that we
discuss it as soon as possible.
