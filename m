Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 433BA6620AE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 09:55:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236937AbjAIIyu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 03:54:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237061AbjAIIyO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 03:54:14 -0500
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E6D465F4;
        Mon,  9 Jan 2023 00:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1673253793;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=dIhap9211BtIOAVDnSIqsGZy+LaCC1VK75bgdFbfgbs=;
    b=cXNVhOmKbSpT1XAUhDgLAw08Zn25IrmCprqqhq5JyA5bn8oqEZ6HCUMMeFvI5+zoyF
    OskNjkMRBf3Z4QAc6HEzizdyKoZeUvzVvvPcaC8OcsNk02mA40sDFbqRxiXmCbRp63VM
    kcxyOmNO+srRuI/BVzTq87GiS2XRCMic6HNDuT0tXQM5pefF+zGthPj2nI0syUo7x/81
    T3z+FFZW9vKk7L6JsU6Vni8ffI8Mce2FaYmiTD3M9h+BGWxT+22DFdmo0EXmvwFrNJdf
    c00yU9skT0n6oKXOi5ajAp0RpbAr0mMJ9vw+/QYs/eaMFu4KKLzclVccUkJo0RrsBLJt
    8xtg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJAhdlWwvShtQ=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
    with ESMTPSA id Yce349z098hDwh4
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 9 Jan 2023 09:43:13 +0100 (CET)
Date:   Mon, 9 Jan 2023 09:43:07 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Rob Herring <robh@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: arm: qcom,ids: Add a bunch of older SoCs
Message-ID: <Y7vTm70qeZR6w8xq@gerhold.net>
References: <20230104115348.25046-1-stephan@gerhold.net>
 <20230104115348.25046-4-stephan@gerhold.net>
 <20230108214052.GA313089-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230108214052.GA313089-robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jan 08, 2023 at 03:40:52PM -0600, Rob Herring wrote:
> On Wed, Jan 04, 2023 at 12:53:47PM +0100, Stephan Gerhold wrote:
> > Sync the SoC IDs in qcom,ids.h with relevant entries from Qualcomm's LK
> > bootloader [1] that is used for almost all older Qualcomm SoCs.
> > 
> > Several of these are already supported, e.g.:
> >   - MSM8960 -> APQ8060, MSM8260, ...
> >   - MSM8976 -> APQ8076
> >   - MSM8956 -> APQ8056
> > Others are currently being worked on, e.g.:
> >   - MSM8909(W) -> APQ8009(W), MSM8905, MSM8209, ...
> >   - MSM8939 -> MSM8239, ...
> > 
> > And even all remaining ones added are close enough to what is already
> > supported so that future support is realistic (if someone steps up to
> > do the work).
> > 
> > Add all of them at once to avoid having to add them one by one in the
> > future. This will also benefit other projects making use of the same
> > dt-bindings, e.g. bootloaders where adding support for all these SoCs
> > is a bit easier than on Linux.
> 
> The promise was in accepting the properties upstream is we'd only be 
> adding these for bootloaders with dtbs that we can't otherwise update or 
> change.

qcom,ids.h contains all the SoC IDs, even ones not meant to be used in
the deprecated "qcom,msm-id" property. This is because it is also used
in the socinfo driver for example (that I'm also editing in this
series).

The actual allowlist for the "qcom,msm-id"/"qcom,board-id" is in
Documentation/devicetree/bindings/arm/qcom.yaml and is unchanged by this
patch series.

Still:

>
> Do all of those meet this criteria? Seems unlikely.
> 

All platforms added in this patch are older ones that do indeed require
the "qcom,msm-id"/"qcom,board-id" properties - except for the really
ancient ones that are still using ATAGS for booting.

However, there is no need to extend the allowlist to all these
platforms. We're circumventing the limitations of the Qualcomm
bootloader by "chainloading" another bootloader without those quirks
(right now mainly a modified version of Qualcomm's original bootloader,
but U-Boot also works on some of these platforms). That is why the
deprecated properties do not need to be present in the Linux DT.

Thanks,
Stephan
