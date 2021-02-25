Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8D23256B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 20:30:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234905AbhBYTaU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 14:30:20 -0500
Received: from m-r1.th.seeweb.it ([5.144.164.170]:41083 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234633AbhBYT2I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 14:28:08 -0500
X-Greylist: delayed 1046 seconds by postgrey-1.27 at vger.kernel.org; Thu, 25 Feb 2021 14:28:08 EST
Received: from [192.168.1.101] (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 95A3B1F534;
        Thu, 25 Feb 2021 20:27:21 +0100 (CET)
Subject: Re: [PATCH 6/6] clk: qcom: gcc-sdm660: Add CLK_SET_RATE_PARENT where
 applicable
To:     Stephen Boyd <sboyd@kernel.org>, phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Craig Tatlor <ctatlor97@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210220155618.176559-1-konrad.dybcio@somainline.org>
 <20210220155618.176559-6-konrad.dybcio@somainline.org>
 <161404097084.1254594.16485341937086704738@swboyd.mtv.corp.google.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <2eb68f3c-d088-2b4d-2eec-347d7b11decc@somainline.org>
Date:   Thu, 25 Feb 2021 20:27:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161404097084.1254594.16485341937086704738@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 23.02.2021 01:42, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2021-02-20 07:56:17)
>> Some branch clocks should explicitly set this flag to make sure
>> they inherit their frequencies from the parent clock.
> This flag doesn't have anything to do with inheriting the rate from the
> parent.
>
Right. "Some branch clocks should explicitly set this flag to make sure the frequency changes are propagated to their respective parents if need be." should sound better.


Konrad

