Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFAF846EC25
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 16:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240351AbhLIPvf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 10:51:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234711AbhLIPvf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 10:51:35 -0500
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDCFC061746
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 07:48:01 -0800 (PST)
Received: from [10.1.250.9] (riviera.nat.ds.pw.edu.pl [194.29.137.1])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 9B577200DE;
        Thu,  9 Dec 2021 16:47:59 +0100 (CET)
Message-ID: <dbc46d99-cb29-f92b-39ed-4fd612140dbe@somainline.org>
Date:   Thu, 9 Dec 2021 16:47:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v2 13/13] arm64: dts: qcom: sm8450: add i2c13 and i2c14
 device nodes
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211209103505.197453-1-vkoul@kernel.org>
 <20211209103505.197453-14-vkoul@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20211209103505.197453-14-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/12/2021 11:35, Vinod Koul wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Add device tree nodes for two i2c blocks: i2c13 and i2c14.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 52 ++++++++++++++++++++++++++++
>   1 file changed, 52 insertions(+)

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Konrad

