Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7F986C4E4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 15:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231898AbjCVOoZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 10:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbjCVOnZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 10:43:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0D6265466
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 07:42:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 372C862176
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 14:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5295DC433D2;
        Wed, 22 Mar 2023 14:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679496148;
        bh=iDe1/CN7w29vYWoGIgBkjZRVmocGrMXtY+BMxinOeJ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mLv5rqzQb5hZe90uuqxRz+NzG/pCGD+u2D7tU7iXbCzooK+QFGNPvo0eOoM/OF7b+
         RypUBsHtFPQE0hxR3NuGwu8a3F+U5uUJQobCMxBB5PtKgZWHipcjdREZh/p1O9OycQ
         k6+WqZudMPYYa6lh+neQmDoYkUdfuc8VCsvlWvnoSAnbp549xuOWXTcFXEEgEV4riq
         Tl7tBp37zBhZKFg+Ayk0i9SOmgrqNUVjuBOCknCqHV3DGmX2dPi4acdvwB7EdxzpEM
         JDWUR7cSwpJnbhVBjyKMRbWMqYbjD8rdIP4bQPHOXn7x8UvCt4Qw8KUQ3qdjAK+a0h
         5tGJlu4yD6euA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Petr Vorel <pvorel@suse.cz>, linux-arm-msm@vger.kernel.org
Cc:     Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH 0/2] Switch msm899{4,6,8} clk drivers to module
Date:   Wed, 22 Mar 2023 07:45:21 -0700
Message-Id: <167949631651.1081726.998611857071519527.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230217184239.21450-1-pvorel@suse.cz>
References: <20230217184239.21450-1-pvorel@suse.cz>
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

On Fri, 17 Feb 2023 19:42:37 +0100, Petr Vorel wrote:
> based on previous discussion, tested on msm8994 angler.
> I don't dare to set arm 32bit clocks in multi_v7_defconfig.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20230208230628.xoaqt4hby5ec4s6t@ripper/
> 
> Petr Vorel (2):
>   arm64: defconfig: Switch msm8996 clk drivers to module
>   arm64: defconfig: Enable qcom msm899{4,8} clk drivers
> 
> [...]

Applied, thanks!

[1/2] arm64: defconfig: Switch msm8996 clk drivers to module
      commit: 8f680c287445c467c927e875103ad2bfd7d356e1
[2/2] arm64: defconfig: Enable qcom msm899{4,8} clk drivers
      commit: 4705d0137af61823dca83bb6302073181d83945d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
