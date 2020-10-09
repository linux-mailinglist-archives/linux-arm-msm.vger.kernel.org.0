Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 235232887CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 13:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727311AbgJIL2L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 07:28:11 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:42051 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730626AbgJIL2L (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 07:28:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602242890; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=7SOw3lWK9P7+n02hV+SmjQ1SeqrU8OAZ/VA2UVy4Kmo=; b=FE2fmFXjDbwRMY6775os2/4kskMqlVb5zq5TcznQa56fmMNvRu7OiwxGHJZqVmQutG8IFb5o
 9Re7B9N/IbjKIgacMTWZU2QhQBD7uzJoOH+8A6pt/Q4lWLSEU9n6QCIApR/D4gD/VI8ugnD6
 dBzIGgZBWpLIbcapvfARww+547o=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f80493422a1856a122fd617 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Oct 2020 11:27:48
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3CA3DC433CB; Fri,  9 Oct 2020 11:27:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BB3C5C433CB;
        Fri,  9 Oct 2020 11:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BB3C5C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        ath11k@lists.infradead.org
Subject: Re: [PATCH v3 3/3] arm64: dts: Enabled MHI device over PCIe
References: <1602160344-19586-1-git-send-email-gokulsri@codeaurora.org>
        <1602160344-19586-4-git-send-email-gokulsri@codeaurora.org>
        <20201008131115.GA23649@linux>
        <7dd959fd2d9375d5529cf52e93aafda3@codeaurora.org>
        <20201009082625.GD23649@linux>
Date:   Fri, 09 Oct 2020 14:27:41 +0300
In-Reply-To: <20201009082625.GD23649@linux> (Manivannan Sadhasivam's message
        of "Fri, 9 Oct 2020 13:56:25 +0530")
Message-ID: <87d01r1vwy.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ ath11k list

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> On Thu, Oct 08, 2020 at 11:03:42PM +0530, gokulsri@codeaurora.org wrote:
>> On 2020-10-08 18:41, Manivannan Sadhasivam wrote:
>> > Hi,
>> > 
>> > On Thu, Oct 08, 2020 at 06:02:24PM +0530, Gokul Sriram Palanisamy wrote:
>> > > Enabled MHI device support over PCIe and added memory
>> > > reservation required for MHI enabled QCN9000 PCIe card.
>> > > 
>> > > Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
>> > > ---
>> > >  arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi | 47
>> > > ++++++++++++++++++++++++++++++
>> > >  1 file changed, 47 insertions(+)
>> > > 
>> > > diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
>> > > b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
>> > > index 0827055..e5c1ec0 100644
>> > > --- a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
>> > > +++ b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
>
> [...]
>
>> > > +	pcie0_rp: pcie0_rp {
>> > > +		reg = <0 0 0 0 0>;
>> > > +
>> > > +		status = "ok";
>> > > +		mhi_0: qcom,mhi@0 {
>> > 
>> > MHI doesn't support devicetree as of now so how is this supposed to
>> > work?
>> > Have you tested this series with mainline?
>> > 
>> > Thanks,
>> > Mani
>> > 
>> 
>>  Hi Mani,
>>  This node entries will be consumed by ath11k driver and is not supposed to
>> be consumed by mhi driver.
>>  And yes, it is tested on Mainline.

Upstream ath11k does not yet support QCN9074 so I don't see how this is
tested with mainline ath11k. You must be using some out-of-tree
_unofficial_ ath11k patches.

> Can you please point me to the relevant binding or the code which consumes this
> change?
>
> Also please explain what it does! For enabling MHI support over PCIe you don't
> need this node at all. You just need to define the PCIe device ID in the ath11k
> driver and that's it.
>
> Adding Kalle to this thread...

So currently QCN9074 firmware needs 55 MB of contiguous host memory and
I suspect one reason for these DT entries is an ugly hack to provide
that memory range to the firmware.

We are currently preparing QCN9074 patches for ath11k and finding a
solution how to implement these properly in ath11k. Hopefully there's no
need for hacks like this, we know more once we get the ath11k QCN9074
patches ready. Please drop this patch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
