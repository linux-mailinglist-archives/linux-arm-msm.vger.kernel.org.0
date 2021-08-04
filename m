Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 849863E08F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 21:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbhHDTsK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 15:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238128AbhHDTsJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 15:48:09 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7F9C0613D5
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Aug 2021 12:47:56 -0700 (PDT)
Received: from [192.168.1.101] (83.6.167.155.neoplus.adsl.tpnet.pl [83.6.167.155])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A8BAC3F3FD;
        Wed,  4 Aug 2021 21:47:53 +0200 (CEST)
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sc7280-idp: Add device tree
 files for IDP2
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, skakit@codeaurora.org,
        swboyd@chromium.org, dianders@chromium.org, mka@chromium.org
References: <1628082199-17002-1-git-send-email-rnayak@codeaurora.org>
 <1628082199-17002-3-git-send-email-rnayak@codeaurora.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <0cb8bf79-697c-ff16-e37e-d1c783f8a207@somainline.org>
Date:   Wed, 4 Aug 2021 21:47:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1628082199-17002-3-git-send-email-rnayak@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 04.08.2021 15:03, Rajendra Nayak wrote:
> Move all the common device tree bits for both sc7280 IDPs into a
> sc7280-idp.dtsi and create 2 different dts files (sc7280-idp.dts
> and sc7280-idp2.dts) in order to manage differences across the
> IDP SKU1 and SKU2 Boards.
> PMR735A is present on IDP board only and is not present on IDP2.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts            | 328 +--------------------

I'm still for calling this sc7280-idp-sku1/2.dts, but other than that it looks good.


Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


