Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F66259C9BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 22:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235742AbiHVUOO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 16:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235412AbiHVUOM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 16:14:12 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC8311A1D
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 13:14:11 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id w19so23466980ejc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 13:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=NcQ3vX1YjUpsOQRgUWmgxapa0uiEuU6f+lfCONgZ/IY=;
        b=i/eur7XtNYwa1twMdba92gOV4mGghw3I/Fu1ZM6jqkBohPR+IRAshk9mxip/TjM6Wf
         FYH/Xu2vwZlZ7X5pZk++eft/r6S8CBVEEBeXZDfwZWYBBLfbx7MPZ3egt+FfAepCKIxw
         yAnytPn9TD7uroDJX27hR3xPvb5a6aE2FXzRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=NcQ3vX1YjUpsOQRgUWmgxapa0uiEuU6f+lfCONgZ/IY=;
        b=PKVOu6iVulyaNJVTfGt4xmv9QaKg4kqEG3Rt+7vjgWplTul+1i8UhnEMfuwwsRF5gA
         +Pm/qwd5OGRs0/CQhpprUDfeO9YpJ2qtKclMhcCxQWLJOxV32csCaVcTREQQmqrLndHj
         7G4xZhihTI+fbmghAt/l0hs4Qthhb4z+oUMt72/u49Xyl6eGmMVa8t+hgDidZmOsqQZE
         UwG0Ggxm6ux1lrHeZNRDyGTs1ywwAKHW+xGuj8tLG0ORJQL0fvoZJojdmaM7m2vCC3qR
         otZ+4leVVnSlvUpXn3dZXbE4J4lwGYhW5yUkzCeypbEhE7rsWf6curQm7iJV6w3p6rSw
         Sv5w==
X-Gm-Message-State: ACgBeo3ZPtLgrsJTuoIfJyJUsWvMu0Ubde63ZdCW01HqDCBuPF7ffYnS
        FQ4lR8LdGte3Q3oL04p2arPtA6o+jH1MLlJDlLA=
X-Google-Smtp-Source: AA6agR4rg16bAO/MZKN4Gn1u6I4hl8k8QHLLT0HrU6pxMSVqQGtfzua3NrVLBOycAHcroHh1KiuXcQ==
X-Received: by 2002:a17:906:65c6:b0:73c:8897:65b0 with SMTP id z6-20020a17090665c600b0073c889765b0mr11794953ejn.322.1661199250228;
        Mon, 22 Aug 2022 13:14:10 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id w5-20020aa7cb45000000b00445b822005dsm248255edt.6.2022.08.22.13.14.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 13:14:09 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id e20so14072090wri.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 13:14:09 -0700 (PDT)
X-Received: by 2002:a05:6000:1541:b0:222:cf65:18d7 with SMTP id
 1-20020a056000154100b00222cf6518d7mr11483631wry.659.1661199249451; Mon, 22
 Aug 2022 13:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220726102024.1.Icc838fe7bf0ef54a014ab2fee8af311654f5342a@changeid>
 <20220822193153.zn2oxljmd76awqot@halaneylaptop>
In-Reply-To: <20220822193153.zn2oxljmd76awqot@halaneylaptop>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 22 Aug 2022 13:13:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V_V-M1fJmeWH_=wG4GB9GERL9ToAZTwAjX9i-6k6QkWA@mail.gmail.com>
Message-ID: <CAD=FV=V_V-M1fJmeWH_=wG4GB9GERL9ToAZTwAjX9i-6k6QkWA@mail.gmail.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Implement get_optimum_mode(), not set_load()
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Aug 22, 2022 at 12:32 PM Andrew Halaney <ahalaney@redhat.com> wrote:
>
> Hey Douglas,
>
> On Tue, Jul 26, 2022 at 10:20:29AM -0700, Douglas Anderson wrote:
> > Since we don't actually pass the load to the firmware, switch to using
> > get_optimum_mode() instead of open-coding it.
> >
> > This is intended to have no effect other than cleanup.
>
> I hate to post something without looking into it very deeply, but with
> this statement about no effect I figured I'd report what I'm noticing
> before diving deeper.
>
> I'm currently playing with the dts patches in [0], and without this
> patch (and a hack patch applied that is unrelated to this) the board boots
> fine. With this patch applied I get the messages reported in [1] (which I
> think is still a clean up that should be applied) and the board fails to
> boot due to regulator_enable() failing at the first invocation I see.
>
> Is that something you expect?
>
> Here's the ultimate failure message for regulator_enable():
>
>     [    1.213419] ufshcd-qcom 1d84000.ufs: Adding to iommu group 0
>     [    1.219492] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to find vdd-hba-supply regulator, assuming enabled
>     [    1.230287] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to find vccq2-supply regulator, assuming enabled
>     [    1.241079] vreg_l17c: invalid input voltage found
>     [    1.246002] ufshcd-qcom 1d84000.ufs: ufshcd_enable_vreg: vcc enable failed, err=-22
>     [    1.253952] ufshcd-qcom 1d84000.ufs: Initialization failed
>     [    1.259622] ufshcd-qcom 1d84000.ufs: ufshcd_pltfrm_init() failed -22
>     [    1.266151] ufshcd-qcom: probe of 1d84000.ufs failed with error -22
>
> [0] https://lore.kernel.org/all/20220722143711.17563-1-quic_ppareek@quicinc.com/
> [1] https://lore.kernel.org/all/166118500944.215002.10320899094541954077.b4-ty@kernel.org/

Ah, I see what's happening.

When we were using set_load() all the regulator core did was call into
RPMH and tell it the load.

...but with the get_optimum_mode() the regulator core needs to also
pass the input and output voltages to RPMH as part of the API call
(even though RPMH ignores them). That means that if the input voltages
or output voltages are not known then it will error out before it even
calls to RPMH. This all might be made worse by the fact that RPMH
regulators boot up not knowing what their voltage is (see
"vreg->voltage_selector = -ENOTRECOVERABLE" in
rpmh_regulator_init_vreg()).

Ah, I guess it's failing to get the "input" voltage though. I guess
officially you could fix that by specifying the input supplies? I know
we never bothered doing that on any trogdor devices, though. If I
remember correctly all of the magic init that the firmware does for
RPMH already magically makes the input supplies get enabled / voltage
tuned properly so we decided that wasn't a benefit to modeling them in
Linux...

...hmmm, so I tried to figure out why I didn't see a failure and I
realized that in trogdor we never actually set
`regulator-allow-set-load` so basically we're not running this code at
all, so when I boot tested it on my hardware it wasn't terribly
useful. :(

I guess at this point I'll wait for Mark to give his suggestion for
what to do. Options I'm aware of:

a) ${SUBJECT} patch was written as a cleanup as per Mark's request and
we could just revert it.

b) We could make it so that failures to get the input/output voltages
doesn't count as an error when going through the get_optimum_mode()
path.


-Doug
