Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 932B037AE23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 20:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232009AbhEKSNd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 14:13:33 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:51515 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231944AbhEKSNa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 14:13:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620756743; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=DzEJfa/vKLf61btyzX4T5WVRRfcXyjWJ4T0YA1U8UFA=;
 b=X1pEOHRB3RpIFbGuSywTY6U85jFjqkoDl6y2DtWnpciCFFxPsEz8YmXUtLfcnwLxlDL/dF7j
 GhvtIR6gnoQiiIk20e0euCr/CZs7BgfPg7XwgpsCO6FGpbKnA7x05kPEiz3GjSrBSjqSufE9
 yDbXQZGYEBsQIdzq4cwNchP2rMw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 609ac8efd951beb69eddcc17 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 May 2021 18:11:59
 GMT
Sender: rajeevny=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 32615C43149; Tue, 11 May 2021 18:11:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajeevny)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 43309C4338A;
        Tue, 11 May 2021 18:11:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 11 May 2021 23:41:57 +0530
From:   rajeevny@codeaurora.org
To:     Doug Anderson <dianders@chromium.org>
Cc:     Rob Herring <robh@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>, mkrishn@codeaurora.org,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Lyude Paul <lyude@redhat.com>,
        "Lankhorst, Maarten" <maarten.lankhorst@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [v3 1/2] dt-bindings: backlight: add DisplayPort aux backlight
In-Reply-To: <CAD=FV=XW90L6or8NKA-Rjjp3s3fRno1xSkD+X0PA1rTyeKgpMw@mail.gmail.com>
References: <1619416756-3533-1-git-send-email-rajeevny@codeaurora.org>
 <1619416756-3533-2-git-send-email-rajeevny@codeaurora.org>
 <20210429180435.GA1385465@robh.at.kernel.org>
 <CAD=FV=V-kdySH5Pp-Fb-PRYk60Ha_UOTXJHcvMp+uV3P1oo7Uw@mail.gmail.com>
 <78c4bd291bd4a17ae2a1d02d0217de43@codeaurora.org>
 <CAD=FV=XW90L6or8NKA-Rjjp3s3fRno1xSkD+X0PA1rTyeKgpMw@mail.gmail.com>
Message-ID: <c867b2e59e90899e6c1648e06f5f9cd2@codeaurora.org>
X-Sender: rajeevny@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01-05-2021 03:08, Doug Anderson wrote:
> Hi,
> 
> On Fri, Apr 30, 2021 at 8:10 AM <rajeevny@codeaurora.org> wrote:
>> 
>> On 30-04-2021 02:33, Doug Anderson wrote:
>> > Hi,
>> >
>> > On Thu, Apr 29, 2021 at 11:04 AM Rob Herring <robh@kernel.org> wrote:
>> >>
>> >> On Mon, Apr 26, 2021 at 11:29:15AM +0530, Rajeev Nandan wrote:
>> >> > Add bindings for DisplayPort aux backlight driver.
>> >> >
>> >> > Changes in v2:
>> >> > - New
>> >> >
>> >> > Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
>> >> > ---
>> >> >  .../bindings/leds/backlight/dp-aux-backlight.yaml  | 49 ++++++++++++++++++++++
>> >> >  1 file changed, 49 insertions(+)
>> >> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
>> >> >
>> >> > diff --git a/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
>> >> > new file mode 100644
>> >> > index 00000000..0fa8bf0
>> >> > --- /dev/null
>> >> > +++ b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
>> >> > @@ -0,0 +1,49 @@
>> >> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> >> > +%YAML 1.2
>> >> > +---
>> >> > +$id: http://devicetree.org/schemas/leds/backlight/dp-aux-backlight.yaml#
>> >> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> >> > +
>> >> > +title: DisplayPort aux backlight driver bindings
>> >> > +
>> >> > +maintainers:
>> >> > +  - Rajeev Nandan <rajeevny@codeaurora.org>
>> >> > +
>> >> > +description:
>> >> > +  Backlight driver to control the brightness over DisplayPort aux channel.
>> >> > +
>> >> > +allOf:
>> >> > +  - $ref: common.yaml#
>> >> > +
>> >> > +properties:
>> >> > +  compatible:
>> >> > +    const: dp-aux-backlight
>> >> > +
>> >> > +  ddc-i2c-bus:
>> >> > +    $ref: /schemas/types.yaml#/definitions/phandle
>> >> > +    description:
>> >> > +      A phandle to the system I2C controller connected to the DDC bus used
>> >> > +      for the DisplayPort AUX channel.
>> >> > +
>> >> > +  enable-gpios:
>> >> > +    maxItems: 1
>> >> > +    description: GPIO specifier for backlight enable pin.
>> >> > +
>> >> > +  max-brightness: true
>> >> > +
>> >> > +required:
>> >> > +  - compatible
>> >> > +  - ddc-i2c-bus
>> >> > +
>> >> > +additionalProperties: false
>> >> > +
>> >> > +examples:
>> >> > +  - |
>> >> > +    backlight {
>> >> > +        compatible = "dp-aux-backlight";
>> >> > +        ddc-i2c-bus = <&sn65dsi86_bridge>;
>> >> > +        enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
>> >>
>> >> So the DDC bus is connected to a backlight and also a panel? This
>> >> binding is not reflecting the h/w, but rather what you want for some
>> >> driver.
>> >>
>> >> There's only one thing here and that's an eDP panel which supports
>> >> backlight control via DP aux channel. You can figure all that out from
>> >> the panel's compatible and/or reading the EDID.
>> >>
>> >> You might also be interested in this thread:
>> >>
>> >> https://lore.kernel.org/lkml/YIKsDtjcIHGNvW0u@orome.fritz.box/
>> >
>> > I think Rajeev needs to rework everything anyway as per:
>> >
>> > https://lore.kernel.org/r/87zgxl5qar.fsf@intel.com
>> >
>> > ...but you're right that it makes sense not to model the backlight as
>> > a separate node in the device tree. The panel driver can handle
>> > setting up the backlight.
>> >
>> > -Doug
>> 
>> It was not a good idea to create a separate backlight driver and use
>> ddc-i2c-bus to get access to DP aux. I am working to move the code
>> to the panel driver and to utilize the new DRM helper functions
>> (drm_edp_backlight_*) Lyude has added [1].
>> 
>> To use these helper functions, the panel driver should have access to
>> the
>> "struct drm_dp_aux *". The simple-panel has a "ddc-i2c-bus" property
>> to give the panel access to the DDC bus and is currently being used to
>> get the EDID from the panel. Can I use the same ddc bus i2c_adapter to
>> get
>> the "struct drm_dp_aux *"?
>> 
>> As per the suggestion [2], I get the "struct drm_dp_aux *" from the
>> i2c_adapter of ddc bus (maybe I didn't understand the suggestion
>> correctly),
>> and, it turned out, the way I have implemented is not the right way 
>> [3].
>> So, I am afraid to use the same method in the panel driver.
>> 
>> 
>> [1] https://lore.kernel.org/dri-devel/871rb5bcf9.fsf@intel.com/
>> [2] https://www.spinics.net/lists/dri-devel/msg295429.html
>> [3]
>> https://lore.kernel.org/dri-devel/20210426111116.4lc3ekxjugjr3oho@maple.lan/
> 
> So it's definitely up to maintainers, not me. ...but I guess I would
> have expected something like a new property called "ddc-aux-bus". Then
> you'd have to create a new API call called something like
> "of_find_ddc_aux_adapter_by_node()" that would allow you to find it.
> 

To implement the first suggestion, I can think of the following way
to get the "struct drm_dp_aux" in the panel_simple_probe function:

- Create a new panel-simple DT property "ddc-aux-bus", a phandle to the
platform device that implements the AUX channel.

- Create a global list of drm_dp_aux in drm_dp_helper.c. Initialize list 
head
in drm_dp_aux_init(), add the drm_dp_aux onto the list in 
drm_dp_aux_register().
Similarly, remove the drm_dp_aux from list in drm_dp_aux_unregister().

- Create a new function of_drm_find_dp_aux_by_node() to get the expected
drm_dp_aux from this global list.

Please let me know your views on this implementation.

Below is the summary of the changes in drm dp helper:

---

// drm_dp_helper.h

struct drm_dp_aux {
	...
	struct list_head list;
	...
}

// drm_dp_helper.c

static DEFINE_MUTEX(dp_aux_lock);
static LIST_HEAD(dp_aux_list);

static void drm_dp_aux_add(struct drm_dp_aux *aux)
{
     mutex_lock(&dp_aux_lock);
     list_add_tail(&aux->list, &dp_aux_list);
     mutex_unlock(&dp_aux_lock);
}

static void drm_dp_aux_remove(struct drm_dp_aux *aux)
{
     mutex_lock(&dp_aux_lock);
     list_del_init(&aux->list);
     mutex_unlock(&dp_aux_lock);
}

#ifdef CONFIG_OF
struct drm_dp_aux *of_drm_find_dp_aux_by_node(struct device_node *np)
{
     struct drm_dp_aux *aux;
     mutex_lock(&dp_aux_lock);

     list_for_each_entry(aux, &dp_aux_list, list) {
         if (aux->dev->of_node == np) {
             mutex_unlock(&dp_aux_lock);
             return aux;
         }
     }

     mutex_unlock(&dp_aux_lock);
     return NULL;
}
EXPORT_SYMBOL(of_drm_find_dp_aux_by_node);
#endif


int drm_dp_aux_init(struct drm_dp_aux *aux)
{
     INIT_LIST_HEAD(&aux->list);
     ...
}

int drm_dp_aux_register(struct drm_dp_aux *aux)
{
     ...
     drm_dp_aux_add(aux);

     return 0;
}

void drm_dp_aux_unregister(struct drm_dp_aux *aux)
{
     drm_dp_aux_remove(aux);
     ...
}
---

Thanks,
Rajeev

> I guess an alternate way to solve this (I'm not totally sure whether
> it's better or worse) would be to add a function that would walk up
> the chain of parent bridges and ask them for a pointer to the aux bus.
> I definitely haven't thought it all the way through, but I'd imagine
> something like drm_bridge_chain_get_ddc_aux(). This is _probably_
> better than adding the "ddc-aux-bus" property but it assumes that the
> aux bus is provided by one of our parents. Hrm, looking at this
> briefly, though, I'm not sure how to do it. It doesn't seem possible
> to get the parent bridges from the panel structure. Even if you assume
> that your parent is wrapping you with a panel_bridge it still doesn't
> seem possible?
> 
> This probably needs more drm-expertise.
> 
> -Doug
