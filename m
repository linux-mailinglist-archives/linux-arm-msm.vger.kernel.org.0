Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 972A7516C1B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 10:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383790AbiEBIiU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 04:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbiEBIiT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 04:38:19 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C0418395
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 01:34:47 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5CA023F398;
        Mon,  2 May 2022 10:34:44 +0200 (CEST)
Date:   Mon, 2 May 2022 10:34:42 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: use RMW cycles in
 dsi_update_dsc_timing
Message-ID: <20220502083442.t365cfmivlga557g@SoMainline.org>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
 <b4a3bfed-a842-b4ee-d9a5-5adf5b59c09b@quicinc.com>
 <20220501200635.ekl3fw47dv2zytt3@SoMainline.org>
 <d6a78564-745c-7301-1b57-efc35757fbfd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6a78564-745c-7301-1b57-efc35757fbfd@quicinc.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-01 16:56:45, Abhinav Kumar wrote:
> [snip]
> Wouln't this macro already make sure that 'reg' doesnt have anything in 
> the top 16 bits? Its doing a & with 0x00003f00

Like I said, it is unlikely that this happens, only if someone starts
changing the code that assigns to `reg` which is unlikely to pass review
anyway.

> [snip]
> We can have a common bitfield layout for the two channels for command mode.
> 
> So we can do something like below for common fields:
> 
> -static inline uint32_t 
> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(uint32_t val)
> +static inline uint32_t 
> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM_DATATYPE(uint32_t val, uint32_t 
> stream_id)
>   {
> -       return ((val) << 
> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__SHIFT) & 
> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__MASK;
> +       return ((val) << 
> (DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__SHIFT + (stream_id 
> * 16)) & DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__MASK;
>   }
> 
> Video mode can also use all of these except for WC as that field is not 
> present for cmd modes.
> 
> This can go as a separate change .
> 
> I can push this and perhaps get a Tested-by from Vinod as I dont have a 
> setup to re-validate this.

How would you represent this in XML?  I was hoping for a method that
allows to construct the value in a generic way, without register names,
and then simply have a "register macro" that moves (and perhaps masks)
the preconstructed value into the right place.  A bit like how `enum`s
are currently set up in XML, but with bit ranges for the values and
macros to set a value.

I think I've _partially_ found what I was looking for: a `<bitset>`.
However, I don't know if we can utilize this multiple times within a
single `reg32`, once with an offset for stream1.  Alas, it's just
bikeshedding at this point.

- Marijn
