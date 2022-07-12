Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF6695720B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 18:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbiGLQYo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 12:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234300AbiGLQYn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 12:24:43 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57720CA6D0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 09:24:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id ED5F4B817B5
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 16:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98AAAC3411C;
        Tue, 12 Jul 2022 16:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657643079;
        bh=H9FZ+JxZ/+LNh9c5AgLR/YYLX1w46aIUDti/xgF31EY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wftr1FTd9yAFo8rUsUNv6BeXcEhnNjpWrrOvQlLZ2JnvaoPzk18Z01kltuEPANBgN
         ROOYfSRpPHxA9VSZzjENA5lkpFl41b88ndPs9mEb/fmxrwEG23OLfb9kuG3eCgNIly
         GVSvf/6tp3eIRAdW3+/zGkpOKqpuNb+PWTcdGRXz5TzeS0M2TQHmynSr8aOk99+YCb
         rsNuftIgFfh5T68scwDF522qjV6FBRvG6V0ilrbmu46N7pdzeQi6tXBdZu+lYVLNyG
         cbDjkFi9ibN7QDjAT7Iao/MaF8QgcZyrGNn7B3zmqdx7e4tWfJltMTmL3XM5mdTqEk
         /9QK2YkNnClLQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oBIgj-0005WU-Vs; Tue, 12 Jul 2022 18:24:42 +0200
Date:   Tue, 12 Jul 2022 18:24:41 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Parikshit Pareek <quic_ppareek@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: fix apps_smmu irq
Message-ID: <Ys2gSWpColgPW17+@hovoldconsulting.com>
References: <20220712140009.20765-1-quic_ppareek@quicinc.com>
 <20220712144044.GD21746@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712144044.GD21746@workstation>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 12, 2022 at 08:10:44PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Jul 12, 2022 at 07:30:09PM +0530, Parikshit Pareek wrote:
> > Wrong values have been introduced for interrupts property. Fix those
> > ones, and correct the mapping of context banks to irq number.
> > 
> 
> And you ignored my comment about sorting the IRQs...

Isn't the order significant here? Either way, that would be a separate
change that shouldn't be merged with the fix.

Johan
