Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2CD976A4D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Aug 2023 01:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbjGaXaF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 19:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjGaXaE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 19:30:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657489D
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 16:30:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EEF0B61344
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 23:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C50C433C8;
        Mon, 31 Jul 2023 23:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690846202;
        bh=GE0KAdwQVSiJh7jA4BKeWG2998o5ia0I7q/87t+hLUo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qEoK507Vrur3gaQzIfjCKAjpsxsdG+8a7rbGly8l6q0HeGL9a5HPPX7YmS7XnHPSn
         oOJIQ53hIEvieQbFhu3mB9SB3PBkjVQFpcojeeSD8f0sJ3T3K2lfWcT4jfEF2+pCcK
         exmGLOkuBEaZr6fQkWEixFpcPSsjlB9CyY/cUX9Qim44zsV4rKP+8AeYXCO8Urhaqs
         sY8LomLr+5WWRsJw7xlH/l8GIo+lvDvhR5VlmNZeHiIbWeo2a9CmNZ4/TZlF5uX48/
         T6EWIwC2Bf0hJqWBhZB8dqpSGEDlOf3L6vw9rJi83/1sGD1qQOGcOCpXnZuludNMJt
         EhIMVyi3hMyAg==
Date:   Mon, 31 Jul 2023 16:33:07 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Yuanjun Gong <ruc_gongyuanjun@163.com>
Cc:     quic_bjorande@quicinc.com, agross@kernel.org,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/1] soc: qcom: use devm_clk_get_enabled() in
 gsbi_probe()
Message-ID: <4l4a2wbmgiuxg4qx47ew2dpnv7j4v2accdku23klf7vjlliazv@6lkm33njiips>
References: <20230720184354.GB2667611@hu-bjorande-lv.qualcomm.com>
 <20230725022151.36110-1-ruc_gongyuanjun@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725022151.36110-1-ruc_gongyuanjun@163.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 25, 2023 at 10:21:51AM +0800, Yuanjun Gong wrote:
> in gsbi_probe(), the return value of function clk_prepare_enable()
> should be checked, since it may fail. using devm_clk_get_enabled()
> instead of devm_clk_get() and clk_prepare_enable() can avoid this
> problem.
> 
> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>

Thank you for the updated patch, Yuanjun. After sending you my feedback,
I realized that I could save us both time and just fix it up while
applying the patch.

You should have received another reply stating that the first patch has
been applied.

Regards,
Bjorn
