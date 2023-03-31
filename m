Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3A76D16A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 07:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjCaFOG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 01:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjCaFOF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 01:14:05 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7054DEB63
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 22:14:02 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so13101271wmq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 22:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680239641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pULYDGzh4E8UCXDt/pmSRIwAO6ObDjtZf1sR4LLd8yA=;
        b=kQkec1O6Ot/vcD84SVGs08IGHNMfIgt8VNpntgMvo9olmArl578NgRYSGwest+DLfL
         ikqw1LsfzghXhMbJPu2RKiA0keZsUJYqAILUx84/3pc8eRM6pVuD+RVxUWyLce0LlNoC
         zzKZ0ri2OG8wSFxFW8/vwxuEiE7KtTaXLWQP2DymFV2yvKqYlw6JaTk9XalpcnrzzXVw
         vpYXKs80XH5PnY9VI79q849BmFoY20Aemh/dKcy9q+uHCeWZrSk9+e3I8VA2SW+Lm4sY
         6Kz0JK+MfYeNy51EO3nUzHkIaR6GK8tFEHaX5OsXw9m094E5SBTHZBabVmd4Q0ewSnc5
         9qIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680239641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pULYDGzh4E8UCXDt/pmSRIwAO6ObDjtZf1sR4LLd8yA=;
        b=61DxfPl1fQeMwHn6lMIXHk1frV2D5fVtiJuLKIdGtwU+jxyoTixu/e1u/HJATojv0G
         cC8iAsPxQ32HW+WUFAS7yfzH2CobaPh3hjGxMVP6svhNr4kf06P/ufhbeE9ugoEUjOm2
         dk1Wu1nv6pt7r6S6gj3akRPwhyPpMZgG1jC9k+Jnbvd4G1txI5082qxCXwlcacMZ0qTX
         KOPqLRVjIuS70qP3R/eagkXpRmMiH+7Uf9rLCdzYPE9KTRNeEGy71Xb7Ik8FwGZx+bu0
         l8MtCCBKBh+AjU0j6OoAZpLtbjtQIVIgrmgvepueb2qH0mRGwWbR+wVP+TPWRrUvfYx/
         J9Pg==
X-Gm-Message-State: AO0yUKVIelWcdmMkv5qizSYGpuasWOW82njRAWCUSun5roU/utp/loZ0
        IV/vwXU/gHC8/N5feKaNOV4TOw==
X-Google-Smtp-Source: AK7set8+GpaUDXRWjB5QY6Zo9WS9R7HYI+Pvg65VlG7RDva4bJ4tmC4UyBNwr+8bDuf+0i2hFKbHjw==
X-Received: by 2002:a7b:c44f:0:b0:3ed:d3a7:7077 with SMTP id l15-20020a7bc44f000000b003edd3a77077mr18364656wmi.40.1680239640856;
        Thu, 30 Mar 2023 22:14:00 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id x21-20020a05600c21d500b003ef64affec7sm1349808wmj.22.2023.03.30.22.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 22:14:00 -0700 (PDT)
Date:   Fri, 31 Mar 2023 08:13:58 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH v4 5/7] scsi: ufs: ufs-qcom: Switch to the new ICE API
Message-ID: <ZCZsFjKItcIS+U/b@linaro.org>
References: <20230327134734.3256974-1-abel.vesa@linaro.org>
 <20230327134734.3256974-6-abel.vesa@linaro.org>
 <20230327181934.GD1882@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327181934.GD1882@sol.localdomain>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-03-27 11:19:34, Eric Biggers wrote:
> Hi Abel,
> 
> On Mon, Mar 27, 2023 at 04:47:32PM +0300, Abel Vesa wrote:
> > Now that there is a new dedicated ICE driver, drop the ufs-qcom-ice and
> > use the new ICE api provided by the Qualcomm soc driver ice. The platforms
> > that already have ICE support will use the API as library since there will
> > not be a devicetree node, but instead they have reg range. In this case,
> > the of_qcom_ice_get will return an ICE instance created for the consumer's
> > device. But if there are platforms that do not have ice reg in the
> > consumer devicetree node and instead provide a dedicated ICE devicetree
> > node, the of_qcom_ice_get will look up the device based on qcom,ice
> > property and will get the ICE instance registered by the probe function
> > of the ice driver.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> I am still worried about the ICE clock.  Are you sure it is being managed
> correctly?  With your patch, the ICE clock gets enabled in ufs_qcom_ice_resume
> and disabled in ufs_qcom_ice_suspend, which hopefully pair up.  But it also gets
> enabled in ufs_qcom_ice_enable which isn't paired with anything.  Also, this all
> happens at a different time from the existing UFS clocks being enabled/disabled.

Right, I messed this up since the last version. Sorry about that.

What I need to do is to drop the enabling of the clock from
qcom_ice_enable and only do it from qcom_ice_resume. As for disabling
it, it remains as is, that is, in qcom_ice_disable.

Then, I need to enable the clock right before checking the supported
version. I'll do that with devm_clk_get_enabled (also optional for the
legacy once as I explained in the reply to the 6th patch).

> 
> I wonder if the ICE clock should be enabled/disabled in ufs_qcom_setup_clocks()
> instead of what you are doing currently?
> 
> > +static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
> > +{
> > +	struct ufs_hba *hba = host->hba;
> > +	struct device *dev = hba->dev;
> > +
> > +	host->ice = of_qcom_ice_get(dev);
> > +	if (host->ice == ERR_PTR(-EOPNOTSUPP)) {
> > +		dev_warn(dev, "Disabling inline encryption support\n");
> > +		hba->caps &= ~UFSHCD_CAP_CRYPTO;
> > +		host->ice = NULL;
> > +	}
> > +
> > +	if (IS_ERR(host->ice))
> > +		return PTR_ERR(host->ice);
> > +
> > +	return 0;
> > +}
> 
> This is still sometimes leaving UFSHCD_CAP_CRYPTO set in cases where ICE is
> unsupported.
> 
> Moving the *setting* of UFSHCD_CAP_CRYPTO into here would fix that.
> 

I'll do exactly that. Thanks.

> It is also hard to understand how the -EOPNOTSUPP case differs from the NULL
> case.  Can you add a comment?  Or just consider keeping the original behavior,
> which did not distinguish between these cases (as long as MASK_CRYPTO_SUPPORT
> was set in REG_CONTROLLER_CAPABILITIES, which was checked first).

I believe it makes more sense to return -EOPNOTSUPP when the driver
doesn't support a specific version of the HW. If you do not agree, I'll
make it return NULL then.

> 
> - Eric
