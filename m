Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC9666AE651
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 17:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbjCGQWc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 11:22:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbjCGQVz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 11:21:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931FC8FBD0
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 08:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678206065;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Okp29CiI2H9FabRWTBV6Ce2hH7HcFbLBrh9sr2tttRM=;
        b=d0Bg/l9HvaOgMYi2kpTLCyfrknaC37HXch8CDp/a429Uv9944jaoW7U4f6QdbpaSaBlxCL
        jmz0S5+TUpWLyz8ZR41XqoP0R6bjtId89W2+FGKWryR/JKbdlmQTpwU6bRwDzoNL+UZsaW
        L4kBMoI8MFuC+jW3FYPfoc5FkQiR8dM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-Dt0BIQWaNHGETaaKJjK6-g-1; Tue, 07 Mar 2023 11:20:52 -0500
X-MC-Unique: Dt0BIQWaNHGETaaKJjK6-g-1
Received: by mail-ed1-f69.google.com with SMTP id b7-20020a056402350700b004d2a3d5cd3fso14412846edd.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 08:20:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678206050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Okp29CiI2H9FabRWTBV6Ce2hH7HcFbLBrh9sr2tttRM=;
        b=fCr1RFRNrBPUyI68LnIb2SP8N/jtk3Y67Mn1E442TIruCNK1S1UPrUJ093GGY6c3f4
         f7YmdChh4LV72fgxBGce7TUCu0myWGreXkqreFl7+b407PLQ02Krb8EYvAEVa6CZS9tU
         5Pwy8MOrG1SxPVFRKBjQf2GuEsZDPJ07KAXgvU7s6/2vCv97lR7nCrlpd7Qpy/CGXrBJ
         hX7OTmyCEoT4BbfDh4QY7yR/ReW8m0FjhLJQLpm5YdVvPmO7CVP/O+04lIxj4q1W4K97
         K+gYMkLBC+dpkM8wDVt1s3odGJPeOfRbL36+XTIIdsqtiErd2haoSU3K7l4mpxzEjldQ
         9Q5w==
X-Gm-Message-State: AO0yUKXZIAfXoKJcnzeuzfSjDob/xgSrGJ93n3+8FoC+qobP+7dBCUFW
        GOFJ7oc8Xt6jqDHmFDDDrVxF/Ts9N/JK0iXWtoJfJoBhRiA+txbK88IMgxQLnwvNVbb3Elv1NHq
        1xQSe4mfQ6hDPhAer09RszqlC0axWTWp9xeA9fIUcvg==
X-Received: by 2002:a17:906:398a:b0:877:747e:f076 with SMTP id h10-20020a170906398a00b00877747ef076mr6925106eje.0.1678206050539;
        Tue, 07 Mar 2023 08:20:50 -0800 (PST)
X-Google-Smtp-Source: AK7set9G20DctDOwyMpftFREANE5jhKsQyOh3+l2jN44cYmmPkuVOEeEuUcgL8RJDa5lsKzEGFh+QMs0Tbf95NXVt/0=
X-Received: by 2002:a17:906:398a:b0:877:747e:f076 with SMTP id
 h10-20020a170906398a00b00877747ef076mr6925092eje.0.1678206050221; Tue, 07 Mar
 2023 08:20:50 -0800 (PST)
MIME-Version: 1.0
References: <20230210081835.2054482-1-javierm@redhat.com> <20230303220918.qr5ydbin3nye3qtz@amazon.com>
 <87h6uydwel.fsf@minerva.mail-host-address-is-not-set> <3d0315fa-14ca-dc34-81ae-467d9ed5133d@quicinc.com>
 <87sfeh0yjn.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87sfeh0yjn.fsf@minerva.mail-host-address-is-not-set>
From:   Enric Balletbo i Serra <eballetb@redhat.com>
Date:   Tue, 7 Mar 2023 17:20:18 +0100
Message-ID: <CALE0LRvR=DjUp2_DBuPQkEr9jvzGH4Mx4-7=rc6zOw1APQdyeQ@mail.gmail.com>
Subject: Re: [PATCH] media: venus: dec: Fix capture formats enumeration order
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Jordan Crouse <jorcrous@amazon.com>,
        linux-kernel@vger.kernel.org, Albert Esteve <aesteve@redhat.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Sergio Lopez <slp@redhat.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all,

On Tue, Mar 7, 2023 at 9:13=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Dikshita Agarwal <quic_dikshita@quicinc.com> writes:
>
> Hello Dikshita,
>
> > On 3/6/2023 3:38 PM, Javier Martinez Canillas wrote:
> >> Jordan Crouse <jorcrous@amazon.com> writes:
> >>
> >> Hello Jordan,
> >>
> >>> On Fri, Feb 10, 2023 at 09:18:35AM +0100, Javier Martinez Canillas wr=
ote:
> >>>> Commit 9593126dae3e ("media: venus: Add a handling of QC08C compress=
ed
> >>>> format") and commit cef92b14e653 ("media: venus: Add a handling of Q=
C10C
> >>>> compressed format") added support for the QC08C and QC10C compressed
> >>>> formats respectively.
> >>>>
> >>>> But these also caused a regression, because the new formats where ad=
ded
> >>>> at the beginning of the vdec_formats[] array and the vdec_inst_init(=
)
> >>>> function sets the default format output and capture using fixed inde=
xes
> >>>> of that array:
> >>>>
> >>>> static void vdec_inst_init(struct venus_inst *inst)
> >>>> {
> >>>> ...
> >>>>    inst->fmt_out =3D &vdec_formats[8];
> >>>>    inst->fmt_cap =3D &vdec_formats[0];
> >>>> ...
> >>>> }
> >>>>
> >>>> Since now V4L2_PIX_FMT_NV12 is not the first entry in the array anym=
ore,
> >>>> the default capture format is not set to that as it was done before.
> >>>>
> >>>> Both commits changed the first index to keep inst->fmt_out default f=
ormat
> >>>> set to V4L2_PIX_FMT_H264, but did not update the latter to keep .fmt=
_out
> >>>> default format set to V4L2_PIX_FMT_NV12.
> >>>>
> >>>> Rather than updating the index to the current V4L2_PIX_FMT_NV12 posi=
tion,
> >>>> let's reorder the entries so that this format is the first entry aga=
in.
> >>>>
> >>>> This would also make VIDIOC_ENUM_FMT report the V4L2_PIX_FMT_NV12 fo=
rmat
> >>>> with an index 0 as it did before the QC08C and QC10C formats were ad=
ded.
> >>>>
> >>>> Fixes: 9593126dae3e ("media: venus: Add a handling of QC08C compress=
ed format")
> >>>> Fixes: cef92b14e653 ("media: venus: Add a handling of QC10C compress=
ed format")
> >>>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> >>> I just came across this issue independently and can confirm this patc=
h fixes
> >>> the GStreamer V4L2 decoder on QRB5165.
> >>>
> >>> Tested-by: Jordan Crouse <jorcrous@amazon.com>
> >>>

This patch also fixes an issue running a V4L2 based decoder on Acer
Chromebook Spin 513 which is very similar to the HP X2 Chromebook, not
surprising as both platforms are basically the same, but anyway:

Tested-by: Enric Balletbo i Serra <eballetbo@redhat.com>

>
> >> Thanks for testing it!
> >>
> >> Stanimir, can we please get this for v6.3 as well?
> >
> > Hi Javier, Jordan
> >
> > Could you please explain what regression/issue you see with patch?
> >
> > venus hardware supports QC08C which provides better performance hence
> > driver is publishing it as preferred color format.
> >
> > if client doesn't support this or want to use any other format, they ca=
n
> > set the desired format with s_fmt.
> >

I guess general clients are unlikely to support this format as it is
an opaque intermediate format used by Qualcomm platforms, and the
purpose of that format is to be used for other Qualcomm hardware
blocks that know about this format. So I'd say that returning by
default a more common format is more reliable. Using your argument if
someone wants to use QC08C (because he knows it can use it) set with
s_fmt will do the trick too.

In any case, the problem here seems to be that s_fmt is not working,
so it would be nice to have a solution for that first and meanwhile do
not change the old behaviour. Just my two cents.

Best regards,
 Enric Balletbo

>
> VIDIOC_S_FMT is currently broken for venus, at least on the HP X2
> Chromebook and only the default works. I'm still investigating why
> vdec_s_fmt() is not working.
>
> But basically, if VIDIOC_S_FMT is called for the capture queue,
> then later the VIDIOC_G_FMT ioctl fails with -EINVAL. This is due
> the following condition checked in vdec_check_src_change():
>
> static int vdec_check_src_change(struct venus_inst *inst)
> {
> ...
>         if (inst->subscriptions & V4L2_EVENT_SOURCE_CHANGE &&
>             inst->codec_state =3D=3D VENUS_DEC_STATE_INIT &&
>             !inst->reconfig)
>                 return -EINVAL;
> ...
> }
>
> But regardless, I think that it would be better for a driver to
> not change the order of advertised VIDIOC_ENUM_FMT pixel formats.
>
> Because what happens now is that a decoding that was previously
> working by default is not working anymore due a combination of
> the default being changed and S_FMT not working as expected.
>
> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>

