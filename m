Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA6C5B80D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 11:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728453AbfGAJ3z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 05:29:55 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35914 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728442AbfGAJ3z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 05:29:55 -0400
Received: by mail-pl1-f194.google.com with SMTP id k8so7052267plt.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2019 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wTpybW3v/xSeIVUOgP3xPSGBMKgC2isVToS27b1nrP0=;
        b=Hrifr9KCPcs9MJqBNytC0e17vIcaOZwYLT0urhPweI/rFb5d03mJHFiFkNSM2nDw0y
         HwFr53coaLGoVhvJk6G5fbnqIJWNWEqrOzC1rRfNtC6K0+9fQW4SDItKGnb7jUCp/QDx
         vXFoWE7/6gn1siLyZyE5TjRDGfBfbzJt5G8TKNksKFzzEUkFm+3WzB27NGBcvCpJJclW
         FRa9ClkXxzYNHq/m+Ycijy1n2cMx8H+oEs9uu8r7rfBmDaYXWn+uRLgTDRgCHyuxyNTU
         6Niu+GY8uPemFkLgYmaugqnqYQl+8GVm90YmuGSw8nyg6D/HOtDoJyQx2QRVQL+n6YGG
         9KoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wTpybW3v/xSeIVUOgP3xPSGBMKgC2isVToS27b1nrP0=;
        b=gK5YFfE5+9o8Kl9SJBvPy/s2pq0EhSwifLPGUH+qcAUaDASxFGDu5/uRbA6uboCwR7
         GlwUEW2UCohr7P/KyJDaT84vsk9ZBIbnBZWvV1yncIv/9xXkxH+6U5R+cj3JPd52QXQd
         PiexXwfEvJK4PLssijx3bOJMRxgrSKYa0sHJXMZ93Z7TpbDztLoPYxOItVGxq1piz3/T
         rrxEZmBAfviJFyQ+6urq+0n5UpWIwrbNUsI3GSWgZCcTkKR7X4ZXa9+OHyuCbvh0H51F
         eF5JKKVIQfci7BTzVBo9Anmxq5eGRbuucJ2wjltKY/4SuKPXCTl8u6IOKAPGAYj1kvCF
         oSfg==
X-Gm-Message-State: APjAAAULjAkhQttRnRkq25d/wCMbLDid8C4btCBHm1PPD7pCQbYfVEYn
        LVhs5Z7Er4UjeAW+dwb0HRabI+j6aYo=
X-Google-Smtp-Source: APXvYqwSOfR6QHR0UL7PgnA+YTmHps/hUxB+aNpzGmjf2aDbrrgUmI4XIBC48UKymMy56brsDy0qmA==
X-Received: by 2002:a17:902:7247:: with SMTP id c7mr27711408pll.202.1561973394285;
        Mon, 01 Jul 2019 02:29:54 -0700 (PDT)
Received: from localhost ([122.172.21.205])
        by smtp.gmail.com with ESMTPSA id d123sm10786486pfc.144.2019.07.01.02.29.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 02:29:52 -0700 (PDT)
Date:   Mon, 1 Jul 2019 14:59:49 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     nm@ti.com, sboyd@kernel.org, georgi.djakov@linaro.org,
        agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, rjw@rjwysocki.net,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        saravanak@google.com
Subject: Re: [PATCH RFC 0/4] DDR/L3 Scaling support on SDM845 SoCs
Message-ID: <20190701092949.afenn2et2qexostt@vireshk-i7>
References: <20190627133424.4980-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190627133424.4980-1-sibis@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27-06-19, 19:04, Sibi Sankar wrote:
> This RFC series aims to extend cpu based scaling support to L3/DDR on
> SDM845 SoCs. The patch series depends on "Introduce OPP bandwidth bindings"
> series (https://patchwork.kernel.org/cover/10912993/). A part of the
> series will still be applicable if we decide to go ahead with the proposal
> from Saravana as well so I decided to post this out.
> 
> v2:
> * Incorporated Viresh's comments from:
> [1]https://lore.kernel.org/lkml/20190410102429.r6j6brm5kspmqxc3@vireshk-i7/
> [2]https://lore.kernel.org/lkml/20190410112516.gnh77jcwawvld6et@vireshk-i7/

Did you get a chance to look at this ?

lore.kernel.org/lkml/20190622003449.33707-1-saravanak@google.com

-- 
viresh
