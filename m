Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE61C503370
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Apr 2022 07:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233944AbiDOXRS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Apr 2022 19:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232085AbiDOXRR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Apr 2022 19:17:17 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444EE1C127
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 16:14:44 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E1F7B3F78D;
        Sat, 16 Apr 2022 01:14:42 +0200 (CEST)
Date:   Sat, 16 Apr 2022 01:14:41 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        dri-devel@lists.freedesktop.org, swboyd@chromium.org,
        robdclark@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org,
        daniel@ffwll.ch, markyacoub@chromium.org,
        dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
        aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 06/12] drm/msm/dpu: make changes to
 dpu_encoder to support virtual encoder
Message-ID: <20220415231441.dd2cyrl7sfz5fvy3@SoMainline.org>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-7-git-send-email-quic_abhinavk@quicinc.com>
 <20220414222642.f7wy3wdbsgmrqrxj@SoMainline.org>
 <1af827f1-b9b5-ed43-7bd8-8af6206eabaa@quicinc.com>
 <227cb6b8-c4c5-aa24-a91e-ccbd29260b29@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <227cb6b8-c4c5-aa24-a91e-ccbd29260b29@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Abhinav,

On 2022-04-15 12:25:55, Abhinav Kumar wrote:
> Hi Marijn
> 
> Looking at msm-next tip, this code has already been refactored in
> 
> https://gitlab.freedesktop.org/drm/msm/-/commit/ef58e0ad34365e2c8274b74e6e745b8c180ff0d3
> 
> So, I will just rebase my changes on msm-next tip and it should address 
> below comments as well.

That's actually great, I love patches that remove a whole lot of
(especially bug-containing) lines, awesome Dmitry!

Looking forward to the next revision, spotted some minor nits in this
revision but it probably makes little sense to point them out here
presuming they might have already been addressed on your end or removed
altogether.

- Marijn
