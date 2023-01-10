Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2EA26645D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 17:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234888AbjAJQRf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 11:17:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234774AbjAJQRd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 11:17:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B1D138ADA;
        Tue, 10 Jan 2023 08:17:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D82BB617C9;
        Tue, 10 Jan 2023 16:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1ADC433EF;
        Tue, 10 Jan 2023 16:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673367452;
        bh=+x2IvXQjGr6DrraXaN81PccrihWdV0IXUMv5rA+i6x4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tywHxvL9RFuQuFPxU3ErCR52zKxjYLs4cYiiK6DdPvOs00Cu72kNf9vmfIES2C5YH
         7QmtVgw+u7Wkvg3eWLKeXdKGtZ1tgvubxL3yG2ntlRPRBYtIIjizdo93ZrOXCdsalv
         L6XgzO9dD6sHgYT2PSjKFnLZAsx1yhj5GapI+sSNXX6VIhWAYYskB+Y9oi6l0+rQt/
         aHoQ/G+qYax3cNIWFGASrdT334dIOE8+4B/c/kmm4u+78WlZRNOI65HOC7icvoGxYl
         EhQ6fcJLlwAaBz6LRllBo51aQ3aSoeSCnxKRf6h7W9duWE8azdyaBxtdYkCz7fLCAp
         g8dUvApMkWdxg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-arm-msm@vger.kernel.org, yangyingliang@huawei.com,
        linux-clk@vger.kernel.org
Cc:     sboyd@kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
        mturquette@baylibre.com, agross@kernel.org,
        konrad.dybcio@linaro.org
Subject: Re: [PATCH] clk: qcom: krait-cc: fix wrong pointer passed to IS_ERR()
Date:   Tue, 10 Jan 2023 10:17:23 -0600
Message-Id: <167336743970.2134489.10192920031427357433.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230104080235.1748953-1-yangyingliang@huawei.com>
References: <20230104080235.1748953-1-yangyingliang@huawei.com>
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

On Wed, 4 Jan 2023 16:02:35 +0800, Yang Yingliang wrote:
> It should be 'mux' passed to IS_ERR/PTR_ERR().
> 
> 

Applied, thanks!

[1/1] clk: qcom: krait-cc: fix wrong pointer passed to IS_ERR()
      commit: 3b36713d69d99318592d261eaca9b7460313c8c2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
