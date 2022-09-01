Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 962415A9286
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 10:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234314AbiIAI55 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 04:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234313AbiIAI51 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 04:57:27 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA23130A04
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 01:57:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 52A7FCE2520
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 08:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2ED1C433D6;
        Thu,  1 Sep 2022 08:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662022616;
        bh=prYcUWBTjUdLAux/fhlgeXI0aAwL5jIZ2AF09Netluw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jo62ltvxVmKObiek7Hxd5ModsYmzAK7zkenD28Ftk0MUDkuZbhJZrZWHDm8rL6hpT
         KMkgaJ2efBkigrJ7YZHJfnJokFatHcL6k5NpQpRDeIwJJMd0/s5ZRoHK9Yuba0vo4X
         UkNLjs5ukI1qyLYqAOrh0Uw2+OX/H2d5sn+4UzYSakDT+a2TKCQZbEbcN6WkNeGS/h
         9GiRRWtxltJ67WY+XcIhtLMqQsLuATd3kyT7p8g31o/HpO97YosYXacCBJtvFQXFQc
         7awIf0w6AohZ7NASvL4SstHFWelcrUkEqfiM1qyBphTcqdir2AcG/miWeL9wifILcj
         6mV1M41an5bSA==
Date:   Thu, 1 Sep 2022 14:26:51 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, dan.carpenter@oracle.com
Subject: Re: [PATCH v2] soundwire: qcom: fix device status array range
Message-ID: <YxBz05JZgK38Hugt@matsya>
References: <20220708104747.8722-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708104747.8722-1-srinivas.kandagatla@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-07-22, 11:47, Srinivas Kandagatla wrote:
> This patch updates device status array range from 11 to 12 as we will
> be reading status from device number 0 to device number 11 inclusive.
> 
> Without this patch we can potentially access status array out of range
> during auto-enumeration.

Applied, thanks

-- 
~Vinod
