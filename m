Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 832ED6329C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 17:39:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbiKUQja (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 11:39:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbiKUQj3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 11:39:29 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 612C8FFF
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 08:39:28 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id c7so8979475iof.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 08:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dE7kPnKhfd0itHP4HNTeLNi8/xUnwT2X5NbZWt65LF4=;
        b=oX47rmq07gA887+bDxsM54hg5i1NxG6EIqIA004JJihcEzG4qBc43iXYpr9FFaBG52
         MQy9c/35mqLGMjjnmfSsJrrdB/0eE1zLY7IFVhpaw5Fri37G4IrWCdkuzSFnwSiJ397N
         7TO86OPaVLEuUrRBdb/7P/r2VdaSfFyVpR9QY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dE7kPnKhfd0itHP4HNTeLNi8/xUnwT2X5NbZWt65LF4=;
        b=p/R+5PHlC0SFmnAQ3fPdA8aMCOACLXlxX+RRv4u7uqRXK3KQxPJWTY8x8pmLovRBKC
         37b+OzC2x57B+g1RxxXTmKXGJ451vHIevE3elX3DZeBkZVNF9wcCDSHUT0trNgXJ7wrn
         anC38twzLf9Xf10liADL96R8qAv245+Sa2XPfUfDkx/sAS9FN22EN5VCmfHGBuIPSfSP
         cMAvWgThD/LpYvqLuTS8nG1MndJQBQ11AO0TtEAy55kiCmltSQfpzMngdlYEwIZ9bcEX
         5krQopgqxVfaAnzz4MHKu9i2veb070od2Vxmjvt3kZ1hzyxFfsmUXraHDp5V2GbSf/Yb
         1zyQ==
X-Gm-Message-State: ANoB5pljNIrQY6Mq+tEqyd0CW5NZjKB3tdqiS2pi1AWtei6kLVkXfxyQ
        DoHXm/JnV/BUl3gdbmLFSoWOrw==
X-Google-Smtp-Source: AA0mqf4WCRaZA4lkpa1AVLfaY5hgI2Vne9hf4BcOm+gLWUvcduxR8VjpHgp7Un6qQ8TxqGnWJ0PulQ==
X-Received: by 2002:a02:9666:0:b0:363:b82d:d51e with SMTP id c93-20020a029666000000b00363b82dd51emr8928069jai.15.1669048767786;
        Mon, 21 Nov 2022 08:39:27 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id t20-20020a02b194000000b0036cc14af7adsm4430766jah.149.2022.11.21.08.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 08:39:27 -0800 (PST)
Date:   Mon, 21 Nov 2022 16:39:27 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <quic_rjendra@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sc7280: Add a herobrine CRD Pro
 SKU
Message-ID: <Y3upv3kACHXycKGs@google.com>
References: <20221121043437.21925-1-quic_rjendra@quicinc.com>
 <20221121043437.21925-2-quic_rjendra@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221121043437.21925-2-quic_rjendra@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 21, 2022 at 10:04:37AM +0530, Rajendra Nayak wrote:
> Some of the qualcomm qcard based herobrine devices can come with
> a Pro variant of the chipset on the qcard.

nit: remove line break, the next sentence clearly refers to the one
above

> Such Pro qcards have the smps9 from pm8350c ganged up with smps7 and
> smps8, so Add a .dtsi for pro skus that deletes the

nit: s/so Add/so add/

nit: use +/- consistent line length

> smps9 node and include it from the new dts for the CRD Pro
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
