Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6C5D63C3F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 16:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233312AbiK2Pjq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 10:39:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234931AbiK2Pjq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 10:39:46 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A0D91C8;
        Tue, 29 Nov 2022 07:39:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BC127617A5;
        Tue, 29 Nov 2022 15:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C9DC433D7;
        Tue, 29 Nov 2022 15:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669736384;
        bh=RvEOYAexGsZw5junUb9Ckv0JbIpkKRmUf9rQA9riZ0Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hoG5/IKZiq+M44SQaivXPGmsj+qEKBVJHSMvYZoDlsqSF5ZVI4bnClLH0kchLiKuz
         7lHdozJF8RNVa6quwfTZtLTE/+5HMBoXkySR2SsJCpkabc7smyg1k9Ffi0vgTItZmE
         DfLocwdfA8nMWR5G2lVfi+5bpVmpFcXdBs7/wOWJzojZIOIxR8syIBPwHz/M+DNK30
         JKPB2TkPmkbsLoPruR3txODvC3lrmi0mhIJ6KEWsu8paI7LmPNOHl3B21kjsPWBf8L
         na74Ak9SpkBFpkJxppskrQDFhaZc3mub6bH4LD/yoa1HihVioi2/xyk+TnqJJ9kHzO
         KtZH5mkTIHAbg==
Date:   Tue, 29 Nov 2022 21:09:31 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Asutosh Das <quic_asutoshd@quicinc.com>
Cc:     quic_cang@quicinc.com, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_xiaosenh@quicinc.com, stanley.chu@mediatek.com,
        eddie.huang@mediatek.com, daejun7.park@samsung.com,
        bvanassche@acm.org, avri.altman@wdc.com, beanhuo@micron.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 00/16] Add Multi Circular Queue Support
Message-ID: <20221129153931.GJ4931@workstation>
References: <cover.1669684648.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1669684648.git.quic_asutoshd@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Asutosh,

On Mon, Nov 28, 2022 at 05:20:41PM -0800, Asutosh Das wrote:
> UFS Multi-Circular Queue (MCQ) has been added in UFSHCI v4.0 to improve storage performance.
> The implementation uses the shared tagging mechanism so that tags are shared
> among the hardware queues. The number of hardware queues is configurable.
> This series doesn't include the ESI implementation for completion handling.
> This implementation has been verified by on a Qualcomm platform.
> 
> Please take a look and let us know your thoughts.
> 
> v5 -> v6:
> - Addressed Mani's comments
> - Addressed Bart's comments
> 

Thanks for the continuous update of the series. In this version, you
seem to have missed some review tags from myself and Bart. Please
make sure to collect all tags in the next version if you happen to
send one.

Thanks,
Mani

> v4 -> v5:
> - Fixed failure to fallback to SDB during initialization
> - Fixed failure when rpm-lvl=5 in the ufshcd_host_reset_and_restore() path
> - Improved ufshcd_mcq_config_nr_queues() to handle different configurations
> - Addressed Bart's comments
> - Verified read/write using FIO, clock gating, runtime-pm[lvl=3, lvl=5]
> 
> v3 -> v4:
> - Added a kernel module parameter to disable MCQ mode
> - Added Bart's reviewed-by tag for some patches
> - Addressed Bart's comments
> 
> v2 -> v3:
> - Split ufshcd_config_mcq() into ufshcd_alloc_mcq() and ufshcd_config_mcq()
> - Use devm_kzalloc() in ufshcd_mcq_init()
> - Free memory and resource allocation on error paths
> - Corrected typos in code comments
> 
> v1 -> v2:
> - Added a non MCQ related change to use a function to extrace ufs extended
> feature
> - Addressed Mani's comments
> - Addressed Bart's comments
> 
> v1:
> - Split the changes
> - Addressed Bart's comments
> - Addressed Bean's comments
> 
> * RFC versions:
> v2 -> v3:
> - Split the changes based on functionality
> - Addressed queue configuration issues
> - Faster SQE tail pointer increments
> - Addressed comments from Bart and Manivannan
> 
> v1 -> v2:
> - Enabled host_tagset
> - Added queue num configuration support
> - Added one more vops to allow vendor provide the wanted MAC
> - Determine nutrs and can_queue by considering both MAC, bqueuedepth and EXT_IID support
> - Postponed MCQ initialization and scsi_add_host() to async probe
> - Used (EXT_IID, Task Tag) tuple to support up to 4096 tasks (theoretically)
> 
> 
> Asutosh Das (16):
>   ufs: core: Optimize duplicate code to read extended feature
>   ufs: core: Probe for ext_iid support
>   ufs: core: Introduce Multi-circular queue capability
>   ufs: core: Defer adding host to scsi if mcq is supported
>   ufs: core: mcq: Add support to allocate multiple queues
>   ufs: core: mcq: Configure resource regions
>   ufs: core: mcq: Calculate queue depth
>   ufs: core: mcq: Allocate memory for mcq mode
>   ufs: core: mcq: Configure operation and runtime interface
>   ufs: core: mcq: Use shared tags for MCQ mode
>   ufs: core: Prepare ufshcd_send_command for mcq
>   ufs: core: mcq: Find hardware queue to queue request
>   ufs: core: Prepare for completion in mcq
>   ufs: mcq: Add completion support of a cqe
>   ufs: core: mcq: Add completion support in poll
>   ufs: core: mcq: Enable Multi Circular Queue
> 
>  drivers/ufs/core/Makefile      |   2 +-
>  drivers/ufs/core/ufs-mcq.c     | 416 +++++++++++++++++++++++++++++++++++++++++
>  drivers/ufs/core/ufshcd-priv.h |  92 ++++++++-
>  drivers/ufs/core/ufshcd.c      | 395 +++++++++++++++++++++++++++++++-------
>  drivers/ufs/host/ufs-qcom.c    | 148 +++++++++++++++
>  drivers/ufs/host/ufs-qcom.h    |   5 +
>  include/ufs/ufs.h              |   6 +
>  include/ufs/ufshcd.h           | 128 +++++++++++++
>  include/ufs/ufshci.h           |  64 +++++++
>  9 files changed, 1189 insertions(+), 67 deletions(-)
>  create mode 100644 drivers/ufs/core/ufs-mcq.c
> 
> -- 
> 2.7.4
> 
