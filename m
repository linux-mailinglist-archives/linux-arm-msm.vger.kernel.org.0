Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C53D4697AF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Feb 2023 12:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233588AbjBOLih (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Feb 2023 06:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233470AbjBOLif (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Feb 2023 06:38:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B7FA36456;
        Wed, 15 Feb 2023 03:38:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BF6B1B8212A;
        Wed, 15 Feb 2023 11:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C6BC4339B;
        Wed, 15 Feb 2023 11:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676461111;
        bh=GEGhQBwJhKB5uGEZCrbVyvrQHlkEYa/oj3PzWMLqoO4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bYRwKeocL2Wd5g1fa/CYXYw73nHewgZ0f6UKIAVdN6VWGY9qYmCCiHiM6NtVSLiyB
         jPu3MFqsHBglKV9jegSIwaRDCYaSFZOvl1QxODkLZOIaz1t76rkmwWuJDtDiUwW5LR
         nswPB0Eu8xACOe/rBITCo8RxgiWzmufuV/5OUELXRIDBkTXKBJViDCRY8x/zKQ6WwC
         /wu2i0hyDiYDk9Tzjo+sS7d6qjWJQh5mJ/B6satQZenHBNgqQ/cBoHvEGp5gZ8lM52
         iprLOSNd8jeyKtp/jH2gQRIA2biVVCj4S61UXB1/jtgSChtPT8bh6DgW3/kJQupela
         wtprqWAxFWj5Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1pSG7J-00AZUw-7C;
        Wed, 15 Feb 2023 11:38:29 +0000
Date:   Wed, 15 Feb 2023 11:38:28 +0000
Message-ID: <86v8k3xiob.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     neil.armstrong@linaro.org
Cc:     Andy Gross <agross@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: qcom,pdc: Add compatible for SM8550
In-Reply-To: <f6f81af2-00ec-a75b-0e9e-a1eaf649edf5@linaro.org>
References: <20230127132558.1176730-1-abel.vesa@linaro.org>
        <f6f81af2-00ec-a75b-0e9e-a1eaf649edf5@linaro.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/28.2
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: neil.armstrong@linaro.org, agross@kernel.org, abel.vesa@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, tglx@linutronix.de, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, krzysztof.kozlowski@linaro.org, andersson@kernel.org, konrad.dybcio@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Feb 2023 09:25:37 +0000,
Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
> Hi Mark,

Was this intended for me?

> 
> On 27/01/2023 14:25, Abel Vesa wrote:
> > Document the compatible for SM8550 PDC.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> > 
> > The v1 is here:
> > https://lore.kernel.org/all/20221116114210.2673902-1-abel.vesa@linaro.org/
> > 
> > Changes since v1:
> >   * rebased on next-20230125
> >   * added Krzysztof's R-b tag
> > 
> >   .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
> >   1 file changed, 1 insertion(+)
> 
> Do you think you can pick it for v6.3 ?

In general, I don't take standalone DT updates. I'm happy to take them
when they result in something material. But this is only churn, as
nothing relies on these extra compatible strings.

This really should be routed via someone who cares (i.e not me).

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
