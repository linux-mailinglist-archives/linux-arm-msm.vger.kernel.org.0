Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4EDC5BD8A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 16:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729179AbfGAODe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 10:03:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:36232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727031AbfGAODe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 10:03:34 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 381CE2175B;
        Mon,  1 Jul 2019 14:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561989813;
        bh=T2w/j8sYKdqu+6ydzrypjQS9JVeaNU+szoI9ecA6Qvw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=r4pN9Zh75V00tchT8/xeABJC+L4MWPT1MZxTHZGEWDk2wcRsBdcXAwSDWisLoSTNI
         1VgJ5sax1mLkviCHWwO/rLIep7TekqS6eWtrl/URRYivEc7ViMfsKkIswa/TRjs494
         IKgcJMbLBIr3w9aBduRa2S/eDEAD4MsMY8QFkyFw=
Received: by mail-qt1-f176.google.com with SMTP id h21so14696904qtn.13;
        Mon, 01 Jul 2019 07:03:33 -0700 (PDT)
X-Gm-Message-State: APjAAAWk8ztL2Zb2ktTdsO4ETipED5CHLW16g4rNTm5TtpYjaIweMTBy
        b/g+yf0/FHhOy+sQ+8zzO8QEHDyYXYj/0wzwAg==
X-Google-Smtp-Source: APXvYqxIe3KvpivdXVekQQyi1JMul6lzbVRgVZQlo8hDS8fSl7EpRCjBjbxVicvn9Xjlwji3WRPz4NFznBekQ59zdyY=
X-Received: by 2002:aed:3f10:: with SMTP id p16mr20698288qtf.110.1561989812384;
 Mon, 01 Jul 2019 07:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190630203614.5290-1-robdclark@gmail.com> <20190630203614.5290-2-robdclark@gmail.com>
In-Reply-To: <20190630203614.5290-2-robdclark@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 1 Jul 2019 08:03:20 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKMULJJ9CERRBpqd7Y2dtovEJ6jcDKy6J4yR6rAdjibUg@mail.gmail.com>
Message-ID: <CAL_JsqKMULJJ9CERRBpqd7Y2dtovEJ6jcDKy6J4yR6rAdjibUg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: chosen: document panel-id binding
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 30, 2019 at 2:36 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The panel-id property in chosen can be used to communicate which panel,
> of multiple possibilities, is installed.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  Documentation/devicetree/bindings/chosen.txt | 69 ++++++++++++++++++++
>  1 file changed, 69 insertions(+)

I need to update this file to say it's moved to the schema repository...

But I don't think that will matter...

> diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
> index 45e79172a646..d502e6489b8b 100644
> --- a/Documentation/devicetree/bindings/chosen.txt
> +++ b/Documentation/devicetree/bindings/chosen.txt
> @@ -68,6 +68,75 @@ on PowerPC "stdout" if "stdout-path" is not found.  However, the
>  "linux,stdout-path" and "stdout" properties are deprecated. New platforms
>  should only use the "stdout-path" property.
>
> +panel-id
> +--------
> +
> +For devices that have multiple possible display panels (multi-sourcing the
> +display panels is common on laptops, phones, tablets), this allows the
> +bootloader to communicate which panel is installed, e.g.

How does the bootloader figure out which panel? Why can't the kernel
do the same thing?

> +
> +/ {
> +       chosen {
> +               panel-id = <0xc4>;
> +       };
> +
> +       ivo_panel {
> +               compatible = "ivo,m133nwf4-r0";
> +               power-supply = <&vlcm_3v3>;
> +               no-hpd;
> +
> +               ports {
> +                       port {
> +                               ivo_panel_in_edp: endpoint {
> +                                       remote-endpoint = <&sn65dsi86_out_ivo>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       boe_panel {
> +               compatible = "boe,nv133fhm-n61";

Both panels are going to probe. So the bootloader needs to disable the
not populated panel setting 'status' (or delete the node). If you do
that, do you even need 'panel-id'?

> +               power-supply = <&vlcm_3v3>;
> +               no-hpd;
> +
> +               ports {
> +                       port {
> +                               boe_panel_in_edp: endpoint {
> +                                       remote-endpoint = <&sn65dsi86_out_boe>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       display_or_bridge_device {
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       ...
> +
> +                       port@0 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0>;
> +
> +                               endpoint@c4 {
> +                                       reg = <0xc4>;

What does this number represent? It is supposed to be defined by the
display_or_bridge_device, not a specific panel.

We also need to consider how the DSI case with panels as children of
the DSI controller would work and how this would work with multiple
displays each having multiple panel options.

Rob
