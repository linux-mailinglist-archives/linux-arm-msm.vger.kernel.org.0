Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88779657292
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 05:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbiL1EhI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 23:37:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiL1EhE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 23:37:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 570B1DF7B;
        Tue, 27 Dec 2022 20:37:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 20791B81210;
        Wed, 28 Dec 2022 04:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22075C433EF;
        Wed, 28 Dec 2022 04:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672202218;
        bh=CrQmI79mkpAXLkRLerhkHZ0bUBS0txqKCSjXqgS45UQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GOiLSk3LVE+z9QptPj1bdnnyT6JAbMDhsVEyhUOlfYggz77COBYnsVUo+/rfDBP0W
         WG0q8re0MZW7e+48oonM3yQtkaoMebm+JG3E0Qi/hBwumLHlSWDTJRV9j9CqdtbRw+
         Qhf4jPRkMBFKDJgWvXuWtxkvnCudhDsbv5QNMbcQt932BV6MHznBJIu+RQviH9oh1v
         5kXPp2yXL0zN5fAMTgSCkk4I9XeXy7xb/uLlmoyuzwbk9OzYpugdkrvsKXO0Updbf8
         Ap9cTcGY/Q5WfdJ/jWOVFo4353tSi62unBQ4V0DEiaUTavgfY0eJVBxsMy18glttEd
         QkbG0dn1E83Sg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-arm-msm@vger.kernel.org, dominikkobinski314@gmail.com
Cc:     quic_bjorande@quicinc.com, bribbers@disroot.org,
        konrad.dybcio@linaro.org, pevik@seznam.cz, petr.vorel@gmail.com,
        agross@kernel.org, devicetree@vger.kernel.org,
        alexeymin@postmarketos.org
Subject: Re: (subset) [PATCH v2 1/1] arm64: dts: msm8992-bullhead: add memory hole region
Date:   Tue, 27 Dec 2022 22:36:32 -0600
Message-Id: <167220221237.833009.1457006077442498485.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221211100501.82323-1-dominikkobinski314@gmail.com>
References: <20221211100501.82323-1-dominikkobinski314@gmail.com>
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

On Sun, 11 Dec 2022 11:05:01 +0100, Dominik Kobinski wrote:
> Add region for memory hole present on bullhead in order to
> fix a reboot issue on recent kernels
> 
> 

Applied, thanks!

[1/1] arm64: dts: msm8992-bullhead: add memory hole region
      commit: 22c7e1a0fa45cd7d028d6b4117161fd0e3427fe0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
