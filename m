Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D722EB857
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 04:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbhAFDHz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 22:07:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbhAFDHz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 22:07:55 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14154C06134C
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 19:07:15 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id d2so907417pfq.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 19:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YoqUb6rHjvyc1tWs/2rkmXC92ndzOCiq60lMMpB44Fg=;
        b=kG3TPIyItVDnXOEeD9DyvUY3lNR5WbE4FOsW4duAUMvGdfuBFQQvI/vcqRNN1rBoBY
         tChS9/ObgtW2P5+jYIvm1Ij9bUsD8clsnrhZGilV3zm18t+2XnqltnwSEYvQwGnlr1th
         POFRIFuo4xxpSfe4LGITQ8mTCntDOLJAoVK23ADFs57U9IK4q4jkIa8UncnZp/94YYgZ
         R8XWWU2QQfMxFVQyUfHLiIqvImE58SnkCOQeI37mU34sri0O/7p7kRdqOUCYpkBawfoC
         x/kr8qFmtQDlkwdXzIHZ29CfoE8/pDYvtzjKnRIe2FPDh/ZbAEoEQfe91/qOAQ3ZNxz1
         WqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YoqUb6rHjvyc1tWs/2rkmXC92ndzOCiq60lMMpB44Fg=;
        b=GJqWMLaw3NhUXOlcfWP5Vxxeswx6VKh5/cIENv48EkAhw3HBWPBIqRBJVEvk5Af12c
         cc48BBSR1pfGkTG5YFRt4YCPSzAxx2iYnO9TFcxwuqQvX/7KrMraXrArRdkNZx7fZwdJ
         yyKW9ma1W1HMPyiSubbgslQ2cs7lHeZiI/ogVBhh/28EuJ+gwFCqeWcvZFkbvfEgEa9h
         1mSdQax5HNjvG7156T0iE/KP0UkrV1ssLewytgLBvRPGLm4vrfXxkyG7CHGByI8Biq32
         WeTODdshageVSmbxxuVoY7eOT7byumgIKiYDC80nfvJBd7ab1vHhYRTb3OeNp5Xyqegi
         x3YA==
X-Gm-Message-State: AOAM531bPuBwYKeuv/jbGZ+t+L+1IIMdhgs/o2CdnxoK5KhchF7N8rcI
        6bw/NGvxyc073HUEv8r68y+m
X-Google-Smtp-Source: ABdhPJzHprK2jDHBk3YsbiTCFkTqLJ1GRqc3BA42Nt/fm/Qgji6jqfeKFW6XFNBrBSmNIcTLlqnJ2A==
X-Received: by 2002:aa7:8708:0:b029:19e:924:345a with SMTP id b8-20020aa787080000b029019e0924345amr1864951pfo.54.1609902434521;
        Tue, 05 Jan 2021 19:07:14 -0800 (PST)
Received: from thinkpad ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id a18sm668011pfg.107.2021.01.05.19.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 19:07:13 -0800 (PST)
Date:   Wed, 6 Jan 2021 08:37:09 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 02/18] ARM: dts: qcom: sdx55: Add reserved memory nodes
Message-ID: <20210106030709.GD14794@thinkpad>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
 <20210105122649.13581-3-manivannan.sadhasivam@linaro.org>
 <X/Sqfeonlthrys/O@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/Sqfeonlthrys/O@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 05, 2021 at 12:05:49PM -0600, Bjorn Andersson wrote:
> On Tue 05 Jan 06:26 CST 2021, Manivannan Sadhasivam wrote:
> 
> > From: Vinod Koul <vkoul@kernel.org>
> > 
> > This adds reserved memory nodes to the SDX55 dtsi as defined by v8 of
> > the memory map
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  arch/arm/boot/dts/qcom-sdx55.dtsi | 67 +++++++++++++++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
> > index 08b4a40338fa..eeb6bf392f93 100644
> > --- a/arch/arm/boot/dts/qcom-sdx55.dtsi
> > +++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
> > @@ -60,6 +60,73 @@ psci {
> >  		method = "smc";
> >  	};
> >  
> > +	reserved-memory {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges;
> > +
> > +		mpss_debug_mem: memory@8ef00000 {
> > +			no-map;
> > +			reg = <0x8ef00000 0x800000>;
> > +		};
> > +
> > +		hyp_mem: memory@8fc00000 {
> > +			no-map;
> > +			reg = <0x8fc00000 0x80000>;
> > +		};
> > +
> > +		ac_db_mem: memory@8fc80000 {
> > +			no-map;
> > +			reg = <0x8fc80000 0x40000>;
> > +		};
> > +
> > +		secdata_mem: memory@8fcfd000 {
> > +			no-map;
> > +			reg = <0x8fcfd000 0x1000>;
> > +		};
> > +
> > +		ipa_fw_mem: memory@8fced000 {
> > +			no-map;
> > +			reg = <0x8fced000 0x10000>;
> > +		};
> > +
> > +		sbl_mem: memory@8fd00000 {
> > +			no-map;
> > +			reg = <0x8fd00000 0x100000>;
> > +		};
> > +
> > +		aop_image: memory@8fe00000 {
> > +			no-map;
> > +			reg = <0x8fe00000 0x20000>;
> > +		};
> > +
> > +		aop_cmd_db: memory@8fe20000 {
> > +			compatible = "qcom,cmd-db";
> > +			reg = <0x8fe20000 0x20000>;
> > +			no-map;
> > +		};
> > +
> > +		smem_mem: memory@8fe40000 {
> > +			no-map;
> > +			reg = <0x8fe40000 0xc0000>;
> > +		};
> > +
> > +		tz_mem: memory@8ff00000 {
> > +			no-map;
> > +			reg = <0x8ff00000 0x100000>;
> > +		};
> > +
> > +		tz_apps_mem: memory@0x90000000 {
> > +			no-map;
> > +			reg = <0x90000000 0x500000>;
> > +		};
> > +
> > +		mpss_adsp_mem: memory@90800000 {
> > +			no-map;
> > +			reg = <0x90800000 0xf800000>;
> 
> Didn't you say this moved to 0x9c000000?
> 

That's for an old bootloader which is used in the MTP. But I guess we should
always use the latest mem map for the latest bootloader.

Thanks,
Mani

> Regards,
> Bjorn
> 
> > +		};
> > +	};
> > +
> >  	soc: soc {
> >  		#address-cells = <1>;
> >  		#size-cells = <1>;
> > -- 
> > 2.25.1
> > 
