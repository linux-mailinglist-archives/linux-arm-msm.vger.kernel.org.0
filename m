Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 373454ED54B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Mar 2022 10:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232616AbiCaIRk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Mar 2022 04:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232594AbiCaIRj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Mar 2022 04:17:39 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509971A818
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 01:15:52 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id m30so32596706wrb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 01:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ce3XiUynrBovS1Dqjh/W2HbLqdCahz7xgN7KDMpYzcY=;
        b=J1HnsVITgr6QSTK4m6TnBMailz49y681Ypvo1Y88KWhdeniaXsBVQZa0K1Oj2eADIl
         nYByCdKr/pnmNrTP9i7v8jAhf7Bn31F6Tv7Qh7oXnM4q5zdstH6nJr2FRhFUMbrJSC1M
         Bjjsewh6zrKz7zZyhbmjhZRlLEPF9UPyD2kqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ce3XiUynrBovS1Dqjh/W2HbLqdCahz7xgN7KDMpYzcY=;
        b=XQpVI4Cikkqj6wWh3EcrVfBD1zgXTsqTShWo3DyZHfZZb2Jxgzi0KHmvVP36Ai1dvs
         3ZSvfCe8TlBdXiilq7Qo7SnseYC7loRJ82B6Oar4oEmxpyBBU0rdH92TrJffCMp7sPYg
         TA9ijgwgMf2frqfUWehVnb0boYIqimXxufoig+IKytZu4kEwlyvp5E7AzOCJc2DuJS5B
         akT+y2oTztISa0XgcmJvu4QHJ7JqicSo95bZ5IAQp6wvPFBaayN7mkp87EwazP6uEB5r
         E4Fgu5/B0geT1V3pTkwStb9W1FoVGPCBgk3PYSs98FH2ibA10I20UggRPjMCAifO+LDG
         /DeQ==
X-Gm-Message-State: AOAM530U/XdfFymu8UeJ7f/lqCacKbsLoysHBqlLrpi37/5HZWQUc6D6
        /HnvHki83k3SgewUAhujllfIgI9++OA6HkkvvXsAAQ==
X-Google-Smtp-Source: ABdhPJxwK72eMVAlrWI9TufBptdUQt1Dm0cRvlerktWCd7Jibsvd0gmRTxIBjH+T20XY/zeapZypYCgga8qYMktqCn0=
X-Received: by 2002:a5d:64a5:0:b0:205:8e66:e9b1 with SMTP id
 m5-20020a5d64a5000000b002058e66e9b1mr3102248wrp.464.1648714550874; Thu, 31
 Mar 2022 01:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220330084519.3863856-1-judyhsiao@chromium.org> <YkRBo/1s6BgCRCvP@sirena.org.uk>
In-Reply-To: <YkRBo/1s6BgCRCvP@sirena.org.uk>
From:   Judy Hsiao <judyhsiao@chromium.org>
Date:   Thu, 31 Mar 2022 16:15:39 +0800
Message-ID: <CAJXt+b8MFjcQ1oY4oe2_ePUGPui7c4Oek3rqNgr8tvi9ywLhcw@mail.gmail.com>
Subject: Re: [v1] ASoC: qcom: Add driver support for ALC5682I-VS.
To:     Mark Brown <broonie@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, dianders@chromium.org,
        cychiang@google.com, yuhsuan@chromium.org, judyhsiao@google.com,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 30, 2022 at 7:40 PM Mark Brown <broonie@kernel.org> wrote:
> On Wed, Mar 30, 2022 at 04:45:19PM +0800, Judy Hsiao wrote:
> > +     snd_soc_dai_set_fmt(codec_dai,
> > +                             SND_SOC_DAIFMT_CBS_CFS |
> > +                             SND_SOC_DAIFMT_NB_NF |
> > +                             SND_SOC_DAIFMT_I2S);
>
> Please use _CBC_CFS, and this can be set in the dai_link as data.
Done. Use _CBC_CFS.
As the original driver did not declare the dai_link structs
separately. Just leave as it is.
Thanks!
