Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6586D644B12
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 19:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbiLFSTp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 13:19:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiLFSTk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 13:19:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB00A454;
        Tue,  6 Dec 2022 10:19:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1B378B81B25;
        Tue,  6 Dec 2022 18:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B41C433D6;
        Tue,  6 Dec 2022 18:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670350776;
        bh=Y69yk7d2zhYn7Dod28rne/nckpUeF5af5sJhraE2uLg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ABjERq/VYML+S8FVaAKlII2NSg0auqSFTxEBmhoy+gpsx7FwH4hhrWDQDTRvjVEuM
         4uFzoDA5fbacDUfxvsIXwo6Wl4ed2MfeVGFKJPXklVJpfJ9tOzp1dWVXNmQtVT04B6
         7wbCHfnuQ5r+m+qkVlUVsBxba/jL4QI09FBLFfKqePmt0qoTntNRHyMnasgQXN6qn0
         m5OgW4b9/Rf7oR2r3E1o4p+X1QLhTGkNOqEv+jQjWMI48lsl/6Lzb6E+4iss6aX7Ij
         Vg8lRIc1BthLyNO3XAba/YTG322DKZbGfsM73Cj+3z66SAPVXXQdp6Pgtdghpqo9+T
         GM1kwagk/oQlQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        konrad.dybcio@linaro.org, abel.vesa@linaro.org, robh@kernel.org
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom: aoss: Add compatible for SM8550
Date:   Tue,  6 Dec 2022 12:18:43 -0600
Message-Id: <167035076337.3155086.5798954684227342249.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221116113128.2655441-1-abel.vesa@linaro.org>
References: <20221116113128.2655441-1-abel.vesa@linaro.org>
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

On Wed, 16 Nov 2022 13:31:28 +0200, Abel Vesa wrote:
> Document the compatible for SM8550.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: qcom: aoss: Add compatible for SM8550
      commit: 1f0067c6e9be3ef30fca18c409c61565bffc0407

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
