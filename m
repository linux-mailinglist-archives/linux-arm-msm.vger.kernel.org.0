Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 581662D374A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Dec 2020 01:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730648AbgLHX7b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Dec 2020 18:59:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730624AbgLHX7a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Dec 2020 18:59:30 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3EE3C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Dec 2020 15:58:44 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id c79so240477pfc.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Dec 2020 15:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KT8gSct8ePxdVm18gafuRjQ8+F0yez/y5R5Y2DGE8SY=;
        b=Chntv37rr3wOmKWxaWKomFYCZfWkYZ6xJfP8f01PTdL+63G4xPlS7i0NqUb4YCnZxV
         fkep7cvuppQ1Dv/K3w8JW/4z4PFoe013B5EtVsXQzg2b97W3B4eadv+xlWqI2tosL9lD
         TKbms8rFL0op5Tyd3RjUB7wz0BQm5azlVeObJX5HKaalWrH81i3LB87jG21nUIJBWUrT
         jZNgqQLaZqmr6Ed3yP//Y7EP1+X+KQcW0AkDYpmfFb6o4B0KuUbKSHLR3ahVFzy5BO7e
         IFLMiGKjp128T2C0naBXL4QF7xp2sM38ZfA47tE9KlMy17eAg5vsX8+3k6F12J7yMA1b
         vGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KT8gSct8ePxdVm18gafuRjQ8+F0yez/y5R5Y2DGE8SY=;
        b=bBESWSff88UGHbG4IHVAA0Rg8JPm4s7VJkDcvgFcz0lQ/cto0t9qP2hwY8UAMBJGpp
         gGcWNFoivXaSiPi6BMKzGi9xl4BQ23RNYguwIzZZbt+ZrcyxlGsOqhXttD1dnjuAeqPx
         nYxSoIQIjdWRcg8chJS8r9NPuxY8aXgBW5zsI3P+mVJE2PgytO4/828JKcwGv9BO+mGb
         b5ej1rb0Zu5J+0co9wyZJsqtMY8W9tkJRung6p4QOYIf2ejPmsRozOvrWTUuHjKzBXvq
         K1tEIyM3Drtgc88ftUpexKdbCDSFucJMlKWHu7PZz6TUp8Mv/axQLno1LdOs/J7x+wgZ
         EDoQ==
X-Gm-Message-State: AOAM532onOr4xx7Y1S2D3EBro+nKN4zPnMuJImTzyWSy2IAc5eO4lEE2
        ncJ8aoFELardiWf1XCt7DWnpBg==
X-Google-Smtp-Source: ABdhPJxo+1nUq5oixmonF6/Q7diKEpev+Vxra7LKNG4gQZGsnDnjq3tG8L9Rq69wwods1N0CVWqFtQ==
X-Received: by 2002:a63:181b:: with SMTP id y27mr456385pgl.408.1607471924222;
        Tue, 08 Dec 2020 15:58:44 -0800 (PST)
Received: from google.com (154.137.233.35.bc.googleusercontent.com. [35.233.137.154])
        by smtp.gmail.com with ESMTPSA id h31sm100489pgh.42.2020.12.08.15.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 15:58:43 -0800 (PST)
Date:   Tue, 8 Dec 2020 23:58:39 +0000
From:   Satya Tangirala <satyat@google.com>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-fscrypt@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Neeraj Soni <neersoni@codeaurora.org>,
        Barani Muthukumaran <bmuthuku@codeaurora.org>,
        Peng Zhou <peng.zhou@mediatek.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [PATCH v2 9/9] mmc: sdhci-msm: add Inline Crypto Engine support
Message-ID: <X9ATL11T9ascySIX@google.com>
References: <20201203020516.225701-1-ebiggers@kernel.org>
 <20201203020516.225701-10-ebiggers@kernel.org>
 <X8t4bLOc3vRbDSo5@google.com>
 <X8vi2R0DYd74VCXr@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8vi2R0DYd74VCXr@sol.localdomain>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Dec 05, 2020 at 11:43:21AM -0800, Eric Biggers wrote:
> On Sat, Dec 05, 2020 at 12:09:16PM +0000, Satya Tangirala wrote:
> > > +static void sdhci_msm_ice_enable(struct sdhci_msm_host *msm_host)
> > > +{
> > > +	if (!(msm_host->mmc->caps2 & MMC_CAP2_CRYPTO))
> > > +		return;
> > > +	sdhci_msm_ice_low_power_mode_enable(msm_host);
> > > +	sdhci_msm_ice_optimization_enable(msm_host);
> > > +	sdhci_msm_ice_wait_bist_status(msm_host);
> > If sdhci_msm_ice_wait_bist_status() fails, should we really ignore the
> > error and continue en/decrypting with ICE? I'm not sure what the BIST
> > failing might really mean, but if it means it's possible that the ICE
> > en/decrypts incorrectly it would be bad to continue to use it.....
> 
> The "built-in self-test" that the ICE hardware does seems to be a FIPS
> compliance thing which never actually fails in practice.
> 
> If it does fail, then according to
> https://csrc.nist.gov/CSRC/media/projects/cryptographic-module-validation-program/documents/security-policies/140sp2588.pdf
> (which is the closest thing I have to any documentation for ICE, other than the
> eMMC standard), then the hardware itself will reject any crypto requests.  So
> rejecting them in software too should be redundant.
> 
> It's also worth noting that just because a hardware-level self-test passes
> doesn't mean that the actual end-to-end storage encryption is working correctly.
> To verify that you need to run something like Android's
> vts_kernel_encryption_test, or the ciphertext verification tests in xfstests.
> The hardware itself is really the wrong place to be testing the encryption.
> 
> It would be possible to add some code that sets a flag in the cqhci_host if the
> ICE hardware test fails, and make cqhci_request() fail any crypto-enabled
> requests if that flag is set.  It just doesn't seem necessary, and I think we
> should error on the side of less complexity for now.
> 
> What I was actually worried about is what happens if ICE needs to be used but
> its self-test is still running, so it doesn't want to accept requests yet.  I'm
> not sure that's really a thing or not (one might hope the MMC host doesn't say
> it's done resetting until the ICE tests are done), but that's why I left in the
> code that waits for the tests to complete, which the downstream driver had.
> 
> Neeraj and Barani, if you have any additional insight or suggestions on this, or
> know of anything I may be overlooking, that would be greatly appreciated.
> 
> Otherwise I just plan to add a comment that summarizes what I said above.
> 
Sure, sounds good to me :).
> > > @@ -2531,12 +2785,15 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
> > >  	 * Whenever core-clock is gated dynamically, it's needed to
> > >  	 * restore the SDR DLL settings when the clock is ungated.
> > >  	 */
> > > -	if (msm_host->restore_dll_config && msm_host->clk_rate)
> > > +	if (msm_host->restore_dll_config && msm_host->clk_rate) {
> > >  		ret = sdhci_msm_restore_sdr_dll_config(host);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > >  
> > >  	dev_pm_opp_set_rate(dev, msm_host->clk_rate);
> > >  
> > > -	return ret;
> > > +	return sdhci_msm_ice_resume(msm_host);
> > >  }
> > Doesn't this modify existing behaviour if
> > sdhci_msm_restore_sdr_dll_config() returns a non-zero value? Previously,
> > dev_pm_opp_set_rate() would always be called regardless of ret, but now
> > it's not called on non-zero ret value.
> 
> Yes but I don't think it matters.  IIUC, if a device's ->runtime_resume()
> callback fails, then Linux's runtime power management framework keeps the device
> in an error state and doesn't consider it to be resumed.
> 
> So if resuming a device involves N different things, and one of them fails, I
> don't think we need to worry about trying to still do the other N-1 things; we
> can just return an error on the first failure.
>
Ah, alright. Once you do add the comment you mentioned above, please
feel free to add
Reviewed-by: Satya Tangirala <satyat@google.com>
> - Eric
