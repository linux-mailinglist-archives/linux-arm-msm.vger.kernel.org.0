Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90F3A301FB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jan 2021 01:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbhAYAM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 19:12:57 -0500
Received: from onstation.org ([52.200.56.107]:35086 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726593AbhAYALe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 19:11:34 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id D68943EA88;
        Mon, 25 Jan 2021 00:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1611533357;
        bh=NX04KDq22imvna2j2KPjU62cAJRCEXT8lTRLg6sU+9M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZTys71IW91sT6zb8BsXKM4Z3CwcgI6qowbfvayR2iwYFDP+Dcwdtph0pjhHUik6ik
         Qjqhko3nVgog/EN8ikkXbaf+DTy14IgQZoe6pgCURs1+IHao6gUlhFnCjwIyF7WE4d
         ODQtZGIouWhWgkLKWc4j/1grPYVXDigIT9++KJVU=
Date:   Sun, 24 Jan 2021 19:09:16 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974: add gpu support
Message-ID: <20210125000916.GA22513@onstation.org>
References: <20210124135610.1779295-1-iskren.chernev@gmail.com>
 <f1438c9d-458b-2ff7-cae9-f7bf4228ef4c@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1438c9d-458b-2ff7-cae9-f7bf4228ef4c@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jan 24, 2021 at 03:56:06PM +0100, Konrad Dybcio wrote:
> Hi,
> 
> 
> > +		gpu_opp_table: opp_table {
> > +			status = "disabled";
> 
> 
> Is there a good reason to disable this?
> 
> 
> > +			opp-800000000 {
> > +				opp-hz = /bits/ 64 <800000000>;
> > +			};
> 
> No. A330 can't go lightspeed (unless there's some secret ultra-binned msm8974pro-v4-ad-5g). [1]

Hi Iskren,

I believe that the Nexus 5 GPU frequencies are documented in the
downstream kernel at:
https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/arch/arm/boot/dts/msm8974-gpu.dtsi#L67

I am fairly certain that the qcom,bus-freq property is an index into the
qcom,msm-bus,vectors-KBps property above. This will map to the
interconnect and operating points in the upstream kernel.

Note that the actual implementation in a3xx_gpu.c and a4xx_gpu.c
currently has this snippet to set the bus speed:

    /*
     * Set the ICC path to maximum speed for now by multiplying the fastest
     * frequency by the bus width (8). We'll want to scale this later on to
     * improve battery life.
     */
    icc_set_bw(icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
    icc_set_bw(ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);

This should be fine for the time being. You'll want to document it
correctly in device tree though.

If the v2 changes too much, then feel free to drop my name from the
patch. I thought that I had made these changes already but apparently
not. :/

Brian
