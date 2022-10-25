Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52DE260D658
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Oct 2022 23:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbiJYVyB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 17:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbiJYVx6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 17:53:58 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B62DBE5E
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 14:53:57 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id p8so24789088lfu.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 14:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0yM/e+WTW3oUfAY8MfxOUQ+ED2Cq5qxUwUsJjvobWQ0=;
        b=SAW43FVTyqs8guIkmnDC4LeB+apQpQkGpIJOw6p2MQ7UXm/wNzFLUlOID51Gu+mD11
         598l1RVRZO/hPJI8yBlrTL+ifobvJ91XRyKaeu9MqOY1Cq8ftRhNyK8zUZKIZu4b+8Lx
         PlaXjuCO/lROfgSnq2foQfV2URWv8jT9o4eXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0yM/e+WTW3oUfAY8MfxOUQ+ED2Cq5qxUwUsJjvobWQ0=;
        b=xSOjwZFnMJRjqLzJrUMGVCZNf+RiqQAdSu4XIumDfwV9WfOcFEyNW8JYjUtl1yBKPw
         zoRLDMqDW9SpIc9uaSY8q5vSTDzHGewYZh93d8TNQAu8YCPaA20/0DVw+j8uj+mEhMZG
         LHOBelmipYJ1r1+7TjZnn0l3GJi9/TOG0yOM2jRhn/O4lah1sX1UN2YAhACwV6dyFvOY
         0uAGEVsT1T8Ala5zDvHBB6GWgKCfCXXFXKNLaS4VGzlc5YSreE+X66+umilZOy+Lrws5
         0dNv4f9Eb1diIbZBkrNyYuGhsCng0MOUnnH+0gytoZnVzsAHXvNpptd3L//vYsItxgsA
         c97Q==
X-Gm-Message-State: ACrzQf0JJClFTZQxjkTZBz1XAQBrri/3zE5NqGAHLnr1522IzszZvJRc
        MNVJpKLM3iI7Jpy6FWfsxE3ngXJQZ6NbTphb282ppExZp90=
X-Google-Smtp-Source: AMsMyM4/vdKyXEQGvcerwAShA9nl3l4ZaAfL7u3sS2Fp4Ke32myC6QH3cXoMbDojeXvRQCFO+JzdxWpjuWiKkGdHzJw=
X-Received: by 2002:a05:6512:75:b0:4a4:6c3e:a75d with SMTP id
 i21-20020a056512007500b004a46c3ea75dmr13947069lfo.408.1666734836241; Tue, 25
 Oct 2022 14:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhH41JnZA_fPNczMpBwnTy5P-5xhgPY5_eHkOsBzx0Qy=A@mail.gmail.com>
 <d31e3aa3-fdec-f0b1-f400-0ea6055a0f6c@linaro.org>
In-Reply-To: <d31e3aa3-fdec-f0b1-f400-0ea6055a0f6c@linaro.org>
From:   Nathan Hebert <nhebert@chromium.org>
Date:   Tue, 25 Oct 2022 14:53:45 -0700
Message-ID: <CANHAJhFiVRxaDwfV5ej0c5o7JJ6cjRwoUiy2dvnSyGHo1H_ibA@mail.gmail.com>
Subject: Re: [PULL V4]: qcom: SC7180 and SC7280 venus firmware updates
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Vikash Garodia <vgarodia@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 25, 2022 at 2:48 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 26/10/2022 00:32, Nathan Hebert wrote:
> > The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:
> >
> >    cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)
> >
> > are available in the Git repository at:
> >
> >    https://github.com/nathan-google/linux-firmware.git
> > update_sc7180_and_sc7280_firmware_v4
> >
> > for you to fetch changes up to 05df8e65182f7ee945f826e41b5eaa17c188a8df:
> >
> >    qcom: update venus firmware files for VPU-2.0 (2022-10-25 14:16:59 -0700)
> >
> > ----------------------------------------------------------------
> > Nathan Hebert (4):
> >        qcom: replace split SC7180 venus firmware images with symlink
> >        qcom: update venus firmware file for v5.4
> >        qcom: remove split SC7280 venus firmware images
> >        qcom: update venus firmware files for VPU-2.0
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Please excuse me for being too picky.
No worries! Thanks for helping me get the change right.
>
> --
> With best wishes
> Dmitry
>
