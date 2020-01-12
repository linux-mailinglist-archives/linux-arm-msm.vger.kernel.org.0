Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 167701387F2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2020 20:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733201AbgALTgv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Jan 2020 14:36:51 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43027 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733146AbgALTgv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Jan 2020 14:36:51 -0500
Received: by mail-ed1-f67.google.com with SMTP id dc19so6598777edb.10;
        Sun, 12 Jan 2020 11:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2aCgGAHsmpPiDsI7trI6K+Ww2+Ja2/dxdFxLqxWkQx0=;
        b=r2dCEqzsrhxk3FPYXVH8+9S25XABFhYimFIGqwl2yYBHJWhvyY+tprWSnDvDZlQWuc
         TG3E5ATa1lzi1VxtdCbhp15sIpMgWfjF+uSfQdxSsjgHIXLzCu+PEqW2R9wbyKNTGE7F
         bTBSidsRL88hMuNf75mFto9WLULI3pBShkLD8EBBC1eNlOZaYTbfvWOLL8dQpaw0FXys
         T9sCrnQA9AeyizDYdasBNHIgVUdeSvz5TQCLUQ7pl2AZLuFbUTtCMpSdfupaR7dRcemv
         Pk6zUUKj/InhpXAnVm0ErBTF9Lvnh4ZuF0R0ECZADdD8eaaBMeJl+ODFna52ODfNH7EV
         HqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2aCgGAHsmpPiDsI7trI6K+Ww2+Ja2/dxdFxLqxWkQx0=;
        b=e8QYgOov77h/xzhy7hiQxncZulHgGfYIWam3OfxIjMlhAtmKSFsLJv7qQDveJbigJ9
         13r4nJM2S3WHC/4SrNryUe9KstUnA5Naiwl9ehIR1TQIPkbyZvsnajBDWYI19t1XdUvp
         DlXUI7Zxyz41ff2fydikKQ1oiPoIap74HOiHBXdMFP+J5y+/6qj14/I9hMpIR0tb1GuQ
         R9GL4hczl5tRt+STga6bZywlaFw6N6KGewUsSjIdgS3AzakTLYb4C9oTeUq9VjgWtyHB
         B6GKbrpCb+IOH7LGxPKY/MQlgE5ktQB7jhbaRUlCO0gcn7YxGlxNLsGAj4OJ0sRrGhrp
         1YtA==
X-Gm-Message-State: APjAAAV7w6qAD1op8EjGec7CAljuA3KUx2Aj4oziTC8mPwjb+lBGikQX
        3rEf/cziMyWMvzOqf33ZMLcczU+qMqpbG9rT+EE=
X-Google-Smtp-Source: APXvYqxfpc4WZmwMOUhRUzssy8Rba2fcFBg3p4r2GJeMannK10uLlFzVxrMktZs94M9toNiBP14FJc16JaJ+wG6de8E=
X-Received: by 2002:aa7:da18:: with SMTP id r24mr13588531eds.111.1578857808753;
 Sun, 12 Jan 2020 11:36:48 -0800 (PST)
MIME-Version: 1.0
References: <20200108013847.899170-1-robdclark@gmail.com> <20200108013847.899170-2-robdclark@gmail.com>
 <37d0baaa-3f94-9414-88e7-7e849b0c5de5@redhat.com> <CAF6AEGseE9iV1xDd1_hRDiKp0-a1usk+xqnyyqbuphwsvLTZmQ@mail.gmail.com>
In-Reply-To: <CAF6AEGseE9iV1xDd1_hRDiKp0-a1usk+xqnyyqbuphwsvLTZmQ@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 12 Jan 2020 11:36:37 -0800
Message-ID: <CAF6AEGsrLKVKgLQW=-gqEsxdds6F-eaMzGq2cgjkXGYbBQ4yWA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm: support firmware-name for zap fw
To:     Tom Rix <trix@redhat.com>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Brian Masney <masneyb@onstation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 8, 2020 at 8:30 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, Jan 8, 2020 at 7:38 AM Tom Rix <trix@redhat.com> wrote:
> >
> >
> > On 1/7/20 5:38 PM, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Since zap firmware can be device specific, allow for a firmware-name
> > > property in the zap node to specify which firmware to load, similarly to
> > > the scheme used for dsp/wifi/etc.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 32 ++++++++++++++++++++++---
> > >  1 file changed, 29 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > index 112e8b8a261e..aa8737bd58db 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > @@ -26,6 +26,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
> > >  {
> > >       struct device *dev = &gpu->pdev->dev;
> > >       const struct firmware *fw;
> > > +     const char *signed_fwname = NULL;
> > >       struct device_node *np, *mem_np;
> > >       struct resource r;
> > >       phys_addr_t mem_phys;
> > > @@ -58,8 +59,33 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
> > >
> > >       mem_phys = r.start;
> > >
> > > -     /* Request the MDT file for the firmware */
> > > -     fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> > > +     /*
> > > +      * Check for a firmware-name property.  This is the new scheme
> > > +      * to handle firmware that may be signed with device specific
> > > +      * keys, allowing us to have a different zap fw path for different
> > > +      * devices.
> > > +      *
> > > +      * If the firmware-name property is found, we bypass the
> > > +      * adreno_request_fw() mechanism, because we don't need to handle
> > > +      * the /lib/firmware/qcom/* vs /lib/firmware/* case.
> > > +      *
> > > +      * If the firmware-name property is not found, for backwards
> > > +      * compatibility we fall back to the fwname from the gpulist
> > > +      * table.
> > > +      */
> > > +     of_property_read_string_index(np, "firmware-name", 0, &signed_fwname);
> > > +     if (signed_fwname) {
> > > +             fwname = signed_fwname;
> > > +             ret = request_firmware_direct(&fw, signed_fwname, gpu->dev->dev);
> > > +             if (ret) {
> > > +                     DRM_DEV_ERROR(dev, "could not load signed zap firmware: %d\n", ret);
> > Could adreno_request_fw be called with fwname if request_firmware_direct fails ?
>
>
> *possibly*.. initially I avoided this because the failure mode for
> incorrectly signed firmware was silent and catestrophic.  But Bjorn
> tells me this has been fixed.. in which case we could try and detect
> if it is the incorrect fw.  I need to try some experiments to confirm
> we can detect this case properly.

I've been thinking about fallback to using fwname from the gpulist
table, but I think I don't really like the idea.

The failure mode for not falling back to $firmware/qcom/$fwname is
pretty safe.. you simply don't get gpu accel, but display and
everything else works, so you can boot up far enough to see what the
problem is and fix it.  But the failure mode if, with some device's
scm fw doesn't report incorrectly signed zap fw, is pretty
catastrophic (insta-reboot, which can be hard to debug on phone/laptop
without debug uart).

Since we haven't pushed the test-key signed qcom/sdm835/a630_zap.mbn
to linux-firmware yet, I think this is a good time to make this switch
for a6xx.

For a530 devices, maybe we hold of adding firmware-name to dt until
linux-firmware gains a qcom/msm8996/a530_zap.mbn (which would be a
good time to switch to the packed .mbn instead of split .mdt + .b0*
files).. or just not specify a firmware-name for device using test-key
signed zap and fallback to adreno_request_fw() and the existing path.

Fortunately zap is not used prior to a5xx, so we mainly just need to
care about backwards compat for a530.

BR,
-R

> BR,
> -R
>
> > > +                     fw = ERR_PTR(ret);
> > > +             }
> > > +     } else {
> > > +             /* Request the MDT file for the firmware */
> > > +             fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> > > +     }
> > > +
> > >       if (IS_ERR(fw)) {
> > >               DRM_DEV_ERROR(dev, "Unable to load %s\n", fwname);
> > >               return PTR_ERR(fw);
> > > @@ -95,7 +121,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
> > >        * not.  But since we've already gotten through adreno_request_fw()
> > >        * we know which of the two cases it is:
> > >        */
> > > -     if (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY) {
> > > +     if (signed_fwname || (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY)) {
> > >               ret = qcom_mdt_load(dev, fw, fwname, pasid,
> > >                               mem_region, mem_phys, mem_size, NULL);
> > >       } else {
> >
