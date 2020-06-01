Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 554131EA25C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2020 13:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgFALBi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jun 2020 07:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgFALBV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jun 2020 07:01:21 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C5BC08C5C0
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2020 04:01:19 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id s88so4374642pjb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2020 04:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vSd1F9IWmylmdRhuAnkzZkcm/vhp0PvuDBF/lEkmWYM=;
        b=t/Z7/edJ+cZ8JjeZehSfuBXZPJJtj7/nryWGlIAR6tVr3jRy92L52wK2yPqqcJ6hUZ
         Zw2fDUxXjK4GLKozfv5U2FexgQOI+tiIvUmSfh1QP1fnlNvOPAvorTf8bJW2IhNr031a
         9mzjkAzrQzmmZI9NTUnAAol0UsJ66onm5nIy/+U9tIly5mu4YgSKOoZ38lPxfHTMsJBp
         qGTj1qfgCNvY4LEI5xJQ85EIUn522vjEXAjRPHdrhTwnpV5ZUzNoQ1f8+27fU31yAvte
         fWfrQ7Ne16RjH7nH35WeQs/F3bLDRAj8OeO2Xl3cRiGS9zL1FCTppOHUjx96V4Hywxmc
         cXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vSd1F9IWmylmdRhuAnkzZkcm/vhp0PvuDBF/lEkmWYM=;
        b=DleYDf6jUCoDjcfIe3j3QQy83ubuawlIVDhQucQ9bZ7ErW7jJrJ9z8ILCdc7Sq5MCH
         zcd9uVRelZ8MtU0k9HWpLuuE02WGZlicSMQ37LO3cSd2RmFZUWcW8l56ob9YXLdvzINV
         Rhn3kW6XJxZU4szseon0f7UoIMqKUA/BSn5vYSZDh+YEv72DEQeDmV0EujxaU3AABihR
         1w7v3tozqxD/7kzM+6ew06WpY155wSK2YR03F5xFJyB9Kl9WXqI5e6VPLkE9L0Qqk5DO
         TI3mERokcOrAh4SoaaeCNep7TDaGbwq475dPTExduSFfF7gdx+se5vDeD6X2ApwEWyrR
         ztMg==
X-Gm-Message-State: AOAM5309xzi+vhG/wGCd3fk6XD/TTbtuNVTdhX+lqJOOtEHfxmy6wzkT
        AHd+QhH8zMD3wZ0LZjAnxaNIVg==
X-Google-Smtp-Source: ABdhPJwAVadiEigs3N3Sh4nG5ncaSZnIPjxqEIMNOmDBbJC05+jH/KHIkzRncLVURZ5nRvvxZzCKTw==
X-Received: by 2002:a17:90a:f508:: with SMTP id cs8mr5446247pjb.16.1591009278922;
        Mon, 01 Jun 2020 04:01:18 -0700 (PDT)
Received: from localhost ([122.172.62.209])
        by smtp.gmail.com with ESMTPSA id q5sm14121925pfl.199.2020.06.01.04.01.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jun 2020 04:01:17 -0700 (PDT)
Date:   Mon, 1 Jun 2020 16:31:16 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     sboyd@kernel.org, georgi.djakov@linaro.org, saravanak@google.com,
        mka@chromium.org, nm@ti.com, bjorn.andersson@linaro.org,
        agross@kernel.org, rjw@rjwysocki.net,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dianders@chromium.org,
        vincent.guittot@linaro.org, amit.kucheria@linaro.org,
        lukasz.luba@arm.com, sudeep.holla@arm.com, smasetty@codeaurora.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v5 4/5] cpufreq: qcom: Update the bandwidth levels on
 frequency change
Message-ID: <20200601110116.jteoalg3yjhsbkpw@vireshk-i7>
References: <20200527202153.11659-1-sibis@codeaurora.org>
 <20200527202153.11659-5-sibis@codeaurora.org>
 <20200529100028.2wz2iqi5vqji2heb@vireshk-i7>
 <a90bce2d52f7cdb726e8b799e3512fad@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a90bce2d52f7cdb726e8b799e3512fad@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29-05-20, 17:00, Sibi Sankar wrote:
> > > +static int qcom_cpufreq_update_opp(struct device *cpu_dev,
> > > +				   unsigned long freq_khz,
> > > +				   unsigned long volt)
> > > +{
> > > +	unsigned long freq_hz = freq_khz * 1000;
> > > +
> > > +	if (dev_pm_opp_adjust_voltage(cpu_dev, freq_hz, volt, volt, volt))
> > > +		return dev_pm_opp_add(cpu_dev, freq_hz, volt);
> > 
> > What's going on here ? Why add OPP here ?
> 
> We update the voltage if opp were
> initially added as part of
> dev_pm_opp_of_add_table. However
> if the cpu node does not have an
> opp table associated with it, we
> do a opp_add_v1 instead.

Instead of depending on the failure of dev_pm_opp_adjust_voltage(),
pass a flag to qcom_cpufreq_update_opp() which will decide if we want
to adjust voltage or add an opp.

-- 
viresh
