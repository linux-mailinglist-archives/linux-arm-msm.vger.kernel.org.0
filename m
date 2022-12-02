Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7458640283
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 09:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbiLBIwc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 03:52:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232277AbiLBIwb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 03:52:31 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7244AB0B42
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 00:52:30 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id n1so4683106ljg.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 00:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rcrfr/KIP3GiYfrGSo+24MXkOfC+iasgrJsLAcocvzQ=;
        b=i5OqY3PTjzIvyDGOjsmGRRGDibeXM5Jr9oD+C/wisU/z4jiYUb9zkzS11/rzcW8z5a
         bMbQ/SDmv4zKjmh4IuMY94ENWtR9AbGf2TAKYbmuDnq2jrqDfIrp+Ysfy6hysxrwb5cz
         wXIP1RfxIBN6GxfX04ibfRMyV840dBgrvbyq6ExwpDPV7K/IluO91B9UcQJwREnq9OT2
         vxGvkC2mTxTyy7R0qm7ROQeCg+BhLL8/2zKqpllS5MXYTv6sN1iQFttNUzO3w1DB72cu
         XtkdUAviGYPt+zfWIsdIfAkVJPZ+375NtFT1JX3L/iqF8sYnmILsZdnAyT6jllHKojvM
         sT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcrfr/KIP3GiYfrGSo+24MXkOfC+iasgrJsLAcocvzQ=;
        b=NLxnPaZDP7+yNfzFO/9OplrOeULb3WOExynkN+K6i2KuDQUFfUJdP7YOW0qIn/ctC2
         XSw4Inu4prmxwNTZkDmrS1V9iMMK2LSA70at6uwA+rp93I32DQCU7GqQXcJhNHplUBxC
         6nqRkSmIVsH17CRKpPfQW1wtsrR2qq9SzBJsNu9MOreTiMcTgbs6oL6VJWAhZ70HejMr
         Z6fH4JmEOSBBWQtIvay/insDB8IvRAJgVneLafr2FlijB9lSzgrWmRnH1JZA+BkRacnE
         7eanptq75h/gIWDw07WkUXLe4v4hBqCAhoTpMXBsh70pOtl3K1ijuV1iNnVJIuMMBBSG
         zm2w==
X-Gm-Message-State: ANoB5pmj7Y7b5z/nMbrX+x6ln88wOIyFdx3VXIEjSZunhQNqaqloJ/hb
        QqU7mW7vrAYUIicNuvc5uouSXcXlxyeEMLKCHxD88e8OdJpfaw==
X-Google-Smtp-Source: AA0mqf5e8WryiT3k/G3We1AJee/HlRiztJv7d12xbukkl7ZoUWndTgNEcn5YR5KwOXs7YMB+9xrc064Qx5eP2ldPLwQ=
X-Received: by 2002:a17:906:2594:b0:7c0:8d06:33f8 with SMTP id
 m20-20020a170906259400b007c08d0633f8mr12894948ejb.150.1669964897499; Thu, 01
 Dec 2022 23:08:17 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7208:5384:b0:5e:a6f0:f6f2 with HTTP; Thu, 1 Dec 2022
 23:08:16 -0800 (PST)
From:   Crypto Kirby Trading <ivanperoviccc@gmail.com>
Date:   Thu, 1 Dec 2022 23:08:16 -0800
Message-ID: <CAGarJC-cw2=aXca9WLbFx=cAtww=OqTiK+TtDyO6m_J6do1k_g@mail.gmail.com>
Subject: SAFUUX - THE FUTURE OF SAFUU IS HERE! BLOCKCHAIN LITEPAPER
To:     linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=3.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SHORT_SHORTNER,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        UPPERCASE_75_100 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

=F0=9F=92=A5SAFUU=F0=9F=92=A5 WILL HAVE A HUGE AMOUNT OF MOMENTUM WHEN IT C=
OMES OUT=E2=9C=85
CRYPTO LAYER 2 WITH GREAT POTENTIAL=E2=9C=85  - ARBITRUM EVENT CRYPTO WORLD
CLASS 2022 .VIDEO INSTRUCTION ON OUR CHANNEL
https://youtu.be/qzuQovP4QUA
