Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20F4E3A9A72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 14:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbhFPMcC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 08:32:02 -0400
Received: from m-r2.th.seeweb.it ([5.144.164.171]:34019 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbhFPMcB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 08:32:01 -0400
Received: from [192.168.1.101] (83.6.168.10.neoplus.adsl.tpnet.pl [83.6.168.10])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7DC893E7E1;
        Wed, 16 Jun 2021 14:29:53 +0200 (CEST)
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: sm8250-edo: Add hardware keys
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210616122708.144770-1-konrad.dybcio@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <d7584f80-8796-1ebf-0e83-8d63d707f61e@somainline.org>
Date:   Wed, 16 Jun 2021 14:29:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616122708.144770-1-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 16.06.2021 14:27, Konrad Dybcio wrote:
> Volume Down, GAssist (pdx206 only) and camera keys live on PMIC pins,
> with the latter kind being broken for now.. Add these and PON-connected
> Volume Up & PWR.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  .../qcom/sm8250-sony-xperia-edo-pdx206.dts    | 11 +++++++
>  .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 30 +++++++++++++++++++
>  2 files changed, 41 insertions(+)

Forgot to add, still depends on [1].


[1] https://patchwork.kernel.org/project/linux-arm-msm/patch/20210613124822.124039-1-konrad.dybcio@somainline.org/


Konrad

