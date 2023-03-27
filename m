Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1267F6CA7A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 16:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbjC0O3K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 10:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232965AbjC0O24 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 10:28:56 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AD80729B
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 07:28:09 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5419d4c340aso173336337b3.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 07:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679927288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X7oETiAbAfzUJ7HzqmqjYrIufs3V2fiHoFSbt1UIh4s=;
        b=LMhiL9Jf9E+cVjvFhCUgHOKVr4umgl4MyEOkMWil6ek4otCgMmULsS+j1Ql3oN98O5
         AO3FLsIzrbR/7IA4I+xL4Rz+E4mdnwh/I92ecqoRgIHTViTLeHsYsSyMrSsxGAur1S3G
         Jl5b+WfdFUSRM0I3ViEjgRlKG7XjVx6HHaOUcPWm70NHx6dkJ8gfnoEuxenyK9LP2oik
         6e7mIXw0+u+UAbb6Bc0RWKsVGBVdu7ZIqdIgMbfPmZN1+Vij0nuN7EhFG4+hkc5CJoJ1
         xx/ctIiu+Tcl70Sw8l5VJZPNbsbphL9ON/VJuaEAMm5x6BJp7kEb3cGTA0ziRifu/FgX
         Q0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679927288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7oETiAbAfzUJ7HzqmqjYrIufs3V2fiHoFSbt1UIh4s=;
        b=vQVQJbabnoiErfcHr44DNBzl02FxWo/VVHqqvpKVj6wk5jkr4sY7vJKFXgcTcxKkWu
         3+UJEhoGMtgI15a5ERUNCNibvDIDRJcFx+lzRMQnF9ST+I32z71U3BfuDsn3f+nwEg8q
         c19s099VxkweXRLSCCtp75dQiTkif7WWJ+CTIAPTjkNfvctVEzOAtWFdTrBStENnBknB
         OQhiT8osit/SzCKsumoLrSPzM6wSDhxWBHgS10wUqJQfR8EHuqYQUthgdcsci0ppUgc1
         QZ6wfBAAZ+V/pYpaf8dRFu5ajOOK74IIDX3C39xhN5eaIcCiAxsOqUo5sZIGKjw3wNal
         ktoQ==
X-Gm-Message-State: AAQBX9drmyJFDhnPDwU7Rtyjss5+1rMM+mfEgbPa6S9lmxEHmS/GGyLY
        q2IQgiQMe3VqAonfHBzYJFJ/5zLkts1JGT8R1TNltV/tbkGEOPgAGWI6xPlr
X-Google-Smtp-Source: AKy350ZKD/fgBcAqFDqiMdxfNo8Nyf0RE9CUuUo/C58z5D16bKlfHDfNsdW0R00eimXjynMkd8Keq9JqY8R8ZFQfgRc=
X-Received: by 2002:a81:b50f:0:b0:544:b8d8:339e with SMTP id
 t15-20020a81b50f000000b00544b8d8339emr5534658ywh.5.1679927288387; Mon, 27 Mar
 2023 07:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230327140752.163009-1-krzysztof.kozlowski@linaro.org> <20230327140752.163009-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327140752.163009-3-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 27 Mar 2023 17:27:57 +0300
Message-ID: <CAA8EJpoOjHpwwamdxBg+nf_Xf3m2q8vt9keM1atd821_iC6V3g@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] mailbox: qcom-apcs-ipc: do not grow the of_device_id
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 27 Mar 2023 at 17:17, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Re-organize the compatible devices and add a comment to avoid unneeded
> of_device_id growth with every new SoC.  These devices have quite a lot
> of similarities and they can use only one compatible fallback for driver
> binding.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
