Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7097E7118FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 23:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239614AbjEYVYJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 May 2023 17:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240673AbjEYVYI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 May 2023 17:24:08 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFCE41A6
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 14:24:05 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-561e5014336so2117407b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 14:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685049845; x=1687641845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pqBKWrOrEI+zbEK9OlZBpSdzBnSQCmjwQcZsxLNFq34=;
        b=Keu12C8b9pEdKe7GwX1dC9eCui1aDDVD+Q7tBnATclYFz7PoRomFtL2TdFCKJy75V9
         Hi1CCszSwVsyuNWuX4NeEl1tRgpVVDcgZHZDYxo5cTbyIBCH4vfte/K7F8lkInEL0Ceq
         Ta5bQOVbrutBQ+Cn+AuDpKlsna5sjHxsiwrIgyhpFlZvSuYy+veNQ8v4LtCrl3Qli40A
         8EJOmPJMIUtHjIm6IKFb5/OGNBm+CpnqFh6TMYXX1BN/eLJiweBUBOCa3a+Zj9sCdfDF
         MlU0B0fTsFgvIjGuhROYoVLT4Asewjvz+t+UBhPSLU/vcQB458hBCo62xXv3VJFmkM8K
         Eo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685049845; x=1687641845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pqBKWrOrEI+zbEK9OlZBpSdzBnSQCmjwQcZsxLNFq34=;
        b=RITtjHSZCxBExpfwNoYWvWCzCQE1Jlz3JxALc/NIgIWAA/sUv59TrQp1SvSuoIh8TW
         lYdyvuRd/dmLUweRinpyOyYKdvYwLuxa6rG79/ufYNo8w69A9J+e/WMM8eQqtPyhN+mQ
         gHR2gzOcf5zn18JmK2psx9k8G9g9dxn1grWrEuA0PCSplWmItc1TB1oGoN6Zpm7bPCDM
         WPXiUCq/wKgqi4wtqbBPhdEMLpML1Pitd/6Qyt38hS9OeyJKiuGMMcayTTninYMTslxM
         /+TrryKQARdOKfYftyi89C4LuxyR1INPZ1y1waYzznbsNqXxtajBUlGTQLjEoDI1Y0dm
         yB+A==
X-Gm-Message-State: AC+VfDwRByyAXPZNjKxOOEuuECEpOjbn7g7taMInfeqTJjVNdPeEUz/r
        3i7guowr/SFK/8D9G4IBIQYphd7Yahm+lg40YYmw0w==
X-Google-Smtp-Source: ACHHUZ4YstKIvO4GH8WsZOBXogGoInnhvvSgR7JQOxu5XIhdLUFoqTlzHFOoauc8qgBelFTIZtCQ3uOGwhBuI8EBMIw=
X-Received: by 2002:a81:8341:0:b0:55a:8226:6192 with SMTP id
 t62-20020a818341000000b0055a82266192mr1061968ywf.7.1685049844900; Thu, 25 May
 2023 14:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v14-3-bafc7be95691@quicinc.com>
 <7e5axjbnbhtdbrvtpcqnapp3p2xe2ekgj3aizssps2zesfhs22@trhwxetiif7p>
 <7ed799fe-1f0a-3d14-3244-7ca351feaf83@quicinc.com> <czjefqca2ye4ntnqw7smy5uiyle3hxnhsxi3so3z3ezigejikd@imtsdfvgr5p4>
In-Reply-To: <czjefqca2ye4ntnqw7smy5uiyle3hxnhsxi3so3z3ezigejikd@imtsdfvgr5p4>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 26 May 2023 00:23:53 +0300
Message-ID: <CAA8EJprrwnaXXstJmH-jSXZP-XiPA74reZU40+q07uTCjjav-w@mail.gmail.com>
Subject: Re: [PATCH v14 3/9] drm/display/dsc: Add drm_dsc_get_bpp_int helper
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 25 May 2023 at 23:18, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-05-24 15:38:23, Jessica Zhang wrote:
> <snip>
> > >> +  WARN_ON_ONCE(vdsc_cfg->bits_per_pixel & 0xf);
> > >
> > > You did not add linux/bug.h back, presumably because Dmitry added
> > > another use of WARN_ON_ONCE to this file in a previous series and it
> > > compiles fine as the definition trickles in via another header?
> >
> > Yep, this compiles fine without any error or warning.
>
> Yes it does, just curious (CC Dmitry) if that is expected/intended: I am
> not familiar enough with the current header includes to say for sure.
>
> Dmitry seemed to rely on it already being available in
> https://git.kernel.org/torvalds/c/2b470e5531f57c1b9bfa129cca0ee17a2ecd2183

I think I did not care about including <linux/bug.h> I checked that
current set of headers provides WARN_ON_ONCE, that's all.

> but that could have been an oversight?
>
> - Marijn



-- 
With best wishes
Dmitry
