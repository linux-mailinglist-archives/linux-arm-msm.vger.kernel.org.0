Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1397E2604D2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Sep 2020 20:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729231AbgIGStf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Sep 2020 14:49:35 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:15922 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbgIGSte (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Sep 2020 14:49:34 -0400
Date:   Mon, 07 Sep 2020 18:49:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1599504570;
        bh=ZMHD4pb6eLStL6z+QcCKhBat0AGNJTHtmNZKUYPW0hY=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=LsH3Ubg/tM9MN5ir7XnQ3WLf4Kqa4Ok1LVbdc5dOfguhK0D8iWntPUNb2AniTkGTr
         t6yGWMWn/awny7KYCVDQBarjP4Vi8tM8RXu67wPoDYP+mLUrqSnec1IuJEjL6LF5B4
         4xqRBsAXkGGnM0YxTvto9ec9z8+VlwPh1j+w36W4=
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH v3 0/8] iommu/arm-smmu: Support maintaining bootloader mappings
Message-ID: <c1cce546-0c49-05e2-8c54-5f343db273c8@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-04 16:55, Bjorn Andersson wrote:
> Based on previous attempts and discussions this is the latest attempt at
> inheriting stream mappings set up by the bootloader, for e.g. boot splash=
 or
> efifb.
>
> Per Will's request this builds on the work by Jordan and Rob for the Adre=
no
> SMMU support. It applies cleanly ontop of v16 of their series, which can =
be
> found at
> https://lore.kernel.org/linux-arm-msm/20200901164707.2645413-1-robdclark@=
gmail.com/
>
> Bjorn Andersson (8):
>    iommu/arm-smmu: Refactor context bank allocation
>    iommu/arm-smmu: Delay modifying domain during init
>    iommu/arm-smmu: Consult context bank allocator for identify domains
>    iommu/arm-smmu-qcom: Emulate bypass by using context banks
>    iommu/arm-smmu-qcom: Consistently initialize stream mappings
>    iommu/arm-smmu: Add impl hook for inherit boot mappings
>    iommu/arm-smmu: Provide helper for allocating identity domain
>    iommu/arm-smmu-qcom: Setup identity domain for boot mappings
>
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 111 ++++++++++++++++++-
>   drivers/iommu/arm/arm-smmu/arm-smmu.c      | 122 ++++++++++++++-------
>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  14 ++-
>   3 files changed, 205 insertions(+), 42 deletions(-)
>

Tested on the OnePlus 6 (SDM845), allows booting with display enabled.



