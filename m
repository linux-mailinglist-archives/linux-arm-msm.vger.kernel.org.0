Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37ACD298CEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Oct 2020 13:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1767800AbgJZMde (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 08:33:34 -0400
Received: from z5.mailgun.us ([104.130.96.5]:41099 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1775184AbgJZMde (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 08:33:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603715613; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=aB8jxsBoVocapT6f/NhJig0ZtzdQzBorSUsDjLb90Ww=;
 b=JMqGtZdm3dC7oCELT5QN9esR9iTX5Dl7gwaijFxfYfKCLgwhC1Utp8kkLk8BaxeFQOzPxsHY
 2hR66p7DuM2y2IGnD+vJT9nwS9vbmVvvZ6BR2aZtie0qp24CLjJJAfhHGSDUHJdQtyaJRn8t
 RRbpi9YPKRcnxPS/92iWRoQArEA=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f96c21cfcd46a2b769f0b83 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Oct 2020 12:33:32
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 97BE1C43385; Mon, 26 Oct 2020 12:33:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 11469C433CB;
        Mon, 26 Oct 2020 12:33:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 26 Oct 2020 18:03:31 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCHv5 0/2] soc: qcom: llcc: Support chipsets that can write to
 llcc regs
In-Reply-To: <cover.1600151951.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1600151951.git.saiprakash.ranjan@codeaurora.org>
Message-ID: <0e203a18049712173818f404b4a32163@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 2020-09-15 12:25, Sai Prakash Ranjan wrote:
> Older chipsets may not be allowed to configure certain LLCC registers
> as that is handled by the secure side software. However, this is not
> the case for newer chipsets and they must configure these registers
> according to the contents of the SCT table, while keeping in mind that
> older targets may not have these capabilities. So add support to allow
> such configuration of registers to enable capacity based allocation
> and power collapse retention for capable chipsets.
> 
> Reason for choosing capacity based allocation rather than the default
> way based allocation is because capacity based allocation allows more
> finer grain partition and provides more flexibility in configuration.
> As for the retention through power collapse, it has an advantage where
> the cache hits are more when we wake up from power collapse although
> it does burn more power but the exact power numbers are not known at
> the moment.
> 


Gentle ping!

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
