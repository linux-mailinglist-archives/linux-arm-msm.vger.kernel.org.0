Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26C1F7E2F4F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 22:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233005AbjKFV4D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 16:56:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232005AbjKFV4D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 16:56:03 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D1FBC6
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 13:56:00 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c4fdf94666so66104961fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 13:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699307758; x=1699912558; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPhs6rysF6DasMcFlWcetB0SUQreo53hcaBGYIwCUKA=;
        b=cLZ5jCury2Y9BVn0WMUKIGjo5KIMFTTGM/ljuPB+UwGF0dM2UABad/uo1QcZ89jsIZ
         YYuY8RMefJ4jrGrfNM2CyRtRHMpZ0kAXz+G9DSlRyi4zMpi9c0zCBjd5SJcJt7XUA9fz
         w1gJ62bsO6NMdumLzn4LvINubhcTajhxpcl4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699307758; x=1699912558;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPhs6rysF6DasMcFlWcetB0SUQreo53hcaBGYIwCUKA=;
        b=GoK2baozOxdwLt1HItitN9n52uQ0HOKawhdjk4pQ8jQ/9V+c4h85TwFj7xu80CDTwf
         hpZ0EFb2x+DzPK84jChppuA4D1dMskGY6IaaIlNOAMr9cBUuAH+ycCjgiYneWb9YOM37
         YEunx6DAVTzN1sIQSUJ0Op4RGhJ6dRPYu6qPH1lhNQe0jVLpl/s+Vxq4DoYw+D4gkrpL
         UmhYYyE/hSTw30wv+uGNAyorB+uKhQvhKW1ugmqNeaICq1qX0r5aZUAb5sREmaFvAKIK
         I7bGxuAvharGT3Vrfu2k7UtcGopOS5iKzikL8EeY0cS4HtnHr0lJpCaBPyPR5dI6K4CP
         2kcw==
X-Gm-Message-State: AOJu0YxFg1AX+/qjqMVy6K2ku4ogq2Id77AhNDpr69HTkHwZUMPAFQsX
        M/9XfoAuySsKt0vo8MgpWOJ1PE+TxdQo5Bu4h4A7pw==
X-Google-Smtp-Source: AGHT+IEwLGUljMTTnmDBOYDOS2P97CSh22lKY/YnB5/zNvxrhbW3lqGlDKYhx0sD7AWXifJZGCri2EKXnelUaxD2r7M=
X-Received: by 2002:a2e:b4a2:0:b0:2c5:52d:c9ff with SMTP id
 q2-20020a2eb4a2000000b002c5052dc9ffmr20722722ljm.10.1699307758491; Mon, 06
 Nov 2023 13:55:58 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Nov 2023 13:55:58 -0800
MIME-Version: 1.0
In-Reply-To: <5e83d947-c77f-9318-4a4c-377a8304b8fd@quicinc.com>
References: <20231103105712.1159213-1-quic_adhudase@quicinc.com>
 <20231103193345.GY3553829@hu-bjorande-lv.qualcomm.com> <5e83d947-c77f-9318-4a4c-377a8304b8fd@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 6 Nov 2023 13:55:58 -0800
Message-ID: <CAE-0n50HwE+gNYotYXduer3b=O+c3ZWLC_8gEmpo0KQmtzmNvQ@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: llcc: Fix dis_cap_alloc and retain_on_pc configuration
To:     Atul Dhudase <quic_adhudase@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        isaacm@codeaurora.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Mukesh Ojha (2023-11-05 22:54:28)
>
>
> On 11/4/2023 1:03 AM, Bjorn Andersson wrote:
> > On Fri, Nov 03, 2023 at 04:27:12PM +0530, Atul Dhudase wrote:
> >> While programming dis_cap_alloc and retain_on_pc, set a bit
> >> corresponding to a specific SCID without disturbing the
> >> previously configured bits.
> >>
> >
> > As far as I can see, the only invocation of _qcom_llcc_cfg_program()
> > comes from qcom_llcc_cfg_program(), which is only called once, from
> > qcom_llcc_probe(), and here also seems to only be the single write to
> > these two registers.
>
> It does not look to be single write but the write is for each slice
> in the same register which was overriding other slices values.

Can you add that detail to the commit text? What's the seriousness of
the issue? Why should it be backported to stable? Is something seriously
broken because a slice configuration is overwritten? Does it mean that
some allocation made in a slice is being lost over power collapse (pc)
when it shouldn't be?
