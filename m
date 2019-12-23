Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93BED129470
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2019 11:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfLWKwL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 05:52:11 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:35626 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726899AbfLWKwK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 05:52:10 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577098330; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hkjikJp3XaCfc6bZuCsI/oIV1E7upQ3OIGiTGTGFKyA=;
 b=fehmZGdMQhWiftsBN5mdToID2Wx1VmUNDuHna9L5xUk8icmTpP8O+Shy9UUqdoFxzT2k2Fgi
 sVgp/A/nEVr6xd2bVTJaCt9GBjhzVpgz6Xi07hr3ctPp3TMJN4wfELyj87HH0HTsgDGmsu51
 H6wW31ZI7gQ5SgtL3RyTrjQkZFk=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e009c58.7f4d523bb730-smtp-out-n02;
 Mon, 23 Dec 2019 10:52:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 24D9AC433A2; Mon, 23 Dec 2019 10:52:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sthella)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ED7FEC43383;
        Mon, 23 Dec 2019 10:52:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Dec 2019 16:22:07 +0530
From:   sthella@codeaurora.org
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Anirudh Ghayal <aghayal@codeaurora.org>, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] nvmem: add QTI SDAM driver
In-Reply-To: <b6a6ce09-2af6-0c67-bb24-e5066d819897@linaro.org>
References: <1576753570-23515-1-git-send-email-sthella@codeaurora.org>
 <b6a6ce09-2af6-0c67-bb24-e5066d819897@linaro.org>
Message-ID: <bc32e596831212e85e39d1193865aa99@codeaurora.org>
X-Sender: sthella@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-19 16:41, Srinivas Kandagatla wrote:
> On 19/12/2019 11:06, Shyam Kumar Thella wrote:
>> +static const struct of_device_id sdam_match_table[] = {
>> +	{ .compatible = "qcom,spmi-sdam" },
>> +	{},
>> +};
> 
> This patch can not be accepted without Device tree bindings documented.
Sure. I will add the DT documentation for it.
> 
> --srini
