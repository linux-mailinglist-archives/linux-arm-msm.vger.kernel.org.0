Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A96758043
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jul 2023 16:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbjGRO63 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 10:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232867AbjGRO62 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 10:58:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D9C5172D
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 07:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689692267;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=a9UHr3e23b92wXYao3lrSR+Cnwz7ksG5waCAvSeyw2w=;
        b=XEnmxiG2HueEsnZadC7KFKedJmETlfd/aVSzWnIVQUxvt8Vq/pMxB1MWR2Yv/TaZ2bZJr5
        SnV9vGabj3mSs9+XTd44KKl6XuqYbKKz9mW+CwRcTjpLbRWiFfRcSIHkHr4ISrn7xEVfoA
        cC3AGibVtKpCexT2ipAIvhLIgAFqtes=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-I3FPp8eDOhmbg_2HNkCJqA-1; Tue, 18 Jul 2023 10:57:45 -0400
X-MC-Unique: I3FPp8eDOhmbg_2HNkCJqA-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-765a1a97103so662400485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 07:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689692264; x=1692284264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9UHr3e23b92wXYao3lrSR+Cnwz7ksG5waCAvSeyw2w=;
        b=g0dMxH148+BAZQhTT5albv5/uAmL0JdwaijYP6zNXW33Foy2P9l2ZVDjP2l69nr8dj
         8dmQF/XiqahZWmSuAglEnqvGJK60xgjN8CRHJbfDqQcw6SkUM+vZ+svoY1Cah4+HemOw
         deCro21V6zatJ7W0SOBzgAbBJaRfnb1VcJVVfAFURRcupBWg7J4W1hmQv8LtfGGSh9oU
         SGfugAF332DpbJmE5sxFdTu1ksh1TbiSTdt8lsHdD5rvWY0Aw+nzm16eSAAX+jTl0AS2
         w2Rb0zy1AtvXhGxbvmytWvwOK3617uj3KA8aEByLdmqm+Ln2MPDSZyvVDgVXZ5zm+zVC
         qp+A==
X-Gm-Message-State: ABy/qLa73XZX/WGV9Y7+sk9afoPzsSzSFzppeZR187e+hYkkeCgnOyQX
        Iu4eUGxWqvBk4PJyap4IXbrbi0AV3pAw7hzmy+93MNiBp8lnsIVcjCuwfD3GYWSrOzJ7gumbhH0
        LLxT1E1EawHPPz50rnOZJ4NSDXw==
X-Received: by 2002:a05:620a:2801:b0:767:1a0c:6ed8 with SMTP id f1-20020a05620a280100b007671a0c6ed8mr20676061qkp.60.1689692264105;
        Tue, 18 Jul 2023 07:57:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFiKp8UBgEVLFNJc08vIC3X40UERE1dZL9GdHK5Bo8jOTs8tWCeLcLXwKGDDVlGpTU1U8k8uQ==
X-Received: by 2002:a05:620a:2801:b0:767:1a0c:6ed8 with SMTP id f1-20020a05620a280100b007671a0c6ed8mr20676046qkp.60.1689692263888;
        Tue, 18 Jul 2023 07:57:43 -0700 (PDT)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id g23-20020a05620a109700b00767d2870e39sm646250qkk.41.2023.07.18.07.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:57:43 -0700 (PDT)
Date:   Tue, 18 Jul 2023 10:57:42 -0400
From:   Eric Chanudet <echanude@redhat.com>
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sa8540p-ride: enable rtc
Message-ID: <t6kbp4mlqnn5fzc2covhep4hnjzgwdld6af4h5ddfwandrd6mz@zvmhgnqrm242>
References: <20230717182351.3389252-1-echanude@redhat.com>
 <34a4a052-b76f-b49d-6703-405d65ffd597@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34a4a052-b76f-b49d-6703-405d65ffd597@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 17, 2023 at 09:28:15PM +0100, Caleb Connolly wrote:
> On 17/07/2023 19:23, Eric Chanudet wrote:
> > SA8540P-ride is one of the Qualcomm platforms that does not have access
> > to UEFI runtime services and on which the RTC registers are read-only,
> > as described in:
> > https://lore.kernel.org/all/20230202155448.6715-1-johan+linaro@kernel.org/
> > 
> > Reserve four bytes in one of the PMIC registers to hold the RTC offset
> > the same way as it was done for sc8280xp-crd which has similar
> > limitations:
> >     commit e67b45582c5e ("arm64: dts: qcom: sc8280xp-crd: enable rtc")
> > 
> > One small difference on SA8540P-ride, the PMIC register bank SDAM6 is
> > not writable, so use SDAM7 instead.
> > 
> > Signed-off-by: Eric Chanudet <echanude@redhat.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi | 10 +++++++++-
> >  arch/arm64/boot/dts/qcom/sa8540p-ride.dts   | 15 +++++++++++++++
> >  2 files changed, 24 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
> > index 1221be89b3de..9c5dcad35cce 100644
> > --- a/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
> > @@ -14,7 +14,7 @@ pmm8540a: pmic@0 {
> >  		#address-cells = <1>;
> >  		#size-cells = <0>;
> >  
> > -		rtc@6000 {
> > +		pmm8540a_rtc: rtc@6000 {
> >  			compatible = "qcom,pm8941-rtc";
> >  			reg = <0x6000>, <0x6100>;
> >  			reg-names = "rtc", "alarm";
> > @@ -22,6 +22,14 @@ rtc@6000 {
> >  			wakeup-source;
> >  		};
> >  
> > +		pmm8540a_sdam_7: nvram@b610 {
> Johan disabled the SDAM node in their series for sc8280xp. Unless it's
> used on all sa8540p platforms, you should probably also do that here.
> 
> 			
> > +			compatible = "qcom,spmi-sdam";
> > +			reg = <0xb610>;
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +			ranges = <0 0xb610 0xb0>;
> 			status = "disabled";
> 
> With that fix,
> 
> Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>

Thank you for the review. Here is the v2 with the requested change:
https://lore.kernel.org/linux-arm-msm/20230718145105.3464105-1-echanude@redhat.com/

Best,

-- 
Eric Chanudet

