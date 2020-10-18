Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 535F8291764
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Oct 2020 14:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgJRMdi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Oct 2020 08:33:38 -0400
Received: from mail-40134.protonmail.ch ([185.70.40.134]:42680 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726159AbgJRMdi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Oct 2020 08:33:38 -0400
Date:   Sun, 18 Oct 2020 12:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1603024416;
        bh=GCCxJzqOnfsVI/hX933byDTiphe1ufjEW2PregmWSLo=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=f+hV804e70VkKoIWRn7lDMgkeqT2qE8ENc6nW6FtprsQ95OUyJzlP0nWidHtODY3t
         2rzpoWw8FEbph1STSYBYkit71a3mtR/Xze3Z7XyeILvONxAqoJBCNyeUaSfRCUz070
         KmqilvG2Lhych3aFR83Oq7sZeDM//DxKss96mhgQ=
To:     Rob Herring <robh@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        ~postmarketos/upstreaming@lists.sr.ht,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 2/5] dt-bindings: panel: add documentation for oneplus6 panel
Message-ID: <3b3f9ede-89ef-26c7-3ade-bf498ea483b8@connolly.tech>
In-Reply-To: <20201009140544.GB4071736@bogus>
References: <20201007174736.292968-1-caleb@connolly.tech> <20201007174736.292968-3-caleb@connolly.tech> <20201009140544.GB4071736@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-09 15:05, Rob Herring wrote:
> On Wed, Oct 07, 2020 at 05:49:14PM +0000, Caleb Connolly wrote:
>> Document the OnePlus 6/T common panel driver, example from
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>>
>> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
>> ---
>>   .../display/panel/panel-oneplus6.yaml         | 73 +++++++++++++++++++
>>   1 file changed, 73 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/panel/pan=
el-oneplus6.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-onepl=
us6.yaml b/Documentation/devicetree/bindings/display/panel/panel-oneplus6.y=
aml
>> new file mode 100644
>> index 000000000000..23ba369cc2f5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/panel-oneplus6.yam=
l
>> @@ -0,0 +1,73 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/panel-oneplus6.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: OnePlus 6/T panel driver
>> +
>> +description: |
>> +  The OnePlus 6 panel driver encompasses the display panels found in th=
e
>> +  OnePlus 6 and 6T devices, the panels have almost identical behaviour =
and
>> +  are not used by any other devices.
>> +
>> +maintainers:
>> +  - Caleb Connolly <caleb@connolly.tech>
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - samsung,sofef00
>> +      - samsung,s6e3fc2x01
>> +
>> +  reg: true
>> +  reset-gpios: true
>> +  port: true
>> +
>> +  vddio-supply:
>> +    description: VDDIO regulator
> A panel with a single supply can use panel-simple-dsi.yaml.
>
> 'reset-gpios' was missing, but has been added recently.
>
> Rob

Thanks, I'll move docs into panel-simple-dsi.yaml

Caleb


