Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D33493913AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 11:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233330AbhEZJbN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 05:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233240AbhEZJbN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 05:31:13 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC17C061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 02:29:42 -0700 (PDT)
Received: from [192.168.1.101] (83.6.168.54.neoplus.adsl.tpnet.pl [83.6.168.54])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A66E33E7B7;
        Wed, 26 May 2021 11:29:38 +0200 (CEST)
Subject: Re: [PATCH 1/7] arm64: dts: qcom: Add PMI8996 DTSI file
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210525200246.118323-1-konrad.dybcio@somainline.org>
 <YK29phlOthp1GdUh@builder.lan>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <9aa000f8-3790-11ca-ab85-245146422938@somainline.org>
Date:   Wed, 26 May 2021 11:29:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YK29phlOthp1GdUh@builder.lan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


> So I'm supposed to include this and the pmi8994? I was expecting an
> include of pmi8994.dtsi from here and then some override of the
> necessary properties.

This way we would have to get three dts files for each device:

one for device-common stuff, one including pmi8994 and one

including pmi8996. Otherwise pmi8994 contents would be included

twice, as the "base" device dt already includes pmi8994.


If you check how I solved that on Tone, I just took the pmi8994-equipped

phone dt as a baseline and only included this small dtsi as an overlay on top.


Konrad

