Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D964A7C88AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Oct 2023 17:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232331AbjJMPa0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Oct 2023 11:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232326AbjJMPaZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Oct 2023 11:30:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB89B7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 08:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697210979;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=K9wOZvoG+wLE3OGwE9vx9T+d59khcR5Z5+TQzAOJpGw=;
        b=SBuUhKHTdBW88jCCEWclIVyxOepEJdNkPNV3CzwS6Gq0/qBSWcwVXc/irjZGsYk96rwiMr
        7TEIJLAbdp/dJFtpoyQuitCq2zbnZFqyALfMvTwTqkO6aeSiIueyf+gf++D3roEnRQO+ix
        nJcsiOddaQHYdZyEB2nVzlzQJr8Togg=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-dOqWKuFhO4uMi-ILKW3-og-1; Fri, 13 Oct 2023 11:29:32 -0400
X-MC-Unique: dOqWKuFhO4uMi-ILKW3-og-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6c22d8a0cecso3145562a34.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 08:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697210972; x=1697815772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9wOZvoG+wLE3OGwE9vx9T+d59khcR5Z5+TQzAOJpGw=;
        b=OeKX5gX/rKh2SqYrhtEmwi9RJW2Pldsz5n+AYFNQTZxLlR4s6U+xBdpT5kqGe79RKy
         V4ZKPV3BPZI5Q/SR3cx91SAvwCeQ+v/D+J94iT8mhvlIVYO9ZU79CTc8AS2MhrcALC2n
         VPi69tQBQ7FFIzKhqD8HBHAbDX937wqsmrdnZ9k8dRP3F3pCj2zJHsPiCVQsIfKa53MB
         Ac3IDjfn9+bGux15aMqSUhwcI4Z/gkuMxwWaDHqIwh7j4f9K7TEh2oy2NGsxzu/5vFag
         u4IgEUU7HBI8e+M9cle29R5SvXaUW6vFfoXv50hyvjxi7DWKVYYoKty6sfPIxRVLe/ot
         DzCw==
X-Gm-Message-State: AOJu0YzG8Lpci10OOSCXxcWxATy/J3+lV3tU+DXm8rv6n/m+GSDngIG1
        4S1wylxrGhLiJQDAuIrcFv/qUhHWIKbBAIzSm1PYSpIh6z3h3HhzWBN0AxDabJwRUv9uwB3gt0R
        L1imz3428pCIyfC6h4205YcRHug==
X-Received: by 2002:a9d:7487:0:b0:6c4:eea8:cf13 with SMTP id t7-20020a9d7487000000b006c4eea8cf13mr28303430otk.27.1697210971862;
        Fri, 13 Oct 2023 08:29:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYmnipLxElkjOtM1/Ed5rb1BbsoWl3JWFo4V1+6TO8CQygqQpdrvlz27k8VK2Qap1MHZ+Xyg==
X-Received: by 2002:a9d:7487:0:b0:6c4:eea8:cf13 with SMTP id t7-20020a9d7487000000b006c4eea8cf13mr28303412otk.27.1697210971595;
        Fri, 13 Oct 2023 08:29:31 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id u17-20020a056830119100b006c637fbaca7sm690237otq.53.2023.10.13.08.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:29:31 -0700 (PDT)
Date:   Fri, 13 Oct 2023 10:29:27 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 00/15] arm64: qcom: add and enable SHM Bridge support
Message-ID: <20231013152927.ckpbsnabuyq7t6qq@halaney-x13s>
References: <20231013114843.63205-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013114843.63205-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 13, 2023 at 01:48:28PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> This is pretty much another full rewrite of the SHM Bridge support
> series. After more on- and off-list discussions I think this time it
> will be close to the final thing though.
> 
> We've established the need for using separate pools for SCM and QSEECOM
> as well as the upcoming scminvoke driver.
> 
> It's also become clear that in order to be future-proof, the new
> allocator must be an abstraction layer of a higher level as the SHM
> Bridge will not be the only memory protection mechanism that we'll see
> upstream. Hence the rename to TrustZone Memory rather than SCM Memory
> allocator.
> 
> Also to that end: the new allocator is its own module now and provides a
> Kconfig choice menu for selecting the mode of operation (currently
> default and SHM Bridge).
> 
> Due to a high divergence from v2, I dropped all tags except for
> patch 1/15 which didn't change.
> 
> Tested on sm8550 and sa8775p with the Inline Crypto Engine and
> remoteproc.

I took this for a spin on my x13s with SHM bridge enabled and don't see
any issues in the usecases that exercises. Also running on a debug
kernel with no warnings, etc.

Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
> 
> v3 -> v4:
> - include linux/sizes.h for SZ_X macros
> - use dedicated RCU APIs to dereference radix tree slots
> - fix kerneldocs
> - fix the comment in patch 14/15: it's the hypervisor, not the TrustZone
>   that creates the SHM bridge
> 
> v2 -> v3:
> - restore pool management and use separate pools for different users
> - don't use the new allocator in qcom_scm_pas_init_image() as the
>   TrustZone will create an SHM bridge for us here
> - rewrite the entire series again for most part
> 
> v1 -> v2:
> - too many changes to list, it's a complete rewrite as explained above
> 
> Bartosz Golaszewski (15):
>   firmware: qcom: move Qualcomm code into its own directory
>   firmware: qcom: scm: add a missing forward declaration for struct
>     device
>   firmware: qcom: scm: remove unneeded 'extern' specifiers
>   firmware: qcom: add a dedicated TrustZone buffer allocator
>   firmware: qcom: scm: enable the TZ mem allocator
>   firmware: qcom: scm: smc: switch to using the SCM allocator
>   firmware: qcom: scm: make qcom_scm_assign_mem() use the TZ allocator
>   firmware: qcom: scm: make qcom_scm_ice_set_key() use the TZ allocator
>   firmware: qcom: scm: make qcom_scm_lmh_dcvsh() use the TZ allocator
>   firmware: qcom: scm: make qcom_scm_qseecom_app_get_id() use the TZ
>     allocator
>   firmware: qcom: qseecom: convert to using the TZ allocator
>   firmware: qcom: scm: add support for SHM bridge operations
>   firmware: qcom: tzmem: enable SHM Bridge support
>   firmware: qcom: scm: clarify the comment in qcom_scm_pas_init_image()
>   arm64: defconfig: enable SHM Bridge support for the TZ memory
>     allocator
> 
>  MAINTAINERS                                   |   4 +-
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/firmware/Kconfig                      |  48 +--
>  drivers/firmware/Makefile                     |   5 +-
>  drivers/firmware/qcom/Kconfig                 |  86 +++++
>  drivers/firmware/qcom/Makefile                |  10 +
>  drivers/firmware/{ => qcom}/qcom_qseecom.c    |   0
>  .../{ => qcom}/qcom_qseecom_uefisecapp.c      | 261 +++++--------
>  drivers/firmware/{ => qcom}/qcom_scm-legacy.c |   0
>  drivers/firmware/{ => qcom}/qcom_scm-smc.c    |  28 +-
>  drivers/firmware/{ => qcom}/qcom_scm.c        | 179 +++++----
>  drivers/firmware/{ => qcom}/qcom_scm.h        |  21 +-
>  drivers/firmware/qcom/qcom_tzmem.c            | 365 ++++++++++++++++++
>  drivers/firmware/qcom/qcom_tzmem.h            |  13 +
>  include/linux/firmware/qcom/qcom_qseecom.h    |   4 +-
>  include/linux/firmware/qcom/qcom_scm.h        |   6 +
>  include/linux/firmware/qcom/qcom_tzmem.h      |  28 ++
>  17 files changed, 746 insertions(+), 313 deletions(-)
>  create mode 100644 drivers/firmware/qcom/Kconfig
>  create mode 100644 drivers/firmware/qcom/Makefile
>  rename drivers/firmware/{ => qcom}/qcom_qseecom.c (100%)
>  rename drivers/firmware/{ => qcom}/qcom_qseecom_uefisecapp.c (84%)
>  rename drivers/firmware/{ => qcom}/qcom_scm-legacy.c (100%)
>  rename drivers/firmware/{ => qcom}/qcom_scm-smc.c (91%)
>  rename drivers/firmware/{ => qcom}/qcom_scm.c (93%)
>  rename drivers/firmware/{ => qcom}/qcom_scm.h (88%)
>  create mode 100644 drivers/firmware/qcom/qcom_tzmem.c
>  create mode 100644 drivers/firmware/qcom/qcom_tzmem.h
>  create mode 100644 include/linux/firmware/qcom/qcom_tzmem.h
> 
> -- 
> 2.39.2
> 

