Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15D2231429C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 23:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbhBHWLd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 17:11:33 -0500
Received: from relay08.th.seeweb.it ([5.144.164.169]:43313 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhBHWLc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 17:11:32 -0500
Received: from [192.168.1.101] (abac187.neoplus.adsl.tpnet.pl [83.6.166.187])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 437B03E7B5;
        Mon,  8 Feb 2021 23:10:20 +0100 (CET)
Subject: Re: [PATCH v4 2/2] interconnect: qcom: Add SDM660 interconnect
 provider driver
To:     AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Georgi Djakov <georgi.djakov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, marijns95@gmail.com,
        martin.botka1@gmail.com, MSM <linux-arm-msm@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20201017133718.31327-1-kholk11@gmail.com>
 <20201017133718.31327-3-kholk11@gmail.com>
 <24ad51dd-ff54-35af-a7bc-92d8cfa30c48@linaro.org>
 <CAK7fi1ZC8F57WmDg57tAS=b++ewjPcMhBXmeuM7Cjqkp-5Zu9Q@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <55f89461-607a-8864-ff31-77d16448128c@somainline.org>
Date:   Mon, 8 Feb 2021 23:09:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAK7fi1ZC8F57WmDg57tAS=b++ewjPcMhBXmeuM7Cjqkp-5Zu9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MMCC got merged via the clk-next tree, so.. since this driver was technically in, say for the dt-bindings conflict.. can we get it merged again? :) 

Konrad
