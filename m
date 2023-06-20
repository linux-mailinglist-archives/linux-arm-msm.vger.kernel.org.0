Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8013773761D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 22:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjFTUfP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 16:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjFTUfP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 16:35:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A765F1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 13:35:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AB428611B2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 20:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06427C433C8;
        Tue, 20 Jun 2023 20:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687293313;
        bh=L6C55bLH2MmOAb1RFlwgD1LvVJ33Fgkb0bgADj5i8to=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sdCtAt9wA/e4f07TlKewZZi1SYQl+7RGIW+cUQej1hrqiTwRFv/+KEa2N7OhIVs9r
         200DDhzUuxLdRajcS7CmlxRs9YrUA0c49KuK0/gGxlFI4g0wBxvWpjGnDVqOaLtPl+
         ikhkJbfNtCUVzvde/VNPBebq2vudbIY+rPF3I0uakspi3UYnr75MQ9t3d5KCjzekdx
         0p92PTpVq4XxMBRDJ094NkQzeFuifuI0+Qe/TzfuP+zMRMon0R7VzyObGxAAOZQQKR
         XnrBclqp6IdKXVxbf4b0ompn4FweBPjI7PhBRWQ86OFPGO9RRLbWAvT8nNxGooMtoQ
         3znf0xl+NF3/Q==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1qBi4E-006tCY-GZ;
        Tue, 20 Jun 2023 21:35:10 +0100
MIME-Version: 1.0
Date:   Tue, 20 Jun 2023 21:35:10 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     neil.armstrong@linaro.org
Cc:     Joey Gouly <joey.gouly@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>, nd@arm.com,
        broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
        mark.rutland@arm.com, oliver.upton@linux.dev, shuah@kernel.org,
        suzuki.poulose@arm.com, will@kernel.org, yuzenghui@huawei.com,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v4 16/20] arm64: enable Permission Indirection Extension
 (PIE)
In-Reply-To: <c3598e8e-46a5-c8d6-bf9f-9fb8f6cd346e@linaro.org>
References: <20230606145859.697944-1-joey.gouly@arm.com>
 <20230606145859.697944-17-joey.gouly@arm.com>
 <c3598e8e-46a5-c8d6-bf9f-9fb8f6cd346e@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <1c70fa1065b313d314707f22386972e3@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: neil.armstrong@linaro.org, joey.gouly@arm.com, linux-arm-kernel@lists.infradead.org, andersson@kernel.org, nd@arm.com, broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com, mark.rutland@arm.com, oliver.upton@linux.dev, shuah@kernel.org, suzuki.poulose@arm.com, will@kernel.org, yuzenghui@huawei.com, linux-arm-msm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-20 20:16, Neil Armstrong wrote:
> Hi Joey,
> 
> On 06/06/2023 16:58, Joey Gouly wrote:
>> Now that the necessary changes have been made, set the Permission 
>> Indirection
>> registers and enable the Permission Indirection Extension.
>> 
>> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> This patch on linux-next causes a great amount of:
> 
> X     xxx.xxxxxx Emulated RAZ for ID register: ISS 0x36002f
> 
> messages printed by the system firmware on the Qualcomm SM8550 SoC,
> and the platform is barely usable.

As others have said on this thread, this is a firmware bug.
Not a lot we can do about that, unfortunately, apart from hiding
the new feature behind a config option that you'd disable on this
platform.

Alternatively, disabling idle management on this machine should
reduce the screaming greatly.

         M.
-- 
Jazz is not dead. It just smells funny...
