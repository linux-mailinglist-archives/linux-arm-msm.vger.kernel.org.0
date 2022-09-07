Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA925B0872
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 17:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbiIGPYH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 11:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbiIGPYF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 11:24:05 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A979B72B2
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 08:23:54 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id b19so16379228ljf.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 08:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=dcyaZOIDIcFYxr3EpOltaB56KTHbZwi5idlufoODXZDytJ/HNgr5NwhzVtc2tL74iU
         qW8WWzl0xtf0PC0cV0HDi7t59Xs+BSlFg9lxgrlbnPnWbdAs0dYbf3f1eBeqwHFnm4J7
         5yXomdQro8HMRY5m+DfBDYrAXiEnYuTcvtUCt/gD/i6zK6pTPlCS+O7Qv5uFKMFk8Hat
         VPvvitHd1g0uvOaOmTKEjnqRbnQwAvboRTzFwQAbiefygkO5d7mxsii199tDRFNKul43
         ii9WF+V8wx2D3Oz+oR31ysQC0PQFKZ+ux3rBOH7d0HKRLCoSqCDZ86QYh5var4iwcbih
         OM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=FypXPr7zu5RudV0vQ7kWRxquKghTU7/Vw8AcVRm69/Xq8dU34IKt1GB9VwxjOxjXxW
         zeXgHejzTKBzqvwyDqIDIuC3GJU7dqVS6m8FX7nhZ5Xt1znOvcqIjR6mcMYyXodTfuXl
         cE5jQ8R+ILaWIiSunOTGMATc7sdlEVJDunNAe6PRIBDIrs51G0Jqd5xpQQg6LvwNR1SI
         dJJoDYa8YlPKA95r7V7s+qSE3HoZLmU62c7cI2Y/54YbZRHr+yJTRr0ZJmMju9FPq2Gj
         QeBvwMEEcFLIXzG4IFAtcnwSOjATfB8c3qIGuOgCxdiZ1AuuKzVHzydA4nWwKeL9eu0f
         Ksrw==
X-Gm-Message-State: ACgBeo0t/mkW8V1QFy5DdJsYogT0pI/wnmYF+gAlTsTUZPl5gSdeCMW+
        oo/w3DGL9UEPEbgweLEhTRpr9+j2N+kMp/s0E34=
X-Google-Smtp-Source: AA6agR7Q0u8cyG3t6cIaaXad0RzSvIn4zpDO4UJlVkqC4OHBu8+0L6N9m7s8ySgQhYEAEw8GZLhcrBMr3po6zSHNu9s=
X-Received: by 2002:a2e:8509:0:b0:26a:c954:978c with SMTP id
 j9-20020a2e8509000000b0026ac954978cmr1206919lji.471.1662564232469; Wed, 07
 Sep 2022 08:23:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6504:214b:b0:1e3:2600:8d06 with HTTP; Wed, 7 Sep 2022
 08:23:51 -0700 (PDT)
Reply-To: tatianaarthur72@gmail.com
From:   "Mrs.Tatiana Arthur" <tatiannaaur@gmail.com>
Date:   Wed, 7 Sep 2022 17:23:51 +0200
Message-ID: <CAJMZp9a9b-0MJNje4L3NwOMSgyXZtAuAY-Op9uf98UbO7shGNg@mail.gmail.com>
Subject: Did you receive the email I sent you?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


