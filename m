Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6844229CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 16:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236052AbhJEOCB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 10:02:01 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:32889 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236329AbhJEOAZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 10:00:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633442314; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=XKX6aXfP6Ig98Jdme9GL3cR1S40DlB+q0uUeu4G3KDY=;
 b=Eal8rAHwgv72MGJDgrA1RWmk6Y0nScUM+znhlJIzW1IkX5dS2ciASChfxj1ELZ7PuA5kzByq
 GrUzd85fBvAih7eTSJqeT2x+o8Omg7HBOzSjzFelMM1P/gZYhxRZ7LVJIta4eJ02K6tVvYBy
 zmuVDl4lXY/995sJFJYdSx+iqlo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 615c5a095f16bce668a116ba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 13:58:33
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ED0F5C359D5; Tue,  5 Oct 2021 13:58:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 44F17C43150;
        Tue,  5 Oct 2021 13:58:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 05 Oct 2021 19:28:30 +0530
From:   schowdhu@codeaurora.org
To:     Joe Perches <joe@perches.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org,
        ckadabi@codeaurora.org, tsoni@codeaurora.org,
        bryanh@codeaurora.org, psodagud@codeaurora.org,
        satyap@codeaurora.org, pheragu@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH V0 4/7] usb: common: eud: Added the driver support for
 Embedded USB Debugger(EUD)
In-Reply-To: <c56e78bc85cbe6b05dd16c750e596ab331c37dee.camel@perches.com>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
 <e6df4a21a283e822d15dedb7ffb3ae62c241999c.1633343547.git.schowdhu@codeaurora.org>
 <YVsu602phHbZLMOT@ripper>
 <c56e78bc85cbe6b05dd16c750e596ab331c37dee.camel@perches.com>
Message-ID: <576a1eac007ac512ba47d5d3f761ec9a@codeaurora.org>
X-Sender: schowdhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-05 12:44, Joe Perches wrote:
> On Mon, 2021-10-04 at 09:42 -0700, Bjorn Andersson wrote:
>> On Mon 04 Oct 04:16 PDT 2021, Souradeep Chowdhury wrote:
>> 
>> > Add support for control peripheral of EUD (Embedded USB Debugger) to
>> > listen to events such as USB attach/detach, pet EUD to indicate software
>> > is functional.Reusing the platform device kobj, sysfs entry 'enable' is
>> > created to enable or disable EUD.
> []
>> > diff --git a/drivers/usb/common/qcom_eud.c b/drivers/usb/common/qcom_eud.c
> []
>> > +static ssize_t enable_show(struct device *dev,
>> > +		struct device_attribute *attr, char *buf)
>> > +{
>> > +	struct eud_chip *chip = dev_get_drvdata(dev);
>> > +
>> > +	return sprintf(buf, "%d", chip->enable);
> 
> trivia:
> 
> should probably use sysfs_emit and have a trailing '\n' in the format.

Ack
