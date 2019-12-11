Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8053511A4C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 08:02:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbfLKHCW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 02:02:22 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:45870 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbfLKHCV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 02:02:21 -0500
Received: by mail-pj1-f65.google.com with SMTP id r11so8538472pjp.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 23:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=R08vSO6u5igpmjKjGC9D9Rc8bVfKHww3KSNBkb72big=;
        b=EbQPfpnXvegQePc3hEqXeNp6CZ97qUrsRtSRXq3taulR6nVc6G9mVUWISzUOH4Wla+
         oDz+BSHgoD4gSfPif3/OxzS0cGYLYNFMxS4PnLqnht4hjOR3LU3dfOl5RHbvwo5AMMPP
         jFbsJWCaAcIxNaYFAXnONMXtYIdo6Vx1uhk3zi8qAJPxBZRQV+pWRUUrGv2ZAe+b39A4
         jiPlzCt8fn3zg1a6vHQqDuJjgI2mU8GjFmpgUwMGQOM7J1ZpNypch3s+bpnJxBX/SjV2
         gIp1JkyEhHB/dZykup6Ucnd5mQOlMnf8QkEidHOaMT1nr9nks0jd/MWuNTkOhYi9iESc
         nTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=R08vSO6u5igpmjKjGC9D9Rc8bVfKHww3KSNBkb72big=;
        b=I9hT3tFxcLPRnjmjOUcSpqt4upvFtullhnQgkU+NpUxSOXFc3TxrEdRl9TCZhZ51nQ
         ATbWrlwz+aOTkAWbpDuPeQdjOzt5zuLU+0GpXXRRvRfWoM1de6JcJYLlrvuoP+hpFBFT
         inqXUaEm6OkDKDd59/ag5x+jHqRPZeAjAoE9XLxJ1h8dOlMlXrk2WIdwChrkRkGqOK6d
         etTGKZsgTv/Iz4G7yN6XCz590wToXjwdJinLxTqMwUMqyDvby2iIw+zpogwdys/KU9ti
         M6gClxgprd4cnn0CHsIZgj32rCWCNxKawi3IAG73ZvOhkHcOCwDCK3B7IzWmh3tkzugq
         WHHg==
X-Gm-Message-State: APjAAAVnkJpPiUy+8HNQcpmE0j4zwueeD5q41l32uGvwdBdudS1Q9fvl
        Id7ZXRtqaT4IIJVrL3P9kz0bCw==
X-Google-Smtp-Source: APXvYqxHIlKXfSm0XPqRQmElKLjwtt+RZCLKkIRACmHo2HN9+dAciIGlYFN98DvSZJzP54TeBK13ag==
X-Received: by 2002:a17:90a:1aa3:: with SMTP id p32mr1877886pjp.8.1576047739635;
        Tue, 10 Dec 2019 23:02:19 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e27sm1483040pfm.26.2019.12.10.23.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 23:02:19 -0800 (PST)
Date:   Tue, 10 Dec 2019 23:02:16 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 0/3] Add DT nodes for watchdog and llcc for SC7180 and
 SM8150 SoCs
Message-ID: <20191211070216.GF3143381@builder>
References: <0101016ef3391259-59ec5f0a-2ae7-45a8-881e-edc2d0bf7b26-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016ef3391259-59ec5f0a-2ae7-45a8-881e-edc2d0bf7b26-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 10 Dec 20:30 PST 2019, Sai Prakash Ranjan wrote:

> This series adds device tree node for watchdog on SC7180 and SM8150.
> It also adds a node for LLCC (Last level cache controller) on SC7180.
> 
> Patch 3 depends on the dt binding change to LLCC node name:
>  - https://patchwork.kernel.org/patch/11246055/
> 

Series applied

Thanks,
Bjorn

> Sai Prakash Ranjan (3):
>   arm64: dts: qcom: sc7180: Add APSS watchdog node
>   arm64: dts: qcom: sm8150: Add APSS watchdog node
>   arm64: dts: qcom: sc7180: Add Last level cache controller node
> 
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 13 +++++++++++++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi |  6 ++++++
>  2 files changed, 19 insertions(+)
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
