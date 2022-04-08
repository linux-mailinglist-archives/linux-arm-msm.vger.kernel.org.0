Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 256F84F8ABC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 02:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232975AbiDHAW4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Apr 2022 20:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232969AbiDHAWy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Apr 2022 20:22:54 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6696BC12C2
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Apr 2022 17:20:52 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id g20so8288293edw.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Apr 2022 17:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EUO4ZkagqI35g4dyGZeSriotv9HvxG7vujGEgbCcZkU=;
        b=TEef53cSAydlsremUikPhSFLztWvs7WNKJRSiFhTfUee8wYEynR3p69EEhAbLFPoHE
         b29Gzz98Zuy76c+968HMXG1B9jQMg4QDHrYN4LM3amlXHkzn5hT+Pf77Sa8oH5mwkTxV
         oBPd9oZf+Ph6Z2N5mV3Z4xjh9ozw8I7/7moPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EUO4ZkagqI35g4dyGZeSriotv9HvxG7vujGEgbCcZkU=;
        b=J4JQGB9CfgVYYM88k5iGD0nSqtla/bpVC4l1PDeLZWgBetOYfV2l3+yBStbBEWL0Mt
         Igq1PaMyu/l0iiHjUxqJXI5+8Bxlk3v7JNTv62KEp8Cpcjz/f0HYspqlj8+aXg2FnozF
         VDoj2fpCPXmtCkA65x6GaJU6sYdl0swcv3IkPP8rYlMoDqWA7st7Vc2LZ+s8FAlkl0uu
         d3KOKXfz6u2ZbhTe5oKWlzlZuznX41kmuyYwO8daJHP0n2IDJc3C86r3zAY0tnOh4Wr0
         jlgDg1GypiJU4K0oHzxoVlvLW+0EnyhEVsArt9D3fHTIs59qB8eMAFfMuIq5MqG8WBf0
         IBsg==
X-Gm-Message-State: AOAM531QR2opGLI+1piBJTbdkhCd5sowO3G5qT2/BP8FBct33r4RkdQS
        gUVh+KTVKJCIf4GSMsIIAoz6X8MJUIVpZ4VfHDU=
X-Google-Smtp-Source: ABdhPJwa3tM2keK1nYHq9GV3iWq+W5Jn+N+yGnfT/99Y+aqWKveeUHN1EIEVys55J20CbXoCcOD2wA==
X-Received: by 2002:a05:6402:2794:b0:419:2ed8:f36e with SMTP id b20-20020a056402279400b004192ed8f36emr16908105ede.44.1649377251178;
        Thu, 07 Apr 2022 17:20:51 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id u6-20020a170906124600b006e843964f9asm540774eja.55.2022.04.07.17.20.47
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 17:20:48 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id u3so10552034wrg.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Apr 2022 17:20:47 -0700 (PDT)
X-Received: by 2002:a5d:674d:0:b0:206:163c:f70c with SMTP id
 l13-20020a5d674d000000b00206163cf70cmr12433627wrw.679.1649377247367; Thu, 07
 Apr 2022 17:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com>
 <392b933f-760c-3c81-1040-c514045df3da@linaro.org> <CAD=FV=W4PYK-t607yjRbfjDjjEZX0KdgHDRukw_vSH8E8EDH6w@mail.gmail.com>
 <CAA8EJppt9XONbgtKfmHmN+==QNqiVJeb8GKJFdZm=yyY-tgmHQ@mail.gmail.com>
 <CAD=FV=U5-sTDLYdkeJWLAOG-0wgxR49VxtwUyUO7z2PuibLGsg@mail.gmail.com>
 <CAA8EJppgfYgQjG8A4LsR-1wmBj3Ku3eO8cKfAYhxjWXL7e3eHg@mail.gmail.com>
 <CAD=FV=V=a1CnT8fqTJR40WoS3BaDQ3xZ=HnHVHqZh=MEmVUZBA@mail.gmail.com>
 <3e5fa57f-d636-879a-b98f-77323d07c156@linaro.org> <CAD=FV=Uibu-kZyix7K4_WVc-+C8xpzTqU4WFy7O=6sukMZrX5g@mail.gmail.com>
 <MW4PR02MB7186245772DAC3E04FA8D1C0E1E69@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAD=FV=Wk3U7_bVdiCPp8iQ4bcCA_Botemu4pwHeRtgBa3Xk6KQ@mail.gmail.com>
 <c4f086ce-c56f-f7c9-4092-7f2432330d50@quicinc.com> <CAA8EJprdV64jOexEF-XqbkwsNDWBNRRndOAas-QqMHaL=zp9rw@mail.gmail.com>
In-Reply-To: <CAA8EJprdV64jOexEF-XqbkwsNDWBNRRndOAas-QqMHaL=zp9rw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 7 Apr 2022 17:20:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XdRKWFQnJx9AKYmB2p26sXmhjqxLzz+LYyCt7rg+zF6w@mail.gmail.com>
Message-ID: <CAD=FV=XdRKWFQnJx9AKYmB2p26sXmhjqxLzz+LYyCt7rg+zF6w@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        Sean Paul <seanpaul@chromium.org>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Sean Paul <sean@poorly.run>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 7, 2022 at 4:36 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The ps8640 driver looks 'working by coincidence'. It calls
> dp_aux_populate, then immediately after the function returns it checks
> for the panel. If panel-edp is built as a module, the probe might fail
> easily.
> The anx7625 driver has the same kind of issue. The DP AUX bus is
> populated from the probe() and after some additional work the panel is
> being checked.
> This design is fragile and from my quick glance it can break (or be
> broken) too easy. It reminds me of our drm msm 'probe' loops
> preventing the device to boot completely if the dsi bridge/panel could
> not be probed in time.

I did spend some time thinking about this, at least for ps8640. I
believe that as long as the panel's probe isn't asynchronous.
Basically if the panel isn't ready then ps8640 should return and we'll
retry later. I do remember the probe loops that we used to have with
msm and I don't _think_ this would trigger it.

That being said, if we need to separate out the AUX bus into a
sub-device like we did in sn65dsi86 we certainly could.

-Doug
