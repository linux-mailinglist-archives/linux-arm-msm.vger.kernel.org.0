Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4FE5F874B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Oct 2022 22:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbiJHUMV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Oct 2022 16:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiJHUMU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Oct 2022 16:12:20 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B3529CA9
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 Oct 2022 13:12:17 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id i7-20020a17090a65c700b0020ad9666a86so10017785pjs.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Oct 2022 13:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/mFhEsR+ZT04N1w/TcdwnWqE4LQo2lAdkmgJCA71gMg=;
        b=mVJ26xSIFqKKTEq4LBj5kSk0NyeYvik0zClETfUHd5jBkDkpl6csUGBBJ7MLGNEsrr
         kwlxoqU8TfK+2XAmRYAJgWjQwAzb3DCZuNcdEpi4aKSRs1+vea/YhyqLeIXpsNCf93xE
         N0yJvA2SYJXviDRnnO7QLoDHSPvRbJoYb7V/DQqaAIjn4IPMW2NcUcRg3zeT0zbYXNfn
         87g8kp44AwdRuXyfpptwan9VKqUVquvydOl+ifB4AAhwjY27oXanEzPFZyv+Xwv6xN9c
         f18/PU1I1tTuX3XVz0tMN2jevPN4k9Fx46FrlwkdNK7s4DSa7gM3Rwr1y2GM9GSQL10Y
         PcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mFhEsR+ZT04N1w/TcdwnWqE4LQo2lAdkmgJCA71gMg=;
        b=d/Xx7jcDiLOGT9TLVZNRoWnhZMbrmfNJmZUC/LT4MEdYuUf5qaWpXtuuNdyH47vgpA
         5xgtL8mfS28IZ0x1KBwhXK6U0bZW/nyRwwS0tWteEivVqKAV1Rr+QEpQS1fHRdj6MSeF
         4mzB8u1kZhDMQxQnk5vnIUNu+VUo7wZcnCOcj3paxGVddjL44HlhbOx+7qRtpjjDdnUi
         HMkfrrKx7orIMEOnOMF+ALqpx/hIOEByC+PPCynnBQLJ/1Pl48cVyg+MkzAX2KvTLoS2
         LC/vXofCUT72tcUt7E7IyXchkChHPGvWKABkJm2kBEqN7A2n0Gw0Z4CNsA+Xbi/EuLa7
         NslA==
X-Gm-Message-State: ACrzQf2+qm2FZRCw5kYlY+bqOcx4eqEsfRo7k5LRjdg2V8mxS7JdUOpH
        kdErYlrxwckijcWCGkU0B0TugH7zKj3v4X+yhuQ=
X-Google-Smtp-Source: AMsMyM5AI8KEuLLV0S85whFnTXV1US0dpzXOqyT16Qiqnuk8FIxw0W5lqm3Il8sgbkYx/4JPoC8OaUlnM2tW0IWZlHM=
X-Received: by 2002:a17:903:18b:b0:176:afb8:b4ab with SMTP id
 z11-20020a170903018b00b00176afb8b4abmr11636032plg.80.1665259937184; Sat, 08
 Oct 2022 13:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAB1t1CzwhBL3qu6GQZPwXBQG2YwFn9B+Aqi=81xgfA_2BCm=4A@mail.gmail.com>
 <CAB1t1CxNcKBQ8wFGQmSupA1ix0C9hOUYPN6Sa-ACFcG_b9mY3w@mail.gmail.com>
 <9acde2c8-ebd2-f603-c6df-98af9ba1c80d@linaro.org> <CAB1t1CwXh3t4xEL6DvRBVs1q8OX_dOwN2-bR_CWjMQhozSPC0Q@mail.gmail.com>
 <35d29103-98ff-cfb0-a354-90a36f52fb43@linaro.org> <CAB1t1CyG7594zWg0agypYCrjMYkhxv1u-0wo1teK8cnE41d0jA@mail.gmail.com>
In-Reply-To: <CAB1t1CyG7594zWg0agypYCrjMYkhxv1u-0wo1teK8cnE41d0jA@mail.gmail.com>
From:   Petr Vorel <petr.vorel@gmail.com>
Date:   Sat, 8 Oct 2022 22:12:05 +0200
Message-ID: <CAB1t1Cwz6xM28m+br8FG_Q7ssiq=vaS1rJWw7rQPk8Tp7ng9-Q@mail.gmail.com>
Subject: Re: msm8992-lg-bullhead-rev-101 resets in initramfs
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ilya <ilya.manyugin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krzysztof, all,

FYI bisecting showed that reset happens on 86588296acbf ("fdt: Properly handle
"no-map" field in the memory region").  Obviously some memory mapping is wrong,
on angler the same commit also caused reset, some time ago I fixed it in
0e5ded926f2a ("arm64: dts: qcom: msm8994-angler: Disable cont_splash_mem").
Therefore I'll try to find problematic mapping in bullhead dts.

Bullhead also contains oops in most of the commits (no matter if phone
resets during initramfs or keeps running):
[    2.001953] Call trace:
[    2.007244]  clk_branch_wait+0x140/0x160
[    2.009415]  clk_branch2_disable+0x2c/0x40
[    2.013581]  clk_core_disable+0x60/0xc0
[    2.017486]  clk_disable+0x34/0x50
[    2.021219]  dwc3_qcom_probe+0xbec/0xf6c
[    2.024691]  platform_probe+0x68/0xc0
[    2.028772]  really_probe+0xe8/0x4a0
[    2.032330]  driver_probe_device+0x58/0xc0
[    2.035976]  device_driver_attach+0xc0/0xcc
[    2.039883]  __driver_attach+0x84/0x114
[    2.043962]  bus_for_each_dev+0x70/0xd0
[    2.047782]  driver_attach+0x24/0x30
[    2.051600]  bus_add_driver+0x104/0x1ec
[    2.055421]  driver_register+0x78/0x130
[    2.058980]  __platform_driver_register+0x28/0x34
[    2.062801]  dwc3_qcom_driver_init+0x1c/0x28
[    2.067661]  do_one_initcall+0x50/0x1b0
[    2.072000]  kernel_init_freeable+0x1d4/0x23c
[    2.075562]  kernel_init+0x14/0x118
[    2.080073]  ret_from_fork+0x10/0x34
[    2.083379] ---[ end trace fdaf735b91bb478f ]---

If I remember correctly angler didn't have this oops.

Kind regards,
Petr
