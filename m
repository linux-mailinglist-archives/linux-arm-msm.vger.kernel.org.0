Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68E205BE87
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 16:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbfGAOmL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 10:42:11 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:40238 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728216AbfGAOmL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 10:42:11 -0400
Received: by mail-ed1-f68.google.com with SMTP id k8so23897127eds.7;
        Mon, 01 Jul 2019 07:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aMEPF4h40fCBQU5X2bSodrB4Sj85REfZ6a1YZTaUFX8=;
        b=WLL4A79vwzrdDCLGlTi/VuN6sj453o1tvcQrKIWK9q+JvlFDho5qrrnYYTShgDr0Si
         Q4R6V6qkkUdMgGY9SvdT5Dsnz/fR8x+7TVssOas5nPDGaMXv2jt76NM9BVUt+YGOXERX
         4avkZd4pScP3NIXbzWRb5o3MPInbbYf869dZGRQXljfb1Lp5Hwuw5ncKL6FHveD2hXRB
         rz8UUSlZHliPxujHa+Iu/VKwXwx8lKDV5/e+YMta6KXIy5n3Z71XJENsoEV4V3VnQlVL
         tKM+HRBTJuGjTofnC95X5lqh/30/Jz+e2au+WS1cXlUz6XDSKiZHqLqXO6LgX9vYvCsu
         T4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aMEPF4h40fCBQU5X2bSodrB4Sj85REfZ6a1YZTaUFX8=;
        b=CzkKLeJXooXqswOIgU7JV3Cq4HJc0m2PJ+S1+p9z6EMpaInXpWIIFKZ+aZN/6ivnZ3
         bWL23PtxErimMt+jjotkYYr+CYmXLgFburFPgeCdx0drjRZACJg6LtHB95ifcFuitia4
         e1STkb9DAQ9DwUJZviu1x/QZpZXCUMJkDmZweinpyTDctPRFr2oyJ9GY73lsQ7IGxCd0
         L3SQt7MAlePlRhxK5VBQasuVYjQspDrKuK1q4tHpSdw5jxSLpVuX32NCsaaL+UKL6GUg
         zZv5+plAmf9YkfwOW9QqTzs7NoNA5KAsDsMgkypoZ/fVvqVAx1/6hYe2/TPDf+Z4Nasa
         Q+fQ==
X-Gm-Message-State: APjAAAW77a4S1EJxkLtrbKVcVBmwIlsK0T+Wj4pllSjpdaYWJ6I27uw5
        m6A19pXQnxTiN4R5gRiR0EqSsbf0h4MMKG8ZaVI=
X-Google-Smtp-Source: APXvYqwTSrjwEtJFQ6ycVzgqQyLHlfVSNui04RVBvc84N7j2jrb7J5jnFRbdBQnaiAmon34qOBwM9VBHofWtLVN9Gcc=
X-Received: by 2002:a50:993c:: with SMTP id k57mr29630101edb.294.1561992128852;
 Mon, 01 Jul 2019 07:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190630203614.5290-1-robdclark@gmail.com> <20190630203614.5290-2-robdclark@gmail.com>
 <CAL_JsqKMULJJ9CERRBpqd7Y2dtovEJ6jcDKy6J4yR6rAdjibUg@mail.gmail.com>
In-Reply-To: <CAL_JsqKMULJJ9CERRBpqd7Y2dtovEJ6jcDKy6J4yR6rAdjibUg@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 1 Jul 2019 07:41:52 -0700
Message-ID: <CAF6AEGvRXZAannGisHjsaW4Pg3v2ma5WHK2phqg8TaF53pR8XQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: chosen: document panel-id binding
To:     Rob Herring <robh+dt@kernel.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 1, 2019 at 7:03 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Sun, Jun 30, 2019 at 2:36 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The panel-id property in chosen can be used to communicate which panel,
> > of multiple possibilities, is installed.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/chosen.txt | 69 ++++++++++++++++++++
> >  1 file changed, 69 insertions(+)
>
> I need to update this file to say it's moved to the schema repository...
>
> But I don't think that will matter...
>
> > diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
> > index 45e79172a646..d502e6489b8b 100644
> > --- a/Documentation/devicetree/bindings/chosen.txt
> > +++ b/Documentation/devicetree/bindings/chosen.txt
> > @@ -68,6 +68,75 @@ on PowerPC "stdout" if "stdout-path" is not found.  However, the
> >  "linux,stdout-path" and "stdout" properties are deprecated. New platforms
> >  should only use the "stdout-path" property.
> >
> > +panel-id
> > +--------
> > +
> > +For devices that have multiple possible display panels (multi-sourcing the
> > +display panels is common on laptops, phones, tablets), this allows the
> > +bootloader to communicate which panel is installed, e.g.
>
> How does the bootloader figure out which panel? Why can't the kernel
> do the same thing?

see jhugo's response, he has I guess more access to the bootloader than I

> > +
> > +/ {
> > +       chosen {
> > +               panel-id = <0xc4>;
> > +       };
> > +
> > +       ivo_panel {
> > +               compatible = "ivo,m133nwf4-r0";
> > +               power-supply = <&vlcm_3v3>;
> > +               no-hpd;
> > +
> > +               ports {
> > +                       port {
> > +                               ivo_panel_in_edp: endpoint {
> > +                                       remote-endpoint = <&sn65dsi86_out_ivo>;
> > +                               };
> > +                       };
> > +               };
> > +       };
> > +
> > +       boe_panel {
> > +               compatible = "boe,nv133fhm-n61";
>
> Both panels are going to probe. So the bootloader needs to disable the
> not populated panel setting 'status' (or delete the node). If you do
> that, do you even need 'panel-id'?

I don't think we can rely on bootloader knowing a thing about DT on
these devices..

OTOH I don't really think it is a big problem for both panels to
probe.  But I suppose it might be possible to have something somewhere
in the kernel that realizes and disables the unused panels.

> > +               power-supply = <&vlcm_3v3>;
> > +               no-hpd;
> > +
> > +               ports {
> > +                       port {
> > +                               boe_panel_in_edp: endpoint {
> > +                                       remote-endpoint = <&sn65dsi86_out_boe>;
> > +                               };
> > +                       };
> > +               };
> > +       };
> > +
> > +       display_or_bridge_device {
> > +
> > +               ports {
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +
> > +                       ...
> > +
> > +                       port@0 {
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +                               reg = <0>;
> > +
> > +                               endpoint@c4 {
> > +                                       reg = <0xc4>;
>
> What does this number represent? It is supposed to be defined by the
> display_or_bridge_device, not a specific panel.

it matches /chosen/panel-id.. in this case I'm not sure how the
panel-id's are assigned, but for our purposes all that matters is that
they are assigned.

> We also need to consider how the DSI case with panels as children of
> the DSI controller would work and how this would work with multiple
> displays each having multiple panel options.

In the non-bridge case (panel hooked directly to dsi controller), the
dsi controller could use the same ports {} mechanism.

For multiple displays, we could extend, I suppose, /chosen/panel-id to
be an array of id's indexed by display.  I think this is the type of
extension we could do later when the use-case comes up.  Just having
this solved upstream for single display would already be a huge
advancement.  (You don't want to look at how this is solved downstream
for android phones.)

Btw, if you are curious how this works on windows/ACPI, the ACPI
tables have entries for each of the panels.  The kernel is expected to
take the panel-id from that EFI variable that jhugo mentioned, and
pass it to a _ROM method which returns the appropriate panel table.
(Not entirely sure how the orchestrate reading the EFI variable early,
since it does not appear to be available after ExitBootServices)

BR,
-R
