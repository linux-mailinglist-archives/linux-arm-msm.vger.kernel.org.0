Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5EF41163DD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2019 22:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbfLHVYM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Dec 2019 16:24:12 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33580 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbfLHVYL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Dec 2019 16:24:11 -0500
Received: by mail-ed1-f68.google.com with SMTP id r21so274486edq.0;
        Sun, 08 Dec 2019 13:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1nk/gKZH1FhHqU9Pe1PbIuJjILmu3krdS2vmCgQ6yeE=;
        b=gCVJyDsjFA5BSxxGpDHN7BBuKg262JZYpJLAB4/sc1vsqnU3VGKRKlnVk+4QvmlnFr
         fXoEx7IpAdg2JzzrCyMgZ0fyD/S7p7fc6oS3mfVafsUE/cwbXxkqnPoiv9hphR89TBBM
         vcmo/6Q0dGS0mN4o6ykQdilIbLfw7jja+EepFumijs7QHoto5a5fHn4TYkRaOHpBEWpK
         64xTC5cRyXMOUb0Kns/rXefwH8IwoUWGPtQ/+D0y+CLSMcDvVTBaFx5hkdDDgX3dmw4y
         YuqcTZ5KIWj3VtxLeLMTccXJWeck2iDarqeE/wFpomB0fmGNnbAUDZpinsRamqgM0CVC
         q9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1nk/gKZH1FhHqU9Pe1PbIuJjILmu3krdS2vmCgQ6yeE=;
        b=PDKOJWNCy/3gQrEhVl+RpleUBT16Q0U04wOyfpYTKa/9Qusf2iuJLc5dKzeJJZFnOs
         T11O70K2FcHCZzcMlDvI7oibEMkevaFMrq58ry4hRN+AnsdUu0AbaXKqCOiiE/Ym0V+K
         1RLatdzIPmPfkLut5E0FUlwWx6AcnFf5xKCaXFnzgfdyKyzI1ivjKHFL7NT840UJjvjy
         JnUUL27ILBSNp6V4mOTppC5xxYi66qP2jrWvmITAyu+JH0+ROPL5CiVHRBiSXWBUGBv7
         N0j0AUiM3W9P3LIpNIB1b3Hp1qwxr+HivD4xJHbRAJ7Up+K3N4jESCgWsj0cFALRGxyS
         SbCg==
X-Gm-Message-State: APjAAAX1xnNYCdOO3SkZYIduMs+VR7MocCyORDhWldalkdEOP64eJJOw
        R3nQs4j18l1P88wReqP/c6Y+f644mfpscS80rqQ=
X-Google-Smtp-Source: APXvYqx73kfdWPrboFUtNODQvA4oqUZOQKE8IoT7QOlBvCEPaDkEwplbpUrC4KMgS7+Jwpf5kzfyBL4PWdanxlxzHxs=
X-Received: by 2002:aa7:c49a:: with SMTP id m26mr29049116edq.264.1575840249055;
 Sun, 08 Dec 2019 13:24:09 -0800 (PST)
MIME-Version: 1.0
References: <20191207203553.286017-1-robdclark@gmail.com> <20191207203553.286017-2-robdclark@gmail.com>
 <20191208144533.GA14311@pendragon.ideasonboard.com> <CAF6AEGurXhm28wJym-5GUiTzT1F96rs==GA2Xu+3_r6+gcB3qQ@mail.gmail.com>
 <20191208182757.GE14311@pendragon.ideasonboard.com>
In-Reply-To: <20191208182757.GE14311@pendragon.ideasonboard.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 8 Dec 2019 13:23:59 -0800
Message-ID: <CAF6AEGsYa0p_6MgO+=gaok5GKkTDeUJYZw0MqiFc7+qUXuNS9A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: document panel-id
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        aarch64-laptops@lists.linaro.org,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Dec 8, 2019 at 10:28 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> On Sun, Dec 08, 2019 at 08:50:32AM -0800, Rob Clark wrote:
> > On Sun, Dec 8, 2019 at 6:45 AM Laurent Pinchart wrote:
> > > On Sat, Dec 07, 2019 at 12:35:50PM -0800, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > For devices that have one of several possible panels installed, the
> > > > panel-id property gives firmware a generic way to locate and enable the
> > > > panel node corresponding to the installed panel.  Example of how to use
> > > > this property:
> > > >
> > > >     ivo_panel {
> > > >         compatible = "ivo,m133nwf4-r0";
> > > >         panel-id = <0xc5>;
> > > >         status = "disabled";
> > > >
> > > >         ports {
> > > >             port {
> > > >                 ivo_panel_in_edp: endpoint {
> > > >                     remote-endpoint = <&sn65dsi86_out_ivo>;
> > > >                 };
> > > >             };
> > > >         };
> > > >     };
> > > >
> > > >     boe_panel {
> > > >         compatible = "boe,nv133fhm-n61";
> > > >         panel-id = <0xc4>;
> > > >         status = "disabled";
> > > >
> > > >         ports {
> > > >             port {
> > > >                 boe_panel_in_edp: endpoint {
> > > >                     remote-endpoint = <&sn65dsi86_out_boe>;
> > > >                 };
> > > >             };
> > > >         };
> > > >     };
> > > >
> > > >     sn65dsi86: bridge@2c {
> > > >         compatible = "ti,sn65dsi86";
> > > >
> > > >         ports {
> > > >             #address-cells = <1>;
> > > >             #size-cells = <0>;
> > > >
> > > >             port@0 {
> > > >                 reg = <0>;
> > > >                 sn65dsi86_in_a: endpoint {
> > > >                     remote-endpoint = <&dsi0_out>;
> > > >                 };
> > > >             };
> > > >
> > > >             port@1 {
> > > >                 reg = <1>;
> > > >
> > > >                 sn65dsi86_out_boe: endpoint@c4 {
> > > >                     remote-endpoint = <&boe_panel_in_edp>;
> > > >                 };
> > > >
> > > >                 sn65dsi86_out_ivo: endpoint@c5 {
> > > >                     remote-endpoint = <&ivo_panel_in_edp>;
> > > >                 };
> > > >             };
> > > >         };
> > > >     };
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > >  .../bindings/display/panel/panel-common.yaml  | 26 +++++++++++++++++++
> > > >  1 file changed, 26 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > > > index ef8d8cdfcede..6113319b91dd 100644
> > > > --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > > > @@ -75,6 +75,32 @@ properties:
> > > >        in the device graph bindings defined in
> > > >        Documentation/devicetree/bindings/graph.txt.
> > > >
> > > > +  panel-id:
> > > > +    description:
> > > > +      To support the case where one of several different panels can be installed
> > > > +      on a device, the panel-id property can be used by the firmware to identify
> > > > +      which panel should have it's status changed to "ok".  This property is not
> > > > +      used by the HLOS itself.
> > >
> > > If your firmware can modify the status property of a panel, it can also
> > > add DT nodes. As discussed before, I don't think this belongs to DT.
> > > Even if panel-id isn't used by the operating system, you have Linux
> > > kernel patches in this series that show that this isn't transparent.
> >
> > I've already explained several times why this is not feasible.  It
> > would require DtbLoader to be familiar with each individual device,
> > and be rev'd every time a new device appears.  That is not practical
> > at all.
> >
> > (And fwiw, the ACPI tables describe each panel.. with an ACPI method
> > that is passed the the panel-id and returns the appropriate table..
> > since DT doesn't have methods, this is the solution.)
> >
> > I stand by this patch, we can't keep running away from this problem
> > and wave the magic firmware wand.
>
> I believe in firmware solutions more than firmware magic wands :-)
>

and with that in mind, I think I've come up with a firmware solution,
in the form of dtb overlays :-)

I've managed to get DtbLoader to find and load a panel overlay based
on the panel-id it reads, which drops all patches in the patchset
except the last one, which now has this delta:

---------
diff --git a/arch/arm64/boot/dts/qcom/Makefile
b/arch/arm64/boot/dts/qcom/Makefile
index 6498a1ec893f..1a61e8da2521 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+subdir-y += panels
 dtb-$(CONFIG_ARCH_QCOM)    += apq8016-sbc.dtb
 dtb-$(CONFIG_ARCH_QCOM)    += apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)    += ipq8074-hk01.dtb
diff --git a/arch/arm64/boot/dts/qcom/panels/Makefile
b/arch/arm64/boot/dts/qcom/panels/Makefile
new file mode 100644
index 000000000000..dbf55f423555
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/panels/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_QCOM) += panel-c4.dtb
+dtb-$(CONFIG_ARCH_QCOM) += panel-c5.dtb
diff --git a/arch/arm64/boot/dts/qcom/panels/panel-c4.dts
b/arch/arm64/boot/dts/qcom/panels/panel-c4.dts
new file mode 100644
index 000000000000..ebcf65419dad
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/panels/panel-c4.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Panel overlay for panel-id 0xc4
+ *
+ * Copyright (c) 2019, Linaro Ltd.
+ */
+
+/dts-v1/;
+/plugin/;
+/ {
+    fragment@0 {
+        target-path = "/panel";
+        __overlay__ {
+            compatible = "boe,nv133fhm-n61";
+        };
+    };
+};
diff --git a/arch/arm64/boot/dts/qcom/panels/panel-c5.dts
b/arch/arm64/boot/dts/qcom/panels/panel-c5.dts
new file mode 100644
index 000000000000..0ad5bb6003e3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/panels/panel-c5.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Panel overlay for panel-id 0xc5
+ *
+ * Copyright (c) 2019, Linaro Ltd.
+ */
+
+/dts-v1/;
+/plugin/;
+/ {
+    fragment@0 {
+        target-path = "/panel";
+        __overlay__ {
+            compatible = "ivo,m133nwf4-r0";
+        };
+    };
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index c35d8099d8eb..92c76afb721c 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -22,11 +22,13 @@
         hsuart0 = &uart6;
     };

+    /*
+     * stub node which defines how panel is connected to bridge, which
+     * will be updated by panel specific overlay
+     */
     panel {
-        compatible = "ivo,m133nwf4-r0";
         power-supply = <&vlcm_3v3>;
         no-hpd;
-
         ports {
             port {
                 panel_in_edp: endpoint {
---------

Side note, try as I might, I couldn't get the 'target = <&phandle>'
approach to work in the overlays, so I ended up going with target-path
instead.  From digging thru the fdt_overlay code, I *think* it is
because I end up w/ an overlay dtb without symbols.  In the end, I
guess target-path works just as well.


BR,
-R
