Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1982A6DB1D7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 19:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbjDGRjB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 13:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbjDGRiv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 13:38:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A72AB45D
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 10:38:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3CEF1612B8
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 17:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2D9C433AF;
        Fri,  7 Apr 2023 17:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680889116;
        bh=hE091Hc24zXy/mwHsxoB3IlJDCBXR69MzEJfr7kUpYM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p+GYGgLfJ+QhoPZYFV3j9VrGQH+V6d83DMFfYcELl4P86uKp1FVNW9ZX/kQYtDh5y
         F8LIlXVlYyB98nYUqdoQXJwFWvziRYFb28OD3DSBaEVB5Z3Rouz7B6RivoyjSpaUBt
         tygfRMlP1sPo+cOeOE0+oqRdgqmo6ICS6uJlndAZ4IwsyX7KsvKqdC+0v60CcB6vMq
         m6g6xrvkpOV2ipVl7i+gYDpUumo9OXohCIHyXKKvbpZrDFgmGYGlFjpBu/o/jNPJLn
         kz6pLbeXaLrieZbc5qheFzbvn54BMrD32eIi6IX1ctkXm/TBowiqrH2Y8AqcjjbDP0
         zfqcIGMRN7kcg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Petr Vorel <pvorel@suse.cz>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Jamie Douglass <jamiemdouglass@gmail.com>,
        Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [PATCH 0/2] msm8994-angler memory overlap fixes
Date:   Fri,  7 Apr 2023 10:41:14 -0700
Message-Id: <168088927579.2561591.11641262449620000771.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230131200414.24373-1-pvorel@suse.cz>
References: <20230131200414.24373-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 31 Jan 2023 21:04:12 +0100, Petr Vorel wrote:
> NOTE: this should be applied on the top of Jamie's patch [1].
> (I'll rebase it if changes needed.)
> 
> Kind regards,
> Petr
> 
> [1] https://lore.kernel.org/linux-arm-msm/20230128055214.33648-1-jamiemdouglass@gmail.com/
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: msm8994-angler: Fix cont_splash_mem mapping
      commit: fe88480a6be92ecbf6f205ff3a7d7e5ded0562dd
[2/2] arm64: dts: msm8994-angler: removed clash with smem_region
      commit: c85c8a992794dfcd7cea7a41871710c27c5592a6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
