Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 566A451798F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 23:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378311AbiEBWBh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 18:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387789AbiEBV7w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 17:59:52 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB5D63E2
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 14:56:19 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 607113F549;
        Mon,  2 May 2022 23:56:17 +0200 (CEST)
Date:   Mon, 2 May 2022 23:56:16 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
Message-ID: <20220502215616.jwpi3dr6ryembsfr@SoMainline.org>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
 <b4a3bfed-a842-b4ee-d9a5-5adf5b59c09b@quicinc.com>
 <20220501200635.ekl3fw47dv2zytt3@SoMainline.org>
 <d6a78564-745c-7301-1b57-efc35757fbfd@quicinc.com>
 <20220502083442.t365cfmivlga557g@SoMainline.org>
 <f8986d6d-2c2b-a0a0-d63c-d4670f6864ff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8986d6d-2c2b-a0a0-d63c-d4670f6864ff@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-02 13:02:09, Dmitry Baryshkov wrote:
> [snip]
> > How would you represent this in XML?  I was hoping for a method that
> > allows to construct the value in a generic way, without register names,
> > and then simply have a "register macro" that moves (and perhaps masks)
> > the preconstructed value into the right place.  A bit like how `enum`s
> > are currently set up in XML, but with bit ranges for the values and
> > macros to set a value.
> > 
> > I think I've _partially_ found what I was looking for: a `<bitset>`.
> > However, I don't know if we can utilize this multiple times within a
> > single `reg32`, once with an offset for stream1.  Alas, it's just
> > bikeshedding at this point.
> 
> Unfortunately the following naïve patch doesn't work, stream1 bits are 
> still defined in the 0:15 bit space. One would have to modify rnn tool 
> to make sure that it takes into account the low/high parts of the 
> bitfield when generating offsets/masks.
> 
> diff --git a/src/freedreno/registers/dsi/dsi.xml 
> b/src/freedreno/registers/dsi/dsi.xml
> index f2eef4ff41ae..b0166628ad0a 100644
> --- a/src/freedreno/registers/dsi/dsi.xml
> +++ b/src/freedreno/registers/dsi/dsi.xml
> @@ -361,22 +361,19 @@ 
> xsi:schemaLocation="http://nouveau.freedesktop.org/ rules-ng.xsd">
>                  <bitfield name="MAJOR" low="24" high="31" type="uint"/>
>          </reg32>
>          <reg32 offset="0x002d4" name="CPHY_MODE_CTRL"/>
> -       <reg32 offset="0x0029c" name="VIDEO_COMPRESSION_MODE_CTRL">
> -               <bitfield name="WC" low="16" high="31" type="uint"/>
> +       <bitset name="COMPRESSION_MODE_CTRL" inline="true">
>                  <bitfield name="DATATYPE" low="8" high="13" type="uint"/>
>                  <bitfield name="PKT_PER_LINE" low="6" high="7" 
> type="uint"/>
>                  <bitfield name="EOL_BYTE_NUM" low="4" high="5" 
> type="uint"/>
>                  <bitfield name="EN" pos="0" type="boolean"/>
> +       </bitset>
> +       <reg32 offset="0x0029c" name="VIDEO_COMPRESSION_MODE_CTRL">
> +               <bitfield name="WC" low="16" high="31" type="uint"/>
> +               <bitfield name="STREAM0" low="0" high="15" 
> type="COMPRESSION_MODE_CTRL"/>
>          </reg32>
>          <reg32 offset="0x002a4" name="COMMAND_COMPRESSION_MODE_CTRL">
> -               <bitfield name="STREAM1_DATATYPE" low="24" high="29" 
> type="uint"/>
> -               <bitfield name="STREAM1_PKT_PER_LINE" low="22" high="23" 
> type="uint"/>
> -               <bitfield name="STREAM1_EOL_BYTE_NUM" low="20" high="21" 
> type="uint"/>
> -               <bitfield name="STREAM1_EN" pos="16" type="boolean"/>
> -               <bitfield name="STREAM0_DATATYPE" low="8" high="13" 
> type="uint"/>
> -               <bitfield name="STREAM0_PKT_PER_LINE" low="6" high="7" 
> type="uint"/>
> -               <bitfield name="STREAM0_EOL_BYTE_NUM" low="4" high="5" 
> type="uint"/>
> -               <bitfield name="STREAM0_EN" pos="0" type="boolean"/>
> +               <bitfield name="STREAM1" low="16" high="31" 
> type="COMPRESSION_MODE_CTRL"/>
> +               <bitfield name="STREAM0" low="0" high="15" 
> type="COMPRESSION_MODE_CTRL"/>
>          </reg32>
>          <reg32 offset="0x002a8" name="COMMAND_COMPRESSION_MODE_CTRL2">
>                  <bitfield name="STREAM1_SLICE_WIDTH" low="16" high="31" 
> type="uint"/>

This is approximately what I was aiming for.  `inline="true"` does
"inline" all the individual bitfields so that they're prefixed with the
reg32+bitfield name again, right?  That's what I wanted to avoid :)

- Marijn
