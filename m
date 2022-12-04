Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3C2B641D2D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Dec 2022 14:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbiLDNRA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Dec 2022 08:17:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbiLDNQ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Dec 2022 08:16:59 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CED31743F;
        Sun,  4 Dec 2022 05:16:58 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id fz10so9798268qtb.3;
        Sun, 04 Dec 2022 05:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KZhZpM5cHhUCwZksT75Tvb0qA2vjAhs1vuqKj336jow=;
        b=a60QoO+xVNgbQY9we7mD7q0dQQ4XoWxe4kgMUilk34N0+5L6idjZMohA1dYXQGzb66
         CeaAMaoXxIx3Fd/Ma6wDXMfeiN0i04TaupAXTjxLH2TFiUFNd4MM+17Sv2XHIMhBee5Y
         ViynbvN4Cwgxq212tN6Ep5esKHTD05oDPJBINoImXthI8yONqA2a9IcPlLQ8BEX4HqMm
         345nluHQE6NzE24R1m0wQeKxRhYnij9w+w9eU+6cHVOtxoG3EqAgIul0V5oaYa/ziSYu
         13TdrVd3vVhvI9WP6jSJANkHTLMaSfMiZIDTYVEvxBwA24qx/RpZTPobLTMLyTpOtG9w
         AdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZhZpM5cHhUCwZksT75Tvb0qA2vjAhs1vuqKj336jow=;
        b=ZAA3gG+nlNpe1Frc5jYVA+P0xCmC3+U69TZAKuMgGHTTRrNavu6EfY4nq12hT+KWdW
         FkhvpZh6JiJ6/ItaDupPghtcytKoWROXGIPiT0YmFKm5NBTwrRN58KB2XBNt4xiFiOGK
         JJXYD/9bl++UCDipKr3rP7TgjPdAz7T13PmbGNPBQ9txXZjTlpC/qP7adxwlKU5HGy0Z
         XdDHZ76i75KVDeV/Yslm4Qchx7iKxPDaHVOJdSxv5X89q0wJUOesuUvxYF3biZ4Rz8jH
         aLDD0nCcGsCRqoxWsoivDRWKJsmX03s+dau4X4cam4pfxqOuhtajFr2lWZWxjxUbt+Sm
         ujBw==
X-Gm-Message-State: ANoB5pl7N8Xcwu+SXT+P1rZ3oFQ2kqvLvjD51c0hMeMWyBHuq55kMLJF
        T3zIdxbtSEEwXL+xA3kEKEICrflKSqPZPZz5A2Y=
X-Google-Smtp-Source: AA0mqf6ud1fqZro323jiTV4bc9uqJBBYPY3DKldBZiC3nP9GM9uf2gI6UjydTPhNTCVuZ/fr/lI5kPYQFRIwOdF8DzQ=
X-Received: by 2002:a05:622a:4d43:b0:3a5:7848:4b4 with SMTP id
 fe3-20020a05622a4d4300b003a5784804b4mr74985309qtb.176.1670159817371; Sun, 04
 Dec 2022 05:16:57 -0800 (PST)
MIME-Version: 1.0
References: <20221126010531.466046-1-pevik@seznam.cz>
In-Reply-To: <20221126010531.466046-1-pevik@seznam.cz>
From:   Petr Vorel <petr.vorel@gmail.com>
Date:   Sun, 4 Dec 2022 14:16:44 +0100
Message-ID: <CAB1t1CzmNK8i0qT43qVw7VGUPVi67Up6QU-kYDoEsrV7=N7u7w@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8992-lg-bullhead: Disable cont_splash_mem
To:     Petr Vorel <pevik@seznam.cz>,
        Dominik Kobinski <dominikkobinski314@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Bart Ribbers <bribbers@disroot.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
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

Hi all,


I got reply from Dominik that he noticed dfps_data_mem (reserved in
msm8994.dtsi) overlaps with the framebuffer region.
I'll retest it next week, maybe removing it instead of cont_splash_mem
fixes the reboot.

He also noticed, that Linux doesn't reboot when loaded from uefi (his
project [1]).
Not sure if there is any difference.

Kind regards,
Petr

[1] https://github.com/Dominduchami/Nexus5XPkg/
