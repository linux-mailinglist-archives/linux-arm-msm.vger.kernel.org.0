Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8BAF325C4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 05:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhBZEDw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 23:03:52 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:34995 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229498AbhBZEDw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 23:03:52 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614312213; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/AYYQ53KB6GkHI9+D+m4kG48J4CbiF9uvcpnz2Jpajg=;
 b=h9sg5L7stYepHS215GbVjzeOlz+4rSQ+NnPIugM46KgaJvhKCAA7IXcMpRUh12JmRax8ap+W
 bH98QEb/TAGC8m8yRv5o8rdro+A7+65GskECH3oizpqpijDc5uV7oOy/X42nC/xhU25FA9yD
 m9ijX2DhaqbVCpdSQ/L1LrHvYlY=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 603872f2ea793fa303d13935 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Feb 2021 04:02:58
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3A5EFC43461; Fri, 26 Feb 2021 04:02:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D02CEC433C6;
        Fri, 26 Feb 2021 04:02:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 26 Feb 2021 09:32:57 +0530
From:   skakit@codeaurora.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, rnayak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sc7280: Add RPMh regulators for
 sc7280-idp
In-Reply-To: <f640503a-d87a-6ecd-7acf-73be47402d92@somainline.org>
References: <1614155592-14060-1-git-send-email-skakit@codeaurora.org>
 <1614155592-14060-8-git-send-email-skakit@codeaurora.org>
 <f640503a-d87a-6ecd-7acf-73be47402d92@somainline.org>
Message-ID: <f4813aef015dc5991abc4c7a7a82835d@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-25 00:47, Konrad Dybcio wrote:
> Hi,
> 
> 
>> +	};
>> +
>> +	pm8350c-regulators {
>> +	compatible = "qcom,pm8350c-rpmh-regulators";
>> +	qcom,pmic-id = "c";
>> +		vreg_s1c_2p2: smps1 {
>> +			regulator-min-microvolt = <2190000>;
> 
> 
> The indentation on "compatible" and "qcom,pmic-id" is off.
> 

Okay, will correct this.

> 
> Konrad

Thanks,
Satya Priya
