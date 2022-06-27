Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD6A355C68A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 14:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236832AbiF0PPa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 11:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235020AbiF0PP3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 11:15:29 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF4A9186C4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 08:15:28 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id 2so235639qvc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 08:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mzJBc6lpxrhRFAK19Ed32rRqhbZNObvqIUjXDfqFSfg=;
        b=m67baQfFZVYozVrPpK7ebfiOEWopTNMUi5ny7mGhXcwG8FGpcUPLYZqxyJV2qyNgpt
         V3DN2DoadHlkkqlczAi/yJVFj8AlRi0aG0bWtztLQ2NnSdWjMD9MatduW+M/FluFke1W
         t4vfg2QsCjaMDRoxDdrbZudjjex22JBpDrtryJyZ/rY9nnG/JRt8Z5JtGoI0818mgajG
         8KyBReHKQOpw/75RNbwZqRctyg1qKnlZnJfSorQa3H7PJxOw4oz1XA/NOWej+M2mJqgr
         Rnbitb+kztu1tVv8RhcypNCwguzlroIwUk28vvQ88BCVnA8MVc1aFOX8obGV9BLYHV3a
         GsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mzJBc6lpxrhRFAK19Ed32rRqhbZNObvqIUjXDfqFSfg=;
        b=jTH4xmp1b9FFJnBEGKey0k3erTH2ahM3l5HrqsdZ8PtMMRW+HdkHFdJWTSPYLTMpUp
         3xRS/a/rUkFnst3JLAn8A9GAbX1HZPvhoqOKVNx/5MRFCuKDvMbu0Lygfvj+EvMfAkxJ
         w3kG9ea4Cg5Fwu0SaICUeyqmpsG9VpV0vPLPIOSEoRLjSODMxvp+VsJVKEuwLxPA8nnz
         AKh5NNfrYNJ0004mdmfTNz0dVXqms/qxcz4M6oRJoXWyn8736h14Fm1OCuDplAoT6drY
         lbjC0rGWbdNED00Ez4wv7iIizNYpS1widjch9HSKX+qXdnJZltQcQorrmuAGMMi9Dirf
         FX6g==
X-Gm-Message-State: AJIora/jcuLMDYF+fielaWj5w4zBW2eeKN4tvEoTuPal5hHN7Kf6HgCm
        rpDjUvMTxtTv+cztUpVUEE7vA6CLjW0KTASN0JO6xg==
X-Google-Smtp-Source: AGRyM1swbxw2oPkjvAcMatteIT7UIcJlIFRpeQlmjTn5jVhoaz05rgHTPHTNwKJZBB6alu02OkIAS6n68qLOaG1Hv+w=
X-Received: by 2002:a05:6214:2a83:b0:470:a898:e467 with SMTP id
 jr3-20020a0562142a8300b00470a898e467mr8896772qvb.122.1656342927912; Mon, 27
 Jun 2022 08:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220501202025.211567-1-konrad.dybcio@somainline.org> <20220501202025.211567-2-konrad.dybcio@somainline.org>
In-Reply-To: <20220501202025.211567-2-konrad.dybcio@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 27 Jun 2022 18:15:15 +0300
Message-ID: <CAA8EJpqM5i88UKSrQyG1pMM6NQb8naTri-jNt++q7oKB-zdGAg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] thermal: qcom: tsens-v1: Add support for MSM8992/4 TSENS
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 1 May 2022 at 23:21, Konrad Dybcio <konrad.dybcio@somainline.org> wrote:
>
> MSM8994, despite being heavily based on MSM8974, uses the
> 1.2 version of TSENS. Also, 8994 being 8994, it has a custom
> way of calculating the slope.
>
> MSM8992 in turn is a cut-down version of MSM8994 and uses
> the same TSENS hardware, albeit with a different set of sensors.
>
> Also tested on 8976 (by a person who didn't want to be named)
> to make sure the 11->16 max_sensors changes didn't break anything.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v2:
>
> - don't use slope before it's initialized (whoops!)
> - don't re-assign the same value to p[0..15]
> - free calib_rsel
> - use the same ops for 8992 and 8994
>
>  drivers/thermal/qcom/tsens-v1.c | 293 ++++++++++++++++++++++++++++++--
>  drivers/thermal/qcom/tsens.c    |   6 +
>  drivers/thermal/qcom/tsens.h    |   2 +-
>  3 files changed, 288 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
> index 573e261ccca7..58864962f370 100644
> --- a/drivers/thermal/qcom/tsens-v1.c
> +++ b/drivers/thermal/qcom/tsens-v1.c
> @@ -142,6 +142,99 @@
>  #define CAL_SEL_MASK   7
>  #define CAL_SEL_SHIFT  0
>
> +/* eeprom layout data for 8994 */
> +#define MSM8994_BASE0_MASK     0x3ff
> +#define MSM8994_BASE1_MASK     0xffc00
> +#define MSM8994_BASE0_SHIFT    0
> +#define MSM8994_BASE1_SHIFT    10

Generally I feel that all the _MASK values can be better generated
using the GENMASK and newly defined _SHIFT value.

> +
> +#define MSM8994_S0_MASK        0xf00000
> +#define MSM8994_S1_MASK        0xf000000
> +#define MSM8994_S2_MASK        0xf0000000
> +#define MSM8994_S3_MASK        0xf
> +#define MSM8994_S4_MASK        0xf0
> +#define MSM8994_S5_MASK        0xf00
> +#define MSM8994_S6_MASK        0xf000
> +#define MSM8994_S7_MASK        0xf0000
> +#define MSM8994_S8_MASK        0xf00000
> +#define MSM8994_S9_MASK        0xf000000
> +#define MSM8994_S10_MASK       0xf0000000
> +#define MSM8994_S11_MASK       0xf
> +#define MSM8994_S12_MASK       0xf0
> +#define MSM8994_S13_MASK       0xf00
> +#define MSM8994_S14_MASK       0xf000
> +#define MSM8994_S15_MASK       0xf0000
> +
> +#define MSM8994_S0_SHIFT       20
> +#define MSM8994_S1_SHIFT       24
> +#define MSM8994_S2_SHIFT       28
> +#define MSM8994_S3_SHIFT       0
> +#define MSM8994_S4_SHIFT       4
> +#define MSM8994_S5_SHIFT       8
> +#define MSM8994_S6_SHIFT       12
> +#define MSM8994_S7_SHIFT       16
> +#define MSM8994_S8_SHIFT       20
> +#define MSM8994_S9_SHIFT       24
> +#define MSM8994_S10_SHIFT      28
> +#define MSM8994_S11_SHIFT      0
> +#define MSM8994_S12_SHIFT      4
> +#define MSM8994_S13_SHIFT      8
> +#define MSM8994_S14_SHIFT      12
> +#define MSM8994_S15_SHIFT      16

[skipped the rest]

-- 
With best wishes
Dmitry
