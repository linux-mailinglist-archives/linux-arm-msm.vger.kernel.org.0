Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEC5157558F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 21:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbiGNTBz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 15:01:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiGNTBz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 15:01:55 -0400
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 589C53D595;
        Thu, 14 Jul 2022 12:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1657825309;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=pRes7n5R1DDewbC5DkuuzmUV6aRqrRqkonDzKoWO2YA=;
    b=ADfadyMPNMAVvhlYSoYx5qX0yarkzFWusjPc5ok/xwEujzf07lGtvh6niU4i0ehErE
    Xn/Jd+opGuPnRxl7tBdDUek8AXzFum2DS0elsEdW3qgp8CLGiEdxtu4TBkCVNkbORmym
    U+6W9wbYQ8eufVZBM9UeR6oZo5ta1+KDgW3q8C7Ph+zOGxQ0HNWkSNpmoxcqOD2jw2Ii
    nszz192AZ5TLGZjDQWgbhyd9NKDFF67aYpzlJoRNSZ9txVxsw9kLESXrwXRCFDCDq0KI
    ql11T6lTzhr484m6G6x4vf9gyWkhXg52lm9UoJmgrSuegH4NVWbkHTvQdQ1hKTGb7p84
    UIkg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrKw8+6Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.47.0 AUTH)
    with ESMTPSA id he04d0y6EJ1n8CC
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 14 Jul 2022 21:01:49 +0200 (CEST)
Date:   Thu, 14 Jul 2022 21:01:47 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/6] ARM: dts: qcom: msm8974: Disable remoteprocs by
 default
Message-ID: <YtBoG1mAwOlylGP2@gerhold.net>
References: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
 <20220712124421.3129206-4-stephan.gerhold@kernkonzept.com>
 <bcb1e0ec-f0b7-ce45-a63f-7272c1f398c9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcb1e0ec-f0b7-ce45-a63f-7272c1f398c9@linaro.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 14, 2022 at 11:55:44AM +0200, Krzysztof Kozlowski wrote:
> On 12/07/2022 14:44, Stephan Gerhold wrote:
> > The remoteproc configuration in qcom-msm8974.dtsi is incomplete because
> > 
> > diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> > index 814ad0b46232..35246bd02132 100644
> > --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> > +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> > @@ -1172,6 +1172,8 @@ remoteproc_mss: remoteproc@fc880000 {
> >  			qcom,smem-states = <&modem_smp2p_out 0>;
> >  			qcom,smem-state-names = "stop";
> >  
> > +			status = "disabled";
> > +
> >  			mba {
> >  				memory-region = <&mba_region>;
> >  			};
> > @@ -1639,6 +1641,8 @@ remoteproc_adsp: remoteproc@fe200000 {
> >  			qcom,smem-states = <&adsp_smp2p_out 0>;
> >  			qcom,smem-state-names = "stop";
> >  
> > +			status = "disabled";
> > +
> >  			smd-edge {
> >  				interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
> >  
> > diff --git a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
> > index 58cb2ce1e4df..8a6b8e4de887 100644
> > --- a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
> > +++ b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
> > @@ -147,10 +147,12 @@ wcnss {
> >  };
> >  
> >  &remoteproc_adsp {
> > +	status = "okay";
> 
> These go to the end of properties.
> 

All the other nodes in these two files have the 'status = "okay"' at the
beginning (just like most of the Qualcomm boards actually). I know there
have been some discussion to change this, but until existing boards have
been changed I would rather not introduce a wild mix of both approaches
(within the same file at least).

Thanks,
Stephan
