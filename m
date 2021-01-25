Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8CB303453
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 06:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732367AbhAZFWs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:22:48 -0500
Received: from relay05.th.seeweb.it ([5.144.164.166]:57207 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730387AbhAYPsU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 10:48:20 -0500
Received: from [192.168.1.101] (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E485E3EEEF;
        Mon, 25 Jan 2021 16:47:14 +0100 (CET)
Subject: Re: [PATCH 3/4] ARM: dts: qcom: msm8974-klte: add support for display
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Luca Weiss <luca@z3ntu.xyz>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <20210124135610.1779295-1-iskren.chernev@gmail.com>
 <20210124135610.1779295-3-iskren.chernev@gmail.com>
 <282b07a1-2e39-2dbe-dd7b-eed2ae9e25fb@somainline.org>
 <6632821.dtBD41K2ms@g550jk>
 <f02b945f-5546-6e15-17b5-74be8af8a501@somainline.org>
 <YA7maSZdp1EphINK@builder.lan>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <c8ac5b2b-8d1c-d652-de0d-07f38c77cd50@somainline.org>
Date:   Mon, 25 Jan 2021 16:47:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YA7maSZdp1EphINK@builder.lan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


> I know how bad it is, so I understand your desire to not have to rebase
> that, but I will merge things as they become ready on the list.
>
> So please post your change (perhaps it's posted and I'm failing to find
> it in my inbox?) and I'd be happy to merge it so we get it cleaned up!
>
> Thanks,
> Bjorn


Here it is: [1]


Be aware that it truly is humongous and should be split (I couldn't resist adding missing pins/dma while cleaning things up) and it.. was not really intended to be sent as-is. It's also supposed to work on the previous release of Linux, so some Samsung DTs in particular changed since and will need some manual rebasing. But I'll happily leave it as a reference if somebody has the time to pick it up. The konrad/8974 branch in this repo contains more (beware, GPU ones are untested!) 8974 fixes and I have some more on my drive that are.. not really ready for their prime time just yet either..


Konrad



[1] https://github.com/SoMainline/linux/commit/291ea6860f8b95df67d63fbd378d61b3a157ac15

