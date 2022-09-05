Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2365AD720
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Sep 2022 18:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbiIEQLf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Sep 2022 12:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiIEQLe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Sep 2022 12:11:34 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E847053036
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Sep 2022 09:11:33 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id z22-20020a056830129600b0063711f456ceso6422592otp.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Sep 2022 09:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=G2lzjW/hqOLy+UEahR248sCmOWKyYJ5tiqincZE1LDZTWVHO/jQ2ROKmTwBdb5VrgV
         oEh0rtOLDDrbd8oTOY4b+YIBfbHfu3OzFnHtrtwrB8js8g1EikZesQhhhA3dq+h6F8Bl
         Sied3nC5klczqRyBkSYZms/r48tXRB4/xC9nIIDweoGxDMmfoJCmdZ2acFOwdMx9MVFW
         +ao7BOjj7HJuPySogm8m/Bp1L2ALU4IgdN+9GhObMEm+cmMqDsNnoOJ7d3w9UQgjbK66
         /z0vpQ7V0bTxqEnepyAmwLINB1o6lKoMSWS7oIODX7OXlV0QH0KbtUCBoDKd1zcopcaK
         wkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=7z1a9YC/GkT+3z3RzdEBUJL4Zp/c5veI7Fi/zxdYsH5Kzc6WvcJIeFN3R3S44/MlGK
         MW+LI3h4BZPjq3QQB+Ilg/kUAFTiYJgwCSoA3Ks6xRtkFx9U54ggYuPDwdjUPFoXRETq
         oARzvdbn53TUj+2m5zvZs57hcopVITetUlcdBuM368a3UYX6i48IZCRC1IMZD5Rpuwli
         j2Bg5VVJFbrMiEuH4HMbu5LXYBh92Z1ZfIjghku4axwAdH7ddvfnIcmQBeyJUz1wYSE9
         mwQSSbIQAr7fUwINuJxN9knZ4ckdvC8xMJa3oXY8ooxc5DKAvNtpzmthwDPJGrJRphRT
         ZHDg==
X-Gm-Message-State: ACgBeo1BxbKvKfJU6m7ziS4FLbCehanci3wyHG0PCYOfm36IVBS2vHwX
        lqER78opXq6ZjeGg8bMaXtoyCzwN93WdwdTk00o=
X-Google-Smtp-Source: AA6agR7GPboFgloQqlym+hKkVtjs9tQv+UH0gn7Fkk4o6c1vUZN034xjqfY08g25ugiWuoXnPl0KIj6ZY2hxF/pq6iA=
X-Received: by 2002:a9d:7984:0:b0:638:877e:5607 with SMTP id
 h4-20020a9d7984000000b00638877e5607mr19046420otm.258.1662394293371; Mon, 05
 Sep 2022 09:11:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:8403:b0:b3:9407:5fcf with HTTP; Mon, 5 Sep 2022
 09:11:32 -0700 (PDT)
Reply-To: maryalbert00045@gmail.com
From:   Mary Albert <bariyoussif@gmail.com>
Date:   Mon, 5 Sep 2022 17:11:32 +0100
Message-ID: <CAA67+kBZkj_4MXA0vSRUQbDiVBgszf+g60h-MW3hqszVy2MC-Q@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

-- 
Hello,
how are you?
