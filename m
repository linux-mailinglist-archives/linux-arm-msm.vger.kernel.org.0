Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEFB621790
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 15:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234256AbiKHO66 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 09:58:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233912AbiKHO65 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 09:58:57 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A95172723
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 06:58:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 18165615F0
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 14:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D4BC433D6;
        Tue,  8 Nov 2022 14:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667919535;
        bh=XiffxQy7J6DpOe26xZkzFwNHgZVMljPsukiLFLZq6mE=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=hzGdDCsTi6bnBfWyNFLNiqRepZ/QTyqU/gRscatFUNE0s1XXvMUo+LUEJ+ZBDuzip
         kiUgHd2HNgteRw57GEXZHX3T8Pdan0Z2bcJ5AcZbxUCuU6hXDkNOjs7ulEZegi+6vz
         LijtVgfOYHq7g8kXbuBKWhLujjQmsmo+Avmingdqqf2YAS+Z1fmHl4TvGPYs93gq2f
         7NVDfRUJa0u4fwBQSo2mgDja3PtUwk+WGkBy6dLuWiWEuevrJGY8O+vCJ9+A8U5lSh
         f0map3FBvJgG3t+A8VSw2Ja93wH2JGTdt+2/i2LbMx94ecAt675VQNcwbXlcqzPH8l
         m1Lje9thHB61Q==
From:   Kalle Valo <kvalo@kernel.org>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Jeff Johnson <quic_jjohnson@quicinc.com>,
        Hemant Kumar <quic_hemantk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Subject: Re: [PATCH v5] bus: mhi: host: make mhi_controller_config::event_cfg const
References: <20220829205112.12036-1-quic_jjohnson@quicinc.com>
        <20220830171147.24338-1-quic_jjohnson@quicinc.com>
        <20220907080016.GA22505@workstation> <87fsettvtc.fsf@kernel.org>
        <20221108143902.GA88842@thinkpad>
Date:   Tue, 08 Nov 2022 16:58:52 +0200
In-Reply-To: <20221108143902.GA88842@thinkpad> (Manivannan Sadhasivam's
        message of "Tue, 8 Nov 2022 20:09:02 +0530")
Message-ID: <878rkltrv7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Manivannan Sadhasivam <mani@kernel.org> writes:

> On Tue, Nov 08, 2022 at 03:33:35PM +0200, Kalle Valo wrote:
>> Manivannan Sadhasivam <mani@kernel.org> writes:
>> 
>> > On Tue, Aug 30, 2022 at 10:11:47AM -0700, Jeff Johnson wrote:
>> >> Currently the event_cfg pointer in struct mhi_controller_config is not
>> >> defined as a const pointer. This prevents clients from registering a
>> >> read-only configuration unless they use a typecast. Since the
>> >> event_cfg should not be modified once registered, add the const
>> >> qualifier to event_cfg. This is aligned with the definition of ch_cfg.
>> >> 
>> >> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> >
>> > Applied to mhi-next!
>> 
>> BTW what happened to this patch? I cannot find it anywhere.
>> 
>
> Sorry! I did apply this patch earlier locally but didn't push it to
> remote. So it got lost.
>
> Now pushed! Thanks for spotting.

Great, thanks Mani.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
