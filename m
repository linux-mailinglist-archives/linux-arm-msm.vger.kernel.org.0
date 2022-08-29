Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3075A57F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 01:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiH2Xqo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Aug 2022 19:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbiH2Xqh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Aug 2022 19:46:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7682D9E6A3;
        Mon, 29 Aug 2022 16:46:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 565ABB815D5;
        Mon, 29 Aug 2022 23:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CEF1C4314C;
        Mon, 29 Aug 2022 23:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661816787;
        bh=9SZwkc/TBmAc74B5tO1jPOls3/b4HJP7u7t/NHHAyD4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SjYj/uFoh+idvxkuG+e8hmyCDfeM/Y3Ex5GHdq/P6PR2w/DLzoDoTpvdC4xnzyPEl
         t2Fl+fkzT88JrxfeJmt1GRxrpaORAW4cfjcGyWY2xeaJtn5u/G7uecuuqDoWRUBSjf
         ipUyjSWl9aGOl1j5zqNxHz13wkVXqiZSvzy+S8nEi3oGyYgetashW7iFOJIMXHErOj
         8T71o7JxFh85X3LuBohBKdHjfNKowxxFYPF5VKKlnwqpGHJEJCHMvapGiGiFkggSXj
         x/Gd9t6pYHU1jNgM/DFx5Gr/ouiRFfr7UvripEn4K9RIOADyhxidHQeyblBtvGBGDk
         Vg1/thD6AbSIg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Bjorn Andersson <andersson@kernel.org>, agross@kernel.org,
        ebiggers@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: add Inline Crypto Engine registers and clock
Date:   Mon, 29 Aug 2022 18:45:49 -0500
Message-Id: <166181675988.322065.15289670775353557796.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826071244.185584-1-ebiggers@kernel.org>
References: <20220826071244.185584-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 26 Aug 2022 00:12:44 -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add the registers and clock for the Inline Crypto Engine (ICE) to the
> device tree node for the UFS host controller on sm8450.  This makes
> ufs_qcom support inline encryption when CONFIG_SCSI_UFS_CRYPTO=y.
> 
> The address and size of the register range, and the minimum and maximum
> frequency of the ICE core clock, all match the values used downstream.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8450: add Inline Crypto Engine registers and clock
      commit: 276ee34a40c1440544f609b54b23b99ead8f2205

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
