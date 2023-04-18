Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB72A6E6DAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Apr 2023 22:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232773AbjDRUsb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Apr 2023 16:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232758AbjDRUsa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Apr 2023 16:48:30 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABADEF0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 13:48:29 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1a5197f00e9so25662275ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 13:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681850909; x=1684442909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcTCjbZ7nBWt2PlzVkmPNGHNdIxrM7SInVISomB8raI=;
        b=BPybYlYVir1kU0Ko/AfYMhuH73xGWBGaHaBWTzirTch1Yu1YBlAw8S+xalDUoCD6nc
         2XET1gEZwAi5YuseDUDd4xOb64+BiyRFOV2+WqZjlmCYdn9iOptn8fvjqM3ts/iTVN6X
         LbpQBhX8SSkBdPpphAzgs1TyENFzrqI28FkcOJlSwe03OeLtwclb194bRtDvifklIvB8
         d20Gl6TY+jQ1f4s53DlmFY9uXO845TXByaDN1Drt9cLAU5GXS3TL9WTtpmw7+/kwpwxz
         nDr3YTFFpEvSxiYtZsJF9cy7bq5liarV5FLbGJCrdBOaYDPhRldftRv2cwaJo03z8Lhg
         dw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681850909; x=1684442909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcTCjbZ7nBWt2PlzVkmPNGHNdIxrM7SInVISomB8raI=;
        b=BOXMoUSt28WN23JAHUlzNfmq2bYVB7w58+1G1NNYVLnmY80oieC3d/g0J1TStl4qOr
         eXbRRu7zAeFolONSEJFFMzpNWOEC2RycDt6B/aGXwSOfdcPhCz8o4Da0svdNCnIEuC2n
         D1Id6DLRW5Dkcj63L3Q4BLLTkbU7VJ9my/6LrS2uT2mdBImpxVPHhEF+gqdNObkEjWKn
         xX8PlIdQbzyM5LZccCPBmoXZc/7NXLJS3WJ0Mmc14yR+GzFAbfhDXWpwue9QzVpU5hd/
         1Pb1AgqdigUJQeapRxHEQs4lLN43fvHgiLXmPQSpAU86SMaeznnM5wHAgTgBaQfK79en
         EduQ==
X-Gm-Message-State: AAQBX9d4DMJniK4GknUNd5vpoEamKR4geJIOrMdcZbsUt8+Hj0B1/5hh
        OQ+IS4pJTJv0iswNlM66yjNI9SEVIf/CGuZd4ddjXg==
X-Google-Smtp-Source: AKy350YaI6gJH0+K/ZzQQNy+aKyoer6ZKZEPUfakQp1y1BPvig9WjvIP6y+WfAr9MA7i/gVZo/V8cT5cRZ/lD6GfB84=
X-Received: by 2002:a17:902:d511:b0:19e:ad18:da5c with SMTP id
 b17-20020a170902d51100b0019ead18da5cmr3934317plg.37.1681850909011; Tue, 18
 Apr 2023 13:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230418192046.3235870-1-trix@redhat.com> <fe7da2c1-904e-ee4f-9a6c-443049c214b7@quicinc.com>
In-Reply-To: <fe7da2c1-904e-ee4f-9a6c-443049c214b7@quicinc.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 18 Apr 2023 13:48:17 -0700
Message-ID: <CAKwvOdmFGVPddi98yt22i+U+3aow+dwhxKgdJ45h3n1i-n3bzw@mail.gmail.com>
Subject: Re: [PATCH] accel/qaic: initialize ret variable to 0
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Tom Rix <trix@redhat.com>, ogabbay@kernel.org, nathan@kernel.org,
        jacek.lawrynowicz@linux.intel.com, quic_carlv@quicinc.com,
        stanislaw.gruszka@linux.intel.com, quic_pkanojiy@quicinc.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 18, 2023 at 1:46=E2=80=AFPM Jeffrey Hugo <quic_jhugo@quicinc.co=
m> wrote:
>
> On 4/18/2023 1:20 PM, Tom Rix wrote:
> > clang static analysis reports
> > drivers/accel/qaic/qaic_data.c:610:2: warning: Undefined or garbage
> >    value returned to caller [core.uninitialized.UndefReturn]
> >          return ret;
> >          ^~~~~~~~~~
> >
> > The ret variable is only set some of the time but is always returned.
> > So initialize ret to 0.
>
> This does not appear to be entirely accurate to me.
>
> Do you know what analysis Clang is doing?  Is it limited to the function
> itself?
>
> remap_pfn_range, which initializes ret, will always run at-least once.

What happens if the loop body is never executed, say if `bo->sgt->sgl` is N=
ULL?

>
> Feels more accurate to say that Clang cannot detect that ret will be
> initialized, and we want to quiet the warning from the false positive.
>
> > Fixes: ff13be830333 ("accel/qaic: Add datapath")
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > ---
> >   drivers/accel/qaic/qaic_data.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_d=
ata.c
> > index c0a574cd1b35..b46a16fb3080 100644
> > --- a/drivers/accel/qaic/qaic_data.c
> > +++ b/drivers/accel/qaic/qaic_data.c
> > @@ -591,7 +591,7 @@ static int qaic_gem_object_mmap(struct drm_gem_obje=
ct *obj, struct vm_area_struc
> >       struct qaic_bo *bo =3D to_qaic_bo(obj);
> >       unsigned long offset =3D 0;
> >       struct scatterlist *sg;
> > -     int ret;
> > +     int ret =3D 0;
> >
> >       if (obj->import_attach)
> >               return -EINVAL;
>


--=20
Thanks,
~Nick Desaulniers
