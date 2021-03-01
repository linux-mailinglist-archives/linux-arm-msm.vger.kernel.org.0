Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E46243280CA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 15:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236323AbhCAO2V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 09:28:21 -0500
Received: from m-r1.th.seeweb.it ([5.144.164.170]:35197 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236311AbhCAO2K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 09:28:10 -0500
Received: from [192.168.1.101] (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id D0EFC1F695;
        Mon,  1 Mar 2021 15:27:06 +0100 (CET)
Subject: Re: [PATCH] qcom: spmi-regulator: Add support for ULT LV_P50 and ULT
 P300
To:     Mark Brown <broonie@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210225213514.117031-1-konrad.dybcio@somainline.org>
 <20210301142359.GA20302@sirena.org.uk>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <eff6b950-45fa-9a1e-8596-1646916f25f7@somainline.org>
Date:   Mon, 1 Mar 2021 15:27:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301142359.GA20302@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 01.03.2021 15:23, Mark Brown wrote:
> On Thu, Feb 25, 2021 at 10:35:13PM +0100, Konrad Dybcio wrote:
>> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>>
>> The ULT LV_P50 shares the same configuration as the other ULT LV_Pxxx
>> and the ULT P300 shares the same as the other ULT Pxxx.
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Yeah, sorry for that.. We've had these changes for a veery long time and it now the fact that the commit title was sub-optimal went under our radar.. Hopefully won't happen again!


Konrad

