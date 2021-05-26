Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7953920A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233554AbhEZTMy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233661AbhEZTMw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:12:52 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE075C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 12:11:19 -0700 (PDT)
Received: from [192.168.1.101] (83.6.168.54.neoplus.adsl.tpnet.pl [83.6.168.54])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id CAE61205F7;
        Wed, 26 May 2021 21:11:14 +0200 (CEST)
Subject: Re: [PATCH 5/6] clk: qcom: gcc-sdm660: Account for needed adjustments
 in probe function
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
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
 <20210220155618.176559-5-konrad.dybcio@somainline.org>
 <161404077336.1254594.15002572465360321874@swboyd.mtv.corp.google.com>
 <3917fba4-e5b0-911f-9220-f401a90aac38@somainline.org>
 <161724198675.2260335.14358880292682931985@swboyd.mtv.corp.google.com>
 <abc821cc-ef43-3241-793a-cc4c85b72563@somainline.org>
Message-ID: <dc4539a6-4a8b-91bc-791b-846ab0182a8f@somainline.org>
Date:   Wed, 26 May 2021 21:11:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <abc821cc-ef43-3241-793a-cc4c85b72563@somainline.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


I am aware that the comments I left are highly controversial and a bit emotional, but I'd still like to get a response. It's been almost two months and I have phones on the desk waiting for things to be merged, so that I can develop more things.


P.S. I still stand by my stance that the more info we can get about what's going on in the black boxes that we are not allowed to get docs for, the better for us, developers.


Konrad

