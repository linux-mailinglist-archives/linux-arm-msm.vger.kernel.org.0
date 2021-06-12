Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8DBE3A5064
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jun 2021 21:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231557AbhFLTl2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Jun 2021 15:41:28 -0400
Received: from relay07.th.seeweb.it ([5.144.164.168]:45283 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231417AbhFLTl0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Jun 2021 15:41:26 -0400
Received: from [192.168.1.101] (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2C9873F356;
        Sat, 12 Jun 2021 21:39:24 +0200 (CEST)
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: Disable Adreno and Venus by
 default
To:     Rob Clark <robdclark@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Martin Botka <martin.botka@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        jamipkettunen@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210611113514.27173-1-konrad.dybcio@somainline.org>
 <CAF6AEGv3UivqUKb8wkCgzpApORV=ucswOzUh7BQMWRiif5ZJdw@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <94bf5d73-6939-75dc-46da-ddb8d6ae017a@somainline.org>
Date:   Sat, 12 Jun 2021 21:39:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGv3UivqUKb8wkCgzpApORV=ucswOzUh7BQMWRiif5ZJdw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11.06.2021 20:54, Rob Clark wrote:
> On Fri, Jun 11, 2021 at 4:35 AM Konrad Dybcio
> <konrad.dybcio@somainline.org> wrote:
>> Components that rely on proprietary (not to mention signed!) firmware should
>> not be enabled by default, as lack of the aforementioned firmware could cause
>> various issues, from random errors to straight-up failing to boot.
> I admit I probably don't test much without fw, but I think maybe
> *that* is the issue to solve instead.
>
> Taking a guess, I think the situation is that you have *some* of the
> fw (ie. the unsigned parts coming from linux-firmware) but not
> specifically the zap fw.  So adreno_zap_shader_load() returns -ENODEV,
> which is interpreted to mean "this is a platform that doesn't need zap
> to take GPU out of secure mode", and then things go boom when we try
> to write RBBM_SECVID_TRUST_CNTL ?

While we're not yet there to test that out on A6xx-equipped platforms,

my experience with lack ofAdreno firmware so far has been like so:


no ZAP, wrong ZAP address in the DT, bad ZAP - either a lockup or a reboot


no pm4/pfp - mostly a sane failing route with GPU just not activating after all,

yet still I can recall having some problems that I probably won't be able to

reproduce right now


no GMU fw - as stated before, can't really test properly just yet



Konrad

