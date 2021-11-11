Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E87A44DD1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 22:35:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233659AbhKKVhu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 16:37:50 -0500
Received: from relay01.th.seeweb.it ([5.144.164.162]:43865 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbhKKVht (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 16:37:49 -0500
Received: from [192.168.1.101] (83.6.165.118.neoplus.adsl.tpnet.pl [83.6.165.118])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B40621F5C9;
        Thu, 11 Nov 2021 22:34:57 +0100 (CET)
Message-ID: <16a5be92-f3f5-b946-bd9f-150e6737203a@somainline.org>
Date:   Thu, 11 Nov 2021 22:34:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Add
 PWRKEY and RESIN
Content-Language: en-US
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexey Min <alexey.min@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Martin Botka <martin.botka@somainline.org>
References: <20211111031635.3839947-1-danct12@riseup.net>
 <20211111031635.3839947-5-danct12@riseup.net>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20211111031635.3839947-5-danct12@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11.11.2021 04:16, Dang Huynh wrote:
> This enables the volume down key as well as the power button.
> 
> Reviewed-by: Caleb Connolly <caleb@connolly.tech>
> Reviewed-by: Martin Botka <martin.botka@somainline.org>
> Reviewed-by: Konrad Dybcio <konradybcio@gmail.com>
Drop.

> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>  arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
