Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83FC36D0452
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 14:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbjC3MG6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 08:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbjC3MG5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 08:06:57 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D5664EFE
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:06:56 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id r187so23123482ybr.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680178015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gkT/7zdHnIQ3CUKXvOE81tJhj7SY8g6u5qXHB7mKN4s=;
        b=uXvQF2IlUxrinVNAkSp6SQUtcA8KXJWqNpWbc7BPdAAR5yQTuywgCh5xIpcYsW4XRh
         GtSd2KlYIQvwyIkEYcC2mhNE3yXAzvZ0UQZQwZ+TZy/tyd68DYrWh7wBQW+t13PnVpow
         +n+0zsmpJSaulL0GBtTRJ+Oj0cqRqF94xLJd5TrIDCEAsp1jqWlj2WAV5xtYvc+U1vM9
         /PJxnY3F8IMluhyOoUAaaSo15TiGkAZgo8QFBwbOUaWdpDcKvYmQ64zxG9blvXFX3u67
         SHUn9j06E5u0GJIth7gthD6s+7zIhsF0LJR1n6Z+qWUrkVLJ0NCPPo0zoYykGj7dq9nv
         8rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680178015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkT/7zdHnIQ3CUKXvOE81tJhj7SY8g6u5qXHB7mKN4s=;
        b=Oko5BAlD7CRmO6UgV/KSSyE289nOe6SWMuFqYiIuLlF7lnwfwIrznz1ZLrOFKwR45t
         AyUtHnlCkBRv443s8jbpeSLOSWwL7PTJP4KNjX8XVGGhlRZeTTvEa0nDwDbSjifWKOWD
         3m5aHw5kpbkF81vFjMotThSgZPNb+/WjTkBH+w5NM1Q1hS6GzbtPbPUAKO+QjWgopPNC
         JIFc0AXeQ064D5CSyLWjJErHRZTMF0R/KtGzQA68niBD76UMv33rrhA80PAN/nU+Obd6
         agkxLMOEllNAVh3PiiLd4XlfKkuciAkrl4UtlIv86/rCpl61jiPPD6T6bpBLDQ9B/mNp
         8FdQ==
X-Gm-Message-State: AAQBX9ejpvG/kKxIgbvm3AKasbcbYYEFRwtI6aCVDNqnMDnFAK9AMPjJ
        NmIfg5Gb4f8rmRtO5SVFoedxue4QRdkaa2sSqyz3Ow==
X-Google-Smtp-Source: AKy350YYb3H6OIWKxoEKy9fXkmEUBf8IuIaBbiJRxOOn3+CjnDRzm9X4FsN6lRoL7LyiXnTR2aYudG6KXzdobkpRcQk=
X-Received: by 2002:a25:db91:0:b0:b75:8ac3:d5d9 with SMTP id
 g139-20020a25db91000000b00b758ac3d5d9mr14845658ybf.3.1680178015170; Thu, 30
 Mar 2023 05:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230330084250.32600-1-quic_mkshah@quicinc.com>
 <20230330084250.32600-2-quic_mkshah@quicinc.com> <20230330093431.xn5wwiwqbne5owf7@bogus>
In-Reply-To: <20230330093431.xn5wwiwqbne5owf7@bogus>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 30 Mar 2023 14:06:19 +0200
Message-ID: <CAPDyKFpUmkF=pOwXNrva1k2R+RFBB39-Y4kA0Fve+-3NGbtDag@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] cpuidle: psci: Move enabling OSI mode after power
 domains creation
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Maulik Shah <quic_mkshah@quicinc.com>, andersson@kernel.org,
        dianders@chromium.org, swboyd@chromium.org, wingers@google.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, jwerner@chromium.org,
        quic_lsrao@quicinc.com, quic_rjendra@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Mar 2023 at 11:34, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Thu, Mar 30, 2023 at 02:12:49PM +0530, Maulik Shah wrote:
> > A switch from OSI to PC mode is only possible if all CPUs other than the
> > calling one are OFF, either through a call to CPU_OFF or not yet booted.
> >
>
> As per the spec, all cores are in one of the following states:
>  - Running
>  - OFF, either through a call to CPU_OFF or not yet booted
>  - Suspended, through a call to CPU_DEFAULT_SUSPEND
>
> Better to provide full information.
>
> > Currently OSI mode is enabled before power domains are created. In cases
> > where CPUidle states are not using hierarchical CPU topology the bail out
> > path tries to switch back to PC mode which gets denied by firmware since
> > other CPUs are online at this point and creates inconsistent state as
> > firmware is in OSI mode and Linux in PC mode.
> >
>
> OK what is the issue if the other cores are online ? As long as they are
> running, it is allowed in the spec, so your statement is incorrect.
>
> Is CPUidle enabled before setting the OSI mode. I see only that can cause
> issue as we don't use CPU_DEFAULT_SUSPEND. If idle is not yet enabled, it
> shouldn't be a problem.

Sudeep, you may very well be correct here. Nevertheless, it looks like
the current public TF-A implementation doesn't work exactly like this,
as it reports an error in Maulik's case. We should fix it too, I
think.

Although, to me it doesn't really matter as I think $subject patch
makes sense anyway. It's always nice to simplify code when it's
possible.

Note also that, before commit 70c179b49870 ("cpuidle: psci: Allow PM
domain to be initialized even if no OSI mode"), it made sense to call
psci_pd_try_set_osi_mode() before creating the genpds, but beyond that
it doesn't really matter anymore.

Kind regards
Uffe
