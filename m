Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94FE0294F92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 17:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2444067AbgJUPJs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 11:09:48 -0400
Received: from z5.mailgun.us ([104.130.96.5]:17827 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2444043AbgJUPJs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 11:09:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603292987; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=yFmWiNHekQ4RHIngpO670iO7r5SStQl0dA1bVHiwHmY=;
 b=Fi9n+p3HJGBTTjLxn5P+kYnLhQdYDLClwS9VhUdXdkgqPGrP/CtTVODLzVdLdN5zJadUXzdI
 ln/pDTHSioq4l8RutvO4U+UUJOKA+vSlKJFh7NZQfSriW3i1v31GXdGNFigFqY2WxlL+rPH6
 OYQ0c4K66AO8JAMnJYVTAzBQylE=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f904f28a03b63d673b685c9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Oct 2020 15:09:28
 GMT
Sender: kgunda=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1888DC433FF; Wed, 21 Oct 2020 15:09:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6775BC433CB;
        Wed, 21 Oct 2020 15:09:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 21 Oct 2020 20:39:27 +0530
From:   kgunda@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rnayak@codeaurora.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH V3 1/2] mfd: qcom-spmi-pmic: Convert bindings to .yaml
 format
In-Reply-To: <160167515893.310579.11853207494346374403@swboyd.mtv.corp.google.com>
References: <1580997328-16365-1-git-send-email-kgunda@codeaurora.org>
 <5e3c63d0.1c69fb81.c2bba.0957@mx.google.com>
 <b638e342aae1f6866cad33ff408f2894@codeaurora.org>
 <160167515893.310579.11853207494346374403@swboyd.mtv.corp.google.com>
Message-ID: <e0ad4c3df21eb2dd2095adfa3f8ba37a@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-03 03:15, Stephen Boyd wrote:
> Quoting kgunda@codeaurora.org (2020-02-06 21:57:49)
>> On 2020-02-07 00:36, Stephen Boyd wrote:
>> > Quoting Kiran Gunda (2020-02-06 05:55:26)
>> >> Convert the bindings from .txt to .yaml format.
>> >>
>> >> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> >> ---
>> >
>> > Did something change? Is there a cover letter?
>> >
>> Other than converting the bindings to .yaml not much changed from the
>> previous post.
>> I will log the per patch changes in next post.
> 
> What happened to this series? It never got resent.
Couldn't get the chance to work on it. Will work on it and post the next 
patch in couple weeks.
