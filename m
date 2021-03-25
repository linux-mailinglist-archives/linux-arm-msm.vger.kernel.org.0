Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4993494E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 16:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbhCYPFk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 11:05:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:34420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229547AbhCYPFM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 11:05:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3605661A10;
        Thu, 25 Mar 2021 15:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616684712;
        bh=n14K+ZB1lA7IMk1Xs/vk0MsKfm+3TbQdanrbmyKqpNM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FHwTNUwG1zuMokZAgMv+sMZgUup0IwNDeUPoK80BWyBn6qBaK8/0r77noT9b22CO1
         +QgJ4wRl9+tw0cyi4qCWLyJF/8jj4VXdjJWlroSsAGz5sTz+4hqG+gID7Zopt9ijcM
         Nq1V2NLzcjRvgMF5It9za/kecF7ySF4YGllMEHjAMZxuFr+e7443N9/wcoh72w8n1H
         PrLPze1Dj5JEvhLsmuOYyVYE0/fcFm79OMJ3h9TeiLoJt3KK3tUPr1YWoU9xfO44D2
         kv94bWZc/lZUuS4UIQhWJQb6A5Bg3xT14NfpujrO4I3P4si32tHsCWOSAtyyx7ZcT0
         P3uFFMlej36iQ==
Date:   Thu, 25 Mar 2021 15:05:07 +0000
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     akhilpo@codeaurora.org, iommu@lists.linux-foundation.org,
        jcrouse@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, robin.murphy@arm.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Subject: Re: [PATCHv2 2/2] iommu/arm-smmu-qcom: Move the adreno smmu specific
 impl earlier
Message-ID: <20210325150506.GD15172@willie-the-truck>
References: <YDlIrjkfv16o4Nu3@builder.lan>
 <20210227135321.420-1-saiprakash.ranjan@codeaurora.org>
 <YEqn1SjsGgK0V8K4@builder.lan>
 <8cfaed1915ad6dd0c34ac7eb2391b410@codeaurora.org>
 <727fa9fe2e644f88ba35c2877d71788e@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <727fa9fe2e644f88ba35c2877d71788e@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 25, 2021 at 01:10:12PM +0530, Sai Prakash Ranjan wrote:
> On 2021-03-15 00:31, Sai Prakash Ranjan wrote:
> > On 2021-03-12 04:59, Bjorn Andersson wrote:
> > > On Sat 27 Feb 07:53 CST 2021, Sai Prakash Ranjan wrote:
> > > > On 2021-02-27 00:44, Bjorn Andersson wrote:
> > > > > On Fri 26 Feb 12:23 CST 2021, Rob Clark wrote:
> > > > >
> > > > >
> > > > > The current logic picks one of:
> > > > > 1) is the compatible mentioned in qcom_smmu_impl_of_match[]
> > > > > 2) is the compatible an adreno
> > > > > 3) no quirks needed
> > > > >
> > > > > The change flips the order of these, so the only way I can see this
> > > > > change affecting things is if we expected a match on #2, but we got one
> > > > > on #1.
> > > > >
> > > > > Which implies that the instance that we want to act according to the
> > > > > adreno impl was listed in qcom_smmu_impl_of_match[] - which either is
> > > > > wrong, or there's a single instance that needs both behaviors.
> > > > >
> > > > > (And I believe Jordan's answer confirms the latter - there's a single
> > > > > SMMU instance that needs all them quirks at once)
> > > > >
> > > > 
> > > > Let me go through the problem statement in case my commit
> > > > message wasn't
> > > > clear. There are two SMMUs (APSS and GPU) on SC7280 and both are
> > > > SMMU500
> > > > (ARM SMMU IP).
> > > > 
> > > > APSS SMMU compatible - ("qcom,sc7280-smmu-500", "arm,mmu-500")
> > > > GPU SMMU compatible - ("qcom,sc7280-smmu-500",
> > > > "qcom,adreno-smmu", "arm,mmu-500")
> > > > 
> > > > Now if we take SC7180 as an example, GPU SMMU was QSMMU(QCOM SMMU IP)
> > > > and APSS SMMU was SMMU500(ARM SMMU IP).
> > > > 
> > > > APSS SMMU compatible - ("qcom,sc7180-smmu-500", "arm,mmu-500")
> > > > GPU SMMU compatible - ("qcom,sc7180-smmu-v2",
> > > > "qcom,adreno-smmu", "qcom,smmu-v2")
> > > > 
> > > > Current code sequence without this patch,
> > > > 
> > > > if (of_match_node(qcom_smmu_impl_of_match, np))
> > > >                  return qcom_smmu_create(smmu, &qcom_smmu_impl);
> > > > 
> > > > if (of_device_is_compatible(np, "qcom,adreno-smmu"))
> > > >         return qcom_smmu_create(smmu, &qcom_adreno_smmu_impl);
> > > > 
> > > > Now if we look at the compatible for SC7180, there is no problem
> > > > because
> > > > the APSS SMMU will match the one in qcom_smmu_impl_of_match[]
> > > > and GPU SMMU
> > > > will match "qcom,adreno-smmu" because the compatible strings are
> > > > different.
> > > > But for SC7280, both the APSS SMMU and GPU SMMU
> > > > compatible("qcom,sc7280-smmu-500")
> > > > are same. So GPU SMMU will match with the one in
> > > > qcom_smmu_impl_of_match[]
> > > > i.e.., "qcom,sc7280-smmu-500" which functionally doesn't cause
> > > > any problem
> > > > but we will miss settings for split pagetables which are part of
> > > > GPU SMMU
> > > > specific implementation.
> > > > 
> > > > We can avoid this with yet another new compatible for GPU SMMU
> > > > something like
> > > > "qcom,sc7280-adreno-smmu-500" but since we can handle this
> > > > easily in the
> > > > driver and since the IPs are same, meaning if there was a
> > > > hardware quirk
> > > > required, then we would need to apply to both of them and would
> > > > this additional
> > > > compatible be of any help?
> > > > 
> > > 
> > > No, I think you're doing the right thing of having them both. I just
> > > didn't remember us doing that.
> > > 
> > > > Coming to the part of quirks now, you are right saying both
> > > > SMMUs will need
> > > > to have the same quirks in SC7280 and similar others where both
> > > > are based on
> > > > same IPs but those should probably be *hardware quirks* and if
> > > > they are
> > > > software based like the S2CR quirk depending on the firmware,
> > > > then it might
> > > > not be applicable to both. In case if it is applicable, then as
> > > > Jordan mentioned,
> > > > we can add the same quirks in GPU SMMU implementation.
> > > > 
> > > 
> > > I do suspect that at some point (probably sooner than later) we'd have
> > > to support both inheriting of stream from the bootloader and the
> > > Adreno
> > > "quirks" in the same instance.
> > > 
> > > But for now this is okay to me.
> > > 
> > 
> > Sure, let me know if you or anyone face any issues without it and I will
> > add it. I will resend this series with the dt-bindings patch for sc7280
> > smmu
> > which wasn't cc'd to smmu folks by mistake.
> > 
> 
> I think there is consensus on this series. I can resend if required but it
> still applies cleanly, let me know if you have any comments?

Please resend with the bindings patch, and I'd like Bjorn's Ack as well.

Will
