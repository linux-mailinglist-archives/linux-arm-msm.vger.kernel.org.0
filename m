Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59ED5A8215
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 14:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729798AbfIDMJA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 08:09:00 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35697 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726943AbfIDMJA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 08:09:00 -0400
Received: by mail-wr1-f65.google.com with SMTP id g7so21026308wrx.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 05:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=cXNd5NFyo+yXcDkUhbL4DCnkYm1i1knViowjla1FTwE=;
        b=J7ZfwMvx+pjJ1KtIMg2FP2iKHNJugtUCVhDT0Q9A9FjR6NMHgbC3mf/LmljjuOidey
         UGqdxc1zMZTpTvw6hwHC1aHs7rOmo6aaccw1sRY2uRZlabi29r5B6lNG+s3zzZaSMH1C
         Z4tIH6+/totYd97oYlUmHDWy1h6khLfBmvhCz9+UhOpEsL4SaAa/cdlQqBtVm5+jEaqA
         pmtDQIzmxpohUiucVvUBP3ioD3mO7zvmxsdxwuhe2oZBFcdQjCUZoBHbidQ1ORP4VLq4
         wOtK4aZ8XgNv6wyaIbNj/9icjZy0TFMaGC6OnEW61BxKyj7/2fRktWn8svHDF0t6B7Db
         tOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=cXNd5NFyo+yXcDkUhbL4DCnkYm1i1knViowjla1FTwE=;
        b=Kj0CuGNeweXZTH1yncduAIVJnym9dW07KrycMnA88gqV84BpEiPyRCjWeUswsKHbr7
         ytd+fnFRePzbqaLN8o4Ho5Ww45KQmGQduQV7nLLDMIlc+nMuzW5e/fzrHfySd4UQcba+
         SnFRxICLcrvwWCXGz3VzekH3DliD7WIN5H6mfZz3BPLq/rhZWLBTmLWHnWNcCDm34uM/
         jhyQUrpQw+DyVB1do6QRis47C8vsmvVUMDl3phDEMi6YfKg6iguACqDb6yqbE8MdkK1v
         JtEISUrtdnesnhDFb3mupQaqZDL68TASHD/jq6D5ygPeC44/SHftfyIaj9DBpf47OLG/
         G7Xw==
X-Gm-Message-State: APjAAAVj+vmjX0VMPUgnjG7sqpmjv1dmtFd6TQKvx4GTYKM61PoOhx46
        rr3p1OiVR3k35l1M5GJmf+9spg==
X-Google-Smtp-Source: APXvYqzoDt1j5nXwZfg6kdlNZiEWEaIC+6f7Yyq3ssLHAa5vCsy93S4qA0vTD5oeY0IsGHeo93JgRQ==
X-Received: by 2002:a5d:4d81:: with SMTP id b1mr50990154wru.27.1567598937914;
        Wed, 04 Sep 2019 05:08:57 -0700 (PDT)
Received: from dell ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id j22sm3005688wre.45.2019.09.04.05.08.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 05:08:57 -0700 (PDT)
Date:   Wed, 4 Sep 2019 13:08:55 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: Add Lenovo Yoga C630
Message-ID: <20190904120855.GJ26880@dell>
References: <20190904113917.15223-1-lee.jones@linaro.org>
 <20190904115234.GV2672@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190904115234.GV2672@vkoul-mobl>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 04 Sep 2019, Vinod Koul wrote:

> On 04-09-19, 12:39, Lee Jones wrote:
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -12,5 +12,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
> 
> Can we keep this sorted, so before mtp.

Look closer. :)

> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > new file mode 100644
> > index 000000000000..ad160c718b33
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > @@ -0,0 +1,454 @@
> > +// SPDX-License-Identifier: GPL-2.0
> 
> Are we going to make this dual? or BSD..

This patches the DTS files already in this directory.

> > +&apps_rsc {
> > +	pm8998-rpmh-regulators {
> > +		compatible = "qcom,pm8998-rpmh-regulators";
> > +		qcom,pmic-id = "a";
> > +
> > +		vdd-l2-l8-l17-supply = <&vreg_s3a_1p35>;
> > +		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p04>;
> > +
> > +		vreg_s2a_1p125: smps2 {
> > +		};
> > +
> > +		vreg_s3a_1p35: smps3 {
> > +			regulator-min-microvolt = <1352000>;
> > +			regulator-max-microvolt = <1352000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_s4a_1p8: smps4 {
> > +			regulator-min-microvolt = <1800000>;
> > +			regulator-max-microvolt = <1800000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_s5a_2p04: smps5 {
> > +			regulator-min-microvolt = <2040000>;
> > +			regulator-max-microvolt = <2040000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_s7a_1p025: smps7 {
> 
> Any reason why we dont specify the mode and min/max voltage for this
> and few others below..?

Might have to ask Bjorn that one.

> > +&i2c1 {
> > +	status = "okay";
> > +	clock-frequency = <400000>;
> > +	qcom,geni-se-fifo;
> > +
> > +	battery@70 {
> > +		compatible = "some,battery";
> 
> some,battery ..?

Good spot.  This the battery level/AC detection driver that isn't
upstream yet.  Will remove.

> > +&qup_i2c12_default {
> 
> Please move the qup nodes up so that nodes are sorted alphabetically

Sure.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
