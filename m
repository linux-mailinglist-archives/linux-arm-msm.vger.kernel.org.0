Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA13F710453
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 06:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238646AbjEYEvu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 May 2023 00:51:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238609AbjEYEvV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 May 2023 00:51:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB411AE;
        Wed, 24 May 2023 21:51:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3C1F8641D3;
        Thu, 25 May 2023 04:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E857AC433A1;
        Thu, 25 May 2023 04:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684990268;
        bh=w5JqjKuzaFMXK0KxqIM/jSjQ6QvtMjJfC8wlAFFzU9I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wp+CAW6Qya7F7wv179Ii4R41q+xQ0BprC0K19WePRopQgRL/mPsxONFJpMRArG5Bb
         0ofDuYvcZ/jcfh0gz7hkRN3Mof2I23vELG3OWlplwUA+FHD39KpDbjO8RWjqxBMMI3
         Iyb7gxWGsGXwJyvXvl2JDrprQyMWmn7oi2cihVSgbok/bzkEqCJFmelipq1wEkuy3s
         jiD9mIJaxfYhGAdSJBpIV1CXgIO1j21nTqbqVFotVlz93r467BblqEdNQuFbpSHDVS
         YL17S83aPbyFVACyILAQiLghWqeOBm25VSUc6H0aGpgoxer0vZvODnCMYXOqQH11S9
         ZoMFBXDERUt8g==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: mmcc-msm8974: remove oxili_ocmemgx_clk
Date:   Wed, 24 May 2023 21:53:48 -0700
Message-Id: <168499048178.3998961.12613497360181837480.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508153319.2371645-1-dmitry.baryshkov@linaro.org>
References: <20230508153319.2371645-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 8 May 2023 18:33:19 +0300, Dmitry Baryshkov wrote:
> After the internal discussions, it looks like this clock is managed by
> RPM itself. Linux kernel should not touch it on its own, as this causes
> disagreement with RPM. Shutting down this clock causes the OCMEM<->GPU
> interface to stop working, resulting in GPU hangchecks/timeouts.
> 
> 

Applied, thanks!

[1/1] clk: qcom: mmcc-msm8974: remove oxili_ocmemgx_clk
      commit: 853c064b57491d739bfd0cc35ff75c5ea9c5e8f5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
