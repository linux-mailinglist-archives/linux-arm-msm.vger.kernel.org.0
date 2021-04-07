Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0837357040
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 17:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353559AbhDGP3s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 11:29:48 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:35324 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353528AbhDGP3r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 11:29:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617809378; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=DVKNb5A78iTORV0azLcQs+g9NTPlXbIWsZsL3TS4CP0=;
 b=qkEyVEBWuT4hJX9NKp6C27hQ6AkCY7k3w9lzbZE7l+c7SQsIJsM3LY1nrzpFsR8/ziyAL8vH
 ONYd5mQ3pT8kYCjYzXBiSUi/USkN4vhMpZSs/v09RlBfMusptnpz1TKu0hxgc0Nlvs+m+Qok
 DuAnlrf6H1Fsn3KIpoHDp3TK7oE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 606dcfc88807bcde1d001a9b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Apr 2021 15:29:12
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4F0C2C433ED; Wed,  7 Apr 2021 15:29:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BFA27C433CA;
        Wed,  7 Apr 2021 15:29:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 07 Apr 2021 20:59:11 +0530
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V2 4/5] arm64: dts: qcom: pmr735a: Add PMIC peripherals
 for pmr735a
In-Reply-To: <YGdv5pKMr7jD32Le@google.com>
References: <1617268396-1837-1-git-send-email-skakit@codeaurora.org>
 <1617268396-1837-5-git-send-email-skakit@codeaurora.org>
 <YGdv5pKMr7jD32Le@google.com>
Message-ID: <2ba2d587de5f9cc5a4fbb348b70c2360@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-03 00:56, Matthias Kaehlcke wrote:
> Same comments as '[1/5] arm64: dts: qcom: pm7325: Add PMIC peripherals
> for pm7325', plus another nit:
> 
> '[3/5] arm64: dts: qcom: pmk8350: Add PMIC peripherals for pmk8350' has
> an ADC config for the die temperature of the pmr735a, hence it seems 
> this
> patch should be before the 'pmk8350' one in this series.
> 

Okay.

> On Thu, Apr 01, 2021 at 02:43:15PM +0530, satya priya wrote:
>> Add temp-alarm and GPIO support for pmr735a.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
