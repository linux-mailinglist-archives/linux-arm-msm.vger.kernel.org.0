Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2A460FB06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 17:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236058AbiJ0PAD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 11:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236038AbiJ0O77 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 10:59:59 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA2BB1262A
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 07:59:47 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1322d768ba7so2375560fac.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 07:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A62UelZTVELbTDOY9K4jDQc3Vv/5CJZi4U1ZDNxRqAg=;
        b=KtNSGZB/lIjM1x6AgTSnVa70hSnMq5ju+qWL+RG/9HjjbAkmP50ITxmx6cey447cl6
         N8QqR+J1n7PXh/8OPxKp9NwXFb9botUqQWRgy2lbzQi57+kKTmk7rcQUHgbcA4Vpoh2+
         CS6Jye4kIEd6M2yU8iiU/BsSSD+YFH1+9JuPqOLqMuv6k0zBcovqDvqctlysBMQZP5/q
         AyaOT9P70D15BFzRvzEWMl20uaRESpYuHzv8BEruwKaHW2xtrZgWMQyqjZNFcgQl/z/0
         abGHpfHd8+mpXyr/vijp6xFrZKKPSWyqWTP4qxt9RHHMalsSl1OTXeVvHBG3ZwjNRf6j
         dtiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A62UelZTVELbTDOY9K4jDQc3Vv/5CJZi4U1ZDNxRqAg=;
        b=K2mI2MYt1qoMU71MRZsCELZaKSAFEFtYXam2VT06ImMJmmt2MlnV4bdRpg5ktXeEJ+
         D75eRmORhZtyltmDZR6/RdC9satR+cHzq6i6zu4snO5tyHcxixDF/2lV+Wzv+f7unHNO
         JcL4QLMBQHptzpWt7o19NbKxqCne8+24OMesHuRSUA/TdytlfjcwfCfTRSUY5i5jd/nq
         PL4vAU0sCcMEorUQ30MEsqzI03QDWgH0HFuumKQgW3QCtN8bOBT/WJhGEOfZ/Gc/xjxV
         UY9tDgKmldzk2vKVxbi5gmprBGl5SGs7pss+2yfJfH7KyllQ4Gpf1JAcTZb8IRLjhesE
         7ltA==
X-Gm-Message-State: ACrzQf31036XjbxwqG3PVC69ayZY2DwKmye/ppyG+yjSKUmNqJ4QrLGK
        uh4u6PptpBeY3PzOiQHVh2Bok1AQmoOVC9CJCNqDTQ==
X-Google-Smtp-Source: AMsMyM4RTfSlm8DFcKaZhZg6O8scKMtzjAqgmZX35733Ej3hi3O7g9ldt4ITTAaQi4QK9cOD7hPOGjFg4R2Afx/m+AE=
X-Received: by 2002:a05:6871:611:b0:13b:8097:2b92 with SMTP id
 w17-20020a056871061100b0013b80972b92mr5744785oan.44.1666882787200; Thu, 27
 Oct 2022 07:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221027115745.240516-1-ulf.hansson@linaro.org>
In-Reply-To: <20221027115745.240516-1-ulf.hansson@linaro.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Thu, 27 Oct 2022 20:29:11 +0530
Message-ID: <CAMi1Hd2Qh-AO8JjwzwqYaQF3kyfC6R3K2t6jy3r2sSApTmwGGw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Disable the not yet supported
 cluster idle state
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maulik Shah <quic_mkshah@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 27 Oct 2022 at 17:27, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> To support the deeper cluster idle state for sm8250 platforms, some
> additional synchronization is needed between the rpmh-rsc device and the
> CPU cluster PM domain. Until that is supported, let's disable the cluster
> idle state.
>
> This fixes a problem that has been reported for the Qcom RB5 platform (see
> below), but most likely other sm8250 platforms suffers from similar issues,
> so let's make the fix generic for sm8250.
>
> vreg_l11c_3p3: failed to enable: -ETIMEDOUT
> qcom-rpmh-regulator 18200000.rsc:pm8150l-rpmh-regulators: ldo11: devm_regulator_register() failed, ret=-110
> qcom-rpmh-regulator: probe of 18200000.rsc:pm8150l-rpmh-regulators failed with error -110
>
> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Fixes: 32bc936d7321 ("arm64: dts: qcom: sm8250: Add cpuidle states")
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>
> This problem was reported by Amit [1] together with an attempt to fix it. It
> turned, that we wanted a more generic fix, hence I posted $subject patch.

Thanks Ulf and Sudeep. This patch along with [2], fixes the above
mentioned crash on RB5 running AOSP.

Tested-by: Amit Pundir <amit.pundir@linaro.org>

Regards,
Amit Pundir

>
> Also note that, $subject patch is also depending (from functionality point of
> view) on a another for genpd [2]. Although, that should soon reach v6.1-rc[n] and
> stable kernels.
>
> Bjorn, can you pick this up as a fix for v6.1-rc and tag it for stable kernels?
>
> Kind regards
> Ulf Hansson
>
> [1]
> https://lore.kernel.org/lkml/20221018145348.4051809-1-amit.pundir@linaro.org/
> [2]
> https://lore.kernel.org/lkml/CAJZ5v0hJxRiL03XDFpU8FuabsHn5i6JMksJ=dfj8B+Dm=s3LYA@mail.gmail.com/
>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index a5b62cadb129..e276eed1f8e2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -334,6 +334,7 @@ CLUSTER_SLEEP_0: cluster-sleep-0 {
>                                 exit-latency-us = <6562>;
>                                 min-residency-us = <9987>;
>                                 local-timer-stop;
> +                               status = "disabled";
>                         };
>                 };
>         };
> --
> 2.34.1
>
