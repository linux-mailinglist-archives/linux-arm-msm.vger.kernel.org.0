Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8AD394DD7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 May 2021 21:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbhE2T0W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 May 2021 15:26:22 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:48560 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229726AbhE2T0W (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 May 2021 15:26:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622316285; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=YMDXTcEcKFyLHXnnDZTwwkxpT9FLywcjBpEH0RdgkCY=; b=lgaCL+3oS09udEiT1ygSCmDoAkxrcCYGEbBfdNYI2/K8auuHrrttyGxuvMvruz7zcqZbEExY
 INoOZFU7Kf9ulDLjYiVm5ErplOTdYhXBY5MMKXGcEqv8SpxaiXeG2nHB7kgAFKXK4rklTlic
 dHv58qL9aemKzGzAZ6pRNvPA2S0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60b294ebe27c0cc77f208b3c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 29 May 2021 19:24:27
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F2BF8C4338A; Sat, 29 May 2021 19:24:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A3833C433F1;
        Sat, 29 May 2021 19:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A3833C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Sat, 29 May 2021 12:24:21 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Wesley Cheng <wcheng@codeaurora.org>, balbi@kernel.org,
        gregkh@linuxfoundation.org, agross@kernel.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Thinh.Nguyen@synopsys.com
Subject: Re: [PATCH v8 5/5] arm64: boot: dts: qcom: sm8150: Enable dynamic TX
 FIFO resize logic
Message-ID: <20210529192420.GA11263@jackp-linux.qualcomm.com>
References: <1621410238-31395-1-git-send-email-wcheng@codeaurora.org>
 <1621410238-31395-6-git-send-email-wcheng@codeaurora.org>
 <YLJ000lIVhZM5WEV@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLJ000lIVhZM5WEV@builder.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Sat, May 29, 2021 at 12:07:31PM -0500, Bjorn Andersson wrote:
> On Wed 19 May 02:43 CDT 2021, Wesley Cheng wrote:
> 
> > Enable the flexible TX FIFO resize logic on SM8150.  Using a larger TX FIFO
> > SZ can help account for situations when system latency is greater than the
> > USB bus transmission latency.
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> 
> Based on my previous request of always adding this for the Qualcomm
> platforms that supports it, which is implemented in patch 4, I don't see
> a need for this patch.
> 
> Am I missing something?

Looks like Wesley had quickly sent a V9 of the series right after V8,
and the DTSI change is dropped.

https://lore.kernel.org/linux-usb/1621410561-32762-1-git-send-email-wcheng@codeaurora.org/T/#t

Thanks,
Jack

> > ---
> >  arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > index 51235a9..8f532cb 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > @@ -2275,6 +2275,7 @@
> >  				iommus = <&apps_smmu 0x140 0>;
> >  				snps,dis_u2_susphy_quirk;
> >  				snps,dis_enblslpm_quirk;
> > +				tx-fifo-resize;
> >  				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
> >  				phy-names = "usb2-phy", "usb3-phy";
> >  			};

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
