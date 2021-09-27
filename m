Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C16B418E5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 06:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbhI0E2X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 00:28:23 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:38763 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbhI0E2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 00:28:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632716806; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=U7xwWG86NJbZVo9kJK4fvbMP5O7Q8h2IyIEICsOkjnA=;
 b=rk6uT67Ak2X0lahOU4+2Ho9G9+A8aqOsiJqW20SPC/N46BRtO7pNe4BvlzogfieHzw2L75vF
 BfE2vxRIoDFq8ury0I1zDEIpKCuuCGdv3A+L5R5OTXPsTCW4Wa3xVo5ae9dWw8vgKldJ76t+
 LdF3wlxo8W6JiadIkuBaatCGKvA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 615148001abbf21d3478e027 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Sep 2021 04:26:40
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9BF9AC4361A; Mon, 27 Sep 2021 04:26:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B3177C4338F;
        Mon, 27 Sep 2021 04:26:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 27 Sep 2021 09:56:38 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Tao Zhang <quic_taozha@quicinc.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8250: Add Coresight support
In-Reply-To: <1632710581-11896-1-git-send-email-quic_taozha@quicinc.com>
References: <1632710581-11896-1-git-send-email-quic_taozha@quicinc.com>
Message-ID: <8ff1838f88670cc401a35dc43cc43feb@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Tao,

On 2021-09-27 08:13, Tao Zhang wrote:
> Add the basic coresight components found on Qualcomm SM8250 Soc. The
> basic coresight components include ETF, ETMs,STM and the related
> funnels.
> ETM verification and use of Coresight components need Coresight
> support in this device tree. Since the ETR sink needs SMMU support,
> and SMMU has not been enabled on RB5. ETR is not added to this patch,
> and it will be added once SMMU is enabled on RB5. ETF sink has been
> added to the device tree for RB5.
> 

RB5 board is based on SM8250 SoC and coresight is a SoC level IP (won't
change per board, although can be disabled per board) and as such these
coresight dt nodes should be in sm8250.dtsi (please look at other 
examples
in SM8150/SC7180/SC7280).

Similarly SMMU support is not per board (RB5), it's already supported
for SM8250 long time back (check for apps_smmu in sm8250.dtsi), so you
can add ETR support when you post v3 (note this patch which you have
posted should have been v3 as v2 was your previous version). You can 
just
post one patch with the coresight dt entries as the ETM driver patch is
already queued by Suzuki in coresight tree. You can use the following 
qcom
tree [1] when posting DT for QCOM devices (branch: for-next), also 
please
remember to *sort the nodes by address*.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/?h=for-next

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
