Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39169148DDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 19:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390045AbgAXSgB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 13:36:01 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36141 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388851AbgAXSgA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 13:36:00 -0500
Received: by mail-pf1-f194.google.com with SMTP id w2so1531529pfd.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2020 10:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=es1HFNP6d6J1y5y/BvGmobJ434uBsiCpqm6vXNISPn0=;
        b=F4lzXVrgB4GLH0Wx65kAQwaCgiW6sjXdx58Iy++TzFNPCqcEeBHxdTdycsDj96gd2e
         ODtZa+0B7jHpEmmC9rOWzRAmaoYXQUaluaDLPrSYdvRt6twmx+aFANssaYFX8USJ8O1q
         jHqMICwCBm6KrxdpHgmqPb+s4+cW/AKZfN3lpVeb0aQ30fldmbIgRPxAcM8oGc8fUKtc
         5VYhs3fe9TT/lcv4a+1UHWTwPa1tgEURdpsM0Rmnp/37LMuBP4iJ0LXYwOC/8NIR7esZ
         btfiTdB81qwL5SMZ15aB0lOBuNyOw2iw/Mqg4t61s3dY3+1T7rjwpsMD0z+SuE8I0/Zo
         IKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=es1HFNP6d6J1y5y/BvGmobJ434uBsiCpqm6vXNISPn0=;
        b=eJQ70u38VUmUQvfACgKW3EVDF24hPSJbf1DLiAbfUEFs4pStYbjDFjOYwp6QwKcDNH
         M2lASSIGFbgfjHxiT2TsHkZ3evzu+qtjxpaxHX39LgpsglHsClFZpRVY7gTMNhhH2B1y
         PqeYmDSmkJBAR/5TarwAUn+pzl8Bw8sZm4YCGl/2CK1CZiiNmoAABmMnYsN69HADzp6F
         j/t5kvuTZSht5bxFt90JUfjcPZPVs/HScH+sBr2dYTN6P90IOBmelqRpo+Na9vVTudxK
         9ZRtT6n2W8hen2wlUAbgalp0S2SMg4ew7NyYXaEhiH9sqK0dUjmsczFQsMhV/fnQ6Ru8
         nb4g==
X-Gm-Message-State: APjAAAXcMlaHjj+Kps9Q91c0zcYq9gVJJufdNE8YsShXjHi+TH6mC52o
        Q5RF4fW/y5Eivf62I7a8mjv51A==
X-Google-Smtp-Source: APXvYqzMOQHT09l7caq1Rvn0weEhJy6amGhPNutUjMkBLG23pZB1sA/YLN84wwJicpAW62xfe81APA==
X-Received: by 2002:a63:5924:: with SMTP id n36mr5569946pgb.43.1579890960126;
        Fri, 24 Jan 2020 10:36:00 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b1sm7162421pjw.4.2020.01.24.10.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 10:35:59 -0800 (PST)
Date:   Fri, 24 Jan 2020 10:35:25 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, vinod.koul@linaro.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] clk: qcom: gcc: Add global clock controller driver
 for SM8250
Message-ID: <20200124183525.GW1908628@ripper>
References: <1579217994-22219-1-git-send-email-vnkgutta@codeaurora.org>
 <1579217994-22219-7-git-send-email-vnkgutta@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579217994-22219-7-git-send-email-vnkgutta@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 16 Jan 15:39 PST 2020, Venkata Narendra Kumar Gutta wrote:

> From: Taniya Das <tdas@codeaurora.org>
> 
> Add the clocks supported in global clock controller, which clock the
> peripherals like BLSPs, SDCC, USB, MDSS etc. Register all the clocks
> to the clock framework for the clients to be able to request for them.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
