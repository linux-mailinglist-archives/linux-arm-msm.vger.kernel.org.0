Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6F345BE49
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 16:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbfGAO2t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 10:28:49 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43026 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728145AbfGAO2t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 10:28:49 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E173B6081E; Mon,  1 Jul 2019 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561991327;
        bh=u0R2SfGKnaTI/lQP8v2+57GTBRdtXGY/4LgRzV/KLso=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lrgYOWobMtniBi1gRY3XX4xCP/3y5QrW9TjwxbmT6+6mmAvVzHms16vCvBD+LvjGZ
         m/7hzUw/jlO37dmm6frFNQ1PJOcQyNw66MmRkjcpFIRwSZohUPDTdQrQPcLs5fg0oj
         P4iDNyzZKz6XtnqJG3TYAFzMA4qHdOqWxPdNkCt0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D8DE5601D7;
        Mon,  1 Jul 2019 14:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561991326;
        bh=u0R2SfGKnaTI/lQP8v2+57GTBRdtXGY/4LgRzV/KLso=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SthwBwaeknA166KVZ2VvbXRXvgZYL2ZBCrHJFMYlBnNdrPu9rJwGZbvdTVr5Ry5GG
         2hZsE0rBIHTmGfSBNbM29+qV39K/wY6zGJc5z8kT+wIwXgHlUWmRSrXzGqPGdOgDqP
         AMusXqgHjMVe5jS+0F9Wc0GNwUl0GSGP+Y5hl3qs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D8DE5601D7
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH 1/4] dt-bindings: chosen: document panel-id binding
To:     Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20190630203614.5290-1-robdclark@gmail.com>
 <20190630203614.5290-2-robdclark@gmail.com>
 <CAL_JsqKMULJJ9CERRBpqd7Y2dtovEJ6jcDKy6J4yR6rAdjibUg@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <a8af7d1d-f0f4-ae5c-b06b-5a8ec1debd7e@codeaurora.org>
Date:   Mon, 1 Jul 2019 08:28:45 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKMULJJ9CERRBpqd7Y2dtovEJ6jcDKy6J4yR6rAdjibUg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/1/2019 8:03 AM, Rob Herring wrote:
> On Sun, Jun 30, 2019 at 2:36 PM Rob Clark <robdclark@gmail.com> wrote:
>>
>> From: Rob Clark <robdclark@chromium.org>
>>
>> The panel-id property in chosen can be used to communicate which panel,
>> of multiple possibilities, is installed.
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>>   Documentation/devicetree/bindings/chosen.txt | 69 ++++++++++++++++++++
>>   1 file changed, 69 insertions(+)
> 
> I need to update this file to say it's moved to the schema repository...
> 
> But I don't think that will matter...
> 
>> diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
>> index 45e79172a646..d502e6489b8b 100644
>> --- a/Documentation/devicetree/bindings/chosen.txt
>> +++ b/Documentation/devicetree/bindings/chosen.txt
>> @@ -68,6 +68,75 @@ on PowerPC "stdout" if "stdout-path" is not found.  However, the
>>   "linux,stdout-path" and "stdout" properties are deprecated. New platforms
>>   should only use the "stdout-path" property.
>>
>> +panel-id
>> +--------
>> +
>> +For devices that have multiple possible display panels (multi-sourcing the
>> +display panels is common on laptops, phones, tablets), this allows the
>> +bootloader to communicate which panel is installed, e.g.
> 
> How does the bootloader figure out which panel? Why can't the kernel
> do the same thing?

Its platform specific.  In the devices that Rob Clark seems interested
in, there are multiple mechanisms in place - read a gpio, enable the
DSI and send a specific command to the panel controller asking for its
panel id, or read some efuses.

The efuses may not be accessible by Linux.

The DSI solution is problematic because it causes a chicken and egg
situation where linux needs the DT to probe the DSI driver to query
the panel, in order to edit the DT to probe DSI/panel.

In the systems Rob Clark is interested in, the FW already provides a
specific EFI variable with the panel id encoded in it for HLOS to use
(although this is broken on some of the devices), but this is a
specific vendor's solution.

The FW/bootloader has probably already figured out the panel details
and brought up the display for a boot splash, bios menu, etc.  I'm not
sure it makes a lot of sense to define N mechanisms for linux to
figure out the same across every platform/vendor.

> 
>> +
>> +/ {
>> +       chosen {
>> +               panel-id = <0xc4>;
>> +       };
>> +
>> +       ivo_panel {
>> +               compatible = "ivo,m133nwf4-r0";
>> +               power-supply = <&vlcm_3v3>;
>> +               no-hpd;
>> +
>> +               ports {
>> +                       port {
>> +                               ivo_panel_in_edp: endpoint {
>> +                                       remote-endpoint = <&sn65dsi86_out_ivo>;
>> +                               };
>> +                       };
>> +               };
>> +       };
>> +
>> +       boe_panel {
>> +               compatible = "boe,nv133fhm-n61";
> 
> Both panels are going to probe. So the bootloader needs to disable the
> not populated panel setting 'status' (or delete the node). If you do
> that, do you even need 'panel-id'?
> 
>> +               power-supply = <&vlcm_3v3>;
>> +               no-hpd;
>> +
>> +               ports {
>> +                       port {
>> +                               boe_panel_in_edp: endpoint {
>> +                                       remote-endpoint = <&sn65dsi86_out_boe>;
>> +                               };
>> +                       };
>> +               };
>> +       };
>> +
>> +       display_or_bridge_device {
>> +
>> +               ports {
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       ...
>> +
>> +                       port@0 {
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               reg = <0>;
>> +
>> +                               endpoint@c4 {
>> +                                       reg = <0xc4>;
> 
> What does this number represent? It is supposed to be defined by the
> display_or_bridge_device, not a specific panel.

Its the specific FW/bootloader defined panel id, that matches the
above defined panel-id property.

> 
> We also need to consider how the DSI case with panels as children of
> the DSI controller would work and how this would work with multiple
> displays each having multiple panel options.
> 
> Rob
> 


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
