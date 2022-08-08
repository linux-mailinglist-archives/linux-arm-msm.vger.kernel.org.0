Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2782A58C49B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Aug 2022 10:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241915AbiHHIFn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Aug 2022 04:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbiHHIFc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Aug 2022 04:05:32 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37765CE3B
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Aug 2022 01:05:31 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id z19so7875368plb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Aug 2022 01:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=O+SVGz/QwwQDImSPbxMLknJVY6/6roIp/5evt7khqi8=;
        b=TVmki4I1dSb+1aSt1UwuAmwywPp5Ykpxef49+Z58uTNcDh8SGKkS9NuaKfCpkNQcDO
         0tjc/PD0zoncnQ47Jw/ZZ5EiC+1o/ngsmXCZkFoMpDlUu9vs0UBSQdH2xtSn0CpPJfMw
         jA4cTlIU+7xx7PB0Q9QLrJP+fiB6IIHkBNwiO05czQmuFbVquBEAu8MIVFeBGNvdEqfP
         FLPihOKNSZpCyWseKw9wa4vwhHg+NAwf7KjuSC2xJmCbxX4c5+Y2ozps/QCvwnqB4ULE
         6TMWUGzT4Obt/kknCXCQLMf0rs0AM0Qsven6S6lvmv/CEE7CcIAU/O/V3cPCBs3wwPeV
         Ljrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=O+SVGz/QwwQDImSPbxMLknJVY6/6roIp/5evt7khqi8=;
        b=xbLL+ZVY5o0qH1WnebAT8bDq9ByH/8q5S08YtUGFV0hsWQTMMWvAkHynF7QfguKGzl
         4R9wP6DPzLbX2J2tJ+iKKqu+BZm4Q7MouQ3YHK9lip02i0OtCdpG3z5TD3OeRK+exfhF
         L/pC3hVt40yFBlVMpeVPzZ/s2jvZtzV72wSS3aMQb6FQ8LmgTBXNiHc3RcwHc5sT9by4
         LA/VOALd7xqwU2U5IOGDgpQg403m4Y56LD3ZgemVBrybAGEoH8zzNhifur8O9WPEWRlu
         pAkERdDDC+YC5zrF2FAOMmaV4tUtD+5m9twd+tX33ZlMtyt0LXW8aVbFQ1nCfO0LEFkP
         TxhQ==
X-Gm-Message-State: ACgBeo3J4gpKxmMDaxlx1hDWjZOFosGoFq9QgQueHB0ZvW68RA4Y/5l1
        Z3Tlv3CkVwGMXB2MYvgV9LsU
X-Google-Smtp-Source: AA6agR6PMY+p1aipPNjyAQdBqThMo10eyPly8Z14382u1rTR3VO8S+wL5KHwN9bEEiP3taFf2dKwOg==
X-Received: by 2002:a17:902:aa89:b0:16b:e514:54d2 with SMTP id d9-20020a170902aa8900b0016be51454d2mr17993521plr.127.1659945930573;
        Mon, 08 Aug 2022 01:05:30 -0700 (PDT)
Received: from thinkpad ([117.193.212.254])
        by smtp.gmail.com with ESMTPSA id l21-20020a17090a599500b001f4d4a1b494sm7516034pji.7.2022.08.08.01.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 01:05:30 -0700 (PDT)
Date:   Mon, 8 Aug 2022 13:35:22 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 7/9] dt-bindings: usb: qcom,dwc3: add wakeup-source
 property
Message-ID: <20220808080522.GB7601@thinkpad>
References: <20220804151001.23612-1-johan+linaro@kernel.org>
 <20220804151001.23612-8-johan+linaro@kernel.org>
 <20220806150848.GH14384@thinkpad>
 <Yu6ZwePzzkl7tewV@hovoldconsulting.com>
 <20220806165238.GM14384@thinkpad>
 <Yu6gWHt5BphADaNR@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yu6gWHt5BphADaNR@hovoldconsulting.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Aug 06, 2022 at 07:09:44PM +0200, Johan Hovold wrote:
> On Sat, Aug 06, 2022 at 10:22:38PM +0530, Manivannan Sadhasivam wrote:
> > On Sat, Aug 06, 2022 at 06:41:37PM +0200, Johan Hovold wrote:
> > > On Sat, Aug 06, 2022 at 08:38:48PM +0530, Manivannan Sadhasivam wrote:
> > > > On Thu, Aug 04, 2022 at 05:09:59PM +0200, Johan Hovold wrote:
> > > > > Add a wakeup-source property to the binding to describe whether the
> > > > > wakeup interrupts can wake the system from suspend.
> > > > > 
> > > > > Acked-by: Rob Herring <robh@kernel.org>
> > > > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > > > 
> > > > So this is based on the fact that Qcom glue wrapper is supplying the wakeup
> > > > interrupts. But isn't it possible that on other platform, the DWC IP can supply
> > > > wakeup interrupts?
> > > 
> > > Yeah, possibly, and that's why Rob suggested keeping the 'wakeup-source'
> > > property also in the core node.
> > > 
> > > > In the driver, the wakeup-source parsing has been moved to the Qcom glue driver.
> > > > But this contradicts with the binding.
> > > 
> > > That's irrelevant. The core driver does not implement wakeup support. It
> > > was just added as a hack for the Qualcomm driver, and you won't get
> > > wakeup-capability for other platforms by just parsing the property in
> > > the core driver.
> > > 
> > > When/if wakeup support for such a platform is added, then the core
> > > driver may need to look at the property again.
> > > 
> > 
> > My point is, the platform drivers are free to add "wakeup-source" property in
> > the DWC node. Then in that case, the DWC driver should handle the capability,
> > isn't it?
> 
> No, not really. They wouldn't violate the current binding, but it would
> arguably still be wrong to do so unless that platform actually supports
> wakeup without involvement from a glue layer.
> 
> Perhaps we should reconsider reverting the binding update adding this
> property to the core node and only add it selectively for the platforms
> for which is actually applies (if they even exist).
> 

That sounds right to me.

> > I know it is broken currently, but moving the wakeup parsing code is not
> > helping either.
> 
> It's not even broken. It has never even been implemented.
> 
> Just because someone added a hack that should probably never have been
> merged in the first place, doesn't mean we should somehow pretend that
> we support it.
> 
> > And... I'm aware of the fact that the binding should describe the hardware and
> > not the limitation of the driver. So perhaps we should document it in the
> > driver as a TODO or something?
> 
> I'd rather just revert the binding update to avoid having discussions
> like this. We don't even know if it's possible to support on any
> platform yet (and remember that none of this has even been in an rc
> release yet).
> 

Okay.

Thanks,
Mani

> Johan

-- 
மணிவண்ணன் சதாசிவம்
