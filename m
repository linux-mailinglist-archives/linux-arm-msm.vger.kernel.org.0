Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0895B3E89CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 07:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234386AbhHKFed (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 01:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234330AbhHKFed (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 01:34:33 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1C2CC061798
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 22:34:09 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d1so1232653pll.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 22:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ScSbxJofNLIiJut+toTZ7USozFNrpn/9FRU/yhxl+AE=;
        b=eb6WOqa/iiW+lVxPN/WwlN1ktVPrT2bUzlrRfDrYo41IvDzG4/ln5yWs6uXhICalPc
         8R0u5AzW7yMU6cYgS+wfVr1wFhPcTBbZD2Xyd4b7nHZ3hafixxLtxxbPGwpJLDHfRGdI
         zsU9bV0uTcH4s9YjyKyk3RwVbO/HStRc+oKgUx5B2+8G9pO8KCbN0SSodCkkTKH5OwCj
         NkEi8tGAip3xqqCWY5Cd5cCb4jacmdKEE4+LxGNZA+sGwQu085Zzb25vTOg1ndLK0z5V
         r4ejQRIY4GkBb+GZRhHuNkrSOOBP5ZQyuytbggBbhP7/xyVm24hsXA8Zo39boZpUz10E
         Ygng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ScSbxJofNLIiJut+toTZ7USozFNrpn/9FRU/yhxl+AE=;
        b=kUL4FpzEmER42hNtHv8jLM7wuE6ETbbCRcl4LVffPf6hai7kAAkfJstDrHJ/q7Sbr0
         TRlSdfcRLmxwgmw9YjkSsGT5PH3T7AhrN7SiqlClOIXH2xc6PxXfsxIbK4C62WgR3s7O
         xNX4uH7dM5oQiPBPCFsId4giAXTrfHF/jwtEanhY77nI9ofKNpnRiDQV+cccfBXRkiJE
         ktVtG37ghhO4KNmbLrcHSjQvRDBaCA+v48HiYEPpUJELGq1MFWzVjFvTh2zSdLW5Tdmt
         iuQcWCv0B+thgpw8XVap/5BbKTinK2EOmZ6RhPK8ngB65C1D9lihoHa3XRcIX0wh3XKF
         hiDg==
X-Gm-Message-State: AOAM532HpmKTKu8l7r9c1VUSEVddezW0bUPGmVZaVulbg0o0FwBCCqmY
        PSHoCSd89J/7kZxvxNwgZpT/Ow==
X-Google-Smtp-Source: ABdhPJyJHzEP2u8Lqj/aaTrSt5nOj9C159L82xQKicF/GaJrGfuVo5tn/qTlGn31FvoW9cEaqP30pg==
X-Received: by 2002:a17:902:8507:b029:12b:533e:5e9d with SMTP id bj7-20020a1709028507b029012b533e5e9dmr28394940plb.53.1628660049321;
        Tue, 10 Aug 2021 22:34:09 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id q4sm6443106pga.48.2021.08.10.22.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 22:34:08 -0700 (PDT)
Date:   Wed, 11 Aug 2021 11:04:06 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Quentin Perret <qperret@google.com>
Cc:     Rafael Wysocki <rjw@rjwysocki.net>,
        Vincent Donnefort <vincent.donnefort@arm.com>,
        lukasz.luba@arm.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Fabio Estevam <festevam@gmail.com>,
        Kevin Hilman <khilman@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/8] cpufreq: Auto-register with energy model
Message-ID: <20210811053406.jqwextgtnxhgsjd2@vireshk-i7>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
 <YRJym+Vn4bbwQzzs@google.com>
 <20210811051859.ihjzhvrnuct2knvy@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811051859.ihjzhvrnuct2knvy@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11-08-21, 10:48, Viresh Kumar wrote:
> On 10-08-21, 13:35, Quentin Perret wrote:
> > This series adds more code than it removes,
> 
> Sadly yes :(
> 
> > and the unregistration is
> > not a fix as we don't ever remove the EM tables by design, so not sure
> > either of these points are valid arguments.
> 
> I think that design needs to be looked over again, it looks broken to
> me everytime I land onto this code. I wonder why we don't unregister
> stuff.

Coming back to this series. We have two options, based on what I
proposed here:

https://lore.kernel.org/linux-pm/20210811050327.3yxrk4kqxjjwaztx@vireshk-i7/

1. Let cpufreq core register with EM on behalf of cpufreq drivers.

2. Update drivers to use ->ready() callback to do this stuff.

I am fine with both :)

-- 
viresh
