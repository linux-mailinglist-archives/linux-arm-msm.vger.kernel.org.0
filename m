Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 386C63340B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 15:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbhCJOtA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 09:49:00 -0500
Received: from relay05.th.seeweb.it ([5.144.164.166]:40099 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232894AbhCJOso (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 09:48:44 -0500
Received: from [192.168.1.101] (abac94.neoplus.adsl.tpnet.pl [83.6.166.94])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E137C3F646;
        Wed, 10 Mar 2021 15:48:42 +0100 (CET)
Subject: Re: [PATCH 11/18] arm64: qcom: sdm660: don't use underscore in node
 name
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210308060826.3074234-1-vkoul@kernel.org>
 <20210308060826.3074234-12-vkoul@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <6664e2a1-2706-d5dc-a004-cfc735cdcb05@somainline.org>
Date:   Wed, 10 Mar 2021 15:48:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210308060826.3074234-12-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 08.03.2021 07:08, Vinod Koul wrote:
> We have underscore (_) in node name so fix that up as well.
>
> Fix this by changing node name to use dash (-)
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm660.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

We might want to omit

this one,

arm64: qcom: sdm660: don't use empty memory node,

and

arm64: qcom: sdm660: use reg value for memory node


as our huge-630/660-feature-drop patchset removes all of the nodes in question from sdm660.dtsi and will hopefully be merged in this window


Konrad

