Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE1E917E788
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 19:51:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbgCISv0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 14:51:26 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36083 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727490AbgCISvZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 14:51:25 -0400
Received: by mail-pl1-f196.google.com with SMTP id g12so4364153plo.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 11:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oMIq8nf8l37k+xc/nmQRiBDab2+u6nWIzujXfP0wRko=;
        b=JV96VDGxym68PMmFm3L2QPWppkEBRoLWFyJsxYTYbr57gNjbFV2zyv/AkBOqsMyGy9
         r0iFvkFMQeE1iVCbdPlAsHo7nOoL/b+J+ZsAbcq60L5jRRFD1dLywiruCX+c1n5vCdLv
         uwbn4UDHIJcBwge6x4WpK/HFXyHFMtxXLgfeuFGQQvMZ6+TYutTzIfjJaC56Lj2iwZ0m
         8SWywDabn5XrewHk4OBynpLwb1Cm2lJA5ues+0kgw9K64g+VnpdLa/2CwKkgSNAcFcs6
         4GNniTIf+eViDzocUYFGtDP3OZkIK8sTucbJ+tbH9LKdArPqUiauS76qh8T+DAjNeWUj
         bsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oMIq8nf8l37k+xc/nmQRiBDab2+u6nWIzujXfP0wRko=;
        b=qUskQpe47JdIB0k3+07dEr1vlV88IqNsIWdL5EkX1YWtDO7rjMk1ePi1ZHCkioPsCq
         N3TYyWinA8V92QmVpVFt1JiGs/h33AP/Z58BkCsSU3Tpcc3RvI5ZhpLO9OG2nT9GeCxe
         8RV66vcOwspjkt8m0d+tmF0ojaX9qKeQdoNbWQQnfRcqTHoPMYnbG+/8H0JPxSbWVjGv
         zy+C81+faIDqT6i1Bn7z55SyRBYeEJxalwqz/M364o+ee4ovdFVzc2Vse5Y6s3v28tXE
         0r+r5m+rLOW4v3bxqyqdooT3N5keWyiii0VC4+eNRyFvGUZaiau4cw6jhmD7/fFNREQo
         GfWA==
X-Gm-Message-State: ANhLgQ2oPlczfavbK0rr5Nk2hZurRm+muAXqrsMe1DhjbLt4ctkknQxY
        AHfMbwXud7n9Kftwm8yERwQkWA==
X-Google-Smtp-Source: ADFU+vuTiXSQEWF3vDz7zbEWlep/T7QabW2QTc3JChjYyJnTWvNWTPcTOEkvT88T/e4nIeN9OV/Jyg==
X-Received: by 2002:a17:902:9349:: with SMTP id g9mr17844084plp.16.1583779883026;
        Mon, 09 Mar 2020 11:51:23 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id cm2sm277840pjb.23.2020.03.09.11.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 11:51:22 -0700 (PDT)
Date:   Mon, 9 Mar 2020 11:51:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>, evgreen@chromium.org,
        mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: Introduce SoC sleep stats bindings
Message-ID: <20200309185120.GC1098305@builder>
References: <1583752457-21159-1-git-send-email-mkshah@codeaurora.org>
 <1583752457-21159-2-git-send-email-mkshah@codeaurora.org>
 <158377818530.66766.4481786840843320343@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158377818530.66766.4481786840843320343@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 09 Mar 11:23 PDT 2020, Stephen Boyd wrote:

> Quoting Maulik Shah (2020-03-09 04:14:14)
> > From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> > 
> > Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
> > SoC sleep stats driver. The driver is used for displaying SoC sleep
> > statistic maintained by Always On Processor or Resource Power Manager.
> > 
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> > Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> > Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  .../bindings/soc/qcom/soc-sleep-stats.yaml         | 46 ++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
> > new file mode 100644
> > index 00000000..7c29c61
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/qcom/soc-sleep-stats.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Technologies, Inc. (QTI) SoC sleep stats bindings
> > +
> > +maintainers:
> > +  - Maulik Shah <mkshah@codeaurora.org>
> > +  - Lina Iyer <ilina@codeaurora.org>
> > +
> > +description:
> > +  Always On Processor/Resource Power Manager maintains statistics of the SoC
> > +  sleep modes involving powering down of the rails and oscillator clock.
> > +
> > +  Statistics includes SoC sleep mode type, number of times low power mode were
> > +  entered, time of last entry, time of last exit and accumulated sleep duration.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,rpmh-sleep-stats
> > +      - qcom,rpm-sleep-stats
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +examples:
> > +  # Example of rpmh sleep stats
> > +  - |
> > +    rpmh_sleep_stats@c3f0000 {
> > +      compatible = "qcom,rpmh-sleep-stats";
> > +      reg = <0 0xc3f0000 0 0x400>;
> > +    };
> > +  # Example of rpm sleep stats
> > +  - |
> > +    rpm_sleep_stats@4690000 {
> 
> Node names don't have underscores. It really feels like we should be able
> to get away with not having this device node at all. Why can't we have
> the rpm message ram be a node that covers the entire range and then have
> that either create a platform device for debugfs stats or just have it
> register the stat information from whatever driver attaches to that
> node?
> 
> Carving this up into multiple nodes and making compatible strings
> doesn't seem very useful here because we're essentially making device
> nodes in DT for logical software components that exist in the rpm
> message ram.

It's been a while since I discussed this with Lina, but iirc I opted for
the model you suggest and we concluded that it wouldn't fit with the RPM
case.

And given that, for reasons unknown to me, msgram isn't a single region,
but a set of adjacent memory regions, this does seem to represent
hardware better.

Regards,
Bjorn
