Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D495919F1CF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2020 10:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgDFItd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Apr 2020 04:49:33 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55174 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgDFItc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Apr 2020 04:49:32 -0400
Received: by mail-wm1-f65.google.com with SMTP id h2so5814254wmb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2020 01:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hB/cttD2PIQJrbz4bzuL3i++GH0OSgasFqo3xqjEQAo=;
        b=KlcQa7lIt+n/wVEV8JdYNkiUDQQp+hGTfkU1Mu02PywtjHqp63UeXe/YmyUw018Kdc
         lpl1WphuIEEQUPCuEbfiYH37JUXWUTrg26Sf4c64ZSxRRDOVgszt6TP6yfeIKKv4bnBC
         w3jj2IBcjWCz177Pxk5VvdWa2Y40lDC/vS6pXi98sdU+jDGOH7l9ozbD6p+C4Ah8Nsap
         AB/D6Od+pOXPDjy792trBcGT+iJ0/81trVcYIVx4YxoA9gCgCvFxxtHf0GNkk09CRmxo
         BTql6k2kwaGkNcIiaIY/53x86i7F0xHwY9eXlCwZPZzQEaMUhBuLdt9X9dmS8LyJB3ZM
         EsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hB/cttD2PIQJrbz4bzuL3i++GH0OSgasFqo3xqjEQAo=;
        b=n40mPq5WQZ0XcoGFp1EXaB+xrQ+IEaPOQL20NxV3/EyM/zdGQUhVdYo6rL18p8hDwY
         Jb7kkn6NUnCmB3hkOOFUpvrYLbXCEEUoulOUZa/Yrf3wJGiGVYzVeb3QlFzryDxsO3Qj
         fu1ze0PlzHumsXGw1TkqSIEaogc5R7Fr0dx5x8eNgvXXM4l6rO8nklM3cNhtXlsEGlwn
         mOlWed59H2Ih5/CELKz5JMCyePgRr5YvSZHof9KvCkYJP188Rldc2HdnXgUl6ouqkSi/
         6T8wfeM6KADXHVWVFjyduOZumMQK4x/B6s0rW3nvqs4ouI0S1HpNowUl0XH1JbPiFqLO
         zpHw==
X-Gm-Message-State: AGi0PuatX0JdG7BdaSJHmwYVYKPQKzUHL0/OOiFpsxlth9+CUjnRsnSX
        2argDcyCmsOk4fU91wE45vNOFw==
X-Google-Smtp-Source: APiQypL6NsZE4UH6W7CHGi4ojlUeqMxw4vdKpXkAYqw432CMd+116S8Nw19uLsayC9FcZNch4FCf5A==
X-Received: by 2002:a1c:9d84:: with SMTP id g126mr6730754wme.184.1586162968744;
        Mon, 06 Apr 2020 01:49:28 -0700 (PDT)
Received: from dell ([2.27.35.179])
        by smtp.gmail.com with ESMTPSA id t26sm14548888wmj.12.2020.04.06.01.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 01:49:27 -0700 (PDT)
Date:   Mon, 6 Apr 2020 09:50:24 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     kgunda@codeaurora.org, Rob Herring <robh@kernel.org>,
        bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH V4 1/4] backlight: qcom-wled: convert the wled bindings
 to .yaml format
Message-ID: <20200406085024.GF30614@dell>
References: <1584985618-25689-1-git-send-email-kgunda@codeaurora.org>
 <1584985618-25689-2-git-send-email-kgunda@codeaurora.org>
 <20200331175401.GA9791@bogus>
 <ac8f25113a3bb233c11fd7cd9e62c2cf@codeaurora.org>
 <20200403114651.m6rholzufzqinanc@holly.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200403114651.m6rholzufzqinanc@holly.lan>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 03 Apr 2020, Daniel Thompson wrote:

> On Fri, Apr 03, 2020 at 04:45:49PM +0530, kgunda@codeaurora.org wrote:
> > On 2020-03-31 23:24, Rob Herring wrote:
> > > On Mon, Mar 23, 2020 at 11:16:55PM +0530, Kiran Gunda wrote:
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> > > > b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> > > > new file mode 100644
> > > > index 0000000..8a388bf
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> > > > @@ -0,0 +1,184 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Binding for Qualcomm Technologies, Inc. WLED driver
> > > > +
> > > > +maintainers:
> > > > +  - Lee Jones <lee.jones@linaro.org>
> > > 
> > > Should be the h/w owner (you), not who applies patches.
> > > 
> > will address in next post.
> > <snip>
> > will address in next post.
> > <snip>
> > will address in next post.
> > <snip>
> > will address in next post.
> > <snip>
> > will address in next post.
> > <snip>
> > will address in next post.
> > <snip>
> > will address in next post.
> > <snip>
> > will address in next post.
> > <snip>
> > will address in next post.
> 
> If you agree on all points raised I doubt there is any need for a point
> by point reply since everyone who reads it will have to scroll down
> simply to find out that you agree on all points.
> 
> Better just to acknowledge the feedback and reply to the first one
> saying you'll agree on all points and will address all feedback in the
> next revision (and then trim the reply to keep it short).

Or better still, just submit the next revision with all the fixes. :)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
