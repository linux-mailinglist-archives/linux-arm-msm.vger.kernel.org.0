Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDD5D16281D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 15:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgBRO1Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 09:27:24 -0500
Received: from foss.arm.com ([217.140.110.172]:53250 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbgBRO1Y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 09:27:24 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1B931FB;
        Tue, 18 Feb 2020 06:27:23 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5089C3F6CF;
        Tue, 18 Feb 2020 06:27:22 -0800 (PST)
Subject: Re: [PATCH v2] iommu/qcom: fix NULL pointer dereference during probe
 deferral
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Brian Masney <masneyb@onstation.org>, robdclark@gmail.com,
        bjorn.andersson@linaro.org, joro@8bytes.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        j.neuschaefer@gmx.net, iommu@lists.linux-foundation.org,
        agross@kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>
References: <20200104002024.37335-1-masneyb@onstation.org>
 <fc055443-8716-4a0e-b4d5-311517d71ea0@arm.com>
 <20200218120435.GA152723@gerhold.net>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <4ed8542a-40fe-ae34-4203-efbcf285d784@arm.com>
Date:   Tue, 18 Feb 2020 14:27:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200218120435.GA152723@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/02/2020 12:04 pm, Stephan Gerhold wrote:
[...]
> Are you going to send a patch for the diff below?
> AFAICT this problem still exists in 5.6-rc2.
> 
> Your patch also seems to fix a warning during probe deferral on arm64
> that has been around for quite a while. (At least for me...)
> 
> (See https://lore.kernel.org/linux-iommu/CA+G9fYtScOpkLvx=__gP903uJ2v87RwZgkAuL6RpF9_DTDs9Zw@mail.gmail.com/)

Ha, I did see that and vaguely remembered a discussion about that 
warning logic being broken, but I'd totally forgotten I was involved to 
that extent :)

Luckily I've managed to track the diff down in my Git stash, so I'll 
write it up properly - thanks for the reminder!

Robin.
