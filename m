Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0455391392
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 11:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233240AbhEZJ0P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 05:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233011AbhEZJ0O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 05:26:14 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A91C061574;
        Wed, 26 May 2021 02:24:43 -0700 (PDT)
Received: from [192.168.1.101] (83.6.168.54.neoplus.adsl.tpnet.pl [83.6.168.54])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5134A3EBD7;
        Wed, 26 May 2021 11:24:41 +0200 (CEST)
Subject: Re: [PATCH 2/7] arm64: dts: qcom: Add MSM8996v3.0 DTSI file
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210525200246.118323-1-konrad.dybcio@somainline.org>
 <20210525200246.118323-2-konrad.dybcio@somainline.org>
 <YK2+FfLrt+8ODVHb@builder.lan>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <8c050f61-8341-3bd1-b26e-13c61e364cc7@somainline.org>
Date:   Wed, 26 May 2021 11:24:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YK2+FfLrt+8ODVHb@builder.lan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


> Unused for now?
>
> Can you link it up this with the &gpu even if you don't enable it
> for now?

Indeed, actually applying the setting sounds like a good idea, heh.


The GPU will be enabled on a per-board basis like it's usually done,

but for tone we need to resolve the issue with fw loader complaining

about PT_LOAD header (it works fine if we omit the checks).


As for v3.0 specifically, it's a lottery and you might have a device with

either (with this one being much less probable afaiaa), so it's better to support both.


Konrad

