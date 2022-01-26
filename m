Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED1D649D3C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 21:44:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbiAZUn7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jan 2022 15:43:59 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:44500 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiAZUn7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jan 2022 15:43:59 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1C2666187A
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 20:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 800AFC340EB;
        Wed, 26 Jan 2022 20:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643229838;
        bh=EnPyyC0XZ2lWyuSfOj5lIZ7pMd/7Z5bqsiO/HBC/a18=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=G2XBxLgqecYeoTidoW4bOqU0LtP8cnX1yKl++IFlWaLWNO473pCGzSmk4oSvpFRyK
         ujHbiRXYNJEsMqmN2Aus5pCEMm70h85mwsBE90whvckyVKFYcnSEIESGyg9RPKtMDT
         4rw7kTDQpZeu2UimYwyxGlP43H/IfT1INcFA/vY55Slt38ZX4PpvW56s6aJ12XTeVA
         9cp26P/N56Kjs8CxIijQanP7TblsWMZ5HhzjZ0+4JyvFhwEqeRtXwGIw7X+7lklMoU
         pk8vFk/gS9sEk86hjOGEBMnNYwMUOdQBYQxjStVLMCecMtAo7YgkhmDIq+1tX5SsA5
         0BWxrrg62hW7A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 63C18E5D087;
        Wed, 26 Jan 2022 20:43:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] dt-binding: soc: qcom: convert rmtfs documentation to yaml
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164322983840.21535.12507768751591182390.git-patchwork-notify@kernel.org>
Date:   Wed, 26 Jan 2022 20:43:58 +0000
References: <20211218182816.17151-1-david@ixit.cz>
In-Reply-To: <20211218182816.17151-1-david@ixit.cz>
To:     David Heidelberg <david@ixit.cz>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (for-next)
by Rob Herring <robh@kernel.org>:

On Sat, 18 Dec 2021 19:28:16 +0100 you wrote:
> Convert Qualcomm Remote File System Memory binding to the yaml format.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> v2: also removed old txt binding file
>  .../reserved-memory/qcom,rmtfs-mem.txt        | 51 ------------------
>  .../reserved-memory/qcom,rmtfs-mem.yaml       | 53 +++++++++++++++++++
>  2 files changed, 53 insertions(+), 51 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.txt
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml

Here is the summary with links:
  - [v2] dt-binding: soc: qcom: convert rmtfs documentation to yaml
    https://git.kernel.org/qcom/c/f3a9f2b23c3c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


