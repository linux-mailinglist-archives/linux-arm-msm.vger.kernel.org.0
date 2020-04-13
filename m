Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C87281A6568
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 12:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728779AbgDMKvc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 06:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728781AbgDMKtm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 06:49:42 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D16FC008749
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 03:42:06 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b8so4323356pfp.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 03:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TH0pnk/VsEjeKOC3kLKQXMgD8PcclZox9CcihSHYeO8=;
        b=ALTaZ7vQ3z2TO2h3fMvvjaw59xOJ+QUedKzDupvltJmlP/eokCYBVVq2qvdfbtnnoU
         kDRx0t/+bdLzv/BRgkp3LLvdMjzEBkvqUE/vbxppn156S4gQDaJbU/zDSDUt0MI/Qxtp
         E1lD1din+dmGo6GAweUClBrAXracPUhmz9Fgpp2yQezF9xkeLJPvYAk2YZwxarKJISQd
         nQBURZWHuUysrCReP1xcHpn0fgULzIt9fZmgW9BtjJ6QJGdXLrjMxddXX0ffL2Dd9Rdn
         bbI3eI7mDlqxuGFPcecGpuc0uBE69XP8V6gqV+6f51Sp5Ldz3CDvEPF1OZ1KR9/RBApP
         QzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TH0pnk/VsEjeKOC3kLKQXMgD8PcclZox9CcihSHYeO8=;
        b=fmPwLGwr4hj54+RhnSxnM+arAqMpskgIRrxTV+X1N5Zj5unAGyPT5UebKP7ssjgUxC
         iarVkfdXH7z4yoUotKxwlpGbq3bvOUuwNfZVDwDKjR8md705Y0VSBALf+GUR2ZPADqUp
         pOpZoJnddjBT4Ff32ECFdw2BNZNue20eZxYgenPmGqfrgRoSkJz9htGFL6j4j5fU2F4+
         M9yIAaDDhKSXxWlJpSR4aEqWBYZ4XSQYqdEUO/gE4gFGR1yEdDovY+ItcDd4Y2GCf39K
         u1iIev4qHgADRGUme9vBU1lfH0LKd/HmZouGV7jrqMmuZnQKJtnulF8Oytw2qugj4O9U
         xUgA==
X-Gm-Message-State: AGi0PuaFwJ0K98Y8cAhbW77hR3/+R1TOItHwFSqS/1R839Nm/Cxd5xbZ
        8anViiBgKw73ZXmxQK+Zgq5hDQ==
X-Google-Smtp-Source: APiQypJp4dRx7UGBG7jKvk1NdYEZoA5TT+7A5HupoMRC9VvFfosYqFcq7QC1HTsAlLZ7t6XoF80H6w==
X-Received: by 2002:a62:3086:: with SMTP id w128mr17316837pfw.63.1586774525783;
        Mon, 13 Apr 2020 03:42:05 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id x71sm8287035pfd.129.2020.04.13.03.42.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Apr 2020 03:42:04 -0700 (PDT)
Date:   Mon, 13 Apr 2020 16:12:03 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     sboyd@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/21] opp: Manage empty OPP tables with clk handle
Message-ID: <20200413104203.gyb7icsxbhnvjbvx@vireshk-i7>
References: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
 <1586353607-32222-2-git-send-email-rnayak@codeaurora.org>
 <20200409075724.7t3bt3oxaxoygldb@vireshk-i7>
 <78dcbda6-12d1-7a88-b1f9-a03fb0ba9b87@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78dcbda6-12d1-7a88-b1f9-a03fb0ba9b87@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13-04-20, 16:04, Rajendra Nayak wrote:
> FWIK, no one should call a _of_add_opp_table_v2 in cases where there is no OPP in DT?
> The 'empty' OPP table from what I understand will be created by dev_pm_opp_set_clkname.
> A good case to look at is the PATCH 13/21 in this series. The driver I am modifying
> is used on sdm845/sc7180 and a host of other older qualcomm SoCs. Since i am adding
> support for perf state voting using OPP only on sdm845/sc7180 I want the existing
> platforms to just do what they were doing. Now thats not possible unless I start
> adding a bunch of if/else around every opp call in the driver to distinguish between
> the two.
> 
> I am a little surprised since I though the idea of doing something like this came from
> you :) (or perhaps Stephen, I somehow can't recollect)

Me only as I start remembering it now :)

> to avoid all the if/else conditions
> I had when I initially posted some of these changes.
> Btw, you had this patch reviewed when this was posted a long while back too [1]
> 
> [1] https://patchwork.kernel.org/patch/11027217/

That's an year back, in my defence :)

But anyway, I wasn't opposed to the idea now as well. I was just making sure all
things are handled well :)

-- 
viresh
