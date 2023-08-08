Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 521F677420E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 19:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234773AbjHHRcr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 13:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234895AbjHHRcJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 13:32:09 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A3591B13
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 09:14:00 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6bcac140aaaso4542350a34.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 09:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691511226; x=1692116026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVUMGFTGmIMs9gxfcxcS/lMOKLXcrXhxKdcNy5Sb/7k=;
        b=WbWPtT/VO7TUfWWUdMo4ZP1kOfOO3RQBjAjnkZNIVkitWtTS6QNEK245te8btbkglC
         st/r7CEtLc+J9TXO//qf2SY8djZhEgwWiVivPDL0z9SLo2qBuyYqP+q6c8J3rCjag829
         7k4Q5l+i6XWYhedFpsiyCpKAJ01sl+ComkZrJJW4PufIRespCZyLlujQPPbm3Yh+oPJH
         oQEjHskutbrerBsDdSrcy2vC8p+ncWZrJ8y7gMNHj/9k0L5VoYIIIRmycF38eQiLuMUW
         QVDBUUiNoSF5A4Txnfuip0RqcLz9GtPKiKlxfgBCjJh9djIhM/8FOilKCl/lkFcItCId
         EkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511226; x=1692116026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVUMGFTGmIMs9gxfcxcS/lMOKLXcrXhxKdcNy5Sb/7k=;
        b=hJwGqEziorC5CQcYEYpxZFJ5hQT9zoI8pruTXi6smnNlWhlVyEQ4+VupNkAPAgng5y
         kmC3cGZAt06yWpvtTHbJfKAOcIc0bPBiBggoSZ1D4AEs3MCgW9pMAKyF/pWOJuAfUu5j
         /0j3WMzi/VY3eBjfkSpQMyOEyJsJ9m+w0ZuNYsYZfl+0kseBKXpf4ytTF91B4HJKo9Jy
         8f1aSZopaBjh/cL0HmYCrKzB9FSdN6EZqWlFMfGMvmQE1NxbBTHinJ4CYDaE2Q5/bBCe
         wcmoAaFTgL7cO+P9wtPHDgYWCG1l4/heAwmPb8C/DlHD+Jx6z8TkQr3Vqu40JWOtEL07
         sA+w==
X-Gm-Message-State: AOJu0YwIq1ApNs0Q3XiP+/rmwfw0ddREH0UdeHeuuacBi6NF1XNP8k4x
        UvBzdBTvJi1BShZsvFiaCgmm9M/dQhCAM9kio9xtwli9o84WGA4aPsY=
X-Google-Smtp-Source: AGHT+IFi15UXHlOjBafsncghPZ+CygvrFkHgT7nBLzL88m86kzLUpO8Z8UvMrvXkkHrJrBoiNDOqbizpom1bnSTUbwg=
X-Received: by 2002:a05:6902:30d:b0:d43:9eae:52b8 with SMTP id
 b13-20020a056902030d00b00d439eae52b8mr9684261ybs.10.1691504305098; Tue, 08
 Aug 2023 07:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230703085555.30285-1-quic_mkshah@quicinc.com>
In-Reply-To: <20230703085555.30285-1-quic_mkshah@quicinc.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 8 Aug 2023 16:17:48 +0200
Message-ID: <CAPDyKFrp6WQYW7uKwPLrWROEiXHCjHd6Y1O9yitZ6fJE7EO7bg@mail.gmail.com>
Subject: Re: [RESEND v4 0/3] Use PSCI OS initiated mode for sc7280
To:     andersson@kernel.org, rafael@kernel.org
Cc:     Maulik Shah <quic_mkshah@quicinc.com>, dianders@chromium.org,
        swboyd@chromium.org, wingers@google.com, daniel.lezcano@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, sudeep.holla@arm.com,
        jwerner@chromium.org, quic_lsrao@quicinc.com,
        quic_rjendra@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bjorn, Rafael,

On Mon, 3 Jul 2023 at 10:56, Maulik Shah <quic_mkshah@quicinc.com> wrote:
>
> This is resend of v4 with patch1 and patch2 Cced to stable kernel.
>
> Changes in v4:
> - Add missing s-o-b line and reviewed by in patch 1
> - Address ulf's comments for error handling in patch 2

This has been ready to be queued for quite a while and I have been
nagging you about it too. Sorry about that. :-)

To help out, I have queued up patch 1 and patch 2 for fixes, through
my new genpd tree [1].

Bj=C3=B6rn, please pick patch3 for v6.6.

Kind regards
Uffe

[1]
git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git fixes

>
> Changes in v3:
> - Add new change to provide helper function dt_idle_pd_remove_topology()
> - Address ulf's comments for error handling
> - Add reviewed by ulf for devicetree change
>
> Changes in v2:
> - Add new change to Move enabling OSI mode after power domains creation
> - Fix compatible string to domains-idle-states for cluster idle state.
> - Update cover letter with some more details on OSI and PC mode
>   comparision
>
> The dependency [2] is now merged in trustedfirmware project.
>
> Stats comparision between OSI and PC mode are captured at [3] with
> usecase
> details, where during multiple CPUs online the residency in cluster idle
> state is better with OSI and also inline with single CPU mode. In PC
> mode
> with multiple CPUs cluster idle state residency is dropping compare to
> single CPU mode.
>
> Recording of this meeting is also available at [4].
>
> This change adds power-domains for cpuidle states to use PSCI OS
> initiated mode for sc7280.
>
> This change depends on external project changes [1] & [2] which are
> under review/discussion to add PSCI os-initiated support in Arm Trusted
> Firmware.
>
> I can update here once the dependency are in and change is ready to
> merge.
>
> [1] https://review.trustedfirmware.org/q/topic:psci-osi
> [2] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/19487
> [3] https://www.trustedfirmware.org/docs/PSCI-OS-initiated.pdf
> [4] https://www.trustedfirmware.org/meetings/tf-a-technical-forum
>
> Maulik Shah (3):
>   cpuidle: dt_idle_genpd: Add helper function to remove genpd topology
>   cpuidle: psci: Move enabling OSI mode after power domains creation
>   arm64: dts: qcom: sc7280: Add power-domains for cpuidle states
>
>  arch/arm64/boot/dts/qcom/sc7280.dtsi  | 98 ++++++++++++++++++++-------
>  drivers/cpuidle/cpuidle-psci-domain.c | 39 ++++-------
>  drivers/cpuidle/dt_idle_genpd.c       | 24 +++++++
>  drivers/cpuidle/dt_idle_genpd.h       |  7 ++
>  4 files changed, 117 insertions(+), 51 deletions(-)
>
> --
> 2.17.1
>
