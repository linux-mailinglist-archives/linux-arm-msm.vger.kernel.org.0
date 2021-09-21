Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26960412E96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 08:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbhIUG0L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 02:26:11 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:34858 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbhIUG0L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 02:26:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632205483; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=r1MIh/PkldH2U+1tjZkQG+gLUFnytt67vnrcPlCRQvw=;
 b=Bqx1dfJ64j6ICx/M2Xnb4fBqYUV4J2WTy+pxf53BUph0hxCeq0SrL0o0NhOuefSvjR2f+Ecs
 Nzw8axMlvlcMoSz21ERn0jpmfr2KGEr4Vm5Ywa0XN0uGRsF0uDAUl4BUqykWlNM3cfoAU/iM
 NoaFqbkBrQ86t934/tB7Iae20s4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61497aa2b585cc7d2498a9f9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 06:24:33
 GMT
Sender: kathirav=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CBA2AC4360D; Tue, 21 Sep 2021 06:24:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D3792C4338F;
        Tue, 21 Sep 2021 06:24:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 21 Sep 2021 11:54:32 +0530
From:   Kathiravan T <kathirav@codeaurora.org>
To:     Robert Marko <robimarko@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, agross@kernel.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: ipq8074: add SMEM support
In-Reply-To: <CAOX2RU5b46H7nqm6G4mHLSqEhGiWktwWjUKF5w10Ut+AdKea-A@mail.gmail.com>
References: <20210902214708.1776690-1-robimarko@gmail.com>
 <YUf3aKn78+41Cb/G@builder.lan>
 <CAOX2RU5b46H7nqm6G4mHLSqEhGiWktwWjUKF5w10Ut+AdKea-A@mail.gmail.com>
Message-ID: <632a7d28c23a8497d35ea009bfe89883@codeaurora.org>
X-Sender: kathirav@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-20 14:55, Robert Marko wrote:
> On Mon, 20 Sept 2021 at 04:52, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
>> 
>> On Thu 02 Sep 16:47 CDT 2021, Robert Marko wrote:
>> 
>> > IPQ8074 uses SMEM like other modern QCA SoC-s, so since its already
>> > supported by the kernel add the required DT nodes.
>> >
>> > Signed-off-by: Robert Marko <robimarko@gmail.com>
>> 
>> Thanks for your patch Robert.
>> 
>> > ---
>> >  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 28 +++++++++++++++++++++++++++
>> >  1 file changed, 28 insertions(+)
>> >
>> > diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> > index a620ac0d0b19..83e9243046aa 100644
>> > --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> > +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> > @@ -82,6 +82,29 @@ scm {
>> >               };
>> >       };
>> >
>> > +     reserved-memory {
>> > +             #address-cells = <2>;
>> > +             #size-cells = <2>;
>> > +             ranges;
>> > +
>> > +             smem_region: memory@4ab00000 {
>> > +                     no-map;
>> > +                     reg = <0x0 0x4ab00000 0x0 0x00100000>;
>> > +             };
>> > +     };
>> > +
>> > +     tcsr_mutex: hwlock {
>> > +             compatible = "qcom,tcsr-mutex";
>> > +             syscon = <&tcsr_mutex_regs 0 0x80>;
>> 
>> Since it's not okay to have a lone "syscon" and I didn't think it was
>> worth coming up with a binding for the TCSR mutex "syscon" I rewrote 
>> the
>> binding a while back. As such qcom,tcsr-mutex should now live in /soc
>> directly.
>> 
>> So can you please respin accordingly?
> 
> Sure, can you just confirm that the:
> reg = <0x01905000 0x8000>;
> 
> Is the whole TCSR range as I don't have docs?

Robert,

TCSR_MUTEX block starts from 0x01905000 and has size 0x20000 (128KB)

Thanks,
Kathiravan T.

> 
> Regards,
> Robert
>> 
>> Thanks,
>> Bjorn
>> 
>> > +             #hwlock-cells = <1>;
>> > +     };
>> > +
>> > +     smem {
>> > +             compatible = "qcom,smem";
>> > +             memory-region = <&smem_region>;
>> > +             hwlocks = <&tcsr_mutex 0>;
>> > +     };
>> > +
>> >       soc: soc {
>> >               #address-cells = <0x1>;
>> >               #size-cells = <0x1>;
>> > @@ -293,6 +316,11 @@ gcc: gcc@1800000 {
>> >                       #reset-cells = <0x1>;
>> >               };
>> >
>> > +             tcsr_mutex_regs: syscon@1905000 {
>> > +                     compatible = "syscon";
>> > +                     reg = <0x01905000 0x8000>;
>> > +             };
>> > +
>> >               sdhc_1: sdhci@7824900 {
>> >                       compatible = "qcom,sdhci-msm-v4";
>> >                       reg = <0x7824900 0x500>, <0x7824000 0x800>;
>> > --
>> > 2.31.1
>> >

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of Code Aurora Forum, hosted by The Linux Foundation
