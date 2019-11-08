Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46D3AF5B77
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 23:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbfKHW4n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 17:56:43 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:50582 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbfKHW4n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 17:56:43 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A980760D88; Fri,  8 Nov 2019 22:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573253802;
        bh=bpzQIR/rtrIUydYIqqjWT+9eSVprmONvp/FnuZUE9h0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XbYk7+Pd79sU4LsT8zhN7fAymmLTG/oB8VMfGkYsWCpHlWUz787gQtqjBnRtr4GLZ
         XGWY9+UcvF857Qxy54RW5ntndPnD/u2YU4qtIgE7tZGWc/yhIOYi5m1cqvjBDgBVi2
         ztDBB5XoUpOmNsVjfRnLyOLDevRgWV95USyOPwWw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7375F601B4;
        Fri,  8 Nov 2019 22:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573253801;
        bh=bpzQIR/rtrIUydYIqqjWT+9eSVprmONvp/FnuZUE9h0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=F3Y107tsHPpi9QBssxvMlOvNuAWnVXPT8uhP3DfzfiOze6GDJRqMxv/r1lm2gPmty
         w4oZALc+YUMBo+xKHjxMifNNnHNGfZnFZPLofmn4UVQKimjEulVjgQpLq3OTKHF3rJ
         lB1m9m6XWaK/qaPdOth3EeFB9cwHGg4lN/rZiJME=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7375F601B4
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v7 5/6] clk: qcom: Add MSM8998 Multimedia Clock Controller
 (MMCC) driver
To:     Stephen Boyd <sboyd@kernel.org>, mturquette@baylibre.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <1573247450-19738-1-git-send-email-jhugo@codeaurora.org>
 <1573247677-20965-1-git-send-email-jhugo@codeaurora.org>
 <20191108224446.3A84A214DA@mail.kernel.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <21ed58f1-cad3-2a19-5cd0-d162a5dc7332@codeaurora.org>
Date:   Fri, 8 Nov 2019 15:56:39 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191108224446.3A84A214DA@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/8/2019 3:44 PM, Stephen Boyd wrote:
> Quoting Jeffrey Hugo (2019-11-08 13:14:37)
>> Add a driver for the multimedia clock controller found on MSM8998
>> based devices. This should allow most multimedia device drivers
>> to probe and control their clocks.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
> 
> Driver looks good.
> 
> Can you resend with minor fixes to binding and not include dts changes
> in the series? I can then apply the whole series once Rob acks/reviews
> the binding updates.
> 

Sounds good.  Will do.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
