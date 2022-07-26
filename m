Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E707558183F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 19:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238968AbiGZRTl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 13:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbiGZRTk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 13:19:40 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D0C1A051;
        Tue, 26 Jul 2022 10:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1658855976;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=uaTIlHXasK14UazWIZQ5J2yjUjFXPsbpUf42M8f9VKM=;
    b=gvrPlAyjpM6IenLkD2ogLNmZZyAieUbVVItaRfJxnKVysjU4PbhAQfHb/Q5Z2PAsHZ
    pQFp8iQY117uBgRq8A03kUpD+T064ZIwLYiR/x4/MeUtHDeA5xFo5uW6ENFVwHNT0iO5
    epUbQBHtUsgK48cOE20W3Jb7xyh34cc31EiVqV9CCqamqlMOEMon1/O9c5Q92lcbcVjm
    F9vvSeH4FlJgmf8wRjlsr3ywhEYVfBWVn9bzddKYBl8re6MoQdlQl4QwTZhaYMvCAYTF
    xLz+l73Bxab+IIFuGArHzb0g/C4dwuWbv+Iv0Kc+aMYygv4bRNVRoPwwCd3L38nwa+LM
    RTmA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrKw7/aY="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.47.0 AUTH)
    with ESMTPSA id u1045ey6QHJZ3UF
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 26 Jul 2022 19:19:35 +0200 (CEST)
Date:   Tue, 26 Jul 2022 19:19:18 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: remoteproc: qcom,q6v5: Move MSM8916
 to schema
Message-ID: <YuAh/ahbNiiQL5Ge@gerhold.net>
References: <20220718140344.1831731-1-stephan.gerhold@kernkonzept.com>
 <20220718140344.1831731-3-stephan.gerhold@kernkonzept.com>
 <20220720224608.GA4107504-robh@kernel.org>
 <Ytmw41giZ/4S+Pp0@gerhold.net>
 <27b0d451-4cef-cfc3-c6ae-3bb6cb448083@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27b0d451-4cef-cfc3-c6ae-3bb6cb448083@linaro.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jul 23, 2022 at 10:41:53PM +0200, Krzysztof Kozlowski wrote:
> On 21/07/2022 22:02, Stephan Gerhold wrote:
> > What remains is maybe:
> > 
> >   - "qcom,smem-states", which is already used in several other schemas
> >     and could be possibly defined together with #qcom,smem-state-cells
> >     in some generic schema(?)
> > 
> >   - "qcom,halt-regs", "firmware-name", "smd-edge" are used by different
> >     Qualcomm remoteproc drivers, so they could possibly be defined in
> >     some common "qcom-remoteproc.yaml" schema(?)
> 
> smd-edge and glink is already in remoteproc/qcom,smd-edge.yaml
> qcom,glink-edge.yaml
> 

Yep, I'm actually using it already in this patch. I think what I meant
is that the smd-edge property $ref could be already defined in a common
"qcom-remoteproc.yaml" schema and inherited via allOf, since all the
qcom remoteprocs should have either a smd-edge or glink-edge.

But all in all I'm still unsure which "common properties" Rob is
referring to here, in which file to place them, and if this is worth it
at all for the few I have listed above... :-)

Thanks,
Stephan
