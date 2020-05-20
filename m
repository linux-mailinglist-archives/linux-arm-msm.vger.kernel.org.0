Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D471A1DBD25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 20:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgETSnS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 14:43:18 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:56237 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726775AbgETSnS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 14:43:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590000198; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0P2VQJRaXtfQ2Tc7Ubm5P15zd9+AUrdFPbZkwYBI0Lc=;
 b=Acz3jgCQuVaGWGo166XfPY0coh/cCr9QYFjVuoIdHxwkOhHlsG1nSzm0OAxCVhGxq4/SepRx
 4ORGLITI8qvM2b6o0nFrEvjlxtvgaD8OSLMU+nf92IGNcZcKaBJYu9snMVUrFKzpTHlJ90Be
 n7/twCF5MeXSuO3CdWy+MfaaPrw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec57a38.7f21c8d76068-smtp-out-n02;
 Wed, 20 May 2020 18:43:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A4FD1C433C8; Wed, 20 May 2020 18:43:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2846FC433C9;
        Wed, 20 May 2020 18:43:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 20 May 2020 11:43:03 -0700
From:   bbhatt@codeaurora.org
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        hemantk@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] bus: mhi: core: Introduce independent voting
 mechanism
In-Reply-To: <a12e693d-a8bb-3ecf-e799-c46de7429b5d@codeaurora.org>
References: <1589832241-13867-1-git-send-email-bbhatt@codeaurora.org>
 <1589832241-13867-3-git-send-email-bbhatt@codeaurora.org>
 <a12e693d-a8bb-3ecf-e799-c46de7429b5d@codeaurora.org>
Message-ID: <574a4fe915f86608b59f10577eb960e9@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-20 09:54, Jeffrey Hugo wrote:
> On 5/18/2020 2:03 PM, Bhaumik Bhatt wrote:
>> Allow independent votes from clients such that they can choose to vote
>> for either the device or the bus or both. This helps in cases where 
>> the
>> device supports autonomous low power mode wherein it can move to M2
>> state without the need to notify the host. Clients can also vote only 
>> to
>> keep the underlying bus active without having the device in M0 state 
>> to
>> support offload use cases.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
> 
> I wonder, why doesn't this fit with runtimePM?
Hi Jeff,

Can you elaborate?

In short, with this patch, MHI just wants to give controller the option 
to
choose the vote type so we can implement autonomous low power mode 
entries
on both host and device.

Let us know if you need some more information.

Thanks,
Bhaumik
