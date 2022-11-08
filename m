Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D74A26205F2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 02:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233293AbiKHB2p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 20:28:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233354AbiKHB2K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 20:28:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED252C114;
        Mon,  7 Nov 2022 17:28:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8375DB81711;
        Tue,  8 Nov 2022 01:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7079C433D6;
        Tue,  8 Nov 2022 01:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667870882;
        bh=1tioVGTqeYyNu4ZTUF3M9dc/z4ZQURezc3VWaBrCJto=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HLP8jD4QSSThJkjIQqil670uZQL9WbPDEr21hUQAUPO6Ev2oEun0a7lim21s8npHR
         igtf95QL+xKdej8gH48zv7UFEe4Omr53qX+r5QzySHttXqmxr5oR44BrSke/9UcGmY
         C1DK50OKAyLqkSpH8wgwcYGimsbunpvTJdHZTHjCwgya/YuqQk9srl5QQ62LBnPuxL
         Ek3aReGKzUyqhBj167FFI67amFiXD7W842l0A5YVdTOuR5775ZRz3KfMcoO+om8YKP
         1KvJgTSVk7idZ/POhz5Nf/M8i2L7hHO1z+xFvhOPRqaT4zmfe51sZCsbgBjrJgTvYh
         mvabAFPzjp9HA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     marex@denx.de, linux-arm-kernel@lists.infradead.org
Cc:     devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robh+dt@kernel.org,
        linus.walleij@linaro.org, konrad.dybcio@somainline.org,
        linux-stm32@st-md-mailman.stormreply.com, yann.gautier@foss.st.com,
        agross@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        alexandre.torgue@foss.st.com, ulf.hansson@linaro.org
Subject: Re: (subset) [PATCH v2 1/3] dt-bindings: mmc: arm,pl18x: Document interrupt-names is ignored
Date:   Mon,  7 Nov 2022 19:27:32 -0600
Message-Id: <166787084676.599230.2324624555833358061.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221013221242.218808-1-marex@denx.de>
References: <20221013221242.218808-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 14 Oct 2022 00:12:40 +0200, Marek Vasut wrote:
> Due to inconsistency of existing DTs regarding the content of this IP
> interrupt-names DT property, document this such that interrupt-names
> is not used by this IP bindings.
> 
> 

Applied, thanks!

[2/3] ARM: dts: qcom: Drop MMCI interrupt-names
      commit: 2f7fa366bac9aa2addb83ffa5f208291f4dbe4d8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
