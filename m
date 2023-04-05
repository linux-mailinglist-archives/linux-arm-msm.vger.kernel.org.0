Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4BDB6D7CBB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 14:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238044AbjDEMfu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 08:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237079AbjDEMft (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 08:35:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C6FB2D43;
        Wed,  5 Apr 2023 05:35:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 251CA623CD;
        Wed,  5 Apr 2023 12:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BCB5C433D2;
        Wed,  5 Apr 2023 12:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680698147;
        bh=8HlBKLIJpAV2b3eg1TOMDkkM5bLvfsYLVCoReuOUKpk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=i6O+ll+CiaHionwwAJNvxGHnXCKvQhgf+LFPbP6Caqkl44TZggP4VCA2avHOGG0cG
         p5yzqGZVrVV6cwLEFTVFf2VyH2DljKTpeg9ISGZEmrkMQiTZefigNVhiWLV4m6zhZn
         wsk/y9uFXXk2RmuQrh848zEWfiGtSGfEzHodaJGoW4EygHa9sxXD+xc4lHHmX3FVg1
         fF8ooeAEc/1tD0W9k1M/W/leOWxYXBbhmGuGRwKwPelIubqKta77NQvKHZUpyZvgL0
         kRmXHbcvQy25O1eXwc4z5N92Dfc3cppf3gvYcRSeqFTqIOWXNQAzfeSJqN2fQm6ZBM
         nsnmkjbcqKDtQ==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-545cb3c9898so598587067b3.7;
        Wed, 05 Apr 2023 05:35:47 -0700 (PDT)
X-Gm-Message-State: AAQBX9fsPqHih6/gYtjYO6fwfWUH1Ekdj4WUujTkEfzSQdafgqFe9DaN
        /OnR4RkWvICfurjig8xJmySQNuri1VKAemDi9CU=
X-Google-Smtp-Source: AKy350ZxpFbBPPjZoLu6Z6giTPoghjoGnWKV2I8a/ShJNOWIy5AwLideXolvJVQnNgYfShf4tojsh9mcOJq39p++hzI=
X-Received: by 2002:a81:b54f:0:b0:549:14b0:84af with SMTP id
 c15-20020a81b54f000000b0054914b084afmr1535850ywk.1.1680698146338; Wed, 05 Apr
 2023 05:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <1679932497-30277-1-git-send-email-quic_jhugo@quicinc.com>
 <857db3fb-b006-4aa8-a7f8-2ae0b8a160c9@quicinc.com> <c5d11a88-351a-8eaf-f1d2-d7cf37cdf81c@linux.intel.com>
In-Reply-To: <c5d11a88-351a-8eaf-f1d2-d7cf37cdf81c@linux.intel.com>
From:   Oded Gabbay <ogabbay@kernel.org>
Date:   Wed, 5 Apr 2023 15:35:19 +0300
X-Gmail-Original-Message-ID: <CAFCwf12iVZkcPKOEc911-fCd4-YzHYJzs_p36jfBiT=VkcO9uQ@mail.gmail.com>
Message-ID: <CAFCwf12iVZkcPKOEc911-fCd4-YzHYJzs_p36jfBiT=VkcO9uQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] QAIC accel driver
To:     Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc:     Jeffrey Hugo <quic_jhugo@quicinc.com>, airlied@gmail.com,
        daniel@ffwll.ch, mani@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com,
        stanislaw.gruszka@linux.intel.com, quic_carlv@quicinc.com,
        bagasdotme@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 5, 2023 at 2:26=E2=80=AFPM Jacek Lawrynowicz
<jacek.lawrynowicz@linux.intel.com> wrote:
>
> Hi,
>
> On 03.04.2023 19:22, Jeffrey Hugo wrote:
> > On 3/27/2023 9:54 AM, Jeffrey Hugo wrote:
> >> This series introduces a driver under the accel subsystem (QAIC -
> >> Qualcomm AIC) for the Qualcomm Cloud AI 100 product (AIC100).  AIC100 =
is
> >> a PCIe adapter card that hosts a dedicated machine learning inference
> >> accelerator.
> >>
> >> The previous version (v4) can be found at:
> >> https://lore.kernel.org/all/1679325074-5494-1-git-send-email-quic_jhug=
o@quicinc.com/
> >
> > Looks like things have been silent on this revision and we have a numbe=
r of review tags already.  Seems like this series is ready for merge.
> >
> > I'd like to see this queued for 6.4 if possible.  Given that we are at =
6.3-rc5, it seems like this would need to be merged now(ish) to make 6.4.
> >
> > Jacek, since you have commit permissions in drm-misc and are an active =
Accel maintainer, I wonder if it would be appropriate for you to merge this=
 series to drm-misc.  Thoughts?
>
> I'm would be happy to merge it but I think it needs to be acked by Oded f=
irst.
>
> Regards,
> Jacek

Hi,
Entire patch-set is:
Acked-by: Oded Gabbay <ogabbay@kernel.org>

Thanks,
Oded
