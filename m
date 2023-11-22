Return-Path: <linux-arm-msm+bounces-1563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 682687F4F98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 19:33:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B21E1C209DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 18:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7505C064;
	Wed, 22 Nov 2023 18:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e4c0/WPH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6676FD42
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 10:32:55 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5cc60973b4aso487657b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 10:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700677974; x=1701282774; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9evLgerhPexVHQkBogiwmvf7m2BOF4vHI4aXwGPPVJ4=;
        b=e4c0/WPHhHx2qk/e0qrW7JxnvxGiVMuQqy3J9XJQ2dFhrl+rnkFNggaPrHacb/iE0x
         PO5hdzFfVbl3ZENEK2jrnV0ABP+ZrA0eKMnj30PPc4OD2C/ZjXB0LyJ+oFik+PP0Aqld
         ecVRx2uek9QTzA32qUQuF1U37Rzz7nJm9NMRdynvlaDr4RktqLsqzVVQ88U2R+lNZgM9
         CA4CvFd0KWSp2Udo5QNzN4wxRMtbsG1p/mbi/Dx/7rURAI+tMKWoMUE6JbjuxxkT0nfW
         topLBDAK4h0dPg+/M8nsmBhOLEWXIib0lS+f7gIZ52jTVueweDC2cYCv1qdsQcfvryNY
         TkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677974; x=1701282774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9evLgerhPexVHQkBogiwmvf7m2BOF4vHI4aXwGPPVJ4=;
        b=Vh24w1EjkGeP9uPooMo8GZTlXjMRaiE97xlBseGqU37x1UD/vKgKL8Bh0bPMlHfKl+
         KDRE/MLI/FbfEL0DvvAkkOfPGE3dxa3x1X9P99xPW5S+UtWr1L5P259aZMgN4LqlbRCs
         qwV1lZhRvmYOBDVOFyxyjg+LyrJ31JGlKhsuNBr6YQtL61nFx4yIncQfnktdk5wpZoa9
         ZBVTUHIITHj9B7ZF9NpMOTLeZjsig9HgAP0EWLheme35R7iLruFNY4Qe2eMFYyI4c/ER
         DYcbVDegnMoucmRPHpRCYBfsL+ieP/lLUDaXyHWJF68Abd/CjQ/kk0ZMQWMjp828GQqD
         zLiw==
X-Gm-Message-State: AOJu0YxD6biNbxFxyaZfR8kFTQDIjbX4HxpS9pKvk1BRfHSttutOmoRE
	a7fgxl74D4ekIXthTEIk/VJEnn3I/GxKuTnBv8KfftUQuicZzZvpKmiMqZrT
X-Google-Smtp-Source: AGHT+IHyhJSWiia3K3sWSqzs9R4jjq04Y+WIUYIc2Ttxdvr+Ys8bPby4u0SJWAcMZONs2xz0YHXI4buzX0cWSLoaSkQ=
X-Received: by 2002:a0d:f245:0:b0:5c9:d64e:68c7 with SMTP id
 b66-20020a0df245000000b005c9d64e68c7mr3050822ywf.35.1700677974461; Wed, 22
 Nov 2023 10:32:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org> <7a4a6698-0954-4225-82ff-02dd13bd64bb@linux.dev>
In-Reply-To: <7a4a6698-0954-4225-82ff-02dd13bd64bb@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 Nov 2023 20:32:45 +0200
Message-ID: <CAA8EJpoqfwyVYQy17QAOtrGr1AGzFkpKrOM5_F58=A95PoYncQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] drm: simplify support for transparent DRM bridges
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-phy@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Nov 2023 at 18:03, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Hi,
>
>
> On 2023/11/4 07:03, Dmitry Baryshkov wrote:
> > Supporting DP/USB-C can result in a chain of several transparent
> > bridges (PHY, redrivers, mux, etc). All attempts to implement DP support
> > in a different way resulted either in series of hacks or in device tree
> > not reflecting the actual hardware design. This results in drivers
> > having similar boilerplate code for such bridges.
>
> Please improve the written,  "resulted" -> "yield" ?
>
> > Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
> > bridge can either be probed from the bridge->attach callback, when it is
> > too late to return -EPROBE_DEFER, or from the probe() callback, when the
> > next bridge might not yet be available, because it depends on the
> > resources provided by the probing device. Device links can not fully
> > solve this problem since there are mutual dependencies between adjancent
> > devices.
> >
> > Last, but not least, this results in the the internal knowledge of DRM
>
> There is a duplicated "the" word in this sentence.
>
> As far as I can understand, nearly all of those troubles are because the display bridges
> drivers are designed as a kernel module(.ko) instead of making them as static link-able
> helpers. I means that a display bridge device can not work standalone, as it have to be
> used with a display controller. So a display bridge is just a slave device or a auxiliary
> device. My question is: if it can't works by itself, we probably shouldn't design them as
> kernel modules style. Am I correct?

No. This has nothing to do with the driver being a kernel module or built-in.

>
> > subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.
>
> Yeah, this indeed a problem.
>
> > To solve all these issues, define a separate DRM helper, which creates
> > separate aux device just for the bridge.
>
> I'm supporting you if want to solve all these problems, this is fine and thanks a lot.
> But I want to ask a question, now that you are solving these problems by creating separate
> devices, does this manner match the hardware design perfectly? which is the hardware units
> you newly created device is corresponding to?

Aux devices do not always follow the actual hardware internals. For
example, see the TI sn65dsi86 driver, which also uses aux devices to
split dependency and probing chains.

> > During probe such aux device
> > doesn't result in the EPROBE_DEFER loops. Instead it allows the device
> > drivers to probe properly, according to the actual resource
> > dependencies. The bridge auxdevs are then probed when the next bridge
> > becomes available, sparing drivers from drm_bridge_attach() returning
> > -EPROBE_DEFER.
>
> OK, as far as I can understand,  in order to solve the mentioned problem
> you are also retire the defer probe mechanism.

No, I'm not retiring the probe deferral mechanism. Instead I'm
splitting it into two chains. One going from the controller to the
usb-c connector for the signal flow, another going from the connector
back to the drm_encoder for the drm_bridge dependencies.

>
>
> > Changes since v5:
> >   - Removed extra semicolon in !DRM_AUX_HPD_BRIDGE stubs definition.
> >
> > Changes since v4:
> >   - Added documentation for new API (Sima)
> >   - Added generic code to handle "last mile" DP bridges implementing just
> >     the HPD functionality.
> >   - Rebased on top of linux-next to be able to drop #ifdef's around
> >     drm_bridge->of_node
> >
> > Changes since v3:
> >   - Moved bridge driver to gpu/drm/bridge (Neil Armstrong)
> >   - Renamed it to aux-bridge (since there is already a simple_bridge driver)
> >   - Made CONFIG_OF mandatory for this driver (Neil Armstrong)
> >   - Added missing kfree and ida_free (Dan Carpenter)
> >
> > Changes since v2:
> >   - ifdef'ed bridge->of_node access (LKP)
> >
> > Changes since v1:
> >   - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge
> >
> > Dmitry Baryshkov (6):
> >    drm/bridge: add transparent bridge helper
> >    phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
> >    usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
> >    drm/bridge: implement generic DP HPD bridge
> >    soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
> >    usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE
> >
> >   drivers/gpu/drm/bridge/Kconfig                |  17 ++
> >   drivers/gpu/drm/bridge/Makefile               |   2 +
> >   drivers/gpu/drm/bridge/aux-bridge.c           | 140 +++++++++++++++
> >   drivers/gpu/drm/bridge/aux-hpd-bridge.c       | 164 ++++++++++++++++++
> >   drivers/phy/qualcomm/Kconfig                  |   2 +-
> >   drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |  44 +----
> >   drivers/soc/qcom/Kconfig                      |   1 +
> >   drivers/soc/qcom/pmic_glink_altmode.c         |  33 +---
> >   drivers/usb/typec/mux/Kconfig                 |   2 +-
> >   drivers/usb/typec/mux/nb7vpq904m.c            |  44 +----
> >   drivers/usb/typec/tcpm/Kconfig                |   1 +
> >   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c |  41 +----
> >   include/drm/bridge/aux-bridge.h               |  37 ++++
> >   13 files changed, 383 insertions(+), 145 deletions(-)
> >   create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
> >   create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.c
> >   create mode 100644 include/drm/bridge/aux-bridge.h
> >



-- 
With best wishes
Dmitry

