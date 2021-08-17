Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B223EF056
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Aug 2021 18:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbhHQQn5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Aug 2021 12:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbhHQQn4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Aug 2021 12:43:56 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9240FC061764;
        Tue, 17 Aug 2021 09:43:23 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id n24so10520331ion.10;
        Tue, 17 Aug 2021 09:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IuG/Nyy1AleYAAiC355G22Pgq/wRJ8d208hbkCZpDvc=;
        b=Qek+7TVaVrYAJoiDwC7Lw3CWuWndq+4rvExDCpbOVfH6uBMFGcQDnYHXeoHBqxcnXQ
         D59nZ0gLjMVRt8WsCD2NylROiCsk+Kp/F88pCajBeYksJHttqJAanCQ4jhm9bc9oSJBe
         ziMa/q4nk9B8hG4DD4Olt6O98143JdZjXYAJ0CJEJHpwwKgebz84akz7e8oQFyye+nn1
         cwxmV7SUiXhgDqhnNxA+7aGgAaAbx9oPLTRmQ7h6vUAr/QJfdaOJ2BwdmayqdYkdmQjU
         /uLtEegmBGSXH4BY+XCevjbhG7HF4PdtyMUEC0iQ3tzy+DKJyiluC1JopsdF+BHp1P1K
         NV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IuG/Nyy1AleYAAiC355G22Pgq/wRJ8d208hbkCZpDvc=;
        b=r+CWwoFJaRFRcjRC8kPq4y1QIR6VM3+Jr+VweSdlybtrjeiUToyqc44lKeATWVYnr0
         VpCmlxnS7hpXWYs2vJYyADMHKervF3qlEeidmBuC2zZPjIs609evQLeDgv38AyA2cvpi
         HmIofB8qCl9+C1/5Nto4mV+tbB8F8w0P4wcQJIRPHaXWP7tAm94wMAwGtf+163bnnxWh
         3g1sE4ZC0h40USl3t5CAQw9Ylu+ak6P09fHkagghMiHZ5gTCC7UJfcTadboj2V/Fhpnn
         B4Tmcab4EDHwDuNxq+nvKQP+RRK//clqB7QA7+tFHx9dLsaIoXOEHRIih/SAHFpijINi
         ZRUw==
X-Gm-Message-State: AOAM533fOCE3YoVGHiQpfbItue1uVKeb/I3bNgoE0Oq5uc+EJ7fi40Cv
        xGnffFfnQquHtekFlAvMxpFf0TdkzXJN7DsWFfk=
X-Google-Smtp-Source: ABdhPJzQQRmCUq3Wdvr9MNFIHp7qIrTvHDwImWQGqK5968WjJf0KlcRwpnB4V9wwjmHZWiD/zb1mRreidkPCgYAs3ww=
X-Received: by 2002:a05:6602:2c10:: with SMTP id w16mr3559018iov.149.1629218603053;
 Tue, 17 Aug 2021 09:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <1629163412-157074-1-git-send-email-amartora@codeaurora.org>
In-Reply-To: <1629163412-157074-1-git-send-email-amartora@codeaurora.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 17 Aug 2021 18:43:12 +0200
Message-ID: <CANiq72ke+eoSvycmq3LFdo9n+uLqvb_t4109N+R=uY+XN-i7Kg@mail.gmail.com>
Subject: Re: [RFC] soc: qcom: socinfo.rs: Add Rust Socinfo Driver implementation
To:     Antonio Martorana <amartora@codeaurora.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Trilok Soni <tsoni@codeaurora.org>,
        Elliot Berman <quic_eberman@quicinc.com>, agross@kernel.org,
        bjorn.andersson@linaro.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Antonio,

Thanks a lot for giving Rust in the kernel a try!

Cc'ing the socinfo maintainers.

A few comments inline. In general, you should seek to avoid `unsafe`
in the Rust module as much as possible by providing safe abstractions
inside the `kernel` crate instead, which are the ones dealing with the
C-Rust interface / bindings.

On Tue, Aug 17, 2021 at 3:24 AM Antonio Martorana
<amartora@codeaurora.org> wrote:
>
> +       depends on HAS_RUST && QCOM_SMEM

This should be `RUST`, not `HAS_RUST` (the former is whether it is
actually enabled, the latter whether the toolchain was found).

> @@ -0,0 +1,464 @@

The SPDX identifier is missing at the top.

> +#![feature(allocator_api,global_asm)]

Please format the code (you can use `make rustfmt` or manually call
the `rustfmt` tool yourself).

Also, please pass the linter too if you did not do it (`CLIPPY=1`).

> +module! {
> +    type: SocInfoDriver,
> +    name: b"socinfo_rust",
> +    author: b"Antonio Martorana",
> +    description: b"QCOM socinfo rust implementation",
> +    license: b"GPL v2",
> +}

This is a proof of concept, so it is OK, but I am not sure if we
should say "rust" in the description for actual non-proof-of-concept
modules. My guess is that most maintainers will only want to
maintainer a single module, whether in C or Rust.

> +/*
> + * SMEM item id, used to acquire handles to respective
> + * SMEM region.
> + */
> +const SMEM_HW_SW_BUILD_ID: u32 = 137;

In general, we do not use `/*`-style comments. In addition, this
should be a documentation comment, i.e. `///`.

Same for other places.

> +/* C code has #ifdef */
> +const SMEM_IMAGE_VERSION_BLOCKS_COUNT: usize = 32;
> +const SMEM_IMAGE_VERSION_SIZE: usize = 4096;
> +const SMEM_IMAGE_VERSION_NAME_SIZE: usize = 75;
> +const SMEM_IMAGE_VERSION_VARIANT_SIZE: usize = 20;
> +const SMEM_IMAGE_VERSION_OEM_SIZE: usize = 32;

We have support for conditional compilation based on the kernel
configuration via e.g. an attribute like `#[cfg(CONFIG_X)]`.

Ideally you can put this inside a module, which would allow you to
have a single condition compilation avoid having to repeat the
attribute, as well as avoiding repeated prefixes like
`SMEM_IMAGE_VERSION`.

> +/*
> + * SMEM Image table indices
> + */
> +const SMEM_IMAGE_TABLE_BOOT_INDEX: u32 = 0;
> +const SMEM_IMAGE_TABLE_TZ_INDEX: u32 = 1;
> +const SMEM_IMAGE_TABLE_RPM_INDEX: u32 = 3;
> +const SMEM_IMAGE_TABLE_APPS_INDEX: u32 = 10;
> +const SMEM_IMAGE_TABLE_MPSS_INDEX: u32 = 11;
> +const SMEM_IMAGE_TABLE_ADSP_INDEX: u32 = 12;
> +const SMEM_IMAGE_TABLE_CNSS_INDEX: u32 = 13;
> +const SMEM_IMAGE_TABLE_VIDEO_INDEX: u32 = 14;
> +const SMEM_IMAGE_VERSION_TABLE: u32 = 496;

Same here -- this could be a `mod` and a doc comment on it.

> +struct SocInfo{
> +    fmt: bindings::__le32,

Rust modules should not access `bindings` in general -- abstractions
should be provided in `rust/`.

Also, `__le32` is for `sparse` -- to do something similar, we could
use a wrapper type that encodes the endianness.

> +    unsafe {let ref_mut_seq_priv = seq_private.as_mut().unwrap(); }

Unsafe blocks must have a `SAFETY: ` annotation, justifying all the
requirements of `as_mut()` (alignment, no aliasing, etc.).

They should also be as small as possible (to clearly indicate the part
that is unsafe), without using a single block for several unsafe
operations.

> +    if model < 0{
> +        return -22; //EINVAL
> +    }

We have the constants available. Also, the function should return a
`Result`, not a naked integer.

> +        unsafe{ bindings::seq_printf(seq as *mut bindings::seq_file,format,PMIC_MODELS[model as usize])};

`seq_printf` should likely be a macro like `pr_info!` etc. that we have.

> +/*
> +fn qcom_show_pmic_model_array(seq: &mut bindings::seq_file, p: &mut c_types::c_void) -> u32{
> +
> +}
> +
> +fn qcom_show_pmic_die_revision(seq: &mut bindings::seq_file, p: &mut c_types::c_void) -> u32{
> +
> +}
> +
> +fn qcom_show_chip_id(seq: &mut bindings::seq_file, p: &mut c_types::c_void) -> u32{
> +
> +}
> +
> +*/

Commented out code (also in other places).

Cheers,
Miguel
