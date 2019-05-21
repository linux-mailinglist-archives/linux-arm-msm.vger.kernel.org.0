Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7356C247FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 08:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfEUGWw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 02:22:52 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46705 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbfEUGWv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 02:22:51 -0400
Received: by mail-pl1-f193.google.com with SMTP id r18so7892398pls.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 23:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=y2m5dpNz16ZybgYk5tQ8GutOzZqz8vAuz2rdBiTBnjw=;
        b=l9FHorTul2Tyg2dOrb6zBPnqrZNmerYqH7eUWz8QrYYH0IhCHHLfh32l4hP3eIA/X7
         vAjYlCEuZb1wqfD9LentK6vgUI8A/1mrqJ9S052A1vrO93c315n4VxO7f9kRYZ/dwhpt
         a2aJmXtu4Ef1cIkwGn8dhSCJPXp5lNBa9khww/rmBXfha/2d2tEcDNaiPXcmM3XDnEaQ
         mx1DNLV+4klz/BgBK87ZGo3hmiGMX2Wio0auyYuss6yzMBipwqekj/2uRHVRH1p/MxLn
         /xGx4aZ9zZwmOx4XOBcEUeoMV+xdaLp+hhXsm7XNYpMPkIwBvPkWXUbq5Wi0Owu0YWlS
         uo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y2m5dpNz16ZybgYk5tQ8GutOzZqz8vAuz2rdBiTBnjw=;
        b=o19NVvT4kdw0ySzEn3tpI7MyTnm519k1Pce1h+KfoRuSpfFBwCbHlOJYvBQNe46YS2
         1OJO4LWGJhOa7rfljfKCqlDhFax+pqvgx5QF6hGPmLFll9LeSe6IFvPW/aUePORwGCRR
         LEPliUh5pwDbrmKsdGxCPT4INAM7WUYDV+6B1zVeAQlquyGmIirTBFSu3N88M8u3fKA/
         syEhS2hYEHs1nSB5ME006lV0Zch3luyhU6RTanQgte3dnCB9ASBZXvP/fkNL0FFybiKr
         S1KgtOAM+WXUgiCp8swX5HDoKXBbCknNZi4lLKUbDHtC9zu2V7b1U7TGK3YuI9zv+MsA
         adaQ==
X-Gm-Message-State: APjAAAWfYsliVVtz+PGIA9X8Ax7TsfchzPzYT8akp08XZqEOHfRfhLO4
        Ls1LXzvQM6mBFGxUTqcLNHbrZg==
X-Google-Smtp-Source: APXvYqz2YMCSRvKN2MJ+jWniKEVRU5sQ/FMpg7ookR4wjHFWBAIZ3T0Rpg+BvD1LhysbsKdoQyBKgQ==
X-Received: by 2002:a17:902:8d96:: with SMTP id v22mr5073943plo.282.1558419770837;
        Mon, 20 May 2019 23:22:50 -0700 (PDT)
Received: from localhost ([122.172.118.99])
        by smtp.gmail.com with ESMTPSA id n27sm42589245pfb.129.2019.05.20.23.22.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 23:22:50 -0700 (PDT)
Date:   Tue, 21 May 2019 11:52:48 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-scsi@vger.kernel.org, swboyd@chromium.org,
        ulf.hansson@linaro.org, dianders@chromium.org, rafael@kernel.org,
        vincent.guittot@linaro.org
Subject: Re: [RFC v2 00/11] DVFS in the OPP core
Message-ID: <20190521062248.ogjetb2rwtqekflx@vireshk-i7>
References: <20190320094918.20234-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190320094918.20234-1-rnayak@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-03-19, 15:19, Rajendra Nayak wrote:
> This is a v2 of the RFC posted earlier by Stephen Boyd [1]
> 
> As part of v2 I still follow the same approach of dev_pm_opp_set_rate()
> API using clk framework to round the frequency passed and making it
> accept 0 as a valid frequency indicating the frequency isn't required
> anymore. It just has a few more drivers converted to use this approach
> like dsi/dpu and ufs.
> ufs demonstrates the case of having to handle multiple power domains, one
> of which is scalable.
> 
> The patches are based on 5.1-rc1 and depend on some ufs fixes I posted
> earlier [2] and a DT patch to include the rpmpd header [3]
> 
> [1] https://lkml.org/lkml/2019/1/28/2086
> [2] https://lkml.org/lkml/2019/3/8/70
> [3] https://lkml.org/lkml/2019/3/20/120

Hi Rajendra,

I am inclined to apply/push this series for 5.3-rc1, will it be
possible for you to spend some time on this at priority ?

-- 
viresh
