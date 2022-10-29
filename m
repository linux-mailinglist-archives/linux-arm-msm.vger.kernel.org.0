Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB486612038
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 06:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbiJ2Esl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 00:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiJ2Esi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 00:48:38 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E941AFA81
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 21:48:38 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id b11so6270794pjp.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 21:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jHk7Z+kpsqVK0L7KiPX2YqEbZ2zLP86IBlmOFcri1As=;
        b=Jlb7A8ZeXqRK21kMLCPT2dJvU+v7TWjg1LUM/sP6CyMnvHxmt0WzFwLkE7DlsedGG2
         SldfT9WcAvpBDRyAwJMYQQpiPV+AeyT9wh5hK2jiUqiDBQ+KwUsKdNKlUQ1NfcLf9u9R
         Bg1OWFpFi90Q5mQNDjBMsW3Z8tIOIsZVNB/nlGk41G2QgRilKUq6AfcQB6G2FEPr+8hP
         O8gDB1cut2CG8qDP/Y1pMNyyFkOYGz/7aI2/zUVbAJya0FeF0vNY3CVRkxycXnQxS9Ow
         qasIHKsf0MqgMlVXouN5RzTZXn8h/8f2rihAElrr+4EYlgyFK2wkQMzL+F8YpEbO7Dl7
         YCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jHk7Z+kpsqVK0L7KiPX2YqEbZ2zLP86IBlmOFcri1As=;
        b=vv53tAdewOwXun+45HajWR8ZkrrbwOEcy5ea3GaYoiwRsejjcYdWBkiXE3TkjXF0LI
         ikhsumy5cbq5l1CFnH2eZBNkbJdV3tha6dsCfLmZnZtwKzjipAVvETKEgl3kFJPxWQDA
         wjoPcZ7rPaqLPwHxGelq2fx4Vm3y0KLMzohqGDuqXH2piNRJ0OQf8HwqQbl1xh3RntKI
         J1gS+eouJyCumnRR2NBxj/6rIo+DuLSXtfFx7OqWvtWZW4fOo378qn7RhySa+8cS2GsL
         TZ7sHeEbXmCIqu6eoFWWC/sRPrIgQ8SehKelwmJS7DLj9wUeqt/i1k6YnIjzkzrQo6BE
         rurQ==
X-Gm-Message-State: ACrzQf05++uBx2jGp6k5dxeEGqiPNnhKe1hvTDPNlLO4ev1g2BJIuZ18
        6dOF+xoZaGFojRoZHflRqaaS
X-Google-Smtp-Source: AMsMyM7thR0lfj2zUm6huC4zClJsV/QZ1B5btAbwfb4YpDaUKdFlqRlOWnccYWyjJCiyfLKBGCpedw==
X-Received: by 2002:a17:90a:1b65:b0:1f7:4725:aa6e with SMTP id q92-20020a17090a1b6500b001f74725aa6emr2831448pjq.179.1667018917549;
        Fri, 28 Oct 2022 21:48:37 -0700 (PDT)
Received: from thinkpad ([59.92.103.167])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902ecc300b00186e34524e3sm310110plh.136.2022.10.28.21.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 21:48:36 -0700 (PDT)
Date:   Sat, 29 Oct 2022 10:18:31 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        johan+linaro@kernel.org, quic_jprakash@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/11] arm64: dts: qcom: sc8280xp-x13s: Add PM8280_{1/2}
 VADC channels
Message-ID: <20221029044831.GC5362@thinkpad>
References: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
 <20221027063006.9056-10-manivannan.sadhasivam@linaro.org>
 <5e66c095-898e-067e-1874-a3d2e5babf17@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e66c095-898e-067e-1874-a3d2e5babf17@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 27, 2022 at 10:09:21AM -0400, Krzysztof Kozlowski wrote:
> On 27/10/2022 02:30, Manivannan Sadhasivam wrote:
> > Add VADC channels of PM8280_{1/2} PMICs for measuring the on-chip die
> > temperature and external thermistors connected to the AMUX pins.
> > 
> > The measurements are collected by the primary PMIC PMK8280 from the
> > slave PMICs PM8280_{1/2} and exposed them over the PMK8280's VADC
> 
> secondary PMICs
> 
> Drop "them"
> 
> 
> > channels.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 61 +++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > index 9ac5d5c22832..d300d217fdc6 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > @@ -7,6 +7,7 @@
> >  /dts-v1/;
> >  
> >  #include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
> >  #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
> >  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >  
> > @@ -189,6 +190,66 @@ pmk8280-xo-therm@44 {
> >  		qcom,ratiometric;
> >  		qcom,hw-settle-time = <200>;
> >  	};
> > +
> > +	pm8280-1-die-temp@103 {
> 
> pmic-die-temp? What pm8280 stands here?
> 

As agreed, will use "pmic-die-temp"

> 
> > +		reg = <PM8350_ADC7_DIE_TEMP(1)>;
> > +		label = "pm8280_1_die_temp";
> > +		qcom,pre-scaling = <1 1>;
> > +	};
> > +
> > +	sys-therm1@144 {
> 
> I would say sys-therm@... why do we need the "1" suffix in node name?
> 

Suffix represents the index of the thermistor as per the schematics but I guess
it can be dropped.

Thanks,
Mani

> > +		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
> > +		qcom,ratiometric;
> > +		qcom,hw-settle-time = <200>;
> > +	};
> 
> Best regards,
> Krzysztof
> 

-- 
மணிவண்ணன் சதாசிவம்
