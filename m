Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5A823DC34
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 18:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729100AbgHFQrg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 12:47:36 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50486 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727081AbgHFQrd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 12:47:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596732452; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=ggOg6zyHd/BJyz6p09BxDxipcYys+9vo5wRtRWDV+Dw=; b=EgmbyLCaRT1EGPwcvbTy8nGPgTn3CyurZ1s/BxqHt+sk+o/fhJheJRMy4fE+MmFMY+8Fa0il
 EiaUj15xPdp1zgRYFqs2VR5rmLjm6L4rKaV9n8wSt3J1lSQkakXCXJAtVnakofgFM/7ca3km
 /XEadsAR6wrz/9suG8vBGjxa/Jc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5f2c1da548ee73b1c7a30a66 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 Aug 2020 15:11:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 75D15C4339C; Thu,  6 Aug 2020 15:11:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.129] (unknown [183.83.142.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rohitkr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 62261C433C9;
        Thu,  6 Aug 2020 15:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 62261C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rohitkr@codeaurora.org
Subject: Re: [PATCH v5 00/12] ASoC: qcom: Add support for SC7180 lpass variant
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1596528453-11437-1-git-send-email-rohitkr@codeaurora.org>
From:   Rohit Kumar <rohitkr@codeaurora.org>
Message-ID: <1aa197e8-0c11-e2f1-d067-c74c1a185b8a@codeaurora.org>
Date:   Thu, 6 Aug 2020 20:41:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1596528453-11437-1-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Mark,

Other than patch 12, there is no comment on other patches from anyone as 
of now.

[PATCH v5 12/12] dt-bindings: sound: lpass-cpu: Move to yaml format

I will plan to post patch12 only with comments addressed if other
changes does not have any comment. Please let me know your inputs.

Thanks,
Rohit
On 8/4/2020 1:37 PM, Rohit kumar wrote:
> This patch chain add audio support for SC7180 soc by doing the required
> modification in existing common lpass-cpu/lpass-platform driver.
> This also fixes some concurrency issue.
>
> This patch series is already tested by Srinivas on Dragon Board 410c.
> Changes since v4:
>          - Updated compatible string for sc7180 lpass cpu as suggested by Rob
>          - Addressed comments by Rob in yaml Documentation.
>
> Ajit Pandey (4):
>    ASoC: qcom: Add common array to initialize soc based core clocks
>    ASoC: qcom: lpass-platform: Replace card->dev with component->dev
>    include: dt-bindings: sound: Add sc7180-lpass bindings header
>    ASoC: qcom: lpass-sc7180: Add platform driver for lpass audio
>
> Rohit kumar (8):
>    ASoC: qcom: lpass-cpu: Move ahbix clk to platform specific function
>    ASoC: qcom: lpass-platform: fix memory leak
>    ASoC: qcom: lpass: Use regmap_field for i2sctl and dmactl registers
>    ASoC: qcom: lpass-cpu: fix concurrency issue
>    dt-bindings: sound: lpass-cpu: Add sc7180 lpass cpu node
>    ASoC: qcom: lpass-cpu: Use platform_get_resource
>    ASoC: qcom: lpass-platform: Use platform_get_irq
>    dt-bindings: sound: lpass-cpu: Move to yaml format
>
>   .../devicetree/bindings/sound/qcom,lpass-cpu.txt   |  79 --------
>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 179 +++++++++++++++++
>   include/dt-bindings/sound/sc7180-lpass.h           |  10 +
>   sound/soc/qcom/Kconfig                             |   5 +
>   sound/soc/qcom/Makefile                            |   2 +
>   sound/soc/qcom/lpass-apq8016.c                     |  86 ++++++--
>   sound/soc/qcom/lpass-cpu.c                         | 204 ++++++++++---------
>   sound/soc/qcom/lpass-ipq806x.c                     |  67 +++++++
>   sound/soc/qcom/lpass-lpaif-reg.h                   | 157 ++++++++-------
>   sound/soc/qcom/lpass-platform.c                    | 155 +++++++++++----
>   sound/soc/qcom/lpass-sc7180.c                      | 216 +++++++++++++++++++++
>   sound/soc/qcom/lpass.h                             |  63 +++++-
>   12 files changed, 924 insertions(+), 299 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>   create mode 100644 include/dt-bindings/sound/sc7180-lpass.h
>   create mode 100644 sound/soc/qcom/lpass-sc7180.c
>
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.

