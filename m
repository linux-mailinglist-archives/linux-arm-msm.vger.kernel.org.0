Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC501B39E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2019 14:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731907AbfIPMCb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Sep 2019 08:02:31 -0400
Received: from onstation.org ([52.200.56.107]:41140 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730878AbfIPMCb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Sep 2019 08:02:31 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id E4DA83E8F9;
        Mon, 16 Sep 2019 12:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1568635349;
        bh=eoTNUlu644MNIklCssrNsvr6sIUHd71byT/D9gn4Vj8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U9fS2nuNXlcVY8TaTbIAnY+2sufosKEONRg5Un1snIXLewL5Qp7nM8dN22Tw4muPm
         1e986OyHxZAyvFaUbvBcQ7ofTXA7IE93Nghy6nVXw5o1/Ru6BlGlpGIP0uEny0fqR7
         WZruNn6xwJ9/FyjjP33WT3zxPbdxLz0cOMCVyIa8=
Date:   Mon, 16 Sep 2019 08:02:28 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        narmstrong@baylibre.com, robdclark@gmail.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        jonas@kwiboo.se, jernej.skrabec@siol.net, linus.walleij@linaro.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 05/11] drm/bridge: analogix-anx78xx: correct value of
 TX_P0
Message-ID: <20190916120228.GA3045@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
 <CGME20190815004918epcas3p135042bc52c7e3c8b1aca7624d121af97@epcas3p1.samsung.com>
 <20190815004854.19860-6-masneyb@onstation.org>
 <dc10dd84-72e2-553e-669b-271b77b4a21a@samsung.com>
 <20190916103614.GA1644@onstation.org>
 <20190916104907.GB4734@pendragon.ideasonboard.com>
 <3ec4f0bc-f3c5-aebf-8213-bc4f80915902@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ec4f0bc-f3c5-aebf-8213-bc4f80915902@collabora.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 16, 2019 at 01:32:58PM +0200, Enric Balletbo i Serra wrote:
> Hi,
> 
> On 16/9/19 12:49, Laurent Pinchart wrote:
> > Hi Brian,
> > 
> > On Mon, Sep 16, 2019 at 06:36:14AM -0400, Brian Masney wrote:
> >> On Mon, Sep 16, 2019 at 12:02:09PM +0200, Andrzej Hajda wrote:
> >>> On 15.08.2019 02:48, Brian Masney wrote:
> >>>> When attempting to configure this driver on a Nexus 5 phone (msm8974),
> >>>> setting up the dummy i2c bus for TX_P0 would fail due to an -EBUSY
> >>>> error. The downstream MSM kernel sources [1] shows that the proper value
> >>>> for TX_P0 is 0x78, not 0x70, so correct the value to allow device
> >>>> probing to succeed.
> >>>>
> >>>> [1] https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/drivers/video/slimport/slimport_tx_reg.h
> >>>>
> >>>> Signed-off-by: Brian Masney <masneyb@onstation.org>
> >>>> ---
> >>>>  drivers/gpu/drm/bridge/analogix-anx78xx.h | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.h b/drivers/gpu/drm/bridge/analogix-anx78xx.h
> >>>> index 25e063bcecbc..bc511fc605c9 100644
> >>>> --- a/drivers/gpu/drm/bridge/analogix-anx78xx.h
> >>>> +++ b/drivers/gpu/drm/bridge/analogix-anx78xx.h
> >>>> @@ -6,7 +6,7 @@
> >>>>  #ifndef __ANX78xx_H
> >>>>  #define __ANX78xx_H
> >>>>  
> >>>> -#define TX_P0				0x70
> >>>> +#define TX_P0				0x78
> >>>
> >>>
> >>> This bothers me little. There are no upstream users, grepping android
> >>> sources suggests that both values can be used [1][2]  (grep for "#define
> >>> TX_P0"), moreover there is code suggesting both values can be valid [3].
> >>>
> >>> Could you verify datasheet which i2c slave addresses are valid for this
> >>> chip, if both I guess this patch should be reworked.
> >>>
> >>>
> >>> [1]:
> >>> https://android.googlesource.com/kernel/msm/+/android-msm-flo-3.4-jb-mr2/drivers/misc/slimport_anx7808/slimport_tx_reg.h
> >>>
> >>> [2]:
> >>> https://github.com/AndroidGX/SimpleGX-MM-6.0_H815_20d/blob/master/drivers/video/slimport/anx7812/slimport7812_tx_reg.h
> >>>
> >>> [3]:
> >>> https://github.com/commaai/android_kernel_leeco_msm8996/blob/master/drivers/video/msm/mdss/dp/slimport_custom_declare.h#L73
> >>
> >> This address is 0x78 on my Nexus 5. Given [3] above it looks like we
> >> need to support both addresses. What do you think about moving these
> >> addresses into device tree?
> > 
> > Assuming that the device supports different addresses (I can't validate
> > that as I don't have access to the datasheet), and different addresses
> > need to be used on different systems, then the address to be used needs
> > to be provided by the firmware (DT in this case). Two options are
> > possible, either specifying the address explicitly in the device's DT
> > node, or specifying free addresses (in the form of a white list or black
> > list) and allocating an address from that pool. The latter has been
> > discussed in a BoF at the Linux Plumbers Conference last week,
> > https://linuxplumbersconf.org/event/4/contributions/542/.
> > 
> >> The downstream and upstream kernel sources divide these addresses by two
> >> to get the i2c address. Here's the code in upstream:
> >>
> >> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/analogix-anx78xx.c#L1353
> >> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/analogix-anx78xx.c#L41
> >>
> >> I'm not sure why the actual i2c address isn't used in this code.
> > 
> 
> The ANX7802/12/14/16 has a slave I2C bus that provides the interface to access
> or control the chip from the AP. The I2C slave addresses used to control the
> ANX7802/12/14/16 are 70h, 72h, 7Ah, 7Eh and 80h. Every address allows you to
> access to different registers of the chip and AFAICS is not configurable.
> 
> I don't think these addresses should be configured via DT but for the driver itself.
> 
> My wild guess is that the ANX7808 has different addresses, but I don't have the
> datasheet of this version.

I'm able to communicate with the 7808 on my Nexus 5 using the 0x78
address. Given that the addresses appear to be fixed per model, maybe it
makes sense to drop the address #defines and add the addresses to the
data pointer in the driver's of_match_table like so:

static const struct of_device_id anx78xx_match_table[] = {
        { .compatible = "analogix,anx7808", .data = PTR_TO_7808_ADDRS },
        { .compatible = "analogix,anx7812", .data = PTR_TO_781X_ADDRS },
        { .compatible = "analogix,anx7814", .data = PTR_TO_781X_ADDRS },
        { .compatible = "analogix,anx7818", .data = PTR_TO_781X_ADDRS },
        { /* sentinel */ },
};

Brian
