Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C559E6B017E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 09:33:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbjCHIdL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 03:33:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbjCHIcs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 03:32:48 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD0CB4F40
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 00:32:14 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id p3-20020a17090ad30300b0023a1cd5065fso1242405pju.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 00:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678264320;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DUD51QaZoHpiOtcxgT87APwX38JVxAqFH0OdC0C8sao=;
        b=WDgnc/GxLNVXdBNYJcV/ckHyNdgVWFQRAMwPRtmF30uHgP3AqzKwL4GKaRT3q+gQXy
         RJ5ltrDcMviNmDRVw/TGMf6uT/79/F9P+Lv79rHuFKfHzKyCf1ZhdO3RlH1IUD9qsNCK
         8wNHYiE6VRc2Ja6TMu41gC62psbRAgo4pJ+em/JVJKLZYqcmPTeJPTMlrsWNaa3Ue+u2
         eDjAcK1ZT9TRNj/UjnEGj0ha7GrIhAwozou4gcfn4iFKAXB0MDffXyfDGG7V5Nrd3esw
         p0Cf8Gbciewvxh3htCVtSqybyQMJrPBgUs+MRq/huOkabWrZGwcafCRg+IngarBXNAaS
         lKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678264320;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DUD51QaZoHpiOtcxgT87APwX38JVxAqFH0OdC0C8sao=;
        b=V1oGuiTphcSuBqy3YotlCSre1geGYnsjMxlLTdMMe0QjcCUugpSwk90n+QrwXFFOJu
         zhwP5dy/W4nu3JGiI9KTwSB3+240Fdnpg/fLOI8xzEKA3vlVhYb2RATFa+VYbs0rnCd1
         PjgQv6qo7u4AZ1+PnReckygfMzBjUyNAfAjbZXyjvp5aGaYVAXP2B/clKfsFPREWskDb
         nFkdX+UXE27yS2qV4hYi6UrFqBlgYmnGh8ksDvPVfm+cmQgmSLy9nbge9uIHumy5VC4k
         hJzIyzj9zZAD2OUijdqVMSnbId1FNTxb0HO+knn7wT4qsF9Ux0cRTSzbYpK/x3MOf/pn
         KPmA==
X-Gm-Message-State: AO0yUKXYV4JrMK+BkoOpoRBKGXLsyKVRGBKiRFrJgXdTklk2JhW+mbyK
        DRKPyzkgrhZBq/4RjYjTOc/b
X-Google-Smtp-Source: AK7set864jlCY5nAmv3Xpg20jpRL3QWIinRR9bczzc2YQtEC03BMZkUPk8muRV6Beq7R8jKsUt/1TQ==
X-Received: by 2002:a17:90b:33c2:b0:234:b35b:f8ee with SMTP id lk2-20020a17090b33c200b00234b35bf8eemr18489626pjb.0.1678264320348;
        Wed, 08 Mar 2023 00:32:00 -0800 (PST)
Received: from thinkpad ([59.97.52.140])
        by smtp.gmail.com with ESMTPSA id g9-20020a655809000000b004fb5f4bf585sm8859450pgr.78.2023.03.08.00.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 00:31:59 -0800 (PST)
Date:   Wed, 8 Mar 2023 14:01:52 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     andersson@kernel.org, lpieralisi@kernel.org, kw@linux.com,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH 16/19] arm64: dts: qcom: sdm845: Add "mhi" region to the
 PCIe nodes
Message-ID: <20230308083152.GD134293@thinkpad>
References: <20230306153222.157667-1-manivannan.sadhasivam@linaro.org>
 <20230306153222.157667-17-manivannan.sadhasivam@linaro.org>
 <1587de60-244a-d97f-dea0-36fe8a5be2c2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1587de60-244a-d97f-dea0-36fe8a5be2c2@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 07, 2023 at 09:20:23AM +0100, Krzysztof Kozlowski wrote:
> On 06/03/2023 16:32, Manivannan Sadhasivam wrote:
> > The "mhi" region contains the debug registers that could be used to monitor
> > the PCIe link transitions.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index 479859bd8ab3..0104e77dd8d5 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -2280,10 +2280,11 @@ opp-4 {
> >  		pcie0: pci@1c00000 {
> >  			compatible = "qcom,pcie-sdm845";
> >  			reg = <0 0x01c00000 0 0x2000>,
> > +			      <0 0x01c07000 0 0x1000>,
> >  			      <0 0x60000000 0 0xf1d>,
> >  			      <0 0x60000f20 0 0xa8>,
> >  			      <0 0x60100000 0 0x100000>;
> > -			reg-names = "parf", "dbi", "elbi", "config";
> > +			reg-names = "parf", "mhi", "dbi", "elbi", "config";
> 
> Indexes are fixed, thus this breaks other users of DTS.
> 

Are you suggesting to move the "mhi" to the end and do not care about sorting?

Thanks,
Mani

> Best regards,
> Krzysztof
> 

-- 
மணிவண்ணன் சதாசிவம்
