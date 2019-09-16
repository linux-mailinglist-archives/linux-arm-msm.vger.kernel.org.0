Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B23BB39BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2019 13:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbfIPLta (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Sep 2019 07:49:30 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:54640 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730110AbfIPLta (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Sep 2019 07:49:30 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 51C5D607F1; Mon, 16 Sep 2019 11:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568634569;
        bh=362FvmbOrDpv/n8GWlP8x1OdK6qMzvVMHzmjiK5OHYA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EQFRiXK5Xh3oXD1JJ3Cjvr1XqC8YszkWJFYfACreReQNRUo19Z5Ep2YTSrcl/4Eqh
         JVhB7sNWt2PjgVfyGgjwo5QqZyibhqzWFRWcay4AC5J+8HITnmZG6h+FNXA6kXGfZu
         kvE/rywlj+2aU7rKF9ygLI8w8CoWysFWPkn0saRY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id D165D6119F;
        Mon, 16 Sep 2019 11:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568634568;
        bh=362FvmbOrDpv/n8GWlP8x1OdK6qMzvVMHzmjiK5OHYA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jj93yY6D5y/BCAmhPK7eYpz/yHoqMKRWU4ybsfs1zNwY/3duo7DD9lxcHCo62J/vs
         8cHHI6WIinIhxeyNJjsn2ErUYwemOF1fmYKF4b8PcQ909z/8EtTu3FwUqOx34HLWcO
         Jf6NFDlsN/ElFQNEpO0NXfvgZhpmqqAvkNTB8EjM=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 16 Sep 2019 17:19:28 +0530
From:   gokulsri@codeaurora.org
To:     Rob Herring <robh@kernel.org>
Cc:     sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org,
        sricharan@codeaurora.org, nprakash@codeaurora.org
Subject: Re: [PATCH V2 06/12] dt-bindings: clock: qcom: Add reset for WCSSAON
In-Reply-To: <5d7c0ec8.1c69fb81.e5ca8.949d@mx.google.com>
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
 <1568375771-22933-7-git-send-email-gokulsri@codeaurora.org>
 <5d7c0ec8.1c69fb81.e5ca8.949d@mx.google.com>
Message-ID: <2648db96dbddadfce7c915a4877930ab@codeaurora.org>
X-Sender: gokulsri@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On 2019-09-14 03:18, Rob Herring wrote:
> On Fri, 13 Sep 2019 17:26:05 +0530, Gokul Sriram Palanisamy wrote:
>> Add binding for WCSSAON reset required for Q6v5 reset on IPQ8074 SoC.
>> 
>> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
>> ---
>>  include/dt-bindings/clock/qcom,gcc-ipq8074.h | 1 +
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
