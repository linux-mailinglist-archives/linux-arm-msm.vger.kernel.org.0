Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 087A06DC4AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Apr 2023 10:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjDJIyq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Apr 2023 04:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjDJIyp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Apr 2023 04:54:45 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC9B12107
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 01:54:43 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id cj22so5171768qtb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 01:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681116883; x=1683708883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZT9rBwpWcKUZaczaZowSPWVC47IVSqFCideHtvU7i10=;
        b=IvRn+Lnp4IdK6EhrO4n9VCNPHVdPVJn1DEQYkDk4YIAxchSkW22JHUU/gruhHeyO9f
         mlWENwayKK/3dB28QoUbPYavMgxHSI0JkuZt92WKRr0Go0waK2Sv7qCdwE53TI3+ucfk
         qSypYrgDHjWDSy1X+7CntURJUtDUu02wtA5ZkMZELcT/olax56KfgwbkXwKZfi2/gqSk
         gxxAnURAP4ElwHqvPTEUHRzTzYg8Oql+NY3silNeWgY7GqUugkytORdYzb78QSLPV5Ds
         5ETw8VA8hRsIBYxYT6JqRuaB02E4B4P4A6R1fa8gbjpPJp+CYjs5++1f7oGYiroSpTfY
         d2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681116883; x=1683708883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZT9rBwpWcKUZaczaZowSPWVC47IVSqFCideHtvU7i10=;
        b=J/fwbI/aLiNBNxfVR5F9UcaHUOIbaveG2RKoxQQXEUJq9fnFHd28JcmtUhx/zkuUes
         rabrjNhIRqpbGwbl+859a/yTtkXkbYYkER4oAF7nygPTI8oKpnlCUBQAVJeIe21CVxoF
         5Ib5vDvg3CkSL136tjAEkjinefUsagitrlKjdw8PP+0OE0Rc5jIKn37YrOYRB0VX06D8
         sSUsN4m2dxrEC5v5mTPj3+JfNtnSCqbPwo2+jxY9ADpiFppn9m5l2qi8feE8yojn3nQH
         971hLHCTx6P4kfbMWAtnLjmFY6RgNB+CCbW9ucQ8s2Q2f3PYkvF9MdnDdgzeX+Dt3Fsu
         k30w==
X-Gm-Message-State: AAQBX9da8yDPdcBJ1rg0wVW8/lu/ErVLpop+KRADbId9KTafsGP4DxU/
        vfouMXK9855IH6V/Jdu5RtOaj4J5lSjvh0cXVvB3mA==
X-Google-Smtp-Source: AKy350a6zf69mJUwm6/ebH4HDxTFB64uA/PslNVHrgNo+KNQpsde8kx1jr0COHlIjeMa5yNPWjTKStfYOWTyu535LFU=
X-Received: by 2002:a05:622a:283:b0:3e4:de7a:d532 with SMTP id
 z3-20020a05622a028300b003e4de7ad532mr3689327qtw.13.1681116883059; Mon, 10 Apr
 2023 01:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230124182857.1524912-1-amit.pundir@linaro.org>
 <39751511-3f06-7c39-9c21-208d4c272113@linaro.org> <CAA8EJppLBuA08hkqTrZx_wwbtCxK9sAjv48c9_DxgPENgo7a8Q@mail.gmail.com>
 <1a840d88-e5b1-711c-b980-f57620c54472@linaro.org> <8508e3d5-7468-0b2f-5a43-7c439ecf2d8b@linaro.org>
 <CAMi1Hd2UNxXHUVWO-=sWh=-bVnrqE3UdLguFOq+62SfvUiEs0A@mail.gmail.com> <b2307e91-3373-539a-ecfb-e2542b9f83db@linaro.org>
In-Reply-To: <b2307e91-3373-539a-ecfb-e2542b9f83db@linaro.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Mon, 10 Apr 2023 14:24:07 +0530
Message-ID: <CAMi1Hd2xfH-=htvHFQRktdgtDwiXKKvFo+9hook4HCJCPY6ydA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: Mark cont splash memory
 region as reserved
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 9 Feb 2023 at 16:33, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 09/02/2023 09:05, Amit Pundir wrote:
> > Hi, So what is the verdict on this patch?
> >
> > I submitted this fix to make sure UFS don't map and crash on it, which
> > I have seen happening occassionaly on db845c and Caleb reported
> > similar issues on his sdm845 device iirc. I should have probably put
> > that in my commit message as well.
> >
> > Regards,
> > Amit Pundir
>
> So the memory _is_ being used by ... continuous splash on an Android
> image, i.e. your Android ? limited to Android - image continues on with
> the splash but other blocks erroneously reuse the memory then, UFS as an
> example ?

Hi Bryan,

Yes UFS (reported only on v5.10) tries to map this reserved memory and
system crash and reboot. Plan is to backport this patch to v5.10.y.

Regards,
Amit Pundir

>
> ---
> bod
