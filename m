Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A91AB39C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2019 13:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729648AbfIPLwi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Sep 2019 07:52:38 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55990 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727450AbfIPLwi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Sep 2019 07:52:38 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 349806122D; Mon, 16 Sep 2019 11:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568634757;
        bh=LaHmGWueNmsYk/D656wA0aGZrexsCWQGgwO0aGCmiGE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=In9KIYultjxOoWST2tltskBcjkzOprGHJitfOoRfuCim64zbSp818TR21uscGpERw
         CntysWppiFEpkOqu9bDq+LU4TbP2RjMK3i+wN2ZvH/PFbwxPHzkcHJFG+riewVxIJV
         YMJPLQvM5iw+AigpCu2yV13B41eg+i2iWBLRS79s=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 485E86119F;
        Mon, 16 Sep 2019 11:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568634756;
        bh=LaHmGWueNmsYk/D656wA0aGZrexsCWQGgwO0aGCmiGE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TRpgbyWT/a+h7u3LoVrOScXZygGsjCYxvaHP2dlWGjVl+vOwZa2hLvobNNNYhHVXk
         pqSrse0HBMQvdXBYwgabtI4d6lCArvDmllphas95CtnLkH727z65X8Uf2wzrRoB1AH
         9TNLYZTMCw8nQ57MpETyq1/GV+iAl8k2S+828Erg=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 16 Sep 2019 17:22:36 +0530
From:   gokulsri@codeaurora.org
To:     Rob Herring <robh@kernel.org>
Cc:     sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org,
        sricharan@codeaurora.org, nprakash@codeaurora.org
Subject: Re: [PATCH V2 08/12] dt-bindings: mailbox: qom: Add ipq8074 APPS
 compatible
In-Reply-To: <5d7c0ec9.1c69fb81.a7d47.78c1@mx.google.com>
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
 <1568375771-22933-9-git-send-email-gokulsri@codeaurora.org>
 <5d7c0ec9.1c69fb81.a7d47.78c1@mx.google.com>
Message-ID: <d65db92f678c11e270c7c3c64de19163@codeaurora.org>
X-Sender: gokulsri@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On 2019-09-14 03:18, Rob Herring wrote:
> On Fri, 13 Sep 2019 17:26:07 +0530, Gokul Sriram Palanisamy wrote:
>> Add mailbox support required in IPQ8074 SoCs.
>> 
>> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt | 
>> 1 +
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
