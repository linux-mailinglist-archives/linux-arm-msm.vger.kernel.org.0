Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACAA587D9E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 15:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237069AbiHBNx2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 09:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236490AbiHBNw4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 09:52:56 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 117CD248DC
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 06:52:54 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57625D6E;
        Tue,  2 Aug 2022 06:52:54 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 575BA3F70D;
        Tue,  2 Aug 2022 06:52:52 -0700 (PDT)
Date:   Tue, 2 Aug 2022 14:52:49 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Andy Gross <agross@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig more updates for v5.20
Message-ID: <20220802135249.ytdq4owz3rsosvjy@bogus>
References: <20220720230140.2113129-1-bjorn.andersson@linaro.org>
 <CAOCOHw5vj7WExi2opJ+ZvxLroq9UScHMMTuyyysMs3zJEfxgEQ@mail.gmail.com>
 <CAK8P3a2KeNRSfVdd8F5cVp4oU+K+Nwo0bVx_kEVHXEx_0AkZAQ@mail.gmail.com>
 <20220802095357.uibssv3s72rvlj7p@bogus>
 <CAK8P3a1acYba+g+6zLm1F8o=9U6BdKNDMgapQT-vrV+7hGHg4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1acYba+g+6zLm1F8o=9U6BdKNDMgapQT-vrV+7hGHg4w@mail.gmail.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 02, 2022 at 12:22:33PM +0200, Arnd Bergmann wrote:
> On Tue, Aug 2, 2022 at 11:53 AM Sudeep Holla <sudeep.holla@arm.com> wrote:

[...]

> > Ah that explains why I didn't receive notification as well. I noticed
> > the changes were pulled. I didn't bother to ask, but now that you mention
> > it is likely to be the sender address as I can't send you email to your
> > @arndb.de and hence I always use kernel.org. Are these automated emails
> > sent via arnd@arndb.de ?
>
> I don't think it has anything to do with my email address. This is about pull
> requests that get sent to the soc@kernel.org alias. Patchwork monitors these
> and puts them into https://patchwork.kernel.org/project/linux-soc/list/ from
> where I can pick them up or reject them using pwclient. Anything sent there
> requires an action to get it out of the list of 'New' entries.
>
> In most cases patchwork will then notice when I push out the merge commit
> to the for-next branch of the soc tree. However for some senders (Bjorn and
> Krzysztof notably), this only works for patch emails but not pull requests, so
> I have to use 'b4' to to send an 'applied, thanks' message myself, which I send
> using gmail with my kernel.org address as sender.
>

Thanks for the details. I have received those automated "merged" emails in
the past for sure(e.g. my PR for v5.19) but I didn't get this time(PRs for
v5.20).

I assumed it wasn't working that day as I didn't see emails for other PRs
that got merged more or less at the same time. Anyways I have soc tree as
remote and generally check the contents of next especially if I have pending
PR, so I don't rely much on the emails.

--
Regards,
Sudeep
