Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5CD4602298
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 05:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbiJRDXf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 23:23:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231287AbiJRDWk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 23:22:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5FF474C7;
        Mon, 17 Oct 2022 20:18:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0B1C361426;
        Tue, 18 Oct 2022 03:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC1FC43144;
        Tue, 18 Oct 2022 03:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666062904;
        bh=UGbZPIEkQbIMU4NTPvaTVdaR17WlTa8xyZQd91Ijz0k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gUw5gy/JRoPf2FwOn22OwXMR9SALX1lQ+/OKo11PbEOJjcxluI49lRzQdbKXTF1P6
         tKUhYCAXRNqmu5QpSTrDyolnj2F2yLvyjRDmVrmJZSre4OeNgqiiiElTwHyhgLR5av
         AEmLKsRN7EmTT61vCNetF4c00ruRpH91AElNuQ+/n8C8+h+JI2uTPPUw0WYc1lcRvN
         u/WnwQbjVMB4L/yFfdRBR+OKD6mTpLOgrj/7gx19DGk9bCqNYsS0YMvDZg6V/U086P
         JMZRSoLjHXg9aDCaPaqUcaBXdrWOIyqk8NEfnqnERGsVqjF897DfMtsFokOwyr9W+p
         Lr9BrspSEmT1g==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Bjorn Andersson <andersson@kernel.org>, jassisinghbrar@gmail.com,
        konrad.dybcio@somainline.org, dmitry.baryshkov@linaro.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, robimarko@gmail.com
Cc:     krzysztof.kozlowski@linaro.org
Subject: Re: (subset) [PATCH v9 1/4] dt-bindings: mailbox: qcom: set correct #clock-cells
Date:   Mon, 17 Oct 2022 22:14:57 -0500
Message-Id: <166606235845.3553294.17198641520778518709.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220818220849.339732-1-robimarko@gmail.com>
References: <20220818220849.339732-1-robimarko@gmail.com>
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

On Fri, 19 Aug 2022 00:08:46 +0200, Robert Marko wrote:
> IPQ6018 and IPQ8074 require #clock-cells to be set to 1 as their APSS
> clock driver provides multiple clock outputs.
> 
> So allow setting 1 as #clock-cells and check that its set to 1 for IPQ6018
> and IPQ8074, check others for 0 as its currently.
> 
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: ipq8074: add clocks to APCS
      commit: fd8bdb451c6541b40e5977defcfebfe51713a538

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
