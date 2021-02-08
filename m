Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 033653133BF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 14:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbhBHNwM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 08:52:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbhBHNwK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 08:52:10 -0500
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B50BCC061788
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Feb 2021 05:51:12 -0800 (PST)
Received: from [192.168.1.101] (abad44.neoplus.adsl.tpnet.pl [83.6.167.44])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 98BCB1F4A2;
        Mon,  8 Feb 2021 14:51:08 +0100 (CET)
Subject: Re: [PATCH v2 3/9] clk: qcom: Add SDM660 Multimedia Clock Controller
 (MMCC) driver
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        agross@kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
 <20210113183817.447866-4-angelogioacchino.delregno@somainline.org>
 <2453cbae-bd30-416c-4432-9b27754670e1@linaro.org>
 <6ba8ac3c-d33b-3ab2-5855-f99d431b397a@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <01dac47b-2bc1-ee5d-960b-187385f7c108@somainline.org>
Date:   Mon, 8 Feb 2021 14:51:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <6ba8ac3c-d33b-3ab2-5855-f99d431b397a@somainline.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Any chance we could still get this in for 5.12? A LOT of features that we had ready for a few months heavily depend on MMCC and we can't proceed upstreaming them without this very driver.


Konrad

