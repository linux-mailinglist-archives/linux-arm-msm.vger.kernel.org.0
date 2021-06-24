Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4453B3726
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 21:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbhFXTnB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 15:43:01 -0400
Received: from relay07.th.seeweb.it ([5.144.164.168]:53211 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232816AbhFXTm5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 15:42:57 -0400
Received: from [192.168.1.101] (83.6.168.10.neoplus.adsl.tpnet.pl [83.6.168.10])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7B0A93F095;
        Thu, 24 Jun 2021 21:40:33 +0200 (CEST)
Subject: Re: [PATCH v2 2/2] clk: qcom: Add MSM8976/56 Global Clock Controller
 (GCC) driver
To:     Rob Herring <robh@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210612204317.11691-1-konrad.dybcio@somainline.org>
 <20210612204317.11691-2-konrad.dybcio@somainline.org>
 <20210624193954.GA1862253@robh.at.kernel.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <6b74c3e7-abeb-a179-b7c9-36d31a8d24d5@somainline.org>
Date:   Thu, 24 Jun 2021 21:40:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624193954.GA1862253@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


> This belongs in the binding patch and dual license it please.

Right, it was an older series and I overlooked it.


Konrad

