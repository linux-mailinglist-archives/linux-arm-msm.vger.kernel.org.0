Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 443D767DD32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 06:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjA0FnJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 00:43:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjA0FnI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 00:43:08 -0500
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C004193D8
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 21:43:07 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-50112511ba7so53604517b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 21:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fqJbS1bFJa5utvCnTv+wYBXRWVr+UnUdQNczPlCi+3U=;
        b=TLdkMwBmkOpoMtKqXKSYzWj+S6KAXh59dODKmFzdRWBsvbUGbq5nfaABjBysst3wgK
         ObuQsZl4vSPe+p/0xNzLiHEuvZNWp3Le22Q9XWQAobiyTLi4GIu8D+4Xb1/hb8Szd+AV
         KlVROzaQ4/YeKAVaJLVqzlvIoqTLPzOgZZvKmvYCSkW9TJfMz9tTdSYvy/Npb9X932iQ
         R2xE6eeZHxB1uTC786OSNmmrm7gwbbHo3FZbHVy+MAVAjRXMHkapH/aX0umXMlewggcr
         gR/UobIuX7wiilvG5/WR6P3ztVaWWmVGku7Ev5ICsMMgw6aiocrJGVPRJcVjctT8V6WI
         WwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqJbS1bFJa5utvCnTv+wYBXRWVr+UnUdQNczPlCi+3U=;
        b=pad88+YOdvjMMih7XV5mPxmieKuAnTChVHLUe6Xz3+yvkDjTrSS7LmAz9Kb13JeTUX
         JLh+hDvlROrj3AVzlwMoswkTe9Nmz17zYVDShyzyF/L1vGl4hDW2XmaTP7xZAF3z9KdL
         wFOsM09p+56RCy8JIhlQpjF4koX4FfjOoEOw0OsUSM9lY2mFsntmL64BaDA6ThU0smTh
         rHf6vcwyjeMIBF1980wDwd9AyUeS20JRX/ruXUg3pE3YHLf48LbpOmCq28hEP9u0ffnJ
         XK6rkHNaZlbYJUbOsohlzghS0z4AimVO6Ir130qtgSwxTkrPo/N2uM2kmkbe82BLgfu3
         uRkw==
X-Gm-Message-State: AFqh2kpz2e7hvrHcDLqFNo3S2ihWl1+GPrQjDD1DIy3jQsz17Xb1O6EY
        w6JURZv9M0rQZY/I82qkdlxsg/oinsTv6YKqNEt+IQ==
X-Google-Smtp-Source: AMrXdXv8jXCaIMBzTzmvSJhUZCAILeJ1JQhpL6j3RKiZ3tge8MD4DQJuzQfpd1Jnud+SHRAU0UymE07hNfn68KwB2iM=
X-Received: by 2002:a81:3e0d:0:b0:4fe:1d13:5980 with SMTP id
 l13-20020a813e0d000000b004fe1d135980mr4580021ywa.378.1674798186717; Thu, 26
 Jan 2023 21:43:06 -0800 (PST)
MIME-Version: 1.0
References: <20230127041200.29094-1-quic_namajain@quicinc.com>
In-Reply-To: <20230127041200.29094-1-quic_namajain@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 27 Jan 2023 07:42:55 +0200
Message-ID: <CAA8EJpr96GppHmG86b2i3HhBV_OykpgV3h2MA=5ODYBwHVuDQw@mail.gmail.com>
Subject: Re: [PATCH v2] soc: qcom: socinfo: Add support for new field in
 revision 17
To:     Naman Jain <quic_namajain@quicinc.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkondeti@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 27 Jan 2023 at 06:12, Naman Jain <quic_namajain@quicinc.com> wrote:
>
> Add support for new field coming with socinfo structure under v17 to get
> hardware platform's oem variant id. This is to enable OEMs to have minor
> changes in the board, but to use the same platform subtype as the one
> supported by Qualcomm. The new field is to be used in platform overlay
> file. Default value is 0, reserved for Qualcomm platforms. Also, add
> debugfs support to read this field for a device.
>
> Signed-off-by: Naman Jain <quic_namajain@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> v1 -> v2: Removed change-id, included SOB line
>
>  drivers/soc/qcom/socinfo.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 10efdbcfdf05..10cdd32ce74d 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -174,6 +174,8 @@ struct socinfo {
>         __le32  pcode;
>         __le32  npartnamemap_offset;
>         __le32  nnum_partname_mapping;
> +       /* Version 17 */
> +       __le32 oem_variant;
>  };
>
>  #ifdef CONFIG_DEBUG_FS
> @@ -196,6 +198,7 @@ struct socinfo_params {
>         u32 nmodem_supported;
>         u32 feature_code;
>         u32 pcode;
> +       u32 oem_variant;
>  };
>
>  struct smem_image_version {
> @@ -519,6 +522,11 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>                            &qcom_socinfo->info.fmt);
>
>         switch (qcom_socinfo->info.fmt) {
> +       case SOCINFO_VERSION(0, 17):
> +               qcom_socinfo->info.oem_variant = __le32_to_cpu(info->oem_variant);
> +               debugfs_create_u32("oem_variant", 0444, qcom_socinfo->dbg_root,
> +                                  &qcom_socinfo->info.oem_variant);
> +               fallthrough;
>         case SOCINFO_VERSION(0, 16):
>                 qcom_socinfo->info.feature_code = __le32_to_cpu(info->feature_code);
>                 qcom_socinfo->info.pcode = __le32_to_cpu(info->pcode);
> --
> 2.17.1
>


-- 
With best wishes
Dmitry
