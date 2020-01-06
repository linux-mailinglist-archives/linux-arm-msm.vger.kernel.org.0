Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 228041316D7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 18:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgAFRb6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 12:31:58 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34764 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgAFRb6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 12:31:58 -0500
Received: by mail-lj1-f193.google.com with SMTP id z22so46935412ljg.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 09:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xFu7eCg3yS+RsR9D/Z3sZGznS8kv1kY8aO9qxzERxms=;
        b=Em55WpmAzW3ZOnLXJfcLJha9SqS5Qw3j3/OKYBG0xj5al9+1IAuNNmcweHm4UeqB4g
         5DdRMU7eajNI33LhOrK08iJbl3aNfx8ukg77VVjxk5Z8dDS2FzqUnynl5p+bsRXi8L4D
         YHgoqi2NhzxYuP9DumZYPhMr6OOJoue43ZaT7kMyHXq5u60RGafl7MkvGizstBg7tuFo
         awx/t6d2FAYUIHmY8OFcAusvXq9tnxHxYc5vsasdpcW1XBAIrFqXi3G/FctOP14SmcOz
         4dtnis7T7rCG8YC0pCwLSoSSXEStyBiIL5kJmtsBgLDJ+ETxsWYYrPzm77b5NXbzqril
         B7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xFu7eCg3yS+RsR9D/Z3sZGznS8kv1kY8aO9qxzERxms=;
        b=Ftpzu2PwXJiHSE8Aw7D12Jhi4ds1TWFcUMK0+XXrI4rxjNziuEfe677iEXO8Swuy2m
         B6Jmbq/+h13oMIYDqB2FVsBi/MnLKsmxnNVcEw6kognUrFd/K9cxm9P53eLGRv/Srp8b
         +EGhf3qfwUT5xGZlzJwDNe0yP8MmkCrKmCWIQ0Rdicq54G8Awjkx4aB6F5wXr+QPVMXz
         5N/BHgFLbePnpWxtLGFq3oddPCq1yTr/o2zehrsm1l5/juUmSyCKb1wOV4UG2dZYtLTf
         D7JmO8eQ4WgyeykMfB9ncSxxk3Z1ipluBy4szB0rBPquUb0TC46yDbmPt7YFz/RSR2xP
         XS8Q==
X-Gm-Message-State: APjAAAWQJm3mPjSXiNmteKPG1bQzTDtBuQzKRJ7MnMl/mg89pavax+kd
        hXwb4hTJ/yIcTN6zRIm+1ga9hg==
X-Google-Smtp-Source: APXvYqyj67w8AuhfPdbkEgB1bCmOYwqDVq9nc73PWsbef+neE5Y0RW1nE8a6Mkhduwqz6oxuzAIgfg==
X-Received: by 2002:a2e:809a:: with SMTP id i26mr59271167ljg.108.1578331916456;
        Mon, 06 Jan 2020 09:31:56 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id s1sm23576228ljc.3.2020.01.06.09.31.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 09:31:55 -0800 (PST)
Date:   Mon, 6 Jan 2020 09:26:08 -0800
From:   Olof Johansson <olof@lixom.net>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     arm@kernel.org, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [GIT PULL] cpuidle/psci updates for v5.6
Message-ID: <20200106172608.63qhvwr5b7jsmxmg@localhost>
References: <20200102160820.3572-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200102160820.3572-1-ulf.hansson@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jan 02, 2020 at 05:08:20PM +0100, Ulf Hansson wrote:
> Hi SoC maintainers,
> 
> Here's a PR with updates for v5.6 for cpuidle/psci for ARM/ARM64.
> 
> The changes are somewhat sprinkled over a couple of different directories and
> there is also dts update for MSM8916. The main changes are in drivers/cpuidle/,
> which have been acked-by Rafael [1] and Sudeep.
> 
> If you have any further questions, please just tell.

What was the reason to bring in a dts change in this branch? Bindings should be
stable such that old DT contents still works even if drivers are updated to
support newer attributes, etc.



-Olof
