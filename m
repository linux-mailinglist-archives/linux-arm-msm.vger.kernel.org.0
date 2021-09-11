Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8784B4079A5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Sep 2021 18:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232047AbhIKQyc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Sep 2021 12:54:32 -0400
Received: from ixit.cz ([94.230.151.217]:47570 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231894AbhIKQyc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Sep 2021 12:54:32 -0400
Received: from [192.168.1.138] (ixit.cz [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 5B19223B26;
        Sat, 11 Sep 2021 18:53:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1631379195;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fy867mwtI+btimF9yB6LpZbX58VDnX58NjAlCh8Ahe8=;
        b=NbEEM4YxsuUVwtUljRcIETxJiwq5LFdNTlBqVkDMHkVavZ5g92CbuP+vd8PfI1EXyu7lZx
        tcoCEnX8GMq5Q2iNrl4p10SnUPY/XTdyUyD8MJW3Iom4h29e3U5L/wR7l/U2p4D+yNnApl
        mthhFdhcPaaZp4TzfnvvFmCTxCsduj4=
Date:   Sat, 11 Sep 2021 18:51:58 +0200
From:   David Heidelberg <david@ixit.cz>
Subject: Re: [RFC PATCH] [v2] dt-bindings: arm/msm/qcom,idle-state convert to
 YAML
To:     Rob Herring <robh@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-Id: <M64AZQ.XHLJ2TTJASSV1@ixit.cz>
In-Reply-To: <YTvWaRCswQs9Mt6L@robh.at.kernel.org>
References: <20210908171453.53259-1-david@ixit.cz>
        <YTvWaRCswQs9Mt6L@robh.at.kernel.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thank you for the input, for now I applied option 1 to my another 
tegra-ehci binding (instead of having own file) and it lead to success, 
so I'll choose option 1 for this case too.
Best regards
David Heidelberg

On Fri, Sep 10 2021 at 17:04:25 -0500, Rob Herring <robh@kernel.org> 
wrote:
> On Wed, Sep 08, 2021 at 07:14:53PM +0200, David Heidelberg wrote:
>>  Switched maintainer from Lina to Bjorn.
>> 
>>  Doesn't fix:
>>  ```
>>  idle-states: 'spc' does not match any of the regexes: 
>> '^(cpu|cluster)-', 'pinctrl-[0-9]+'
>>  ```
>>  from colliding arm/idle-states.yaml .
> 
> Your options are:
> 
> - Drop this and add your node names and compatible strings to
> idle-states.yaml. A variation of this is change the QCom node names
> in dts files to match. Those look like the only real differences.
> 
> - Extract the common idle state node properties to a common schema to
> reference from both schemas.
> 
> I'd lean towards option 1 unless there are other variations of
> idle-state nodes that also need option 2.
> 
> Rob


