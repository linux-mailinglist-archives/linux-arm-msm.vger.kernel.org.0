Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52C5E22AB2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 10:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgGWI5t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 04:57:49 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:36566 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725911AbgGWI5t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 04:57:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595494668; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=uMsXblhmzZzd8eLTAl6l9gS/3WdMrBZGhkBeFqbIlWs=; b=BRankmmJbYW+rKO+7az1eAFuWdItT/GqvaL9sfkgpMIansMasYhfRWP2XGdp5fs9w0DuQomf
 p6COjumNdKZICCOsj98HKRvL/wkB1k6ZlKZQAlwX393HLzPvrI9EHYetdQtWAdIjFxF1NUPn
 xIU4gDF3jIiNl742igbRhloj5TA=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f1950fb1e603dbb447eb6a2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 23 Jul 2020 08:57:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 91BA2C433CB; Thu, 23 Jul 2020 08:57:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.104] (unknown [123.201.159.88])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: msavaliy)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5997AC433C9;
        Thu, 23 Jul 2020 08:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5997AC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=msavaliy@codeaurora.org
Subject: Re: [PATCH] soc: qcom-geni-se: Don't use relaxed writes when writing
 commands
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-kernel@vger.kernel.org
References: <20200722150113.1.Ia50ab5cb8a6d3a73d302e6bdc25542d48ffd27f4@changeid>
From:   "Mukesh, Savaliya" <msavaliy@codeaurora.org>
Message-ID: <c41ccd0e-e18b-02eb-79b7-2cad604b5090@codeaurora.org>
Date:   Thu, 23 Jul 2020 14:27:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722150113.1.Ia50ab5cb8a6d3a73d302e6bdc25542d48ffd27f4@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/23/2020 3:31 AM, Douglas Anderson wrote:
> Writing the command is the final step in kicking off a transfer.
> Let's use writel() to ensure that any other memory accesses are done
> before the command kicks off.  It's expected that this is mostly
> relevant if we're in DMA mode but since it doesn't appear to regress
> performance in a measurable way [1] even in PIO mode and it's easier
> to reason about then let's just always use it.
>
> NOTE: this patch came about due to code inspection.  No actual
> problems were observed that this patch fixes.
>
> [1] Tested by timing "flashrom -p ec" on a Chromebook which stresses
> GENI SPI a lot.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Mukesh Kumar Savaliya <msavaliy@codeaurora.org>
> ---
>
>   include/linux/qcom-geni-se.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> index dd464943f717..f50c73be1428 100644
> --- a/include/linux/qcom-geni-se.h
> +++ b/include/linux/qcom-geni-se.h
> @@ -262,7 +262,7 @@ static inline void geni_se_setup_m_cmd(struct geni_se *se, u32 cmd, u32 params)
>   	u32 m_cmd;
>   
>   	m_cmd = (cmd << M_OPCODE_SHFT) | (params & M_PARAMS_MSK);
> -	writel_relaxed(m_cmd, se->base + SE_GENI_M_CMD0);
> +	writel(m_cmd, se->base + SE_GENI_M_CMD0);
>   }
>   
>   /**
> @@ -282,7 +282,7 @@ static inline void geni_se_setup_s_cmd(struct geni_se *se, u32 cmd, u32 params)
>   	s_cmd &= ~(S_OPCODE_MSK | S_PARAMS_MSK);
>   	s_cmd |= (cmd << S_OPCODE_SHFT);
>   	s_cmd |= (params & S_PARAMS_MSK);
> -	writel_relaxed(s_cmd, se->base + SE_GENI_S_CMD0);
> +	writel(s_cmd, se->base + SE_GENI_S_CMD0);
>   }
>   
>   /**
