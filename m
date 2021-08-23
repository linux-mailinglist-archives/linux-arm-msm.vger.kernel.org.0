Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08F1D3F49FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 13:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235953AbhHWLox (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 07:44:53 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:51817 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235508AbhHWLow (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 07:44:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629719050; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=6xSeFmuwaQ9BgUSDnUvEjqhFQzFuafgbxk/M2+LZHKg=;
 b=aKPG2XEJL2+bhlNyD+4aWEGFQixwr1JCrIA9ZUYRONoCXS8GVeUhpk5Wi2m3kWc2qIWIxWg8
 xGYiLMZcDYw/TXSaPZf0Ha0/3590CNhIVCMkNvHJiIMrKVknIlwPm9SwfJagDyMfAuM/NGQR
 FXtq9brfeKN5PBIb4qj6DMIHHYI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61238a062b9e91b688271685 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Aug 2021 11:44:06
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E86C0C4360D; Mon, 23 Aug 2021 11:44:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C6EAC4338F;
        Mon, 23 Aug 2021 11:44:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Aug 2021 17:14:05 +0530
From:   rajpat@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org
Subject: Re: [PATCH V5 2/7] arm64: dts: sc7280: Configure SPI-NOR FLASH for
 sc7280-idp
In-Reply-To: <YRUe2qgbGTA18WkH@google.com>
References: <1628754078-29779-1-git-send-email-rajpat@codeaurora.org>
 <1628754078-29779-3-git-send-email-rajpat@codeaurora.org>
 <YRUe2qgbGTA18WkH@google.com>
Message-ID: <61d47c82a1e227f3e646f966815e28ac@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-12 18:45, Matthias Kaehlcke wrote:
> On Thu, Aug 12, 2021 at 01:11:13PM +0530, Rajesh Patil wrote:
>> Add spi-nor flash node and pinctrl configurations for the same.
> 
> nit: better name SC7280 IDP explicitly rather than saying 'the same'.
> 

ok.I will change it

>> 
>> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> 
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

