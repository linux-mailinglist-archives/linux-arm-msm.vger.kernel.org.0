Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8F96CDAAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 15:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbjC2NYF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 09:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbjC2NX4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 09:23:56 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43210525C
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 06:23:51 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id r7-20020a17090b050700b002404be7920aso14512739pjz.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 06:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680096231;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FCUGbgE2LvNcR7hLPqcrIx6jkWOTrrbsJMaWnGrYcZ4=;
        b=KOcZAsDTxZl7koKyj6wYIlCsU6ulFQUfwnmbNVoN9FKVwVCSKoe3HauI0NUqCmMrIL
         NFiVp/FgPcd3DpbvHxDD6Ka9Rvw+t4iQGO/foZVud5a9L1mBMOYDCO6fV832Rp6aR1Po
         2W0mIUYKldNX0sdCy7nuawQ5Ke/Lt0DcFnCh9+wZD2CCM7ZpAc4WKkZB93ZqcudJLK9Z
         YaAoEjRhcjcA/uUpXnTfJaqpHANKcQoZUbrWpfO1MV7C16ZBktngQNLB3hqSiYM0MYOI
         lRiQB3uTaYWtMcX25ZgK2+fD7n0GR6TAtchS6oZFtVD75ICQ/aFME3UuBwP3lENXxJXU
         3k+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680096231;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FCUGbgE2LvNcR7hLPqcrIx6jkWOTrrbsJMaWnGrYcZ4=;
        b=SmAipRO1Xx5j2xdywQkATNcbU0ZiWRRiEpHzVvctEH27V5GM28LEneDG4pnh+yAfpF
         UWl6+3nX8ViRtDIjExi84b3CUdTMUKCSsZDP70OA2+ePaJzeyvRxdvpLQ1TL4hq5tqlI
         mBV8PwiaPZreclffuvCgoBGY0Q/RavMbJZ7LM+uK5OUlnH1WCvP5fTYP34DHfEosg92i
         nI8UvspQD3jwEP/72x5y92EGjRGjKeJPDvzNYXFK9a8ufCOmhoRsM6tm31zCH8ddvZ3p
         TBPRHEPndXNZJG+WDyESf5j/lR+je+DkG17ONDbGlLgiBa9MvymQqzamtNP31eborLj/
         ztuQ==
X-Gm-Message-State: AO0yUKVijQsnmZgvqwezowPJbkcJxplA4E2Rlqk3aTriQQod3upv5zpv
        etpKVFisG6okwvo9SRiBew+4
X-Google-Smtp-Source: AK7set9i8PpqmejhrZD8QpXUtYVJK4X7NibCw11JissA18lCRfqRt0POdmynhT5zRtEgfPgNAtN61g==
X-Received: by 2002:a05:6a20:b288:b0:dd:9848:a1a8 with SMTP id ei8-20020a056a20b28800b000dd9848a1a8mr16627275pzb.16.1680096230581;
        Wed, 29 Mar 2023 06:23:50 -0700 (PDT)
Received: from thinkpad ([117.216.120.213])
        by smtp.gmail.com with ESMTPSA id g7-20020aa78187000000b0062d8107b3c8sm6140226pfi.42.2023.03.29.06.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 06:23:50 -0700 (PDT)
Date:   Wed, 29 Mar 2023 18:53:43 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     andersson@kernel.org, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sc8280xp: Add missing dwc3 quirks
Message-ID: <20230329132343.GD5575@thinkpad>
References: <20230325165217.31069-1-manivannan.sadhasivam@linaro.org>
 <20230325165217.31069-2-manivannan.sadhasivam@linaro.org>
 <ZCKrXZn7Eu/jvdpG@hovoldconsulting.com>
 <20230328093853.GA5695@thinkpad>
 <20230329052600.GA5575@thinkpad>
 <ZCP4MHe+9M24S4nJ@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCP4MHe+9M24S4nJ@hovoldconsulting.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 29, 2023 at 10:34:56AM +0200, Johan Hovold wrote:
> On Wed, Mar 29, 2023 at 10:56:00AM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Mar 28, 2023 at 03:09:03PM +0530, Manivannan Sadhasivam wrote:
> > > On Tue, Mar 28, 2023 at 10:54:53AM +0200, Johan Hovold wrote:
> > > > On Sat, Mar 25, 2023 at 10:22:13PM +0530, Manivannan Sadhasivam wrote:
> > > > > Add missing quirks for the USB DWC3 IP.
> > > > 
> > > > This is not an acceptable commit message generally and certainly not for
> > > > something that you have tagged for stable.
> > > > 
> > > > At a minimum, you need to describe why these are needed and what the
> > > > impact is.
> > > > 
> > > 
> > > I can certainly improve the commit message. But usually the quirks are copied
> > > from the downstream devicetree where qualcomm engineers would've added them
> > > based on the platform requirements.
> > > 
> > > > Also, why are you sending as part of a series purporting to enable
> > > > runtime PM when it appears to be all about optimising specific gadget
> > > > applications?
> > > > 
> > > 
> > > It's not related to this series I agree but just wanted to group it with a
> > > series touching usb so that it won't get lost.
> > > 
> > > I could respin it separately though in v2.
> 
> That's also generally best for USB patches as Greg expects series to be
> merged through a single tree.
> 

Ok, good to know.

> > > > Did you confirm that the below makes any sense or has this just been
> > > > copied verbatim from the vendor devicetree (it looks like that)?
> > > > 
> > > 
> > > As you've mentioned, most of the quirks are for gadget mode which is not
> > > supported by the upstream supported boards. So I haven't really tested them but
> > > for I assumed that Qcom engineers did.
> > > 
> > > > The fact that almost none of the qcom SoCs sets these also indicates
> > > > that something is not right here.
> > > > 
> > > > > Cc: stable@vger.kernel.org # 5.20
> > > > > Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> > > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 14 ++++++++++++++
> > > > >  1 file changed, 14 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > > > > index 0d02599d8867..266a94c712aa 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > > > > @@ -3040,6 +3040,13 @@ usb_0_dwc3: usb@a600000 {
> > > > >  				iommus = <&apps_smmu 0x820 0x0>;
> > > > >  				phys = <&usb_0_hsphy>, <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
> > > > >  				phy-names = "usb2-phy", "usb3-phy";
> > > > > +				snps,hird-threshold = /bits/ 8 <0x0>;
> > > > > +				snps,usb2-gadget-lpm-disable;
> > > > 
> > > > Here you are disabling LPM for gadget mode, which makes most of the
> > > > other properties entirely pointless.
> > 
> > Checked with Qcom on these quirks. So this one is just disabling lpm for USB2
> > and rest of the quirks below are for SS/SSP modes.
> 
> No, snps,hird-threshold is for USB2 LPM and so is
> snps,is-utmi-l1-suspend and snps,has-lpm-erratum as you'll see if you
> look at the implementation.
> 

Correct me if I'm wrong. When I look into the code, "snps,is-utmi-l1-suspend"
and "snps,hird-threshold" are used independently of the LPM mode atleast in one
place:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/dwc3/gadget.c#n2867

But I could be completely wrong here as my understanding of the usb stack is not
that great.

> > > > > +				snps,is-utmi-l1-suspend;
> > > > > +				snps,dis-u1-entry-quirk;
> > > > > +				snps,dis-u2-entry-quirk;
> > > > 
> > > > These appear to be used to optimise certain gadget application and
> > > > likely not something that should be set in a dtsi.
> > > > 
> > > 
> > > I will cross check these with Qcom and respin accordingly.
> > > 
> > 
> > These quirks are needed as per the DWC IP integration with this SoC it seems.
> > But I got the point that these don't add any values for host only
> > configurations. At the same time, these quirks still hold true for the SoC even
> > if not exercised.
> > 
> > So I think we should keep these in the dtsi itself.
> 
> Please take a closer look at the quirks you're enabling first. Commit
> 729dcffd1ed3 ("usb: dwc3: gadget: Add support for disabling U1 and U2
> entries") which added 
> 
> > > > > +				snps,dis-u1-entry-quirk;
> > > > > +				snps,dis-u2-entry-quirk;
> 
> explicitly mentions
> 
> 	Gadget applications may have a requirement to disable the U1 and U2
> 	entry based on the usecase.
> 
> which sounds like something that needs to be done in a per board dts at
> least.
> 

Going by this commit message it sounds like it. But...

> Perhaps keeping all of these in in the dtsi is correct, but that's going
> to need some more motivation than simply that some vendor does so (as
> they often do all sorts of things they should not).
> 

If you read my last reply one more time, I didn't reason it based on the vendor
code.

But I hear a contradict reply from Qcom saying that these properties are
required as a part of the DWC3 IP integration with the SoC. I need to recheck
with them again tomorrow.

Also, if these properties are application specific then they shouldn't be in
devicetree atleast :/

- Mani

- Mani

> Johan

-- 
மணிவண்ணன் சதாசிவம்
