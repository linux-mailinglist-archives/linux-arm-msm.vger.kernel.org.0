Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2B1251827
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 14:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729283AbgHYMEY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 08:04:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32993 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729992AbgHYMBD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 08:01:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598356862; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RaE0nvM6498cSacjZ1LSCxECdE3SWE7NKgmJN9JMbME=;
 b=cYthpj3V1MtGZuPrd61JXt0EmivWTM4x0PdsEbiQezvaORXykqv6Ws7LYnXyhZugnG4776Oz
 kUMI+yROQ64r4ngdi1x6716isB2jF0dx3+5OI610LGW25vTWfFuBAqdwEkNsN0RKRG5Lfwxi
 w3pmLzWuY9hF8vI42XBDg4dafvI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f44fd4476c283d04f086865 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 25 Aug 2020 12:00:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 87070C43387; Tue, 25 Aug 2020 12:00:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: gokulsri)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0114EC433CB;
        Tue, 25 Aug 2020 12:00:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 25 Aug 2020 17:30:02 +0530
From:   gokulsri@codeaurora.org
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, govinds@codeaurora.org,
        sricharan@codeaurora.org
Subject: Re: [PATCH v8 0/4] Add non PAS wcss Q6 support for QCS404
In-Reply-To: <1596111244-28411-1-git-send-email-gokulsri@codeaurora.org>
References: <1596111244-28411-1-git-send-email-gokulsri@codeaurora.org>
Message-ID: <3476a019b5b847de979fb327183c3239@codeaurora.org>
X-Sender: gokulsri@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bjorn,

Awaiting your rewiew on this series [PATCH v8 0/4] Add non PAS wcss Q6 
support for QCS404 and the dependant series [v7,0/9] remoteproc: qcom: 
q6v5-wcss: Add support for secure pil 
(https://patchwork.kernel.org/cover/11692941/)


Thanks,
Gokul

On 2020-07-30 17:44, Gokul Sriram Palanisamy wrote:
> Changes since v7:
>  Addressed review comments from	Stephen Boyd
> 
> Changes since v6:
>  Removed duplicate structure entry added during rebase in v5
> 
> Changes since v5:
>  Rebased all the unmerged patches on top of linux-5.8-rc3
>  Added dt-binding for qcom,qcs404-wcss-pil
>  Removed typo
> 
> Changes since v4:
>  removed QDSP6SS clock controls and moved to wcss rproc.
>  renamed wcsccc to q6sstopcc.
>  cleanup/refactoring.
> 
> Changes since v3:
>  dt binding cleanup.
>  Fixed remoteproc recovery.
>  Added remoteproc dump support.
>  wcsscc cleanup/refactoring.
> 
> Changes since v2:
>  Removed unused properties.
>  Refactored code to have common logic b/w ipq8074 and QCS404, wherever 
> possible.
>  Added compatible example.
>  Removed wcss-protected bool.
> 
> Changes since v1:
>   Corrected clock names as per comments in v1 patch.
> 
> Govind Singh (4):
>   remoteproc: qcom: wcss: populate hardcoded param using driver data
>   dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL binding for QCS404
>   remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404
>   remoteproc: qcom: wcss: explicitly request exclusive reset control
> 
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   9 +
>  drivers/remoteproc/qcom_q6v5_wcss.c                | 591 
> +++++++++++++++++++--
>  2 files changed, 558 insertions(+), 42 deletions(-)
