Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E309C4402BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 21:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbhJ2TFH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 15:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbhJ2TFC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 15:05:02 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27653C061767
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 12:02:31 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id y128so14702879oie.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 12:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=EIeddSJsPZI121c2mPaqy6ZvZdxoXoeG6NaJ61D0w1M=;
        b=UisHez+kJiclZMAv6xLKoK5fjzBq4k49HQiofS6cmr7jGlw30tCADu16izaFQ7J8AV
         0WtQdZzr3nuw/E4sLsP7xbpiPSVNTaaHQF+MZYSaATg2P1AJ1UiNHHZ1tbC4kOSjwtPB
         Otmmz03pVs1XCkTcDnBSozj3apy8h5v+fh8cE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=EIeddSJsPZI121c2mPaqy6ZvZdxoXoeG6NaJ61D0w1M=;
        b=tvwuFS2smF7FLpAhVCoBnxAY8tynJdn0JvH8iMEUvaaJKvQXogIEuq47m/1ElcB2UT
         lSu+C214xtzYNLhf0AfKCeA75wiMpLAC3Lr+O9M3/ehDV1r1ojbYpcfsXQaljpzGMARe
         5Ep/VzXGbkwPcvb5OcAFoVJWOMmZheIVRmTwxSJDoilioRAkEdFyezlZjZTEOdMipXxr
         0qiA9b1r9Cc4oBY2V31K0HDt3Hm+jd09ZxggsirlNfyaSmah8b9JTH2glwJ1b4C9m8lv
         /L15Z+fIba5L34nxEMBRm/kcpuLEqoIunl1dbFu2GGLDMyIqzrfpIEELrYbsc2Neu2CF
         peWg==
X-Gm-Message-State: AOAM530r9j/0xfOCqkH4hEvax+h1lOmJVfBn4g/dizTf0KwpncEHdAMA
        5wGVLiPbizEPLcg1YeGiYEJOJotmO7Idjbvuet/rqw==
X-Google-Smtp-Source: ABdhPJyiK8MkuApeXTUpQ6ZUVOnnEE5iHn2Q72Q/oRWZJi9mq8PDfSsGfQARn7TP8uoJHYvA1Nq2eF9CB/oAYVx+9o8=
X-Received: by 2002:a05:6808:2124:: with SMTP id r36mr9672695oiw.64.1635534150590;
 Fri, 29 Oct 2021 12:02:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Oct 2021 14:02:30 -0500
MIME-Version: 1.0
In-Reply-To: <1635507893-25490-4-git-send-email-quic_c_skakit@quicinc.com>
References: <1635507893-25490-1-git-send-email-quic_c_skakit@quicinc.com> <1635507893-25490-4-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 29 Oct 2021 14:02:30 -0500
Message-ID: <CAE-0n50GS11KsO_5zZV_ETyiu6eO9e6RUW9vZSV-QEAM2xdrGQ@mail.gmail.com>
Subject: Re: [PATCH V3 3/4] arm64: dts: qcom: pm8350c: Add pwm support
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     mka@chromium.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, satya priya <skakit@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2021-10-29 04:44:52)
> From: satya priya <skakit@codeaurora.org>
>
> Add pwm support for PM8350C pmic.
>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
