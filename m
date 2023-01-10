Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9C9664E8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 23:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233068AbjAJWNv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 17:13:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234773AbjAJWNs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 17:13:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45DC45CF96;
        Tue, 10 Jan 2023 14:13:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 050CFB819B0;
        Tue, 10 Jan 2023 22:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA27C433F0;
        Tue, 10 Jan 2023 22:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673388824;
        bh=hOR9fEFSY9mL4tLhalxVJ/enA1aE8+wwDQ0kW/9dC9o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=smFCHLaRwvg8MPuR6WknR55mdj/li5sZ+0+TkfnW88VKvzyb2nPX9YqzvN5zgmmII
         aoKrJnvaJdCvyJNKFdw8x+4E0GmSN9Fw5IjNNQoD66sl54Jw4clOhONQyucE15NQ6m
         1uNxRFeuFAXWawPgjqoruCRHYaE+KVXKbT/ovPth5APXnbcZ94hiIz9lB7OKhAxdH0
         aRidZxNnS3OtIoLxyGfCRQC7sL56pxe99ekQ4MAExN3WFmpbv/r9Xz4nJkdONEhiB8
         0XNVADSw5qRBpQrAR/O2nU2/wpJBiRZYSaJ5GKRTZTjWoY0YogD5R/lLb7IJ4FKu2l
         EmYxY5ayjxuFg==
Date:   Tue, 10 Jan 2023 16:13:41 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 15/21] clk: qcom: gpucc-msm8998: switch to parent_hws
Message-ID: <20230110221341.h4wzucm54q27q7he@builder.lan>
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
 <20230103145515.1164020-16-dmitry.baryshkov@linaro.org>
 <CAOCk7Nr4smGnQS-yh1hGKFFXzeUUt86JSdiuoSun7vJ11z9SWQ@mail.gmail.com>
 <e2493080-f7fd-50de-173f-2e46fa846e23@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2493080-f7fd-50de-173f-2e46fa846e23@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 03, 2023 at 06:00:28PM +0200, Dmitry Baryshkov wrote:
> On 03/01/2023 17:08, Jeffrey Hugo wrote:
> > On Tue, Jan 3, 2023 at 7:56 AM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > > 
> > > Change several entries of parent_data to use parent_hws instead, which
> > > results in slightly more ovbious code.
> > 
> > obvious -> obvious
> > 
> > Also, you are changing one of two parent_data structs in this file.
> > That's not "several".  It's really not clear why you are touching one,
> > but not the other.  Can you be more specific about what is going on in
> > this particular file?
> 
> The other struct has .hw and .fw_data entries so it can not be switched to
> just clk_hw enumeration.
> 
> I agree, that one is not 'several' (yeah, I was just using template for
> commit messages), I can change that for v2.
> 

While I dislike the copy-paste commit message, there's little point in
spending more effort on it. I fixed the commit message of this one and
picked the whole series.

Thanks Dmitry,
Bjorn

> -- 
> With best wishes
> Dmitry
> 
