Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A41EB17E7B8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 20:01:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbgCITBG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 15:01:06 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:39048 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbgCITBF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 15:01:05 -0400
Received: by mail-pj1-f66.google.com with SMTP id d8so291944pje.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 12:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=vlwqcKTAzq+tnews6JZmD9exPu8HmU2dnVIUxFyHgnU=;
        b=D0ZkahO1wynqPGY55sNCGoG0peiJ8j4nO/0C6g+hf9C4UnZp478yFslg/fitmtiVD5
         LPAHpOrV6mOIZqUA57C4QgVZvB7xIohv2jSOsNGBzIZJVr/eElHEYyyKJjtq4XUblYNx
         sR0ojQX7gfHwLsFgA3yFU/YcsiwyLiExJt6jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=vlwqcKTAzq+tnews6JZmD9exPu8HmU2dnVIUxFyHgnU=;
        b=clFRWqOTxWnxWdN9mOvVvbydD2m0OObvUdnhS9FVtH8B1wbks0MGNt1w4/S08J0rPe
         SMzw57eel2dg9GVxerMLFAoM2RnrfRcMNy3I2VjoGSWYAfNLxf0KEXdOR+/zBlom5Ebg
         1IHvwAuLXkCfZBZ591eQFbbmkOFHmP7GqkrSG9SDI/cnkGF/y4gUKfqmPN4L2dxIy8qe
         UwDBdMHGs4neEzQjr/AIYVOAWecjDiUPs4a1y4/Rsfg08Hq/gA2KheWwIsdTQQpN+OwO
         8BstdlgtKZ264dKKSGUZKbxu1i1F6XumvPy0UNMb+/rBPP43Hay8rv/65a7r866uH4g9
         HdHg==
X-Gm-Message-State: ANhLgQ2YW2ZLUCWtESEEr8hmmt1Radn0ROSKfkXAYVo5WGXiPdZJOPF8
        U+WUmhF29Voc25w9jwbp4eBZiQ==
X-Google-Smtp-Source: ADFU+vtpsj53ds8mnXl4FWNlUj/pImcr7BB2QSHheuKi/kCvMR9Z/dhfdpdDfWSI3kH8BKU9T1nHwg==
X-Received: by 2002:a17:902:aa49:: with SMTP id c9mr17784508plr.145.1583780462732;
        Mon, 09 Mar 2020 12:01:02 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id y9sm293333pjj.17.2020.03.09.12.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 12:01:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200309185120.GC1098305@builder>
References: <1583752457-21159-1-git-send-email-mkshah@codeaurora.org> <1583752457-21159-2-git-send-email-mkshah@codeaurora.org> <158377818530.66766.4481786840843320343@swboyd.mtv.corp.google.com> <20200309185120.GC1098305@builder>
Subject: Re: [PATCH v4 1/4] dt-bindings: Introduce SoC sleep stats bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>, evgreen@chromium.org,
        mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        devicetree@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Date:   Mon, 09 Mar 2020 12:01:01 -0700
Message-ID: <158378046147.66766.9861199454487445583@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-03-09 11:51:20)
> On Mon 09 Mar 11:23 PDT 2020, Stephen Boyd wrote:
>=20
> > Quoting Maulik Shah (2020-03-09 04:14:14)
> > > From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> > >=20
> > > Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
> > > SoC sleep stats driver. The driver is used for displaying SoC sleep
> > > statistic maintained by Always On Processor or Resource Power Manager.
> > >=20
> > > Cc: devicetree@vger.kernel.org
> > > Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> > > Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> > > Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >  .../bindings/soc/qcom/soc-sleep-stats.yaml         | 46 ++++++++++++=
++++++++++
> > >  1 file changed, 46 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/soc/qcom/soc-sl=
eep-stats.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/soc/qcom/soc-sleep-sta=
ts.yaml b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
> > > new file mode 100644
> > > index 00000000..7c29c61
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
> > > @@ -0,0 +1,46 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/soc/qcom/soc-sleep-stats.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm Technologies, Inc. (QTI) SoC sleep stats bindings
> > > +
> > > +maintainers:
> > > +  - Maulik Shah <mkshah@codeaurora.org>
> > > +  - Lina Iyer <ilina@codeaurora.org>
> > > +
> > > +description:
> > > +  Always On Processor/Resource Power Manager maintains statistics of=
 the SoC
> > > +  sleep modes involving powering down of the rails and oscillator cl=
ock.
> > > +
> > > +  Statistics includes SoC sleep mode type, number of times low power=
 mode were
> > > +  entered, time of last entry, time of last exit and accumulated sle=
ep duration.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - qcom,rpmh-sleep-stats
> > > +      - qcom,rpm-sleep-stats
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +
> > > +examples:
> > > +  # Example of rpmh sleep stats
> > > +  - |
> > > +    rpmh_sleep_stats@c3f0000 {
> > > +      compatible =3D "qcom,rpmh-sleep-stats";
> > > +      reg =3D <0 0xc3f0000 0 0x400>;
> > > +    };
> > > +  # Example of rpm sleep stats
> > > +  - |
> > > +    rpm_sleep_stats@4690000 {
> >=20
> > Node names don't have underscores. It really feels like we should be ab=
le
> > to get away with not having this device node at all. Why can't we have
> > the rpm message ram be a node that covers the entire range and then have
> > that either create a platform device for debugfs stats or just have it
> > register the stat information from whatever driver attaches to that
> > node?
> >=20
> > Carving this up into multiple nodes and making compatible strings
> > doesn't seem very useful here because we're essentially making device
> > nodes in DT for logical software components that exist in the rpm
> > message ram.
>=20
> It's been a while since I discussed this with Lina, but iirc I opted for
> the model you suggest and we concluded that it wouldn't fit with the RPM
> case.
>=20
> And given that, for reasons unknown to me, msgram isn't a single region,
> but a set of adjacent memory regions, this does seem to represent
> hardware better.
>=20

I guess there's message ram and code ram or something like that? Maybe
that's the problem? Either way it sounds like the node name needs to be
fixed to have dashes and then this is fine to keep. Describing memory
like this in DT just makes me sad.
