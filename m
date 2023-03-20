Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0634C6C0B07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 08:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbjCTHD7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 03:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbjCTHD5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 03:03:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2DDE1ACF8;
        Mon, 20 Mar 2023 00:03:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4BBA761241;
        Mon, 20 Mar 2023 07:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4946C4339E;
        Mon, 20 Mar 2023 07:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679295835;
        bh=2H4AQ2SU481Tr1WbHtk4czK916TUGFna3lsTDF/M42w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XfxP8nunHNfa8ecRMsWEdiXfHmD+3ANvXwhSFmHl6NgiQ92xGH2ytDTTE30DlnvHp
         hadk9c0S+gKq7GCAtzOn6GnLcSlti3r1PSZGcJP2LvUJPQHn+bErmMsQb5kuNUGTvP
         vFiRGpdKIXVLPCz2g0Gh0CSe4bwzy3qd1fqgbJzGI/q9eoswRXG+7U6qedo18nqEn4
         wDu6oT/0W4krCmW8cweVWUfQDiB5Qi1lQbtOo/DrrcqV5aE45NnM8Ta92roPIWO+gf
         M8KUsHLXscTFqv4kI3yP3YQru6n/n2P6zbsvfj98q2ASzogKpxJkYYHYMtTAlxVdqr
         ia3yMYif2LtUA==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5418d54d77bso206952367b3.12;
        Mon, 20 Mar 2023 00:03:55 -0700 (PDT)
X-Gm-Message-State: AO0yUKVnkWvr6YKHlJyn16VDEpdcLWeqIsTDo6XNriPufb96Hk19yqFa
        yj1RK7iIG9auxEMcS+OzWNg8PmrW4H3tQz7KTn8=
X-Google-Smtp-Source: AK7set89bEdjlCM3E14LMT7MClZ73N7FHeqNx6qsP8qKAUb/CfL5+5L5ehdU/HIyQGpQJqFvX9FDilzvmN/lwwuc2Qo=
X-Received: by 2002:a81:ac25:0:b0:540:e744:13ae with SMTP id
 k37-20020a81ac25000000b00540e74413aemr9881948ywh.3.1679295834577; Mon, 20 Mar
 2023 00:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <1678138443-2760-1-git-send-email-quic_jhugo@quicinc.com>
 <1678138443-2760-9-git-send-email-quic_jhugo@quicinc.com> <5e912413-eee4-5b25-5f6d-00ccc7501b9d@linux.intel.com>
 <daa3100e-8f5b-8dbb-297f-ca3a87b44a97@quicinc.com> <20230317140451.uywz7szrzvusyrjy@houat>
 <d46b8f76-ce60-1c01-edc7-ec227315faf9@quicinc.com>
In-Reply-To: <d46b8f76-ce60-1c01-edc7-ec227315faf9@quicinc.com>
From:   Oded Gabbay <ogabbay@kernel.org>
Date:   Mon, 20 Mar 2023 09:03:28 +0200
X-Gmail-Original-Message-ID: <CAFCwf11mo2rwTNDUO+7jT0OHJVs+EzxSg4c-pKO3h9V+Un1Ugg@mail.gmail.com>
Message-ID: <CAFCwf11mo2rwTNDUO+7jT0OHJVs+EzxSg4c-pKO3h9V+Un1Ugg@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] MAINTAINERS: Add entry for QAIC driver
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        dafna@fastmail.com, airlied@gmail.com, daniel@ffwll.ch,
        stanislaw.gruszka@linux.intel.com, dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com,
        quic_carlv@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 17, 2023 at 5:46=E2=80=AFPM Jeffrey Hugo <quic_jhugo@quicinc.co=
m> wrote:
>
> On 3/17/2023 8:04 AM, Maxime Ripard wrote:
> > On Thu, Mar 16, 2023 at 11:04:05AM -0600, Jeffrey Hugo wrote:
> >> On 3/14/2023 3:59 AM, Jacek Lawrynowicz wrote:
> >>> Hi
> >>>
> >>> On 06.03.2023 22:34, Jeffrey Hugo wrote:
> >>>> Add MAINTAINERS entry for the Qualcomm Cloud AI 100 driver.
> >>>>
> >>>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> >>>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> >>>> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.co=
m>
> >>>> ---
> >>>>    MAINTAINERS | 9 +++++++++
> >>>>    1 file changed, 9 insertions(+)
> >>>>
> >>>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>>> index b0db911..feb2974 100644
> >>>> --- a/MAINTAINERS
> >>>> +++ b/MAINTAINERS
> >>>> @@ -17253,6 +17253,15 @@ F:        Documentation/devicetree/bindings=
/clock/qcom,*
> >>>>    F:      drivers/clk/qcom/
> >>>>    F:      include/dt-bindings/clock/qcom,*
> >>>> +QUALCOMM CLOUD AI (QAIC) DRIVER
> >>>> +M:        Jeffrey Hugo <quic_jhugo@quicinc.com>
> >>>> +L:        linux-arm-msm@vger.kernel.org
> >>>> +L:        dri-devel@lists.freedesktop.org
> >>>> +S:        Supported
> >>>> +F:        Documentation/accel/qaic/
> >>>> +F:        drivers/accel/qaic/
> >>>> +F:        include/uapi/drm/qaic_accel.h
> >>>
> >>> Aren't you missing repo link?
> >>> T:  git git://anongit.freedesktop.org/drm/drm-misc
> >>
> >> Maarten/Maxime/Thomas are we ok to follow the iVPU example and use drm=
-misc
> >> for this, or would a separate tree be preferred?
> >
> > Yeah, please go ahead with drm-misc
> >
> > Do you have commit rights?
>
> No.  My operating assumption is this series will get merged first, which
> will then justify having commit rights.  I'm new to DRM, so please
> educate me if I'm missing something.
>
> Thanks
>
> -Jeff

Your assumption is correct. Once it gets merged, I think that's enough
for you to get commit rights.
And drm-misc is the place for most of the drivers in drm, so that's
also completely fine.

Thanks,
Oded
