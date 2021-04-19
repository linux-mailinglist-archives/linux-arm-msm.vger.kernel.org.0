Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBB1363F56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Apr 2021 12:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238336AbhDSKLf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 06:11:35 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:52201 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238204AbhDSKLe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 06:11:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618827065; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=6Aptr+/L0+w9rf4i+SajziWUdZ5O4veMlgS9jJhzw+c=;
 b=BoLMZTAFgmBUJcWKNK6SaWEgY504hhycuV2Z/xeLWq9oDIhJUahaBxBhzJPDQ6zqcoqmwEIe
 +vNZ9gTlZcrjrUtUFnNuZ2ILbnN89YLfTLmUpVTcry7FZkuAXkDhRbzGyymaAt6djmH84u0t
 12G91QlBeA1aLoWSf+fG7PHdfjI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 607d5731a817abd39a4600f2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Apr 2021 10:10:57
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 04801C4323A; Mon, 19 Apr 2021 10:10:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 25721C433D3;
        Mon, 19 Apr 2021 10:10:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 19 Apr 2021 15:40:56 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        p.zabel@pengutronix.de, robh+dt@kernel.org, agross@kernel.org,
        mani@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sc7280: Add nodes to boot WPSS
In-Reply-To: <14476306c74356a747473e820d4067a6@codeaurora.org>
References: <1615269111-25559-1-git-send-email-sibis@codeaurora.org>
 <1615269111-25559-7-git-send-email-sibis@codeaurora.org>
 <161567197220.1478170.12600358804299446135@swboyd.mtv.corp.google.com>
 <YE2OJz1pI81Uj8DA@builder.lan>
 <161653719350.3012082.12055201782488576903@swboyd.mtv.corp.google.com>
 <14476306c74356a747473e820d4067a6@codeaurora.org>
Message-ID: <92f87f0b2a080077f426b7d704314e35@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-24 12:19, Sibi Sankar wrote:
> On 2021-03-24 03:36, Stephen Boyd wrote:
>> Quoting Bjorn Andersson (2021-03-13 20:16:39)
>>> On Sat 13 Mar 15:46 CST 2021, Stephen Boyd wrote:
>>> 
>>> > Quoting Sibi Sankar (2021-03-08 21:51:51)
>>> > > Add miscellaneous nodes to boot the Wireless Processor Subsystem on
>>> >
>>> > Maybe add (WPSS) after the name so we know they're related.
>>> >
>>> > > SC7280 SoCs.
>>> > >
>>> > > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>>> > > ---
>>> > >
>>> > > https://patchwork.kernel.org/project/linux-arm-msm/list/?series=438217
>>> > > Depends on ipcc dt node enablement from ^^
>>> > >
>>> > >  arch/arm64/boot/dts/qcom/sc7280.dtsi | 143 +++++++++++++++++++++++++++++++++++
>>> > >  1 file changed, 143 insertions(+)
>>> > >
>>> > > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> > > index 18637c369c1d..4f03c468df51 100644
>>> > > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> > > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> > > @@ -244,12 +251,131 @@
>>> > >                 reg = <0 0x80000000 0 0>;
>>> > >         };
>>> > >
>>> > > +       tcsr_mutex: hwlock {
>>> > > +               compatible = "qcom,tcsr-mutex";
>>> > > +               syscon = <&tcsr_mutex_regs 0 0x1000>;
>>> > > +               #hwlock-cells = <1>;
>>> > > +       };
>>> >
>>> > Is this node in the right place? I think the node above it is 'memory'?
>>> > In which case 'hwlock' comes before 'memory' alphabetically.
>>> >
>>> 
>>> Thanks for spotting this, as it's no longer acceptable to have a
>>> standalone "syscon" node I was asked to rewrite the binding for this 
>>> a
>>> few months ago. So the tcsr_mutex should now be represented with a 
>>> reg
>>> under /soc.
>> 
>> Oh nice, I wasn't aware.
>> 
>>> > > +                       #interrupt-cells = <2>;
>>> > > +               };
>>> > > +       };
>>> > > +
>>> > > +       smp2p-mpss {
>>> > > +               compatible = "qcom,smp2p";
>>> > > +               qcom,smem = <435>, <428>;
>>> > > +               interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
>>> > > +                                            IPCC_MPROC_SIGNAL_SMP2P
>>> > > +                                            IRQ_TYPE_EDGE_RISING>;
>>> > > +               mboxes = <&ipcc IPCC_CLIENT_MPSS
>>> > > +                               IPCC_MPROC_SIGNAL_SMP2P>;
>>> > > +
>>> > > +               qcom,local-pid = <0>;
>>> > > +               qcom,remote-pid = <1>;
>>> > > +
>>> > > +               modem_smp2p_out: master-kernel {
>>> > > +                       qcom,entry-name = "master-kernel";
>>> > > +                       #qcom,smem-state-cells = <1>;
>>> > > +               };
>>> > > +
>>> > > +               modem_smp2p_in: slave-kernel {
>>> > > +                       qcom,entry-name = "slave-kernel";
>>> >
>>> > Do these names need to have 'master' and 'slave' in them? We're trying
>>> > to avoid these terms. See Documentation/process/coding-style.rst Section
>>> > 4 naming.
>>> >
>>> 
>>> They need to match the naming in the firmware, but I would welcome a
>>> future change to something in line with the coding style and simply 
>>> more
>>> descriptive.
>>> 
>> 
>> Sibi can this be done? I think it's still pretty early days for the
>> firmware so hopefully the terms can be replaced with something
>> different.
> 
> I'll discuss the ask with the modem fw team and
> get back.

Sorry for the delayed response. Looks
like it's something Qualcomm wouldn't
want to do mid-project since a number
of the fw images are re-used across
platforms. But this is something that
will be taken up on newer SoCs.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
