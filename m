Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15D0260223A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 05:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbiJRDLb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 23:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbiJRDJm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 23:09:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 957969B842;
        Mon, 17 Oct 2022 20:07:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5B25861370;
        Tue, 18 Oct 2022 03:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333C5C43140;
        Tue, 18 Oct 2022 03:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666062445;
        bh=RWK5Jt6x6t6Aflhbksqnm8KcBzIAiFiCHz7ec9/zo2M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JGVBxn981NqSPRdpBGnZ7gan1blU3mzAnoACE75ABmnPAt2rz9x/X1oTXgAr+/rR/
         w1ceNDr7h7WfrkSiz5Oor/+XWx2/6tB1MnPrw4nY0U5U/0bY5MskwZkSYrAo17VO03
         m5tcXGpk1V5iNThQVcGIf0ZENohEhf6E0TwA+cd28lD8IS6sv1G27zjKRhlkePVMgx
         w9NR4vHzWEaInuhNvtgYVuk/6elzgOaulE6eEHk5qVqNY17yMlYxD+sLbLmidW1hGQ
         bT7D199fesafXtwCRbYepfHlJ4njAGQLQlflGttFQ30HnvWB1tVBETArDOsZU18/dn
         zqGPucuGbGQMw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-arm-msm@vger.kernel.org, mailingradian@gmail.com
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH v2 0/2] SDM670 Power Domains
Date:   Mon, 17 Oct 2022 22:05:58 -0500
Message-Id: <166606235837.3553294.2518659755188451529.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221004221130.14076-1-mailingradian@gmail.com>
References: <20221004221130.14076-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 4 Oct 2022 18:11:28 -0400, Richard Acayan wrote:
> Changes since v1:
>  - accumulate review tags (reviewers are probably not the maintainers
>    who are meant to apply this)
>  - remove minor grammatical error in the cover letter
> 
> These are the power domains for the Qualcomm Snapdragon 670. I haven't
> tried to turn on EBI with pd_ignore_unused but it is not present in
> Google's msm-4.9 vendor kernel.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: power: rpmpd: add sdm670 power domains
      commit: 9ba5080e688d0e37a0d93bb63d83199d464debf4
[2/2] soc: qcom: rpmhpd: add sdm670 power domains
      commit: 5faeae4eac74685c3eda3e55bc3725a331ecd09d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
