Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 747F6604C71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 17:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbiJSP4C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 11:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbiJSPzk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 11:55:40 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA2CE32D9D
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 08:53:11 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id o22so10961881qkl.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 08:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wBHWHRYZIKVyYQXTQ0xEuNFskPCPX2MZMQbHpxS/OLw=;
        b=bnNIO5I0OlMiKJf5z2xhhpzl5PbYKjmyHD+j7K9oW4gfqXism/Cz6GnrsY51PozL4Z
         a+D6hzhEoVNQ0qcRjWqeZD49ar4VVKy2HXfELJm6MQii0dPfVJC27GvqZlQLwLWaVk4q
         e7+LAzkAO6A7EBvfNcSmRgNVWFU9AjFIuHPiZ+k8Tyvh8IlpBEG29+tb+fJ+vGXAGLEJ
         vC8AyDPwHtWrr6wPqPgeIM1qNB0fn6TLnIL4NC63SLJgc5vBEYEVe68UQXX3K1odCAvC
         ZZmCp/2wcic6I75xami/SRdUK5GpverRf0bsCKgJlHSbb3NqJNbo8JJ4CCZGM0rnO570
         8Udw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBHWHRYZIKVyYQXTQ0xEuNFskPCPX2MZMQbHpxS/OLw=;
        b=AMFhP8PH/mNO28puOpO7KhhtCcQxRw85/1U3zzgE0OgcO4IwbFQDZySNj723jpF0ZH
         BuWcrpChbjFYL1pQZtjNZPoswwiCVtM35lQoATWQZpVwHE0FP9V4lln8F+o/8eQOlbcb
         GX7HPCao3Hgf+eqzX6y9zJ0DbhlYuWK1LkeCzLv4o6gdWXfjwwDGP0pa3aCqRXUlRf7U
         8otpZr4eBoWBizvGC58VkUvrX+zbAIxmqZyCYyT1TAAc2BScDq7FI7DXYWvkBIKUylcR
         XeOHLKuUblT6bV8fF3H/7zIDbH1TwmR0Gut9nJGKWJ21z5wW2VGivCmgzlpVjOviaqgA
         scWw==
X-Gm-Message-State: ACrzQf2pNVf4Pfl9P3uanUOM2GUB870R/W3iR69eSwa8Ae5OrNt4pRsg
        3HCZqVM6ps0tB6mmGz/1tfbK6V2LyVBgNei9dqo=
X-Google-Smtp-Source: AMsMyM71zhSyKXPPYv4FP4cbpVvsaMgpEqOZFzRlIMCRpHEICbbxcqJL9DC3Jprnlg9lkpTJkxJr98zN+bmG+HxmUYA=
X-Received: by 2002:a37:bd47:0:b0:6e1:be21:e6e1 with SMTP id
 n68-20020a37bd47000000b006e1be21e6e1mr5888896qkf.473.1666194790468; Wed, 19
 Oct 2022 08:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhG-aoOBgTzirGu-1uqCFUJd+AnenMSkoUqnG3mhraCRfw@mail.gmail.com>
In-Reply-To: <CANHAJhG-aoOBgTzirGu-1uqCFUJd+AnenMSkoUqnG3mhraCRfw@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 19 Oct 2022 08:52:58 -0700
Message-ID: <CAF6AEGvvsx+6OSxOaqjoUO=J4tO_J5ZSidenx9EXdz34_myBqQ@mail.gmail.com>
Subject: Re: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
To:     Nathan Hebert <nhebert@chromium.org>
Cc:     linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org,
        quic_vgarodia@quicinc.com, Fritz Koenig <frkoenig@chromium.org>
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

Hmm, does venus not support the combined firmware yet?  Elsewhere
we've moved away from split fw to using a single ELF file..

BR,
-R

On Tue, Oct 18, 2022 at 2:18 PM Nathan Hebert <nhebert@chromium.org> wrote:
>
> The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:
>
>   cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/nathan-google/linux-firmware.git
> update_sc7180_and_sc7280_firmwares
>
> for you to fetch changes up to 76e160366a28010fa06ddc965659c38a44d159d9:
>
>   qcom: update venus firmware files for VPU-2.0 (2022-10-18 13:42:58 -0700)
>
> ----------------------------------------------------------------
> Nathan Hebert (2):
>       qcom: update venus firmware files for v5.4
>       qcom: update venus firmware files for VPU-2.0
>
>  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
>  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
>  qcom/venus-5.4/venus.b02 | Bin 873596 -> 875020 bytes
>  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33896 bytes
>  qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
>  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
>  qcom/vpu-2.0/venus.b00   | Bin 692 -> 692 bytes
>  qcom/vpu-2.0/venus.b01   | Bin 7376 -> 7376 bytes
>  qcom/vpu-2.0/venus.b02   | Bin 300 -> 300 bytes
>  qcom/vpu-2.0/venus.b04   | Bin 20 -> 20 bytes
>  qcom/vpu-2.0/venus.b09   | Bin 939184 -> 939472 bytes
>  qcom/vpu-2.0/venus.b10   | Bin 42976 -> 43120 bytes
>  qcom/vpu-2.0/venus.mbn   | Bin 2031188 -> 2031620 bytes
>  qcom/vpu-2.0/venus.mdt   | Bin 8068 -> 8068 bytes
>  14 files changed, 0 insertions(+), 0 deletions(-)
