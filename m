Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4262D7A9918
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Sep 2023 20:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbjIUSL1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Sep 2023 14:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjIUSK6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Sep 2023 14:10:58 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F4DB8611D
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Sep 2023 10:37:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2B1C4E754;
        Thu, 21 Sep 2023 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695306365;
        bh=FbNBg5D3RQWN0Cdv+taMkLeKD+tXLximpqthPlCjosY=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=sUWxmRF1MQ3/QEh7UXTYv0tsdK8FEPUjr6GoZOkTSonnEjd8jPTROG+N56NvwmChi
         wL5LCvdl88NPBcmRa67bwbPOK8BJFFG20ZCtv0JVkKQiMnnqTjuLlxlhkSr/fs9aQC
         jV0kz2Ftx2xxetbJPDpDiK8RHsFMruk3XEaJnttt2K2Po0kSlC33s9uBY0B5llAmVq
         ir27Faab4WI8aiBzc0ice66g27ddOucRcyKIgoqjxz1j9AzQFOIO2Trc1bNlSIktRW
         QzWsKpssLQWDsYeYBWooUZElowvRGNj1M4eySVtCaT7GxKtRYVqdWaW5+o5wIbvy4S
         5T/xSo6NMxuVQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Adrien Thierry <athierry@redhat.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20230828152353.16529-1-athierry@redhat.com>
References: <20230828152353.16529-1-athierry@redhat.com>
Subject: Re: [PATCH v2 0/2] phy: qcom-qmp-usb: fix initialization of
 PCS_USB
Message-Id: <169530636318.106093.4451140958293220977.b4-ty@kernel.org>
Date:   Thu, 21 Sep 2023 16:26:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 28 Aug 2023 11:23:49 -0400, Adrien Thierry wrote:
> This series attempts at making sure PCS_USB registers are properly
> initialized. I tested it on the sa8775p. AFAICT there's no noticeable
> change before/after the patch series: lsusb and dmesg output are the same.
> USB is still working properly. I don't know what those PCS_USB registers
> do exactly on the qmp PHY and I don't have access to the PHY datasheet, so
> it's hard for me to tell the impact of them being initialized vs not.
> 
> [...]

Applied, thanks!

[1/2] phy: qcom-qmp-usb: initialize PCS_USB registers
      commit: 2d3465a75c9f83684d17da6807423824bf260524
[2/2] phy: qcom-qmp-usb: split PCS_USB init table for sc8280xp and sa8775p
      commit: c599dc5cca4dd6a5c664e4a8837246e68a96cb4c

Best regards,
-- 
~Vinod


