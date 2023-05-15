Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2270703E71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 22:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244176AbjEOUS2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 16:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245335AbjEOUSX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 16:18:23 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C987B10E6D
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 13:18:00 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 077BC1F987;
        Mon, 15 May 2023 22:17:06 +0200 (CEST)
Date:   Mon, 15 May 2023 22:17:04 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, dmitry.baryshkov@linaro.org,
        andersson@kernel.org, quic_abhinavk@quicinc.com,
        quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/8] drm/msm/dpu: add support for DSC encoder v1.2
 engine
Message-ID: <p475xm34vecvxeidwx5ztbk7wzvpeefw2mfzsfz47fgaftwocg@f7l2ku63yfww>
References: <1683914423-17612-1-git-send-email-quic_khsieh@quicinc.com>
 <1683914423-17612-6-git-send-email-quic_khsieh@quicinc.com>
 <mxdr37vle6x4wvidyh2tc5w77oqve556ogk4nu47efdjbstz6i@vz5hkydgie5g>
 <08b4b6b3-1401-c2dc-0270-c8f7d538ed9c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08b4b6b3-1401-c2dc-0270-c8f7d538ed9c@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-15 10:06:33, Kuogee Hsieh wrote:
<snip>
> >> +static inline int _dsc_calc_ob_max_addr(struct dpu_hw_dsc *hw_dsc, int num_ss)
> > Can you write out "ob" fully?
> >
> > These don't need to be marked "inline", same below.

Please add newlines around your reply, like I did here, to make it
easier to spot them in the context.  As asked in another thread, shorten
the original message around it if it's not relevant for your reply
message (see <snip> bits).

> are you means all functions in this file doe snot to be marked as inline?

https://www.kernel.org/doc/local/inline.html

In general, inline is fine for math functions that are small and useful
to be inlined (and functions in headers that get compiled multiple times
but need to be deduplicated when all the objects are linked together).
It has no sensible meaning on callback functions (of which their pointer
get assigned to a struct member), however.

In DPU1 for example, only dpu_hw_ctl.c erroneously does this for
callbacks (and this patch, but I presume you'll fix this up in v9).

> >> +{
> >> +	int max_addr = 2400 / num_ss;
> > ss -> slice (or subslice), right?
> ...
> slice (softslice)

Thanks if you can fix this up in v9!

- Marijn

<snip>
