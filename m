Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C938B3F8853
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 15:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237433AbhHZNJY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 09:09:24 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:16220 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhHZNJX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 09:09:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629983316; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=GvGLNakWkOXvKdRWu5dgzaNPgw7OE5BXr0vhWwyKYaM=;
 b=A7wewkKndhY0J+N9KOuyUf1HdmWaCbQvDVC/4urSPZjmuz4EzTEmbv7QUVTM8ZNcFzahYJ//
 cC7ycVuvMhHj6y/kzdj5m3PimLAoc/y7O8wRJyotaM4xmsc2YO+inaTwM8le/WTPYTosEHKN
 Lin8Y2GPp1WwJOpZnBtkVvASF+g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6127922dd6653df767738e36 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 13:07:57
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 74134C4360D; Thu, 26 Aug 2021 13:07:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F3CB3C4338F;
        Thu, 26 Aug 2021 13:07:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 26 Aug 2021 18:37:55 +0530
From:   rajpat@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org
Subject: Re: [PATCH V5 5/7] arm64: dts: sc7280: Configure debug uart for
 sc7280-idp
In-Reply-To: <YRVG3sK82lZhTAGL@google.com>
References: <1628754078-29779-1-git-send-email-rajpat@codeaurora.org>
 <1628754078-29779-6-git-send-email-rajpat@codeaurora.org>
 <YRVG3sK82lZhTAGL@google.com>
Message-ID: <78ce8ef43a3dd3360abb8e0d60d7fbe7@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-12 21:35, Matthias Kaehlcke wrote:
> On Thu, Aug 12, 2021 at 01:11:16PM +0530, Rajesh Patil wrote:
>> Configure uart5 as debug uart and split the pinctrl functions
>> to match with SoC dt.
>> 
>> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> 
> As I mentioned on '[4/7] arm64: dts: sc7280: Update QUPv3 UART5 DT 
> node',
> I think you need to squash the two patches to avoid breaking 
> (temporarily)
> the SC7280 IDP DT due to the undefined node 'qup_uart5_default'

Okay
