Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7050353C70
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 10:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232312AbhDEIkD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 04:40:03 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:11514 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231842AbhDEIkD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 04:40:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617611998; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JVZGK6nKznNaKGPdGtvDUf+GzgIviD/t/iszxilbzTU=;
 b=ewi2iXZ426XexFdowwtBXbpGyMnvJJ3fgga4MNlvnO+LoDO5aQp0guE79njxcXpeqt5ILYfl
 32oAxFGIUKvZQN0W6NrkX1VUwhHBgcU4ezNwNDwfYh4oo17rCK07fkOLl1av7PSWMFLllIuZ
 wQdXTqaA0QulP6D0nrDr5H+5IFA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 606accdcf34440a9d4717031 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Apr 2021 08:39:56
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A9879C43461; Mon,  5 Apr 2021 08:39:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3806CC433CA;
        Mon,  5 Apr 2021 08:39:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 05 Apr 2021 14:09:56 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        saiprakash.ranjan=codeaurora.org@codeaurora.org
Subject: Re: [PATCHv2 0/4] Enable various hardware blocks on SC7280 SoC
In-Reply-To: <cover.1615832893.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1615832893.git.saiprakash.ranjan@codeaurora.org>
Message-ID: <aa366984b231ccb7cb2a75aa9bc0fd1b@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 2021-03-16 00:05, Sai Prakash Ranjan wrote:
> This series enables various hardware blocks such as LLCC, IPCC, AOSS 
> QMP
> and Coresight on SC7280 SoC.
> 
> Changes in v2:
>  * Rename qmp to power-controller (Stephen)
>  * Drop the ipcc mailbox dt-binding from this series and send it 
> separately
>  * Collect review tags
> 
> Sai Prakash Ranjan (4):
>   arm64: dts: qcom: sc7280: Add device tree node for LLCC
>   arm64: dts: qcom: sc7280: Add IPCC for SC7280 SoC
>   arm64: dts: qcom: sc7280: Add AOSS QMP node
>   arm64: dts: qcom: sc7280: Add Coresight support
> 
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 520 +++++++++++++++++++++++++++
>  1 file changed, 520 insertions(+)

Gentle Ping!

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
