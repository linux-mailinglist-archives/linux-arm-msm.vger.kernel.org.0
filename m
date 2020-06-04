Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E65F1EE458
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 14:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgFDMXI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 08:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgFDMXH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 08:23:07 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B24C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2020 05:23:07 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id d6so1126713pjs.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2020 05:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ml/b7XpbKedJnePc4NDty+yg3XSrTj9avgZ4/HGZobY=;
        b=tpPWgXumYdkZBL23t2pEn4peGPpQJA+Ba5cmfNySNoOUzp6qoLiGbPhrG07r3frJio
         h0FjXzji74sSaWB/ykKys33C4EUHjuiFZJztd/aXDlA7zi4tW7qpAKWE5v4qvCxqDjO7
         vAlJpl06ng5lq6owsElcfhUV7CTcKLHKrtFtT7hC05VTOuZSggbYfHnama6iuGj7pHYU
         VGyU5ErjYmVhdJYIRFQxC6a8peojHoUeIHE1JjNMrWgWRd/ZZ66FpWuw6QxueV4F0gNl
         Ejg83+V+oxhqVE+o6WbGHMGPHrUGq2wllWdRudauzQl3vExi38hSgHUW4bff11GO0Ha4
         U40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ml/b7XpbKedJnePc4NDty+yg3XSrTj9avgZ4/HGZobY=;
        b=liexhfoAfbPyRLKj0bYn9dmOJuvYwkCLoYyJw0IcUgN/YQc8U6wKsX0guwp/ITN8uG
         q3w+l11JJxPcauGzu+KQKZN9laTZ/A99FpzS0yKPClP9AUretVQWsdgdIFUupuF9sstX
         60QRfi6a2IQilM8mIBRMSSyv0TJd0VsIBzozgeMqiJOT5mpEPF1B4ACJcvhu+6GsGgTe
         7sb63R2e8pqISY8wCBO2qSIk65JgQx+9ju0Pa1Gxzr6HhyTAcEJwCJ61Ofg+DNZ71V0e
         S2MgLTEnRVMd8R3nftGbnENCUVlIigLRWdLliHg38IODdaN6gNWYqOro7ZBgPc/kkZY4
         DRcg==
X-Gm-Message-State: AOAM531mivkmB+yS3mSngAUMu1zaS+vf50w3wm0dpkzGRBY4E+F/KQgJ
        aIBAlijrfw3q/hzOCXH6IX/G
X-Google-Smtp-Source: ABdhPJyKuPxRf/nzrmTHyIaFY68aLoPdFMOUf07lj8gr4/OfPFX7xJELI5xk2of3Spc24oaT+u0sWw==
X-Received: by 2002:a17:902:7c81:: with SMTP id y1mr4784792pll.236.1591273386735;
        Thu, 04 Jun 2020 05:23:06 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e19:fffb:c404:4d38:8396:d1ee])
        by smtp.gmail.com with ESMTPSA id 67sm4640821pfg.84.2020.06.04.05.23.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 05:23:05 -0700 (PDT)
Date:   Thu, 4 Jun 2020 17:52:59 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org,
        devicetree-owner@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8250: add watchdog device
Message-ID: <20200604122259.GG16719@Mani-XPS-13-9360>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
 <20200604004331.669936-7-dmitry.baryshkov@linaro.org>
 <1a23cf8a6386e8b78c52199bdcde9b5e@codeaurora.org>
 <20200604113544.GF16719@Mani-XPS-13-9360>
 <f1cb759c2a70981ba8903dc1141349fe@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1cb759c2a70981ba8903dc1141349fe@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 04, 2020 at 05:21:46PM +0530, Sai Prakash Ranjan wrote:
> On 2020-06-04 17:05, Manivannan Sadhasivam wrote:
> > On Thu, Jun 04, 2020 at 04:37:01PM +0530, Sai Prakash Ranjan wrote:
> > > On 2020-06-04 06:13, Dmitry Baryshkov wrote:
> > > > Add on-SoC watchdog device node.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > index 972d8e04c8a2..f1641c6fe203 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > @@ -1662,6 +1662,12 @@ config {
> > > >  			};
> > > >  		};
> > > >
> > > > +		watchdog@17c10000 {
> > > > +			compatible = "qcom,apss-wdt-sm8250", "qcom,kpss-wdt";
> > > 
> > > Need to add this compatible to bindings.
> > > 
> > 
> > I did look into this but the binding says,
> > "compatible : shall contain only one of the following"
> > 
> > So clearly the fallback is not going to work and there is no need to add
> > a
> > dedicated compatible in the driver. The binding is not in the YAML
> > format to
> > be validated but still... Other option is to convert the binding to YAML
> > and
> > make the compatibles listed as 'enum' and 'const' elements
> > appropriately.
> > 
> 
> I already converted the bindings to YAML and added the missing compatibles
> for
> other SoCs[1] .

Ah, okay. I didn't find it in linux-next. Anyway, for adding
"qcom,apss-wdt-sm8250" compatible, we need to group the compatibles wisely
using 'enum' and 'const'.

> I thought it was already merged since Rob has already
> reviewed
> them, but seems like it was missed. Bjorn, can you please take it?
> 

Perhaps for v5.9...

Thanks,
Mani

> [1] https://lore.kernel.org/patchwork/cover/1192757/
> 
> Thanks,
> Sai
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
