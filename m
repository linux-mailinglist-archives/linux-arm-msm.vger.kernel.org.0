Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3DA69BBE2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Feb 2023 21:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbjBRUgV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Feb 2023 15:36:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjBRUgU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Feb 2023 15:36:20 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9929E14EB2
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Feb 2023 12:36:18 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-53684c05ff9so15644547b3.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Feb 2023 12:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zRZc0dQnGhvTqq+U+Af9pmr62Ej13myeHTMYLtCgPVE=;
        b=DJT3lVNgKXKJdIlID0MT7eModsNU48nrQc1fJd3ui4wzOYOQ1oKgsYoenhtkMtqBPk
         /8xVOdvuhyWg6J10mIqNFH7CD1CeOM3+cLBGhD4aEFX+4Xno+92xJAEu9x/qJSNGBHIf
         xgVdYW8ukUhle3Bky2UZqgT/VttGY9s3uMmNqMNdwNJKs/c1bpuOhUfbFgQmZ+uQ0zzD
         waP3UG9VT82DfpSF5lBstVL+T0Cz10/Y7raFTxjCazlkC6nsO/ChQdPzymEYjIsXHA4d
         E6iMj0fDjdKBf9/h0wyDxtiflwiN80gOpuYGJwTtw9ivNC6VcGF2/nSKn94wMAKW3EF9
         BJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRZc0dQnGhvTqq+U+Af9pmr62Ej13myeHTMYLtCgPVE=;
        b=d7aiKONCF+XenU+Tu9y1fA5yTwgtQPS1HZgvoPGarUNJ1iNiX76AGei/KXAOdhUXNY
         N3CKl49hZEGWKM/acAQE4lbhl/6iSzJuHBaqkVy31yXjnFHm1P4d83KOkT3v3RSlWVf5
         FeHzjMam8eRjk+D2LF8So0tpn7fXgv+KDBfgM6ho3slL7WzkyvfX2WJkntRzotcI3KEC
         s/AoZ/+2CgKskPl2R7JcyhAM6GiKQnsr9yfxow8yNxnU3qL3Yk5vZNoQ3tyUR1B12NzQ
         hhph/1zwxq9HwUAWUW0gkqZvBD/y9z7ZVYNvcdwEK1pQlTA9SJljpQ0C9Is2Q2ASIcJF
         PYBQ==
X-Gm-Message-State: AO0yUKWAl+h59+ijuwZzEv9/Z8D43CL61rs4vJHzm5gUvG0OO/iR6JWX
        l+cWk8IThlc500uSXLm+ugEhpOy4l+Dbs6MSRDaGbQ==
X-Google-Smtp-Source: AK7set8quw15Bqc+0QWbimOwzwNnb5QDs+/xKDJoWKlIL9Ch9uIbwRdKWK4vj2GGj+Q/UI3Ou/64971MYbkSQf+7q50=
X-Received: by 2002:a0d:c405:0:b0:527:3e8:5bab with SMTP id
 g5-20020a0dc405000000b0052703e85babmr1620322ywd.306.1676752577751; Sat, 18
 Feb 2023 12:36:17 -0800 (PST)
MIME-Version: 1.0
References: <20230121112947.53433-1-robimarko@gmail.com> <20230121112947.53433-4-robimarko@gmail.com>
 <d71e8a18-8a09-c722-d9dd-b2d48615828f@linaro.org>
In-Reply-To: <d71e8a18-8a09-c722-d9dd-b2d48615828f@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 18 Feb 2023 22:36:07 +0200
Message-ID: <CAA8EJppwNVtUjB7fUZSCrZ88Ssbhmc4HD6oA2nV0uEx+vHBXUw@mail.gmail.com>
Subject: Re: [PATCH 4/4] cpufreq: qcom-nvmem: make qcom_cpufreq_get_msm_id()
 return the SoC ID
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Robert Marko <robimarko@gmail.com>, ilia.lin@kernel.org,
        agross@kernel.org, andersson@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
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

On Sat, 18 Feb 2023 at 16:43, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 21.01.2023 12:29, Robert Marko wrote:
> > Currently, qcom_cpufreq_get_msm_id() does not simply return the SoC ID
> > after getting it via SMEM call but instead uses an enum to encode the
> > matched SMEM ID to 2 variants of MSM8996 which are then used in
> > qcom_cpufreq_kryo_name_version() to set the supported version.
> >
> > This prevents qcom_cpufreq_get_msm_id() from being universal and its doing
> > more than its name suggests, so lets make it just return the SoC ID
> > directly which allows matching directly on the SoC ID and removes the need
> > for msm8996_version enum which simplifies the driver.
> > It also allows reusing the qcom_cpufreq_get_msm_id() for new SoC-s.
> >
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > ---
> >  drivers/cpufreq/qcom-cpufreq-nvmem.c | 44 ++++++++--------------------
> >  1 file changed, 12 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> > index da55d2e1925a..9deaf9521d6d 100644
> > --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> > +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> > @@ -32,12 +32,6 @@
> >
> >  #include <dt-bindings/arm/qcom,ids.h>
> >
> > -enum _msm8996_version {
> > -     MSM8996_V3,
> > -     MSM8996_SG,
> > -     NUM_OF_MSM8996_VERSIONS,
> > -};
> > -
> >  struct qcom_cpufreq_drv;
> >
> >  struct qcom_cpufreq_match_data {
> > @@ -134,30 +128,16 @@ static void get_krait_bin_format_b(struct device *cpu_dev,
> >       dev_dbg(cpu_dev, "PVS version: %d\n", *pvs_ver);
> >  }
> >
> > -static enum _msm8996_version qcom_cpufreq_get_msm_id(void)
> > +static int qcom_cpufreq_get_msm_id(void)
> This should be u32 as info->id is __le32
>
> And please export this function from socinfo, it'll come in
> useful for other drivers!

How? In my opinion newer drivers should use compat strings rather than
depending on the SoC ID. If we were not bound with the compatibility
for msm8996pro device trees already using higher bits, we could have
dropped this part too.

-- 
With best wishes
Dmitry
