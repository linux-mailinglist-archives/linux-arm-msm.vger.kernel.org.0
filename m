Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1FC7DB824
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Oct 2023 11:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232427AbjJ3KeY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Oct 2023 06:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232994AbjJ3Kds (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Oct 2023 06:33:48 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D8210F2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 03:23:09 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5ae143e08b1so37691327b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 03:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698661388; x=1699266188; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jebt5bckX+B2176sB9zNTaXMKYoEbZ2iBaenpGSjZ+E=;
        b=FPKmCB4PpgfxxGpMpjOa05OPK/Z5Ghmgh9fxEH2YndOmsakJJigIahZPAF5Z3a/pil
         gCll5RJLZyQ/4qKEiXrzyrOh8NeAPzy4ruvj4SVdlZ6uEV89uljw2yO6VNkrltWKCTWk
         2kRZOweHY1b0fItkXrGBE9bHQikimS4KjYqdFdzrfh+SFLLr05XZAOGM1uapgHnm+zSr
         N/6l7qSz9wF7qWDYyQxeNCP2d+EWHKX/IAUkDZPD9hMpGRAwFff5w/M6f4I0hIB9ikVn
         BEOE3oJnll5rxQ1V9SofefZu+y7wC+/irxQd5g4Bk6pHevKFNdBZCykOxXBAPORM5WgU
         SPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698661388; x=1699266188;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jebt5bckX+B2176sB9zNTaXMKYoEbZ2iBaenpGSjZ+E=;
        b=qYO2Ph3gOPg7wXyBR+2lf0kqB2uVh14PzRbyIyWCDUzjaqd6gA7hvPG2kgjxoGY5EZ
         uUAU7TCxGngov5QMVvqU1WB6P44gU8yPQthwY+GWYuIKTVYujRzw6lduL13+0PtqtC0B
         1SBYXFGSjKlZFRsr6TzDpsj09PwDyt92Z67nJz+raXkHJmb2HFCUxHPYt0UTnPHkDPsI
         t4oI0G0AkUJrQ3+Iltt3DrO26qbmEXFquz1e2JVaa+s8SI986+aD9ZIlGpXIKtwSWSAD
         iJIMiT0YMSTDycgxhnT/oXqYxmI8Z2V8zb8+p0+XRtTP/SzyqK/p/amUXR/wPHz8UUUJ
         N3SA==
X-Gm-Message-State: AOJu0YwHskD+l9RA8Z3WovZ5xE7sUajE7IjQiNgELNDJj/aAIUPEHrm0
        4F8wBjGw873YF/0VECN6vB5XyvHc5WJNDAIY6OLxHQ==
X-Google-Smtp-Source: AGHT+IHlAH4Sg9/veOZSRdyHUAM1K+S3C489qatOqvlthapQi4a2Dt+7roSBEUvmYAT2ttletH4dNwkuiDTa2QQ3w7w=
X-Received: by 2002:a81:ad49:0:b0:59b:ec85:54ee with SMTP id
 l9-20020a81ad49000000b0059bec8554eemr10394542ywk.39.1698661388336; Mon, 30
 Oct 2023 03:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-13-dmitry.baryshkov@linaro.org> <ZQRKq7K8jKlH/Y4X@kuha.fi.intel.com>
 <0F1BE090-92C4-4233-A77A-9B4C653DA1A7@linaro.org> <ZT9m/OoFUiZaWy9s@kuha.fi.intel.com>
 <CAA8EJprgpfh_GOeV+557YHWUJC-9W1Tw7nzb0jy5mPAv35VuGA@mail.gmail.com> <B8P9onfq9cXaSM_GbX3N_PSdo19FY_donmDWeAwLGlrrRvclqNcOA2LCGBnVYuJtAlJJFanedJL6GygtJHDS6WP5twzb-L7VJYnmqyFXZtk=@emersion.fr>
In-Reply-To: <B8P9onfq9cXaSM_GbX3N_PSdo19FY_donmDWeAwLGlrrRvclqNcOA2LCGBnVYuJtAlJJFanedJL6GygtJHDS6WP5twzb-L7VJYnmqyFXZtk=@emersion.fr>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 30 Oct 2023 12:22:57 +0200
Message-ID: <CAA8EJpoWuRw_eDSEL=khDoXrS1GctxJzXhdMy9iLb5PDG-=Vfg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 12/12] usb: typec: qcom: define the bridge's path
To:     Simon Ser <contact@emersion.fr>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Janne Grunau <j@jannau.net>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 30 Oct 2023 at 12:13, Simon Ser <contact@emersion.fr> wrote:
>
> On Monday, October 30th, 2023 at 10:47, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>
> > On Mon, 30 Oct 2023 at 10:19, Heikki Krogerus
> > heikki.krogerus@linux.intel.com wrote:
> >
> > > On Mon, Oct 23, 2023 at 09:24:33PM +0300, Dmitry Baryshkov wrote:
> > >
> > > > On 15 September 2023 15:14:35 EEST, Heikki Krogerus heikki.krogerus@linux.intel.com wrote:
> > > >
> > > > > Hi Dmitry,
> > > > >
> > > > > On Mon, Sep 04, 2023 at 12:41:50AM +0300, Dmitry Baryshkov wrote:
> > > > >
> > > > > > In order to notify the userspace about the DRM connector's USB-C port,
> > > > > > export the corresponding port's name as the bridge's path field.
> > > > > >
> > > > > > Signed-off-by: Dmitry Baryshkov dmitry.baryshkov@linaro.org
> > > > > > ---
> > > > > > drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 11 +++++++----
> > > > > > drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c | 4 +++-
> > > > > > drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h | 6 ++++--
> > > > > > 3 files changed, 14 insertions(+), 7 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> > > > > > index b9d4856101c7..452dc6437861 100644
> > > > > > --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> > > > > > +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> > > > > > @@ -156,6 +156,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
> > > > > > struct device_node *np = dev->of_node;
> > > > > > const struct pmic_typec_resources *res;
> > > > > > struct regmap *regmap;
> > > > > > + char *tcpm_name;
> > > > > > u32 base[2];
> > > > > > int ret;
> > > > > >
> > > > > > @@ -211,10 +212,6 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
> > > > > > mutex_init(&tcpm->lock);
> > > > > > platform_set_drvdata(pdev, tcpm);
> > > > > >
> > > > > > - tcpm->pmic_typec_drm = qcom_pmic_typec_init_drm(dev);
> > > > > > - if (IS_ERR(tcpm->pmic_typec_drm))
> > > > > > - return PTR_ERR(tcpm->pmic_typec_drm);
> > > > > > -
> > > > > > tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
> > > > > > if (!tcpm->tcpc.fwnode)
> > > > > > return -EINVAL;
> > > > > > @@ -225,6 +222,12 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
> > > > > > goto fwnode_remove;
> > > > > > }
> > > > > >
> > > > > > + tcpm_name = tcpm_port_get_name(tcpm->tcpm_port);
> > > > > > + tcpm->pmic_typec_drm = qcom_pmic_typec_init_drm(dev, tcpm_name);
> > > > >
> > > > > So I got some questions and concerns off-list. This was one of the
> > > > > concerns. That tcpm_name is now the actual port device name, so I'm
> > > > > afraid this is not acceptable.
> > > > >
> > > > > You can't use device name as a reference, ever. There is no way to
> > > > > guarantee that a device with a specific name is what you meant it to
> > > > > be by the time it's accessed.
> > > >
> > > > Hmm, could you please be more specific, why? I mean, class devices are not
> > > > that easy to be renamed in sysfs, are they? Or are you concerned about the
> > > > device being destroyed behind userspace's back? At least for MSM this will be
> > > > a huge problem already, with the bridge driver suddenly being removed.
> > >
> > > The race exists even in your case, but please do not look at this as a
> > > solution for only your platform.
> >
> > Yes!
> >
> > > This is about showing the user space a link between two device
> > > instances (struct device), and the way you do that is by creating a
> > > symlink. That way the kernel can take care of reference counting and
> > > guarantee that the link always points to the correct device. That way
> > > the link will also be always visible in user space without requirement
> > > for any specific ABI like it should.
> >
> > I'm fine with the symlink approach (and I'll follow that up after
> > finishing the UCSI glue driver rework). However I feel several
> > deficiencies there:
> >
> > 1) It creates asymmetry with the DP MST case. Do we want to have
> > symlinks in each of the MST connectors? Or do we follow the PATH
> > properties in the MST case until we find the root port, which has
> > symlink? Please note, that fine X11 renames DP MST connectors
> > internally, so in xrandr I see DP-2-1, which maps to
> > /sys/class/drm/card0-DP-2. Kind of hard to follow.
> >
> > 2) For the multi-card cases, one has to remap the connector to the
> > card index + connector path. And this needs to be done by all user
> > space applications, which would like to present this kind of
> > information for the user.
> >
> > 3) If we were to support non-USB-C connectors (e.g. MyDP / SlimPort
> > and MHL used simple micro-USB connectors) there would be a completely
> > new uABI. And any external port / wrapper will also require a
> > completely new symlink kind.
> >
> > I understand your concerns regarding mentioning external device in the
> > PATH property. However I think we should make it easier for the
> > userspace app to determine the kind of the external connector. What
> > would you think about extending the PATH property in the following
> > way:
> >
> > For the USB-C connectors the PATH property has the value of
> > `typec:cardN-DP-m` value. Userspace app can then look for the
> > typec_connector symlink at the /sys/class/drm/cardN-DP-m subdir to
> > find the information about the corresponding USB-C port.
>
> This doesn't make sense to me. "cardN-DP-m" has nothing to do with the
> physical path of the connector. All of the parts of this string are
> exposed elsewhere in the KMS uAPI already.

True. It seems I mixed KMS and xrandr clients in my head.
Just 'typec:' then? This way userspace will still know that it is a
USB-C connector (and can stop there) and if it needs more information
(e.g. physical location) it can further look for the symlink in the
sysfs.

>
> > In future this will allow us to define e.g.:
> >
> > For the SlimPort / MyDP the PATH property has the value of
> > `micro_usb:cardN-HDMI-m` or `micro_usb:cardN-DP-m`. The symlink is
> > called /sys/class/drm/cardN-DP-m/micro_usb_connector.
> >
> > Or:
> >
> > For the SlimPort / MyDP the PATH property has the value of
> > `mydp:cardN-HDMI-m` or `mydp:cardN-DP-m`. The symlink is called
> > /sys/class/drm/cardN-DP-m/mydp_connector.
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
