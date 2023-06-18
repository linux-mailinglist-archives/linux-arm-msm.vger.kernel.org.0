Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36209734674
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jun 2023 15:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjFRNwp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Jun 2023 09:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjFRNwo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Jun 2023 09:52:44 -0400
Received: from sonic301-21.consmr.mail.ir2.yahoo.com (sonic301-21.consmr.mail.ir2.yahoo.com [77.238.176.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027471BF
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jun 2023 06:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048; t=1687096362; bh=/RyinwaMhv2u3rKYkX1+azxoI3ZagrDxsiuTKytoILU=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=eey+7ucCiXAnE7Pdl/ETdJCLMfnMCG4vJxSlKn+6dZCzn/yJsQ9RsXC6d0FjjLIcZwcE7BtuwKV7TgJgyA2Q0bT8ULx8Z17+pFVqrjDQCRwbB/lgyT8WNRRz3VGY1yZS2X2Hdg9Q1qJzWfzEUfVHy9zPEbro7nqsLbmVAPYINIfrH9rGbRw9z4qv2HfGr3CNF+or4l29CwEmuPAgv5bgpXlMs4TxNEMQskFQffr0zOCQxTJv/a4Qd4FtPuF5r4bone6e7cH0kscoIjFPQqslUvNLsxsWSeFojOEQMbVgXdn38udzq4+zN/OdNQETc8SY0HONDDNVnPOJu3LHM5Je5A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1687096362; bh=n9imRzBVXK7LGuUd0QaSdKLiyaIbu04UryOZl2q/fov=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=mumhHzmlb3aOvvOPiuG3laa+t1lQpe8L59WCMleICmWr/QIHPbRYZmgBqMjN6DsopiJpnuedSQ73PLj1V/klXM1uPUWupzq16XYXMNCew4gs9Q7rI/RblFI8+JKo1QOJyHbEvXP/p/PQi5L6Ce81D3kGpFpDwaKOG/9wyImjOTCUQHBxI328mZl+ba/qNqlUZli66T8Ohf+HCfjCZzl9xAxZI6hL4oBFE7GxErgBmHFUdCxSFDDv1dFrHX1d06N2M28QlygeKv3721TH+N0GCAdhTM6vQvbyvKFUPFcj9frD9LUNRCnGSvTZOmq0L5yQasVXlF4wL5QspBc5fKDQOQ==
X-YMail-OSG: DEs9pR0VM1lcWgD7m46SXnY8tyIKgkGbnglhExNMQZaLjo2RjlC0bL_4fpCiP7i
 QwuCCNtqNh_LCTlgx5HzhUvlXe4xqwPT7X6LpuDkSRMTxJTywAFxrlvlm5B31hXE23MVbqInDBgg
 ahQ71Bbm9DV2Lo3LPBb0tW7Bq4S6Mt06cWdJuHFVpNDz0BP7Kx5jVaasBv_EcXhHItS7Kl17G1wh
 fGpt9MuyZZrJWnq0ROyGPdtaMhsJZf2A37C7NPyB_1i_cIMwNDJunh_2.EYmQdu8Dt01hGCyjXri
 v1ZrN6FvruQ6wbzrfQSuI0WNzdXvwlnCDC3Cd8pn3_vSHwkypwzylTcOyfvdyZB4Z15cAhkmSUVk
 YUQ.sXzEVZJEHBjfoVwkuRPA7CfncRYIFe6y5y9josXWlrvnnzU53bHJ62vq0a9kaeHiOLLJpDCj
 8vCeh3q1AZenRfqBVtYG6ZSVHQ_U2GF583iZjppsWx88omtdhofaswmlOjxlixZDG805SwXMlicU
 3MZZ_jr4CcQFAQEniipeWIWRvpRfXFQ9ncYAX6iWMMyujysRtrV3Cgjp_VwLdEETaDdrXbKYY1hc
 aE9LmG67TH.aHA0zXKFumBePCux0sPdXLFLaWyH0.I4cMUl_K0IA3GBXLkgBVjiDCWurmmgoVAEz
 2owjt_L7SZ9cov6gdKnR0kwWkSy_Ubtxak7GqvxyBxD2fKC.CT0P_EoKB114ThEJZULnqf287o6X
 dBCCiy7SOxFih5Cd0XrhbPRHPB2p1J._Tf1JCyWinYuHsxSRtSeu8KOKrPHbI0t8Dmt8q.3UEJnw
 t.FtAp0iqxaLUKqrFO0.rPBjMJQQxuFbJ0eY.aqJR_QMDwrgiattllU.91Q7naIWpbi0lLbxhV8W
 rh14DpapCbO0x5m07YuddkKY85jW1cmCkSM0I6eJ8q1EIydg412cEOUBDABbLLkwxiI5So0CaF5R
 ge5UdFAveaj.Z9_Q7atiepn14kaxpS2T0V4vHL_rz8SsGKefHHD3IZGwv43MN3HMLcJ7CtTH0x6e
 7E8BRW64mxImjJ3cOl4sQKRoRYYPqyf5HxtVX5kFFca0UYpZD4zRhCpSugRnAsjqrTdWbiCABbSf
 e4bNxsW.g0_pnokuW4EL0QJLCXwUKKT1Ng258iGxRD9he828tNNn2Dq0p9Ksr.oX16oTLCm8rxxF
 tt8ZY_rv53Bmdl6W5QtqkX5bweD4quvipQi7M.p8inTMzbo_x8zCYyqdstMzX2OUCQzotSQpxWPf
 VJx_jRrxnRIu1XWuPDlWklzs00S8a8PEWq6YBCA2ZCAjBTjYC7i5wDqlyUSF36LiZVKyDRvXtkuE
 s_5HYB9PqiCzU6SirAHH0Ch3F_vC7Rag6DOxgPwsWbNCCptKZYmJ4ni8hGpIfasfPvThF2CD4Eqw
 odd41UJAsDF8ltnKumythcK8e4qVoGY64Dbk2cKDz7dIs8m0F2k5Oo7uroW2wIXF1HiKXgXYB2J1
 Xbh6IDP4UEwGRDnl0miKM0qSbX1vQUhevw3JGaOEIAesXqLk8tnDC8k4DGUbvMkdqIGyMneN2AYj
 syBvrzJuH.pnJkdlbhsYHQ0LRRWW1gqJAOkhQo87zlP0I7kfY2acwGOdv7Q_nx06inK5dnZMLJo1
 94X3rT309.dZ63.EKBjAcWLhBA2tZppbmrtiN2q5vbjfvlwEp6eLTKlHo5ib8Cxl5U1RJLwVF027
 XDCL_IIjaANVVCcsvTqMlZmhlRIVG4u48OOjejZo.2_GDXoIPAbaQJ5rcEi1KNoc3p9JmqWnYAOT
 GtSd2uDlFM.Wm7zCWoQSJSR0c4vvarBpfdQ6fsLj7CdaTP_OCUZrvZa_5SI9q9yfwWYOUV3GyrHv
 FEUiQbIGucwo28CHMNG75EoC32lVEjanyuElOb0_wVcdo.cF_EgtcGveB2c_67_EdONiV.HJ0S6t
 0PtcUg0BLGhzyoplFH9JVhAiOxtL4O7Kq6stkurUCZcGi4Sn7iqgqjA.kvl4vnGURy2UQ3dvOUL7
 AGmqVOLP2k2iLmWGNlNi5Hu8CSMoUji9u5YnAvuiuOfK7yW2DlRalYy1j195v4oMj78PC.zK4CoW
 UDsbr1BKGh8sfcm13lkZg5yKgsL8N7HyCM3.9i1.amXkAcdtSkFfd6UZKBEnuVFbWYUJD4efIi6i
 3Gp8Go48S5_eiSX1Iw.OluL0AagoaZVU4cOblPFuqwXNWsypbwvsEekClo9og3Cjhb1BZy9aNpND
 Kl4G4Ed2U3Wty8lDAOfQMLRqmPoSmSbYA9jO17Hvy_3NkG6GnvGJXDG69zy_ePUzbGh9xUCQsSG7
 woNtKSqAs9hI1OS.r2n4CyymygZDYRGg-
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: 3485778f-c7ed-4cf2-97dc-cf0adc5eff8f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.ir2.yahoo.com with HTTP; Sun, 18 Jun 2023 13:52:42 +0000
Received: by hermes--production-ir2-7867f454fc-z6m77 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 349a3a6a98baa16b39454e13896df300;
          Sun, 18 Jun 2023 13:52:39 +0000 (UTC)
Message-ID: <e542b4f8-2149-0136-6892-59390f96cf90@rocketmail.com>
Date:   Sun, 18 Jun 2023 15:52:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/panel: move some dsi commands from unprepare to
 disable
Content-Language: en-US
From:   Jakob Hauser <jahau@rocketmail.com>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Ajay Kumar <ajaykumar.rs@samsung.com>,
        Thierry Reding <treding@nvidia.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        dri-devel@lists.freedesktop.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        phone-devel@vger.kernel.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Joel Selvaraj <jo@jsfamily.in>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20230613-panel-dsi-disable-v1-1-5e454e409fa8@linaro.org>
 <ZIjayn8nVy-ejThH@gerhold.net>
 <CACRpkdZ7a3aARMs3iBbBavF_0AkPOPs3fH8e6CrZYo7Ybr6m_A@mail.gmail.com>
 <4f78b601-6e6e-2274-3174-87c62d7cfcd5@linaro.org>
 <CAD=FV=X_xonf1Dz0BsNTKm4-zBm+ccKvPO+wEWFVMUVY_2=h3Q@mail.gmail.com>
 <e644a590-27f6-0eed-af58-097677beaf13@rocketmail.com>
In-Reply-To: <e644a590-27f6-0eed-af58-097677beaf13@rocketmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21557 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A typo in my previous e-mail:

On 18.06.23 15:47, Jakob Hauser wrote:
...
> Then the panel get's turned off:
> --------------------------------

... should be "When..." instead of "Then...".
