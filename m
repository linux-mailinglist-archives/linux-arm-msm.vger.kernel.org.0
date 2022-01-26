Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB5D149D3CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 21:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbiAZUoB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jan 2022 15:44:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbiAZUoB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jan 2022 15:44:01 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ABBDC06173B
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 12:44:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B9F2AB82013
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 20:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77A2DC340EA;
        Wed, 26 Jan 2022 20:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643229838;
        bh=wUiyzo/ZjfHcHnGdSlZkVPBVvRu4Fm7vRpBJDboxMYs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ctnZPNRV4XdkbYT6vPZliddOhc5pU4vopq87asTGXEKIWwFni2j85nkHdSYO7NO/t
         iV/DUtjIKYZQYlNEKzIDQoZm2GqM3iuQzx7M97hnH6n2UA8vgI2H9Ohk0kBrrsxPkp
         WV84fifD1JS1obKOhn01fghauijpYDQrv0hJYc9q36faGWzJXamb2f0rVSsQoDJlCA
         s4+ELizaYD8o8NWQGYQ/CHl4SKhg2d3b74qntHFbzr25kC0Bbdwl2g+ODSxDaWeODe
         sL3xMokV/Ci4sPqiyIVp9NYYekY/t65KbcY1BhYnsUgs5IEgtrzJUzVgq1boh6zOnJ
         Fyeo4ZhSSX3/A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 598F5E5D089;
        Wed, 26 Jan 2022 20:43:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-binding: soc: qcom: convert Qualcomm Command DB
 documentation to yaml
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164322983836.21535.12467900662174377321.git-patchwork-notify@kernel.org>
Date:   Wed, 26 Jan 2022 20:43:58 +0000
References: <20211218184617.19923-1-david@ixit.cz>
In-Reply-To: <20211218184617.19923-1-david@ixit.cz>
To:     David Heidelberg <david@ixit.cz>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (for-next)
by Rob Herring <robh@kernel.org>:

On Sat, 18 Dec 2021 19:46:16 +0100 you wrote:
> Convert Qualcomm Command DB documentation into yaml format.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/reserved-memory/qcom,cmd-db.txt  | 37 ---------------
>  .../bindings/reserved-memory/qcom,cmd-db.yaml | 46 +++++++++++++++++++
>  2 files changed, 46 insertions(+), 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/qcom,cmd-db.txt
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/qcom,cmd-db.yaml

Here is the summary with links:
  - dt-binding: soc: qcom: convert Qualcomm Command DB documentation to yaml
    https://git.kernel.org/qcom/c/92c3974ceea8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


