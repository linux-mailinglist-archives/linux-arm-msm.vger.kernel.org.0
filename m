Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 745EDB47DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 09:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391369AbfIQHH6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 03:07:58 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53110 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729435AbfIQHH5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 03:07:57 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 99E5361213; Tue, 17 Sep 2019 07:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568704076;
        bh=XOsx7e6qcaR44pSsilXmTVukrNoyBsfw/6ykaEalazM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OzN/Gtk3ZoKHZTgZ9fVTPVQjYnhNvVjgGjtX1Fo0ynsHKaifuPJLn8kufAPGIE0TX
         8vHOpxjusQHFbzSfpBdDlNp6dGOCjsI04vLPvnyM7fgUiCcA1rsBGDuIGHByQnZX0o
         EjOAtEEhUC91xbaBQgVVk+ay5SWTN+ihK0L6OKHo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id ADD53611FA;
        Tue, 17 Sep 2019 07:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568704075;
        bh=XOsx7e6qcaR44pSsilXmTVukrNoyBsfw/6ykaEalazM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hhmdmcsilLPeAHhlXWfXw65jWqnkKaLX+R2TlRiLkkxWwOrEo+SbpqwVS/ofH+jv3
         RPotvR/PIO6/LsG3mOksGG7ZmemEn5lWPStuLLSxvfG6i9B6i4foEOoibLjqtRudhx
         IeFtfpOeSqMDvo2rcHHCPc4yyKltEyj3GvhBly0U=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 17 Sep 2019 12:37:55 +0530
From:   gokulsri@codeaurora.org
To:     Rob Herring <robh@kernel.org>
Cc:     sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org,
        sricharan@codeaurora.org, nprakash@codeaurora.org
Subject: Re: [PATCH V2 10/12] dt-bindings: firmware: qcom: Add compatible for
 IPQ8074 SoC
In-Reply-To: <5d7c0ecb.1c69fb81.74810.a358@mx.google.com>
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
 <1568375771-22933-11-git-send-email-gokulsri@codeaurora.org>
 <5d7c0ecb.1c69fb81.74810.a358@mx.google.com>
Message-ID: <1472f76e742d576fa5d6c6cad7b40605@codeaurora.org>
X-Sender: gokulsri@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On 2019-09-14 03:18, Rob Herring wrote:
> On Fri, 13 Sep 2019 17:26:09 +0530, Gokul Sriram Palanisamy wrote:
>> Add compatible for IPQ8074 support.
>> This does not need clocks for scm calls.
>> 
>> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
>>  1 file changed, 1 insertion(+)
>> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. 
> However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.

  Sorry, missed it. Will add it.

Regards,
  Gokul
