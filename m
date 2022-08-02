Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 954A058831B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 22:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234721AbiHBU1m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 16:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233756AbiHBU1m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 16:27:42 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D511ADAE
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 13:27:40 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a7so14961487ejp.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 13:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=lby9lvyugHd82C4d0KaHXp3LJIsW6TZwJseJofssqh0=;
        b=dY4VR24PCrKQgsbFRhU1dAE4OtBv7+g3WLBV6S0FMdma0ru6Hreb2eW7/GMoGlAU2N
         +H3WCgfto09f7rg2xmE2XndfDGLlP1XP9cH6qP0XE5OsnuzLQ6/RGW78tSovVY8cjzqo
         yB9f0OUxFUU+z39N6BBZEGLX0BRV57fefxMM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=lby9lvyugHd82C4d0KaHXp3LJIsW6TZwJseJofssqh0=;
        b=lOyyu7JYuvFEfHvuUL207Fwhcd8IT5w3JJfUQln/FJ3D+xPplfH118IE1hXiuH2W+2
         yMV3LrrymJv6MNF2rqgYyJ3UdAgr5L7mX5AmxJIS/G9hhGzVJqtvtHPZFQM+jzYl92f+
         BLYBodrL+9LhTdGst2JnVR5hQSLgmWNxUIKj12XrAe+q0v/+iJiwAUCr/LB8TVFobIKu
         XmHkf3eYx4hiPH82UGs4TEZ5K4qMig3DU8t88wAQ4C8mgdjiT/ujqiFYz4ngs2X7CyQ9
         nOhqlke3Ar4JRYaJlOBqJOwokjXCawUMA+O3NRolA266zPl0vfiNbFz+fpmwmskplnQ6
         dSVw==
X-Gm-Message-State: AJIora+8oviCZ26Fas9Nno07+rm3FPz9NyUP6B+AIPXW39BvIxECNrIk
        UAXn/lefO9Bb757nn1GSFyYR/i6r+ADcVNGN
X-Google-Smtp-Source: AGRyM1tUSmyEdmdYBb/DoN1StbFKo/94xHsIAksRoozTC/SJb8P4tP4J8ugmjDjKO0fpAfJgOU3yEA==
X-Received: by 2002:a17:907:2722:b0:72b:6d79:1a46 with SMTP id d2-20020a170907272200b0072b6d791a46mr17583368ejl.713.1659472058790;
        Tue, 02 Aug 2022 13:27:38 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709061da200b006fec4ee28d0sm6564536ejh.189.2022.08.02.13.27.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 13:27:38 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id p10so15003729wru.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 13:27:38 -0700 (PDT)
X-Received: by 2002:a5d:5889:0:b0:21d:bccd:38e3 with SMTP id
 n9-20020a5d5889000000b0021dbccd38e3mr13824780wrf.659.1659472057895; Tue, 02
 Aug 2022 13:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220802200649.2122084-1-broonie@kernel.org>
In-Reply-To: <20220802200649.2122084-1-broonie@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 2 Aug 2022 13:27:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X2aPq8Zsv-GSfj8Kz_9+MFxmejchoF4LUUY3tOLx3Ntw@mail.gmail.com>
Message-ID: <CAD=FV=X2aPq8Zsv-GSfj8Kz_9+MFxmejchoF4LUUY3tOLx3Ntw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the tty tree
To:     Mark Brown <broonie@kernel.org>
Cc:     Greg KH <greg@kroah.com>,
        Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-serial@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 2, 2022 at 1:07 PM <broonie@kernel.org> wrote:
>
> Caused by commit
>
>   c474c775716edd46a5 ("tty: serial: qcom-geni-serial: Fix get_clk_div_rate() which otherwise could return a sub-optimal clock rate.")
>
> I have used the tree from 20220727 instead.

Posted a fix: ("tty: serial: qcom-geni-serial: Fix %lu -> %u in print
statements") [1]

[1] https://lore.kernel.org/r/20220802132250.1.Iea061e14157a17e114dbe2eca764568a02d6b889@changeid
