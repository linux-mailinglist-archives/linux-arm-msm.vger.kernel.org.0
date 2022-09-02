Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D68555AA48F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 02:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbiIBAoX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 20:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232199AbiIBAoU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 20:44:20 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771A9A1D13
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 17:44:19 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id qh18so809619ejb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 17:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=IMQ+BZIR6+h0WYe8X2EFFlmyoPK1mtPErfGaqmTntwQ=;
        b=F0+vYb25Gviz6CRRQK7SorbY/ckL8SrufqNyoh61zl77MW0dtPZOvV6ihZ4IiUHwXp
         lwqPvyJRh2BwWNBPXxi/uN26X4GJfCELYZT+37Qav6trKj+XD4z+m/97EU1zDXqPTdUb
         uxEfoe+gtUc0gXW3gaGFCcZFu2tHbgCPt8AHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=IMQ+BZIR6+h0WYe8X2EFFlmyoPK1mtPErfGaqmTntwQ=;
        b=aYdtcCYU1H3Sk3znIiGoOe6W6wF9qjE8LVDEROi8NbRyKNNS+gHni6gEV/lGQCs8bL
         JKQuEG3RjkCz/ewvhQ+OLpzXm+1pcVwOWoQ8cDlkQ812WqOHMmugSEgvWJdGl0JGZ075
         kjs1J1MqP0P4GFiNH/lbcLBqVHD9LN5dcLwE+o9yPBdzUQub9EMEXFcRrxufthoAGIYv
         q/aXOBdb48xA3zX1plRW3NErdnpzzSh0HK2sCouTUO1VQHMMPHeqJMFTwwwMFtkw/fIH
         muOOUy3xS1ZXLD5kjfGj2BFwN0kr/0ia5tGlj1125M/cuLyvtPG9+tO4IAM5eEXN+PcW
         DSzg==
X-Gm-Message-State: ACgBeo2cxikNhXxqIr4o5Cr//ivqBzuOeE7QzkE9wljDDfBzNtTKHlHc
        QoNsfQ60DIk/nscNGYdq6mDaZdG00tb6FPNO
X-Google-Smtp-Source: AA6agR5+rBhq3n8QZ4c0I3itlTQP5VABmgxJUI2aCFSK+/tXfJ2kE8aoqEmNWkMwsTIBHqwPnEDjRg==
X-Received: by 2002:a17:906:4d8c:b0:741:6194:e5b6 with SMTP id s12-20020a1709064d8c00b007416194e5b6mr17233050eju.252.1662079457821;
        Thu, 01 Sep 2022 17:44:17 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id vs7-20020a170907138700b0074b4e77ccc6sm382984ejb.151.2022.09.01.17.44.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 17:44:16 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id n17so417231wrm.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 17:44:15 -0700 (PDT)
X-Received: by 2002:a05:6000:15c6:b0:226:f246:6e70 with SMTP id
 y6-20020a05600015c600b00226f2466e70mr4192694wry.617.1662079455437; Thu, 01
 Sep 2022 17:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220829164952.2672848-1-dianders@chromium.org>
 <Yw8EE/ESDUnIRf8P@hovoldconsulting.com> <CAD=FV=VJz2hjvsUhsjBPt9nmm3X62oTdAqMeSFABYJietPPzWw@mail.gmail.com>
 <YxDVNW+EQbHRw16s@hovoldconsulting.com>
In-Reply-To: <YxDVNW+EQbHRw16s@hovoldconsulting.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 1 Sep 2022 17:44:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VaDNLLjtKswWvhD0JmLpOoVHR05yU8kZESH3yQ0xescA@mail.gmail.com>
Message-ID: <CAD=FV=VaDNLLjtKswWvhD0JmLpOoVHR05yU8kZESH3yQ0xescA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: Fix broken regulator spec on
 RPMH boards
To:     Johan Hovold <johan@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Sep 1, 2022 at 8:52 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Wed, Aug 31, 2022 at 07:52:52AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Aug 30, 2022 at 11:47 PM Johan Hovold <johan@kernel.org> wrote:
> > >
> > > On Mon, Aug 29, 2022 at 09:49:46AM -0700, Douglas Anderson wrote:
> > > > Prior to commit efb0cb50c427 ("regulator: qcom-rpmh: Implement
> > > > get_optimum_mode(), not set_load()") several boards were able to
> > > > change their regulator mode even though they had nothing listed in
> > > > "regulator-allowed-modes". After that commit (and fixes [1]) we'll be
> > > > stuck at the initial mode. Discussion of this (again, see [1]) has
> > > > resulted in the decision that the old dts files were wrong and should
> > > > be fixed to fully restore old functionality.
> > > >
> > > > This series attempts to fix everyone. I've kept each board in a
> > > > separate patch to make stable / backports work easier.
> > >
> > > Should you also update the bindings so that this can be caught during
> > > devicetree validation? That is, to always require
> > > "regulator-allowed-modes" when "regulator-allow-set-load" is specified.
> >
> > Yeah, it's probably a good idea. I'm happy to review a patch that does
> > that. I'm already quite a few patches deep of submitting random
> > cleanups because someone mentioned it in a code review. ;-) That's
> > actually how I got in this mess to begin with. The RPMH change was in
> > response to a request in a different code review. ...and that came
> > about in a code review that was posted in response to a comment about
> > how awkward setting regulator loads was... Need to get back to my day
> > job.
>
> Heh.
>
> > In any case, I think these dts patches are ready to land now.
>
> Yeah, as the old dtbs are now broken with newer kernels these are indeed
> needed.

With the latest patches in the regulator tree things shouldn't be
_too_ broken even without the dts files. Essentially things will get
stuck at their initial mode (HPM). So without these patches things
should all still boot but could possibly end up at a higher power
state.

-Doug
