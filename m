Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E94744DD5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 22:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhKKV6y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 16:58:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhKKV6y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 16:58:54 -0500
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95DACC061766
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 13:56:04 -0800 (PST)
Received: from [192.168.1.101] (83.6.165.118.neoplus.adsl.tpnet.pl [83.6.165.118])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 951AF2030E;
        Thu, 11 Nov 2021 22:56:02 +0100 (CET)
Message-ID: <8fca8096-0ab7-b819-2c50-65dbd657657d@somainline.org>
Date:   Thu, 11 Nov 2021 22:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [RFC PATCH 1/4] arm64: dts: qcom: sm8150: add dispcc node
Content-Language: en-US
To:     Katherine Perez <kaperez@linux.microsoft.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
References: <20211110170330.1789509-1-kaperez@linux.microsoft.com>
 <20211110170330.1789509-2-kaperez@linux.microsoft.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20211110170330.1789509-2-kaperez@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10.11.2021 18:03, Katherine Perez wrote:
> Add the display clock controller node to sm8150.
>
> Signed-off-by: Katherine Perez <kaperez@linux.microsoft.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Konrad

