Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A97362ED5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 06:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241009AbiKRF5g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 00:57:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiKRF5f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 00:57:35 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE598CB94
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 21:57:34 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id 4so3725187pli.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 21:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0a1jjRfviTq5Xt2/NZLcpPRBi+hPaTFIWtK7i+Uba+o=;
        b=lR4PSzbHtutX868gOZ71DV6BQ3XgJC0Tep7WH5FyBG4eniWNoVFrPI94BAD7cDkCuc
         soYmtc4O+B7WyrBOg0gSmEfrmrosmxx0OAyDaaQkjjV2/OTjLDjzg3cLMV39Bbgihhmn
         cJZXz1/5zY5/+BPehzeTHwI8XEc2SPHVsoXfdmAHEoWzAT7ptygWnCzBdRI/3KrIYA9Z
         92QjwE1rdSIvMVJfzVBZGftN9cr1eBl+1yPakH9TEFAVfJspeVbHGz2b+KHU9D5bH/7D
         Olu9tgYBxVXjE695WqsJqh6C5Py2eHRlo82AVxlIdQI7vSVMFx4+y5GMOzN/bow5MQ9E
         Vhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0a1jjRfviTq5Xt2/NZLcpPRBi+hPaTFIWtK7i+Uba+o=;
        b=qPj6izCGlGBGLFzIQgtSfuEx5QE5fkdhfFr+NzwMllRKzyclm73GQCqbN4odYZ3/n9
         /Ec+YSxZu9k0K3C2HlThyymt0wPWnH7xr2+Qkpqa0LyBzC4z1BWTvIrMS0CCEuYKLam6
         6PIfiKmecrAzSYzv6WKguS/KS/dBhOLdtAWBhE+hJbK+7md+FOVs1rfn5wuvlNsU5EUL
         lKT3mFgotN75vNI9gnbyLa48Nd5wWqinCDmx2XNQrE6l5WAz18GTPt364nTPlXLYEsWk
         CxxnqX0Xk35dR17a90cqMUwC5Kh0LnKj1yb+xCgDs/KGyR16aIk3hTOe9ymXin5z5djq
         AUNg==
X-Gm-Message-State: ANoB5plGGuDbyA2u8AAYtO8i7atHU6poTxseXDHRaHknO0cDy/XCIzEF
        lF+ut0azWNjLi2FSVji5hjrDVA==
X-Google-Smtp-Source: AA0mqf7ZHCPYnYkcNX51xnBzNH8aRazEuukSXxWjRjt+qHEp7z32tE3pgG3H7A3HLPNIXczCaCL7Cg==
X-Received: by 2002:a17:902:da87:b0:184:fa22:8b67 with SMTP id j7-20020a170902da8700b00184fa228b67mr6009281plx.149.1668751053815;
        Thu, 17 Nov 2022 21:57:33 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902bd8900b00176d347e9a7sm2486743pls.233.2022.11.17.21.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 21:57:32 -0800 (PST)
Date:   Fri, 18 Nov 2022 11:27:30 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        rafael@kernel.org, robh+dt@kernel.org, johan@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v7 0/4] qcom-cpufreq-hw: Add CPU clock provider support
Message-ID: <20221118055730.yrzpuih3zfko5c2q@vireshk-i7>
References: <20221117053145.10409-1-manivannan.sadhasivam@linaro.org>
 <20221117101903.sw3hxaruj5sfhybw@bogus>
 <20221117112403.haffuclwooudvgwz@vireshk-i7>
 <20221117120145.ou2pg7obxnwlsc36@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117120145.ou2pg7obxnwlsc36@bogus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-11-22, 12:01, Sudeep Holla wrote:
> Thanks for the link. Sorry I still don't get the complete picture. Who are
> the consumers of these clock nodes if not cpufreq itself.
> 
> I am going to guess, so other device(like inter-connect) with phandle into
> CPU device perhaps ? Also I assume it will have phandle to non-CPU device
> and hence we need generic device clock solution. Sorry for the noise, but
> I still find having both clocks and qcom,freq-domain property is quite
> confusing but I am fine as I understand it bit better now.

Lemme try to explain what the initial problem was, because of which I suggested
the DT to be fixed, even if no one is going to use it as a client.

The OPP core provides two features:

- Parsing of the OPP table and provide the data to the client.
- Ability to switch the OPPs, i.e. configuring all resources.

qcom-cpufreq-hw driver uses both of these, but in a tricky way (like Tegra30).
It used the OPP core to parse the data, along with "opp-hz" property and switch
the OPPs by calling dev_pm_opp_set_opp(). But it doesn't want
dev_pm_opp_set_opp() to change the clock rate, but configure everything else.

Now the OPP core needs to distinguish platforms for valid and invalid
configurations, to make sure something isn't broken. For example a developer
wants to change the OPP along with frequency and passes a valid OPP table. But
forgets to set the clock entry in device's node. This is an error and the OPP
core needs to report it. There can be more of such issues with different
configurations.

Also, as Mani explained, if the OPP core is required to switch the OPPs, then it
needs to know the initial frequency of the device to see if we are going up or
down the frequency graph. And so it will do a clk_get_rate() if there is
"opp-hz" available.


What we did in case of Tegra30 (commit 1b195626) is provide a .config_clks
helper, which does nothing. So the OPP core doesn't need to know if frequency is
programmed or not.

The same can not be done for Qcom right now as the CPU node doesn't have the clk
property though it has "opp-hz".

Weather we have a user in kernel (OS) or not, shouldn't decide how the DT looks
like. The DT should clearly define what the hardware looks like, irrespective of
the users. The CPU has a clock and it should be mentioned. If the OPP core
chooses to use that information, then it is a fine expectation to have.

And so we are here. Most likely no one will ever do clk_set_rate() on this new
clock, which is fine, though OPP core will likely do clk_get_rate() here.

Hope I was able to clarify few things here.

-- 
viresh
